using BLL;
using DTO;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web.Mvc;
using ValaisBooking.ViewModel;

namespace ValaisBooking.Controllers
{
    public class RoomController : Controller
    {
        [HttpPost]
        public ActionResult _SearchResults(SearchVM searchData)
        {
 
            List<ResultsVM> results = new List<ResultsVM>();

            ViewBag.NbrNight = (searchData.LastNight - searchData.FirstNight).TotalDays+1;
            ViewBag.FirstNight = searchData.FirstNight;
            ViewBag.LastNight = searchData.LastNight;

            //on génère une première liste filtrée uniquement sur les dates
            List<Room> freeRooms = RoomManager.GetAllEmptyRoomsAtDateRange(searchData.FirstNight, searchData.LastNight);
            foreach (Room r in freeRooms)
            {
                //calcul du prix de la chambre pour la durée avec majoration de 20% si occupation > 70%
                int priceForDates = 0;
                bool priceIncrease = false;

                for (DateTime day = searchData.FirstNight;day <= searchData.LastNight; day = day.AddDays(1.0)){
                    double hotelOccupationAtDate = HotelManager.GetHotelOccupationAtDateFromId(r.IdHotel, day);
                    if (hotelOccupationAtDate < 0.7)
                        priceForDates += (int)r.Price;
                    else {
                        priceForDates += (int)((double)r.Price*1.2);
                        priceIncrease = true;
                    }
                }

                //calcul du nombre de place libre par hotel
                int hotelFreePlaces = freeRooms
                    .Where(h => h.IdHotel == r.IdHotel)
                    .Select(p => p.Type)
                    .Sum();


                ResultsVM result = new ResultsVM
                {
                    Room = r,
                    Hotel = HotelManager.GetHotelFromId(r.IdHotel),
                    Pictures = PictureManager.GetPictureFromRoomId(r.IdRoom),
                    PriceForDates = priceForDates,
                    PriceIncreased = priceIncrease,
                    HotelFreePlaces = hotelFreePlaces
                };

                results.Add(result);
            }

            ViewBag.freeRoomsAtDate = results.Count();

            //filtrage des options choisies
            List<ResultsVM> toRemove = new List<ResultsVM>();
            foreach (ResultsVM r in results)
            {
                bool filtered = false;
                //filtrage de la localisation
                if (searchData.Location != "Valais")
                    if (searchData.Location != r.Hotel.Location)
                        filtered = true;

                //filtrage par le nombre de places dans l'hotel
               if(searchData.Adultes > r.HotelFreePlaces)
                    filtered = true;

                //prix
                if (r.PriceForDates > searchData.MaxNightPrice )
                    filtered = true;

                //étoiles
                if (!searchData.Star1 && r.Hotel.Category == 1)
                    filtered = true;
                if (!searchData.Star2 && r.Hotel.Category == 2)
                    filtered = true;
                if (!searchData.Star3 && r.Hotel.Category == 3)
                    filtered = true;
                if (!searchData.Star4 && r.Hotel.Category == 4)
                    filtered = true;
                if (!searchData.Star5 && r.Hotel.Category == 5)
                    filtered = true;
                //sèche-cheveu
                if (searchData.HasHairDryer && !r.Room.HasHairDryer)
                    filtered = true;
                //parking
                if (searchData.HasParking && !r.Hotel.HasParking)
                    filtered = true;
                //tv
                if (searchData.HasTV && !r.Room.HasTV)
                        filtered = true;
                

                if(filtered)
                    toRemove.Add(r);
            }

            foreach (ResultsVM r in toRemove)
                results.Remove(r);

            List<ResultsVM> orderedList = results
                .OrderBy(p => p.PriceForDates)
                .ToList();

            return PartialView(orderedList);
        }

        public ActionResult _SearchResults() {
            return RedirectToAction("Index", "Home");
        }

        public ActionResult _RoomDescription(int IdRoom)
        {
            return PartialView(RoomManager.GetRoomFromId(IdRoom));
        }
    }
}
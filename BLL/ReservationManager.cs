using BLL.Helpers;
using DTO;
using Newtonsoft.Json;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Net.Http;
using System.Text;
using System.Threading.Tasks;

namespace BLL
{
    public class ReservationManager
    {
        public static bool SaveReservation(Reservation reservation)
        {
            
            using (HttpClient httpClient = new HttpClient())
            {
                try
                {
                    //POST: api/Reservation/addUpdate/
                    string reservationData = JsonConvert.SerializeObject(reservation);
                    StringContent frame = new StringContent(reservationData, Encoding.UTF8, "Application/json");
                    Task<HttpResponseMessage> response = httpClient.PostAsync(UrlHelper.ApiReservationUrl+ "addUpdate/", frame);
                    response.Wait();
                    return !response.IsFaulted;

                }
                catch
                {
                    return false;
                }
            }
        }

        public static List<Reservation> GetReservationsFromUserId(int idUser)
        {
            using (HttpClient httpClient = new HttpClient())
            {
                try
                {
                    //GET: api/Reservation/User/{id}
                    Task<string> response = httpClient.GetStringAsync(UrlHelper.ApiReservationUrl + "User/" + idUser);
                    return JsonConvert.DeserializeObject<List<Reservation>>(response.Result);
                }
                catch
                {
                    return new List<Reservation>();
                }

            }
        }

        public static Reservation GetReservationsFromId(int idRes)
        {
            using (HttpClient httpClient = new HttpClient())
            {
               
                try
                {
                    //GET: api/Reservation/id
                    Task<string> response = httpClient.GetStringAsync(UrlHelper.ApiReservationUrl + idRes);
                    return JsonConvert.DeserializeObject<Reservation>(response.Result);
                }
                catch
                {
                    return new Reservation();
                }
            }
        }

        public static bool CancelReservationFromId(int IdReservation)
        {
            try {
                Reservation reservation = GetReservationsFromId(IdReservation);
                reservation.Cancelled = true;
                SaveReservation(reservation);
                return true;
            } catch
            {
                return false;
            }
        }

        public static double GetInstantPriceFromReservation(Reservation reservation)
        {

            double price = 0;

            foreach (int IdRoom in reservation.Rooms)
            {
                Room room = RoomManager.GetRoomFromId(IdRoom);
                for (DateTime day = reservation.FirstNight; day <= reservation.LastNight; day = day.AddDays(1.0))
                {
                    double hotelOccupationAtDate = HotelManager.GetHotelOccupationAtDateFromId(
                        room.IdHotel
                    , day);

                    if (hotelOccupationAtDate < 0.7)
                        price += (int)room.Price;
                    else
                    {
                        price += (int)((double)room.Price * 1.2);
                    }
                }
            }
            return price;
        }
    }
}

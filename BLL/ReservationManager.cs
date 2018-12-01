using BLL.Helpers;
using DAL;
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
        public static int SaveReservation(Reservation reservation)
        {
            return ReservationDB.SaveReservation(reservation);
        }

        public static List<Reservation> GetReservationsFromUserId(int idUser) {
            using (HttpClient httpClient = new HttpClient())
            {
                //GET: api/Reservation/User/{id}
                Task<string> response = httpClient.GetStringAsync(UrlHelper.ApiReservationUrl +"User/"+ idUser);
                return JsonConvert.DeserializeObject<List<Reservation>>(response.Result);
            }
        }

        public static Reservation GetReservationsFromId(int idRes) {
            using (HttpClient httpClient = new HttpClient())
            {
                //GET: api/Reservation/id
                Task<string> response = httpClient.GetStringAsync(UrlHelper.ApiReservationUrl + idRes);
                return JsonConvert.DeserializeObject<Reservation>(response.Result);
            }
        }

        public static bool CancelReservationFromId(int IdReservation)
        {
            return ReservationDB.CancelReservationFromId(IdReservation);
        }

        public static double GetInstantPriceFromReservation(Reservation reservation)
        {

            double price = 0;

            foreach (Room r in reservation.Rooms)
            {
                for (DateTime day = reservation.FirstNight; day <= reservation.LastNight; day = day.AddDays(1.0))
                {
                    double hotelOccupationAtDate = HotelManager.GetHotelOccupationAtDateFromId(
                        reservation.Rooms
                            .Select(h => h.IdHotel)
                            .FirstOrDefault()
                    , day);

                    if (hotelOccupationAtDate < 0.7)
                        price += (int)r.Price;
                    else
                    {
                        price += (int)((double)r.Price * 1.2);
                    }
                }
            }
            return price;
        }
    }
}

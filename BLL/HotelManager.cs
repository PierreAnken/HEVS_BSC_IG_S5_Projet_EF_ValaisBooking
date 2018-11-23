using DAL;
using DTO;
using System.Linq;
using System;
using System.Collections.Generic;
using System.Net.Http;
using System.Threading.Tasks;
using Newtonsoft.Json;
using BLL.Helpers;

namespace BLL
{
    public class HotelManager
    {
        public static List<Hotel> GetAllHotel()
        {
            return HotelDB.GetAllHotel();
        }

        public static Hotel GetHotelFromId(int IdHotel)
        {
                
                using (HttpClient httpClient = new HttpClient())
                {
                    Task<string> response = httpClient.GetStringAsync(UrlHelper.ApiHotelUrl+IdHotel);
                    return JsonConvert.DeserializeObject<Hotel>(response.Result);
                }
        }

        public static double GetHotelOccupationAtDateFromId(int IdHotel, DateTime Date)
        {
            return HotelDB.GetHotelOccupationAtDateFromId(IdHotel, Date);
        }
    }
}

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
            using (HttpClient httpClient = new HttpClient())
            {
                try
                {
                    Task<string> response = httpClient.GetStringAsync(UrlHelper.ApiHotelUrl);
                    return JsonConvert.DeserializeObject<List<Hotel>>(response.Result);
                }
                catch
                {
                    return new List<Hotel>();
                }
            }
        }

        public static Hotel GetHotelFromId(int IdHotel)
        {
            using (HttpClient httpClient = new HttpClient())
            {
                try
                {
                    Task<string> response = httpClient.GetStringAsync(UrlHelper.ApiHotelUrl + IdHotel);
                    return JsonConvert.DeserializeObject<Hotel>(response.Result);
                }
                catch
                {
                    return new Hotel();
                }
            }
        }

        public static double GetHotelOccupationAtDateFromId(int IdHotel, DateTime date)
        {
            using (HttpClient httpClient = new HttpClient())
            {
                ///api/Hotel/Occupation/2?date=2014-07-25
                try
                {
                    Task<string> response = httpClient.GetStringAsync(UrlHelper.ApiHotelUrl + "Occupation/" + IdHotel + "?date=" + UrlHelper.DateTimeToURLParam(date));
                    return JsonConvert.DeserializeObject<double>(response.Result);
                }
                catch
                {
                    return 0;
                }
            }
        }
    }
}

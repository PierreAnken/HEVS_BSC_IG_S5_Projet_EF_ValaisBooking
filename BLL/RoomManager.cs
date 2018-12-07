using BLL.Helpers;
using DTO;
using Newtonsoft.Json;
using System;
using System.Collections;
using System.Collections.Generic;
using System.Net.Http;
using System.Threading.Tasks;

namespace BLL
{
    public class RoomManager
    {
        public static decimal[] GetMinMaxPriceFromRooms()
        {

            using (HttpClient httpClient = new HttpClient())
            {
                //GET: api/Room/MinMax
                Task<string> response = httpClient.GetStringAsync(Helpers.UrlHelper.ApiRoomUrl + "MinMax");
                try
                {
                    ArrayList minMax = JsonConvert.DeserializeObject<ArrayList>(response.Result);
                    decimal min = decimal.Parse(minMax[0].ToString());
                    decimal max = decimal.Parse(minMax[1].ToString());

                    return new decimal[] { min, max };
                }
                catch
                {
                    return new decimal[] { 0, 0 };
                }
            }
        }

        public static List<Room> GetAllEmptyRoomsAtDateRange(DateTime firstNight, DateTime lastNight)
        {
            using (HttpClient httpClient = new HttpClient())
            {
                //GET: api/Room/Empty?firstNight=2018-11-24T00:00:00&lastNight=2018-11-24T00:00:00
                try
                {
                    Task<string> response = httpClient.GetStringAsync(UrlHelper.ApiRoomUrl + "Empty?firstNight=" + UrlHelper.DateTimeToURLParam(firstNight) + "&lastNight=" + UrlHelper.DateTimeToURLParam(lastNight));
                    return JsonConvert.DeserializeObject<List<Room>>(response.Result);
                }
                catch { return new List<Room>(); }
            }
        }


        public static Room GetRoomFromId(int IdRoom)
        {
            using (HttpClient httpClient = new HttpClient())
            {
                //GET: api/Room/id
                try
                {
                    Task<string> response = httpClient.GetStringAsync(UrlHelper.ApiRoomUrl + IdRoom);
                    return JsonConvert.DeserializeObject<Room>(response.Result);
                }
                catch {
                    return new Room();
                }
            }
        }
    }
}

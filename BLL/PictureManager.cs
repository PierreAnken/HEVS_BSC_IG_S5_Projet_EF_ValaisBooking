using BLL.Helpers;
using DTO;
using Newtonsoft.Json;
using System.Collections.Generic;
using System.Net.Http;
using System.Threading.Tasks;

namespace BLL
{
    public class PictureManager
    {
        public static List<Picture> GetPictureFromRoomId(int IdRoom)
        {
            using (HttpClient httpClient = new HttpClient())
            {
                //GET: api/Picture/id
                try
                {
                    Task<string> response = httpClient.GetStringAsync(UrlHelper.ApiPictureUrl + IdRoom);
                    return JsonConvert.DeserializeObject<List<Picture>>(response.Result);
                }
                catch
                {
                    return new List<Picture>();
                }
            }
        }
    }
}

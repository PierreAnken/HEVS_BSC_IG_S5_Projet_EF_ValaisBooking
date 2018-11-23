using BLL.Helpers;
using DAL;
using DTO;
using Newtonsoft.Json;
using System;
using System.Net.Http;
using System.Text;
using System.Threading.Tasks;

namespace BLL
{
    public class UserDataManager
    {

        public static UserData GetUserFromEmail(string Email)
        {
            if (!string.IsNullOrEmpty(Email))
            {
                using (HttpClient httpClient = new HttpClient())
                {
                    Task<string> response = httpClient.GetStringAsync(UrlHelper.ApiUserDataUrl + Email);
                    return JsonConvert.DeserializeObject<UserData>(response.Result);
                }
            }
            else
                return new UserData();
        }

        public static bool RegisterUser(UserData newUser) {

            //using (HttpClient httpClient = new HttpClient())
            //{
            //    string userData = JsonConvert.SerializeObject(newUser);
            //    StringContent frame = new StringContent(userData, Encoding.UTF8, "Application/json");
            //    Task<HttpResponseMessage> response = httpClient.PostAsync(UrlHelper.ApiUserDataUrl, frame);
            //    return response.Result.IsSuccessStatusCode;
            //}
            return true;

        }
    }
}

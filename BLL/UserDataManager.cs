﻿using BLL.Helpers;
using DTO;
using Newtonsoft.Json;
using System.Net.Http;
using System.Text;
using System.Threading.Tasks;

namespace BLL
{
    public class UserDataManager
    {

        public static UserData GetUserFromEmail(string Email)
        {

            using (HttpClient httpClient = new HttpClient())
            {
                try
                {
                    Task<string> response = httpClient.GetStringAsync(UrlHelper.ApiUserDataUrl + "?email=" + Email);
                    return JsonConvert.DeserializeObject<UserData>(response.Result);
                }
                catch
                {
                    return new UserData();
                }
            }
        }

        public static bool RegisterUser(UserData newUser)
        {
            using (HttpClient httpClient = new HttpClient())
            {
                try
                {
                    string userData = JsonConvert.SerializeObject(newUser);
                    StringContent frame = new StringContent(userData, Encoding.UTF8, "Application/json");
                    Task<HttpResponseMessage> response = httpClient.PostAsync(UrlHelper.ApiUserDataUrl, frame);
                    response.Wait();
                    return response.IsFaulted;
                    
                }
                catch
                {
                    return false;
                }
            }
        }
    }
}

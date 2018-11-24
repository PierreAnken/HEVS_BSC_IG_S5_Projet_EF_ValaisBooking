using Newtonsoft.Json;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace BLL.Helpers
{
    public class UrlHelper
    {
        public static string ApiUrl { get; } = "http://localhost:56133/api/";
        public static string ApiHotelUrl { get; } = ApiUrl + "hotel/";
        public static string ApiPictureUrl { get; } = ApiUrl + "picture/";
        public static string ApiReservationUrl { get; } = ApiUrl + "reservation/";
        public static string ApiRoomUrl { get; } = ApiUrl + "room/";
        public static string ApiUserDataUrl { get; } = ApiUrl + "userData/";

        public static string DateTimeToURLParam(DateTime dateTime) {
            return JsonConvert.SerializeObject(dateTime).Replace("\"", "").Replace("\\", "");
        }
    }
}
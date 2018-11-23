using BLL;
using System.Web.Mvc;

namespace ValaisBooking.Controllers
{
    public class HotelController : Controller
    {
        public ActionResult _HotelDescription(int hotelId)
        {
            return PartialView(HotelManager.GetHotelFromId(hotelId));
        }
    }
}
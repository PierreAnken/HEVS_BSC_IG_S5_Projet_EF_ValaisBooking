using System.Web.Mvc;

namespace ValaisBooking.Controllers
{
    public class UserDataController : Controller
    {
        //fonction permettant de vérifier si un utilisateur est identifé de manière asychrone
        public ActionResult IsConnected()
        {
            return PartialView();
        }

        public ActionResult _RefreshNavBar()
        {
            return PartialView();
        }
    }
}
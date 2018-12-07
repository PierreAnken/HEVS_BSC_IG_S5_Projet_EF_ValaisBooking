using System.Web.Mvc;
using ValaisBooking.ViewModel;


namespace ValaisBooking.Controllers
{
    public class HomeController : Controller
    {

        public ActionResult Index()
        {
            return View(new SearchVM());
        }
    }
}
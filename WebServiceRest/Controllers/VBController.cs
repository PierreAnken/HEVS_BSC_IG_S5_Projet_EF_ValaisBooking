using System.Web.Http;

namespace WebServiceRest.Controllers
{
    public class VBController : ApiController
    {
        protected static VB_WebServiceEntities1 DB { get; } = new VB_WebServiceEntities1();
    }
}

using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Web.Http;

namespace WebServiceRest.Controllers
{
    public class VBController : ApiController
    {
        protected static VB_WebServiceDB DB { get; } = new VB_WebServiceDB();

    }
}

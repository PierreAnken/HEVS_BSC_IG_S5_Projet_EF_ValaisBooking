using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Runtime.Serialization;
using System.Web.Http;
using System.Data.Entity;

namespace WebServiceRest.Controllers
{
    public class PictureController : VBController
    {
        
        //GET: api/Picture/id
        public IHttpActionResult GetPictureFromRoomId(int id)
        {
            return Ok(DB.Pictures.Where(p => p.IdRoom == id).ToList());
        }

    }
}

using System.Collections.Generic;
using System.Linq;
using System.Web.Http;

namespace WebServiceRest.Controllers
{
    public class PictureController : VBController
    {
        
        //GET: api/Picture/id
        public IHttpActionResult GetPictureFromRoomId(int id)
        {
            List<Picture> pictures = DB.Pictures.Where(p => p.IdRoom == id).ToList();
            if(pictures.Count() == 0)
            {
                return NotFound();
            }
            return Ok(DB.Pictures.Where(p => p.IdRoom == id).ToList());
        }

    }
}

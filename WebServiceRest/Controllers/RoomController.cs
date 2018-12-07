using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Runtime.Serialization;
using System.Web.Http;
using System.Data.Entity;
using System.Collections;

namespace WebServiceRest.Controllers
{
    public class RoomController : VBController
    {

        [Route("api/Room/MinMax/")]
        public IHttpActionResult GetMinMaxPriceFromRooms()
        {
            ArrayList minMax = new ArrayList
            {
                DB.Rooms.Min(r => r.Price),
                DB.Rooms.Max(r => r.Price)
            };

            return Ok(minMax);
        }

        //GET: api/Room/id
        public IHttpActionResult GetRoomFromId(int id)
        {
            Room room = (DB.Rooms.Where(r => r.IdRoom == id).FirstOrDefault();

            if(room == null)
            {
                return NotFound();
            }
            return Ok(DB.Rooms.Where(r => r.IdRoom == id).FirstOrDefault());
        }

        //GET: api/Room/Empty?firstNight=2018-11-24T00:00:00&lastNight=2018-11-24T00:00:00
        [Route("api/Room/Empty")]
        public IHttpActionResult GetAllEmptyRoomsAtDateRange([FromUri] DateTime firstNight, [FromUri] DateTime lastNight)
        {
            List<GetAllEmptyRoomsAtDateRange_Result> rooms = DB.GetAllEmptyRoomsAtDateRange(firstNight, lastNight).ToList();
            if(rooms.Count() == 0) {
                return NotFound();
            }
            return Ok(DB.GetAllEmptyRoomsAtDateRange(firstNight, lastNight));
        }
    }
}

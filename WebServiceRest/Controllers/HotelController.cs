using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Runtime.Serialization;
using System.Web.Http;

namespace WebServiceRest.Controllers
{
    public class HotelController : VBController
    {
        
        //GET: api/Hotel/5
        public IHttpActionResult Get(int id)
        {
            Hotel hotel = DB.Hotels.Where(h => h.IdHotel == id).FirstOrDefault();
            if(hotel == null)
            {
                return NotFound();
            }
            return Ok(hotel);
        }

        //GET: api/Hotel/
        public IHttpActionResult GetAllHotel()
        {
            return Ok(DB.Hotels.ToList());
        }

        //GET: api/Hotel/5?date=01-01-2018
        //public IHttpActionResult GetHotelOccupationAtDateFromId(int id, DateTime date)
        //{

         

        //    //get rooms reserved at date
        //    int roomsReservedQty = DB.Reservations.Where(r => r.)
                

        //    int roomsQty = DB.Rooms
        //        .Where(r => r.IdHotel == id)
        //        .Count();

            
        //}

    }
}

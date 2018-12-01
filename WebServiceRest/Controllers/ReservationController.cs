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
    public class ReservationController : VBController
    {
        
        //GET: api/Reservation/1
        public IHttpActionResult Get(int id)
        {
            Reservation reservation = DB.Reservations.Where(h => h.IdReservation == id).FirstOrDefault();
            if(reservation == null)
            {
                return NotFound();
            }
            return Ok(reservation);
        }

        //GET: api/Reservation/User/{id}
        [Route("api/Reservation/User/{id}")]
        public IHttpActionResult GetReservationsFromUserId(int id)
        {
            List<Reservation> reservations = DB.Reservations.Join(DB.RoomsInReservations,
                                                post => post.IdReservation, // Primary Key
                                                meta => meat.postId, // Foreign Key
                                                (post, meta) => new { Post = post, Meta = meta });
        }
}

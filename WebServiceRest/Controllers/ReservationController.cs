using System.Collections.Generic;
using System.Linq;
using System.Web.Http;

namespace WebServiceRest.Controllers
{
    public class ReservationController : VBController
    {

        //GET: api/Reservation/1
        public IHttpActionResult Get(int id)
        {
            Reservation reservation = DB.Reservations.Where(h => h.IdReservation == id).FirstOrDefault();
            if (reservation == null)
            {
                return NotFound();
            }

            reservation = FillRooms(reservation);

            return Ok(reservation);
        }

        //POST: api/Reservation/
        [Route("api/Reservation/")]
        public IHttpActionResult PostReservation(Reservation reservation)
        {
            try
            {
                Reservation dbReservation = DB.Reservations.Find(reservation.IdReservation);
                if (dbReservation == null)
                {
                    DB.Reservations.Add(reservation);
                    DB.SaveChanges();
                    return Ok(DB.Reservations.LastOrDefault().IdReservation);
                }
                else
                {
                    dbReservation = reservation;
                    DB.SaveChanges();
                    return Ok(reservation.IdReservation);
                }
            }
            catch
            {
                return BadRequest();
            }
        }

        //GET: api/Reservation/User/{id}
        [Route("api/Reservation/User/{id}")]
        public IHttpActionResult GetReservationsFromUserId(int id)
        {
            List<Reservation> reservations = DB.Reservations.Where(res => res.IdUser == id).ToList();

            if (reservations.Count() == 0)
            {
                return NotFound();
            }

            reservations.ForEach(res =>
            {
                res = FillRooms(res);
            });

            return Ok(reservations);
        }
        public Reservation FillRooms(Reservation reservation)
        {
            List<Room> rooms = new List<Room>();
            DB.RoomsInReservations.Where(rir => rir.IdReservation == reservation.IdReservation).ToList().ForEach(rir =>
            {
                Room room = DB.Rooms.Where(r => r.IdRoom == rir.IdRoom).FirstOrDefault();
                if (room != null)
                {
                    rooms.Add(room);
                }

            });
            reservation.Rooms = rooms;

            return reservation;
        }

    }
}

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

        //POST: api/Reservation/addUpdate/
        [HttpPost]
        [Route("api/Reservation/addUpdate/")]
        public IHttpActionResult PostReservation(Reservation reservation)
        {
            try
            {
                Reservation dbReservation = DB.Reservations.Find(reservation.IdReservation);
                if (dbReservation == null)
                {
                    DB.Reservations.Add(reservation);
                    DB.SaveChanges();

                    reservation.IdReservation = DB.Reservations.Max(r => r.IdReservation);

                    //save the rooms
                    reservation.Rooms.ForEach(r => {
                        DB.RoomsInReservations.Add(new RoomsInReservation { IdRoom = r, IdReservation = reservation.IdReservation });
                    });

                    DB.SaveChanges();
                    
                    return Ok(reservation.IdReservation);
                }
                else
                {
                    //update reservation
                    dbReservation.Rooms = new List<int>(reservation.Rooms);
                    dbReservation.FirstNight = reservation.FirstNight;
                    dbReservation.LastNight = reservation.LastNight;
                    dbReservation.Price = reservation.Price;
                    dbReservation.IdUser = reservation.IdUser;
                    dbReservation.Cancelled = reservation.Cancelled;

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
            List<int> rooms = new List<int>();
            DB.RoomsInReservations.Where(rir => rir.IdReservation == reservation.IdReservation).ToList().ForEach(rir =>
            {
                Room room = DB.Rooms.Where(r => r.IdRoom == rir.IdRoom).FirstOrDefault();
                if (room != null)
                {
                    rooms.Add(room.IdRoom);
                }
            });
            reservation.Rooms = rooms;

            return reservation;
        }

    }
}

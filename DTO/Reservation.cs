using System;
using System.Collections.Generic;

namespace DTO
{
    public class Reservation
    {
        public int IdReservation { get; set; }
        public int IdUser { get; set; }
        public DateTime FirstNight { get; set; }
        public DateTime LastNight { get; set; }
        public List<Room> Rooms { get; set; }

        public bool Cancelled { get; set; }
        public double Price { get; set; }
    }
}

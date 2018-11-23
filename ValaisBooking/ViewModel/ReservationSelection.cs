using System;
using System.Collections.Generic;

namespace ValaisBooking.ViewModel
{
    public class ReservationSelection
    {
        public List<int> RoomsId { get; set; }
        public DateTime FirstNight { get; set; }
        public DateTime LastNight { get; set; }
    }
}
using DTO;
using System.Collections.Generic;

namespace ValaisBooking.ViewModel
{

    public class ResultsVM
    {
        public Room Room { get; set; }
        public Hotel Hotel { get; set; }
        public List<Picture> Pictures { get; set; }
        public int PriceForDates { get; set; }
        public bool PriceIncreased { get; set; }

        public int HotelFreePlaces { get; set; }
    }
}
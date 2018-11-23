using DAL;
using DTO;
using System.Linq;
using System;
using System.Collections.Generic;

namespace BLL
{
    public class HotelManager
    {
        public static List<Hotel> GetAllHotel()
        {
            return HotelDB.GetAllHotel();
        }

        public static Hotel GetHotelFromId(int IdHotel)
        {
            return HotelDB.GetHotelFromId(IdHotel);
        }

        public static double GetHotelOccupationAtDateFromId(int IdHotel, DateTime Date)
        {
            return HotelDB.GetHotelOccupationAtDateFromId(IdHotel, Date);
        }
    }
}

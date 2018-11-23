using DAL;
using DTO;
using System;
using System.Collections.Generic;

namespace BLL
{
    public class RoomManager
    {
        public static decimal[] GetMinMaxPriceFromRooms() {
            return RoomDB.GetMinMaxPriceFromRooms();
        }

        public static List<Room> GetAllEmptyRoomsAtDateRange(DateTime firstNight, DateTime lastNight)
        {
            return RoomDB.GetAllEmptyRoomsAtDateRange(firstNight, lastNight);
        }

        public static List<Room> GetRoomsFromHotel(int IdHotel)
        {
            return RoomDB.GetRoomsFromHotel(IdHotel);
        }

        public static Room GetRoomFromId(int IdRoom)
        {
            return RoomDB.GetRoomFromId(IdRoom);
        }
    }
}

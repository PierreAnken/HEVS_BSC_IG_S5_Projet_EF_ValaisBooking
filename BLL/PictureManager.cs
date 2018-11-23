using DAL;
using DTO;
using System.Collections.Generic;

namespace BLL
{
    public class PictureManager
    {  
        public static List<Picture> GetPictureFromRoomId(int IdRoom) {
            return PictureDB.GetPictureFromRoomId(IdRoom);
        }
    }
}

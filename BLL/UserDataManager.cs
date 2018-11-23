using DAL;
using DTO;

namespace BLL
{
    public class UserDataManager
    {
        public static UserData GetUserFromEmail(string Email)
        {
            return UserDataDB.GetUserFromEmail(Email);
        }

        public static void RegisterUser(UserData newUser) {
           UserDataDB.RegisterUser(newUser);
        }
    }
}

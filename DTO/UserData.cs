namespace DTO
{
    public class UserData
    {
        public int IdUser { get; set; }
        public string FirstName { get; set; }
        public string LastName { get; set; }
        public string PasswordMd5 { get; set; }
        public string Email { get; set; }


        public bool IsEmpty
        {
            get
            {
                return Email == null &&
                    FirstName == null &&
                    IdUser == 0 &&
                    LastName == null &&
                    PasswordMd5 == null;
           }
        }
    }
}

using System.Text;
using System.Security.Cryptography;

namespace BLL
{
    public class Toolbox
    {
        public static string GetMD5(string input)
        {
            //Source : https://msdn.microsoft.com/fr-fr/library/system.security.cryptography.md5(v=vs.110).aspx

            MD5 md5Hash = MD5.Create();
            byte[] data = md5Hash.ComputeHash(Encoding.UTF8.GetBytes(input));

            // Create a new Stringbuilder to collect the bytes
            // and create a string.
            StringBuilder sBuilder = new StringBuilder();

            // Loop through each byte of the hashed data 
            // and format each one as a hexadecimal string.
            for (int i = 0; i < data.Length; i++)
            {
                sBuilder.Append(data[i].ToString("x2"));
            }

            // Return the hexadecimal string.
            return sBuilder.ToString();

        }
    }
}

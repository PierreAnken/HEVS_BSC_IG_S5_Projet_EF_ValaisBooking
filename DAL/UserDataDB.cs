using DTO;
using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;

namespace DAL
{
    public class UserDataDB
    {
        public static UserData GetUserFromEmail(string Email)
        {
            UserData user = new UserData();
            ConnectionStringSettings settings = ConfigurationManager.ConnectionStrings["ValaisBookingDBAccess"];
            string connectionString = settings.ConnectionString;

            try
            {
                using (SqlConnection cn = new SqlConnection(connectionString))
                {
                    string query = "Select top 1 * from UserData where Email = @Email";
                    SqlCommand cmd = new SqlCommand(query, cn);
                    cmd.Parameters.AddWithValue("@Email", Email);
                    cn.Open();

                    using (SqlDataReader dr = cmd.ExecuteReader())
                    {
                        if (dr.Read())
                        {
                            user = new UserData
                            {
                                IdUser = (int)dr["IdUser"],
                                FirstName = (string)dr["FirstName"],
                                LastName = (string)dr["LastName"],
                                PasswordMd5 = (string)dr["PasswordMd5"],
                                Email = (string)dr["Email"]
                            };
                        }
                    }
                }
                return user;
            }
            catch (Exception e)
            {
                throw e;
            }
        }

        public static void RegisterUser(UserData newUser)
        {
            ConnectionStringSettings settings = ConfigurationManager.ConnectionStrings["ValaisBookingDBAccess"];
            string connectionString = settings.ConnectionString;

            try
            {
                using (SqlConnection cn = new SqlConnection(connectionString))
                {
                    string query = "INSERT INTO UserData(FirstName, LastName, PasswordMd5, Email) VALUES(@FirstName, @LastName, @PasswordMd5, @Email)";
                    SqlCommand cmd = new SqlCommand(query, cn);

                    cmd.Parameters.AddWithValue("@Email", newUser.Email);
                    cmd.Parameters.AddWithValue("@FirstName", newUser.FirstName);
                    cmd.Parameters.AddWithValue("@LastName", newUser.LastName);
                    cmd.Parameters.AddWithValue("@PasswordMd5", newUser.PasswordMd5);
                    cn.Open();
                    cmd.ExecuteNonQuery();
                    cn.Close();
                }
            }
            catch (Exception e)
            {
                throw e;
            }
        }
    }
}

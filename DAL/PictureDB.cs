using System;
using System.Collections.Generic;
using DTO;
using System.Configuration;
using System.Data.SqlClient;
using System.IO;
using System.Reflection;

namespace DAL
{
    public class PictureDB
    {
        public static List <Picture> GetPictureFromRoomId(int IdRoom)
        {

            List <Picture> pictures = new List<Picture>();

            ConnectionStringSettings settings = ConfigurationManager.ConnectionStrings["ValaisBookingDBAccess"];
            string connectionString = settings.ConnectionString;

            try
            {
                using (SqlConnection cn = new SqlConnection(connectionString))
                {
                    string query = "Select * from Picture where IdRoom = @IdRoom";
                    SqlCommand cmd = new SqlCommand(query, cn);
                    cmd.Parameters.AddWithValue("@IdRoom", IdRoom);
                    cn.Open();

                    using (SqlDataReader dr = cmd.ExecuteReader())
                    {

                        while (dr.Read())
                        {
                            Picture picture = new Picture
                            {
                                IdPicture = (int)dr["IdPicture"],
                                Url = (string)dr["Url"],
                                IdRoom = (int)dr["IdRoom"]                               
                            };

                            pictures.Add(picture);
                        }

                    }
                }
                return pictures;
            }
            catch (Exception e)
            {
                throw e;
            }

        }
     }
}

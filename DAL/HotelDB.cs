using DTO;
using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.IO;
using System.Reflection;

namespace DAL
{
    public class HotelDB
    {

        public static double GetHotelOccupationAtDateFromId(int IdHotel, DateTime Date) {

            string connectionString = ConfigurationManager.ConnectionStrings["ValaisBookingDBAccess"].ConnectionString;

            try
            {
                using (SqlConnection cn = new SqlConnection(connectionString))
                using (Stream stream = Assembly.GetExecutingAssembly().GetManifestResourceStream("DAL.SQL.GetHotelOccupationAtDateFromId.sql"))
                using (StreamReader reader = new StreamReader(stream))
                {
                    string query = reader.ReadToEnd();

                    SqlCommand cmd = new SqlCommand(query, cn);
                    cmd.Parameters.AddWithValue("@IdHotel", IdHotel);
                    cmd.Parameters.AddWithValue("@Date", Date);
                    cn.Open();
                    return (double)cmd.ExecuteScalar();
                }
            }
            catch (Exception e)
            {
                throw e;
            }
        }

        public static Hotel GetHotelFromId(int IdHotel)
        {

            Hotel hotel = new Hotel();
            ConnectionStringSettings settings = ConfigurationManager.ConnectionStrings["ValaisBookingDBAccess"];
            string connectionString = settings.ConnectionString;

            try
            {
                using (SqlConnection cn = new SqlConnection(connectionString))
                {
                    string query = "Select * from Hotel where IdHotel = @IdHotel";
                    SqlCommand cmd = new SqlCommand(query, cn);
                    cmd.Parameters.AddWithValue("@IdHotel", IdHotel);
                    cn.Open();

                    using (SqlDataReader dr = cmd.ExecuteReader())
                    {

                        if (dr.Read())
                        {
                            hotel = new Hotel
                            {
                                IdHotel = (int)dr["IdHotel"],
                                Name = (string)dr["Name"],
                                Description = (string)dr["Description"],
                                Location = (string)dr["Location"],
                                Category = (int)dr["Category"],
                                HasWifi = (bool)dr["HasWifi"],
                                HasParking = (bool)dr["HasParking"],
                                Phone = (string)dr["Phone"],
                                Email = (string)dr["Email"],
                                Website = (string)dr["Website"],
                                Overview = (string)dr["Overview"]
                            };
                        }
                    }
                }
                return hotel;
            }
            catch (Exception e)
            {
                throw e;
            }

        }

        public static List<Hotel> GetAllHotel()
        {
            List<Hotel> hotels = new List<Hotel>();

            ConnectionStringSettings settings = ConfigurationManager.ConnectionStrings["ValaisBookingDBAccess"];
            string connectionString = settings.ConnectionString;

            try
            {
                using (SqlConnection cn = new SqlConnection(connectionString))
                {
                    string query = "Select * from Hotel";
                    SqlCommand cmd = new SqlCommand(query, cn);
                    cn.Open();


                    using (SqlDataReader dr = cmd.ExecuteReader())
                    {

                        while (dr.Read())
                        {
                            Hotel hotel = new Hotel
                            {
                                IdHotel = (int)dr["IdHotel"],
                                Name = (string)dr["Name"],
                                Description = (string)dr["Description"],
                                Location = (string)dr["Location"],
                                Category = (int)dr["Category"],
                                HasWifi = (bool)dr["HasWifi"],
                                HasParking = (bool)dr["HasParking"],
                                Phone = (string)dr["Phone"],
                                Email = (string)dr["Email"],
                                Website = (string)dr["Website"]
                            };

                            hotels.Add(hotel);

                        }
                    }
                }
            }
            catch (Exception e)
            {
                throw e;
            }

            return hotels;
        }
    }
}

using DTO;
using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.IO;
using System.Reflection;


namespace DAL
{
    public class RoomDB
    {
        public static List<Room> GetAllEmptyRoomsAtDateRange(DateTime firstNight, DateTime lastNight)
        {
            List<Room> rooms = new List<Room>();
            string connectionString = ConfigurationManager.ConnectionStrings["ValaisBookingDBAccess"].ConnectionString;

            try
            {
                using (SqlConnection cn = new SqlConnection(connectionString))
                using (Stream stream = Assembly.GetExecutingAssembly().GetManifestResourceStream("DAL.SQL.GetAllEmptyRoomsAtDateRange.sql"))
                using (StreamReader reader = new StreamReader(stream))
                {
                    string query = reader.ReadToEnd();

                    SqlCommand cmd = new SqlCommand(query, cn);
                    cmd.Parameters.AddWithValue("@firstNight", firstNight);
                    cmd.Parameters.AddWithValue("@LastNight", lastNight);
                    cn.Open();

                    using (SqlDataReader dr = cmd.ExecuteReader())
                    {
                        while (dr.Read())
                        {
                            Room room = new Room
                            {
                                IdRoom = (int)dr["IdRoom"],
                                Number = (int)dr["Number"],
                                Description = (string)dr["Description"],
                                Type = (int)dr["Type"],
                                Price = (decimal)dr["Price"],
                                HasTV = (bool)dr["HasTV"],
                                HasHairDryer = (bool)dr["HasHairDryer"],
                                IdHotel = (int)dr["IdHotel"]
                            };
                            rooms.Add(room);
                        }
                    }
                }
            }
            catch (Exception e)
            {
                throw e;
            }

            return rooms;
        }

        public static decimal[] GetMinMaxPriceFromRooms()
        {

            decimal[] minMax = new decimal[2];

            ConnectionStringSettings settings = ConfigurationManager.ConnectionStrings["ValaisBookingDBAccess"];
            string connectionString = settings.ConnectionString;

            try
            {
                using (SqlConnection cn = new SqlConnection(connectionString))
                {
                    cn.Open();

                    string query = "Select min(Price) from Room";
                    SqlCommand cmd = new SqlCommand(query, cn);

                    minMax.SetValue((decimal)cmd.ExecuteScalar(), 0);
  

                    query = "Select max(Price) from Room";
                    cmd = new SqlCommand(query, cn);
                    minMax.SetValue((decimal)cmd.ExecuteScalar(), 1);
                }
                return minMax;
            }
            catch (Exception e)
            {
                throw e;
            }
        }

        public static List<Room> GetRoomsFromHotel(int IdHotel)
        {
            List<Room> rooms = new List<Room>();
            string connectionString = ConfigurationManager.ConnectionStrings["ValaisBookingDBAccess"].ConnectionString;

            try
            {
                using (SqlConnection cn = new SqlConnection(connectionString))
                {
                    string query = "Select * from Room where IdHotel = @IdHotel";
                    SqlCommand cmd = new SqlCommand(query, cn);
                    cmd.Parameters.AddWithValue("@IdHotel", IdHotel);
                    cn.Open();

                    using (SqlDataReader dr = cmd.ExecuteReader())
                    {
                        while (dr.Read())
                        {
                            Room room = new Room
                            {
                                IdRoom = (int)dr["IdRoom"],
                                Number = (int)dr["Number"],
                                Description = (string)dr["Description"],
                                Type = (int)dr["Type"],
                                Price = (decimal)dr["Price"],
                                HasTV = (bool)dr["HasTV"],
                                HasHairDryer = (bool)dr["HasHairDryer"],
                                IdHotel = (int)dr["IdHotel"]
                            };
                            rooms.Add(room);
                        }
                    }
                }
            }
            catch (Exception e)
            {
                throw e;
            }

            return rooms;
        }

        public static Room GetRoomFromId(int IdRoom) {

            Room room = new Room();

            ConnectionStringSettings settings = ConfigurationManager.ConnectionStrings["ValaisBookingDBAccess"];
            string connectionString = settings.ConnectionString;

            try
            {
                using (SqlConnection cn = new SqlConnection(connectionString))
                {
                    string query = "Select * from Room where IdRoom = @IdRoom";
                    SqlCommand cmd = new SqlCommand(query, cn);
                    cmd.Parameters.AddWithValue("@IdRoom", IdRoom);
                    cn.Open();

                    using (SqlDataReader dr = cmd.ExecuteReader())
                    {
                        if (dr.Read())
                        {
                            room = new Room
                            {
                                IdRoom = (int)dr["IdRoom"],
                                Number = (int)dr["Number"],
                                Description = (string)dr["Description"],
                                Type = (int)dr["Type"],
                                Price = (decimal)dr["Price"],
                                HasTV = (bool)dr["HasTV"],
                                HasHairDryer = (bool)dr["HasHairDryer"],
                                IdHotel = (int)dr["IdHotel"]
                            };
                        }
                    }
                }
                return room;
            }
            catch (Exception e)
            {
                throw e;
            }
        }

        public static List<Room> GetRoomsFromReservationId(int IdReservation)
        {
            List<Room> rooms = new List<Room>();
            string connectionString = ConfigurationManager.ConnectionStrings["ValaisBookingDBAccess"].ConnectionString;

            try
            {
                using (SqlConnection cn = new SqlConnection(connectionString))
                {
                    string query = "Select IdRoom from RoomsInReservation where IdReservation = @IdReservation";
                    SqlCommand cmd = new SqlCommand(query, cn);
                    cmd.Parameters.AddWithValue("@IdReservation", IdReservation);
                    cn.Open();

                    using (SqlDataReader dr = cmd.ExecuteReader())
                    {
                        while (dr.Read())
                        {
                            rooms.Add(GetRoomFromId((int)dr["IdRoom"]));
                        }
                    }
                }
            }
            catch (Exception e)
            {
                throw e;
            }

            return rooms;
        }
    }
}

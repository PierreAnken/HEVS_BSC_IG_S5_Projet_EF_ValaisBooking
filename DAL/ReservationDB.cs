using DTO;
using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;

namespace DAL
{
    public class ReservationDB
    {
        public static int SaveReservation(Reservation reservation)
        {
            if(reservation.Rooms.Count == 0)
                throw new ArgumentException("Reservation has no rooms", "reservation.Rooms");

            ConnectionStringSettings settings = ConfigurationManager.ConnectionStrings["ValaisBookingDBAccess"];
            string connectionString = settings.ConnectionString;

            try
            {
                using (SqlConnection cn = new SqlConnection(connectionString))
                {
                    //En premier en enregistre la réservation
                    string insertReservation = "INSERT INTO Reservation(IdUser, FirstNight, LastNight, Price) VALUES(@IdUser, @FirstNight, @LastNight, @Price)";
                    SqlCommand cmd = new SqlCommand(insertReservation, cn);

                    cmd.Parameters.AddWithValue("@IdUser", reservation.IdUser);
                    cmd.Parameters.AddWithValue("@FirstNight", reservation.FirstNight);
                    cmd.Parameters.AddWithValue("@LastNight", reservation.LastNight);
                    cmd.Parameters.AddWithValue("@Price", reservation.Price);
                    cn.Open();
                    cmd.ExecuteNonQuery();

                    //on récupère l'id de notre réservation
                    cmd.CommandText = "SELECT @@IDENTITY";
                    Int32 reservationId = Convert.ToInt32(cmd.ExecuteScalar());

                    //on insert les différentes chambres de la réservation
                    foreach(Room room in reservation.Rooms)
                    {
                        cmd.CommandText = "INSERT INTO RoomsInReservation(IdRoom, IdReservation) VALUES(@IdRoom, @IdReservation);";
                        cmd.Parameters.AddWithValue("@IdRoom", room.IdRoom);
                        cmd.Parameters.AddWithValue("@IdReservation", reservationId);
                        cmd.ExecuteNonQuery();
                        cmd.Parameters.Clear();
                    }
                    cn.Close();
                    return reservationId;
                }
            }
            catch (Exception e)
            {
                throw e;
            }
        }

        public static bool CancelReservationFromId(int IdReservation)
        {
           
            ConnectionStringSettings settings = ConfigurationManager.ConnectionStrings["ValaisBookingDBAccess"];
            string connectionString = settings.ConnectionString;

            try
            {
                using (SqlConnection cn = new SqlConnection(connectionString))
                {
                    //En premier en enregistre la réservation
                    string cancelReservation = "Update Reservation SET Cancelled = 1 WHERE IdReservation = @IdReservation";
                    SqlCommand cmd = new SqlCommand(cancelReservation, cn);

                    cmd.Parameters.AddWithValue("@IdReservation", IdReservation);
                    cn.Open();
                    cmd.ExecuteNonQuery();
                    cn.Close();
                    return true;
                }
            }
            catch
            {
                return false;
            }
        }

        public static List<Reservation> GetReservationsFromUserId(int idUser)
        {

            List<Reservation> reservations = new List<Reservation>();

            ConnectionStringSettings settings = ConfigurationManager.ConnectionStrings["ValaisBookingDBAccess"];
            string connectionString = settings.ConnectionString;

            try
            {

                using (SqlConnection cn = new SqlConnection(connectionString))
                {
                   
                    string query = "Select * from Reservation where IdUser = @IdUser order by LastNight desc";
                    SqlCommand cmd = new SqlCommand(query, cn);
                    cmd.Parameters.AddWithValue("@IdUser", idUser);
                    cn.Open();

                    using (SqlDataReader dr = cmd.ExecuteReader())
                    {
                        while (dr.Read())
                        {
                            int idReservation = (int)dr["IdReservation"];

                            Reservation reservation = new Reservation
                            {
                                IdReservation = idReservation,
                                FirstNight = (DateTime)dr["FirstNight"],
                                LastNight = (DateTime)dr["LastNight"],
                                Cancelled = (bool)dr["Cancelled"],
                                Price = (double)dr["Price"],
                                Rooms = RoomDB.GetRoomsFromReservationId(idReservation)
                            };
                            reservations.Add(reservation);
                        }
                    }

                }
                return reservations;
            }
            catch (Exception e)
            {
                throw e;
            }

        }


        public static Reservation GetReservationsFromId(int idRes)
        {

            List<Reservation> reservations = new List<Reservation>();

            ConnectionStringSettings settings = ConfigurationManager.ConnectionStrings["ValaisBookingDBAccess"];
            string connectionString = settings.ConnectionString;

            try
            {
                Reservation reservation = new Reservation();
                using (SqlConnection cn = new SqlConnection(connectionString))
                {
                    string query = "Select * from Reservation where IdReservation = @Idreservation";
                    SqlCommand cmd = new SqlCommand(query, cn);
                    cmd.Parameters.AddWithValue("@IdReservation", idRes);
                    cn.Open();

                    using (SqlDataReader dr = cmd.ExecuteReader())
                    {
                        if (dr.Read())
                        {
                            int idReservation = (int)dr["IdReservation"];

                            reservation = new Reservation
                            {
                                IdReservation = idReservation,
                                FirstNight = (DateTime)dr["FirstNight"],
                                LastNight = (DateTime)dr["LastNight"],
                                Cancelled = (bool)dr["Cancelled"],
                                Price = (double)dr["Price"],
                                Rooms = RoomDB.GetRoomsFromReservationId(idReservation)
                            };
                            reservations.Add(reservation);
                        }
                    }
                }
                return reservation;
            }
            catch (Exception e)
            {
                throw e;
            }

        }
    }
}

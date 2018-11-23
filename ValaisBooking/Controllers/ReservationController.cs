using BLL;
using DTO;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web.Mvc;
using ValaisBooking.ViewModel;

namespace ValaisBooking.Controllers
{
    public class ReservationController : Controller
    {


        [HttpPost]
        public ActionResult CreateReservation(ReservationSelection resSelection)
        {
            if (User.Identity.IsAuthenticated) {

                //on vérifie la cohérence des dates + présence de chambres
                if (resSelection.FirstNight.Date > resSelection.LastNight.Date 
                    || resSelection.RoomsId.Count == 0
                    || resSelection.FirstNight.Date < DateTime.Now.Date
                    ) { 
                    TempData["error"] = "Incohérence détectée dans les données";
                    return RedirectToAction("_ReservationFailed");
                }

                List<Room> selectedRoom = new List<Room>();

                //on vérifie si les chambres sont toujours libre
                List<Room> emptyRooms = RoomManager.GetAllEmptyRoomsAtDateRange(resSelection.FirstNight, resSelection.LastNight);
                foreach(int selRoomId in resSelection.RoomsId) {
                    bool isFree = emptyRooms
                          .Where(r => r.IdRoom == selRoomId)
                          .Count() > 0;
                    if (!isFree) {
                        TempData["error"] = "Une des chambres choisies n'est plus disponible.";
                        return RedirectToAction("_ReservationFailed");
                    }

                    //on peuple déjà la liste des chambres choisies pour la future insertion
                    selectedRoom.Add(
                        emptyRooms
                          .Where(r => r.IdRoom == selRoomId)
                          .ToList()
                          .FirstOrDefault()
                    );
                }

                
                Reservation reservation = new Reservation {
                    FirstNight = resSelection.FirstNight,
                    LastNight = resSelection.LastNight,
                    IdUser = ((UserData)Session["UserData"]).IdUser,
                    Rooms = selectedRoom
                };

                //on re-calcule le prix actuel, hack javascript...
                reservation.Price = ReservationManager.GetInstantPriceFromReservation(reservation);

                //insertion de la réservation dans la base et récupération de l'id
                reservation.IdReservation = ReservationManager.SaveReservation(reservation);

                TempData["reservation"] = reservation;
                return Redirect("/Reservation/_ConfirmedReservation");
            }
            else
                return RedirectToAction("_Login", "ModalLogin");
        }

        [HttpGet]
        public ActionResult _ConfirmedReservation()
        {
            if (TempData["reservation"] == null)
                RedirectToAction("Index", "Home");
            return PartialView(TempData["reservation"]);
        }

        [HttpGet]
        public ActionResult _ReservationFailed(string errorMessage) {
            if(errorMessage == null)
                RedirectToAction("Index","Home");
            return PartialView(TempData["error"]);
        }

        [Authorize]
        public ActionResult UserReservationOverview()
        {
            int IdUser = ((UserData)Session["UserData"]).IdUser;
            return View(ReservationManager.GetReservationsFromUserId(IdUser)
                        .OrderByDescending(r => r.FirstNight)
                        .ToList()
                );
        }

        [Authorize]
        [HttpPost]
        public ActionResult _CancelReservation(int reservationId = 0)
        {
            //vérification hack javascript...
            Reservation reservation = ReservationManager.GetReservationsFromId(reservationId);
            if (reservation.Cancelled
                || reservation.FirstNight.Date <= DateTime.Now.Date
                || reservation.IdReservation == 0
            )
            RedirectToAction("_CancelFailed", "Reservation");

            return PartialView(reservation);
        }

        [Authorize]
        [HttpPost]
        public ActionResult _CancelConfirmed(int reservationId)
        {
            //vérification hack javascript...
            Reservation reservation = ReservationManager.GetReservationsFromId(reservationId);
            if (reservation.Cancelled
                || reservation.FirstNight.Date <= DateTime.Now.Date
                || reservation.IdReservation == 0
                || ReservationManager.CancelReservationFromId(reservationId)
            )
            RedirectToAction("_CancelFailed", "Reservation");

            return PartialView();
        }

    }
}
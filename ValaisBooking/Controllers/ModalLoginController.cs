using BLL;
using DTO;
using System;
using System.Configuration;
using System.Web.Mvc;
using System.Web.Security;
using ValaisBooking.ViewModel;

namespace ValaisBooking.Controllers
{
    public class ModalLoginController : Controller
    {
        [HttpGet]
        public ActionResult _Login()
        {
            return PartialView();
        }

        [HttpGet]
        public ActionResult _Register()
        {
            return PartialView();
        }

        [HttpPost]
        public ActionResult _Login(ConnexionVM userCredentials)
        {
            if (ModelState.IsValid)
            {
                ConnectionStringSettings settings = ConfigurationManager.ConnectionStrings["ValaisBookingDBAccess"];
                string connectionString = settings.ConnectionString;

                UserData user = UserDataManager.GetUserFromEmail(userCredentials.Email);

                if (user != null)
                    if (user.PasswordMd5 == Toolbox.GetMD5(userCredentials.Password))
                    {
                        Session["userData"] = user;

                        if (userCredentials.SaveCookie)
                            FormsAuthentication.SetAuthCookie(user.Email, true);
                        else
                            FormsAuthentication.SetAuthCookie(user.Email, false);
                        
                        return PartialView(userCredentials);

                    }
                    else
                        ModelState.AddModelError(String.Empty, "Données de connexion invalides");

            }
            return PartialView(userCredentials);
        }

        [HttpPost]
        public ActionResult _Register(RegisterVM userCredentials)
        {
            if (ModelState.IsValid)
            {
                ConnectionStringSettings settings = ConfigurationManager.ConnectionStrings["ValaisBookingDBAccess"];
                string connectionString = settings.ConnectionString;

                UserData user = UserDataManager.GetUserFromEmail(userCredentials.Email);

                if (user.IdUser == 0)
                {
                    UserData newUser = new UserData
                    {
                        FirstName = userCredentials.Firstname,
                        LastName = userCredentials.LastName,
                        PasswordMd5 = Toolbox.GetMD5(userCredentials.Password),
                        Email = userCredentials.Email
                    };

                    UserDataManager.RegisterUser(newUser);
                    newUser.IdUser = UserDataManager.GetUserFromEmail(newUser.Email).IdUser;

                    if (userCredentials.SaveCookie)
                        FormsAuthentication.SetAuthCookie(userCredentials.Email, true);
                    else
                        FormsAuthentication.SetAuthCookie(userCredentials.Email, false);

                    Session["userData"] = newUser;
                    return PartialView(userCredentials);
                }
                else
                    ModelState.AddModelError(String.Empty, "Cet e-mail est déjà enregistré sur notre site.");
            }
            return PartialView(userCredentials);
        }
    }
}
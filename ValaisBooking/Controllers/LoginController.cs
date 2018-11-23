using BLL;
using DTO;
using System;
using System.Configuration;
using System.Web.Mvc;
using System.Web.Security;
using ValaisBooking.ViewModel;

namespace ValaisBooking.Controllers
{
    public class LoginController : Controller
    {
        
        public ActionResult Login()
        {
            return View();
        }

        [HttpPost]
        public ActionResult Login(ConnexionVM userCredentials, string returnUrl)
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

                        if(userCredentials.SaveCookie)
                            FormsAuthentication.SetAuthCookie(user.Email, true);
                        else
                            FormsAuthentication.SetAuthCookie(user.Email, false);
                        if (!string.IsNullOrWhiteSpace(returnUrl) && Url.IsLocalUrl(returnUrl))
                            return Redirect(returnUrl);
  
                        return RedirectToAction("Index", "Home");
                    }
                    else
                        ModelState.AddModelError(String.Empty, "Données de connexion invalides");
                
            }
            return View(userCredentials);
        }

        public ActionResult Register(string returnUrl)
        {
            return View();
        }

        [HttpPost]
        public ActionResult Register(RegisterVM userCredentials, string returnUrl)
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
                    return RedirectToAction("Index", "Home");
                }
                else
                    ModelState.AddModelError(String.Empty, "Cet e-mail est déjà enregistré sur notre site.");
            }
            return View(userCredentials);
        }

        public ActionResult Logout()
        {
            FormsAuthentication.SignOut();
            Session.Abandon();
            return RedirectToAction("Index", "Home");
        }
    }
}
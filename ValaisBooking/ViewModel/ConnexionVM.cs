using System.ComponentModel.DataAnnotations;

namespace ValaisBooking.ViewModel
{
    public class ConnexionVM

    {
        [Display(Name = "E-mail:")]
        [Required(ErrorMessage = "Le champ e-mail est vide")]
        [EmailAddress(ErrorMessage = "Format invalide")]
        public string Email { get; set; }

       [Display(Name = "Mot de passe:")]
       [Required(ErrorMessage = "Le champ mot de passe est vide")]
        public string Password { get; set; }

         [Display(Name = "Se souvenir de moi durant 30 jours")]
        public bool SaveCookie { get; set; }
    }
}
using System.ComponentModel.DataAnnotations;

namespace ValaisBooking.ViewModel
{
    public class RegisterVM
    {
        [Display(Name = "E-mail:")]
        [Required(ErrorMessage = "Le champ e-mail est vide")]
        [EmailAddress(ErrorMessage = "Format invalide")]
        public string Email { get; set; }

        [Display(Name = "Mot de passe:")]
        [StringLength(20, MinimumLength = 5, ErrorMessage = "Le mot de passe doit contenir entre 5 et 20 caractères")]
        [Required(ErrorMessage = "Le champ mot de passe est vide")]
        public string Password { get; set; }

        [Display(Name = "Prénom:")]
        [RegularExpression("[a-zA-Z]*", ErrorMessage = "Caractère non autorisé - [a-zA-Z]")]
        [StringLength(20, MinimumLength = 3, ErrorMessage = "Le prénom doit contenir entre 3 et 20 caractères")]
        [Required(ErrorMessage = "Le champ prénom est vide")]
        public string Firstname { get; set; }

        [Display(Name = "Nom:")]
        [RegularExpression("[a-zA-Z]*", ErrorMessage = "Caractère non autorisé - [a-zA-Z]")]
        [StringLength(20, MinimumLength = 3, ErrorMessage = "Le nom doit contenir entre 3 et 20 caractères")]
        [Required(ErrorMessage = "Le champ nom est vide")]
        public string LastName { get; set; }

        [Display(Name = "Se souvenir de moi durant 30 jours")]
        public bool SaveCookie { get; set; }
    }
}
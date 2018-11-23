using System;
using System.ComponentModel.DataAnnotations;
using System.Web.Mvc;

namespace ValaisBooking.ViewModel
{
    public class SearchVM
    {
        [Display(Name = "Première nuit")]
        [DisplayFormat(ApplyFormatInEditMode = true, DataFormatString = "{0:dd'.'MM'.'yyyy}")]
        public DateTime FirstNight { get; set; }

        [Display(Name = "Dernière nuit")]
        [DisplayFormat(ApplyFormatInEditMode = true, DataFormatString = "{0:dd'.'MM'.'yyyy}")]
        public DateTime LastNight { get; set; }

        [Display(Name = "Lieu")]
        public string Location { get; set; }

        [Display(Name = "Adultes")]
        public int Adultes { get; set; }

        // Elements cachés gérés par Jquery

        [HiddenInput(DisplayValue = false)]
        public decimal MaxNightPrice { get; set; }

        [HiddenInput(DisplayValue = false)]
        public bool Star1 { get; set; }

        [HiddenInput(DisplayValue = false)]
        public bool Star2 { get; set; }

        [HiddenInput(DisplayValue = false)]
        public bool Star3 { get; set; }

        [HiddenInput(DisplayValue = false)]
        public bool Star4 { get; set; }

        [HiddenInput(DisplayValue = false)]
        public bool Star5 { get; set; }

        [HiddenInput(DisplayValue = false)]
        public bool HasWifi { get; set; }

        [HiddenInput(DisplayValue = false)]
        public bool HasParking { get; set; }

        [HiddenInput(DisplayValue = false)]
        public bool HasTV { get; set; }

        [HiddenInput(DisplayValue = false)]
        public bool HasHairDryer { get; set; }

        //lors du premier chargement on set les valeurs par défaut
        public SearchVM() {
            FirstNight = DateTime.Now.Date;
            LastNight = FirstNight;
            Location = "Valais";
            Star1 = true;
            Star2 = true;
            Star3 = true;
            Star4 = true;
            Star5 = true;
            MaxNightPrice = 9999m; // prix bidon volontairement grand pour éviter tout filtrage au début
        }
    }
}
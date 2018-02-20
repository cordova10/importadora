using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.ComponentModel.DataAnnotations;
namespace Site.Models
{
    [Serializable]
    public class Usuario
    {
        [Required(ErrorMessage = "El usuario es requerido")]
        public string usuario { get; set; }
        [Required(ErrorMessage = "La contrasenia es requerida")]
        public string contrasenia { get; set; }

        public List<string> opciones { get; set; }

        public int id { get; set; }
        public string nombre { get; set; }

    }
}
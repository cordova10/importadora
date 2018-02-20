using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using Site.Datos;
using System.ComponentModel.DataAnnotations;
namespace Site.Models
{
    public class ProductoUbicacion
    {
        public inv_producto_stock producto { get; set; }
        [Range(1,int.MaxValue, ErrorMessage ="La cantidad a mover debe de ser mayor a cero")]
        public int cantidad_mover { get; set; }
        [Required(ErrorMessage ="Seleccione una ubicacion")]
        public int ubicacion_mover { get; set; }
    }
}
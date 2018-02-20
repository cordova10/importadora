using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace Site.Models
{
    public class cmbProducto
    {
        public int pro_id { get; set; }
        public string pro_codigo { get; set; }
        public string pro_descripcion { get; set; }

        public string descripcion { get { return pro_codigo + " - " + pro_descripcion; } }
    }
}
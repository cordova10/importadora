using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace Site.Models
{
    public class cmbStock
    {
        public int sto_id { get; set; }
        public int sto_cantidad { get; set; }
        public string ubi_codigo { get; set; }
        public decimal sto_costo { get; set; }
        public string descripcion { get { return ubi_codigo + " - " + sto_cantidad + " - " + sto_costo; } }
    }
}
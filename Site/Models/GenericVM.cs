using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using Site.Helpers;

namespace Site.Models
{
    public class GenericVM<T>
    {
        //Lista de de datos, es la que se muestra en pantalla
        public int id { get; set; }
        public List<T> Lista { get; set; }

        public string filter { get; set; }

        public PagingInfo paging { get; set; }
    }
}
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace Site.Models
{
    public class GenericResultElements<T>
    {
        public int Total { get; set; }
        public List<T> ListElements { get; set; }
    }
}
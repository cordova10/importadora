using System;
using System.Collections.Generic;
using System.Data;
using System.Data.Entity;
using System.Linq;
using System.Net;
using System.Web;
using System.Web.Mvc;
using Site.Datos;
using Site.Models;
using Site.Helpers;

namespace Site.Controllers
{
    public class InventarioStockController : Controller
    {
        private DBEntities db = new DBEntities();


        public ActionResult Index()
        {
            return View();
        }

        public PartialViewResult _List(int page = 1, int pageSize = 10, string filter = "")
        {
            GenericResultElements<inv_producto_stock> model = new GenericResultElements<inv_producto_stock>();
            GenericVM<inv_producto_stock> modelo = new GenericVM<inv_producto_stock>() { };


            model.ListElements = db.inv_producto_stock.Include(i => i.inv_producto).Include(i => i.inv_ubicacion)
                                 .OrderBy(x => x.inv_ubicacion.ubi_codigo)
                                 .Skip((page - 1) * pageSize).Take(pageSize)
                                 .ToList();
            model.Total = db.inv_producto_stock.Count();

            modelo = new Models.GenericVM<inv_producto_stock>
            {
                filter = filter,
                Lista = model.ListElements,
                paging = new PagingInfo { CurrentPage = page, ItemsPerPage = pageSize, TotalItems = model.Total }
            };

            return PartialView("_List", modelo);
        }

        protected override void Dispose(bool disposing)
        {
            if (disposing)
            {
                db.Dispose();
            }
            base.Dispose(disposing);
        }
    }
}

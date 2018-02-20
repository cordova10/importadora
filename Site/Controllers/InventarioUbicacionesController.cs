using Site.Datos;
using Site.Helpers;
using Site.Models;
using Site.Utils;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Web;
using System.Web.Mvc;
using System.Data.Entity;
namespace Site.Controllers
{
   
    public class InventarioUbicacionesController : Controller
    {
        private DBEntities db = new DBEntities();

        // GET: Producto
        public ActionResult Index()
        {
            return View();
        }

        public PartialViewResult _List(int page = 1, int pageSize = 10, string filter = "")
        {

            var modelo = GetModel(page, pageSize, filter);
            return PartialView("_List", modelo);
        }
        private Models.GenericVM<inv_ubicacion> GetModel(int page = 1, int pageSize = 10, string filter = "")
        {
            GenericResultElements<inv_ubicacion> model = new GenericResultElements<inv_ubicacion>();
            GenericVM<inv_ubicacion> modelo = new GenericVM<inv_ubicacion>() { };


            model.ListElements = db.inv_ubicacion
                                 .Include(x=>x.adm_usuario)
                                 .OrderBy(x => x.ubi_codigo)
                                 .Skip((page - 1) * pageSize).Take(pageSize)
                                 .ToList();
            model.Total = db.inv_ubicacion.Count();

            return new Models.GenericVM<inv_ubicacion>
            {
                filter = filter,
                Lista = model.ListElements,
                paging = new PagingInfo { CurrentPage = page, ItemsPerPage = pageSize, TotalItems = model.Total }
            };
        }

        // GET: Producto/Details/5
        public ActionResult Details(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            inv_producto inv_producto = db.inv_producto.Find(id);
            if (inv_producto == null)
            {
                return HttpNotFound();
            }
            return View(inv_producto);
        }

        // GET: Producto/Create
        public ActionResult Create()
        {
           
            return View();
        }

        // POST: Producto/Create
        // Para protegerse de ataques de publicación excesiva, habilite las propiedades específicas a las que desea enlazarse. Para obtener 
        // más información vea http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Create(inv_ubicacion obj)
        {
            if (ModelState.IsValid)
            {
                try
                {
                    obj.ubi_fecha_tran = DateTime.Now;
                    obj.ubi_usuario_tran = ((Usuario)Session["usr"]).id;
                    
                    db.inv_ubicacion.Add(obj);
                    db.SaveChanges();
                    var modelo = GetModel(1, 10, "");
                    string html = HTML.RenderViewToString(this.ControllerContext, "_List", modelo);
                    return Json(new { success = true, html = html });
                }
                catch (Exception ex)
                {
                    //string error = Utils.HandlerError(ex);
                    ModelState.AddModelError(string.Empty, ex.Message);

                }
            }

            return View(obj);
        }

        // GET: Producto/Edit/5
        public ActionResult Edit(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            inv_ubicacion objUbicacion = db.inv_ubicacion.FirstOrDefault(x => x.ubi_id == id.Value);
            if (objUbicacion == null)
            {
                return HttpNotFound();
            }
           
           
            return View(objUbicacion);
        }

        // POST: Producto/Edit/5
        // Para protegerse de ataques de publicación excesiva, habilite las propiedades específicas a las que desea enlazarse. Para obtener 
        // más información vea http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit(inv_ubicacion obj)
        {

            if (ModelState.IsValid)
            {
                try
                {
                    obj.ubi_fecha_tran = DateTime.Now;
                    obj.ubi_usuario_tran = ((Usuario)Session["usr"]).id;
                    
                    db.inv_ubicacion.Attach(obj);
                    db.SaveChanges();
                    var modelo = GetModel(1, 10, "");
                    string html = HTML.RenderViewToString(this.ControllerContext, "_List", modelo);
                    return Json(new { success = true, html = html });
                }
                catch (Exception ex)
                {
                    //string error = Utils.HandlerError(ex);
                    ModelState.AddModelError(string.Empty, ex.Message);

                }
            }

            ViewBag.listaUbicaciones = db.inv_ubicacion.Where(x => x.ubi_activo == true).ToList();
            return View(obj);
        }

        // GET: Producto/Delete/5
        public ActionResult Delete(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            inv_ubicacion objUbicacion = db.inv_ubicacion.FirstOrDefault(x => x.ubi_id == id.Value);
            if (objUbicacion == null)
            {
                return HttpNotFound();
            }


            return View(objUbicacion);
        }

        // POST: Producto/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public ActionResult Delete(inv_ubicacion obj)
        {

            if (ModelState.IsValid)
            {
                try
                {
                    obj = db.inv_ubicacion.FirstOrDefault(x => x.ubi_id == obj.ubi_id);
                    if(obj.inv_producto_stock.Count()>0 || obj.inv_trans_detalle.Count()>0)
                    {
                        ModelState.AddModelError(string.Empty, "No se puede eliminar porque tiene registros asociados");
                        return View(obj);
                    }
                    db.inv_ubicacion.Remove(obj);
                    db.SaveChanges();
                    var modelo = GetModel(1, 10, "");
                    string html = HTML.RenderViewToString(this.ControllerContext, "_List", modelo);
                    return Json(new { success = true, html = html });
                }
                catch (Exception ex)
                {
                    //string error = Utils.HandlerError(ex);
                    ModelState.AddModelError(string.Empty, ex.Message);

                }
            }
          
            return View(obj);
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
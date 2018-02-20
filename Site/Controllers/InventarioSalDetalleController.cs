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
    public class InventarioSalDetalleController : Controller
    {
        private DBEntities db = new DBEntities();

        // GET: InventarioSalDetalle
        public ActionResult Index(int id = 0)
        {
            inv_trans inv_trans = db.inv_trans.Find(id);
            ViewBag.Titulo = inv_trans.tra_comentario;
            ViewBag.IdTrans = inv_trans.tra_id;
            return View();
        }


        public PartialViewResult _List(int id = 0, int page = 1, int pageSize = 10, string filter = "")
        {
            GenericResultElements<inv_trans_detalle> model = new GenericResultElements<inv_trans_detalle>();
            GenericVM<inv_trans_detalle> modelo = new GenericVM<inv_trans_detalle>() { };


            model.ListElements = db.inv_trans_detalle.Include(i => i.inv_producto).Include(i => i.inv_trans).Include(i => i.inv_ubicacion)
                                 .Where(x => x.tde_trans == id)
                                 .OrderByDescending(x => x.tde_id)
                                 .Skip((page - 1) * pageSize).Take(pageSize)
                                 .ToList(); ;
            model.Total = db.inv_trans_detalle.Include(i => i.inv_producto).Count();

            modelo = new Models.GenericVM<inv_trans_detalle>
            {
                id = id,
                filter = filter,
                Lista = model.ListElements,
                paging = new PagingInfo { CurrentPage = page, ItemsPerPage = pageSize, TotalItems = model.Total }
            };

            return PartialView("_List", modelo);
        }

        // GET: InventarioSalDetalle/Create
        public ActionResult Create(string idTrans)
        {
            ViewBag.idTrans = idTrans;

            LoadList();

            return View();
        }

        // POST: InventarioSalDetalle/Create
        // Para protegerse de ataques de publicación excesiva, habilite las propiedades específicas a las que desea enlazarse. Para obtener 
        // más información vea http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Create([Bind(Include = "tde_id,tde_trans,tde_cantidad,tde_producto,tde_descripcion,tde_costo,tde_ubicacion,tde_fecha_trans,tde_usuario_trans,tde_eliminado")] inv_trans_detalle inv_trans_detalle)
        {
            if (ModelState.IsValid)
            {
                try
                {
                    inv_producto_stock stock = new inv_producto_stock();

                    stock = db.inv_producto_stock.Find(inv_trans_detalle.tde_ubicacion);

                    inv_trans_detalle.tde_fecha_trans = DateTime.Now; 
                    inv_trans_detalle.tde_descripcion = db.inv_producto.Find(inv_trans_detalle.tde_producto).pro_descripcion;
                    inv_trans_detalle.tde_costo = stock.sto_costo;
                    inv_trans_detalle.tde_ubicacion = stock.sto_ubicacion;
                    inv_trans_detalle.tde_usuario_trans = 1;
                    inv_trans_detalle.tde_eliminado = false;
                    db.inv_trans_detalle.Add(inv_trans_detalle);
                    db.SaveChanges();
                    return Json(new { success = true });
                }
                catch (Exception ex)
                {
                    //string error = Utils.HandlerError(ex);
                    ModelState.AddModelError(string.Empty, ex.Message);

                }
            }

            LoadList();
            return PartialView("Create", inv_trans_detalle);
        }

        // GET: InventarioSalDetalle/Edit/5
        public ActionResult Edit(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            inv_trans_detalle inv_trans_detalle = db.inv_trans_detalle.Find(id);
            if (inv_trans_detalle == null)
            {
                return HttpNotFound();
            }

            LoadList();
            ViewBag.idProducto = inv_trans_detalle.tde_producto;
            ViewBag.idUbicacion = inv_trans_detalle.tde_ubicacion;
            return View(inv_trans_detalle);
        }

        // POST: InventarioSalDetalle/Edit/5
        // Para protegerse de ataques de publicación excesiva, habilite las propiedades específicas a las que desea enlazarse. Para obtener 
        // más información vea http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit([Bind(Include = "tde_id,tde_trans,tde_cantidad,tde_producto,tde_descripcion,tde_costo,tde_ubicacion,tde_fecha_trans,tde_usuario_trans,tde_eliminado")] inv_trans_detalle inv_trans_detalle)
        {
            if (ModelState.IsValid)
            {
                try
                {
                    inv_producto_stock stock = new inv_producto_stock();

                    stock = db.inv_producto_stock.Find(inv_trans_detalle.tde_ubicacion);

                    inv_trans_detalle.tde_fecha_trans = DateTime.Now;
                    inv_trans_detalle.tde_descripcion = db.inv_producto.Find(inv_trans_detalle.tde_producto).pro_descripcion;
                    inv_trans_detalle.tde_costo = stock.sto_costo;
                    inv_trans_detalle.tde_ubicacion = stock.sto_ubicacion;
                    inv_trans_detalle.tde_usuario_trans = 1;
                    inv_trans_detalle.tde_eliminado = false;
                    db.Entry(inv_trans_detalle).State = EntityState.Modified;
                    db.SaveChanges();
                    return Json(new { success = true });
                }
                catch (Exception ex)
                {
                    //string error = Utils.HandlerError(ex);
                    ModelState.AddModelError(string.Empty, ex.Message);

                }
            }

            LoadList();

            return PartialView("Edit", inv_trans_detalle);
        }

        // GET: InventarioSalDetalle/Delete/5
        public ActionResult Delete(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            inv_trans_detalle inv_trans_detalle = db.inv_trans_detalle.Find(id);
            if (inv_trans_detalle == null)
            {
                return HttpNotFound();
            }
            return PartialView("Delete", inv_trans_detalle);
        }

        // POST: InventarioSalDetalle/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public ActionResult DeleteConfirmed(int id)
        {
            inv_trans_detalle inv_trans_detalle = db.inv_trans_detalle.Find(id);

            try
            {
                db.inv_trans_detalle.Remove(inv_trans_detalle);
                db.SaveChanges();
                return Json(new { success = true });
            }
            catch (Exception ex)
            {
                //string error = Utils.HandlerError(ex);
                ModelState.AddModelError(string.Empty, ex.Message);

            }

            return PartialView("Delete", inv_trans_detalle);
        }

        public JsonResult GetStock(int id)
        {

            List<cmbStock> inv_stock = new List<cmbStock>();
            inv_stock = db.inv_producto_stock.Include(i => i.inv_ubicacion)
                        .Where(x => x.sto_producto == id)
                        .Select(x => new cmbStock { sto_id = x.sto_id, sto_cantidad = x.sto_cantidad, ubi_codigo = x.inv_ubicacion.ubi_codigo, sto_costo = x.sto_costo }).ToList();

            return new JsonResult { Data = inv_stock, JsonRequestBehavior = JsonRequestBehavior.AllowGet };
        }

        public void LoadList()
        {

            List<cmbProducto> inv_producto = new List<cmbProducto>();
            inv_producto = db.inv_producto_stock.Include(i => i.inv_producto)
                           .Select(x => new cmbProducto { pro_id = x.sto_producto, pro_codigo = x.inv_producto.pro_codigo, pro_descripcion = x.inv_producto.pro_descripcion }).ToList();

            int id = inv_producto.FirstOrDefault().pro_id;

            List<cmbStock> inv_stock = new List<cmbStock>();
            inv_stock = db.inv_producto_stock.Include(i => i.inv_ubicacion)
                        .Where(x => x.sto_producto == id)
                        .Select(x => new cmbStock { sto_id = x.sto_id, sto_cantidad = x.sto_cantidad, ubi_codigo = x.inv_ubicacion.ubi_codigo, sto_costo = x.sto_costo }).ToList();

            ViewBag.tde_producto = new SelectList(inv_producto, "pro_id", "descripcion");
            ViewBag.tde_ubicacion = new SelectList(inv_stock, "sto_id", "descripcion");

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

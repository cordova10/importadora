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
    public class InventarioSalidaController : Controller
    {
        private DBEntities db = new DBEntities();

        // GET: InventarioSalida
        public ActionResult Index()
        {
            return View();
        }

        public PartialViewResult _List(int page = 1, int pageSize = 10, string filter = "")
        {
            GenericResultElements<inv_trans> model = new GenericResultElements<inv_trans>();
            GenericVM<inv_trans> modelo = new GenericVM<inv_trans>() { };


            model.ListElements = db.inv_trans
                                 .Where(x => x.tra_tipo == 2)
                                 .OrderByDescending(x => x.tra_id)
                                 .Skip((page - 1) * pageSize).Take(pageSize)
                                 .ToList(); ;
            model.Total = db.inv_trans.Count();

            modelo = new Models.GenericVM<inv_trans>
            {
                filter = filter,
                Lista = model.ListElements,
                paging = new PagingInfo { CurrentPage = page, ItemsPerPage = pageSize, TotalItems = model.Total }
            };

            return PartialView("_List", modelo);
        }

        // GET: InventarioSalida/Create
        public ActionResult Create()
        {
            return View();
        }

        // POST: InventarioSalida/Create
        // Para protegerse de ataques de publicación excesiva, habilite las propiedades específicas a las que desea enlazarse. Para obtener 
        // más información vea http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Create([Bind(Include = "tra_id,tra_fecha,tra_usuario,tra_tipo,tra_comentario,tra_fecha_trans,tra_usuario_trans,tra_eliminado")] inv_trans inv_trans)
        {
            if (ModelState.IsValid)
            {
                try
                {
                    inv_trans.tra_tipo = 2;
                    inv_trans.tra_fecha_trans = DateTime.Now;
                    inv_trans.tra_usuario_trans = 1;
                    inv_trans.tra_eliminado = false;
                    db.inv_trans.Add(inv_trans);
                    db.SaveChanges();
                    return Json(new { success = true, url = "InventarioSalDetalle/Index/" + inv_trans.tra_id.ToString() });
                }
                catch (Exception ex)
                {
                    //string error = Utils.HandlerError(ex);
                    ModelState.AddModelError(string.Empty, ex.Message);

                }
            }
            return PartialView("Create", inv_trans);
        }

        // GET: InventarioSalida/Edit/5
        public ActionResult Edit(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            inv_trans inv_trans = db.inv_trans.Find(id);
            if (inv_trans == null)
            {
                return HttpNotFound();
            }
            return PartialView(inv_trans);
        }

        // POST: InventarioSalida/Edit/5
        // Para protegerse de ataques de publicación excesiva, habilite las propiedades específicas a las que desea enlazarse. Para obtener 
        // más información vea http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit([Bind(Include = "tra_id,tra_fecha,tra_usuario,tra_tipo,tra_comentario,tra_fecha_trans,tra_usuario_trans,tra_eliminado")] inv_trans inv_trans)
        {
            if (ModelState.IsValid)
            {
                try
                {
                    inv_trans.tra_tipo = 2;
                    inv_trans.tra_fecha_trans = DateTime.Now;
                    inv_trans.tra_usuario_trans = 1;
                    inv_trans.tra_eliminado = false;
                    db.Entry(inv_trans).State = EntityState.Modified;
                    db.SaveChanges();
                    return Json(new { success = true });
                }
                catch (Exception ex)
                {
                    //string error = Utils.HandlerError(ex);
                    ModelState.AddModelError(string.Empty, ex.Message);

                }
            }

            return PartialView("Edit", inv_trans);
        }

        // GET: InventarioSalida/Delete/5
        public ActionResult Delete(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            inv_trans inv_trans = db.inv_trans.Find(id);
            if (inv_trans == null)
            {
                return HttpNotFound();
            }
            return PartialView("Delete", inv_trans);
        }

        // POST: InventarioSalida/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public ActionResult DeleteConfirmed(int id)
        {
            inv_trans inv_trans = db.inv_trans.Find(id);

            try
            {

                db.inv_trans.Remove(inv_trans);
                db.SaveChanges();
                return Json(new { success = true });
            }
            catch (Exception ex)
            {
                //string error = Utils.HandlerError(ex);
                ModelState.AddModelError(string.Empty, ex.Message);

            }

            return PartialView("Delete", inv_trans);
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

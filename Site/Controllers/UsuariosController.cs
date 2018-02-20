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
    public class UsuariosController : Controller
    {
        private DBEntities db = new DBEntities();

        // GET: Usuarios
        public ActionResult Index()
        {
            return View();
        }

        public PartialViewResult _List(int page = 1, int pageSize = 10, string filter = "")
        {
            GenericResultElements<adm_usuario> model = new GenericResultElements<adm_usuario>();
            GenericVM<adm_usuario> modelo = new GenericVM<adm_usuario>() { };


            model.ListElements = db.adm_usuario
                                 .OrderBy(x => x.usr_nombre)
                                 .Skip((page - 1) * pageSize).Take(pageSize)
                                 .ToList();
            model.Total = db.adm_usuario.Count();

            modelo = new Models.GenericVM<adm_usuario>
            {
                filter = filter,
                Lista = model.ListElements,
                paging = new PagingInfo { CurrentPage = page, ItemsPerPage = pageSize, TotalItems = model.Total }
            };

            return PartialView("_List", modelo);
        }

        // GET: Usuarios/Details/5
        public ActionResult Details(long? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            adm_usuario adm_usuario = db.adm_usuario.Find(id);
            if (adm_usuario == null)
            {
                return HttpNotFound();
            }
            return View(adm_usuario);
        }

        // GET: Usuarios/Create
        public ActionResult Create()
        {
            return View();
        }

        // POST: Usuarios/Create
        // Para protegerse de ataques de publicación excesiva, habilite las propiedades específicas a las que desea enlazarse. Para obtener 
        // más información vea http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Create([Bind(Include = "usr_id,usr_usuario,usr_password,usr_nombre,usr_fecha_tran,usr_usuario_tran,usr_eliminado")] adm_usuario adm_usuario)
        {
            if (ModelState.IsValid)
            {
                db.adm_usuario.Add(adm_usuario);
                db.SaveChanges();
                return RedirectToAction("Index");
            }

            return View(adm_usuario);
        }

        // GET: Usuarios/Edit/5
        public ActionResult Edit(long? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            adm_usuario adm_usuario = db.adm_usuario.Find(id);
            if (adm_usuario == null)
            {
                return HttpNotFound();
            }
            return View(adm_usuario);
        }

        // POST: Usuarios/Edit/5
        // Para protegerse de ataques de publicación excesiva, habilite las propiedades específicas a las que desea enlazarse. Para obtener 
        // más información vea http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit([Bind(Include = "usr_id,usr_usuario,usr_password,usr_nombre,usr_fecha_tran,usr_usuario_tran,usr_eliminado")] adm_usuario adm_usuario)
        {
            if (ModelState.IsValid)
            {
                db.Entry(adm_usuario).State = EntityState.Modified;
                db.SaveChanges();
                return RedirectToAction("Index");
            }
            return View(adm_usuario);
        }

        // GET: Usuarios/Delete/5
        public ActionResult Delete(long? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            adm_usuario adm_usuario = db.adm_usuario.Find(id);
            if (adm_usuario == null)
            {
                return HttpNotFound();
            }
            return View(adm_usuario);
        }

        // POST: Usuarios/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public ActionResult DeleteConfirmed(long id)
        {
            adm_usuario adm_usuario = db.adm_usuario.Find(id);
            db.adm_usuario.Remove(adm_usuario);
            db.SaveChanges();
            return RedirectToAction("Index");
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

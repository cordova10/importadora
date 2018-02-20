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
using Site.Utils;

namespace Site.Controllers
{
    public class InventarioTrasladoController : Controller
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
        private Models.GenericVM<inv_producto_stock> GetModel(int page = 1, int pageSize = 10, string filter = "")
        {
            GenericResultElements<inv_producto_stock> model = new GenericResultElements<inv_producto_stock>();
            GenericVM<inv_producto_stock> modelo = new GenericVM<inv_producto_stock>() { };


            model.ListElements = db.inv_producto_stock.Include(i => i.inv_producto).Include(i => i.inv_ubicacion)
                                 .OrderBy(x => x.inv_producto.pro_codigo)
                                 .Skip((page - 1) * pageSize).Take(pageSize)
                                 .ToList();
            model.Total = db.inv_producto_stock.Count();

            return new Models.GenericVM<inv_producto_stock>
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
            ViewBag.pro_tipo = new SelectList(db.inv_producto_tipo, "pti_id", "pti_descripcion");
            ViewBag.pro_proveedor = new SelectList(db.inv_proveedor, "prv_id", "prv_nombre");
            ViewBag.pro_unidad_medida = new SelectList(db.inv_unidad_medida, "uni_id", "uni_descripcion");
            return View();
        }

        // POST: Producto/Create
        // Para protegerse de ataques de publicación excesiva, habilite las propiedades específicas a las que desea enlazarse. Para obtener 
        // más información vea http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Create([Bind(Include = "pro_id,pro_codigo,pro_descripcion,pro_unidad_medida,pro_tipo,pro_existencia_min,pro_existencia_max,pro_proveedor,pro_activo,pro_fecha_tran,pro_usuario_tran,pro_eliminado")] inv_producto inv_producto)
        {
            if (ModelState.IsValid)
            {
                try
                {
                    inv_producto.pro_fecha_tran = DateTime.Now;
                    db.inv_producto.Add(inv_producto);
                    db.SaveChanges();
                    return Json(new { success = true });
                }
                catch (Exception ex)
                {
                    //string error = Utils.HandlerError(ex);
                    ModelState.AddModelError(string.Empty, ex.Message);

                }
        }

            ViewBag.pro_tipo = new SelectList(db.inv_producto_tipo, "pti_id", "pti_descripcion", inv_producto.pro_tipo);
            ViewBag.pro_proveedor = new SelectList(db.inv_proveedor, "prv_id", "prv_nombre", inv_producto.pro_proveedor);
            ViewBag.pro_unidad_medida = new SelectList(db.inv_unidad_medida, "uni_id", "uni_descripcion", inv_producto.pro_unidad_medida);
            return PartialView("Create", inv_producto);
        }

        // GET: Producto/Edit/5
        public ActionResult Edit(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            inv_producto_stock inv_producto = db.inv_producto_stock.Include(x=>x.inv_ubicacion).Include(x => x.inv_producto).FirstOrDefault(x=>x.sto_id==id.Value);
            if (inv_producto == null)
            {
                return HttpNotFound();
            }
            var modelo = new ProductoUbicacion
            {
                producto= inv_producto                
            };
            ViewBag.listaUbicaciones = db.inv_ubicacion.Where(x=>x.ubi_activo==true).ToList();
            return View(modelo);
        }

        // POST: Producto/Edit/5
        // Para protegerse de ataques de publicación excesiva, habilite las propiedades específicas a las que desea enlazarse. Para obtener 
        // más información vea http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit(ProductoUbicacion obj)
        {

            if (ModelState.IsValid)
            {
                try
                {
                    if (obj.cantidad_mover > obj.producto.sto_cantidad)
                        throw new Exception("La cantidad a mover debe ser menor o igual a " + obj.producto.sto_cantidad);
                    if (obj.ubicacion_mover == obj.producto.sto_ubicacion)
                        throw new Exception("La ubicacion debe de ser distinta a la actual");

                    //creo la salida del prducto y registro la entrada del mismo
                    inv_trans objSalida = new inv_trans()
                    {
                        tra_fecha = DateTime.Now,
                        tra_tipo = Constantes.SALIDA,
                        tra_usuario = User.Identity.Name                         
                    };
                    objSalida.inv_trans_detalle = new List<inv_trans_detalle>();
                    objSalida.inv_trans_detalle.Add(new inv_trans_detalle {

                        tde_cantidad = obj.cantidad_mover,
                        tde_costo = obj.producto.sto_costo,
                        tde_fecha_trans = DateTime.Now,
                        tde_producto = obj.producto.sto_producto,
                        tde_ubicacion = obj.producto.sto_ubicacion,
                        tde_descripcion = obj.producto.inv_producto.pro_descripcion,
                        tde_eliminado = false,
                        tde_usuario_trans = ((Usuario)Session["usr"]).id
                    });
                    db.inv_trans.Add(objSalida);
                    
                    //entrada

                    inv_trans objEntrada = new inv_trans()
                    {
                        tra_fecha = DateTime.Now,
                        tra_tipo = Constantes.ENTRADA,
                        tra_usuario = User.Identity.Name
                    };
                    objEntrada.inv_trans_detalle = new List<inv_trans_detalle>();
                    objEntrada.inv_trans_detalle.Add(new inv_trans_detalle
                    {

                        tde_cantidad = obj.cantidad_mover,
                        tde_costo = obj.producto.sto_costo,
                        tde_fecha_trans = DateTime.Now,
                        tde_producto = obj.producto.sto_producto,
                        tde_ubicacion = obj.ubicacion_mover,
                        tde_usuario_trans = ((Usuario)Session["usr"]).id,
                        tde_descripcion = obj.producto.inv_producto.pro_descripcion,
                        tde_eliminado = false,
                    });
                    db.inv_trans.Add(objEntrada);
                    db.SaveChanges();
                    var modelo = GetModel(1, 10, "");
                    string html = HTML.RenderViewToString(this.ControllerContext,"_List", modelo);
                    return Json(new { success = true ,html=html});
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
            inv_producto inv_producto = db.inv_producto.Find(id);
            if (inv_producto == null)
            {
                return HttpNotFound();
            }
            return PartialView("Delete", inv_producto);
        }

        // POST: Producto/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public ActionResult DeleteConfirmed(int id)
        {

            inv_producto inv_producto = db.inv_producto.Find(id);

            try
            {
                db.inv_producto.Remove(inv_producto);
                db.SaveChanges();
                return Json(new { success = true });
            }
            catch (Exception ex)
            {
                //string error = Utils.HandlerError(ex);
                ModelState.AddModelError(string.Empty, ex.Message);

            }

            return PartialView("Delete", inv_producto);
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

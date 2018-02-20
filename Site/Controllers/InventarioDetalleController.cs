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
using OfficeOpenXml;
using System.IO;
using Site.Utils;

namespace Site.Controllers
{
    public class InventarioDetalleController : Controller
    {
        private DBEntities db = new DBEntities();

        // GET: InventarioDetalle
        public ActionResult Index(int id = 0)
        {
            inv_trans inv_trans = db.inv_trans.Find(id);
            ViewBag.Titulo = inv_trans.tra_comentario;
            ViewBag.IdTrans = inv_trans.tra_id;
            return View();
        }


        public PartialViewResult _List(int id = 0, int page = 1, int pageSize = 10, string filter = "")
        {
            var modelo = GetModel(id, page, pageSize, filter);

            return PartialView("_List", modelo);
        }

        private Models.GenericVM<inv_trans_detalle> GetModel(int id = 0, int page = 1, int pageSize = 10, string filter = "")
        {
            GenericResultElements<inv_trans_detalle> model = new GenericResultElements<inv_trans_detalle>();
           
            model.ListElements = db.inv_trans_detalle.Include(i => i.inv_producto).Include(i => i.inv_trans).Include(i => i.inv_ubicacion)
                                 .Where(x => x.tde_trans == id)
                                 .OrderByDescending(x => x.tde_id)
                                 .Skip((page - 1) * pageSize).Take(pageSize)
                                 .ToList(); ;
            model.Total = db.inv_trans_detalle.Include(i => i.inv_producto).Count();

            return new Models.GenericVM<inv_trans_detalle>
            {
                id = id,
                filter = filter,
                Lista = model.ListElements,
                paging = new PagingInfo { CurrentPage = page, ItemsPerPage = pageSize, TotalItems = model.Total }
            };
        }
        // GET: InventarioDetalle/Create
        public ActionResult Create(string idTrans)
        {
            ViewBag.idTrans = idTrans;

            List<cmbProducto> inv_producto = new List<cmbProducto>();
            inv_producto = db.inv_producto.Select(x => new cmbProducto{ pro_id = x.pro_id, pro_codigo = x.pro_codigo, pro_descripcion = x.pro_descripcion }).ToList();

            ViewBag.tde_producto = new SelectList(inv_producto, "pro_id", "descripcion");
            ViewBag.tde_trans = new SelectList(db.inv_trans, "tra_id", "tra_usuario");
            ViewBag.tde_ubicacion = new SelectList(db.inv_ubicacion, "ubi_id", "ubi_codigo");
            return View();
        }

        // POST: InventarioDetalle/Create
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

                    inv_trans_detalle.tde_fecha_trans = DateTime.Now;
                    inv_trans_detalle.tde_descripcion = db.inv_producto.Find(inv_trans_detalle.tde_producto).pro_descripcion;
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

            List<cmbProducto> inv_producto = new List<cmbProducto>();
            inv_producto = db.inv_producto.Select(x => new cmbProducto { pro_id = x.pro_id, pro_codigo = x.pro_codigo, pro_descripcion = x.pro_descripcion }).ToList();

            ViewBag.tde_producto = new SelectList(inv_producto, "pro_id", "descripcion");
            ViewBag.tde_trans = new SelectList(db.inv_trans, "tra_id", "tra_usuario", inv_trans_detalle.tde_trans);
            ViewBag.tde_ubicacion = new SelectList(db.inv_ubicacion, "ubi_id", "ubi_codigo", inv_trans_detalle.tde_ubicacion);
            return PartialView("Create", inv_trans_detalle);
        }

        // GET: InventarioDetalle/Edit/5
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

            List<cmbProducto> inv_producto = new List<cmbProducto>();
            inv_producto = db.inv_producto.Select(x => new cmbProducto { pro_id = x.pro_id, pro_codigo = x.pro_codigo, pro_descripcion = x.pro_descripcion }).ToList();

            ViewBag.tde_producto = new SelectList(inv_producto, "pro_id", "descripcion");
            ViewBag.tde_trans = new SelectList(db.inv_trans, "tra_id", "tra_usuario", inv_trans_detalle.tde_trans);
            ViewBag.tde_ubicacion = new SelectList(db.inv_ubicacion, "ubi_id", "ubi_codigo", inv_trans_detalle.tde_ubicacion);
            ViewBag.idProducto = inv_trans_detalle.tde_producto;
            ViewBag.idUbicacion = inv_trans_detalle.tde_ubicacion;
            return View(inv_trans_detalle);
        }

        // POST: InventarioDetalle/Edit/5
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
                    inv_trans_detalle.tde_fecha_trans = DateTime.Now;
                    inv_trans_detalle.tde_descripcion = db.inv_producto.Find(inv_trans_detalle.tde_producto).pro_descripcion;
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

            List<cmbProducto> inv_producto = new List<cmbProducto>();
            inv_producto = db.inv_producto.Select(x => new cmbProducto { pro_id = x.pro_id, pro_codigo = x.pro_codigo, pro_descripcion = x.pro_descripcion }).ToList();

            ViewBag.tde_producto = new SelectList(inv_producto, "pro_id", "descripcion");
            ViewBag.tde_trans = new SelectList(db.inv_trans, "tra_id", "tra_usuario", inv_trans_detalle.tde_trans);
            ViewBag.tde_ubicacion = new SelectList(db.inv_ubicacion, "ubi_id", "ubi_codigo", inv_trans_detalle.tde_ubicacion);

            return PartialView("Edit", inv_trans_detalle);
        }

        // GET: InventarioDetalle/Delete/5
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

        // POST: InventarioDetalle/Delete/5
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

        protected override void Dispose(bool disposing)
        {
            if (disposing)
            {
                db.Dispose();
            }
            base.Dispose(disposing);
        }

        [HttpPost]
        public ActionResult LoadIn(HttpPostedFileBase file,int id_trans)
        {
            if (file == null) return Json(new { status = "error", msg = "Se necesita cargar un archivo de tipo EXCEL" });
            string ex = System.IO.Path.GetExtension(file.FileName).ToLower();
            if (!(ex == ".xls" || ex==".xlsx")) return Json(new { status = "error", msg = "Se necesita cargar un archivo de tipo EXCEL" });

            ExcelPackage excel = new ExcelPackage(file.InputStream);
            ExcelWorksheet sheet = excel.Workbook.Worksheets[1];

            //PARA EL MANEJO DE LOS ERRORES       
            string nombreFile_error = "IN_ERRORS_" + DateTime.Now.ToString("ddMMyyyHHmmss") + ".xlsx";
            string doc_error = Server.MapPath("~/LOG/"+ nombreFile_error);
            ExcelPackage excel_error = new ExcelPackage(new FileInfo(doc_error));
            ExcelWorksheet sheet_error = excel_error.Workbook.Worksheets.Add("errores");
           

            int cantidad = 0;
            string codigoProducto;
            decimal costo = 0;
            int i = 2;
            int j = 2;
            bool huboError = false;
            while (true)
            {
                if (sheet.Cells[i, 2].Value==null) break;
                codigoProducto = sheet.Cells[i, 2].Value.ToString();
                var objProd = db.inv_producto.FirstOrDefault(x => x.pro_codigo.ToUpper().Trim() == codigoProducto.ToUpper().Trim());
                if (objProd == null)
                {
                    sheet_error.Cells[1, 1].Value = "LINEA";
                    sheet_error.Cells[1, 2].Value = "CODIGO PRODUCTO";
                    sheet_error.Cells[1, 3].Value = "COMENTARIO";

                    sheet_error.Cells[j, 1].Value = i;
                    sheet_error.Cells[j, 2].Value = codigoProducto;
                    sheet_error.Cells[j, 3].Value = "No se encontro producto";
                    j++;
                    huboError = true;

                }
                else
                {
                    cantidad = int.Parse(sheet.Cells[i, 1].Value.ToString());
                    costo = decimal.Parse(sheet.Cells[i, 3].Value.ToString());
                    db.inv_trans_detalle.Add(new inv_trans_detalle
                    {
                        tde_cantidad = cantidad,
                        tde_costo = costo,
                        tde_descripcion = objProd.pro_descripcion,
                        tde_fecha_trans = DateTime.Now,
                        tde_producto = objProd.pro_id,
                        tde_trans = id_trans,
                        tde_ubicacion = 1,
                        tde_usuario_trans = ((Usuario)Session["usr"]).id
                    });
                }
                i++;
            }

            db.SaveChanges();
            string link_error = "";
            if (huboError)
            {
                excel_error.Save();
                link_error = Url.Content("~/LOG/" + nombreFile_error);

            }
            var modelo = GetModel(id_trans, 1, 10, "");
            string html = HTML.RenderViewToString(this.ControllerContext, "_List", modelo);
            return Json(new { status = "ok", html =html, link_error = link_error });
        }
    }
}

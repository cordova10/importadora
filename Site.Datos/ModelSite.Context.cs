﻿//------------------------------------------------------------------------------
// <auto-generated>
//     Este código se generó a partir de una plantilla.
//
//     Los cambios manuales en este archivo pueden causar un comportamiento inesperado de la aplicación.
//     Los cambios manuales en este archivo se sobrescribirán si se regenera el código.
// </auto-generated>
//------------------------------------------------------------------------------

namespace Site.Datos
{
    using System;
    using System.Data.Entity;
    using System.Data.Entity.Infrastructure;
    
    public partial class DBEntities : DbContext
    {
        public DBEntities()
            : base("name=DBEntities")
        {
        }

        protected override void OnModelCreating(DbModelBuilder modelBuilder)
        {
            throw new UnintentionalCodeFirstException();
        }
    
        public virtual DbSet<adm_usuario> adm_usuario { get; set; }
        public virtual DbSet<fac_cliente> fac_cliente { get; set; }
        public virtual DbSet<fac_cxc> fac_cxc { get; set; }
        public virtual DbSet<fac_cxc_detalle> fac_cxc_detalle { get; set; }
        public virtual DbSet<fac_factura> fac_factura { get; set; }
        public virtual DbSet<fac_factura_detalle> fac_factura_detalle { get; set; }
        public virtual DbSet<fac_pedido> fac_pedido { get; set; }
        public virtual DbSet<fac_pedido_detalle> fac_pedido_detalle { get; set; }
        public virtual DbSet<fac_pedido_estado> fac_pedido_estado { get; set; }
        public virtual DbSet<fac_precio> fac_precio { get; set; }
        public virtual DbSet<fac_precio_detalle> fac_precio_detalle { get; set; }
        public virtual DbSet<fac_tipo_factura> fac_tipo_factura { get; set; }
        public virtual DbSet<fac_tipo_pago> fac_tipo_pago { get; set; }
        public virtual DbSet<fac_vendedor> fac_vendedor { get; set; }
        public virtual DbSet<inv_despacho> inv_despacho { get; set; }
        public virtual DbSet<inv_despacho_detalle> inv_despacho_detalle { get; set; }
        public virtual DbSet<inv_producto> inv_producto { get; set; }
        public virtual DbSet<inv_producto_stock> inv_producto_stock { get; set; }
        public virtual DbSet<inv_producto_tipo> inv_producto_tipo { get; set; }
        public virtual DbSet<inv_proveedor> inv_proveedor { get; set; }
        public virtual DbSet<inv_trans> inv_trans { get; set; }
        public virtual DbSet<inv_trans_detalle> inv_trans_detalle { get; set; }
        public virtual DbSet<inv_ubicacion> inv_ubicacion { get; set; }
        public virtual DbSet<inv_unidad_medida> inv_unidad_medida { get; set; }
    }
}

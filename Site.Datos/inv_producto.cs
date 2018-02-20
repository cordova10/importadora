//------------------------------------------------------------------------------
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
    using System.Collections.Generic;
    
    public partial class inv_producto
    {
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2214:DoNotCallOverridableMethodsInConstructors")]
        public inv_producto()
        {
            this.inv_producto_stock = new HashSet<inv_producto_stock>();
            this.inv_trans_detalle = new HashSet<inv_trans_detalle>();
        }
    
        public int pro_id { get; set; }
        public string pro_codigo { get; set; }
        public string pro_descripcion { get; set; }
        public Nullable<int> pro_unidad_medida { get; set; }
        public Nullable<int> pro_tipo { get; set; }
        public int pro_existencia_min { get; set; }
        public int pro_existencia_max { get; set; }
        public Nullable<int> pro_proveedor { get; set; }
        public bool pro_activo { get; set; }
        public System.DateTime pro_fecha_tran { get; set; }
        public int pro_usuario_tran { get; set; }
        public bool pro_eliminado { get; set; }
        public string pro_codigo_bar { get; set; }
    
        public virtual inv_producto_tipo inv_producto_tipo { get; set; }
        public virtual inv_proveedor inv_proveedor { get; set; }
        public virtual inv_unidad_medida inv_unidad_medida { get; set; }
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<inv_producto_stock> inv_producto_stock { get; set; }
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<inv_trans_detalle> inv_trans_detalle { get; set; }
    }
}

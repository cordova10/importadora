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
    
    public partial class fac_precio
    {
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2214:DoNotCallOverridableMethodsInConstructors")]
        public fac_precio()
        {
            this.fac_precio_detalle = new HashSet<fac_precio_detalle>();
        }
    
        public int pre_id { get; set; }
        public string pre_descripcion { get; set; }
        public Nullable<bool> pre_activo { get; set; }
        public Nullable<System.DateTime> pre_fecha_tran { get; set; }
        public Nullable<int> pre_usuario_tran { get; set; }
    
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<fac_precio_detalle> fac_precio_detalle { get; set; }
    }
}

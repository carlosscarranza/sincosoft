//------------------------------------------------------------------------------
// <auto-generated>
//     This code was generated from a template.
//
//     Manual changes to this file may cause unexpected behavior in your application.
//     Manual changes to this file will be overwritten if the code is regenerated.
// </auto-generated>
//------------------------------------------------------------------------------

namespace Sinco.Domain
{
    using System;
    using System.Collections.Generic;
    
    public partial class Registro_Profesor_Materia
    {
        public int Id { get; set; }
        public Nullable<int> Id_Profesor { get; set; }
        public Nullable<int> Id_Materia { get; set; }
    
        public virtual Materia Materia { get; set; }
        public virtual Profesor Profesor { get; set; }
    }
}
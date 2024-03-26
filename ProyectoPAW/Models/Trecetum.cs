using System;
using System.Collections.Generic;

namespace ProyectoPAW.Models
{
    public partial class Trecetum
    {
        public Trecetum()
        {
            TcursoReceta = new HashSet<TcursoRecetum>();
        }

        public long Id { get; set; }
        public string UsuarioId { get; set; } = null!;
        public string Nombre { get; set; } = null!;
        public string Descripcion { get; set; } = null!;
        public string Instrucciones { get; set; } = null!;
        public string Categoria { get; set; } = null!;
        public string Ingredientes { get; set; } = null!;

        public virtual AspNetUser Usuario { get; set; } = null!;
        public virtual ICollection<TcursoRecetum> TcursoReceta { get; set; }
    }
}

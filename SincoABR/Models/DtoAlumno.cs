namespace Sinco.Services.Models
{
    public class DtoAlumno
    {
        public int Id { get; set; }
        public string Nombre { get; set; }
        public int? Semestre { get; set; }
        public string Carrera { get; set; }
    }
}
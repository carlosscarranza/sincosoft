using System.Threading.Tasks;
using Sinco.Domain;

namespace Sinco.Infra.Implementation
{
    public sealed class UnitOfWork 
    {
        public UnitOfWork()
        {
            this._context = new SincoABREntities();
        }
        private readonly SincoABREntities _context;
        
        //Unique Instance - Singleton
        public static UnitOfWork I { get; } = new UnitOfWork();

        #region Alumno
        private GenericRepository<Alumno> _alumnoRepository;
        public GenericRepository<Alumno> AlumnoRepository =>
            this._alumnoRepository ?? (this._alumnoRepository = new GenericRepository<Alumno>(this._context));
        #endregion

        #region Materia
        private GenericRepository<Materia> _materiaRepository;
        public GenericRepository<Materia> MateriaRepository =>
            this._materiaRepository ?? (this._materiaRepository = new GenericRepository<Materia>(this._context));
        #endregion

        #region Profesor
        private GenericRepository<Profesor> _profesorRepository;
        public GenericRepository<Profesor> ProfesorRepository =>
            this._profesorRepository ?? (this._profesorRepository = new GenericRepository<Profesor>(this._context));
        #endregion

        #region Registro Alumno Materia
        private GenericRepository<Registro_Alumno_Materia> _registroAlumnoMateriaRepository;
        public GenericRepository<Registro_Alumno_Materia> RegistroAlumnoMateriaRepository =>
            this._registroAlumnoMateriaRepository ?? (this._registroAlumnoMateriaRepository = new GenericRepository<Registro_Alumno_Materia>(this._context));
        #endregion

        #region Detalle Registro Alumno Materia
        private GenericRepository<Det_Registro_Alumno_Materia> _detRegistroAlumnoMateriaRepository;
        public GenericRepository<Det_Registro_Alumno_Materia> DetRegistroAlumnoMateriaRepository =>
            this._detRegistroAlumnoMateriaRepository ?? (this._detRegistroAlumnoMateriaRepository = new GenericRepository<Det_Registro_Alumno_Materia>(this._context));
        #endregion

        #region Registro Profesor Materia
        private GenericRepository<Registro_Profesor_Materia> _registroProfesorMateriaRepository;
        public GenericRepository<Registro_Profesor_Materia> RegistroProfesorMateriaRepository =>
            this._registroProfesorMateriaRepository ?? (this._registroProfesorMateriaRepository = new GenericRepository<Registro_Profesor_Materia>(this._context));
        #endregion

        public int SaveChanges()
        {
            int response = this._context.SaveChanges();
            _context.Database.Connection.Close();
            return response;
        }
    }
}

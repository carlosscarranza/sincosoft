using System;
using System.Collections.Generic;
using System.Linq;
using System.Web.Http;
using Sinco.App.Interfaces;
using Sinco.Domain;
using Sinco.Services.Models;

namespace Sinco.Services.Controllers
{
    public class HomeController : ApiController
    {
        public HomeController(IAlumnoApp alumnoApp, IMateriaApp materiaApp, IProfesorApp profesorApp,
            IRegistroAlumnoMateriaApp registroAlumnoMateriaApp, IRegistroProfesorMateriaApp registroProfesorMateriaApp, IDetRegistroAlumnoMateriaApp detRegistroProfesorMateriaApp)
        {
            _alumnoApp = alumnoApp;
            _materiaApp = materiaApp;
            _profesorApp = profesorApp;
            _registroAlumnoMateriaApp = registroAlumnoMateriaApp;
            _registroProfesorMateriaApp = registroProfesorMateriaApp;
            _detRegistroProfesorMateriaApp = detRegistroProfesorMateriaApp;
        }

        #region Registro Profesor Materia

        [HttpPost]
        public int CreateRecordTeacherSubject(Registro_Profesor_Materia registro)
        {
            return _registroProfesorMateriaApp.Create(registro);
        }

        #endregion

        #region Alumno

        [HttpPost]
        public int CreateStudent(Alumno alumno)
        {
            return _alumnoApp.Create(alumno);
        }

        [HttpPut]
        public int UpdateStudent(Alumno alumno)
        {
            return _alumnoApp.Update(alumno);
        }

        [HttpGet]
        public IEnumerable<SPREPORTEALUMNO> GetReportStudent(int id)
        {
            IEnumerable<SPREPORTEALUMNO> resp = _alumnoApp.GetReport(id);
            return resp;
        }

        [HttpGet]
        public IEnumerable<DtoAlumno> GetAllStudent()
        {
            try
            {
                IEnumerable<Alumno> resp = _alumnoApp.GetAllStudent();
                return resp.Select(i => new DtoAlumno { Id = i.Id, Nombre = i.Nombre }).ToList();
            }
            catch (Exception e)
            {
                Console.WriteLine(e);
            }

            return null;
        }

        [HttpGet]
        public DtoAlumno GetStudent(int id)
        {
            Alumno resp = _alumnoApp.GetStudent(id);
            return resp == null ? new DtoAlumno() : new DtoAlumno { Id = resp.Id, Nombre = resp.Nombre, Semestre = resp.Semestre, Carrera = resp.Carrera };
        }

        #endregion

        #region Profesor

        [HttpPost]
        public int CreateTeacher(Profesor profesor)
        {
            return _profesorApp.Create(profesor);
        }

        [HttpDelete]
        public int DeleteTeacher(int id)
        {
            return _profesorApp.Delete(id);
        }

        [HttpGet]
        public IEnumerable<DtoProfesor> GetTeachers()
        {
            try
            {
                IEnumerable<Profesor> resp = _profesorApp.GetAll();
                return resp.Select(i => new DtoProfesor { Id = i.Id, Nombre = i.Nombre }).ToList();
            }
            catch (Exception e)
            {
                Console.WriteLine(e);
            }

            return null;
        }

        #endregion

        #region Materia

        [HttpPost]
        public int CreateSubject(Materia materia)
        {
            return _materiaApp.Create(materia);
        }

        [HttpGet]
        public IEnumerable<DtoMateria> GetSubjects()
        {
            try
            {
                IEnumerable<Materia> resp = _materiaApp.GetAll();
                return resp.Select(i => new DtoMateria { Id = i.Id, Nombre = i.Nombre }).ToList();
            }
            catch (Exception e)
            {
                Console.WriteLine(e);
            }

            return null;

        }

        #endregion

        #region Registro Alumno Materia

        [HttpPost]
        public int CreateRecordStudentSubject(Registro_Alumno_Materia registro)
        {
            return _registroAlumnoMateriaApp.Create(registro);
        }

        [HttpPut]
        public int UpdateRecordStudentSubject(Registro_Alumno_Materia registro)
        {
            return _registroAlumnoMateriaApp.Update(registro);
        }

        [HttpGet]
        public IEnumerable<DtoMateria> GetAllSubjectsRegistered()
        {
            try
            {
                IEnumerable<Materia> resp = _registroAlumnoMateriaApp.GetAllSubjectsRegistered();
                return resp?.Select(i => new DtoMateria { Id = i.Id, Nombre = i.Nombre }).ToList();
            }
            catch (Exception e)
            {
                Console.WriteLine(e);
            }

            return null;

        }

        #endregion

        #region Detalle Registro Alumno Materia

        [HttpPut]
        public int UpdateDetailRecordStudentSubject(Det_Registro_Alumno_Materia detRegistro)
        {
            return _detRegistroProfesorMateriaApp.Update(detRegistro);
        }

        #endregion

        #region Application

        private readonly IAlumnoApp _alumnoApp;
        private readonly IMateriaApp _materiaApp;
        private readonly IProfesorApp _profesorApp;
        private readonly IRegistroAlumnoMateriaApp _registroAlumnoMateriaApp;
        private readonly IRegistroProfesorMateriaApp _registroProfesorMateriaApp;
        private readonly IDetRegistroAlumnoMateriaApp _detRegistroProfesorMateriaApp;

        #endregion
    }
}
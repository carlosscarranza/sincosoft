using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Threading.Tasks;
using Sinco.App.Interfaces;
using Sinco.Domain;
using Sinco.Infra.Implementation;

namespace Sinco.App.Implementation
{
    public class AlumnoApp : IAlumnoApp
    {
        //Crear un alumno
        public int Create(Alumno alumno)
        {
            UnitOfWork.I.AlumnoRepository.Create(alumno);
            return UnitOfWork.I.SaveChanges();
        }

        //Actualizar un alumno
        public int Update(Alumno alumno)
        {
            UnitOfWork.I.AlumnoRepository.Update(alumno);
            return UnitOfWork.I.SaveChanges();
        }

        public IEnumerable<Alumno> GetAllStudent()
        {
            try
            {
                return UnitOfWork.I.AlumnoRepository.GetAll().ToList();
            }
            catch (Exception e)
            {
                Console.WriteLine(e);
            }

            return null;
        }

        //Obtener Reporte por Alumno
        public IEnumerable<SPREPORTEALUMNO> GetReport(int idAlumno)
        {
            return UnitOfWork.I.AlumnoRepository.SqlQuery<SPREPORTEALUMNO>("SPREPORTEALUMNO @ID_ALUMNO",
                new SqlParameter("ID_ALUMNO", SqlDbType.Int) {Value = idAlumno}
            );
        }

        //Obtener Alumno
        public Alumno GetStudent(int id)
        {
            return UnitOfWork.I.AlumnoRepository.FindById(id);
        }
    }
}
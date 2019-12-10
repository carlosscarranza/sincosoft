using Sinco.Domain;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Sinco.App.Interfaces
{
    public interface IAlumnoApp
    {
        int Create(Alumno alumno);

        int Update(Alumno alumno);

        IEnumerable<SPREPORTEALUMNO> GetReport(int idAlumno);

        IEnumerable<Alumno> GetAllStudent();

        Alumno GetStudent(int id);
    }
}

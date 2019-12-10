using System.Collections.Generic;
using System.Threading.Tasks;
using Sinco.Domain;

namespace Sinco.App.Interfaces
{
    public interface IRegistroAlumnoMateriaApp
    {
        int Create(Registro_Alumno_Materia registro);

        int Update(Registro_Alumno_Materia registro);

        IEnumerable<Materia> GetAllSubjectsRegistered();
    }
}
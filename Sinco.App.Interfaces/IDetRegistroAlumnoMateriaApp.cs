using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Sinco.Domain;

namespace Sinco.App.Interfaces
{
    public interface IDetRegistroAlumnoMateriaApp
    {
        int CreateRange(List<Det_Registro_Alumno_Materia> detRegistro);

        int Update(Det_Registro_Alumno_Materia detRegistro);
    }
}

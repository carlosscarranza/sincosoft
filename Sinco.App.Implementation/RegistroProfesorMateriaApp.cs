using Sinco.App.Interfaces;
using Sinco.Domain;
using Sinco.Infra.Implementation;

namespace Sinco.App.Implementation
{
    public class RegistroProfesorMateriaApp : IRegistroProfesorMateriaApp
    {
        //Asignar materias a un profesor
        public int Create(Registro_Profesor_Materia registro)
        {
            UnitOfWork.I.RegistroProfesorMateriaRepository.Create(registro);
            return UnitOfWork.I.SaveChanges();
        }
    }
}
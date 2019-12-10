using System.Collections.Generic;
using System.Threading.Tasks;
using Sinco.Domain;

namespace Sinco.App.Interfaces
{
    public interface IProfesorApp
    {
        int Create(Profesor profesor);

        int Delete(int id);

        IEnumerable<Profesor> GetAll();
    }
}
using System.Collections.Generic;
using System.Threading.Tasks;
using Sinco.Domain;

namespace Sinco.App.Interfaces
{
    public interface IMateriaApp
    {
        int Create(Materia materia);
        IEnumerable<Materia> GetAll();
    }
}
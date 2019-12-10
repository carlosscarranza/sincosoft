using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Sinco.App.Interfaces;
using Sinco.Domain;
using Sinco.Infra.Implementation;

namespace Sinco.App.Implementation
{
    public class MateriaApp : IMateriaApp
    {
        //Crear Materia
        public int Create(Materia materia)
        {
            UnitOfWork.I.MateriaRepository.Create(materia);
            return UnitOfWork.I.SaveChanges();
        }

        public IEnumerable<Materia> GetAll()
        {
            try
            {
                return UnitOfWork.I.MateriaRepository.GetAll().ToList();
            }
            catch (Exception e)
            {
                Console.WriteLine(e);
            }

            return null;
        }
    }
}
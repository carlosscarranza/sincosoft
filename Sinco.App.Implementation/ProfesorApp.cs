using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Sinco.App.Interfaces;
using Sinco.Domain;
using Sinco.Infra.Implementation;

namespace Sinco.App.Implementation
{
    public class ProfesorApp : IProfesorApp
    {
        //Crear Profesor
        public int Create(Profesor profesor)
        {
            UnitOfWork.I.ProfesorRepository.Create(profesor);
            return UnitOfWork.I.SaveChanges();
        }

        //Eliminar Profesor
        public int Delete(int id)
        {
            _ = UnitOfWork.I.ProfesorRepository.Delete(id);
            return UnitOfWork.I.SaveChanges();
        }

        public IEnumerable<Profesor> GetAll()
        {
            try
            {
                return UnitOfWork.I.ProfesorRepository.GetAll().ToList();
            }
            catch (Exception e)
            {
                Console.WriteLine(e);
            }

            return null;
        }
    }
}
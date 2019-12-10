
using System;
using System.Collections.Generic;
using Sinco.App.Interfaces;
using Sinco.Domain;
using Sinco.Infra.Implementation;

namespace Sinco.App.Implementation
{
    public class DetRegistroAlumnoMateriaApp : IDetRegistroAlumnoMateriaApp
    {
        public int CreateRange(List<Det_Registro_Alumno_Materia> detRegistro)
        {
            UnitOfWork.I.DetRegistroAlumnoMateriaRepository.CreateRange(detRegistro);
            return UnitOfWork.I.SaveChanges();
        }

        public int Update(Det_Registro_Alumno_Materia detRegistro)
        {
            try
            {
                //Buscar la entidad por id_registro
                Det_Registro_Alumno_Materia response = UnitOfWork.I.DetRegistroAlumnoMateriaRepository.Find(x =>
                    x.Id_Re_Alumno_Materia == detRegistro.Id_Re_Alumno_Materia && x.Periodo == detRegistro.Periodo);
                detRegistro.Id = response.Id;

                UnitOfWork.I.DetRegistroAlumnoMateriaRepository.Update(detRegistro);
                return UnitOfWork.I.SaveChanges();
            }
            catch (Exception e)
            {
                Console.WriteLine(e);
            }
            return 0;
        }
    }
}

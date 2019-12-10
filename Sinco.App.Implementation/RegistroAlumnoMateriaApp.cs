using System;
using System.Collections.Generic;
using System.Linq;
using Sinco.App.Interfaces;
using Sinco.Domain;
using Sinco.Infra.Implementation;

namespace Sinco.App.Implementation
{
    public class RegistroAlumnoMateriaApp : IRegistroAlumnoMateriaApp
    {
        //Asignar materias a un alumno
        public int Create(Registro_Alumno_Materia registro)
        {
            //Validar si el alumno ya tiene registrada la materia
            Registro_Alumno_Materia response = UnitOfWork.I.RegistroAlumnoMateriaRepository.Find(x =>
                x.Id_Materia == registro.Id_Materia && x.Id_Alumno == registro.Id_Alumno);

            if (response != null) return 0;

            Registro_Alumno_Materia entity = UnitOfWork.I.RegistroAlumnoMateriaRepository.CreateReturn(registro);
            UnitOfWork.I.SaveChanges();

            List<Det_Registro_Alumno_Materia> dReam = new List<Det_Registro_Alumno_Materia>(2);

            for (int i = 1; i < 3; i++)
            {
                dReam.Add(new Det_Registro_Alumno_Materia()
                {
                    Id_Re_Alumno_Materia = entity.Id,
                    Periodo = i,
                    Nota = 0
                });
            }

            UnitOfWork.I.DetRegistroAlumnoMateriaRepository.CreateRange(dReam);
            return UnitOfWork.I.SaveChanges();
        }

        //Actualizo el registro para asignar la nota de la materia de acuerdo al alumno
        public int Update(Registro_Alumno_Materia registro)
        {
            UnitOfWork.I.RegistroAlumnoMateriaRepository.Update(registro);
            return UnitOfWork.I.SaveChanges();
        }

        //Obtener las materias asignadas a un profesor
        public IEnumerable<Materia> GetAllSubjectsRegistered()
        {
            try
            {
                return UnitOfWork.I.MateriaRepository.GetAll().ToList()
                    .Join(UnitOfWork.I.RegistroProfesorMateriaRepository.GetAll().ToList(),
                        ma => ma.Id,
                        rpm => rpm.Id_Materia,
                        (ma, rpm) => new Materia { Id = ma.Id, Nombre = ma.Nombre }).ToList();
            }
            catch (Exception e)
            {
                Console.WriteLine(e);
            }

            return null;
        }
    }
}
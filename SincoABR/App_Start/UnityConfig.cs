using System.Web.Http;
using Sinco.App.Implementation;
using Sinco.App.Interfaces;
using Unity;
using Unity.WebApi;

namespace Sinco.Services
{
    public static class UnityConfig
    {
        public static void RegisterComponents()
        {
			var container = new UnityContainer();

            // register all your components with the container here
            // it is NOT necessary to register your controllers

            #region Container_Sinco

            container.RegisterType<IAlumnoApp, AlumnoApp>();
            container.RegisterType<IMateriaApp, MateriaApp>();
            container.RegisterType<IProfesorApp, ProfesorApp>();
            container.RegisterType<IRegistroAlumnoMateriaApp, RegistroAlumnoMateriaApp>();
            container.RegisterType<IRegistroProfesorMateriaApp, RegistroProfesorMateriaApp>();
            container.RegisterType<IDetRegistroAlumnoMateriaApp, DetRegistroAlumnoMateriaApp>();

            #endregion

            GlobalConfiguration.Configuration.DependencyResolver = new UnityDependencyResolver(container);
        }
    }
}
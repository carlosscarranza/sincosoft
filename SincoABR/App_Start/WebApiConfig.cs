using System.Web.Http;
using System.Web.Http.Cors;
using Newtonsoft.Json.Serialization;

namespace Sinco.Services
{
    public static class WebApiConfig
    {
        public static void Register(HttpConfiguration config)
        {
            // Web API configuration and services

            // Web API routes
            config.MapHttpAttributeRoutes();

            config.Routes.MapHttpRoute(
                "SincoApi",
                "api/{controller}/{action}/{id}",
                new {id = RouteParameter.Optional}
            );

            // Enable CORS for the Angular App
            // NOTE: Since we are running both the frontend and the backend locally, we can trust this origin with all headers and methods(the*). In practice, we would only allow really needed headers and methods
            config.EnableCors(new EnableCorsAttribute("*", "*", "*", "*"));

            // Make JSON the default formatter over XML
            config.Formatters.JsonFormatter.SerializerSettings.ContractResolver = new CamelCasePropertyNamesContractResolver();
            config.Formatters.Remove(config.Formatters.XmlFormatter);
        }
    }
}
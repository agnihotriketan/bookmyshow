using System.Web.Mvc;

namespace ShoppingCart.Areas.AppModules
{
    public class AppModulesAreaRegistration : AreaRegistration 
    {
        public override string AreaName 
        {
            get 
            {
                return "AppModules";
            }
        }

        public override void RegisterArea(AreaRegistrationContext context) 
        {
            context.MapRoute(
                "AppModules_default",
                "AppModules/{controller}/{action}/{id}",
                new { action = "Index", id = UrlParameter.Optional }
            );
        }
    }
}
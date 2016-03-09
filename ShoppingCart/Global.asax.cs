 
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Http;
using System.Web.Mvc;
using System.Web.Optimization;
using System.Web.Routing;
using System.Web.Security;
using System.Web.SessionState;

namespace ShoppingCart
{
    public class MvcApplication : System.Web.HttpApplication
    {
        protected void Application_Start()
        {
            AreaRegistration.RegisterAllAreas();
            GlobalConfiguration.Configure(WebApiConfig.Register);
            FilterConfig.RegisterGlobalFilters(GlobalFilters.Filters);
            RouteConfig.RegisterRoutes(RouteTable.Routes);
            BundleConfig.RegisterBundles(BundleTable.Bundles);

            ViewEngines.Engines.Clear(); // Clear Unused viewengines.
            ViewEngines.Engines.Add(new RazorViewEngine());

          //  Bootstrapper.Run();
        }
        protected void Application_Error()
        {
            var error = Server.GetLastError(); // Log it
        }
        protected void Application_AcquireRequestState(object sender, EventArgs e)
        {

            //Set Up SingleTon Here
        }

        protected void Application_EndRequest()
        {
            var statusCode = Response.StatusCode;
            switch (statusCode)
            {
                case 400:
                    Response.Clear();
                    Response.Redirect("~/Error");
                    break;
                case 500:

                    Response.Clear();
                    Response.Redirect("~/Error");
                    break;
                case 404:
                    Response.Clear();
                    Response.Redirect("~/Error");
                    break;
                default:
                    break;
            }
        }
    }
}

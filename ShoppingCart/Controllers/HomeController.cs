using ShoppingCart.Database;
using ShoppingCart.Models;
using System;
using System.Collections.Generic;
using System.Data.Entity;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using System.Web.Script.Serialization;

namespace ShoppingCart.Controllers
{

    [AllowAnonymous]
    public class HomeController : Controller
    {

        protected readonly DbContext _DbContext;
        // [RoutePrefix("Ketan")]
        [Route("clients")]
        public ActionResult Index()
        {
            using (var db = new BookingEntities())
            {
                var data = db.Countries;
                var list = new List<SelectListItem>();
                foreach (var item in data)
                {
                    list.Add(new SelectListItem
                    {
                        Text = item.CountryName,
                        Value = item.CountryId.ToString()
                    });
                }
                ViewBag.Country = list;
            }
            ViewBag.State = new List<SelectListItem>();
            ViewBag.City = new List<SelectListItem>();

            LoginViewModel customer = new LoginViewModel()
            {
                Email = "RajuMishra@gmail.com",
                Password = "Ketan$123"
            };

            JavaScriptSerializer serializer = new JavaScriptSerializer();
            var JsonCustomerString = serializer.Serialize(customer);
            //HttpContext.Response.ContentType = "text/json"; 
            // HttpContext.Response.Write(JsonCustomerString);

            var deSerialized = serializer.Deserialize<LoginViewModel>(JsonCustomerString);

            //context.Response.ContentType = "text/plain";
            ViewBag.JsonCustomerString = JsonCustomerString;
            ViewBag.User = new LoginViewModel
            {
                Email = "RajuMishra@gmail.com",
                Password = "Ketan$123"
            };

            return View();
        }

        public ActionResult About()
        {
            ViewBag.Message = "Your application description page.";

            return View();
        }

        public ActionResult Contact()
        {
            ViewBag.Message = "Your contact page.";

            return View();
        }
        [HttpGet]
        public ActionResult GetAction()
        {
            LoginViewModel account = new LoginViewModel()
            {
                Email = "RajuMishra@gmail.com",
                Password = "Ketan$123"
            };
            return Json(account, JsonRequestBehavior.AllowGet);
        }

        [HttpGet]
        public bool PostAction(LoginViewModel account)
        {
            if (account.Password.ToLower() == "ketan$123")
                return true;
            return false;
        }

        [ChildActionOnly]
        public string ChildActionDemo()
        {
            return "Child Action Called..";
        }

        [HttpGet]
        public ActionResult GetCountry()
        {
            try
            {
                using (var db = new BookingEntities())
                {
                    var data = db.Countries.ToList();
                    return Json(data, JsonRequestBehavior.AllowGet);
                }
            }
            catch (Exception)
            {

                throw;
            }
        }
        [HttpGet]
        public ActionResult GetState(int id)
        {
            try
            {
                using (var db = new BookingEntities())
                {
                    var data = db.States.Where(i => i.CountryId == id).ToList();
                    var list = new List<SelectListItem>();
                    foreach (var item in data)
                    {
                        list.Add(new SelectListItem
                        {
                            Text = item.StateName,
                            Value = item.StateId.ToString()
                        });
                    }

                    return Json(list, JsonRequestBehavior.AllowGet);
                }
            }
            catch (Exception)
            {

                throw;
            }
        }
        [HttpGet]
        public ActionResult GetCity(int id)
        {
            try
            {
                using (var db = new BookingEntities())
                {
                    var data = db.Cities.Where(i => i.StateId == id).ToList();
                    var list = new List<SelectListItem>();
                    foreach (var item in data)
                    {
                        list.Add(new SelectListItem
                        {
                            Text = item.CityName,
                            Value = item.CityId.ToString()
                        });
                    }

                    return Json(list, JsonRequestBehavior.AllowGet);
                }
            }
            catch (Exception)
            {

                throw;
            }
        }

    }
}
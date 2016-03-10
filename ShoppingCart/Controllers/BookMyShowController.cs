using ShoppingCart.Database;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace ShoppingCart.Controllers
{
    public class BookMyShowController : Controller
    {
        private BookingEntities db = new BookingEntities();
        // GET: BookMyShow
        public ActionResult Index()
        {

            using (var db = new BookingEntities())
            {
                var data = db.Movies;
                var list = new List<SelectListItem>();
                foreach (var item in data)
                {
                    list.Add(new SelectListItem
                    {
                        Text = item.Name,
                        Value = item.MovieId.ToString()
                    });
                }
                ViewBag.MovieName = list;
                ViewBag.TheatreName = new List<SelectListItem>();
                ViewBag.Show = new List<SelectListItem>();

                SetTicketCount(list);
            }
            return View();
        }

        private void SetTicketCount(List<SelectListItem> list)
        {
            var TicketCounts = new List<SelectListItem>();
            for (int i = 0; i < 10; i++)
            {
                TicketCounts.Add(new SelectListItem
                {
                    Text = i.ToString(),
                    Value = i.ToString()
                });
            }

            ViewBag.TicketCount = TicketCounts;
        }

        [HttpGet]
        public ActionResult GetMovies()
        {
            try
            {
                using (var db = new BookingEntities())
                {
                    var obj = db.Movies;
                    var query = obj.AsEnumerable().Select(item => new KeyValuePair<string, int>(item.Name, item.MovieId)).ToList();
                    return Json(query, JsonRequestBehavior.AllowGet);
                }
            }
            catch (Exception)
            {
                throw;
            }
        }

        [HttpGet]
        public ActionResult GetTheatre(int id)
        {
            try
            {
                using (var db = new BookingEntities())
                {
                    var data = db.MTSMappings.Where(i => i.MovieId == id).ToList().Distinct();
                    var list = new List<SelectListItem>();
                    foreach (var item in data)
                    {
                        list.Add(new SelectListItem
                        {
                            Text = item.Theatre.TheatreName,
                            Value = item.Theatre.TheatreId.ToString()
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
        public ActionResult GetShows(int id, int id2, DateTime showDate)
        {
            try
            {
                using (var db = new BookingEntities())
                {
                    var data = db.MTSMappings.Where(i => i.MovieId == id && i.TheatreId == id2 && i.StartDate <= showDate && i.EndDate >= showDate).ToList().Distinct();
                    var list = new List<SelectListItem>();
                    foreach (var item in data)
                    {
                        list.Add(new SelectListItem
                        {
                            Text = item.ShowTiming.Time.ToString(),
                            Value = item.ShowTiming.ShowId.ToString()
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
        public ActionResult GetSeatMap(int id, int id2, int id3, DateTime showDate)
        {
            try
            {
                using (var db = new BookingEntities())
                {
                    var objTh = db.Theatres.Where(i => i.TheatreId == id2).ToList();
                    var remainingSeats = objTh.Select(j => j.NoOfSeats);

                    var rows = Convert.ToInt32(objTh.FirstOrDefault().Rows.ToString());
                    var column = Convert.ToInt32(objTh.FirstOrDefault().SeatsPerRows.ToString());

                    
                    var bookedSeatsForTheShow = db.BookingSeatMappings.Where(i => i.MovieBooking.MTSMapping.MovieId == id
                                                && i.MovieBooking.MTSMapping.TheatreId == id2
                                                && i.MovieBooking.MTSMapping.ShowId == id3
                                                && i.MovieBooking.MTSMapping.StartDate <= showDate && i.MovieBooking.MTSMapping.EndDate >= showDate).ToList();
                    var SeatMaDataObj = new SeatMaData
                    {
                        Row = rows,
                        Column = column,
                        BookedSeatsForTheShow=bookedSeatsForTheShow
                    };
                    /*var seatMap = new int[rows, column];
                    for (int i = 0; i < bookedSeatsForTheShow.Count; i++)
                    {
                        seatMap[Convert.ToInt32(bookedSeatsForTheShow[i].RowNo), Convert.ToInt32(bookedSeatsForTheShow[i].ColumnNo)] = 1;
                    }*/

                    return Json(SeatMaDataObj, JsonRequestBehavior.AllowGet);
                }
            }
            catch (Exception)
            {

                throw;
            }
        }

        public class SeatMaData
        {
            public int Row { get; set; }
            public int Column { get; set; }
            public List<BookingSeatMapping> BookedSeatsForTheShow;

        }

    }
}
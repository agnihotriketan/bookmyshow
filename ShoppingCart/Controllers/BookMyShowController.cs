using ShoppingCart.DAL.InterFaces;
using ShoppingCart.DAL.Services;
using ShoppingCart.Database;
using ShoppingCart.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace ShoppingCart.Controllers
{
    [Authorize]
    public class BookMyShowController : Controller
    {
        private BookingEntities db = new BookingEntities();
        GenericCrudOperations<Country> dbCon = new GenericCrudOperations<Country>(new BookingEntities());
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
                        BookedSeatsForTheShow = bookedSeatsForTheShow
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

        [HttpPost]
        public bool FinalBookMyShow(MovieBookingViewModels data)
        {
            try
            {
                using (var db = new BookingEntities())
                {
                    var mtsId = db.MTSMappings.FirstOrDefault(i => i.MovieId == data.MovieId && i.TheatreId == data.TheatreId && i.ShowId == data.ShowId).MTSMappingId;
                    var ticketAmount = db.ShowTimings.FirstOrDefault(i => i.ShowId == data.ShowId).Rate;
                    var obj = new MovieBooking
                    {
                        UserId = User.Identity.Name,
                        MTSMappingID = mtsId,
                        TicketAmount = ticketAmount,
                        NoOfSeats = data.NoOfSeats,
                        BookingDate = DateTime.Now,
                        ShowDate = data.ShowDate
                    };
                    db.MovieBookings.Add(obj);
                    db.SaveChanges(); 

                    db.BookingSeatMappings.Add(new BookingSeatMapping {
                        BookingId=obj.BookingId,
                        SeatNo = data.RowNo + "_" + data.ColumnNo,
                        RowNo = data.RowNo,
                        ColumnNo = data.ColumnNo,
                    });

                    for (int i = 0; i < data.NoOfSeats - 1; i++)
                    {
                        db.BookingSeatMappings.Add(new BookingSeatMapping
                        {
                            BookingId = obj.BookingId,
                            SeatNo = data.RowNo + "_" + data.ColumnNo+i,
                            RowNo = data.RowNo,
                            ColumnNo = data.ColumnNo,
                        });
                    }
                    //avaibility check need to add through out the application add  handler for that 

                    db.SaveChanges();

                }
                return true;
            }
            catch (Exception)
            {
                return false;
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
using System;
using System.Collections.Generic;
using System.Data;
using System.Data.Entity;
using System.Linq;
using System.Threading.Tasks;
using System.Net;
using System.Web;
using System.Web.Mvc;
using ShoppingCart.Database;

namespace ShoppingCart.Controllers
{
    public class MTSMappingsController : Controller
    {
        private BookingEntities db = new BookingEntities();

        // GET: MTSMappings
        public async Task<ActionResult> Index()
        {
            var mTSMappings = db.MTSMappings.Include(m => m.Movie).Include(m => m.ShowTiming).Include(m => m.Theatre);
            return View(await mTSMappings.ToListAsync());
        }

        // GET: MTSMappings/Details/5
        public async Task<ActionResult> Details(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            MTSMapping mTSMapping = await db.MTSMappings.FindAsync(id);
            if (mTSMapping == null)
            {
                return HttpNotFound();
            }
            return View(mTSMapping);
        }

        // GET: MTSMappings/Create
        public ActionResult Create()
        {
            ViewBag.MovieId = new SelectList(db.Movies, "MovieId", "Name");
            ViewBag.Shows = ViewBag.ShowId = new SelectList(db.ShowTimings, "ShowId", "Time");
            ViewBag.TheatreId = new SelectList(db.Theatres, "TheatreId", "TheatreName");
            return View();
        }

        // POST: MTSMappings/Create
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public async Task<ActionResult> Create([Bind(Include = "MTSMappingId,MovieId,TheatreId,ShowId,StartDate,EndDate")] MTSMapping mTSMapping, int[] Shows)
        {
            if (ModelState.IsValid)
            {
                List<MTSMapping> mTSMappingList = new List<MTSMapping>();
                foreach (var item in Shows)
                {
                    var obj = new MTSMapping
                    {
                        ShowId = item,
                        MovieId = mTSMapping.MovieId,
                        TheatreId = mTSMapping.TheatreId,
                        StartDate = mTSMapping.StartDate,
                        EndDate = mTSMapping.EndDate
                    }; 
                    mTSMappingList.Add(obj);
                }
                db.MTSMappings.AddRange(mTSMappingList);
                await db.SaveChangesAsync();
                return RedirectToAction("Index");
            }

            ViewBag.MovieId = new SelectList(db.Movies, "MovieId", "Name", mTSMapping.MovieId);
            ViewBag.Shows = ViewBag.ShowId = new SelectList(db.ShowTimings, "ShowId", "Time", mTSMapping.ShowId);
            ViewBag.TheatreId = new SelectList(db.Theatres, "TheatreId", "TheatreName", mTSMapping.TheatreId);
            return View(mTSMapping);
        }

        // GET: MTSMappings/Edit/5
        public async Task<ActionResult> Edit(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            MTSMapping mTSMapping = await db.MTSMappings.FindAsync(id);
            if (mTSMapping == null)
            {
                return HttpNotFound();
            }
            ViewBag.MovieId = new SelectList(db.Movies, "MovieId", "Name", mTSMapping.MovieId);
            ViewBag.ShowId = new SelectList(db.ShowTimings, "ShowId", "Time", mTSMapping.ShowId);
            ViewBag.TheatreId = new SelectList(db.Theatres, "TheatreId", "TheatreName", mTSMapping.TheatreId);
            return View(mTSMapping);
        }

        // POST: MTSMappings/Edit/5
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public async Task<ActionResult> Edit([Bind(Include = "MTSMappingId,MovieId,TheatreId,ShowId,StartDate,EndDate")] MTSMapping mTSMapping)
        {
            if (ModelState.IsValid)
            {
                db.Entry(mTSMapping).State = EntityState.Modified;
                await db.SaveChangesAsync();
                return RedirectToAction("Index");
            }
            ViewBag.MovieId = new SelectList(db.Movies, "MovieId", "Name", mTSMapping.MovieId);
            ViewBag.ShowId = new SelectList(db.ShowTimings, "ShowId", "Time", mTSMapping.ShowId);
            ViewBag.TheatreId = new SelectList(db.Theatres, "TheatreId", "TheatreName", mTSMapping.TheatreId);
            return View(mTSMapping);
        }

        // GET: MTSMappings/Delete/5
        public async Task<ActionResult> Delete(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            MTSMapping mTSMapping = await db.MTSMappings.FindAsync(id);
            if (mTSMapping == null)
            {
                return HttpNotFound();
            }
            return View(mTSMapping);
        }

        // POST: MTSMappings/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public async Task<ActionResult> DeleteConfirmed(int id)
        {
            MTSMapping mTSMapping = await db.MTSMappings.FindAsync(id);
            db.MTSMappings.Remove(mTSMapping);
            await db.SaveChangesAsync();
            return RedirectToAction("Index");
        }

        protected override void Dispose(bool disposing)
        {
            if (disposing)
            {
                db.Dispose();
            }
            base.Dispose(disposing);
        }
    }
}

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
    public class ManageShowTimingsController : Controller
    {
        private BookingEntities db = new BookingEntities();

        // GET: ManageShowTimings
        public async Task<ActionResult> Index()
        {
            return View(await db.ShowTimings.ToListAsync());
        }

        // GET: ManageShowTimings/Details/5
        public async Task<ActionResult> Details(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            ShowTiming showTiming = await db.ShowTimings.FindAsync(id);
            if (showTiming == null)
            {
                return HttpNotFound();
            }
            return View(showTiming);
        }

        // GET: ManageShowTimings/Create
        public ActionResult Create()
        {
            return View();
        }

        // POST: ManageShowTimings/Create
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public async Task<ActionResult> Create([Bind(Include = "ShowId,Time,Rate")] ShowTiming showTiming)
        {
            if (ModelState.IsValid)
            {
                db.ShowTimings.Add(showTiming);
                await db.SaveChangesAsync();
                return RedirectToAction("Index");
            }

            return View(showTiming);
        }

        // GET: ManageShowTimings/Edit/5
        public async Task<ActionResult> Edit(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            ShowTiming showTiming = await db.ShowTimings.FindAsync(id);
            if (showTiming == null)
            {
                return HttpNotFound();
            }
            return View(showTiming);
        }

        // POST: ManageShowTimings/Edit/5
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public async Task<ActionResult> Edit([Bind(Include = "ShowId,Time,Rate")] ShowTiming showTiming)
        {
            if (ModelState.IsValid)
            {
                db.Entry(showTiming).State = EntityState.Modified;
                await db.SaveChangesAsync();
                return RedirectToAction("Index");
            }
            return View(showTiming);
        }

        // GET: ManageShowTimings/Delete/5
        public async Task<ActionResult> Delete(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            ShowTiming showTiming = await db.ShowTimings.FindAsync(id);
            if (showTiming == null)
            {
                return HttpNotFound();
            }
            return View(showTiming);
        }

        // POST: ManageShowTimings/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public async Task<ActionResult> DeleteConfirmed(int id)
        {
            ShowTiming showTiming = await db.ShowTimings.FindAsync(id);
            db.ShowTimings.Remove(showTiming);
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

﻿using System;
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
    public class ManageTheatresController : Controller
    {
        private BookingEntities db = new BookingEntities();

        // GET: ManageTheatres
        public async Task<ActionResult> Index()
        {
            return View(await db.Theatres.ToListAsync());
        }

        // GET: ManageTheatres/Details/5
        public async Task<ActionResult> Details(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Theatre theatre = await db.Theatres.FindAsync(id);
            if (theatre == null)
            {
                return HttpNotFound();
            }
            return View(theatre);
        }

        // GET: ManageTheatres/Create
        public ActionResult Create()
        {
            return View();
        }

        // POST: ManageTheatres/Create
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public async Task<ActionResult> Create([Bind(Include = "TheatreId,TheatreName,Rows,SeatsPerRows,IsActive,NoOfSeats")] Theatre theatre)
        {
            if (ModelState.IsValid)
            {
                db.Theatres.Add(theatre);
                await db.SaveChangesAsync();
                return RedirectToAction("Index");
            }

            return View(theatre);
        }

        // GET: ManageTheatres/Edit/5
        public async Task<ActionResult> Edit(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Theatre theatre = await db.Theatres.FindAsync(id);
            if (theatre == null)
            {
                return HttpNotFound();
            }
            return View(theatre);
        }

        // POST: ManageTheatres/Edit/5
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public async Task<ActionResult> Edit([Bind(Include = "TheatreId,TheatreName,Rows,SeatsPerRows,IsActive,NoOfSeats")] Theatre theatre)
        {
            if (ModelState.IsValid)
            {
                db.Entry(theatre).State = EntityState.Modified;
                await db.SaveChangesAsync();
                return RedirectToAction("Index");
            }
            return View(theatre);
        }

        // GET: ManageTheatres/Delete/5
        public async Task<ActionResult> Delete(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Theatre theatre = await db.Theatres.FindAsync(id);
            if (theatre == null)
            {
                return HttpNotFound();
            }
            return View(theatre);
        }

        // POST: ManageTheatres/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public async Task<ActionResult> DeleteConfirmed(int id)
        {
            Theatre theatre = await db.Theatres.FindAsync(id);
            db.Theatres.Remove(theatre);
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
using System;
using System.Collections.Generic;
using System.Data;
using System.Data.Entity;
using System.Data.Entity.Infrastructure;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Threading.Tasks;
using System.Web.Http;
using System.Web.Http.Description;
using ShoppingCart.Database;

namespace ShoppingCart.Controllers
{
    public class BookMyShowApController : ApiController
    {
        private BookingEntities db = new BookingEntities();

        // GET: api/BookMyShowApi
        public IEnumerable<KeyValuePair<string,int>> GetMovies()
        {
            var obj = db.Movies;
            var query = obj.AsEnumerable().Select(item => new KeyValuePair<string, int>(item.Name, item.MovieId)).ToList();

            return query;
        }

        // GET: api/BookMyShowApi/5
        [ResponseType(typeof(Movie))]
        public async Task<IHttpActionResult> GetMovie(int id)
        {
            Movie movie = await db.Movies.FindAsync(id);
            if (movie == null)
            {
                return NotFound();
            }

            return Ok(movie);
        }

        // PUT: api/BookMyShowApi/5
        [ResponseType(typeof(void))]
        public async Task<IHttpActionResult> PutMovie(int id, Movie movie)
        {
            if (!ModelState.IsValid)
            {
                return BadRequest(ModelState);
            }

            if (id != movie.MovieId)
            {
                return BadRequest();
            }

            db.Entry(movie).State = EntityState.Modified;

            try
            {
                await db.SaveChangesAsync();
            }
            catch (DbUpdateConcurrencyException)
            {
                if (!MovieExists(id))
                {
                    return NotFound();
                }
                else
                {
                    throw;
                }
            }

            return StatusCode(HttpStatusCode.NoContent);
        }

        // POST: api/BookMyShowApi
        [ResponseType(typeof(Movie))]
        public async Task<IHttpActionResult> PostMovie(Movie movie)
        {
            if (!ModelState.IsValid)
            {
                return BadRequest(ModelState);
            }

            db.Movies.Add(movie);
            await db.SaveChangesAsync();

            return CreatedAtRoute("DefaultApi", new { id = movie.MovieId }, movie);
        }

        // DELETE: api/BookMyShowApi/5
        [ResponseType(typeof(Movie))]
        public async Task<IHttpActionResult> DeleteMovie(int id)
        {
            Movie movie = await db.Movies.FindAsync(id);
            if (movie == null)
            {
                return NotFound();
            }

            db.Movies.Remove(movie);
            await db.SaveChangesAsync();

            return Ok(movie);
        }

        /*  protected override void Dispose(bool disposing)
          {
              if (disposing)
              {
                  db.Dispose();
              }
              base.Dispose(disposing);
          }*/

        private bool MovieExists(int id)
        {
            return db.Movies.Count(e => e.MovieId == id) > 0;
        }
    }
}
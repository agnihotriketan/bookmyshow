using ShoppingCart.Database;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace ShoppingCart.Models
{
    public class MovieBookingViewModels
    { 
        public int TheatreId { get; set; }
        public int MovieId { get; set; }
        public int ShowId { get; set; } 
        public int NoOfSeats { get; set; } 
        public DateTime ShowDate { get; set; }
        public int RowNo { get; set; }
        public int ColumnNo { get; set; } 
    }

}

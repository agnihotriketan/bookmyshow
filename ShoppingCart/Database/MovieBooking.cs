//------------------------------------------------------------------------------
// <auto-generated>
//     This code was generated from a template.
//
//     Manual changes to this file may cause unexpected behavior in your application.
//     Manual changes to this file will be overwritten if the code is regenerated.
// </auto-generated>
//------------------------------------------------------------------------------

namespace ShoppingCart.Database
{
    using System;
    using System.Collections.Generic;
    
    public partial class MovieBooking
    {
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2214:DoNotCallOverridableMethodsInConstructors")]
        public MovieBooking()
        {
            this.BookingSeatMappings = new HashSet<BookingSeatMapping>();
        }
    
        public int BookingId { get; set; }
        public string UserId { get; set; }
        public string PaidStatus { get; set; }
        public int TheatreId { get; set; }
        public int MovieId { get; set; }
        public int ShowId { get; set; }
        public double TicketAmount { get; set; }
        public int NoOfSeats { get; set; }
        public System.DateTime BookingDate { get; set; }
        public System.DateTime ShowDate { get; set; }
    
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<BookingSeatMapping> BookingSeatMappings { get; set; }
        public virtual Movie Movie { get; set; }
        public virtual ShowTiming ShowTiming { get; set; }
        public virtual Theatre Theatre { get; set; }
    }
}
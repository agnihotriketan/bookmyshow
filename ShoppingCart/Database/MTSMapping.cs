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
    
    public partial class MTSMapping
    {
        public int MTSMappingId { get; set; }
        public int MovieId { get; set; }
        public int TheatreId { get; set; }
        public int ShowId { get; set; }
        public System.DateTime StartDate { get; set; }
        public System.DateTime EndDate { get; set; }
    
        public virtual Movie Movie { get; set; }
        public virtual ShowTiming ShowTiming { get; set; }
        public virtual Theatre Theatre { get; set; }
    }
}

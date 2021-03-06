//------------------------------------------------------------------------------
// <auto-generated>
//    This code was generated from a template.
//
//    Manual changes to this file may cause unexpected behavior in your application.
//    Manual changes to this file will be overwritten if the code is regenerated.
// </auto-generated>
//------------------------------------------------------------------------------

namespace QLBH
{
    using System;
    using System.Collections.Generic;
    
    public partial class Product
    {
        public Product()
        {
            this.OrderDetails = new HashSet<OrderDetail>();
        }
    
        public int ProID { get; set; }
        public string ProName { get; set; }
        public string TinyDes { get; set; }
        public string FullDes { get; set; }
        public decimal Price { get; set; }
        public int CatID { get; set; }
        public int Quantity { get; set; }
        public Nullable<int> PageView { get; set; }
        public Nullable<int> SaleQuantity { get; set; }
        public Nullable<int> TypeID { get; set; }
        public string Origin { get; set; }
    
        public virtual Category Category { get; set; }
        public virtual TypeProduct TypeProduct { get; set; }
        public virtual ICollection<OrderDetail> OrderDetails { get; set; }
    }
}

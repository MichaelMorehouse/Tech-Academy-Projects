using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Web;

namespace ACME.Models
{
    [MetadataType(typeof(Product.Metadata))]
    public partial class Product
    {
        class Metadata
        {
            [Key]
            public System.Guid ProductId { get; set; }

            [Required]
            [Display(Name = "Product Name")]
            [StringLength(10)]
            public string Name { get; set; }

            [Required]
            [RegularExpression(@"^\$?\d+(\.(\d{2}))?$")]
            public decimal Price { get; set; }
        }
    }
}
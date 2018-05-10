using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using System.Linq;
using System.Web;

namespace ContosoUniversity.Models
{
    public class Classroom
    {
        [Key]
        [Required]
        [Column(Order = 1)]
        public string BuildingName { get; set; }
        [Key]
        [Required]
        [Column(Order = 2)]
        public int RoomNumber { get; set; }

        public virtual ICollection<Course> Courses { get; set; }

        [Display(Name = "Room Name")]
        public string RoomName
        {
            get
            {
                return BuildingName + " " + RoomNumber;
            }
        }
    }
}
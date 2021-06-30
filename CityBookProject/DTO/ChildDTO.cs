using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DTO
{
   public class ChildDTO
    {
        public int ChildId { get; set; }
        public Nullable<int> ParentId { get; set; }
        public string ChildName { get; set; }
        public string ChildTz { get; set; }
        public Nullable<System.DateTime> ChildBornDate { get; set; }

       
    }
}

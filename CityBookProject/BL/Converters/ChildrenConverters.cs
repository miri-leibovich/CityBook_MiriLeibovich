using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using DAL;
using DTO;
namespace BL.Converters
{
    class ChildrenConverters
    {
        public List<Children> GetChildren(List<ChildDTO> childrenDTO)
        {
            List<Children> Children = new List<Children>();
            foreach (var child in childrenDTO)
            {
                Children c = new Children();
                c.ChildName = child.ChildName;
                c.ChildTz = child.ChildTz;
                c.ChildBornDate = child.ChildBornDate;
                Children.Add(c);
            }
            return Children;
        }
    }
}

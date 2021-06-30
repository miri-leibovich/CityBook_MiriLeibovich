using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using DTO;

namespace BL
{
   public class UserBL
    {
        public static void AddUser(UserDTO userDTO)
        {
            DAL.UserDal userDal = new DAL.UserDal();
            List<DTO.ChildDTO > c= new List<DTO.ChildDTO>();
            c = userDTO.Children.ToList();
            userDal.AddUser(new Converters.UserConverters().GetUser(userDTO),new Converters.ChildrenConverters().GetChildren(c));

        }
    }
}

using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using DTO;
using DAL;
namespace BL.Converters
{
    class UserConverters
    {
        public DAL.User GetUser(UserDTO userDTO)
        {
            User user = new User();
            user.UserFirstName = userDTO.UserFirstName;
            user.UserLastName = userDTO.UserLastName;
            user.UserTz = userDTO.UserTz;
            user.BornDate = userDTO.BornDate;
            user.MaleOrFemale = userDTO.MaleOrFemale;
            user.HMO = userDTO.HMO;
            return user;


        }
        
    }
}

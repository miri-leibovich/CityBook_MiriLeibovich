using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DAL
{
    public class UserDal
    {
        public void AddUser(User user, List<Children> ChildrenList)
        {
            using (CityBookUsersEntities entities = new CityBookUsersEntities())
            {
                try
                {
                    entities.User.Add(user);
                    entities.SaveChanges();
                    AddChildren(user, ChildrenList);

                }
                catch (Exception)
                {
                    throw;
                }

            }

        }
        public void AddChildren(User user, List<Children> ChildrenList)
        {
            using (CityBookUsersEntities entities = new CityBookUsersEntities())
            {
                try
                {
                    User u = entities.User.FirstOrDefault(us=>us.UserTz==user.UserTz);
                    foreach (var child in ChildrenList)
                    {
                        child.ParentId = u.UserId;
                        //child.ChildBornDate = DateTime.Now;
                        entities.Children.Add(child);
                    }
                    entities.SaveChanges();

                }
                catch (Exception)
                {
                    throw;
                }

            }

        }

    }
}

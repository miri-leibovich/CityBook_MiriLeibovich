using BL;
using DTO;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Web.Http;

namespace API.Controllers
{
    [System.Web.Http.Cors.EnableCors(origins: "*", headers: "*", methods: "*")]
    public class AddUserController : ApiController
    {
        // GET: api/AddUser
        public IEnumerable<string> Get()
        {
            return new string[] { "value1", "value2" };
        }

        // GET: api/AddUser/5
        public string Get(int id)
        {
            return "value";
        }

        // POST: api/AddUser
        public void Post([FromBody]UserDTO userDTO)
        {
            UserBL.AddUser(userDTO);
        }

        // PUT: api/AddUser/5
        public void Put(int id, [FromBody]string value)
        {
        }

        // DELETE: api/AddUser/5
        public void Delete(int id)
        {
        }
    }
}

using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Runtime.Serialization;
using System.Web.Http;

namespace WebServiceRest.Controllers
{
    public class UserDataController : VBController
    {
        
        //GET: api/userData/5
        public IHttpActionResult Get(string email)
        {
            UserData userData = DB.UserDatas.Where(u => u.Email == email).FirstOrDefault();
            if(userData == null)
            {
                return NotFound();
            }
            return Ok(userData);
        }

        //POST: api/userData/
        public IHttpActionResult PostUser([FromBody]UserData u)
        {
            DB.UserDatas.Add(u);
            DB.SaveChanges();
            return Ok(u);
        }

    }
}

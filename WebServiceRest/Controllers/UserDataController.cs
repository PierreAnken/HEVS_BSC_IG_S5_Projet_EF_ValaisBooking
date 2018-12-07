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

        //GET: api/userData?email=pierre.anken@gmail.com
        public IHttpActionResult GetUserFromEmail(string email)
        {
            UserData userData = DB.UserDatas.Where(u => u.Email == email).FirstOrDefault();
            if(userData == null)
            {
                return NotFound();
            }
            return Ok(userData);
        }

        //POST: api/userData/
        public IHttpActionResult PostUser([FromBody]UserData newUser)
        {

            if (string.IsNullOrEmpty(newUser.Email) || string.IsNullOrEmpty(newUser.PasswordMd5))
                return BadRequest();

            if (DB.UserDatas.Where(u => u.Email == newUser.Email).Count() == 0) { 
                DB.UserDatas.Add(newUser);
                DB.SaveChanges();
                return Ok(newUser);
            }
            else
            {
                return Conflict();
            }
        }
    }
}

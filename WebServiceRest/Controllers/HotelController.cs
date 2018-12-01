﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Runtime.Serialization;
using System.Web.Http;
using System.Data.Entity;

namespace WebServiceRest.Controllers
{
    public class HotelController : VBController
    {
        //GET: api/Hotel/Occupation/5?date=2018-11-24T00:00:00
        [Route("api/Hotel/Occupation/{id}")]
        public IHttpActionResult GetHotelOccupationAtDateFromId(int id, [FromUri] DateTime date)
        {
            return Ok((double)DB.GetHotelOccupationAtDateFromId(date, id).FirstOrDefault());
        }

        //GET: api/Hotel/5
        public IHttpActionResult Get(int id)
        {
            Hotel hotel = DB.Hotels.Where(h => h.IdHotel == id).FirstOrDefault();
            if(hotel == null)
            {
                hotel = new Hotel();
            }
            return Ok(hotel);
        }
        //GET: api/Hotel/
        public IHttpActionResult GetAllHotel()
        {
            return Ok(DB.Hotels.ToList());
        }

       

    }
}

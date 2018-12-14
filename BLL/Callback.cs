using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace BLL
{
    public interface ICallback
    {
        bool OnResponse(bool success);
    }

    public class Callback : ICallback
    {
      
        bool ICallback.OnResponse(bool success)
        {
            return success;
        }
    }
}

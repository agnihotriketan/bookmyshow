using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace ShoppingCart.DAL.InterFaces
{
    interface ILogExceptionHandler
    {
        void LogExceptionAsync(Exception exception, string category);
        void LogErrorAsync(Exception exception, string category);
    }
}

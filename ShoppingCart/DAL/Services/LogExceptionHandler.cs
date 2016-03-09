using ShoppingCart.DAL.InterFaces;
using System;

namespace ShoppingCart.DAL.Services
{
    public class LogExceptionHandler : ILogExceptionHandler
    {
        public void LogErrorAsync(Exception exception, string category)
        {
            throw new NotImplementedException();
        }

        public void LogExceptionAsync(Exception exception, string category)
        {
            throw new NotImplementedException();
        }
    }
}

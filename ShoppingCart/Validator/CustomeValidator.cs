using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace ShoppingCart.Validator
{
    class CustomeValidator
    {
    }

    public class MaximumPassengersAllowed : ValidationAttribute
    {
        public MaximumPassengersAllowed(int maxPassengers, params string[] passengerTypes)
        {
            PassengerTypes = passengerTypes;
            MaxPassengers = maxPassengers;
        }

        public int MaxPassengers { get; private set; }

        public string[] PassengerTypes { get; private set; }

        protected override ValidationResult IsValid(object value, ValidationContext validationContext)
        {
            var properties = PassengerTypes.Select(validationContext.ObjectType.GetProperty);
            try
            {
                var propValues = properties.Select(p => p.GetValue(validationContext.ObjectInstance, null)).OfType<uint>();
                var totalPax = propValues.Sum(p => p);
                if (totalPax > MaxPassengers)
                {
                    return new ValidationResult(FormatErrorMessage(validationContext.DisplayName));
                }
            }
            catch (Exception)
            {
                return new ValidationResult(string.Format("Property {0} is not bool", PassengerTypes[0]));
            }
            return null;
        }

    }

    /*
    Sample Usage  
    [Range(1, 9, ErrorMessage = "Minimum {1} Adult should be selected")]
        [CustomValidations.MaximumPassengersAllowed(9, "Adult", "Child", ErrorMessage = "Maximum 9 passengers are allowed")]
        public uint Adult { get; set; }
    */
}

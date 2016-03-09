using System;
using System.Collections.Generic;
using System.Linq;
using System.Linq.Expressions;
using System.Text;
using System.Threading.Tasks;
using System.Web;
using System.Web.Mvc;
using System.Web.Mvc.Html;

namespace CustomHelpers
{
    public static class HtmlHelperExtensions
    {
        public static MvcHtmlString CustomTextBox(this HtmlHelper htmlHelper, string name, string value, string inputClass)
        {
            var builder = new TagBuilder("input");
            builder.MergeAttribute("type", "text");
            builder.MergeAttribute("name", name);
            builder.MergeAttribute("value", value);
            builder.MergeAttribute("class", inputClass); 
            return MvcHtmlString.Create(builder.ToString(TagRenderMode.SelfClosing));
        }
    }
}

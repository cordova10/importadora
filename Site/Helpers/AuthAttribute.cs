using Site.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using System.Web.Security;

namespace Site.Helpers
{
    public class AuthAttribute : AuthorizeAttribute
    {
        public override void OnAuthorization(AuthorizationContext filterContext)
        {
            if (!filterContext.HttpContext.User.Identity.IsAuthenticated)
                FormsAuthentication.RedirectToLoginPage();
            Usuario usr = filterContext.HttpContext.Session["usr"] as Usuario;
            if (usr == null)
            {
                FormsAuthentication.SignOut();
                FormsAuthentication.RedirectToLoginPage();
            }

            base.OnAuthorization(filterContext);
        }
    }
}
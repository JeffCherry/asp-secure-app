using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.Security;
using NorthwindEFModel;

public partial class Login : PageBase
{
    protected override void Page_Load(object sender, EventArgs e)
    {
        base.Page_Load(sender, e);

    }

    protected void lgin_Authenticate(object s, AuthenticateEventArgs e)
    {
        string useName = lgnApp.UserName;
        string password = lgnApp.Password;

        using (NorthwindEntities entityContext = new NorthwindEntities())
        {
            Employee em = (from emp in entityContext.Employees
                           where emp.LastName == useName.ToUpper()
                           && emp.PostalCode.Trim() == password
                           select emp).FirstOrDefault<Employee>();
            if (em != null)
            {
                FormsAuthentication.RedirectFromLoginPage(em.EmployeeID.ToString(),
                lgnApp.RememberMeSet);

                string returnUrl = Request.QueryString["Welcome/Landing.aspx"];

                // check if it exists, if not then redirect to default page
                if (returnUrl == null) returnUrl = "~/Login.aspx";
                Response.Redirect(returnUrl);
            }
        }
    }

    protected void Unnamed_PreRender(object sender, EventArgs e)
    {
        Response.Redirect("Welcome/Landing.aspx");
    }
}
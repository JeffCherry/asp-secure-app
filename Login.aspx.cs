using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.Security;
using NorthwindEFModel;

public partial class Login : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
      
    }

    protected void lgin_Authenticate(object s, AuthenticateEventArgs e)
    {
        string useName = lgnApp.UserName;
        string password = lgnApp.Password;
      
        using (NorthwindEntities entityContext = new NorthwindEntities())
        {
            Employee em = (from emp in entityContext.Employees
                           where emp.LastName == useName.ToUpper()
                           && emp.Password == password
                           select emp).FirstOrDefault<Employee>();
            if (em != null)
            {
                FormsAuthentication.RedirectFromLoginPage(em.EmployeeID.ToString(),
                lgnApp.RememberMeSet);
            }
        }
    }
}
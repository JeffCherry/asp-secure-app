using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI.WebControls;
using NorthwindEFModel;

public class PageBase : System.Web.UI.Page
{
    protected virtual void Page_Load(object sender, EventArgs e)
    {
        Master.FindControl("topNav").Visible = false;
        Master.FindControl("sideNav").Visible = false;
        LinkButton btnEmp = (LinkButton)Master.FindControl("btnEmployees");
        LinkButton btnCust = (LinkButton)Master.FindControl("btnCustomers");
        LinkButton btnOrd = (LinkButton)Master.FindControl("btnOrders");

        if (Request.IsAuthenticated)
        {
          Master.FindControl("topNav").Visible = true;
          Master.FindControl("sideNav").Visible = true;
            NorthwindEntities ne = new NorthwindEntities();
            int id = int.Parse(User.Identity.Name);
            Employee emp = (from em in ne.Employees
                            where em.EmployeeID == id
                            select em).FirstOrDefault<Employee>();
            Label lblIdentity = (Label)Master.FindControl("lblWhoAmI");
            lblIdentity.Text = emp.FirstName + " " + emp.LastName; 

        }
        if (User.IsInRole("Admin"))
        { 
            btnEmp.Visible = true;
            btnCust.Visible = true;
            btnOrd.Visible = true;
        }
        if (User.IsInRole("User"))
        {
            btnEmp.Visible = false;
            btnCust.Visible = true;
            btnOrd.Visible = true;
        }
    }
}
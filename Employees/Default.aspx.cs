using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using NorthwindEFModel;

public partial class Customers_Default : PageBase
{
    protected override void Page_Load(object sender, EventArgs e)
    {
        base.Page_Load(sender, e);
        GridBind();
    }

    protected void GridBind()
    {
        NorthwindEntities ne = new NorthwindEntities();

        var employees = (from e in ne.Employees
                         select e).ToList<Employee>();

        grdEmp.DataSource = employees;
        grdEmp.DataBind();
    }

    protected void btnAddEmployee_Click(object sender, EventArgs e)
    {
        pnlList.Visible = false;
        pnlInfo.Visible = true;
        infoTitle.Text = "Create Employee";
        btnAdd.Visible = true;
        txtID.ReadOnly = true;

        NorthwindEntities ne = new NorthwindEntities();

        var employees = (from em in ne.Employees
                         select em).ToList<Employee>();
        int newID = employees.Count + 1;
        txtID.Text = newID.ToString();
    }

    protected void btnBack_Click(object sender, EventArgs e)
    {
        pnlList.Visible = true;
        pnlInfo.Visible = false;
        btnDelete.Visible = false;
        btnAdd.Visible = false;
        btnUpdate.Visible = false;
        txtAddress.Text = "";
        txtCity.Text = "";
        txtLastName.Text = "";
        txtFirstName.Text = "";
        txtTitle.Text = "";
        txtBirthDate.Text = "";
        txtCountry.Text = "";
        txtID.Text = "";
        txtPhone.Text = "";
        txtPostal.Text = "";
    }

    protected void grdEmp_SelectedIndexChanged(object sender, EventArgs e)
    {
        NorthwindEntities ne = new NorthwindEntities();
        int id =(int)grdEmp.SelectedDataKey.Value;
        txtID.ReadOnly = true;
         Employee employee = (from em in ne.Employees
                             where em.EmployeeID == id
                             select em).FirstOrDefault<Employee>();
        Role role = (from r in ne.Roles
                     where r.EmployeeID == id
                     select r).FirstOrDefault<Role>();

        txtAddress.Text = employee.Address;
        txtCity.Text = employee.City;
        txtLastName.Text = employee.LastName;
        txtFirstName.Text = employee.FirstName;
        txtBirthDate.Text = employee.BirthDate.Value.ToShortDateString();
        txtTitle.Text = employee.Title;
        txtCountry.Text = employee.Country;
        txtID.Text = employee.EmployeeID.ToString();
        txtPhone.Text = employee.HomePhone;
        txtPostal.Text = employee.PostalCode;
        if(role.Role1 == "User") { btnListRoles.SelectedValue = "User"; }
        if (role.Role1 == "Admin") { btnListRoles.SelectedValue = "Admin"; }
        pnlList.Visible = false;
        pnlInfo.Visible = true;
        btnAdd.Visible = false;
        btnUpdate.Visible = true;
        btnDelete.Visible = true;
        infoTitle.Text = "Employee Details";
    }

    protected void btnAdd_Click(object sender, EventArgs e)
    {
        NorthwindEntities ne = new NorthwindEntities();
        Employee employee = new Employee();
        Role role = new Role();

        employee.Address = txtAddress.Text;
        employee.City = txtCity.Text;
        employee.LastName = txtLastName.Text;
        employee.FirstName = txtFirstName.Text;
        employee.BirthDate = DateTime.Parse(txtBirthDate.Text);
        employee.Title = txtTitle.Text;
        employee.Country = txtCountry.Text;
        employee.EmployeeID = int.Parse(txtID.Text);
        employee.HomePhone = txtPhone.Text;
        employee.PostalCode = txtPostal.Text;
        ne.Employees.Add(employee);
        role.EmployeeID = int.Parse(txtID.Text);
        role.Role1 = btnListRoles.SelectedValue;
        ne.Roles.Add(role);
        ne.SaveChanges();

        pnlList.Visible = true;
        pnlInfo.Visible = false;
        GridBind();
        ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage", "alert('Employee Created!')", true);
        btnBack_Click(sender, e);
    }

    protected void btnUpdate_Click(object sender, EventArgs e)
    {
        int id = int.Parse(txtID.Text);
        NorthwindEntities ne = new NorthwindEntities();
        Employee employee = (from em in ne.Employees
                             where em.EmployeeID == id
                             select em).FirstOrDefault<Employee>();

        Role role = (from r in ne.Roles
                     where r.EmployeeID == id
                     select r).FirstOrDefault<Role>();

        employee.Address = txtAddress.Text;
        employee.City = txtCity.Text;
        employee.LastName = txtLastName.Text;
        employee.FirstName = txtFirstName.Text;
        employee.BirthDate = DateTime.Parse(txtBirthDate.Text);
        employee.Title = txtTitle.Text;
        employee.Country = txtCountry.Text;
        employee.EmployeeID = int.Parse(txtID.Text);
        employee.HomePhone = txtPhone.Text;
        employee.PostalCode = txtPostal.Text;
        role.Role1 = btnListRoles.SelectedValue;
        ne.SaveChanges();

        pnlList.Visible = true;
        pnlInfo.Visible = false;
        GridBind();
        ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage", "alert('Employee Updated!')", true);
        btnBack_Click(sender, e);
    }

    protected void btnDelete_Click(object sender, EventArgs e)
    {
        int id = int.Parse(txtID.Text);
        NorthwindEntities ne = new NorthwindEntities();
        Employee employee = (from em in ne.Employees
                             where em.EmployeeID == id
                             select em).FirstOrDefault<Employee>();

        Role role = (from r in ne.Roles
                     where r.EmployeeID == id
                     select r).FirstOrDefault<Role>();

        ne.Employees.Remove(employee);
        ne.Roles.Remove(role);
        ne.SaveChanges();

        pnlList.Visible = true;
        pnlInfo.Visible = false;
        GridBind();
        ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage", "alert('Employee Deleted!')", true);
        btnBack_Click(sender, e);

    }
}
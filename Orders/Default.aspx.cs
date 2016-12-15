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
        Page.Title = "Orders";
        base.Page_Load(sender, e);
        GridBind();
    }

    protected void GridBind()
    {
        NorthwindEntities ne = new NorthwindEntities();

        var orders = (from o in ne.Orders
                         select o).ToList<Order>();

        grdOrd.DataSource = orders;
        grdOrd.DataBind();
    }
    
    protected void btnAddOrder_Click(object sender, EventArgs e)
    {
        NorthwindEntities ne = new NorthwindEntities();
        divID.Visible = false;
        
        int id = int.Parse(User.Identity.Name);
        Employee emp = (from em in ne.Employees
                        where em.EmployeeID == id
                        select em).FirstOrDefault<Employee>();

        var customers = (from c in ne.Customers
                         select new{
                             CCompanyName = c.CompanyName
                         }).ToList();
        drpCust.DataSource = customers;
        drpCust.DataTextField = "CCompanyName";
        drpCust.DataBind();

        var shippers = (from s in ne.Shippers
                        select new {
                            SCompanyName = s.CompanyName
                        }).ToList();
        drpShip.DataSource = shippers;
        drpShip.DataTextField = "SCompanyName";
        drpShip.DataBind();

        pnlList.Visible = false;
        pnlInfo.Visible = true;
        infoTitle.Text = "Create Order";
        txtCustomer.Visible = false;
        drpCust.Visible = true;
        txtShipper.Visible = false;
        txtEmployee.Text = emp.FirstName + " " + emp.LastName;
        drpShip.Visible = true;
        btnAdd.Visible = true;
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
        txtEmployee.Text = "";
        txtCustomer.Text = "";
        txtShipper.Text = "";
        txtODate.Text = "";
        txtCountry.Text = "";
        txtID.Text = "";
        txtSDate.Text = "";
        txtPostal.Text = "";
    }

    protected void grdOrd_SelectedIndexChanged(object sender, EventArgs e)
    {
        NorthwindEntities ne = new NorthwindEntities();
        divID.Visible = true;
        int id = (int)grdOrd.SelectedDataKey.Value;
        txtID.ReadOnly = true;
        Order order = (from o in ne.Orders
                             where o.OrderID == id
                             select o).FirstOrDefault<Order>();

        txtCustomer.Text = order.Customer.CompanyName;
        txtEmployee.Text = order.Employee.FirstName + " " + order.Employee.LastName;
        txtAddress.Text = order.ShipAddress;
        txtCity.Text = order.ShipCity;
        txtODate.Text = order.OrderDate.Value.ToShortDateString();
        txtSDate.Text = order.ShippedDate.Value.ToShortDateString();
        txtCountry.Text = order.ShipCountry;
        txtID.Text = order.OrderID.ToString();
        txtShipper.Text = order.Shipper.CompanyName;
        txtPostal.Text = order.ShipPostalCode;
        pnlList.Visible = false;
        pnlInfo.Visible = true;
        txtCustomer.Visible = true;
        drpCust.Visible = false;
        txtShipper.Visible = true;
        drpShip.Visible = false;
        btnAdd.Visible = false;
        btnUpdate.Visible = true;
        btnDelete.Visible = true;
        infoTitle.Text = "Order Details";
    }

    protected void btnAdd_Click(object sender, EventArgs e)
    {
        NorthwindEntities ne = new NorthwindEntities();
        Order order = new Order();

        string cName = drpCust.SelectedItem.Text;
        Customer customer = (from c in ne.Customers
                             where c.CompanyName == cName
                             select c).FirstOrDefault<Customer>();

        string sName = drpShip.SelectedItem.Text;
        Shipper shipper = (from s in ne.Shippers
                             where s.CompanyName == sName
                             select s).FirstOrDefault<Shipper>();

        int id = int.Parse(User.Identity.Name);
        Employee emp = (from em in ne.Employees
                        where em.EmployeeID == id
                        select em).FirstOrDefault<Employee>();

        order.ShipAddress = txtAddress.Text;
        order.ShipCity = txtCity.Text;
        order.Employee = emp;
        order.OrderDate = DateTime.Parse(txtODate.Text);
        order.ShippedDate = DateTime.Parse(txtSDate.Text);
        order.ShipCountry = txtCountry.Text;
        order.ShipPostalCode = txtPostal.Text;
        order.Customer = customer;
        order.Shipper = shipper;
        ne.Orders.Add(order);
        ne.SaveChanges();

        pnlList.Visible = true;
        pnlInfo.Visible = false;
        GridBind();
        ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage", "alert('Order Created!')", true);
        btnBack_Click(sender, e);
    }

    protected void btnUpdate_Click(object sender, EventArgs e)
    {
        int id = int.Parse(txtID.Text);
        NorthwindEntities ne = new NorthwindEntities();
        Order order = (from o in ne.Orders
                       where o.OrderID == id
                       select o).FirstOrDefault<Order>();

        string name = txtEmployee.Text.Remove(2);
        Employee employee = (from em in ne.Employees
                             where em.FirstName.Remove(2) == name
                             select em).FirstOrDefault<Employee>();

        string cName = txtCustomer.Text;
        Customer customer = (from c in ne.Customers
                             where c.CompanyName == cName
                             select c).FirstOrDefault<Customer>();

        string sName = txtShipper.Text;
        Shipper shipper = (from s in ne.Shippers
                           where s.CompanyName == sName
                           select s).FirstOrDefault<Shipper>();

        txtID.ReadOnly = true;
        order.ShipAddress = txtAddress.Text;
        order.ShipCity = txtCity.Text;
        order.Employee = employee;
        order.OrderDate = DateTime.Parse(txtODate.Text);
        order.ShippedDate = DateTime.Parse(txtSDate.Text);
        order.ShipCountry = txtCountry.Text;
        order.ShipPostalCode = txtPostal.Text;
        order.Customer = customer;
        order.Shipper = shipper;
        ne.SaveChanges();
        pnlList.Visible = true;
        pnlInfo.Visible = false;
        GridBind();
        ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage", "alert('Order Updated!')", true);
        btnBack_Click(sender, e);
    }

    protected void btnDelete_Click(object sender, EventArgs e)
    {
        int id = int.Parse(txtID.Text);
        NorthwindEntities ne = new NorthwindEntities();
        Order order = (from o in ne.Orders
                       where o.OrderID == id
                       select o).FirstOrDefault<Order>();

        ne.Orders.Remove(order);
        ne.SaveChanges();

        pnlList.Visible = true;
        pnlInfo.Visible = false;
        GridBind();
        ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage", "alert('Order Deleted!')", true);
        btnBack_Click(sender, e);

    }
}
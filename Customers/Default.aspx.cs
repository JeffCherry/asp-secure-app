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

        var customers = (from c in ne.Customers
                         select c).ToList<Customer>();

        grdCust.DataSource = customers;
        grdCust.DataBind();
    }

    protected void grdCust_PageIndexChanging(object sender, GridViewPageEventArgs e)
    {
        grdCust.PageIndex = e.NewPageIndex;
        GridBind();
    }

    protected void btnSearch_Click(object sender, EventArgs e)
    {
        NorthwindEntities ne = new NorthwindEntities();
        var results = (from c in ne.Customers
                       where c.CustomerID.Contains(txtSearch.Text) ||
                       c.CompanyName.Contains(txtSearch.Text)
                       select c).ToList<Customer>();

        if (results.Count == 0)
        {
            noResults.Visible = true;
            grdCust.DataSource = results;
            grdCust.DataBind();
            btnSearchClear.Visible = true;
        }
        else
        {
            grdCust.DataSource = results;
            grdCust.DataBind();
            btnSearchClear.Visible = true;
        }
    }

    protected void btnSearchClear_Click(object sender, EventArgs e)
    {
        GridBind();
        txtSearch.Text = "";
        btnSearchClear.Visible = false;
        noResults.Visible = false;
    }

    protected void btnAddCustomer_Click(object sender, EventArgs e)
    {
        pnlList.Visible = false;
        pnlInfo.Visible = true;
        infoTitle.Text = "Create New Customer";
        btnAdd.Visible = true;
        var container = Master.FindControl("ContentPlaceHolder1");
        TextBox control = (TextBox)container.FindControl("txtCompanyName");
        txtCompanyName.TextChanged += Company_TextChanged;
        control.TextChanged += Company_TextChanged;
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
        txtCompanyName.Text = "";
        txtContactName.Text = "";
        txtContactTitle.Text = "";
        txtCountry.Text = "";
        txtID.Text = "";
        txtPhone.Text = "";
        txtPostal.Text = "";
    }

    protected void grdCust_SelectedIndexChanged(object sender, EventArgs e)
    {
        NorthwindEntities ne = new NorthwindEntities();
        string selectedKey = grdCust.SelectedDataKey.Value.ToString();
        Customer customer = (from c in ne.Customers
                             where c.CustomerID == selectedKey
                             select c).FirstOrDefault<Customer>();
        txtAddress.Text = customer.Address;
        txtCity.Text = customer.City;
        txtCompanyName.Text = customer.CompanyName;
        txtContactName.Text = customer.ContactName;
        txtContactTitle.Text = customer.ContactTitle;
        txtCountry.Text = customer.Country;
        txtID.Text = customer.CustomerID;
        txtPhone.Text = customer.Phone;
        txtPostal.Text = customer.PostalCode;
        pnlList.Visible = false;
        pnlInfo.Visible = true;
        btnAdd.Visible = false;
        btnUpdate.Visible = true;
        btnDelete.Visible = true;
        infoTitle.Text = "Customer Details";
    }

    protected void btnAdd_Click(object sender, EventArgs e)
    {
        NorthwindEntities ne = new NorthwindEntities();
        Customer customer = new Customer();

        customer.Address = txtAddress.Text;
        customer.City = txtCity.Text;
        customer.CompanyName = txtCompanyName.Text;
        customer.ContactName = txtContactName.Text;
        customer.ContactTitle = txtContactTitle.Text;
        customer.Country = txtCountry.Text;
        customer.CustomerID = txtID.Text;
        customer.Phone = txtPhone.Text;
        customer.PostalCode = txtPostal.Text;
        ne.Customers.Add(customer);
        ne.SaveChanges();

        pnlList.Visible = true;
        pnlInfo.Visible = false;
        GridBind();

    }

    protected void btnUpdate_Click(object sender, EventArgs e)
    {
        NorthwindEntities ne = new NorthwindEntities();
        Customer customer = (from c in ne.Customers
                             where c.CustomerID == txtID.Text
                             select c).FirstOrDefault<Customer>();

        customer.Address = txtAddress.Text;
        customer.City = txtCity.Text;
        customer.CompanyName = txtCompanyName.Text;
        customer.ContactName = txtContactName.Text;
        customer.ContactTitle = txtContactTitle.Text;
        customer.Country = txtCountry.Text;
        customer.CustomerID = txtID.Text;
        customer.Phone = txtPhone.Text;
        customer.PostalCode = txtPostal.Text;
        ne.SaveChanges();

        pnlList.Visible = true;
        pnlInfo.Visible = false;
        GridBind();
    }

    protected void btnDelete_Click(object sender, EventArgs e)
    {
        NorthwindEntities ne = new NorthwindEntities();
        Customer customer = (from c in ne.Customers
                             where c.CustomerID == txtID.Text
                             select c).FirstOrDefault<Customer>();
        ne.Customers.Remove(customer);
        ne.SaveChanges();

        pnlList.Visible = true;
        pnlInfo.Visible = false;
        GridBind();
    }

    protected void Company_TextChanged(object sender, EventArgs e)
    {
        string id = txtCompanyName.Text.Remove(5);
        txtID.Text = id.ToUpper();
    }
}
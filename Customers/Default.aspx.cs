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
        btnUpdate.Visible = true;
        btnDelete.Visible = true;
        infoTitle.Text = "Customer Details";
    }
}
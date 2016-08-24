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
        NorthwindEntities ne = new NorthwindEntities();

        var customers = (from c in ne.Customers
                        select c).ToList<Customer>();

        grdCust.DataSource = customers;
        grdCust.DataBind();
    }

    protected void grdCust_PageIndexChanging(object sender, GridViewPageEventArgs e)
    {
        grdCust.PageIndex = e.NewPageIndex;
    }
}
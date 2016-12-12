<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="Default.aspx.cs" Inherits="Customers_Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
 <script type="text/javascript">
 function MakeStaticHeader(gridId, height, width, headerHeight, isFooter) {
 var tbl = document.getElementById(gridId);
 if (tbl) {
 var DivHR = document.getElementById('DivHeaderRow');
 var DivMC = document.getElementById('DivMainContent');
 var DivFR = document.getElementById('DivFooterRow');

 //*** Set divheaderRow Properties ****
 DivHR.style.height = headerHeight + 'px';
 DivHR.style.width = (parseInt(width) - 16) + 'px';
 DivHR.style.position = 'relative';
 DivHR.style.top = '0px';
 DivHR.style.zIndex = '10';
 DivHR.style.verticalAlign = 'top';

 //*** Set divMainContent Properties ****
 DivMC.style.width = width + 'px';
 DivMC.style.height = height + 'px';
 DivMC.style.position = 'relative';
 DivMC.style.top = -headerHeight + 'px';
 DivMC.style.zIndex = '1';

 //*** Set divFooterRow Properties ****
 DivFR.style.width = (parseInt(width) - 16) + 'px';
 DivFR.style.position = 'relative';
 DivFR.style.top = -headerHeight + 'px';
 DivFR.style.verticalAlign = 'top';
 DivFR.style.paddingtop = '2px';

 if (isFooter) {
 var tblfr = tbl.cloneNode(true);
 tblfr.removeChild(tblfr.getElementsByTagName('tbody')[0]);
 var tblBody = document.createElement('tbody');
 tblfr.style.width = '100%';
 tblfr.cellSpacing = "0";
 tblfr.border = "0px";
  tblfr.rules = "none";
 //*****In the case of Footer Row *******
 tblBody.appendChild(tbl.rows[tbl.rows.length - 1]);
 tblfr.appendChild(tblBody);
 DivFR.appendChild(tblfr);
 }
 //****Copy Header in divHeaderRow****
 DivHR.appendChild(tbl.cloneNode(true));
 }
}



function OnScrollDiv(Scrollablediv) {
  document.getElementById('DivHeaderRow').scrollLeft = Scrollablediv.scrollLeft;
document.getElementById('DivFooterRow').scrollLeft = Scrollablediv.scrollLeft;
}
</script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
   <asp:ScriptManager runat="server"></asp:ScriptManager>
    <asp:UpdatePanel runat="server">
        <ContentTemplate>
     <asp:Panel ID="pnlList" runat="server">
            <div class="tbl list-inline" style="width: 950px;">   
              <asp:Label runat="server" CssClass="pull-left" style="font-size: 35px">Orders</asp:Label>         
     <asp:LinkButton ID="btnAddOrder" runat="server" CssClass="btn btn-sm btn-success pull-right" Width="75" ToolTip="New Order" OnClick="btnAddOrder_Click"><span class="glyphicon glyphicon-plus"></span></asp:LinkButton>
            </div>
            <br /><br /><br />
         <div id="DivRoot" class="tbl">
    <div style="overflow: hidden;" id="DivHeaderRow">
    </div>

    <div style="overflow:scroll;" onscroll="OnScrollDiv(this)" id="DivMainContent">
    <asp:GridView ID="grdOrd" runat="server" AutoGenerateColumns="false"
       CssClass="table table-striped table-bordered table-condensed table-hover" BorderColor="Black" HeaderStyle-BackColor="LightGray"  HorizontalAlign="Center" 
       Width="950" DataKeyNames="OrderID" OnSelectedIndexChanged="grdOrd_SelectedIndexChanged">
     <Columns>
         <asp:ButtonField DataTextField="OrderID" ButtonType="Link" HeaderText="ID" ControlStyle-Font-Underline="false" CommandName="Select" />
         <asp:BoundField DataField="CustomerID" HeaderText="Customer" />
         <asp:BoundField DataField="OrderDate" HeaderText="Date Ordered" />
     </Columns>
   </asp:GridView>
               </div>
             <div id="DivFooterRow" runat="server"></div>

</div>
         </asp:Panel>
            <asp:Panel ID="pnlInfo" runat="server" Visible="false">
                <div class="tbl">
                <asp:Label id="infoTitle" CssClass="h1 center-block" style="text-align:center" Width="950" runat="server"></asp:Label><br />
           
               <div class="form-horizontal" style="width: 950px;">
                  <div class="form-group" id="divID" runat="server">
                     <label for="txtID" class="h4 control-label">ID: </label>
                     <asp:TextBox ID="txtID" CssClass="form-control" runat="server" MaxLength="5" ></asp:TextBox>
                  </div>
                     
                  <div class="form-group">   
                    <label for="txtCustomer" class="h4 control-label">Customer: </label>
                      <asp:DropDownList ID="drpCust" runat="server" CssClass="form-control" Visible="false"></asp:DropDownList>
                      <asp:TextBox ID="txtCustomer" CssClass="form-control" runat="server"></asp:TextBox>
                  </div>
  
                  <div class="form-group">  
                    <label for="txtODate" class="h4 control-label">Date Ordered: </label>
                    <asp:TextBox ID="txtODate" CssClass="form-control" runat="server"></asp:TextBox>
                  </div>

                    <div class="form-group">  
                    <label for="txtSDate" class="h4 control-label">Date Shipped: </label>
                    <asp:TextBox ID="txtSDate" CssClass="form-control" runat="server"></asp:TextBox>
                  </div>

                  <div class="form-group">
                   <label for="txtEmployee" class="h4 control-label">Created By: </label>
                   <asp:TextBox ID="txtEmployee" CssClass="form-control" runat="server"></asp:TextBox>
                  </div>

                  <div class="form-group">
                   <label for="txtAddress" class="h4 control-label">Shipping Address: </label>
                   <asp:TextBox ID="txtAddress" CssClass="form-control" runat="server"></asp:TextBox>
                  </div>

                  <div class="form-group">
                   <label for="txtCity" class="h4 control-label">City: </label>
                   <asp:TextBox ID="txtCity" CssClass="form-control" runat="server"></asp:TextBox>
                  </div>

                  <div class="form-group">
                   <label for="txtPostal" class="h4 control-label">Postal Code: </label>
                   <asp:TextBox ID="txtPostal" CssClass="form-control" runat="server"></asp:TextBox>
                  </div>

                  <div class="form-group">
                   <label for="txtCountry" class="h4 control-label">Country: </label>
                   <asp:TextBox ID="txtCountry" CssClass="form-control" runat="server"></asp:TextBox>
                  </div>

                  <div class="form-group">
                   <label for="txtShipper" class="h4 control-label">Shipper: </label>
                   <asp:DropDownList ID="drpShip" runat="server" CssClass="form-control" Visible="false"></asp:DropDownList>
                   <asp:TextBox ID="txtShipper" CssClass="form-control" runat="server"></asp:TextBox>
                  </div>
              </div>
                    
                    <br />
                    <div class="list-inline" style="width: 960px">
                             <asp:LinkButton ID="btnBack" CssClass="btn btn-sm btn-warning pull-left" runat="server" Width="75" ToolTip="Go Back" OnClick="btnBack_Click">
                                 <span class="glyphicon glyphicon-arrow-left"></span>
                             </asp:LinkButton>
                            <asp:LinkButton ID="btnAdd" CssClass="btn btn-sm btn-success form-inline" style="margin-left: 37%" Width="100" ToolTip="Create Order" runat="server" OnClick="btnAdd_Click" Visible="false">
                                <span class="glyphicon glyphicon-ok"></span>
                            </asp:LinkButton>
                            &nbsp;&nbsp;&nbsp;<asp:LinkButton ID="btnUpdate" CssClass="btn btn-sm btn-success form-inline" style="margin-left: 35%" Width="100" ToolTip="Update Order" runat="server" OnClick="btnUpdate_Click" Visible="false">
                                <span class="glyphicon glyphicon-ok"></span>
                            </asp:LinkButton>
                            <asp:LinkButton ID="btnDelete" CssClass="btn btn-sm btn-danger pull-right" Width="75" ToolTip="Delete Order" runat="server" OnClick="btnDelete_Click" Visible="false"
                                OnClientClick="return confirm('Are you sure you want delete this order?');" CommandName="Delete" CommandArgument="">
                                <span class="glyphicon glyphicon-remove"></span>
                            </asp:LinkButton>
                    </div>
                    <br />
                </div>
            </asp:Panel>
        </ContentTemplate>
     </asp:UpdatePanel>
</asp:Content>


<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="Default.aspx.cs" Inherits="Customers_Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
  <div class="container" style="margin-top: 7%;">
   <asp:ScriptManager runat="server"></asp:ScriptManager>
    <asp:UpdatePanel runat="server">
        <ContentTemplate>
     <asp:Panel ID="pnlList" runat="server">
            <div class="tbl list-inline">   
              <asp:Label runat="server" CssClass="h1 pull-left">Orders</asp:Label>         
     <asp:LinkButton ID="btnAddOrder" runat="server" CssClass="btn btn-lg btn-outline-info float-md-right" ToolTip="New Order" OnClick="btnAddOrder_Click">Create</asp:LinkButton>
            </div>
            <br />
         <div class="container-fluid">
    <asp:GridView ID="grdOrd" runat="server" AutoGenerateColumns="false"
       CssClass="table table-bordered" HeaderStyle-CssClass="thead-inverse" HorizontalAlign="Center" 
       DataKeyNames="OrderID" OnSelectedIndexChanged="grdOrd_SelectedIndexChanged">
     <Columns>
         <asp:ButtonField DataTextField="OrderID" ButtonType="Link" HeaderText="ID" ControlStyle-Font-Underline="false" CommandName="Select" />
         <asp:BoundField DataField="CustomerID" HeaderText="Customer" />
         <asp:BoundField DataField="OrderDate" HeaderText="Date Ordered" />
     </Columns>
   </asp:GridView>
               </div>
         </asp:Panel>
            <asp:Panel ID="pnlInfo" runat="server" Visible="false">
                <asp:Label id="infoTitle" CssClass="h1" style="text-align:center" runat="server"></asp:Label>
                <br /><br />
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
                    
                    <br />
                    <div class="list-inline">
                             <asp:LinkButton ID="btnBack" CssClass="btn btn-lg btn-outline-warning pull-md-left" runat="server" ToolTip="Go Back" OnClick="btnBack_Click">
                                 Go Back
                             </asp:LinkButton>
                            <asp:LinkButton ID="btnAdd" CssClass="btn btn-lg btn-outline-success form-inline" style="margin-left: 32%" ToolTip="Create Order" runat="server" OnClick="btnAdd_Click" Visible="false">
                                 Create
                            </asp:LinkButton>
                            &nbsp;&nbsp;&nbsp;<asp:LinkButton ID="btnUpdate" CssClass="btn btn-lg btn-outline-success form-inline" style="margin-left: 32%" ToolTip="Update Order" runat="server" OnClick="btnUpdate_Click" Visible="false">
                                 Update
                            </asp:LinkButton>
                            <asp:LinkButton ID="btnDelete" CssClass="btn btn-lg btn-outline-danger float-md-right" ToolTip="Delete Order" runat="server" OnClick="btnDelete_Click" Visible="false"
                                OnClientClick="return confirm('Are you sure you want delete this order?');" CommandName="Delete" CommandArgument="">
                                 Delete
                            </asp:LinkButton>
                    </div>
                    <br />
                </div>
            </asp:Panel>
        </ContentTemplate>
     </asp:UpdatePanel>
   </div>
</asp:Content>


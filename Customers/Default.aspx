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
              <asp:Label runat="server" CssClass="h1 pull-left">Customers</asp:Label>         
     <asp:LinkButton ID="btnAddCustomer" runat="server" CssClass="btn btn-lg btn-outline-info float-md-right" ToolTip="New Customer" OnClick="btnAddCustomer_Click">Create</asp:LinkButton>
            </div>
            <br />
         <div class="container-fluid">
    <asp:GridView ID="grdCust" runat="server" AutoGenerateColumns="false"
       CssClass="table table-bordered" HeaderStyle-CssClass="thead-inverse" HorizontalAlign="Center" 
       OnSelectedIndexChanged="grdCust_SelectedIndexChanged" DataKeyNames="CustomerID">
     <Columns>
         <asp:ButtonField DataTextField="CustomerID" ButtonType="Link" HeaderText="ID" ControlStyle-Font-Underline="false" CommandName="Select" />
         <asp:BoundField DataField="CompanyName" HeaderText="Company" />
         <asp:BoundField DataField="ContactName" HeaderText="Contact" />
     </Columns>
   </asp:GridView>
               </div>
         </asp:Panel>
            <asp:Panel ID="pnlInfo" runat="server" Visible="false">
                <asp:Label id="infoTitle" CssClass="h1" style="text-align:center" runat="server"></asp:Label><br />
                 <br />
                  <div class="form-group">
                     <label for="txtID" class="h4 control-label">ID: </label>
                     <asp:TextBox ID="txtID" CssClass="form-control" runat="server" MaxLength="5" ></asp:TextBox>
                  </div>
                     
                  <div class="form-group">   
                    <label for="txtCompanyName" class="h4 control-label">Company: </label>
                    <asp:TextBox ID="txtCompanyName" CssClass="form-control" runat="server"></asp:TextBox>
                  </div>
  
                  <div class="form-group">  
                    <label for="txtContactName" class="h4 control-label">&nbsp;Contact: </label>
                    <asp:TextBox ID="txtContactName" CssClass="form-control" runat="server"></asp:TextBox>
                  </div>

                  <div class="form-group">
                   <label for="txtContactTitle" class="h4 control-label">Job Title: </label>
                   <asp:TextBox ID="txtContactTitle" CssClass="form-control" runat="server"></asp:TextBox>
                  </div>

                  <div class="form-group">
                   <label for="txtAddress" class="h4 control-label">Address: </label>
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
                   <label for="txtPhone" class="h4 control-label">Phone: </label>
                   <asp:TextBox ID="txtPhone" CssClass="form-control" runat="server"></asp:TextBox>
                  </div>
                    
                    <br />
                    <div class="list-inline">
                             <asp:LinkButton ID="btnBack" CssClass="btn btn-lg btn-outline-warning pull-md-left" runat="server" ToolTip="Go Back" OnClick="btnBack_Click">
                                 Go Back
                             </asp:LinkButton>
                            <asp:LinkButton ID="btnAdd" CssClass="btn btn-lg btn-outline-success form-inline" style="margin-left: 32%" ToolTip="Create Customer" runat="server" OnClick="btnAdd_Click" Visible="false">
                                 Create
                            </asp:LinkButton>
                            &nbsp;&nbsp;&nbsp;<asp:LinkButton ID="btnUpdate" CssClass="btn btn-lg btn-outline-success form-inline" style="margin-left: 32%" ToolTip="Update Customer" runat="server" OnClick="btnUpdate_Click" Visible="false">
                                 Update
                            </asp:LinkButton>
                            <asp:LinkButton ID="btnDelete" CssClass="btn btn-lg btn-outline-danger float-md-right" ToolTip="Delete Customer" runat="server" OnClick="btnDelete_Click" Visible="false"
                                OnClientClick="return confirm('Are you sure you want delete this customer?');" CommandName="Delete" CommandArgument="">
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


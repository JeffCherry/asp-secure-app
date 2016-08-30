<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="Default.aspx.cs" Inherits="Customers_Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
   <asp:ScriptManager runat="server"></asp:ScriptManager>
    <asp:UpdatePanel runat="server">
        <ContentTemplate>
     <asp:Panel ID="pnlList" runat="server">
            <div class="tbl list-inline" style="width: 700px;">
     <asp:TextBox CssClass="input-sm" runat="server" ID="txtSearch" Text="" OnTextChanged="btnSearch_Click">
    </asp:TextBox>           
     <asp:LinkButton ID="btnSearch" runat="server" CssClass="btn btn-sm btn-default" Width="75" OnClick="btnSearch_Click"><span class="glyphicon glyphicon-search"></span></asp:LinkButton>&nbsp;
     <asp:Button ID="btnSearchClear" runat="server" CssClass="btn btn-sm btn-danger" Text="Clear Search" OnClick="btnSearchClear_Click" Visible="false" />
     <asp:LinkButton ID="btnAddCustomer" runat="server" CssClass="btn btn-sm btn-success pull-right" Width="75" OnClick="btnAddCustomer_Click"><span class="glyphicon glyphicon-plus"></span></asp:LinkButton>
            </div>
            <br />
         <h2 id="noResults" class="tbl" runat="server" visible="false">Your search did not yield any matches :(</h2>
            <div>
    <asp:GridView ID="grdCust" runat="server" AutoGenerateColumns="false" AllowPaging="true"
       CssClass="table-responsive table tbl" BorderColor="Black" OnPageIndexChanging="grdCust_PageIndexChanging" HorizontalAlign="Center" 
       Width="700" PagerStyle-CssClass="h4" PagerSettings-Mode="NextPreviousFirstLast" AlternatingRowStyle-BackColor="LightGray" 
       HeaderStyle-BackColor="Black" HeaderStyle-ForeColor="White" PagerSettings-FirstPageText="First&nbsp" 
       PagerSettings-LastPageText="&nbsp;Last" PagerSettings-NextPageText="Next&nbsp;" PagerSettings-PreviousPageText="&nbspPrev&nbsp;" 
       BorderStyle="None" PagerStyle-ForeColor="Black" OnSelectedIndexChanged="grdCust_SelectedIndexChanged" DataKeyNames="CustomerID">
     <Columns>
         <asp:ButtonField DataTextField="CustomerID" ButtonType="Link" HeaderText="ID" ControlStyle-Font-Underline="false" CommandName="Select" />
         <asp:BoundField DataField="CompanyName" HeaderText="Company" />
         <asp:BoundField DataField="ContactName" HeaderText="Contact" />
     </Columns>
   </asp:GridView>
                </div>
         </asp:Panel>
            <asp:Panel ID="pnlInfo" runat="server" Visible="false">
                <div class="tbl">
                <asp:Label id="infoTitle" class="h1 center-block" style="text-align:center" Width="700" runat="server"></asp:Label><br /><br />
           
               <div class="form-horizontal" style="width: 750px;">
                  <div class="form-group">
                     <label for="txtID" class="h4 control-label">ID: </label>
                     <asp:TextBox ID="txtID" CssClass="form-control" runat="server" ReadOnly="true" ></asp:TextBox>
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

              </div>
                    
                    <br />
                    <div class="list-inline" style="width: 700px">
                             <asp:LinkButton ID="btnBack" CssClass="btn btn-sm btn-warning pull-left" runat="server" Width="75" OnClick="btnBack_Click"><span class="glyphicon glyphicon-arrow-left"></span></asp:LinkButton>
                            <asp:LinkButton ID="btnAdd" CssClass="btn btn-sm btn-info form-inline" style="margin-left: 40%" Width="75" runat="server" Visible="false"><span class="glyphicon glyphicon-ok"></span></asp:LinkButton>
                            <asp:LinkButton ID="btnUpdate" CssClass="btn btn-sm btn-success form-inline" style="margin-left: 35%" Width="75" runat="server" Visible="false"><span class="glyphicon glyphicon-ok"></span></asp:LinkButton>
                            <asp:LinkButton ID="btnDelete" CssClass="btn btn-sm btn-danger pull-right" Width="75" runat="server" Visible="false"><span class="glyphicon glyphicon-remove"></span></asp:LinkButton>
                    </div>
                    <br />
                </div>
            </asp:Panel>
        </ContentTemplate>
     </asp:UpdatePanel>
</asp:Content>


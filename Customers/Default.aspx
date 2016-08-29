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
     <asp:Button ID="btnSearch" runat="server" CssClass="btn btn-sm btn-default" Text="Search" OnClick="btnSearch_Click" />&nbsp;
     <asp:Button ID="btnSearchClear" runat="server" CssClass="btn btn-sm btn-danger" Text="Clear Search" OnClick="btnSearchClear_Click" Visible="false" />
     <asp:Button ID="btnAddCustomer" runat="server" CssClass="btn btn-sm btn-success pull-right" Text="Add A Customer" OnClick="btnAddCustomer_Click" />
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
                <div class="tbl" style="width: 700px;">
                <asp:Label id="infoTitle" class="h1 center-block" style="text-align:center" Width="700" runat="server"></asp:Label><br /><br />
                <asp:table runat="server" Width="700">
               
                <asp:TableRow Width="700" HorizontalAlign="Center">
                <asp:TableCell HorizontalAlign="Center" ColumnSpan="10"><label for="txtID" class="h4">ID: </label>
                <asp:TextBox ID="txtID" runat="server" ReadOnly="true" ></asp:TextBox><br /></asp:TableCell>
                </asp:TableRow>

               <asp:TableRow>
                <asp:TableCell><asp:TextBox ID="txtCompanyName" CssClass="pull-right" runat="server"></asp:TextBox>
                <label for="txtCompanyName" class="pull-right h4">Company: </label></asp:TableCell>
                <asp:TableCell style="float:right"><label for="txtContactName" class="h4">Contact: </label>
                <asp:TextBox ID="txtContactName" runat="server"></asp:TextBox></asp:TableCell>
                </asp:TableRow>

                <asp:TableRow> 
                <asp:TableCell><asp:TextBox ID="txtContactTitle" CssClass="pull-right" runat="server"></asp:TextBox>
                <label for="txtContactTitle" class="pull-right h4">Job Title: </label></asp:TableCell>
                <asp:TableCell style="float:right"><label for="txtAddress" class="h4">Address: </label>
                <asp:TextBox ID="txtAddress" runat="server"></asp:TextBox></asp:TableCell>
                </asp:TableRow>

                <asp:TableRow>
                <asp:TableCell><asp:TextBox ID="txtCity" CssClass="pull-right" runat="server"></asp:TextBox>
                <label for="txtCity" class="pull-right h4">City: </label></asp:TableCell>
                <asp:TableCell CssClass="pull-right"><label for="txtPostal" class="h4">Postal Code: </label>
                <asp:TextBox ID="txtPostal" runat="server"></asp:TextBox></asp:TableCell>
                </asp:TableRow>

                <asp:TableRow>
                <asp:TableCell><asp:TextBox ID="txtCountry" CssClass="pull-right" runat="server"></asp:TextBox>
                <label for="txtCountry" class="pull-right h4">Country: </label></asp:TableCell>
                <asp:TableCell style="float:right"><label for="txtPhone" class="h4">Phone: </label>
                <asp:TextBox ID="txtPhone" runat="server"></asp:TextBox></asp:TableCell>
                </asp:TableRow>
            </asp:table>
                    <br />
                    <div class="list-inline">
                            <asp:Button ID="btnBack" CssClass="btn btn-sm btn-warning pull-left" Text="Back To List" runat="server" OnClick="btnBack_Click" />
                            <asp:Button ID="btnAdd" CssClass="btn btn-sm btn-info center-block" Text="Create Customer" runat="server" Visible="false" />
                            &nbsp;&nbsp;&nbsp;<asp:Button ID="btnUpdate" CssClass="btn btn-sm btn-success" Text="Update Customer" runat="server" Visible="false" />
                            &nbsp;&nbsp;<asp:Button ID="btnDelete" CssClass="btn btn-sm btn-danger" Text="Delete Customer" runat="server" Visible="false" />
                    </div>
                </div>
            </asp:Panel>
        </ContentTemplate>
     </asp:UpdatePanel>
</asp:Content>


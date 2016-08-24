<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="Default.aspx.cs" Inherits="Customers_Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
   <asp:GridView ID="grdCust" runat="server" AutoGenerateColumns="false" AllowPaging="true"
    CssClass="table-responsive table tbl" BorderColor="Black" OnPageIndexChanging="grdCust_PageIndexChanging" HorizontalAlign="Center" 
       Width="700" PagerStyle-CssClass="h4" PagerSettings-Mode="NextPreviousFirstLast" AlternatingRowStyle-BackColor="LightGray" 
       HeaderStyle-BackColor="Black" HeaderStyle-ForeColor="White" PagerSettings-FirstPageText="First&nbsp" 
       PagerSettings-LastPageText="&nbsp;Last" PagerSettings-NextPageText="Next&nbsp;" PagerSettings-PreviousPageText="&nbspPrev&nbsp;">
     <Columns>
         <asp:ButtonField DataTextField="CustomerID" ButtonType="Link" HeaderText="ID" />
         <asp:BoundField DataField="CompanyName" HeaderText="Company" />
         <asp:BoundField DataField="ContactName" HeaderText="Contact" />
     </Columns>
   </asp:GridView>
</asp:Content>


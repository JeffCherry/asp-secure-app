<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="Default.aspx.cs" Inherits="_Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <asp:LoginView runat="server">
        <AnonymousTemplate>
            <h1 class="h1" style="text-align: center; bottom: 50%">Click <span class="info"><a href="Login.aspx">here</a>&nbsp;</span>to sign in.</h1>
        </AnonymousTemplate>
    </asp:LoginView>
</asp:Content>


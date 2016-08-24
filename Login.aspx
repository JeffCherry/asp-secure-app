<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="Login.aspx.cs" Inherits="Login" UnobtrusiveValidationMode="None" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div class="container-fluid" style="margin-top: 5%">
    <asp:Login ID="lgnApp" runat="server" CssClass="container-fluid" LoginButtonStyle-CssClass="btn-lg" TitleText="<br>" 
        TextBoxStyle-CssClass="input-group-lg" Height="300" Width="500" LabelStyle-CssClass="h4" BorderColor="Yellow" BorderWidth="5" 
        CheckBoxStyle-HorizontalAlign="Center" RememberMeText="&nbsp;Remember Me" LoginButtonText="Sign In" PasswordLabelText="Password:&nbsp" 
        UserNameLabelText="Username:&nbsp" OnAuthenticate="lgin_Authenticate">    
        <TitleTextStyle CssClass="h2"  />
    </asp:Login> 
    </div>
</asp:Content>


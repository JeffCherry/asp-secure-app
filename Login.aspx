<%@ Page Title="" Language="C#" AutoEventWireup="true" CodeFile="Login.aspx.cs" Inherits="Login" UnobtrusiveValidationMode="None" %>
    <head runat="server">
        <title>Sign In</title>
    </head>
    <form runat="server">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-alpha.5/css/bootstrap.min.css" integrity="sha384-AysaV+vQoT3kOAXZkl02PThvDr8HYKPZhNT5h/CXfBThSRXQ6jW5DO2ekP5ViFdi" crossorigin="anonymous">
    <link rel="stylesheet" href="/App_Themes/css/style.css" />
       <script src="https://code.jquery.com/jquery-3.1.1.min.js" integrity="sha256-hVVnYaiADRTO2PzUGmuLJr8BLUSjGIZsDYGmIJLv2b8=" crossorigin="anonymous"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-alpha.5/js/bootstrap.min.js" integrity="sha384-BLiI7JTZm+JWlgKa0M0kGRpJbF2J8q+qreVrKBC47e3K6BW78kGLrCkeRX6I9RoK" crossorigin="anonymous"></script>
    <div class="container1">
        <div class="form-inline align-middle">
    <asp:Login ID="lgnApp" runat="server" CssClass="cont container1" LoginButtonStyle-CssClass="btn btn-md btn-outline-secondary" TitleText=" " 
        TextBoxStyle-CssClass="form-control" LabelStyle-CssClass="h5" CheckBoxStyle-CssClass="form-check-input" 
        RememberMeText="&nbsp;Remember Me&nbsp;&nbsp;" LoginButtonText="Sign In" PasswordLabelText="Password:&nbsp" Orientation="Horizontal" 
        UserNameLabelText="Username:&nbsp" OnAuthenticate="lgin_Authenticate" Style="margin-top: 25%" Height="30">    
        <TitleTextStyle CssClass="title" />
    </asp:Login>
       </div> 
    </div>
 </form>


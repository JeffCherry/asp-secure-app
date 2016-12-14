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
              <asp:Label runat="server" CssClass="h1 pull-left">Employees</asp:Label>         
     <asp:LinkButton ID="btnAddEmployee" runat="server" CssClass="btn btn-lg btn-outline-info float-md-right" ToolTip="New Employee" OnClick="btnAddEmployee_Click">Create</asp:LinkButton>
            </div>
            <br />
        
    <div class="container-fluid">
    <asp:GridView ID="grdEmp" runat="server" AutoGenerateColumns="false"
       CssClass="table table-bordered" HeaderStyle-CssClass="thead-inverse" BorderColor="white" HorizontalAlign="Center" 
       DataKeyNames="EmployeeID" OnSelectedIndexChanged="grdEmp_SelectedIndexChanged">
     <Columns>
         <asp:ButtonField DataTextField="EmployeeID" ButtonType="Link" HeaderText="ID" ControlStyle-Font-Underline="false" CommandName="Select" />
         <asp:BoundField DataField="LastName" HeaderText="Last Name" />
         <asp:BoundField DataField="FirstName" HeaderText="First Name" />
     </Columns>
   </asp:GridView>
               </div>
         </asp:Panel>
            <asp:Panel ID="pnlInfo" runat="server" Visible="false">
                <asp:Label id="infoTitle" CssClass="h1" style="text-align:center" runat="server"></asp:Label><br />
                <br />
                  <div class="form-group">
                     <label for="txtID" class="h4 col-form-label">ID: </label>
                        <asp:TextBox ID="txtID" CssClass="form-control" runat="server" MaxLength="5" ></asp:TextBox>
                  </div>

                  <div class="form-group">   
                    <label for="txtLastName" class="h4 control-label">Last Name: </label>
                    <asp:TextBox ID="txtLastName" CssClass="form-control" runat="server"></asp:TextBox>
                  </div>
  
                  <div class="form-group">  
                    <label for="txtFirstName" class="h4 control-label">First Name: </label>
                    <asp:TextBox ID="txtFirstName" CssClass="form-control" runat="server"></asp:TextBox>
                  </div>

                    <div class="form-group">  
                    <label for="txtBirthDate" class="h4 control-label">Birth Date: </label>
                    <asp:TextBox ID="txtBirthDate" CssClass="form-control" runat="server"></asp:TextBox>
                  </div>

                  <div class="form-group">
                   <label for="txtTitle" class="h4 control-label">Title: </label>
                   <asp:TextBox ID="txtTitle" CssClass="form-control" runat="server"></asp:TextBox>
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

                  <div class="form-group">
                   <fieldset class="form-group row">
                   <label class="h4 col-form-label col-sm-2" style="width: 3em;">Role: </label>
                   <div class="col-xs-10">
                       <label class="form-check-inline">
                    <asp:RadioButtonList ID="btnListRoles" RepeatDirection="Horizontal" runat="server" CssClass="h5 form-check-input" CellPadding="8">
                       <asp:ListItem Value="User">User</asp:ListItem>
                       <asp:ListItem Value="Admin">Admin</asp:ListItem>
                    </asp:RadioButtonList>
                           </label>
                   </label>
                    </div>
                       </fieldset>

                    
                    <br />
                    <div class="list-inline">
                             <asp:LinkButton ID="btnBack" CssClass="btn btn-lg btn-outline-warning float-md-left" runat="server" ToolTip="Go Back" OnClick="btnBack_Click">
                              Go Back
                             </asp:LinkButton>
                            <asp:LinkButton ID="btnAdd" CssClass="btn btn-lg btn-outline-success form-inline" style="margin-left: 32%" ToolTip="Create Employee" runat="server" OnClick="btnAdd_Click" Visible="false">
                              Create
                            </asp:LinkButton>
                            &nbsp;&nbsp;&nbsp;<asp:LinkButton ID="btnUpdate" CssClass="btn btn-lg btn-outline-success form-inline" style="margin-left: 32%" ToolTip="Update Employee" runat="server" OnClick="btnUpdate_Click" Visible="false">
                              Update
                            </asp:LinkButton>
                            <asp:LinkButton ID="btnDelete" CssClass="btn btn-lg btn-outline-danger float-md-right" ToolTip="Delete Employee" runat="server" OnClick="btnDelete_Click" Visible="false"
                                OnClientClick="return confirm('Are you sure you want delete this employee?');" CommandName="Delete" CommandArgument="">
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


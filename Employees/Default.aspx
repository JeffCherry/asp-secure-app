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
              <asp:Label runat="server" CssClass="pull-left" style="font-size: 35px">Employees</asp:Label>         
     <asp:LinkButton ID="btnAddEmployee" runat="server" CssClass="btn btn-sm btn-success pull-right" Width="75" ToolTip="New Employee" OnClick="btnAddEmployee_Click"><span class="glyphicon glyphicon-plus"></span></asp:LinkButton>
            </div>
            <br /><br /><br />
         <h2 id="noResults" class="tbl" runat="server" visible="false">Your search did not yield any matches :(</h2>
         <div id="DivRoot" class="tbl">
    <div style="overflow: hidden;" id="DivHeaderRow">
    </div>

    <div style="overflow:scroll;" onscroll="OnScrollDiv(this)" id="DivMainContent">
    <asp:GridView ID="grdEmp" runat="server" AutoGenerateColumns="false"
       CssClass="table table-striped table-bordered table-condensed table-hover" BorderColor="Black" HeaderStyle-BackColor="LightGray"  HorizontalAlign="Center" 
       Width="950" DataKeyNames="EmployeeID" OnSelectedIndexChanged="grdEmp_SelectedIndexChanged">
     <Columns>
         <asp:ButtonField DataTextField="EmployeeID" ButtonType="Link" HeaderText="ID" ControlStyle-Font-Underline="false" CommandName="Select" />
         <asp:BoundField DataField="LastName" HeaderText="Last Name" />
         <asp:BoundField DataField="FirstName" HeaderText="First Name" />
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
                  <div class="form-group">
                     <label for="txtID" class="h4 control-label">ID: </label>
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
                   <label for="rdRole" class="h4 control-label">Role:
                    <asp:RadioButtonList ID="btnListRoles" runat="server" RepeatDirection="Horizontal" CssClass="radio-inline">
                       <asp:ListItem Value="User">User&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</asp:ListItem>
                       <asp:ListItem Value="Admin">Admin</asp:ListItem>
                    </asp:RadioButtonList>
                   </label>
                  </div>

              </div>
                    
                    <br />
                    <div class="list-inline" style="width: 960px">
                             <asp:LinkButton ID="btnBack" CssClass="btn btn-sm btn-warning pull-left" runat="server" Width="75" ToolTip="Go Back" OnClick="btnBack_Click">
                                 <span class="glyphicon glyphicon-arrow-left"></span>
                             </asp:LinkButton>
                            <asp:LinkButton ID="btnAdd" CssClass="btn btn-sm btn-success form-inline" style="margin-left: 37%" Width="100" ToolTip="Create Employee" runat="server" OnClick="btnAdd_Click" Visible="false">
                                <span class="glyphicon glyphicon-ok"></span>
                            </asp:LinkButton>
                            &nbsp;&nbsp;&nbsp;<asp:LinkButton ID="btnUpdate" CssClass="btn btn-sm btn-success form-inline" style="margin-left: 35%" Width="100" ToolTip="Update Employee" runat="server" OnClick="btnUpdate_Click" Visible="false">
                                <span class="glyphicon glyphicon-ok"></span>
                            </asp:LinkButton>
                            <asp:LinkButton ID="btnDelete" CssClass="btn btn-sm btn-danger pull-right" Width="75" ToolTip="Delete Employee" runat="server" OnClick="btnDelete_Click" Visible="false"
                                OnClientClick="return confirm('Are you sure you want delete this employee?');" CommandName="Delete" CommandArgument="">
                                <span class="glyphicon glyphicon-remove"></span>
                            </asp:LinkButton>
                    </div>
                    <br />
                </div>
            </asp:Panel>
        </ContentTemplate>
     </asp:UpdatePanel>
</asp:Content>


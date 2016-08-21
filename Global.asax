 <%@ Application Language="C#" %>
<%@ Import Namespace="NorthwindEFModel"%>
<%@ Import Namespace="System.Web.Security"%> 

<script runat="server">
    public void Application_AuthenticateRequest(Object src, EventArgs e) {

        if (User != null && User.Identity.AuthenticationType == "Forms") {
            FormsIdentity id = (FormsIdentity)User.Identity;
            int employeeId = int.Parse(id.Name);
            using (NorthwindEntities ef = new NorthwindEntities() ) {
                var employee = (from em in ef.Employees where em.EmployeeID == employeeId
                                select em).FirstOrDefault<Employee>();
                String[] roles = new string[1];
                int i = 0;
                foreach (Role r in ef.Roles) {
                    if (r.EmployeeID == employee.EmployeeID)
                    {
                        roles[i++] = r.Role1;
                    }
                }
                HttpContext.Current.User = new System.Security.Principal.GenericPrincipal(id, roles);
            }
        }
    }
</script>

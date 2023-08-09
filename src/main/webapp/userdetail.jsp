<%-- 
    Document   : userdetail
    Created on : Jul 31, 2023, 8:22:54 PM
    Author     : Sarita
--%>

<%@page import="MyEntity.Users"%>
<%@page import="java.util.List"%>
<%@page import="com.company.dao.UserDao"%>
<%@page import="com.mycompany.Handler.FactoryProvider"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>User Detail Page</title>
        <%@include file="Component/common_css_js.jsp" %>
    </head>
    <body>
        <%
            UserDao ud=new UserDao(FactoryProvider.getFactory());
             List<Users> ulist=ud.getUserDetails();
            
        %>
         <%@include file="Component/Navbar.jsp" %>
        <div class="text-center">
            <%@include file="message.jsp" %>
        </div>
        <div class="container mt-3">
            <table border="0" cellpadding="10" cellspacing="5" style="background-color:white" align="center">
                <thead class="table-head">
                    <tr>
                        <th>Id</th>
                        <th>Name</th>
                        <th>Email</th>
                        <th>Address</th>
                        <th>Phone no.</th>
                        <th>Password</th>
                      
                    </tr>
                </thead>
                <%for(Users list : ulist) {
                %>
                <tr>
                    <td><%=list.getUserId() %></td>
                    <td><%=list.getUserName() %></td>
                    <td><%=list.getUserEmail() %></td>
                    <td><%= list.getUserAddress()  %></td>
                    

                    <td><%=list.getUserPhone()%></td>
                    <td><%=list.getUserPassword()%></td>


                <%}
                %>
                </tr>
            </table>

        </div>
        
    </body>
</html>

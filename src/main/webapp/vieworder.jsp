<%@page import="MyEntity.Order"%>
<%@page import="java.util.List"%>
<%@page import="com.company.dao.OrderDao"%>
<%@page import="com.mycompany.Handler.FactoryProvider"%>
<%

    OrderDao od = new OrderDao(FactoryProvider.getFactory());
    List<Order> list = od.getOrderDetails();
   

%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Order</title>
        <%@include file="Component/common_css_js.jsp" %>
    </head>
    <body>
        <%@include file="Component/Navbar.jsp" %>
        <div class="text-center">
            <%@include file="message.jsp" %>
        </div>
        <div class="container mt-3">
            <table border="0" cellpadding="10" cellspacing="5" style="background-color:white" align="center">
                <thead class="table-head">
                    <tr>
                        <th>O_Id</th>
                        <th>P_Id</th>
                        <th>P_Price</th>
                        <th>P_name</th>
                        <th>P_quantity</th>
                        <th>Address</th>
                        <th>Email</th>  
                        <th>City</th>

                    </tr>
                </thead>
                <%for (Order olist : list) {
                %>
                <tr>
                    <td><%=olist.getOrderId()%></td>
                    <td><%=olist.getProductId() %></td>
                    <td><%=olist.getProductPrice()%></td>
                    <td><%=olist.getProductName()%></td>
                    <td><%= olist.getProductQuantity()%></td>
                    <td><%=olist.getAddress()%></td>
                    <td><%=olist.getEmail()%></td>
                    <td><%=olist.getCity()%></td>




                    <%}
                    %>
                </tr>
            </table>

        </div>
    </body>
</html>

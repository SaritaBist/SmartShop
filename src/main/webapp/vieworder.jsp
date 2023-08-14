<%
//    ProductDao pd = new ProductDao(FactoryProvider.getFactory());
//    List<Product> plist = pd.getProductDetails();
//    CategoryDao cd = new CategoryDao(FactoryProvider.getFactory());
//    List<Category> clist = cd.getCategoryDetails();
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
    </body>
</html>

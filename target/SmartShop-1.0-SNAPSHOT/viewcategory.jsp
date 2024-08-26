<%-- 
    Document   : viewcategory
    Created on : Oct 1, 2023, 9:50:45 PM
    Author     : Sarita
--%>

<%@page import="java.util.List"%>
<%@page import="MyEntity.Category"%>
<%@page import="com.company.dao.CategoryDao"%>
<%@page import="com.mycompany.Handler.FactoryProvider"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
         <link href="https://fonts.googleapis.com/css2?family=Ysabeau+Infant:ital,wght@1,200&display=swap" rel="stylesheet">
        <link
            rel="stylesheet"
            href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.5/font/bootstrap-icons.css"
            />

        <%@include file="Component/common_css_js.jsp" %>
    </head>
    <body>
        <%@include file="Component/Navbar.jsp" %>
        <div class="text-center">
            <%@include file="message.jsp" %>
        </div>
        
            <%
            CategoryDao cd = new CategoryDao(FactoryProvider.getFactory());
            List<Category> clist = cd.getCategoryDetails();%>
        <div class="container mt-3">
            <table     border="0" cellpadding="8" style="background-color:white" align="center">
                <thead class="table-head">
                    <tr >
                        <th>Id</th>
                        <th>Name</th>
                        
                        <th>Description</th>
                       
                        <th>Operation</th>
                    </tr>
                </thead>
                <%for (Category list : clist) {
                %>
                <tr>
                    <td><%=list.getCatogeryId() %></td>
                    <td><%=list.getCatogeryTitle() %></td>
                    <td><%=list.getCatogeryDescription() %></td>
<!--                    </td>-->
                    <!--                    <td><div class="container text-center mt-3">
                                                <button type="button"   class="btn btn-secondary " data-bs-toggle="modal" data-bs-target="#updateproduct">Update</button>
                                                <button type="button" class="btn btn-secondary " data-bs-toggle="modal" data-bs-target="#deleteproduct">Delete</button>
                                            </div></td>-->

                    <td class="col-2 d-flex">

                        <a href="UpdateCategory.jsp?categoryId=<%=list.getCatogeryId() %>" class="btn btn-outline-success ">
                            <i class="bi bi-pencil-square"></i>
                        </a>

                        <form method="post" action="DeleteCategoryServlet">
                            <input type="hidden" name="catid" value="<%= list.getCatogeryId()%>">
                            <button type="submit" class="btn btn-outline-danger ms-2 pointer-arrow">
                                <i class="bi bi-trash-fill"></i>
                            </button>
                        </form> 
                    </td>
                </tr>

                <%}
                %>
            </table>

        </div>
    </body>
</html>

<%-- 
    Document   : UpdateCategory
    Created on : Oct 2, 2023, 10:09:07 AM
    Author     : Sarita
--%>

<%@page import="com.mycompany.Handler.FactoryProvider"%>
<%@page import="com.company.dao.CategoryDao"%>
<%@page import="MyEntity.Category"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
         <%@include file="Component/common_css_js.jsp" %>
    </head>
    <body>
                   
                        
        <%@include file="Component/Navbar.jsp" %>
        <div class="text-center">
            <%@include file="message.jsp" %>
        </div>
        
         <div class="row mt-3 ">
         <div class="col-md-4  offset-md-4">
                <div class="card   ">
                    <div >
                        <h4 class="text-center mt-3 " >Update Category</h4>
                    </div>
                    <%                        
                        
                        String catid = request.getParameter("categoryId");
                        
                         Category list=null;
                        if (catid != null && !catid.isEmpty()) {
                            try {
                                int id = Integer.parseInt(catid);
                               
                                CategoryDao cd = new CategoryDao(FactoryProvider.getFactory());
                                 list = cd.getCatogeryById(id);
                                // Rest of your code here
                            } catch (NumberFormatException e) {
                                // Handle the case where proid is not a valid integer
                                e.printStackTrace(); // Print the exception for debugging
                            }
                            
                        
                        } else {
                            // Handle the case where "productId" is null or empty
                            // You can display an error message or take appropriate action here
                        }
                        %>
                     <div class="card-body">
                          <form action="UpdateCategoryServlet" method="post">
                                 <input type="hidden" value="<%=list.getCatogeryId()%>" name="cid" /> 
                                <div class="mb-3">
                                    <input type="text" class="form-control"  value="<%=list.getCatogeryTitle() %>"  name="ctitle" placeholder="Enter category title">
                                </div>
                                <div class="mb-3">

                                    <textarea style="height: 150px" class="form-control"  name="cdescription" placeholder="Enter category description"><%=list.getCatogeryDescription()%></textarea>

                                </div>
                                <div class="text-center">
                                    <button type="submit" class="btn btn-primary">Update</button>
                                    
                                </div>

                            </form>

                     </div>
                     </div>
                </div>
         </div>
    </body>
</html>

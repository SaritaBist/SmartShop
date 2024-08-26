<%-- 
    Document   : UpdateProduct
    Created on : Oct 1, 2023, 3:54:07 PM
    Author     : Sarita
--%>


<%@page import="MyEntity.Category"%>
<%@page import="com.company.dao.CategoryDao"%>
<%@page import="java.util.List"%>
<%@page import="MyEntity.Product"%>
<%@page import="com.company.dao.ProductDao"%>
<%@page import="com.mycompany.Handler.FactoryProvider"%>
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
        <div class="row mt-2 ">



            <div class="col-md-4  offset-md-4">
                <div class="card   ">
                    <div >
                        <h4 class="text-center mt-3 " >Update Product</h4>
                    </div>
                    <%                        
                        
                        String proid = request.getParameter("productId");
                        
                         Product list=null;
                        if (proid != null && !proid.isEmpty()) {
                            try {
                                int pid = Integer.parseInt(proid);
                               
                                ProductDao pd = new ProductDao(FactoryProvider.getFactory());
                                 list = pd.getProductByProductId(pid);
                                // Rest of your code here
                            } catch (NumberFormatException e) {
                                // Handle the case where proid is not a valid integer
                                e.printStackTrace(); // Print the exception for debugging
                            }
                            catch(Exception e)
                            {
                               e.printStackTrace();
                        }
                        
                        } else {
                            // Handle the case where "productId" is null or empty
                            // You can display an error message or take appropriate action here
                        }

                        
                        CategoryDao cd = new CategoryDao(FactoryProvider.getFactory());
                        List<Category> clist = cd.getCategoryDetails();

                    %>
                    <div class="card-body">
                        <form action="UpdateProductServlet" method="post"  enctype="multipart/form-data">

                            <div class="mb-3">

                                 <input type="hidden"   class="form-control" name="id"  value="<%=list.getProduct_id()%>" placeholder="Enter product id">
                                                                 

                            </div>
                                
                            <div class="mb-3">
                                <input type="text"   class="form-control" name="ptitle"  value="<%=list.getProduct_name()%>" placeholder="Enter product title">
                            </div>
                            <div class="mb-3">

                                <textarea style="height: 50px" class="form-control"  name="pdescription"   ><%=list.getProduct_desc()%></textarea>

                            </div>
                            <div class="mb-3">
                                <label for="image">Choose Image</label>
                                <input type="file"  value="<%=list.getProduct_photo()%>" id="image" class="form-control" name="productName" >
                            </div>
                            <div class="mb-3">
                                <input type="number" class="form-control" name="pprice" value="<%=list.getProduct_price()%>" placeholder="Enter product price">
                            </div>
                            <div class="mb-3">
                                <input type="number" class="form-control" name="pdiscount" value="<%=list.getProduct_discount()%>" placeholder="Enter product disco">
                            </div>
                            <div class="mb-3">
                                <input type="number" class="form-control" name="pquantity" value="<%=list.getProduct_quantity()%>" placeholder="Enter product quantity">
                            </div>



                            <!--                                fetching catogery detail-->

                            <div class="mb-3">
                                <label for="choose">Choose Product</label>
                                <select  name="catid" class="form-select" id="choose" aria-label="Default select example">
                                    <%                                        for (Category c : clist) {
                                    %>

                                    <option value="<%=c.getCatogeryId()%>"><%=c.getCatogeryTitle()%></option>



                                    <%
                                        }
                                    %>
                                </select>
                            </div>
                            <div class="text-center">
                                <button type="submit" class="btn btn-outline-primary ">Update</button>

                            </div>

                        </form>
                    </div>
                </div>
            </div>

    </body>
</html>

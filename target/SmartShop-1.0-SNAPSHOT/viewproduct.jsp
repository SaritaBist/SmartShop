<%@page import="com.company.dao.UserDao"%>
<%@page import="com.mycompany.Handler.handler"%>
<%@page import="MyEntity.Category"%>
<%@page import="com.company.dao.CategoryDao"%>
<%@page import="java.util.List"%>
<%@page import="MyEntity.Product"%>
<%@page import="com.company.dao.ProductDao"%>
<%@page import="com.mycompany.Handler.FactoryProvider"%>


<%
    ProductDao pd = new ProductDao(FactoryProvider.getFactory());
    List<Product> plist = pd.getProductDetails();
    CategoryDao cd = new CategoryDao(FactoryProvider.getFactory());
    List<Category> clist = cd.getCategoryDetails();


%>



<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>view Product Page</title>
        <link href="https://fonts.googleapis.com/css2?family=Ysabeau+Infant:ital,wght@1,200&display=swap" rel="stylesheet">
        <link
            rel="stylesheet"
            href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.5/font/bootstrap-icons.css"
            />

        <%@include file="Component/common_css_js.jsp" %>
        <!--         <style>
                    body{
                        background-color: #e1e1e2;
                    }
                </style>-->
    </head>
    <body>
        <%@include file="Component/Navbar.jsp" %>
        <div class="text-center">
            <%@include file="message.jsp" %>
        </div>
        <div class="container mt-3">
            <table     border="0" cellpadding="8" style="background-color:white" align="center">
                <thead class="table-head">
                    <tr >
                        <th>Id</th>
                        <th>Name</th>
                        <th>quantity</th>
                        <th> price</th>
                        <th>Discount</th>
                        <th>Photo</th>
                        <!--                        <th> Description</th>-->
                        <th>Operation</th>
                    </tr>
                </thead>
                <%for (Product list : plist) {
                %>
                <tr>
                    <td><%=list.getProduct_id()%></td>
                    <td><%=list.getProduct_name()%></td>
                    <td><%=list.getProduct_quantity()%></td>
                    <td><%=list.getProduct_price()%></td>

                    <td><%=list.getProduct_discount()%></td>
                    <td><%=list.getProduct_photo()%></td>
<!--                    <td><%=handler.get10words(list.getProduct_desc())%></td>-->
                    <!--                    <td><div class="container text-center mt-3">
                                                <button type="button"   class="btn btn-secondary " data-bs-toggle="modal" data-bs-target="#updateproduct">Update</button>
                                                <button type="button" class="btn btn-secondary " data-bs-toggle="modal" data-bs-target="#deleteproduct">Delete</button>
                                            </div></td>-->

                    <td class="col-2 d-flex">

                        <a href="UpdateProduct.jsp?productId=<%=list.getProduct_id()%>" class="btn btn-outline-success ">
                            <i class="bi bi-pencil-square"></i>
                        </a>

                        <form method="post" action="DeleteProductServlet">
                            <input type="hidden" name="pid" value="<%= list.getProduct_id()%>">
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



        <!-- Modal -->
        <div class="modal fade" id="updateproduct" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header">
                        <h1 class="modal-title fs-5" id="exampleModalLabel">Update product detail</h1>
                        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                    </div>
                    <div class="modal-body">
                        <form action="UpdateProductServlet" method="POST"  enctype="multipart/form-data">

                            <div class="mb-3">
                                <label for="choose">Choose Product id</label>
                                <select  name="pid" class="form-select" id="choose" aria-label="Default select example">
                                    <%
                                        for (Product list : plist) {

                                    %>

                                    <option value="<%=list.getProduct_id()%>"><%=list.getProduct_id()%></option>

                                    <%
//                                         
                                        }
                                    %> 

                                </select>
                            </div>

                            <div class="mb-3">
                                <input type="text"   class="form-control" name="ptitle" placeholder="Enter product title">
                            </div>
                            <div class="mb-3">

                                <textarea style="height: 50px" class="form-control"  name="pdescription" placeholder="Enter product description"></textarea>

                            </div>
                            <div class="mb-3">
                                <label for="image">Choose Image</label>
                                <input type="file"  id="image" class="form-control" name="productName" >
                            </div>
                            <div class="mb-3">
                                <input type="number" class="form-control" name="pprice" placeholder="Enter product price">
                            </div>
                            <div class="mb-3">
                                <input type="number" class="form-control" name="pdiscount" placeholder="Enter product disco">
                            </div>
                            <div class="mb-3">
                                <input type="number" class="form-control" name="pquantity" placeholder="Enter product quantity">
                            </div>


                            <!--                                fetching catogery detail-->

                            <div class="mb-3">
                                <label for="choose">Choose Product</label>
                                <select  name="catid" class="form-select" id="choose" aria-label="Default select example">
                                    <%                                        for (Category c : clist) {
                                    %>

                                    <option value="<%=c.getCatogeryId()%>"><%=c.getCatogeryTitle()%></option>



                                    <%
                                        }%>
                                </select>
                            </div>
                            <div class="text-center">
                                <button type="submit" class="btn btn-outline-primary ">Update product</button>
                                <button type="button" class="btn btn-warning" data-bs-dismiss="modal">Close</button>
                            </div>

                        </form>

                        <%

//                            Product productData = pd.getProductByProductId(proid);

                        %>
                    </div>
                </div>   
            </div>
        </div>

        <!-- Second Modal -->
        <div class="modal fade" id="deleteproduct" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header">
                        <h1 class="modal-title fs-5" id="exampleModalLabel">Delete product detail</h1>
                        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                    </div>
<!--                    <div class="modal-body">
                        <form action="DeleteProductServlet" method="POST"  >

                            <div class="mb-3">
                                <label for="choose">Choose Product id</label>
                                <select  name="id" class="form-select" id="choose" aria-label="Default select example">
                                    <%                                        for (Product list : plist) {
                                    %>

                                    <option value="<%=list.getProduct_id()%>"><%=list.getProduct_id()%></option>

                                    <%
                                        }%>
                                </select>
                            </div>-->


                            <div class="text-center">
                                <button type="submit" class="btn btn-outline-primary ">Delete product</button>
                                <button type="button" class="btn btn-warning" data-bs-dismiss="modal">Close</button>
                            </div>

                        </form>

                    </div>
                </div>   
            </div>
        </div>
        <%@include file="Component/common_model.jsp" %>
    </body>
</html>

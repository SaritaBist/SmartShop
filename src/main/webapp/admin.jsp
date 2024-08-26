
<%@page import="com.company.dao.UserDao"%>
<%@page import="MyEntity.Product"%>
<%@page import="com.company.dao.ProductDao"%>
<%@page import="java.util.List"%>
<%@page import="MyEntity.Category"%>
<%@page import="com.mycompany.Handler.FactoryProvider"%>
<%@page import="com.company.dao.CategoryDao"%>
<%@page import="MyEntity.Users"%>
<%
    Users user = (Users) session.getAttribute("current_user");
    if (user == null) {
        session.setAttribute("message", "You are not logged in! Login first");
        response.sendRedirect("login.jsp");
        return;
    } else {
        if (user.getUserType().equalsIgnoreCase("normal")) {
            session.setAttribute("message", "You are not Admin! you can not access this page");
            response.sendRedirect("login.jsp");
            return;
        }

    }
%>
<%
    CategoryDao cd = new CategoryDao(FactoryProvider.getFactory());
    List<Category> list = cd.getCategoryDetails();
    ProductDao pd=new ProductDao(FactoryProvider.getFactory());
    List<Product> plist=pd.getProductDetails();
    UserDao ud=new UserDao(FactoryProvider.getFactory());
    List<Users> ulist=ud.getUserDetails();
%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>admin Page</title>
        <%@include file="Component/common_css_js.jsp" %>
    </head>
    <body>
        <%@include file="Component/Navbar.jsp" %>
        <div class="text-center">
            <%@include file="message.jsp" %>
        </div>
        <div class="container admin" >
            <div class="row mt-4 text-center">
                <!--                //first col-->
                <div class="col-xl-4 col-sm-6">
                    <div class="card" onclick="window.location='userdetail.jsp'">
                        <div class="card-body">
                            <div class="container">
                                <img  style="max-width:100px"src="Images/user.png" alt="user">
                            </div>
                            <h3><%=ulist.size()%></h3>
                            <h3 class="text-muted">Users</h3>
                        </div>
                    </div>
                </div>
                <!--                // second col-->
                <div class="col-xl-4 col-sm-6 ">
                    <div class="card" onclick="window.location='viewcategory.jsp'">
                        <div class="card-body">
                            <div class="container">
                                <img style="max-width:100px" class="img-fluid " src="Images/catogery.png" alt="user">
                            </div>
                            <h3><%=list.size()%></h3>
                            <h3 class="text-muted" >Categories</h3>
                        </div>
                    </div>
                </div>
                <!--                 third col-->
                <div class="col-xl-4 col-sm-6 ">
                    <div class="card">
                        <div class="card-body">
                            <div class="container">
                                <img style="max-width:100px" src="Images/product.png" alt="user">
                            </div>
                            <h3><%=plist.size()%></h3>
                            <h3 class="text-muted">Products</h3>
                        </div>
                    </div>
                </div>

            </div>
            <div class="row text-center mt-3">
                <div class="col-sm-4">
                    <div class="card " data-bs-toggle="modal" data-bs-target="#addcategory">
                        <div class="card-body">
                            <div class="container">
                                <img  style="max-width:100px" style="max-width:130px" class="img-fluid " src="Images/addproduct.png" alt="add catogery">
                            </div>

                            <h3 class="text-muted">Add Category</h3>
                        </div>
                    </div>
                </div>

                <div class="col-sm-4">
                    <div class="card" data-bs-toggle="modal" data-bs-target="#addproduct">
                        <div class="card-body">
                            <div class="container">
                                <img  style="max-width:100px" class="img-fluid " src="Images/plus.png" alt="add catogery">
                            </div>

                            <h3 class="text-muted">Add Product</h3>
                        </div>
                    </div>
                </div>
              
              
                <div class="col-sm-4">
                    <div class="card"  onclick="window.location='viewproduct.jsp'" data-bs-toggle="modal" data-bs-target="#addproduct">
                        <div class="card-body">
                            <div class="container">
                                <img  style="max-width:100px" class="img-fluid " src="Images/inspection.png" alt="add catogery">
                            </div>

                            <h3 class="text-muted">View Product</h3>
                        </div>
                    </div>
                </div>
            </div>
                            
            <div class="row mt-4 text-center">
                <div class="col-sm-4">
                    <div class="card"  onclick="window.location='vieworder.jsp'" >
                        <div class="card-body">
                            <div class="container">
                                <img  style="max-width:100px" class="img-fluid " src="Images/order.jpg" alt="view order">
                            </div>

                            <h3 class="text-muted">View Order</h3>
                        </div>
                    </div>
                </div>
<!--                <div class="col-sm-4">
                    <div class="card"  onclick="window.location='viewreview.jsp'" >
                        <div class="card-body">
                            <div class="container">
                                <img  style="max-width:100px" class="img-fluid " src="Images/reviews.jpeg" alt="view order">
                            </div>

                            <h3 class="text-muted">View Review</h3>
                        </div>
                    </div>
                </div>-->
            </div>


            <!-- Modal  for add category-->
            <div class="modal fade model-lg" id="addcategory" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
                <div class="modal-dialog">
                    <div class="modal-content">
                        <div class="modal-header">
                            <h1 class="modal-title fs-5" id="exampleModalLabel">Fill category details!</h1>
                            <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                        </div>
                        <div class="modal-body">
                            <form action="AddCategoryServlet" method="post">
                                <!--                                <input type="hidden" value="addcategory" name="operation" /> -->
                                <div class="mb-3">
                                    <input type="text" class="form-control" name="ctitle" placeholder="Enter category title">
                                </div>
                                <div class="mb-3">

                                    <textarea style="height: 150px" class="form-control"  name="cdescription" placeholder="Enter category description"></textarea>

                                </div>
                                <div class="text-center">
                                    <button type="submit" class="btn btn-primary">Submit</button>
                                    <button type="button" class="btn btn-warning" data-bs-dismiss="modal">Close</button>
                                </div>

                            </form>


                        </div>
                    </div>
                </div>
            </div>


            <!-- Modal for add product -->
            <div class="modal fade" id="addproduct" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
                <div class="modal-dialog">
                    <div class="modal-content">
                        <div class="modal-header">
                            <h1 class="modal-title fs-5" id="exampleModalLabel">Fill product details here!</h1>
                            <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                        </div>
                        <div class="modal-body">
                            <form action="AddProductServlet" method="POST"  enctype="multipart/form-data">
                                <!--                                <input type="hidden" value="addproduct" name="operation">-->
                                <div class="mb-3">
                                    <input type="text" class="form-control" name="ptitle" placeholder="Enter product title">
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
                                        <%
                                            for (Category c : list) {
                                        %>

                                        <option value="<%=c.getCatogeryId()%>"><%=c.getCatogeryTitle()%></option>



                                        <%
                                            }%>
                                    </select>
                                </div>
                                <div class="text-center">
                                    <button type="submit" class="btn btn-outline-primary ">Add product</button>
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

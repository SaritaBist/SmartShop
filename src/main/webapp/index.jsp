<%@page import="com.mycompany.Handler.handler"%>
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
        <title>Registration Page</title>
        <link href="https://fonts.googleapis.com/css2?family=Ysabeau+Infant:ital,wght@1,200&display=swap" rel="stylesheet">
        <%@include file="Component/common_css_js.jsp" %>
        <style>
            body{
                background-color: #FDFDFB;
            }
        </style>

    </head>
    <body>
        <%@include file="Component/Navbar.jsp" %>


        <%            String c = request.getParameter("category");
            ProductDao pdo = new ProductDao(FactoryProvider.getFactory());
            List<Product> plist = null;
            if (c == null) {
                plist = pdo.getProductDetails();
            } else if (c.trim().equals("all")) {
                plist = pdo.getProductDetails();
            } else {
                int cid = Integer.parseInt(c.trim());
                plist = pdo.getProductById(cid);
            }

            CategoryDao cdao = new CategoryDao(FactoryProvider.getFactory());
            List<Category> clist = cdao.getCategoryDetails();

        %>


        <nav class="navbar navbar-expand-lg bg-body-tertiary">
            <div class="container" >

                <div class="collapse navbar-collapse" id="navbarSupportedContent" >


                    <a href="index.jsp?category=all" class="list-group-item  change-btn  list-group-item-action  m-2  text-center  items" aria-current="true">
                        All 
                    </a>



                    <%           for (Category category : clist) {
                    %>

                    <a href="index.jsp?category=<%=category.getCatogeryId()%>" class=" m-2  change-btn text-center list-group-item list-group-item-action items "><%=category.getCatogeryTitle()%></a>
                    <%
                        }
                    %>




                </div>
            </div>
        </nav>
        <div id="carouselExampleAutoplaying" class="carousel slide" data-bs-ride="carousel">
            <div class="carousel-inner">
                <div class="carousel-item active" data-bs-interval="2000">
                    <img src="Images/pic2.jpg" class="d-block w-100" alt="..." style="height:250px">
                </div>
                <div class="carousel-item" data-bs-interval="2000">
                    <img src="Images/pic4.jpg" class="d-block w-100" alt="..." style="height:250px">
                </div>
                <div class="carousel-item" data-bs-interval="2000">
                    <img src="Images/pic3.jpg" class="d-block w-100" alt="..." style="height:250px">
                </div>
            </div>
            <button class="carousel-control-prev" type="button" data-bs-target="#carouselExampleAutoplaying" data-bs-slide="prev">
                <span class="carousel-control-prev-icon" aria-hidden="true"></span>
                <span class="visually-hidden">Previous</span>
            </button>
            <button class="carousel-control-next" type="button" data-bs-target="#carouselExampleAutoplaying" data-bs-slide="next">
                <span class="carousel-control-next-icon" aria-hidden="true"></span>
                <span class="visually-hidden">Next</span>
            </button>
        </div>


        <div class="container-fluid">
            <div class="row mt-4 mx-3">

                <!--            category-->
                <!--                <div class="col-md-4">
                
                                    <div class="list_group mt-4">
                                        <a href="index.jsp?category=all" class="list_group_item list_group_utem_action active">
                                            All products
                                        </a>
                <%           for (Category category : clist) {
                %>

                <a href="index.jsp?category=<%=category.getCatogeryId()%>" class=" m-2   text-center list-group-item list-group-item-action items "><%=category.getCatogeryTitle()%></a>
                <%
                    }
                %>
            </div>
        </div>-->


                <!-- show product -->
                <div class="col-md-10 offset-md-1">
                    <div class="row row-cols-1 row-cols-md-3 g-4 ">

                        <% for (Product p : plist) {
                        %>

                        <div class="col">
                                <div class="card ">
                                    <a style="text-decoration: none;" href="product.jsp?productId=<%= p.getProduct_id()%>">
                                    <img src="Images/Products/<%=p.getProduct_photo()%>" style=" height: 200px;" class="card-img-top" alt="...">
                                    <div class="card-body">
                                        <h5 class="card-title"><%=p.getProduct_name()%></h5>
<!--                                        <p class="card-text"><%=handler.get10words(p.getProduct_desc())%></p>-->

                                    </div>
                                </a>
                                    <div class="card-footer text-center">
<!--                                        <button class="btn custom_bg text-white" onclick="add_to_cart(<%=p.getProduct_id()%>, '<%=p.getProduct_name()%>',<%=p.getPriceAfterDiscount()%>)">Add to cart</button>-->
                                        <button class="btn  btn-outline-success ">&#8377;<%=p.getPriceAfterDiscount()%>/-<span   class="  discount-label">off <%=p.getProduct_discount()%>% </span>
                                            <span class="discount-label" style="text-decoration: line-through">&#8377 <%=p.getProduct_price()  %></span></button>
                                    </div>
                                </div> 
                           
                        </div>
                        <%
                            }
                        %>

                    </div>
                </div>
            </div>
        </div>
        <div class="mt-3">
            <%@include file="footer.jsp" %>
        </div>
        <%@include file="Component/common_model.jsp" %>

    </body>
</html>


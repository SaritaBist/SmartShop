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
        <title>Searched Product</title>
        <link href="https://fonts.googleapis.com/css2?family=Ysabeau+Infant:ital,wght@1,200&display=swap" rel="stylesheet">
        <%@include file="Component/common_css_js.jsp" %>
      
    </head>
    <body>
        <%@include file="Component/Navbar.jsp" %>
        <% 
            
            String c = (String)request.getAttribute("searchData");
           
            ProductDao pdo = new ProductDao(FactoryProvider.getFactory());
            List<Product> plist = null;
            if (c == null) {
                plist = pdo.getProductDetails();
            } else {
                plist = pdo.getSearchProductByName(c.toLowerCase());
            }
         
        

        %>
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


                <!-- show product -->
                <div class="col-md-12">
                    <div class="row row-cols-1 row-cols-md-4 g-4 ">

                        <%                            for (Product p : plist) {
                        %>

                        <div class="col">
                            <div class="card">
                                <img src="Images/Products/<%=p.getProduct_photo()%>" style=" height: 200px;" class="card-img-top" alt="...">
                                <div class="card-body">
                                    <h5 class="card-title"><%=p.getProduct_name()%></h5>
                                    <p class="card-text"><%=handler.get10words(p.getProduct_desc())%></p>

                                </div>
                                <div class="card-footer text-center">
                                    <button class="btn custom_bg text-white" onclick="add_to_cart(<%=p.getProduct_id()%>, '<%=p.getProduct_name()%>',<%=p.getPriceAfterDiscount()%>)">Add to cart</button>
                                    <button class="btn  btn-outline-success ">&#8377;<%=p.getPriceAfterDiscount()%>/-<span   class="  discount-label">off <%=p.getProduct_discount()%>% </span>
                                        <span class="discount-label" style="text-decoration: line-through">&#8377 <%=p.getPriceAfterDiscount()%></span></button>
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
        <%@include file="Component/common_model.jsp" %>
        
    </body>
</html>

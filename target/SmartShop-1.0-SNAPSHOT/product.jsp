 <%@page import="com.mycompany.Handler.FactoryProvider"%>
<%@page import="com.company.dao.ProductDao"%>
<%@page import="MyEntity.Product"%>

<%
    // Get the productId parameter from the URL
    String productId = request.getParameter("productId");

    ProductDao pdao = new ProductDao(FactoryProvider.getFactory());
    // Use the productId to fetch the product details (pseudo code)
    Product product = pdao.getProductByProductId(Integer.parseInt(productId));
    
%>

<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1.0" />
        <title>Document</title>
        <!-- <link rel="stylesheet" href="style.css" /> -->
        <!-- <script src="index.js"></script> -->
        <%@include file="Component/common_css_js.jsp" %>
        <link rel="preconnect" href="https://fonts.googleapis.com" />
        <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin />
        <link
            href="https://fonts.googleapis.com/css2?family=Open+Sans:wght@300;400;500;600;700;800&display=swap"
            rel="stylesheet"
            />
        <link
            href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css"
            rel="stylesheet"
            integrity="sha384-4bw+/aepP/YC94hEpVNVgiZdgIC5+VKNBQNGCHeKRQN+PtmoHDEXuppvnDJzQIu9"
            crossorigin="anonymous"
            />
        <script
            src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/js/bootstrap.bundle.min.js"
            integrity="sha384-HwwvtgBNo3bZJJLYd8oVXjrBZt8cqVSpeBNS5n7C8IVInixGAoxmnlMuBnhbgrkm"
            crossorigin="anonymous"
        ></script>
        <link
            rel="stylesheet"
            href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.5/font/bootstrap-icons.css"
            />
        <style>
            body{
                background-color: #FDFDFB;
            }
            #product_img{
                max-width:30rem;
                max-height: 30rem;
            }
            .circlePP{
                display:flex;
                align-items: center;
                justify-content: center;
                margin-left:1.5rem;
                padding:2rem;
                border-radius: 50%;
                height: 3rem;
                width: 3rem;
                font-size: 2rem;
                color:white;
                margin-top: 1rem;
                
                
            }
        </style>
       
    </head>
    <body>
        <%@include file="Component/Navbar.jsp" %>
        <div class="container py-5">
            <div class="row py-4">
                <div class="col-lg-6 col-md-7 text-center">
                    <img
                        src="Images/Products/<%=product.getProduct_photo()%>"
                        alt="<%= product.getProduct_photo() %>"
                        id="product_img"
                        />
                </div>
                <div class="col-lg-6 col-md-5 mx-auto">
                    <h4 class="text-uppercase text-black"> <%= product.getCategory().getCatogeryTitle() %> </h4>
                    <h1 class="display-5"> <%= product.getProduct_name() %> </h1>
                    <p class="lead fw-bolder">
                     
                    </p>
                    <h3 class="display-6 fw-bold my-4">Rs <%= product.getPriceAfterDiscount() %></h3>
                    
                    <p class="lead text-justify">
                        <%= product.getProduct_desc() %>
                    </p>
                    <button class="btn btn-outline-dark px-4 py-2" onclick="add_to_cart(<%=product.getProduct_id()%>, '<%=product.getProduct_name()%>',<%=product.getPriceAfterDiscount()%>)">Add to cart</button>
                </div>
            </div>
        </div>
                    
                    
        <%@include file="review.jsp" %>
        
        <div class="mt-3">
            <%@include file="footer.jsp" %>
        </div>
        <%@include file="Component/common_model.jsp" %>
    </body>
</html>

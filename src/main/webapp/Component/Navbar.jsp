<%@page import="MyEntity.Users"%>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css"/>

<%
    Users u = (Users) session.getAttribute("current_user");
%>


<nav class="navbar navbar-expand-lg  navbar-dark custom_bg">
    <div class="container me-3 ">

        <a class="navbar-brand name" href="index.jsp">SmartBuy</a>
        <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse" id="navbarSupportedContent">
            <ul class="navbar-nav me-auto mb-2 mb-lg-0 nav">
                <li class="nav-item">
                    <a class="nav-link active change-font" aria-current="page" href="index.jsp">Home</a>
                </li>
<!--                <li class="nav-item">
                    <a class="nav-link active" aria-current="page" href="contact.jsp">Contact Us</a>
                </li>-->
                <form action="SearchServlet">
                    <input class="form-control me-2 mx-5"  name="searchproduct" placeholder="Search category  or product name" type="search" aria-label="Search">
                </form>

            </ul>

            <ul class="navbar-nav me-auto mb-2 mb-lg-0 ms-auto nav ">
                <li class="nav-item ">
                    <a class="nav-link active" data-bs-toggle="modal" data-bs-target="#cart"   href="#"><i style="font-size:25px; color:white" class=" mt-2 fa fa-cart-plus"></i><span class="card-items" style="font-size:20px">(0)</span></a>
                </li>

                <%
                    if (u == null) {

                %>

                <li class="nav-item ">
                    <a class="nav-link active m-2 change-font" aria-current="page" href="login.jsp">Login</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link active m-2 change-font" aria-current="page" href="registration.jsp">Sign up</a>
                </li>
            </ul>
            <%        } else {

            %>
            <ul class="navbar-nav me-auto mb-2 mb-lg-0 ms-auto nav">
                <li class="nav-item">
                    <a class="nav-link active change-font" aria-current="page" href="<%= u.getUserType().equalsIgnoreCase("admin") ? "admin.jsp" : "index.jsp"%>">Welcome <%=u.getUserName()%></a>
                </li>
                <li class="nav-item">
                    <a class="nav-link active change-font" aria-current="page" href="LogoutServlet">Logout</a>
                </li>
            </ul>
            <%
                }
            %>
        </div>
    </div>



</nav>
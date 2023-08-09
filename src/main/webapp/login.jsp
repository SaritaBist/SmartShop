

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Login Page</title>
        <link rel="stylesheet" 
              href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
        <link rel="stylesheet" href="Css/login.css"/>
        <%@include file="Component/common_css_js.jsp" %>
        <style>
            body{
                background-color: #FBFDFB;
            }
        </style>


    </head>
    <body>
        <%@include file="Component/Navbar.jsp" %>


        <div class="container">
            <div class="text-center">
                <%@include file="message.jsp" %>
            </div>
            <div class="row mt-5 ">



                <div class="col-md-4  offset-md-4">
                    <!--                  <h4 class="text-center mt-4  site-name smart">Smart<span class="shop">Shop</span></h4>-->
                    <div class="card  border rounded-5 p-3 bg-white shadow box-area myform ">
                        <div >
                            <h4 class="text-center mt-3 " >Login</h4>
                        </div>
                        <div class="card-body">
                            <form action="LoginServlet" method="post">
                                <div class="mb-3 mt-3  ">
                                    <div class="form_item">
                                        <i class="fa-solid fa-envelope icon "></i>
                                        <!--                             <label for="email" class="form-label form-data">Email address</label>-->
                                        <input type="email" required name="user_email" class="form-control" id="email"  placeholder="Enter Email Address" aria-describedby="emailHelp">
                                    </div>

                                    <div class="mb-3 mt-4 form_item">
                                        <i class="fa-solid fa-lock icon"></i>
                                        <!--                                    <label for="pasword" class="form-label form-data">Password</label>-->
                                        <input type="password"  required name="user_password"  placeholder="Enter password" class="form-control" id="password">
                                    </div>

                                    <button type="submit" value="Login" class="btn btn-primary custom_bg col-12 mt-3" style="font-size: 18px;">Login</button>

                            </form>
                            <p class="mt-4 text-center" ><strong>New in SmartShop</strong>?<br><a  href="registration.jsp" class="text-center">Create an account</a></p>
                        </div>

                    </div>
                </div>
            </div>

        </div>
    </body>
</html>

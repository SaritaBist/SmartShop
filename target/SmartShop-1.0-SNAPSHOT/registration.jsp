<%-- 
    Document   : registration
    Created on : Jun 1, 2023, 2:47:17 PM
    Author     : Sarita
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>registration Page</title>
        <link rel="stylesheet" href="Css/registration.css"/>
        <link rel="stylesheet" 
              href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
        <%@include file="Component/common_css_js.jsp" %>
        <style>
            body{
                background-color: #FBFDFB;
            }
            .form-control
            {
                border-radius: 22px;
                border: 1px solid black;
            }

        </style>

    </head>
    <body>
        <%@include file="Component/Navbar.jsp" %>

        <div class="container">
            <div class="text-center">
                <%@include file="message.jsp" %>
            </div>
            <div class="row    mt-2">
                <div class="col-md-6 offset-md-3">
                    <div class="card border rounded-5 p-3 bg-white shadow box-area mt-4" style="height:450px; background: #e1e1e1;">
                        <div >
                            <h4 class="text-center mt-3">Create an account</h4>
                        </div>
                        <div class="card-body  ">
                            <form  action="Registration" method="post">

                                <div class="form-group">
                                    <div class=" row mb-2">
                                        <div class="col-md-6">
                                            <label for="name" class="form-label"> Name</label>
                                            
                                            <input type="text"  required name="user_name" class="form-control form-control-sm" id="name"  aria-describedby="emailHelp">
                                        </div>


                                        <div class="mb-2 col-md-6 ">
                                            <label for="email" class="form-label">Email </label><br>
                                            
                                                
                                            <input type="email"  required name="user_email" class="form-control form-control-sm" id="email"  aria-describedby="emailHelp">
                                            
                                        </div>
                                    </div>
                                </div>


                                <div class="form-group">
                                    <div class="row mb-2">
                                        <div class="col-md-6 mb-2">
                                            <label for="phone" class="form-label"> phone</label>
                                            <input type="number"  required name="user_phone" class="form-control form-control-sm" id="phone" aria-describedby="emailHelp">
                                        </div>

                                        <div class=" col-md-6 mb-2">
                                            <label for="address" class="form-label"> Address</label>
                                            <input  name="user_address"  required class="form-control form-control-sm"  ></textarea>
                                        </div>

                                    </div>
                                </div>
                                <div class="form-group">
                                    <div class="row mb-2">
                                        <div class="col-md-6 mb-2">
                                            <label for="password" class="form-label"> Password</label>
                                            <input type="password"  required name="user_password" class="form-control form-control-sm"  minlength="6" id="password" aria-describedby="emailHelp">
                                        </div>
                                        <div class="col-md-6 mb-2">
                                            <label for="password" class="form-label">Retype  Password</label>
                                            <input type="password"  required name="repassword" class="form-control form-control-sm"  minlength="6" id="password"  aria-describedby="emailHelp">
                                        </div>
                                    </div>
                                </div>
                                <div class="container text-center">
                                    <button  type="submit" class="btn btn-primary  mt-3">Register</button>

                                </div>
                                <p class="mt-3"><strong>Already have an account</strong>?<a href="login.jsp">Login in</a>
                            </form>
                        </div>
                    </div>

                </div>
            </div>
        </div>
    </body>
</html>

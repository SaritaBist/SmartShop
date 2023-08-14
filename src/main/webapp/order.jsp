
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@page import="java.util.List"%>
<%@page import="org.json.JSONObject"%>
<%@page import="org.json.JSONArray"%>
<%
     Users user = (Users) session.getAttribute("current_user");
    if (user == null) {
        session.setAttribute("message", "You are not logged in! Login first to access checkout page");
        response.sendRedirect("login.jsp");
        return;
    }
    
    %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>checkout Page</title>
        <script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
        <%@include file="Component/common_css_js.jsp" %>
        <style>
            body{
                background-color: #FBFDFB;
            }
        </style>
    </head>
    <body>
        <%@include file="Component/Navbar.jsp" %>
        <div class="text-center">
            <%@include file="message.jsp" %>
        </div>

        <div class="container">
            <div class="row mt-3">
<!--                 selected Items-->
                <div class="col-md-6">
                    <div class="card">
                          <h4 class="text-center">Your selected items</h4>
                           <div class="module-body"></div>
                    </div>
                </div>
                
<!--                for order details-->
                <div class="col-md-5 ">
                    <div class="card">
                        <div class="card-body">
                            <form action="Orderservlet"  method="post">
                                <h5 class="text-center">Your Details for Order</h5>
                                <div class="mb-1">
                                    <label for="email" class="form-label">Email</label>
                                    <input type="email" name="email"  value="<%=user.getUserEmail()%>" class="form-control" id="email" aria-describedby="emailHelp">
                                  
                                </div>
                                <div class="mb-1">
                                    <label for="name" class="form-label"> Name</label>
                                    <input type="text"  name="name"  value="<%=user.getUserName()%>" class="form-control" id="name">
                                </div>
                                
                               
                                <div class="mb-1">
                                    <label for="address" class="form-label"> Address</label>
                                     <input type="text" name="address" value="<%=user.getUserAddress()%>" class="form-control" id="address">
                                </div>
                                <div class="mb-1">
                                    <label for="number" class="form-label">Phone Number</label>
                                     <input type="number" value="<%=user.getUserPhone()%>" name="phone" class="form-control" id="number">
                               </div>
                                <div class="mb-0">
                                    <label for="city" class="form-label">City</label>
                                     <input type="text" name="city" class="form-control" id="city">
                               </div>
                               <div class="mb-0">
                                    <label for="select" class="form-label">Select Payment Mode</label>
                                    <select name="payment_method" id="payment_method" class="form-select">  
                                        <option value="cod">Cash on delivery</option>
                                        <option value="khalti">Khalti</option>     
                                    </select>
                               </div>
                               <div class="my-3 d-flex justify-content-center ">
                                   <button type="button" onclick="makeOrder()" class="btn btn-warning w-25 mx-3">Cash On Delivery</button>
                                   <!--<button type="submit" class="btn"><img style="max-width: 8rem; max-height: 3rem" src="Images/khalti logo.jpeg"></button>-->
                               </div>
<!--                                  <div class="mb-0">
                                    <label for="select" class="form-label">Select Payment Mode</label>
                                    <select name="payment_method" class="form-select">
                                      
                                        <option value="cod">Cash on delivery</option>
                                         <option value="khalti">Khalti</option>
                                        
                                          
                                    </select>
                               </div>
                                 
                                
                                <div class="container text-center mt-1 mb-2">
                                    <button type="submit" class="btn btn-warning">Order Now</button>
                                </div>-->
                                
                            </form>
                        </div>
                    </div>
                </div>
            </div>
        </div>






        <%@include file="Component/common_model.jsp" %>
    </body>
</html>

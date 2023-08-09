/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package com.company.servlets;

import MyEntity.Order;
import com.company.dao.OrderDao;
import com.mycompany.Handler.FactoryProvider;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;


public class Orderservlet extends HttpServlet {

    
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try ( PrintWriter out = response.getWriter()) {
           
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet Orderservlet</title>");            
            out.println("</head>");
            out.println("<body>");
            String uname=request.getParameter("name");
            String uemail=request.getParameter("email");
            String city=request.getParameter("city");
            String uphone=request.getParameter("phone");
            String uaddress=request.getParameter("address");
            String payment=request.getParameter("payment_method");
             HttpSession session=request.getSession();
            
            if(payment.equals("noselect"))
            {
               
                session.setAttribute("message", "Select Cash on Delevery method");  
                response.sendRedirect("order.jsp");
                return;
            }
            Order o=new Order();
            o.setName(uname);
            o.setAddress(uaddress);
            o.setEmail(uemail);
            o.setPhone(uphone);
            o.setCity(city);
            o.setPayment_method(payment);
            
            OrderDao od=new OrderDao(FactoryProvider.getFactory());
             boolean result=od.generateOrder(o);
             out.println(result);
            
           
          session.setAttribute("message", "Order Successfully");
          response.sendRedirect("order.jsp");
            out.println("</body>");
            out.println("</html>");
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}

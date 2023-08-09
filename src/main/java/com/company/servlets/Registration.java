
package com.company.servlets;

import MyEntity.Users;
import com.mycompany.Handler.FactoryProvider;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import org.hibernate.Session;
import org.hibernate.Transaction;


public class Registration extends HttpServlet {

    
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
       try
       {
          
           PrintWriter out = response.getWriter();
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet Registration</title>");            
            out.println("</head>");
            out.println("<body>");
            String uname=request.getParameter("user_name");
            String uemail=request.getParameter("user_email");
            String upassword=request.getParameter("user_password");
            String repassword=request.getParameter("repassword");
            String uphone=request.getParameter("user_phone");
            String uaddress=request.getParameter("user_address");
             //creating session object
            HttpSession session=request.getSession();
            //Validation
            if(uname.isEmpty() || uemail.isEmpty() || upassword.isEmpty() || uphone.isEmpty() || uaddress.isEmpty() )
            {
                session.setAttribute("message", "Please Fill all fields");  
                response.sendRedirect("registration.jsp");
                return;
            }
//           
            else if(!(upassword.equalsIgnoreCase(repassword)))
            {
               session.setAttribute("message", "Please enter same password");  
                response.sendRedirect("registration.jsp");
                return; 
            }
            else
            {
                
            }
                   
            //Authentication
            Users user=new Users(uname,uemail,upassword,uphone,"sarita.jpg",uaddress,"Normal");
            Session s= FactoryProvider.getFactory().openSession();
            Transaction tx=s.beginTransaction();
            s.save(user);
            tx.commit();
            s.close();
           
            
            session.setAttribute("message","User Registered Successfully!");
            //redirect to registration.jsp page
            response.sendRedirect("registration.jsp");
            
            out.println("</body>");
            out.println("</html>");
       }catch(Exception ex)
       {
           ex.printStackTrace();
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

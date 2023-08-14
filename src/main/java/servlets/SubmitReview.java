package servlets;


import MyEntity.Review;
import com.company.dao.ReviewDao;
import com.mycompany.Handler.FactoryProvider;
import java.io.IOException;
import java.io.PrintWriter;
import java.text.SimpleDateFormat;
import java.util.Date;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class SubmitReview extends HttpServlet {

    
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        HttpSession sess = request.getSession();
        RequestDispatcher rd = null;
        try{
          
            
            
           int rating_data = Integer.parseInt(request.getParameter("rating_data"));
           String user_name = request.getParameter("user_name");
           String user_review = request.getParameter("user_review");
           int product_id = Integer.parseInt(request.getParameter("product_id"));
           Date date = new Date();
           
           Review r = new Review();
           r.setRating(rating_data);
           r.setUser_name(user_name);
           r.setReview_text(user_review);
           r.setProduct_id(product_id);
           r.setReview_date(date);
           
           ReviewDao rdao=new ReviewDao(FactoryProvider.getFactory());
           boolean result = rdao.AddReview(r);
           if(result){
               request.setAttribute("message", "Review Added Sucessfully.");
               rd.include(request, response);
           }
           
        }catch(Exception e){
            e.printStackTrace();
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

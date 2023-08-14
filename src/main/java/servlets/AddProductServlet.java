
package servlets;

import MyEntity.Category;
import MyEntity.Product;
import com.company.dao.CategoryDao;
import com.company.dao.ProductDao;
import com.mycompany.Handler.FactoryProvider;
import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;

@MultipartConfig
public class AddProductServlet extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try{ 
        PrintWriter out = response.getWriter();
            
         String pname=request.getParameter("ptitle");
         String pdescription=request.getParameter("pdescription");
         double pprice=Double.parseDouble(request.getParameter("pprice"));
         int pdiscount=Integer.parseInt(request.getParameter("pdiscount"));
         int pquantity=Integer.parseInt(request.getParameter("pquantity"));
         int cid=Integer.parseInt(request.getParameter("catid"));
            System.out.println("Multipart data");
         Part part = request.getPart("productName");

        
         
         Product p=new Product();
         p.setProduct_name(pname);
         p.setProduct_desc(pdescription);
         p.setProduct_discount(pdiscount);
         p.setProduct_price(pprice);
         p.setProduct_quantity(pquantity);
         p.setProduct_photo(part.getSubmittedFileName());
         
         //getcatogery
         
         CategoryDao cdo=new CategoryDao(FactoryProvider.getFactory());
         Category c=cdo.getCatogeryById(cid);
         p.setCategory(c);
         
          
         //ProductDao
         ProductDao pdo=new ProductDao(FactoryProvider.getFactory());
         pdo.addproduct(p);

//          getting img urls
         String url=request.getRealPath("Images")+File.separator+"Products"+File.separator+part.getSubmittedFileName();
 
         // uploading code
         try
         {
           InputStream is=part.getInputStream();
           byte[] data=new byte[is.available()];
           is.read(data);
         
           FileOutputStream fos=new FileOutputStream(url);
           fos.write(data);
         
           fos.close();
         }catch(IOException ex)
         {
             ex.printStackTrace();
         }
        
          HttpSession session=request.getSession();
          session.setAttribute("message", "Product Added Successfully");
          response.sendRedirect("admin.jsp");
        
         
        }catch(Exception e){}
        
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

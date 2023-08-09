

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <%
            String msg=(String)session.getAttribute("message");
            if(msg!=null)
            {
            
        
            %>
                 <div class="alert alert-warning alert-dismissible fade show" role="alert">
                    <strong><%=msg%></strong> 
                     <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
                   </div>

            <%
                }
            session.removeAttribute("message");

        %>
    </body>
</html>

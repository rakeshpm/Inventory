package org.rakesh;
 
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/login")
public class ServerAdminLogin extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private final String userID = "admin";
    private final String password = "1986ansher!";
 
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
 
        // get request parameters for userID and password
        String adoUser = request.getParameter("adoUser");
        String pass = request.getParameter("adoPassword");
 
        if (userID.equals(adoUser) && password.equals(pass)) {
            Cookie adoCookie = new Cookie("adoUser", adoUser);
            // setting cookie to expiry in 60 mins
            adoCookie.setMaxAge(60 * 60);
            response.addCookie(adoCookie);
            response.sendRedirect("/Inventory/forms/srvdetails.jsp");
        } else {
            RequestDispatcher rd = getServletContext().getRequestDispatcher("/login.html");
            PrintWriter out = response.getWriter();
            out.println("<font color=red><b>Invalid Login Credentials.</b></font>\n");
            rd.include(request, response);
        }
 
    }
}
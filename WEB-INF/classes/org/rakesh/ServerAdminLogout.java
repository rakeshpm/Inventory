package org.rakesh;
 
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
 

@WebServlet("/logout")
public class ServerAdminLogout extends HttpServlet {
    private static final long serialVersionUID = 1L;
 
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html");
        Cookie adoCookie = null;
        Cookie[] cookies = request.getCookies();
        if (cookies != null) {
            for (Cookie cookie : cookies) {
                if (cookie.getName().equals("adoUser")) {
                    adoCookie = cookie;
                    break;
                }
            }
        }
        if (adoCookie != null) {
            adoCookie.setMaxAge(0);
            response.addCookie(adoCookie);
        }
        response.sendRedirect("server.jsp");
    }
 
}
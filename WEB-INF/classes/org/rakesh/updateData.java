package org.rakesh;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.Statement;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class insertData
 */
@WebServlet("/updateData")
public class updateData extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public updateData() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		// doGet(request, response);
		
		 response.setContentType("text/html");  
         PrintWriter printwriter = response.getWriter(); 
     
         Connection connection = null;
         String url="jdbc:postgresql://localhost:5432/";
         String dbName="inventory";
         String driver="org.postgresql.Driver";
         
         String col1 = request.getParameter("col1");
         String col2 = request.getParameter("col2");
         String hostname = request.getParameter("hostname");
         
     try{  
         
       
       Class.forName(driver).newInstance();  
       connection = DriverManager.getConnection(url+dbName,"postgres", "admin");
       Statement stmt = connection.createStatement();
       String sql = "update inventory set " + col1 + " = '" + col2 + "' where hostname = UPPER('" + hostname + "')";
        
       int i = stmt.executeUpdate(sql);
       
       
       if(i!=0){  
    	   response.sendRedirect("/Inventory/forms/srvsuccess.jsp");
       }  
       else{  
    	   response.sendRedirect("/Inventory/forms/srvfailed.jsp");
           }  
       stmt.close();
     }  
     catch (Exception e){  
    	 printwriter.println(e); 
    	 response.sendRedirect("/Inventory/forms/srvfailed.jsp");
     }  

		
	}

}

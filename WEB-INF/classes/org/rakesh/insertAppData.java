package org.rakesh;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class insertData
 */
@WebServlet("/addApp")
public class insertAppData extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public insertAppData() {
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
   
     try{  
       String appname = request.getParameter("appname");
       String loc = request.getParameter("loc");
       String outagedl = request.getParameter("outagedl");
       String dbname = request.getParameter("dbname");
       String dbport = request.getParameter("dbport");
       String loadbd = request.getParameter("loadbd");
       String applog = request.getParameter("applog");
       String diagram = request.getParameter("diagram");
       String weburl = request.getParameter("weburl");
       String appurl1 = request.getParameter("appurl1");
       String appurl2 = request.getParameter("appurl2");
       String appurl3 = request.getParameter("appurl3");
       String appurl4 = request.getParameter("appurl4");
       String appprimname = request.getParameter("appprimname");
       String appprimemail = request.getParameter("appprimemail");
       String appprimcont = request.getParameter("appprimcont");
       String appsecdname = request.getParameter("appsecdname");
       String appsecdemail = request.getParameter("appsecdemail");
       String appsecdcont = request.getParameter("appsecdcont");
       String appmangname = request.getParameter("appmangname");
       String appmangemail = request.getParameter("appmangemail");
       String appmangcont = request.getParameter("appmangcont");
       String adoprimname = request.getParameter("adoprimname");
       String adoprimemail = request.getParameter("adoprimemail");
       String adoprimcont = request.getParameter("adoprimcont");
       String adosecdname = request.getParameter("adosecdname");
       String adosecdemail = request.getParameter("adosecdemail");
       String adosecdcont = request.getParameter("adosecdcont");
       String adomangname = request.getParameter("adomangname");
       String adomangemail = request.getParameter("adomangemail");
       String adomangcont = request.getParameter("adomangcont");
       
       Class.forName(driver).newInstance();  
       connection = DriverManager.getConnection(url+dbName,"postgres", "admin");
       PreparedStatement preparestatement =(PreparedStatement) connection.prepareStatement("insert into application (appname,loc,outagedl,dbname,dbport,loadbd,applog,diagram,weburl,appurl1,appurl2,appurl3,appurl4,appprimname,appprimemail,appprimcont,appsecdname,appsecdemail,appsecdcont,appmangname,appmangemail,appmangcont,adoprimname,adoprimemail,adoprimcont,adosecdname,adosecdemail,adosecdcont,adomangname,adomangemail,adomangcont) values(UPPER(?),?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)");  

       preparestatement.setString(1,appname);
       preparestatement.setString(2,loc);
       preparestatement.setString(3,outagedl);
       preparestatement.setString(4,dbname);
       preparestatement.setString(5,dbport);
       preparestatement.setString(6,loadbd);
       preparestatement.setString(7,applog);
       preparestatement.setString(8,diagram);
       preparestatement.setString(9,weburl);
       preparestatement.setString(10,appurl1);
       preparestatement.setString(11,appurl2);
       preparestatement.setString(12,appurl3);
       preparestatement.setString(13,appurl4);
       preparestatement.setString(14,appprimname);
       preparestatement.setString(15,appprimemail);
       preparestatement.setString(16,appprimcont);
       preparestatement.setString(17,appsecdname);
       preparestatement.setString(18,appsecdemail);
       preparestatement.setString(19,appsecdcont);
       preparestatement.setString(20,appmangname);
       preparestatement.setString(21,appmangemail);
       preparestatement.setString(22,appmangcont);
       preparestatement.setString(23,adoprimname);
       preparestatement.setString(24,adoprimemail);
       preparestatement.setString(25,adoprimcont);
       preparestatement.setString(26,adosecdname);
       preparestatement.setString(27,adosecdemail);
       preparestatement.setString(28,adosecdcont);
       preparestatement.setString(29,adomangname);
       preparestatement.setString(30,adomangemail);
       preparestatement.setString(31,adomangcont);
       
      
       int i = preparestatement.executeUpdate();
       
       
       if(i!=0){  
    	   response.sendRedirect("/Inventory/forms/successapp.jsp");
       }  
       else{  
    	   response.sendRedirect("/Inventory/forms/failedapp.jsp");
        }  
       preparestatement.close();
     }  
     catch (Exception e){  
    	 printwriter.println(e);
    	 
     }  

		
	}

}

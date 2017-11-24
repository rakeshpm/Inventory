package org.rakesh;

import java.io.IOException;
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
@WebServlet("/addServer")
public class insertData extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public insertData() {
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
     
         Connection connection = null;
         String url="jdbc:postgresql://localhost:5432/";
         String dbName="inventory";
         String driver="org.postgresql.Driver";
   
     try{  
       String vertical = request.getParameter("vertical");  
       String environment = request.getParameter("environment");  
       String servertype = request.getParameter("servertype");  
       String hostname = request.getParameter("hostname");
       String purpose = request.getParameter("purpose");
       String products = request.getParameter("products");
       String os = request.getParameter("os");  
       String osversion = request.getParameter("osversion");  
       String cpu = request.getParameter("cpu");  
       String cpucores = request.getParameter("cpucores");  
       String memory = request.getParameter("memory");
       String swap = request.getParameter("swap");
       String ipaddress = request.getParameter("ipaddress");
       String dnsaddress = request.getParameter("dnsaddress");
       String drive1 = request.getParameter("drive1");
       String dsize1 = request.getParameter("dsize1");
       String drive2 = request.getParameter("drive2");
       String dsize2 = request.getParameter("dsize2");
       String drive3 = request.getParameter("drive3");
       String dsize3 = request.getParameter("dsize3");
       String drive4 = request.getParameter("drive4");
       String dsize4 = request.getParameter("dsize4");
       String drive5 = request.getParameter("drive5");
       String dsize5 = request.getParameter("dsize5");
       String drive6 = request.getParameter("drive6");
       String dsize6 = request.getParameter("dsize6");
       String drive7 = request.getParameter("drive7");
       String dsize7 = request.getParameter("dsize7");
       String drive8 = request.getParameter("drive8");
       String dsize8 = request.getParameter("dsize8");
       String drive9 = request.getParameter("drive9");
       String dsize9 = request.getParameter("dsize9");
       String drive10 = request.getParameter("drive10");
       String dsize10 = request.getParameter("dsize10");
       String drive11 = request.getParameter("drive11");
       String dsize11 = request.getParameter("dsize11");
       String drive12 = request.getParameter("drive12");
       String dsize12 = request.getParameter("dsize12");
       
       
       
       Class.forName(driver).newInstance();  
       connection = DriverManager.getConnection(url+dbName,"postgres", "admin");
       PreparedStatement preparestatement =(PreparedStatement) connection.prepareStatement("insert into inventory (vertical,environment,servertype,hostname,purpose,products,os,osversion,cpu,cpucores,memory,swap,ipaddress,dnsaddress,drive1,dsize1,drive2,dsize2,drive3,dsize3,drive4,dsize4,drive5,dsize5,drive6,dsize6,drive7,dsize7,drive8,dsize8,drive9,dsize9,drive10,dsize10,drive11,dsize11,drive12,dsize12) values(?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)");  

       preparestatement.setString(1,vertical);  
       preparestatement.setString(2,environment);        
       preparestatement.setString(3,servertype);
       preparestatement.setString(4,hostname);
       preparestatement.setString(5,purpose);
       preparestatement.setString(6,products);
       preparestatement.setString(7,os);
       preparestatement.setString(8,osversion);
       preparestatement.setString(9, cpu);
       preparestatement.setString(10,cpucores);
       preparestatement.setString(11,memory);
       preparestatement.setString(12, swap);
       preparestatement.setString(13,ipaddress);
       preparestatement.setString(14,dnsaddress);
       preparestatement.setString(15,drive1);
       preparestatement.setString(16,dsize1);
       preparestatement.setString(17,drive2);
       preparestatement.setString(18,dsize2);
       preparestatement.setString(19,drive3);
       preparestatement.setString(20,dsize3);
       preparestatement.setString(21,drive4);
       preparestatement.setString(22,dsize4);
       preparestatement.setString(23,drive5);
       preparestatement.setString(24,dsize5);
       preparestatement.setString(25,drive6);
       preparestatement.setString(26,dsize6);
       preparestatement.setString(27,drive7);
       preparestatement.setString(28,dsize7);
       preparestatement.setString(29,drive8);
       preparestatement.setString(30,dsize8);
       preparestatement.setString(31,drive9);
       preparestatement.setString(32,dsize9);
       preparestatement.setString(33,drive10);
       preparestatement.setString(34,dsize10);
       preparestatement.setString(35,drive11);
       preparestatement.setString(36,dsize11);
       preparestatement.setString(37,drive12);
       preparestatement.setString(38,dsize12);

       int i = preparestatement.executeUpdate();
       
      
       if(i!=0){  
    	   response.sendRedirect("success.jsp");
       }  
       else{  
    	   response.sendRedirect("srvfailed.jsp");
        }  
       preparestatement.close();
     }  
     catch (Exception e){  
    	 response.sendRedirect("srvfailed.jsp"); 
     }  

		
	}

}

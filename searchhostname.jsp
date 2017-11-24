<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="java.io.*,java.util.*, javax.servlet.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<link rel="stylesheet" href="css/searchserver.css" ></link>
<link rel="stylesheet" href="css/main.css" ></link>
<title>Server Inventory</title>
</head>

<body>
<div class="maincontent" >
<form class="custom-dropdown" action="searchhostname.jsp" method="get" >

		<table cellpadding="5" cellspacing="5">

			<tr>
				<td>Product</td>
				<td>
				<select class="styled-select" name="vertical">
						<option value="CDA">CDA</option>
						<option value="CostAndOps">CostAndOps</option>
						<option value="EAB">EAB</option>
						<option value="HealthPost">HealthPost</option>
						<option value="HLI">HLI</option>
						<option value="Layer7">Layer7</option>
						<option value="SIAM">SIAM</option>
						<option value="SiteManager">SiteManager</option>
						
				</select>
				</td>
			</tr>
			<tr>
				<td>Environment</td>
				<td>
				<select class="styled-select" name="environment">
						<option value="Production">Production</option>
						<option value="Beta">Beta</option>
						<option value="Alpha">Alpha</option>
						<option value="Stage">Stage</option>
						<option value="Test">Test</option>
						<option value="QA">QA</option>
						<option value="Development">Development</option>
					</select>
				
				</td>
			</tr>
			<tr>
				<td>Server Type</td>
				<td>
				<select class="styled-select" name="servertype">
						<option value="Application">Application</option>
						<option value="Archive">Archive</option>
						<option value="Database">Database</option>
						<option value="FTP">FTP</option>
						<option value="Informatica">Informatica</option>
						<option value="LDAP">LDAP</option>
						<option value="Microstratergy">MicroStratergy</option>
						<option value="Portal">Portal</option>
						<option value="Terminal">Terminal</option>
						<option value="Webserver">WebServer</option>
				</select>
				
				</td>
			</tr>
		</table>
		<input type="submit" value="Search" />

	</form>

<% 

java.sql.Connection connection;
java.sql.Statement statement;
java.sql.ResultSet resultset;
java.sql.PreparedStatement preparedstatement;

connection = null;
statement = null;
resultset = null;
preparedstatement = null;

// Remember to change the next line with your own environment 
String url= 
"jdbc:postgresql://localhost/inventory";
String id= "postgres";
String pass = "admin";
try{

Class.forName("org.postgresql.Driver");
connection = java.sql.DriverManager.getConnection(url, id, pass);

}catch(ClassNotFoundException cnfex){
cnfex.printStackTrace();

}


String vertical = request.getParameter("vertical");
String environment = request.getParameter("environment");
String servertype = request.getParameter("servertype");



try{
	

	
String sql = "select hostname from inventory where vertical = '" + vertical + "' AND environment = '" + environment + "' AND servertype = '" + servertype + "' order by hostname" ;

statement = connection.createStatement();
resultset = statement.executeQuery(sql);

%>

<%
while( resultset.next() ){
%>
	
	<%=resultset.getString(1)%><br>
	
<%	
}
%>

<%

}catch(Exception e){
	e.printStackTrace();
}finally{
if(resultset != null) resultset.close();
if(statement != null) statement.close();
if(connection != null) connection.close();
}

%>
</div>
</body>

</html>
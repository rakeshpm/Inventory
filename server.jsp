<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="java.io.*,java.util.*, javax.servlet.*" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<link rel="stylesheet" href="css/main.css"></link>
<link rel="stylesheet" href="css/ado.css"></link>
<title>Server Inventory</title>
</head>

<body>

<nav>
<div class="dropdown">
  <button class="dropbtn">Application</button>
  <div class="dropdown-content">
    <a href="application.jsp">Application</a>
    <a href="applogin.html">Administration</a>
  </div>
</div>

<div class="dropdown">
  <button class="dropbtn">Database</button>
  <div class="dropdown-content">
    <a href="database.jsp">Database</a>
    <a href="dblogin.html">Administration</a>
  </div>
</div>

<div class="dropdown">
  <button class="dropbtn">Servers</button>
  <div class="dropdown-content">
    <a href="server.jsp">Servers</a>
    <a href="login.html">Administration</a>
  </div>
</div>
</nav>

<%
response.setHeader("Pragma","no-cache");
response.setHeader("Cache-Control","no-store");
response.setHeader("Expires","0");
response.setDateHeader("Expires",-1);
%> 


<form action="server.jsp" method="get">
		
		Enter HostName : <input type="text" placeholder="Server Name" name="hostname" />
		<input type="submit" value="Search" />
</form>	

<% 

java.sql.Connection connection;
java.sql.Statement statement;
java.sql.ResultSet resultset;
java.sql.PreparedStatement preparedstatement;

connection=null;
statement=null;
preparedstatement=null;
resultset=null;

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
String sql = "select * from inventory where hostname = upper('" + request.getParameter("hostname") + "')";
try{
statement = connection.createStatement();
resultset = statement.executeQuery(sql);
%>

<%
while( resultset.next() ){
%>
<div class="servercontent">
<table>
		<tr><td><b>Vertical</b></td><td><b> : </b></td><td><%=resultset.getString(1) %></td></tr>
	    <tr><td><b>Environment</b></td><td><b> : </b></td><td><%=resultset.getString(2) %></td></tr>
	    <tr><td><b>ServerType</b></td><td><b> : </b></td><td><%=resultset.getString(3) %></td></tr>
	    <tr><td><b>Server Name</b></td><td><b> : </b></td><td><%=resultset.getString(4) %></td></tr>
	    <tr><td><b>What's Running</b></td><td><b> : </b></td><td><%=resultset.getString(5) %></td></tr>
	    <tr><td><b>Products</b></td><td><b> : </b></td><td><%=resultset.getString(6) %></td></tr>
	    <tr><td><b>OS</b></td><td><b> : </b></td><td><%=resultset.getString(7) %></td></tr>
	    <tr><td><b>Version</b></td><td><b> : </b></td><td><%=resultset.getString(8) %></td></tr>
	    <tr><td><b>CPU</b></td><td><b> : </b></td><td><%=resultset.getString(9) %></td></tr>
	    <tr><td><b>CPU Cores</b></td><td><b> : </b></td><td><%=resultset.getString(10) %></td></tr>
	    <tr><td><b>Memory</b></td><td><b> : </b></td><td><%=resultset.getString(11) %></td></tr>
	    <tr><td><b>Swap</b></td><td><b> : </b></td><td><%=resultset.getString(12) %></td></tr>
	    <tr><td><b>IP Address</b></td><td><b> : </b></td><td><%=resultset.getString(13) %></td></tr>
	    <tr><td><b>DNS Address</b></td><td><b> : </b></td><td><%=resultset.getString(14) %></td></tr>
</table>
</div>
<div class="disksp">
<table>	    
	    <tr><td><b>Drive Name</b></td><td><b> : </b></td><td><b>Total Size in GB</b></td></tr>
	    <tr><td><%=resultset.getString(15) %></td><td></td><td><%=resultset.getString(16) %></td></tr>
	    <tr><td><%=resultset.getString(17) %></td><td></td><td><%=resultset.getString(18) %></td></tr>
	    <tr><td><%=resultset.getString(19) %></td><td></td><td><%=resultset.getString(20) %></td></tr>
	    <tr><td><%=resultset.getString(21) %></td><td></td><td><%=resultset.getString(22) %></td></tr>
	    <tr><td><%=resultset.getString(23) %></td><td></td><td><%=resultset.getString(24) %></td></tr>
	    <tr><td><%=resultset.getString(25) %></td><td></td><td><%=resultset.getString(26) %></td></tr>
	    <tr><td><%=resultset.getString(27) %></td><td></td><td><%=resultset.getString(28) %></td></tr>
	    <tr><td><%=resultset.getString(29) %></td><td></td><td><%=resultset.getString(30) %></td></tr>
	    <tr><td><%=resultset.getString(31) %></td><td></td><td><%=resultset.getString(32) %></td></tr>
	    <tr><td><%=resultset.getString(33) %></td><td></td><td><%=resultset.getString(34) %></td></tr>
	    <tr><td><%=resultset.getString(35) %></td><td></td><td><%=resultset.getString(36) %></td></tr>
	    <tr><td><%=resultset.getString(37) %></td><td></td><td><%=resultset.getString(38) %></td></tr>
</table>
</div>
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

</body>

</html>
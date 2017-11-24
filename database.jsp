<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="java.io.*,java.util.*, javax.servlet.*" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<link rel="stylesheet" href="css/main.css"></link>
<link rel="stylesheet" href="css/ado.css"></link>
<title>Database Inventory</title>

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

<form action="dblogin.html" method="get">
		
		Enter Database Name : <input type="text" placeholder="Database Name" name="appname" />
				<select class="styled-select" name="location">
						<option value="onsite">OnSite</option>
						<option value="offshore">OffShore</option>
				</select>
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
String sql = "select * from application where appname = UPPER('" + request.getParameter("appname") + "') AND location = '" + request.getParameter("location") + "'";
try{
statement = connection.createStatement();
resultset = statement.executeQuery(sql);
%>

<%
while( resultset.next() ){
%>
<table>
		<tr><td><b>Application</b></td><td><b> : </b></td><td><a href="<%=resultset.getString(23) %>" target="_blank"><%=resultset.getString(2) %></a></td></tr>
		<tr><td><b>Outage Email DL</b></td><td><b> : </b></td><td><%=resultset.getString(21) %></td></tr>
		<tr><td><b>Database</b></td><td><b> : </b></td><td></td></tr>
		<tr><td><b>Web URL</b></td><td><b> : </b></td><td><a href="<%=resultset.getString(23) %>" target="_blank"><%=resultset.getString(23) %></a></td></tr>
		<tr><td><b>Application URL</b></td><td><b> : </b></td><td><a href="<%=resultset.getString(24) %>" target="_blank"><%=resultset.getString(24) %></a></td></tr>
		<tr><td><b></b></td><td></td><td><a href="<%=resultset.getString(25) %>" target="_blank"><%=resultset.getString(25) %></a></td></tr>
		<tr><td><b></b></td><td></td><td><a href="<%=resultset.getString(26) %>" target="_blank"><%=resultset.getString(26) %></a></td></tr>
		<tr><td><b></b></td><td></td><td><a href="<%=resultset.getString(27) %>" target="_blank"><%=resultset.getString(27) %></a></td></tr>
		<tr><td><b>App Log Location</b></td><td><b> : </b></td><td></td></tr>
		
		<tr><td><br></td></tr>
		<tr><td><b>Developers/ Engineers team</b></td>
		</tr><tr><td><b>Primary</b></td></tr>
		<tr><td>Name</td><td><b> : </b></td><td><%=resultset.getString(3) %></td></tr>
		<tr><td>Email</td><td><b> : </b></td><td><%=resultset.getString(4) %></td></tr>
		<tr><td>Contact</td><td><b> : </b></td><td><%=resultset.getString(5) %></td></tr>
		<tr><td><b>Secondary</b></td></tr>
	    <tr><td>Name</td><td><b> : </b></td><td><%=resultset.getString(6) %></td></tr>
	    <tr><td>Email</td><td><b> : </b></td><td><%=resultset.getString(7) %></td></tr>
	    <tr><td>Contact</td><td><b> : </b></td><td><%=resultset.getString(8) %></td></tr>
	    <tr><td><b>Escallation</b></td></tr>	    
	    <tr><td>Name</td><td><b> : </b></td><td><%=resultset.getString(9) %></td></tr>
	    <tr><td>Email</td><td><b> : </b></td><td><%=resultset.getString(10) %></td></tr>
	    <tr><td>Contact</td><td><b> : </b></td><td><%=resultset.getString(11) %></td></tr>
		<tr><td><br></td></tr>
</table>
<table>
		<tr><td><b>ADO - Application and Database Operations</b></td></tr>
		<tr><td><b>Primary</b></td></tr>
		<tr><td>Name</td><td><b> : </b></td><td><%=resultset.getString(12) %></td></tr>
		<tr><td>Email</td><td><b> : </b></td><td><%=resultset.getString(13) %></td></tr>
		<tr><td>Contact</td><td><b> : </b></td><td><%=resultset.getString(14) %></td></tr>
		<tr><td><b>Secondary</b></td></tr>
	    <tr><td>Name</td><td><b> : </b></td><td><%=resultset.getString(15) %></td></tr>
	    <tr><td>Email</td><td><b> : </b></td><td><%=resultset.getString(16) %></td></tr>
	    <tr><td>Contact</td><td><b> : </b></td><td><%=resultset.getString(17) %></td></tr>
	    <tr><td><b>Escallation</b></td></tr>	    
	    <tr><td>Name</td><td><b> : </b></td><td><%=resultset.getString(18) %></td></tr>
	    <tr><td>Email</td><td><b> : </b></td><td><%=resultset.getString(19) %></td></tr>
	    <tr><td>Contact</td><td><b> : </b></td><td><%=resultset.getString(20) %></td></tr>
</table>
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
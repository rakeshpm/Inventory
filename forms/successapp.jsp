<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<link rel="stylesheet" href="../css/forms.css"></link>
<title>Manager Servers</title>
</head>
<body>

 <script language="JavaScript" type="text/javascript">
	window.history.forward(1);
</script>

<form action="/Inventory/appadminlogout" method="post">
			<input type="submit" value="Logout" />
</form>

<h4><font color=blue>Data successfully modified on the Database</font></h4>
<%
		String userName = null;
            Cookie[] cookies = request.getCookies();
            if (cookies != null) {
                for (Cookie cookie : cookies) {
                    if (cookie.getName().equals("adoUser"))
                        userName = cookie.getValue();
                }
            }
            if (userName == null)
                response.sendRedirect("login.html");
%>
        

<h3>Delete Application</h3>
<form name="deleteAppData" action="/Inventory/deleteAppData" method="post">
		<input type="hidden" name="pagename" value="register" />
		<table cellpadding="4" cellspacing="4">
			<tr>
				<td>Application Name</td>
				<td><input type="text" name="appname" /></td>
				<td><button type="submit">Delete Application</button></td>
			</tr>
		</table>
</form>

<h3>Update Application Information</h3>
<form name="updateAppData" action="/Inventory/updateAppData" method="post">
		<table cellpadding="4" cellspacing="4">
			<tr>
				<td>Update Field</td>
				<td>
					<select name="col1">
						<option value="outagedl">OutageDL</option>
						<option value="dbname">DB Name</option>
						<option value="dbport">DB Port</option>
						<option value="applog">Application Log</option>
						<option value="diagram">Architecture Diagram</option>
						<option value="weburl">Web-URL</option>
						<option value="appurl1">App-URL-1</option>
						<option value="appurl2">App-URL-2</option>
						<option value="appurl3">App-URL-3</option>
						<option value="appurl4">App-URL-4</option>
						<option value="appprimname">APP Primary Name</option>
						<option value="appprimemail">APP Primary Email</option>
						<option value="appprimcont">APP Primary Contact</option>
						<option value="appsecdname">APP Secondary Name</option>
						<option value="appsecdemail">APP Secondary Email</option>
						<option value="appsecdcont">APP Secondary Contact</option>
						<option value="appmangname">APP Escallation Name</option>
						<option value="appmangemail">APP Escallation Email</option>
						<option value="appmangcont">APP Escallation Contact</option>
						<option value="adoprimname">ADO Primary Name</option>
						<option value="adoprimemail">ADO Primary Email</option>
						<option value="adoprimcont">ADO Primary Contact</option>
						<option value="adosecdname">ADO Secondary Name</option>
						<option value="adosecdemail">ADO Secondary Email</option>
						<option value="adosecdcont">ADO Secondary Contact</option>
						<option value="adomangname">ADO Escallation Name</option>
						<option value="adomangemail">ADO Escallation Email</option>
						<option value="adomangcont">ADO Escallation Contact</option>
					</select>
				</td>
				<td><input type="text" placeholder="Value" name="col2" /></td>
				<td><select name="loc">
						<option value="onsite">Onsite</option>
						<option value="offshore">Offshore</option>
				</select></td>
				<td><input type="text" placeholder="Applciation Name" name="appname" /></td>
				<td><button type="submit">Update App</button></td>
			</tr>
		</table>
</form>


		<h3>Add Application</h3>

	<form name="addApp" action="/Inventory/addApp" method="post">
		<input type="hidden" name="pagename" value="register" />
		<table cellpadding="5" cellspacing="5">

			<tr>
				<td>Application</td>
				<td><input type="text" name="appname" /></td>
					<td>Location</td>
				<td><select name="loc">
						<option value="onsite">Onsite</option>
						<option value="offshore">OffShore</option>
					</select>
				</td>
			</tr>
				<tr>
				<td>Outage Email DL</td>
				<td><input type="text" name="outagedl" /></td>
				<td>Load Balanced</td>
				<td><select name="location">
						<option value="yes">YES</option>
						<option value="no">NO</option>
					</select></td>
			</tr>
			<tr>
			
				<td>Database Name</td>
				<td><input type="text" name="dbname" /></td>
				<td>Database Port</td>
				<td><input type="text" name="dbport" /></td>
			</tr>
			<tr>
			
				<td>Application Log location</td>
				<td><input type="text" name="applog" /></td>
			</tr>
			<tr>
				<td>Architecture Diagram</td>
				<td><input type="text" name="diagram" /></td>
			</tr>
			
			<tr>
				<td>Web URL</td>
				<td><input type="text" name="weburl" /></td>
			</tr>
			<tr>
				<td>App URL 1</td>
				<td><input type="text" name="appurl1" /></td>
				<td>App URL 2</td>
				<td><input type="text" name="appurl2" /></td>
			</tr>
			<tr>
				<td>App URL 3</td>
				<td><input type="text" name="appurl3" /></td>
				<td>App URL 4</td>
				<td><input type="text" name="appurl4" /></td>
			</tr>
			<tr>
				<td></td>
				<td></td>
			</tr>
			<tr>
				<td>Engineer Primary Contact Name</td>
				<td><input type="text" name="appprimname" /></td>
			
				<td>Email</td>
				<td><input type="text" name="appprimemail" /></td>
			
				<td>Number</td>
				<td><input type="text" name="appprimcont" /></td>
			</tr>
			<tr>
				<td>Engineer Secondary Contact Name</td>
				<td><input type="text" name="appsecdname" /></td>
			
				<td>Email</td>
				<td><input type="text" name="appsecdemail" /></td>
			
				<td>Number</td>
				<td><input type="text" name="appsecdcont" /></td>
			</tr>
			<tr>
				<td>Engineer Escallation Contact Name</td>
				<td><input type="text" name="appmangname" /></td>
			
				<td>Email</td>
				<td><input type="text" name="appmangemail" /></td>
			
				<td>Number</td>
				<td><input type="text" name="appmangcont" /></td>
			</tr>
			
			<tr>
				<td>ADO Primary Contact Name</td>
				<td><input type="text" name="appprimname" /></td>
			
				<td>Email</td>
				<td><input type="text" name="appprimemail" /></td>
			
				<td>Number</td>
				<td><input type="text" name="appprimcont" /></td>
			</tr>
			<tr>
				<td>ADO Secondary Contact Name</td>
				<td><input type="text" name="appsecdname" /></td>
			
				<td>Email</td>
				<td><input type="text" name="appsecdemail" /></td>
			
				<td>Number</td>
				<td><input type="text" name="appsecdcont" /></td>
			</tr>
			<tr>
				<td>ADO Escallation Contact Name</td>
				<td><input type="text" name="appmangname" /></td>
			
				<td>Email</td>
				<td><input type="text" name="appmangemail" /></td>
			
				<td>Number</td>
				<td><input type="text" name="appmangcont" /></td>
			</tr>
			
			<tr>
				<td><button type="submit">Add Application</button></td>
			</tr>
		</table>

	</form>

</body>
</html>


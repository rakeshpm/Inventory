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

<form align="right" action="/Inventory/logout" method="post">
			<input type="submit" value="Logout" />
</form>

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

<h3>Delete Server</h3>
<form name="deleteData" action="/Inventory/deleteData" method="post">
		<input type="hidden" name="pagename" value="register" />
		<table cellpadding="4" cellspacing="4">
			<tr>
				<td>Hostname</td>
				<td><input type="text" name="hostname" /></td>
				<td><button type="submit">Delete Server</button></td>
			</tr>
		</table>
</form>

<h3>Update Server Information</h3>
<form name="updateData" action="/Inventory/updateData" method="post">
		<table cellpadding="4" cellspacing="4">
			<tr>
				<td>Update Field</td>
				<td>
					<select name="col1">
						<option value="purpose">Purpose</option>
						<option value="products">Products</option>
						<option value="os">OS</option>
						<option value="osversion">Version</option>
						<option value="cpu">CPU</option>
						<option value="cpucores">CPUCores</option>
						<option value="memory">Memory</option>
						<option value="swap">SWAP</option>
						<option value="ipaddress">IPaddress</option>
						<option value="dnsaddress">DNSadddress</option>
						<option value="drive1">Drive1</option>
						<option value="dsize1">Drive1 Size</option>
						<option value="drive2">Drive2</option>
						<option value="dsize2">Drive2 Size</option>
						<option value="drive3">Drive3</option>
						<option value="dsize3">Drive3 Size</option>
						<option value="drive4">Drive4</option>
						<option value="dsize4">Drive4 Size</option>
						<option value="drive5">Drive5</option>
						<option value="dsize5">Drive5 Size</option>
						<option value="drive6">Drive6</option>
						<option value="dsize6">Drive6 Size</option>
						<option value="drive7">Drive7</option>
						<option value="dsize7">Drive7 Size</option>
						<option value="drive8">Drive8</option>
						<option value="dsize8">Drive8 Size</option>
						<option value="drive9">Drive9</option>
						<option value="dsize9">Drive9 Size</option>
						<option value="drive10">Drive10</option>
						<option value="dsize10">Drive10 Size</option>
						<option value="drive11">Drive11</option>
						<option value="dsize11">Drive11 Size</option>
						<option value="drive12">Drive12</option>
						<option value="dsize12">Drive12 Size</option>
					</select>
				</td>
				<td><input type="text" placeholder="Value" name="col2" /></td>
				<td><input type="text" placeholder="Server Name" name="hostname" /></td>
				<td><button type="submit">Update Server</button></td>
			</tr>
		</table>
</form>

		<h3>Add Server</h3>

<form name="addServer" action="/Inventory/addServer" method="post">
		<input type="hidden" name="pagename" value="register" />
		<table cellpadding="4" cellspacing="4">

			<tr>
				<td>Product Vertical</td>
				<td><select name="vertical">
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
				<td>Environment</td>
				<td><select name="environment">
						<option value="Production">Production</option>
						<option value="Alpha">Alpha</option>
						<option value="Beta">Beta</option>
						<option value="Stage">Stage</option>
						<option value="Test">Test</option>
						<option value="QA">QA</option>
						<option value="Development">Development</option>
					</select>
				</td>
				<td>Server Type</td>
				<td>
				<select name="servertype">
						<option value="Application">Application</option>
						<option value="Archive">Archive</option>
						<option value="Database">Database</option>
						<option value="Informatica">Informatica</option>
						<option value="Microstratergy">MicroStratergy</option>
						<option value="WebServer">WebServer</option>
				</select></td>
			</tr>
			<tr>
			<td></td>
			<tr>
				<td>Hostname</td>
				<td><input type="text" placeholder="Hostname" name="hostname" /></td>
				<td>Purpose</td>
				<td><input type="text" placeholder="Purpose" name="purpose" /></td>
				<td>Products</td>
				<td><input type="text" placeholder="Products" name="products" /></td>
			</tr>
			<tr>
				<td>OS</td>
				<td><select name="os">
						<option value="RedHat">RedHat</option>
						<option value="CentOS">Centos</option>
						<option value="Windows 2008 R2">Windows 2008</option>
				</select></td>
				<td>Version</td>
				<td><input type="text" placeholder="Os Version" name="osversion" /></td>
			</tr>
			<tr>
				<td>CPU</td>
				<td><select name="cpu">
						<option value="1">1</option>
						<option value="2">2</option>
						<option value="3">3</option>
						<option value="4">4</option>
						<option value="8">8</option>
						<option value="10">10</option>
						<option value="12">12</option>
					</select>
				</td>
				<td>CPU Cores each</td>
				<td>
					<select name="cpucores">
						<option value="1">1</option>
						<option value="2">2</option>
						<option value="3">3</option>
						<option value="4">4</option>
						<option value="8">8</option>
						<option value="10">10</option>
						<option value="12">12</option>
						<option value="16">16</option>
						<option value="20">20</option>
						<option value="24">24</option>
					</select>
				</td>
			</tr>
			<tr>
				<td>Memory</td>
				<td><input type="text" placeholder="Memory Size in GB" name="memory" /></td>
				<td>Swap</td>
				<td><input type="text" placeholder="Swap Size in GB" name="swap" /></td>
			</tr>
					
			<tr>
				<td>IP Address</td>
				<td><input type="text" placeholder="IP Address" name="ipaddress" /></td>
				<td>DNS-Address</td>
				<td><input type="text" placeholder="DNS Server addresses" name="dnsaddress" /></td>
			</tr>
			<tr>
				<td>Drive 1</td>
				<td><input type="text" placeholder="Drive 1" name="drive1" /></td>
				<td>DSize 1</td>
				<td><input type="text" placeholder="Drive Size 1" name="dsize1" /></td>
			</tr>
			<tr>
				<td>Drive 2</td>
				<td><input type="text" placeholder="Drive 2" name="drive2" /></td>
				<td>DSize 2</td>
				<td><input type="text" placeholder="Drive Size 2" name="dsize2" /></td>
			</tr>
			<tr>
				<td>Drive 3</td>
				<td><input type="text" placeholder="Drive 3" name="drive3" /></td>
				<td>DSize 3</td>
				<td><input type="text" placeholder="Drive Size 3" name="dsize3" /></td>
			</tr>
			<tr>
				<td>Drive 4</td>
				<td><input type="text" placeholder="Drive 4" name="drive4" /></td>
				<td>DSize 4</td>
				<td><input type="text" placeholder="Drive Size 4" name="dsize4" /></td>
			</tr>
			<tr>
				<td>Drive 5</td>
				<td><input type="text" placeholder="Drive 5" name="drive5" /></td>
				<td>DSize 5</td>
				<td><input type="text" placeholder="Drive Size 5" name="dsize5" /></td>
			</tr>
			<tr>
				<td>Drive 6</td>
				<td><input type="text" placeholder="Drive 6" name="drive6" /></td>
				<td>DSize 6</td>
				<td><input type="text" placeholder="Drive Size 6" name="dsize6" /></td>
			</tr>
			<tr>
				<td>Drive 7</td>
				<td><input type="text" placeholder="Drive 7" name="drive7" /></td>
				<td>DSize 7</td>
				<td><input type="text" placeholder="Drive Size 7" name="dsize7" /></td>
			</tr>
			<tr>
				<td>Drive 8</td>
				<td><input type="text" placeholder="Drive 8" name="drive8" /></td>
				<td>DSize 8</td>
				<td><input type="text" placeholder="Drive Size 8" name="dsize8" /></td>
			</tr>
			<tr>
				<td>Drive 9</td>
				<td><input type="text" placeholder="Drive 9" name="drive9" /></td>
				<td>DSize 9</td>
				<td><input type="text" placeholder="Drive Size 9" name="dsize9" /></td>
			</tr>
			<tr>
				<td>Drive 10</td>
				<td><input type="text" placeholder="Drive 10" name="drive10" /></td>
				<td>DSize 10</td>
				<td><input type="text" placeholder="Drive Size 10" name="dsize10" /></td>
			</tr>
			<tr>
				<td>Drive 11</td>
				<td><input type="text" placeholder="Drive 11" name="drive11" /></td>
				<td>DSize 11</td>
				<td><input type="text" placeholder="Drive Size 11" name="dsize11" /></td>
			</tr>
			<tr>
				<td>Drive 12</td>
				<td><input type="text" placeholder="Drive 12" name="drive12" /></td>
				<td>DSize 12</td>
				<td><input type="text" placeholder="Drive Size 12" name="dsize12" /></td>
			</tr>
			
			<tr>
				<td><button type="submit">ADD Server</button></td>
			</tr>
		</table>

	</form>

</body>
</html>


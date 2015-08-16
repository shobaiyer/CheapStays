<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<html>
<head>

<link rel="shortcut icon" href="images/Logo1.png">
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
<title>Cheap Stays</title>
<script type="text/javascript" src="js/vali.js">
	
</script>
<script type="text/javascript" src="js/noRghtClick.js">
	
</script>
<script type="text/javascript" src="js/js-image-slider.js">
	
</script>

<link href="css/style.css" rel="stylesheet" type="text/css"
	media="screen" />
</head>

<body background="images/h11.jpg" id="body1" oncopy="return false;"
	onpaste="return false;" oncut="return false;"
	oncontextmenu="return false"
	style="cursor: url('images/88.cur'), default">
	<div id="header" align="right"
		style="background-image: url('images/h9.jpg');">
		<img src="images/Logo.png" id="logo">
		<div id="bind" align="right">
			<br />

		</div>
		<div id="headcaption" align="center">
			<font style="font-family: sans-serif;"><h1 id="h1">Cheap
					Stays</h1></font>

		</div>
	</div>

	<jsp:useBean id="lnk" class="com.igate.label.ConstraintLabels"
		scope="request" />
	<jsp:useBean id="msg" class="com.igate.label.LblCons" scope="request" />


	<div id="menu1" align="center" style="width: 100px;">

		<table id="navbar" style="width: 100px;">
			<tr>
				<td>
					<%
						if (session.getAttribute("user") == null) {
					%> <a href="index4.obj?returns=You are Not Logged In"
					style="cursor: url('images/88.cur'), default">
						&nbsp;&nbsp;&nbsp;<font color="black"><b><s:property
									value="getText('global.home')" /></b></font>
				</a> <%
 	} else {
 %> <a href="index5.obj?returns=success"
					style="cursor: url('images/88.cur'), default">
						&nbsp;&nbsp;&nbsp;<font color="black"><b><s:property
									value="getText('global.home')" /></b></font>
				</a> <%
 	}
 %>
				</td>


			</tr>

		</table>
		<div id="menu1" align="center" style="width: 100px;">

			<table id="navbar" style="width: 150px;">
				<tr>
					<td style="width: 150px;height: 40px;" valign="middle"><a href="logOut.obj?loggedOut=Logged Out Successfully"
						style="cursor: url('images/88.cur'), default">
							&nbsp;&nbsp;&nbsp;<font color="black"><b><s:property
										value="getText('global.logout')" /></b></font>
					</a></td>
					<td>
				</tr>
			</table>
		</div>
	</div>
	</center>

	<center>
		<br> <br>
		<table>

			<tr>

				<h1>
					<s:property value="getText('global.form')" />
				</h1>
				<s:form action="changePassword" name="frm5" method="post"
					validate="true" onsubmit="return validate1()">


					<s:textfield id="txt" name="userId" value="%{#session['user']}"
						key="global.userId" size="20" readonly="true"
						cssStyle="text-Align:center;cursor:url('images/88.cur'),default"></s:textfield>
					<s:password id="txt1" name="password" key="global.password"
						size="20" cssStyle="cursor:url('images/88.cur'),default" />
					<%--  <s:label key="global.userId" value="">User ID:	<%=session.getAttribute("user") %></s:label> --%>

					<s:submit name="submit" key="global.submit" align="center"
						cssClass="button" />
				</s:form>

				<s:url id="localeEN" namespace="/" action="locale">
					<s:param name="request_locale">en</s:param>
				</s:url>
				<s:url id="localeHN" namespace="/" action="locale">
					<s:param name="request_locale">hn</s:param>
				</s:url>
				<s:url id="localeES" namespace="/" action="locale">
					<s:param name="request_locale">es</s:param>
				</s:url>
				<s:url id="localezhCN" namespace="/" action="locale">
					<s:param name="request_locale">zh_CN</s:param>
				</s:url>
				<s:url id="localeDE" namespace="/" action="locale">
					<s:param name="request_locale">de</s:param>
				</s:url>
				<s:url id="localeFR" namespace="/" action="locale">
					<s:param name="request_locale">fr</s:param>
				</s:url>
				<br>
				<br>
				<s:a href="%{localeEN}">English</s:a>
				<s:a href="%{localeES}">Spanish</s:a>
				<s:a href="%{localeDE}">German</s:a>
				<s:a href="%{localeFR}">France</s:a>
		</table>


		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;

	</center>
	<h3 align="center"></h3>
	<br>
	<br>

</body>
</html>
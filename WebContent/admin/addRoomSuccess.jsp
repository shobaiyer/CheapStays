<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <jsp:useBean id="lnk" class="com.igate.label.ConstraintLabels" scope="request"/>
	<jsp:useBean id="msg" class="com.igate.label.LblCons" scope="request"/>
	<jsp:useBean id="Amsg" class="com.igate.label.AdmnCons" scope="request"/>
    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<script type="text/javascript" src="..\js/vali.js">
</script>
<link rel="shortcut icon" href="images/Logo1.png" >
<meta http-equiv="refresh" content="2;url='linkAddRoom.obj'" >
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
<link href="css/style.css" rel="stylesheet" type="text/css" media="screen" />
</head>
<body id="body1" oncopy="return false;" onpaste="return false;" oncut="return false;" oncontextmenu="return false" style="cursor:url('../\images/88.cur'),default">
<center>
<br><br><br><br><br><br><br><br><br>
<h2><%=Amsg.addRoomSuccess %></h2>
<br><br>
<img src="images/loading.gif" />&nbsp;&nbsp;&nbsp;&nbsp;<br><br><h3><%=Amsg.redirectmsg %></h3>
</center>
</body>
</html>
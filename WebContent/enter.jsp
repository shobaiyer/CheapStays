
 <!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@page import="java.io.*,java.util.Locale" %>
<%@page import="javax.servlet.*,javax.servlet.http.*" %>
<html>
<head>
<link rel="shortcut icon" href="images/Logo1.png" >
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
<title>Cheap Stays</title>

<script type="text/javascript" src="js/noRghtClick.js">
</script>
<script type="text/javascript" src="js/js-image-slider.js">
</script>
<script type="text/javascript" src="js/marquee.js">
</script>
<link href="css/style.css" rel="stylesheet" type="text/css" media="screen" />
</head>
<% 

 Locale locale=request.getLocale();
 String language=locale.getLanguage();
 String country=locale.getCountry();

%>
<body background="images/h11.jpg" id="body1" oncopy="return false;" onpaste="return false;" oncut="return false;" oncontextmenu="return false" style="cursor:url('images/88.cur'),default">

			 <jsp:useBean id="lnk" class="com.igate.label.ConstraintLabels" scope="request"/>
<jsp:useBean id="msg" class="com.igate.label.LblCons" scope="request"/>
</div>
</div>
 
<table >
	<tr>
       <td colspan="4">  
  <div id="marquee-container"
 ><span><img src="images/hotel_banner.jpg" /></span
 ><span><img src="images/hotel_banner.jpg" /></span
></div>  </td>
	</tr>
	<tr>
		<th><h1><%=msg.welcome %></h1></th>
	</tr>
	<tr>
	
		<td style="text-align: center;">
		
		 </td></tr>
	<tr>
		<td align="center"><a href="index.obj?hn=HN"><img src="images/Logo1.png" height="300px" width="350px" /></a></td>
	</tr>

</table>
	
 
</body>
</html>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri= "http://www.springframework.org/tags/form" prefix="form"%>
<%@page import="java.io.*,java.util.Locale" %>
<%@page import="javax.servlet.*,javax.servlet.http.*" %>
<%
	response.setContentType("text/html");
	response.setHeader("Content-Language", "es");
	//String Title="Es Espanol";

%>

 <!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>

<link rel="shortcut icon" href="images/Logo1.png" >
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
<title>Cheap Stays</title>
<script type="text/javascript" src="js/vali.js">
</script>
<script type="text/javascript" src="js/noRghtClick.js">
</script>
<script type="text/javascript" src="js/js-image-slider.js">
</script>

<link href="css/style.css" rel="stylesheet" type="text/css" media="screen" />
</head>

<body background="images/h11.jpg" id="body1" oncopy="return false;" onpaste="return false;" oncut="return false;" oncontextmenu="return false" style="cursor:url('images/88.cur'),default">
<div id="header" align="right" style="background-image: url('images/h9.jpg');">
     <img src="images/Logo.png"  id="logo">
    <div id="bind"  align="right"><br />
       
    </div>
        <div id="headcaption" align="center"><font style="font-family: sans-serif;"><h1 id="h1">Cheap Stays</h1></font>
  <!-- <div id="marquee-container"
 ><span><img src="images/hotel_banner.jpg" /></span
 ><span><img src="images/hotel_banner.jpg" /></span
></div> -->
</div>
</div>

<jsp:useBean id="lnk" class="com.igate.label.ConstraintLabels" scope="request"/>
<jsp:useBean id="msg" class="com.igate.label.LblCons" scope="request"/>
<center>
	<div id="menubck" align="center" >
	
    <div id="menu" align="center">
	<div id="bind1">
            <table id="navbar">
        <tr>
            <td style="width: 60px;" >
                <a href="<%=lnk.index  %>" style="cursor:url('images/88.cur'),default"><font color="black"><b><%=msg.home %></b></font></a>
            </td>
           
            <td>
              <a href="<%=lnk.SearchForm %>" style="cursor:url('images/88.cur'),default"><font color="black"><b><%=msg.search %></b></font></a>
            </td>
            
            <td>
               <a href="<%=lnk.contactUs %>" style="cursor:url('images/88.cur'),default"> &nbsp;&nbsp;&nbsp;<font color="black"><b> <%=msg.contact %></b></font></a>
            </td>
            
            
        </tr>
        
         </table>
        </div>
    </div>
    </div>
</center>

<center>
<table> 
 <tr>
 <td valign="top">
 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
 
    	</td>
 <td valign="top">
    <div id="sliderFrame">
        <div id="ribbon"></div>
        <div id="slider">
            <img src="images/delhi1.jpg" alt="Delhi" />
            <img src="images/taj.jpg" alt="Mumbai" />
            <img src="images/bangh.jpg" alt="Kolkata" />
            <img src="images/bang.jpg" alt="Bangalore"   />
            <img src="images/hydd.bmp" alt="Hyderabad" />
        </div>
        </div>
        </td>
    <td valign="top">
 		<div id="sidebar"> 
 		
 		<c:url var="myAction1" value="Login.obj" />
 		
        <form name="frm1" method="post" modelAttribute="user" action="${myAction1}" onsubmit="return validate()">
        <table align="center" >
            <tr>
                <th id="h3" colspan="2" align='center' valign='top' style="font-size: 30px;color: white;">
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<%=msg.member %>
                    <br><br>
                </th>
            </tr>
            <tr>
                <td >
                    &nbsp;&nbsp;<%=msg.userId %></td> <td><input id="txt" name="userId"  style="cursor:url('images/88.cur'),default" placeholder="    <%=msg.userId %>"/>
 			   
            </tr>
            <tr>
                <td >
                   &nbsp;&nbsp;<br><%=msg.passwd %><td><br><input type="password" name="password" id="txt1" style="cursor:url('images/88.cur'),default" placeholder="  <%=msg.passwd %>"/>
                   </td>
                
            </tr>
            <%--  <tr><td><center><font color="white"><b>${ltc}</b></font></center> </td></tr> --%>
            <tr>
            <td valign="top" style="width: 163px; text-align: center;"><br><br>
            &nbsp;&nbsp;<a href="register.obj" class="linkimg" style="cursor:url('images/88.cur'),default"><img title="Register" src="images/reg.png" width="130px" height="35px" style="" onmouseover="this.style.opacity=1;this.filters.alpha.opacity=100" onmouseout="this.style.opacity=0.4;this.filters.alpha.opacity=60; cursor:url('images/88.cur')"></a>
            </td>
                <td colspan="2" valign="top" align="center">
                    <br> <br><input id="txt" name="action" type="submit" class="button"  value="Login" style="cursor:url('images/88.cur'),default"/>
               <br><br>
                <font color="white">${ltc}</font>
               
                <font color="white">${loggedOut}</font>
                
                <font color="white">${returns}</font>
               
                <font color="white">${error}</font>
                <font color="white">${up}</font>
               
           </td>
            </tr>
            <tr>
             	<td colspan="2" valign="middle" align="right">
             		<!-- &nbsp;&nbsp;<br><br><br><a href="register.jsp" class="linkimg" style="cursor:url('images/88.cur'),default"><img title="Register" src="images/reg.png" width="130px" height="35px" style="" onmouseover="this.style.opacity=1;this.filters.alpha.opacity=100" onmouseout="this.style.opacity=0.4;this.filters.alpha.opacity=60; cursor:url('images/88.cur'),default"></a> -->
             	</td>
            </tr>
           
            <tr><td><font color="red" id="error" ><% if(session.getAttribute("error")!=null){out.print(session.getAttribute("error"));}%></font></td></tr>
			<tr><td><font color="red" id="error" ><%if(session.getAttribute("login")!=null){out.print(session.getAttribute("login"));}%></font></td></tr>
			<tr><td><font color="red" id="error" ><%if(session.getAttribute("logout")!=null){out.print(request.getAttribute("logout"));}%></font></td></tr>

        </table>
            </form>
        <br>
    </div>
    </td>
    	

        </tr>
        </table>
        </center>
	<h3 align="center"></h3>
		
		<footer id="foot" align="center">
		<center>
		
	<table>
		<tr>
		
			<td id="tds" style="width: 70px;color: white;" align="center" colspan="3">
				<%=msg.copyright %>
			</td>
			
		</tr>
		<tr>
			<td colspan="4" align="center" style="background-color: white;border-top-left-radius:10px;
border-top-right-radius:10px; font-size:11px;width:250px">
				<%=msg.resolution %> 
			</td>
		</tr>
	</table>
    </center>
  </footer>

	
</body>
</html>
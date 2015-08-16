 <%@page import="org.springframework.ui.Model"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<style type="text/css">
      body { font-size: 80%; font-family: 'Lucida Grande', Verdana, Arial, Sans-Serif; }
      ul#tabs { list-style-type: none; margin: 30px 0 0 0; padding: 0 0 0.3em 0; }
      ul#tabs li { display: inline; }
      ul#tabs li a { color: #42454a; background-color: #dedbde; border: 1px solid #c9c3ba; border-bottom: none; padding: 0.3em; text-decoration: none; }
      ul#tabs li a:hover { background-color: #f1f0ee; }
      ul#tabs li a.selected { color: #000; background-color: #f1f0ee; font-weight: bold; padding: 0.7em 0.3em 0.38em 0.3em; }
      div.tabContent { border: 1px solid #c9c3ba; padding: 0.5em; background-color: #f1f0ee; }
      div.tabContent.hide { display: none; }
    </style>

   <script type="text/javascript" src="js/tab.js">
</script>
<script type="text/javascript" src="..\js/vali.js">
</script>
<link rel="shortcut icon" href="images/Logo1.png" >
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
<link href="css/style.css" rel="stylesheet" type="text/css" media="screen" />
</head>

<body onload="init()" id="body1" oncopy="return false;" onpaste="return false;" oncut="return false;" oncontextmenu="return false" style="background-color:purple;cursor:url('images/88.cur'),default">

<table background="images/h7.jpg">
	<tr>
		<td id="tab1" colspan="3" background=images/h9.jpg style="text-align: center;color: silver;width: 1366px;height: 200px;font-size: 40px;font-weight: bold;" >
				<%  if(session.getAttribute("user")!=null) {out.print("Welcome :"+session.getAttribute("user"));} else {%>Hotel Details  <%} %>
		</td>		
	</tr>
	<tr>
		<td colspan="3" align="center">
		
	
    <div id="menu1" align="center">
	<div id="bind1">
            <table id="navbar">
        <tr>
        <td style="width: 100px;"> 
        <% if(session.getAttribute("user")==null) {%>
    <a href="index4.obj?returns=You are Not Logged In&user=<%=session.getAttribute("user") %>" style="cursor:url('images/88.cur'),default"> &nbsp;&nbsp;&nbsp;<font color="black"><b>Home</b></font></a>
        <%} else { %>
               <a href="index5.obj" style=" cursor:url('images/88.cur'),default"> &nbsp;&nbsp;&nbsp;<font color="black"><b>Home</b></font></a>
            <%} %>
            </td>
            
           </tr>
        
         </table>
        </div>
    </div>
   
		</td>
	</tr>
	<tr>
		<td style="width:400px;height:600px; " valign="top"> 
		
		</td>
		<td style="width:400px;height: 600px;text-align: center; " valign="top"> 
			
				<table> 
				<tr>
					<th>
						<h1 style="color:purple;margin-left: -90%;">Room details</h1>
					</th>
				</tr>
 <tr>
 <td>

 <table align="left"  style="width: 112px;border-style: ridge;margin-left: -50%;">
 <tr>
 <TH class="td">Room No.</TH><TH class="td">Room Type</TH><TH class="td">Cost</TH><TH class="td">Available</TH>
 </tr>
 
<c:forEach items="${listOfRooms}" var="room">
	<tr>
     <td class="td"> ${room.roomNo}</td>
        <td class="td">${room.roomType}</td>
      
        <td class="td">${room.perNightRate}</td> 
        
        <td>
       ${room.available }       
        </td>
        
        <% if(session.getAttribute("user")==null) {%>
      <td class="td"><a href="index1.obj?ltc= Log-in or Register To Continue">Book</a></td> 
        <%} else { %>
        <td class="td"><a href="index2.obj?roomId=${room.roomId}&userId=<%= session.getAttribute("user") %>&amount=${room.perNightRate}">Book</a></td>
        <%} %>
     </tr>
	</c:forEach>
        </table>
     
		</td></tr></table>
		 
	</tr>
</table>

</body>
</html> 
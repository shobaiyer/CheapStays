 <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@taglib uri="http://displaytag.sf.net" prefix="display" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<% if(session.getAttribute("admin")==null) {
 	response.sendRedirect("index.obj");
 }else{
 %>
<html>
<head>
<script type="text/javascript" src="..\js/vali.js">
</script>
<link rel="shortcut icon" href="images/Logo1.png" >
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
<link href="${pageContext.request.contextPath}/css/style.css" rel="stylesheet" type="text/css" media="screen" />
</head>
<body id="body" oncopy="return false;" onpaste="return false;" oncut="return false;" oncontextmenu="return false" style="background-color:purple;cursor:url('images/88.cur'),default">
<table background="images/h7.jpg" id="tab">
	<tr>
		<td id="tab" colspan="3" background="images/h4.jpg"  style="text-align: center;color: white;width: 1366px;height: 100px;font-size: 40px;font-weight: bold;" >
				<h1 id="h1">Cheap Stays Admin</h1>
		</td>		
	</tr>
	<tr>
		<td colspan="3" align="center">
		
	
    <div id="menu1" align="center">
	<div id="bind1">
            <table id="navbar">
        <tr>
        <td>
               <a href="${pageContext.request.contextPath}/home.obj" style="cursor:url('images/88.cur'),default"> &nbsp;&nbsp;&nbsp;<font color="black"><b>Home</b></font></a>
            </td>
           
            <td>
                <a href="${pageContext.request.contextPath}/bookedHotelNames.obj" style="cursor:url('images/88.cur'),default" > &nbsp;&nbsp;<font color="black"><b>Bookings</b></font></a>
            </td>
            <td>
              <a href="${pageContext.request.contextPath}/guest.obj" style="cursor:url('images/88.cur'),default">  <font color="black"><b>Guest List</b></font></a>
            </td>
            <td style="width: 110px">
               <a href="${pageContext.request.contextPath}/bookedDates.obj" style="cursor:url('images/88.cur'),default">&nbsp;<font color="black"><b>Booked Dates</b></font></a>
            </td>
            
           <td>
               <a href="${pageContext.request.contextPath}/modifyHotel.obj" style="cursor:url('images/88.cur'),default"> &nbsp;&nbsp;&nbsp;<font color="black"><b>Add Hotel</b></font></a>
            </td>
            <td>
               <a href="${pageContext.request.contextPath}/logOut.obj?loggedOut=Admin Logged out Successfully" style="cursor:url('../\images/88.cur'),default"> &nbsp;&nbsp;&nbsp;<font color="black"><b>Logout</b></font></a>
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
			
				<table id="reports"> 
				<tr>
					<th>
						<h1 style="color:purple;">Hotel details</h1>
					</th>
				</tr>
 <tr> 
 <td valign="top">
 
        	
   

<display:table id="list"  name="${listOfHotel}" pagesize="6" sort="list" cellspacing="1x" style="align:left">
<display:column class="td" property="hotelId" title="Hotel ID" sortable="true" style="color=black;text-decoration=none;"></display:column>
<br/>
<display:column class="td" property="city" title="City"></display:column>


<display:column class="td" property="hotelName" title="Hotel Name"></display:column>
<display:column class="td" property="address" title="address"></display:column>
<%-- <display:column class="td" property="desc" title="Description"></display:column> --%>
<display:column class="td" property="avgRatePerNight" title="Handout Marks"></display:column>

<display:column class="td" property="phoneNumber1" title="phone Number1"></display:column>
<display:column class="td" property="phoneNumber2" title="phone Number2"></display:column>
<display:column class="td" property="rating" title="Rating"></display:column>
<display:column class="td" property="email" title="Email"></display:column>
<display:column class="td" property="fax" title="Fax"></display:column>

</display:table>


</body>
</html>
<% } %>
 <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
 <%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
     <%@taglib uri="http://displaytag.sf.net" prefix="display" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link href="${pageContext.request.contextPath}/css/style.css" rel="stylesheet" type="text/css" media="screen" />
</head>
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
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body onload="init()" id="body1">
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
 <div id="menu1" align="center" style="width: 100px;">
	
            <table id="navbar" style="width: 100px;">
        <tr>
        <td> 
        <% if(session.getAttribute("user")==null) {%>
    <a href="index4.obj?returns=You are Not Logged In" style="cursor:url('images/88.cur'),default"> &nbsp;&nbsp;&nbsp;<font color="black"><b>Home</b></font></a>
        <%} else { %>
               <a href="index5.obj?returns=success" style=" cursor:url('images/88.cur'),default"> &nbsp;&nbsp;&nbsp;<font color="black"><b>Home</b></font></a>
            <%} %>
            </td>
            
           </tr>
        
         </table>
        </div>
    </div>  	
     <%@page import="java.util.*,com.igate.bean.*,com.igate.dao.*" %>
<jsp:useBean id="eobj" class="com.igate.bean.HotelBean" scope="request"/>
<!-- <table border="2">
 <tr>
 	<th>Hotel Id</th><th>City</th><th>Name</th><th>Address</th><th>Description</th><th>Rate per Night</th>
 	<th>Phone 1</th><th>Phone 2</th><th>Rating</th><th>E-Mail</th><th>Fax</th>
 </tr> -->

<%-- <c:forEach items="${listOfHotels}" var="hotel">

<form:form modelAttribute="hotel">	
	<ul id="tabs">
	<div class="tabContent" id="about">
      <h2>${hotel.hotelName}</h2>
      <div>
      	<p><form:input path="hotelId" type="hidden" value="${hotel.hotelId}" /></p>
        <p>City : ${hotel.city}</p>
        <p>Address : ${hotel.address}</p>
        <p>Description : ${hotel.desc}</p>
        <p>Rate Per Night : ${hotel.avgRatePerNight}</p>
        <p>Rating : ${hotel.rating}</p>
       <a href="moreDetails.obj?hotelId=${hotel.hotelId}">More details..</a>
      </div>
    </div>
</ul>
</form:form>
</c:forEach> --%>
<ul id="tabs">
<div class="tabContent" id="about">	
<display:table id="list"  name="${listOfHotels}" pagesize="6" sort="list" cellspacing="1x" >
 <div>
<p><display:column class="td" property="hotelId" title="Hotel ID" sortable="true" style="color=black;text-decoration=none;"></display:column></p>
<br/>
<p><display:column class="td" property="city" title="City"></display:column> </p>


<p><display:column href="moreDetails.obj" paramId="hotelId" paramProperty="hotelId"  class="td" property="hotelName" title="Hotel Name"></display:column></p>
<p><display:column class="td" property="address" title="address"></display:column></p>
<p><display:column class="td" property="desc" title="Description"></display:column></p>
<p><display:column class="td" property="avgRatePerNight" title="Cost"></display:column></p>

<p><display:column class="td" property="phoneNumber1" title="phone Number1"></display:column></p>
<p><display:column class="td" property="phoneNumber2" title="phone Number2"></display:column></p>
<p><display:column class="td" property="rating" title="Rating"></display:column></p>
<p><display:column class="td" property="email" title="Email"></display:column></p>
<p><display:column class="td" property="fax" title="Fax"></display:column></p>
<p><display:column ></display:column></p>
</div>
</display:table>
</div></ul>	
<!-- </table> -->
  
    
</body>
</html>
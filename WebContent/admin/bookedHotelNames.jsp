<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html>
<head>
<script type="text/javascript" src="..\js/vali.js">
</script>
<link rel="shortcut icon" href="..\images/Logo1.png" >
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
<link href="css/style.css" rel="stylesheet" type="text/css" media="screen" />
</head>
<body id="body" oncopy="return false;" onpaste="return false;" oncut="return false;" oncontextmenu="return false" style="background-color:purple;cursor:url('../\images/88.cur'),default">
<table background="images/h7.jpg" id="tab">
	<tr>
		<td id="tab" colspan="3" background="images/h4.jpg" style="text-align: center;color: silver;width: 1366px;height: 100px;font-size: 40px;font-weight: bold;" >
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
               <a href="home.obj" style="cursor:url('images/88.cur'),default"> &nbsp;&nbsp;&nbsp; <font color="black"><b>Home</b></font></a>
            </td>
           
            <td >
                <a href="bookedHotelNames.obj" style="cursor:url('images/88.cur'),default" > &nbsp;&nbsp; <font color="black"><b>Bookings</b></font></a>
            </td>
            <td>
              <a href="guest.obj" style="cursor:url('images/88.cur'),default">   <font color="black"><b>Guest List</b></font></a>
            </td>
            <td style="width: 120px;">
               <a href="bookedDates.obj" style="cursor:url('images/88.cur'),default">&nbsp; <font color="black"><b>Booked Dates</b></font></a>
            </td>
            
           <td>
               <a href="modifyHotel.obj" style="cursor:url('images/88.cur'),default"> &nbsp;&nbsp;&nbsp; <font color="black"><b>Add Hotel</b></font></a>
            </td>
            <td>
               <a href="logOut.obj?loggedOut=Admin Logged out Successfully" style="cursor:url('../\images/88.cur'),default"> &nbsp;&nbsp;&nbsp; <font color="black"><b>Logout</b></font></a>
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
						<h1 style="color:purple;">Show Hotel Based Bookings</h1>
					</th>
				</tr>
 <tr> 
 <td valign="top">
 <div  id="regis"> 
        	
         	<c:url var="myAction" value="showBookingDetailsByHotelName.obj" /> 
        	
         	<form:form method="post" modelAttribute="hotel" action="${myAction}" cssStyle="cursor:url('images/88.cur'),default">
        	<table align="center" >
        	<tr><td colspan="2" ><input type="text" name="error" id="errortxt"
        	       value="Enter the Hotel Name" style="cursor:url('../\images/88.cur'),default"/></td></tr>
           <tr><td colspan="2"> <br></td></tr>
           <tr>
           	<td>
           		<font color="black">Hotel Name :</font>
           	</td>
           	<td>
           		<select name="hotelId" style="width: 130px; cursor:url('images/88.cur'),default">
                        <option value="select">--select--</option>
                  
					

					<c:forEach items="${hotelList }" var="hotelName" >
                     <option value="${ hotelName.hotelName}" style="cursor:url('images/88.cur'),default">${hotelName.hotelName}</option>
                    </c:forEach>
                        </select>
           	</td>
           </tr>
            <tr>
                <td colspan="2" align='right'>
                    <br><input type="submit" name="action" value="showBookingHotel"  id="sbmt" class='button' style="cursor:url('../\images/88.cur'),default" />
                </td>
           
        </tr>
      
        </table>
           </form:form>
       
    </div>
    	</td>
 

        </tr>
        
        </table>
     
		</td>
		<td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
	</tr>
	 
</table>
</body>
</html>

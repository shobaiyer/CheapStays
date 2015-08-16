<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
 <% if(session.getAttribute("admin")==null) {
 	response.sendRedirect("index.obj");
 }else{
 %>
 
<html>
<head>
<script type="text/javascript" src="admin/js/avali.js">
</script>
<link rel="shortcut icon" href="images/Logo1.png" >
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
<link href="css/style.css" rel="stylesheet" type="text/css" media="screen" />
</head>
<body id="body" oncopy="return false;" onpaste="return false;" oncut="return false;" oncontextmenu="return false" style="background-color:purple;cursor:url('../\images/88.cur'),default">
<table background="images/h7.jpg" id="tab">
	<tr>
		<td id="tab" colspan="3" background="images/h4.jpg"  style="text-align: center;color:white; ;width: 1366px;height: 100px;font-size: 40px;font-weight: bold;" >
				<h1 id="h1">Cheap Stays Admin</h1>
		</td>		
	</tr>
	<tr>
		<td colspan="3" align="center">
		
	
    <div id="menu1" align="center">
	<div id="bind1">
            <table id="navbar">
        <tr>
            <td style="width: 60px;" >
                <a href="home.obj" style="cursor:url('images/88.cur'),default"><font color="black"><b>Home</b></font></a>
            </td>
            <td>
                <a href="linkAddRoom.obj" style="cursor:url('images/88.cur'),default" > &nbsp;&nbsp;&nbsp;<font color="black"><b>Add Room</b></font></a>
            </td>
            <td>
              <a href="delPage.obj" style="cursor:url('images/88.cur'),default"><font color="black"><b>Delete Room</b></font></a>
            </td>
            <td>
               <a href="rateUpdate.obj" style="cursor:url('images/88.cur'),default">&nbsp;<font color="black"><b>Room Rate</b></font></a>
            </td>
            <td>
               <a href="modifyHotel.obj" style="cursor:url('images/88.cur'),default"> &nbsp;&nbsp;&nbsp;<font color="black"><b>Add Hotel</b></font></a>
            </td>
           <td>
               <a href="loggOut.obj?loggedOut=Admin Logged out Successfully" style="cursor:url('images/88.cur'),default"> &nbsp;&nbsp;&nbsp;<font color="black"><b>Logout</b></font></a>
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
						<h1 style="color:purple;">Update Room Rates</h1>
					</th>
				</tr>
 <tr> 
 <td valign="top">
 <div  id="regis"> 
        	
         	
         	
        	
         	<form method="post" modelAttribute="room" action="perNightRateUpdate.obj" style="cursor:url('images/88.cur'),default" onsubmit="return rru()" name="frm2">
        	<table align="center" >
        	<tr><td colspan="2" ><input type="text" name="error" id="errortxt"
        	       value="Enter the Room Id and Room rates" style="cursor:url('../\images/88.cur'),default"/></td></tr>
           <tr><td colspan="2"> <br></td></tr>
           <tr>
           	<td>
           		<font color="black">Room Id :</font>
           	</td>
           	<td align="left">
           		<input id="txt" type="text" name="roomId" style="width: 100px;" placeholder="  Room Id Here" />
           	</td>
           </tr>
           <tr>
           	<td>
           		<font color="black">Room Rate :</font>
           	</td>
           	<td align="left">
           		<input id="txt1" type="text" name="perNightRate" placeholder="  Room Rate Here"/>
           	</td>
           </tr>
            <tr>
                <td colspan="2" align='right'>
                    <br><input type="submit"  value="RateUpdate" id="sbmt" class='button' style="cursor:url('../\images/88.cur'),default" />
                </td>
           
        </tr>
        </table>
            </form>
        <br>
    </div>
    	</td>
 

        </tr>
        </table>
     
		</td>
		<td style="width:400px;height: 600px; "> 
		
		</td>
	</tr>
</table>
</body>
</html>
<%
 }
%>
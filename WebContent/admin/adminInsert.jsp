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
<script type="text/javascript" src="js/vali.js">
</script>
<link rel="shortcut icon" href="images/Logo1.png" >
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
<link href="css/style.css" rel="stylesheet" type="text/css" media="screen" />
</head>
<body id="body" oncopy="return false;" onpaste="return false;" oncut="return false;" oncontextmenu="return false" style="cursor:url('images/88.cur'),default">
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
            <td style="width: 60px;" >
                <a href="home.obj" style="cursor:url('images/88.cur'),default"><font color="black"><b>Home</b></font></a>
            </td>
            <td>
                <a href="addHotel.obj" style="cursor:url('images/88.cur'),default" ><font color="black"><b>Add Hotel</b></font></a>
            </td>
            <td>
              <a href="adminDelete.obj" style="cursor:url('images/88.cur'),default"><font color="black"><b>Delete Hotel</b></font></a>
            </td>
            <td>
               <a href="adminRating.obj" style="cursor:url('images/88.cur'),default">&nbsp;<font color="black"><b>Ratings</b></a>
            </td>
            <td>
               <a href="adminUpdate.obj" style="cursor:url('images/88.cur'),default">&nbsp;<font color="black"><b>Description</b></font></a>
            </td>
            <td>
               <a href="linkAddRoom.obj" style="cursor:url('images/88.cur'),default"><font color="black"><b>Add Room</b></font></a>
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
						<h1 style="color:purple;">Hotel Details</h1>
					</th>
				</tr>
 <tr> 
 <td valign="top">
 <div  id="regis"> 
        	
         		<c:url var="myAction" value="insertHotel.obj" /> 
        	
         	<form:form method="post" modelAttribute="user" action="${myAction}" cssStyle="cursor:url('images/88.cur'),default">
        	<table align="center" >
        	<tr><td colspan="2" ><input type="text" name="error" id="errortxt"
        	       value="Fields marked with * are mandatory , Don't leave it empty." style="cursor:url('images/88.cur'),default"/></td></tr>
           <tr><td colspan="2"> <br></td></tr>
            <tr>             
                <td style="color:black;">
                    &nbsp;&nbsp;City       :</td>
                <td><select name="city" style="cursor:url('images/88.cur'),default">
                        <option value="0">--Select--</option>
                        <option value="Kolkata">Kolkata</option>
                        <option value="Mumbai">Mumbai</option>
                        <option value="Hyderabad">Hyderabad</option>
                        <option value="Chennai">Chennai</option>
                        <option value="Bangalore">Bangalore</option>
                        </select>
                </td>
                
            </tr>
            <tr>
                <td style="color:black;">
                   &nbsp;&nbsp; Hotel Name <font color="red">*</font> : 
                </td>
                <td><input id="txt" type="text" name="hotelName" style="width: 180px;cursor:url('images/88.cur'),default" />
                </td>  
            </tr>
          <tr>
                <td style="color:black;">
                   &nbsp;&nbsp; Address   : 
                </td>
                <td><br><textarea id="txt" name="address" style="height: 50;max-height: 50;max-width: 170 ;cursor:url('images/88.cur'),default"></textarea>
                </td>  
            </tr>
           <tr>
                <td style="color:black;">
                   &nbsp;&nbsp; Hotel Description  <font color="red">*</font> : 
                </td>
                <td>
                <textarea id="txt" name="desc" style="height: 50;max-height: 50;max-width: 170 ;cursor:url('images/88.cur'),default"></textarea>
                </td>  
            </tr>
            <tr>
                <td style="color:black;">
                   &nbsp;&nbsp; Rate per night  <font color="red">*</font> : 
                </td>
                <td><input id="txt" type="text" name="avgRatePerNight" style="width: 155px;cursor:url('images/88.cur'),default" />
                </td>  
            </tr>
           <tr>
                <td style="color:black;">
                   <br> &nbsp;&nbsp;Phone1  <font color="red">*</font> : 
                </td>
                <td><br><input id="txt" type="text" name="phoneNumber1" style="width: 155px;cursor:url('images/88.cur'),default" />
                </td>  
            </tr>
            <tr>
            <tr>
                <td style="color:black;">
                   <br> &nbsp;&nbsp;Phone2  <font color="red">*</font> : 
                </td>
                <td><br><input id="txt" type="text" name="phoneNumber2" style="width: 155px;cursor:url('images/88.cur'),default" />
                </td>  
            </tr>
             <tr>
                <td style="color:black;">
                    &nbsp;&nbsp;Hotel Rating :</td>
                <td><select name="rating" style="width: 70px; cursor:url('images/88.cur'),default">
                        <option value="0">--select--</option>
                        <option value="5" style="cursor:url('images/88.cur'),default">5 Star</option>
                        <option value="4" style="cursor:url('images/88.cur'),default">4 Star</option>
                        <option value="3" style="cursor:url('images/88.cur'),default">3 Star</option>
                        <option value="2" style="cursor:url('images/88.cur'),default">2 Star</option>
                        <option value="1" style="cursor:url('images/88.cur'),default">1 Star</option>
                        </select>
                </td>
                
            </tr>
             
             <tr>
                <td style="color:black;">
                   &nbsp;&nbsp; Email Id  <font color="red">*</font> : 
                </td>
                <td><input id="txt" type="text" name="email" style="width: 155px;cursor:url('images/88.cur'),default"/>
                </td>  
            </tr>
             <tr>
                <td style="color:black;">
                   &nbsp;&nbsp; Fax  <font color="red">*</font> : 
                </td>
                <td><input id="txt" type="text" name="fax" style="width: 155px;cursor:url('images/88.cur'),default"/>
                </td>  
            </tr>             
           
                
            <tr>
                <td colspan="2" align='right'>
                    <br><input type="submit" name="action" value="insert" id="sbmt1" class='button' style="cursor:url('images/88.cur'),default"  />
                </td>
           
        </tr>
        </table>
           </form:form>
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
<% } %>
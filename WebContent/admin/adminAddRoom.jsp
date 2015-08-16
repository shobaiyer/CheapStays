<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@page import="com.igate.bean.HotelBean"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
 <jsp:useBean id="lnk" class="com.igate.label.ConstraintLabels" scope="request"/>
	<jsp:useBean id="msg" class="com.igate.label.LblCons" scope="request"/>
	<jsp:useBean id="Amsg" class="com.igate.label.AdmnCons" scope="request"/>    
    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<% if(session.getAttribute("admin")==null) {
 	response.sendRedirect("index.obj");
 }else{
 %>
<html>
<head>

<link rel="shortcut icon" href="..\images/Logo1.png" >
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
<link href="css/style.css" rel="stylesheet" type="text/css" media="screen" />
<script type="text/javascript" src="${pageContext.request.contextPath}/avali.js">
</script>
</head>
<body id="body" oncopy="return false;" onpaste="return false;" oncut="return false;" oncontextmenu="return false" style="background-color:purple;cursor:url('images/88.cur'),default">
<table background="images/h7.jpg" id="tab" >
	<tr>
		<td id="tab"  colspan="3" background="images/h4.jpg" style="text-align: center;color: silver;width: 1366px;height: 100px;font-size: 40px;font-weight: bold;" >
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
                <a href="<%=lnk.home %>" style="cursor:url('images/88.cur'),default"><font color="black"><b>Home</b></font></a>
            </td>
            <td>
                <a href="<%=lnk.linkAddRoom %>" style="cursor:url('images/88.cur'),default" > &nbsp;&nbsp;&nbsp;<font color="black"><b><%=Amsg.AddRoom %></b></font></a>
            </td>
            <td>
              <a href="<%=lnk.delPage %>" style="cursor:url('images/88.cur'),default"><font color="black"><b><%=Amsg.DeleteRoom %></b></font></a>
            </td>
            <td>
               <a href="<%=lnk.rateUpdate %>" style="cursor:url('images/88.cur'),default">&nbsp;<font color="black"><b><%=Amsg.RoomRate %></b></font></a>
            </td>
            <td>
               <a href="<%=lnk.modifyHotel %>" style="cursor:url('images/88.cur'),default"> &nbsp;&nbsp;&nbsp;<font color="black"><b><%=Amsg.AddHotel %></b></font></a>
            </td>
           <td>
               <a href="<%=lnk.loggOut %>" style="cursor:url('images/88.cur'),default"> &nbsp;&nbsp;&nbsp;<font color="black"><b><%=Amsg.Logout %></b></font></a>
            </td>
        </tr>
        
         </table>
        </div>
    </div>
   
		</td>
	</tr>
	<tr>
		<td style="width:400px;height:600px; " valign="top"> 
		
		<br>
		
		</td>
		<td style="width:400px;height: 600px;text-align: center; " valign="top"> 
			
				<table> 
				<tr>
					<th valign="top">
						<h1 style="color:purple;"><%=Amsg.AddRoom %></h1>
					</th>
				</tr>
 <tr> 
 <td>
 <div  id="regis"> 
        	
         	<c:url var="myAction" value="addRoom.obj" /> 
        	
         	<form name="frm" method="post"  action="${myAction}" style="cursor:url('images/88.cur'),default" onsubmit="return validAdRoom()" >
        	<table align="center" >
        	<tr><td colspan="2" ><input type="text" name="error" id="errortxt"
        	       value="Fill the fields to activate Submit" style="cursor:url('../\images/88.cur'),default"/></td></tr>
           <tr><td colspan="2"> <br></td></tr>
           
            <tr>
               
                 <td style="color:black;">
                    &nbsp;&nbsp;<%=Amsg.hotelName %></td>
                <td><select name="hotelId" style="width: 130px; cursor:url('images/88.cur'),default">
                        <option value="select">--select--</option>
                   
                
					

					<c:forEach items="${hotelList }" var="hotelName" >
                     <option value="${ hotelName.hotelId}" style="cursor:url('images/88.cur'),default">${ hotelName.hotelName}</option>
                    </c:forEach>
                        </select>
                        
                </td>
            </tr>
         
           <tr>
                <td style="color:black;">
                   &nbsp;&nbsp; <%=Amsg.roomNo %>  <font color="red">*</font> : 
                </td>
                <td><input id="txt" type="text" name="roomNo" style="width: 155px;cursor:url('images/88.cur'),default" />
                </td>  
            </tr>
             <tr>
                <td style="color:black;">
                    &nbsp;&nbsp;<%=Amsg.roomType %> :</td>
                <td><select name="roomType" style="width: 130px; cursor:url('images/88.cur'),default">
                        <option value="select">--select--</option>
                        <option value="<%=Amsg.StannonAcroom %>" style="cursor:url('images/88.cur'),default"><%=Amsg.StannonAcroom %></option>
                        <option value="<%=Amsg.StanAcroom %>" style="cursor:url('images/88.cur'),default"><%=Amsg.StanAcroom %></option>
                        <option value="<%=Amsg.ExecAcroom %>" style="cursor:url('images/88.cur'),default"><%=Amsg.ExecAcroom %></option>
                        <option value="<%=Amsg.DelAcroom %>" style="cursor:url('images/88.cur'),default"><%=Amsg.DelAcroom %></option>
                      
                        </select>
                        
                </td>
                
            </tr>
            <tr>
                <td style="color:black;">
                   &nbsp;&nbsp; <%=msg.PNR %>  <font color="red">*</font> : 
                </td>
                <td><input id="txt" type="text" name="perNightRate" style="width: 155px;cursor:url('images/88.cur'),default" />
                
                </td>  
            </tr>
          
             <tr>
                <td style="color:black;">
                   &nbsp;&nbsp; <%=Amsg.Availability %>  <font color="red">*</font> : 
                </td>
                <td><!-- <input id="txt" type="text" name="available" style="width: 35px;cursor:url('../\images/88.cur'),default"/> -->
               			<input type="radio" name="available" value="Y" style="cursor:url('images/88.cur'),default" /><font color="black"><b>Y</b> </font>&nbsp;&nbsp;&nbsp;/&nbsp;&nbsp;&nbsp;
               			<input type="radio" name="available" value="N" style="cursor:url('images/88.cur'),default"/><font color="black"><b>N</b> </font>
                </td>  
            </tr>
                   
            <tr>
            
            </tr>
                
            <tr>
                <td colspan="2" align='right'>
                    <br><input type="submit" name="action" value="addRoom" id="sbmt" class='button' style="cursor:url('images/88.cur'),default" />
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
<% } %>
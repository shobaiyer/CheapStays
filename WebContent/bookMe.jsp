<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
     <%@page import="java.io.File" %>
    <%@page import="java.io.FileOutputStream" %>
    <%@page import="java.io.OutputStream" %>
    <%@page import="com.itextpdf.text.Document" %>
    <%@page import="com.itextpdf.text.Paragraph" %>
    <%@page import="com.itextpdf.text.pdf.PdfWriter" %> 
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<script type="text/javascript" src="js/vali.js">
</script>
<link rel="shortcut icon" href="images/Logo1.png" >
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
<title>Cheap Stays</title>
<script type="text/javascript" src="js/noRghtClick.js">
</script>
<script type="text/javascript" src="js/datetimepicker.js">
</script>
<script type="text/javascript" src="js/vali.js">
</script>
<script type="text/javascript" src="js/js-image-slider.js">
</script>

<link href="css/style.css" rel="stylesheet" type="text/css" media="screen" />
</head>

<body id="body1" oncopy="return false;" onpaste="return false;" oncut="return false;" oncontextmenu="return false" style="cursor:url('images/88.cur'),default">
<div id="header" align="right" style="background-image: url('images/h9.jpg');">
     <img src="images/Logo.png"  id="logo">
    <div id="bind"  align="right"><br />
       
    </div>
      
</div>
</div>
<center>
<div id="menu1" align="center">
	<div id="bind1">
            <table id="navbar">
        <tr>
        <td> 
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
</center>
<jsp:useBean id="lnk" class="com.igate.label.ConstraintLabels" scope="request"/>
<jsp:useBean id="msg" class="com.igate.label.LblCons" scope="request"/>
<center>

<table> 
 <tr> 
 <td valign="top">
 <div  id="sidebarlft"> 
        	
         	<c:url var="myAction" value="book.obj" /> 
        	
         	<form name="frm2" method="post" modelAttribute="Booking" action="${myAction}" onsubmit="return validateBook()" style="cursor:url('images/88.cur'),default">
        	<table align="center">
            <tr>
                <th colspan="2" align='center' valign='top' style="font-size: 20px; color: white;">
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<%=msg.BookRoom %>
                    <br><br>
                </th>
                
            </tr>
         <tr>
         <td><%=msg.roomId %></td>
         	<td>
         	<input type="text" id="txt" name="roomId" value="<%= session.getAttribute("roomId")  %>" readonly="readonly"/>
         		  <%-- <form:input id="txt" path="roomId" title="${roomId }" cssStyle=" text-align:center; width: 35px;"  readonly="readonly"/> --%>
         	</td>
         	
         </tr>
         <tr>        
         	<td><%=msg.userId %></td>
         	<%-- <td><form:input id="txt" path="userId" title="${userId}"  cssStyle="text-align:center;width: 55px;" /></td>
          --%><td><input id="txt" name="userId" value="<%= session.getAttribute("user") %>" readonly="readonly"/></td></tr>
            <tr>
            
                <td style="color:black;">
                   &nbsp;&nbsp; <%=msg.bookedFromDate %> 
                </td>
                <td><input id="datein" type="date" name="bookedFromDate" Style="width: 140px;cursor:url('images/88.cur'),default" />
                 
                </td>  
            </tr>
            <tr>
                <td style="color:black;">
                   &nbsp;&nbsp; <%=msg.bookedToDate %> 
                </td>
                <td><input id="dateout" type="date" name="bookedToDate" Style="width: 140px;cursor:url('images/88.cur'),default" onblur="calcAmount()"/>
                   
                </td>  
            </tr>
           
            <tr>
               
                <td style="color:black;">
                    &nbsp;&nbsp;<%=msg.noOfAdults %></td>
                <td><select name="noOfAdults" style="width: 40px; cursor:url('images/88.cur'),default" id="txt">
                        <option value="0" style="cursor:url('images/88.cur'),default">0</option>
                        <option value="1" style="cursor:url('images/88.cur'),default">1</option>
                        <option value="2" style="cursor:url('images/88.cur'),default">2</option>
                        <option value="3" style="cursor:url('images/88.cur'),default">3</option>
                        <option value="4" style="cursor:url('images/88.cur'),default">4</option>
                        </select>
                       
                </td>
                
            </tr>
            <tr>
               
                <td style="color:black;">
                    &nbsp;&nbsp;<%=msg.noOfChildren %></td>
                <td><select name="noOfChildren" style="width: 40px; cursor:url('images/88.cur'),default" id="txt">
                		<option value="-1" style="cursor:url('images/88.cur'),default"></option>
                        <option value="0" style="cursor:url('images/88.cur'),default">0</option>
                        <option value="1" style="cursor:url('images/88.cur'),default">1</option>
                        <option value="2" style="cursor:url('images/88.cur'),default">2</option>
                        <option value="3" style="cursor:url('images/88.cur'),default">3</option>
                        <option value="4" style="cursor:url('images/88.cur'),default">4</option>
                        </select> 
                        
                </td>
            </tr>
           <%--  <% String query=request.getQueryString();
            query=query.substring(query.indexOf("&")+6); %> --%>
            <tr> <td><%=msg.PNR %></td><td> <input id="txt" value="${amount}" type="text" name="amount1" Style="width: 45px; text-align: center;" readonly="readonly"/></td></tr>
            <tr> <td><%=msg.total %></td><td> <input id="txt" value="" type="text" name="amount" Style="width: 45px; text-align: center;" readonly="readonly"/></td></tr>
            
            <tr>
                <td colspan="2" align='right'>
                    <br><input id="txt" type="submit" name="action" value="Book" class='button' style="cursor:url('images/88.cur'),default" />
                </td>
           
        </tr>
        </table>
          </form>
        <br>
    </div>
    	</td>
 

        </tr>
        </table>
        </center>
	

	
</body>
</html>
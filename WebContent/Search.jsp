 <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
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
                <a href="<%=lnk.index%>" style="cursor:url('images/88.cur'),default"><font color="black"><b><%=msg.home %></b></font></a>
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
 <div  id="sidebarlft"> 
 <c:url var="myAction" value="<%=lnk.USearch %>" /> 
        	
         	<form:form method="get" modelAttribute="hotel" action="Search.obj">
        	<table align="center">
            <tr>
                <th colspan="2" align='center' valign='top' style="font-size: 30px; " id="h3">
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<%=msg.Qsearch %>
                    <br><br>
                </th>
                
            </tr>
            <tr>             
                <td >
                    &nbsp;&nbsp;<%=msg.SelectLoc %></td>
                <td>
                        <form:select path="city" > 
						<%-- <form:option value="" label="Please Select"/> --%>
						<form:option value="<%=msg.delhi %>" label="<%=msg.delhi %>"/>
						<form:option value="<%=msg.chennai %>" label="<%=msg.chennai %>"/>
						<form:option value="<%=msg.mumbai %>" label="<%=msg.mumbai %>"/>
						<form:option value="<%=msg.kolkata %>" label="<%=msg.kolkata %>"/>
						<form:option value="<%=msg.bangalore %>" label="<%=msg.bangalore %>"/>
						
						<form:option value="<%=msg.hyderabad%>" label="<%=msg.hyderabad %>" />
						</form:select>
                </td>
                
            </tr>
            
           
            <tr>
                <td >
                    &nbsp;&nbsp;<%=msg.HRating %></td>
                <td>
                         <form:select path="rating"> 
						<%-- <form:option value="" label="Please Select"/> --%>
						<form:option value="<%=msg.V5 %>" label="<%=msg.S5 %>"/>
						<form:option value="<%=msg.V4 %>" label="<%=msg.S4 %>"/>
						<form:option value="<%=msg.V3 %>" label="<%=msg.S3 %>"/>
						<form:option value="<%=msg.V2 %>" label="<%=msg.S2 %>"/>
						<form:option value="<%=msg.V1 %>" label="<%=msg.S1 %>"/>
						</form:select>
                </td>
                
            </tr>
             
            
            
            <tr>
                <td colspan="2" align='right'>
                    <br><input id="txt" type="submit" value="Search" class='button' style="cursor:url('images/88.cur'),default" />
                </td>
          
        </tr>
        <tr>
            	<td>
            			<font color="white">${error}</font>
            	</td>
            </tr>
        </table>
            </form:form>
            
             </div>
    	</td>
    	</tr></table></center>
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
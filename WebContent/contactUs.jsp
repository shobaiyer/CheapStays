<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
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

<body id="body1" background="images/h7.jpg" oncopy="return false;" onpaste="return false;" oncut="return false;" oncontextmenu="return false" style="cursor:url('images/88.cur'),default">
<div id="header" align="right" style="background-image: url('images/h4.jpg');">
     <img src="images/Logo.png"  id="logo">
    <div id="bind"  align="right"><br />
       
    </div>
        
</div>
</div>
<jsp:useBean id="lnk" class="com.igate.label.ConstraintLabels" scope="request"/>
<jsp:useBean id="msg" class="com.igate.label.LblCons" scope="request"/>
<center>
	<div id="menubck" align="center" style="background: url('images/bg5.jpg');">
	
	
    <div id="menu" align="center" style="cursor:url('images/88.cur'),default">
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
<br><br>
<table style="border-style: groove;">
	<tr ><th style="text-align: center;border-bottom: groove; border-color: black;" colspan="4">
		<h1>Query Desk:</h1></th></tr>
		<font size="4px;" >
	<tr ><td style="width: 200px;border-bottom-style: groove;">	
		<%=msg.contact1 %>
		</td>
		
		
		<td style="width: 300px;border-bottom-style: groove;">	
		<%=msg.contact2 %>
		</td>
		
		<td style="width: 300px;border-bottom-style: groove;">
		
		<%=msg.contact3 %>
		</td>
		<td style="width: 300px;border-bottom-style: groove;">
		
		<%=msg.contact4 %>
		<tr><td style="width: 300px;border-bottom-style: groove;">
		</td></tr>
		
		
 
	</font>
	</table>
</center>	<br/><br><br>

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
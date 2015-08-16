<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ taglib prefix="s" uri="/struts-tags" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<% if(session.getAttribute("admin")==null) {
 	response.sendRedirect("index.obj");
 }else{
 %>
<html>
<head>
<script type="text/javascript" src="${pageContext.request.contextPath}/avali.js">
</script>
<script type="text/javascript" src="js/vali.js">
</script>
<link rel="shortcut icon" href="images/Logo1.png" >
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
<link href="css/style.css" rel="stylesheet" type="text/css" media="screen" />
 <script type="text/javascript" src="js/clock.js">
</script>
        
        <style type="text/css">
            .clock
            {
                vertical-align:middle; font-family:Arial, Sans-Serif; font-size:40px; font-weight:normal;
                color:#000; 
            }
            .clocklg 
            {
                vertical-align:middle; font-family:Arial, Sans-Serif; font-size:14px; font-weight:normal;
                color: #555; 
            }
        </style>

</head>
<body id="body" oncopy="return false;" onpaste="return false;" oncut="return false;" oncontextmenu="return false" style="background-color:purple; cursor:url('images/88.cur'),default" onload="digitized();">
<table background="images/h7.jpg" id="tab">
	<tr>
		<td id="tab" colspan="3" background="images/h4.jpg" style="text-align: center;color: white;width: 1366px;height: 100px;font-size: 40px;font-weight: bold;" >
				<h1 id="h1">Welcome To Cheap Stays Admin</h1>
		</td>		
	</tr>
	<tr>
		<td colspan="3" align="center">
		
	
    <div id="menu1" align="center">
	<div id="bind1">
            <table id="navbar">
            
        <tr>
            <td style="width: 60px;" >
                <a href="adminHome.obj" style="cursor:url('images/88.cur'),default"><font color="black"><b>Home</b></font></a>
            </td >
            <td style="width: 110px;">
                <a href="modifyHotel.obj" style="cursor:url('images/88.cur'),default" > &nbsp;<font color="black"><b>Modify Hotel</b></font></a>
            </td>
           
            <td style="width: 110px;">
               <a href="linkAddRoom.obj" style="cursor:url('images/88.cur'),default"> &nbsp;<font color="black"><b>Modify Room</b></font></a>
            </td>
             <td style="width: 60px;">
               <a href="reports.obj" style="cursor:url('images/88.cur'),default"> &nbsp;<font color="black"><b>Reports</b></font></a>
            </td>
           <td style="width: 60px;">
               <a href="loggOut.obj?loggedOut=Admin Logged out Successfully" style="cursor:url('images/88.cur'),default"> &nbsp;<font color="black"><b>Logout</b></font></a>
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
					<td>
						 <table style="width:20%" align="center" cellspacing="0" cellpadding="0" border="0">
            <tr><td class="clock" id="dc"></td>  <!-- THE DIGITAL CLOCK. -->
                <td>
                    <table cellpadding="0" cellspacing="0" border="0">
                        <tr><td class="clocklg" id="dc_hour" ></td></tr>     <!-- HOUR IN 'AM' AND 'PM'. -->
                        <tr><td class="clocklg" id="dc_second" ></td>
                        
                    </table>              
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                </td>
                <td rowspan="2" style="border-left: groove;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<script>

var mydate=new Date()
var year=mydate.getYear()
if (year < 1000)
year+=1900
var day=mydate.getDay()
var month=mydate.getMonth()
var daym=mydate.getDate()
if (daym<10)
daym="0"+daym
var dayarray=new Array("Sunday","Monday","Tuesday","Wednesday","Thursday","Friday","Saturday")
var montharray=new Array("January","February","March","April","May","June","July","August","September","October","November","December")
document.write("<small><font color='000000' face='Arial'><b>"+dayarray[day]+","+montharray[month]+""+daym+","+year+"</b></font></small>")

</script> </td>
            </tr>
        </table>
        
					</td>
					<td align="left"></td>
				</tr>
 <tr> 
 <td valign="top">
 <div  id="regis1"> 
     
     <s:form name="frm9" onsubmit="return upld()" action="resultAction" namespace="/" method="POST" enctype="multipart/form-data">

<s:file name="fileUpload" label="Select a File to upload" size="40" required="true" cssStyle="font-color='black';" />

<s:submit value="submit" name="submit" />
	
</s:form>	   	
    <br/>${suc}     	
    </div>
    	</td>
 

        </tr>
        </table>
     
		</td>
		<td style="width:400px;height: 600px; "> 
		
		</td>
	</tr>
	
	</tr>
</table>
</body>
</html>
<% } %>
 <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%><%@ taglib prefix="s" uri="/struts-tags"%>
   <%@taglib uri="http://displaytag.sf.net" prefix="display" %> 
    <jsp:useBean id="lnk" class="com.igate.label.ConstraintLabels" scope="request"/>
<jsp:useBean id="msg" class="com.igate.label.LblCons" scope="request"/>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>

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
<script type="text/javascript" src="..\js/vali.js">
</script>
<link rel="shortcut icon" href="images/Logo1.png" >
<link href="css/style.css" rel="stylesheet" type="text/css" media="screen" />
</head>
<body onload="init(),digitized()" style="cursor:url('images/88.cur'),default" id="body1">
<table  id="tab">
	<tr>
		<td id="tab1" colspan="3" style="text-align: center;width: 1366px;height: 200px;font-size: 40px;font-weight: bold;background-image: url('images/h9.jpg');" >
				Welcome <%= session.getAttribute("user") %>
		</td>		
	</tr>
	<tr>
		<td colspan="3" align="center">
		
    <div id="menu1" align="center">
	<div id="bind1">
            <table id="navbar">
        <tr>
        <td style="width: 100px;">
               <a href="logOut.obj?loggedOut=Logged Out Successfully" style="cursor:url('images/88.cur'),default"> &nbsp;&nbsp;&nbsp;<font color="black"><b><%=msg.logout %></b></font></a>
            </td>
            <td style="width: 150px;">
               <a href="change?ch=<%=session.getAttribute("user") %>" style="cursor:url('images/88.cur'),default"> &nbsp;&nbsp;&nbsp;<font color="black"><b><%=msg.change %></b></font></a>
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
document.write("<small><font color='000000' face='Arial'><b>"+dayarray[day]+", "+montharray[month]+" "+daym+", "+year+"</b></font></small>")

</script> </td>
<td></td><td></td>
            </tr>
        </table>
        
					</td>
					<th></td>
				</tr>
				<tr>
				<td><s:url id="fileDownload" namespace="/" action="download"></s:url>

Download Hotel Details - <s:a href="%{fileDownload}">HotelDetails.docx</s:a></td>
				</tr>
				<tr>
					<th style="color: purple"><br><h2>List Of Hotels</h2></th>
				</tr>
 <tr> 
 <td valign="top">
<!-- <ul id="tabs">
<div class="tabContent" id="about"> -->	
<display:table id="list"  name="${listOfHotel}" pagesize="6" sort="list" cellspacing="1x" >
<!--  <div> -->
<%-- <p><display:column class="td" property="hotelId" title="Hotel ID" sortable="true" style="color=black;text-decoration=none;"></display:column></p> --%>
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
<!-- </div> -->
</display:table>
<!-- </div></ul> -->	

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
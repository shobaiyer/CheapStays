<%-- <%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
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

    <script type="text/javascript">
    //<![CDATA[

    var tabLinks = new Array();
    var contentDivs = new Array();

    function init() {

      // Grab the tab links and content divs from the page
      var tabListItems = document.getElementById('tabs').childNodes;
      for ( var i = 0; i < tabListItems.length; i++ ) {
        if ( tabListItems[i].nodeName == "LI" ) {
          var tabLink = getFirstChildWithTagName( tabListItems[i], 'A' );
          var id = getHash( tabLink.getAttribute('href') );
          tabLinks[id] = tabLink;
          contentDivs[id] = document.getElementById( id );
        }
      }

      // Assign onclick events to the tab links, and
      // highlight the first tab
      var i = 0;

      for ( var id in tabLinks ) {
        tabLinks[id].onclick = showTab;
        tabLinks[id].onfocus = function() { this.blur() };
        if ( i == 0 ) tabLinks[id].className = 'selected';
        i++;
      }

      // Hide all content divs except the first
      var i = 0;

      for ( var id in contentDivs ) {
        if ( i != 0 ) contentDivs[id].className = 'tabContent hide';
        i++;
      }
    }

    function showTab() {
      var selectedId = getHash( this.getAttribute('href') );

      // Highlight the selected tab, and dim all others.
      // Also show the selected content div, and hide all others.
      for ( var id in contentDivs ) {
        if ( id == selectedId ) {
          tabLinks[id].className = 'selected';
          contentDivs[id].className = 'tabContent';
        } else {
          tabLinks[id].className = '';
          contentDivs[id].className = 'tabContent hide';
        }
      }

      // Stop the browser following the link
      return false;
    }

    function getFirstChildWithTagName( element, tagName ) {
      for ( var i = 0; i < element.childNodes.length; i++ ) {
        if ( element.childNodes[i].nodeName == tagName ) return element.childNodes[i];
      }
    }

    function getHash( url ) {
      var hashPos = url.lastIndexOf ( '#' );
      return url.substring( hashPos + 1 );
    }

    //]]>
    </script>
<script type="text/javascript" src="..\js/vali.js">
</script>
<link rel="shortcut icon" href="images/Logo1.png" >
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
<link href="css/style.css" rel="stylesheet" type="text/css" media="screen" />
</head>
<body onload="init()" id="body1" oncopy="return false;" onpaste="return false;" oncut="return false;" oncontextmenu="return false" style="background-color:purple;cursor:url('images/88.cur'),default">
<table background="images/h11.jpg" id="tab">
	<tr>
		<td id="tab1" colspan="3"  style=" background-image: url('images/h9.jpg');text-align: center;width: 1366px;height: 200px;font-size: 40px;font-weight: bold;" >
				Admin Portal
		</td>		
	</tr>
	<tr>
		<td colspan="3" align="center">
		
	
    <div id="menu1" align="center">
	<div id="bind1">
            <table id="navbar">
        <tr>
        <td>
               <a href="loginHome.jsp" style="cursor:url('images/88.cur'),default"> &nbsp;&nbsp;&nbsp;<font color="black"><b>Home</b></font></a>
            </td>
           <td>
               <a href="CSUserController?action=logout" style="cursor:url('images/88.cur'),default"> &nbsp;&nbsp;&nbsp;<font color="black"><b>logout</b></font></a>
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
						<h1 style="color:purple;">Hotel details</h1>
					</th>
				</tr>
 <tr> 
 <td valign="top">
<%@page import="java.util.*,com.igate.bean.*,com.igate.service.*" %>
<jsp:useBean id="eobj" class="com.igate.bean.HotelBean" scope="request"/>
<jsp:useBean id="eobj1" class="com.igate.bean.RoomBean" scope="request"/>

<%
 CSServiceImpl serv=new CSServiceImpl();
List<HotelBean> list =new ArrayList<HotelBean>(); 
String query=request.getQueryString();
query=query.substring(query.indexOf("&")+9);
request.setAttribute("hotelId", query);
 list=serv.getHotelList(query);
for(HotelBean hot : list)
{
	%>
	 <ul id="tabs">
	<div class="tabContent" id="about">
      <h2><% out.print(hot.getHotelName()); %></h2>
      <div>
        <p>City : <% out.print(hot.getCity()); %> &nbsp;&nbsp;&nbsp;Address : <% out.print(hot.getAddress()); %></p>
        <p>Description : <% out.print(hot.getDesc()); %></p>
        <p>Rate Per Night : <% out.print(hot.getAvgRatePerNight()); %></p>
        <p>Rating : <% out.print(hot.getRating()); %></p>    
        <p>Phone Number 1 : <% out.print(hot.getPhoneNumber1()); %></p>
        <p>Phone Number 2 : <% out.print(hot.getPhoneNumber2()); %></p>
        <p>E-Mail : <% out.print(hot.getEmail()); %></p>
        <p>Fax : <% out.print(hot.getFax()); %></p>
        
      </div>
    </div>
</ul> 

	
	<%
}

%>
    
   
    	</td>
 </tr>
 <tr>
 <td>
<%

List<RoomBean> list1 =new ArrayList<RoomBean>(); 
 list1=serv.getRoomDetails(query);
for(RoomBean hot1 : list1)
{
	%>
	 <ul id="tabs">
	<div class="tabContent" id="about">
      <h2>Room No :<% out.print(hot1.getRoomNo()); %></h2>
      <div>
        <p>Room Id : <% out.print(hot1.getRoomId()); %></p>
        <p>Type of Room : <% out.print(hot1.getRoomType()); %></p>
        <p>Rate Per Night : <% out.print(hot1.getPerNightRate()); %> </p>
        <p>available</p>     
        <a href="bookMe.jsp?&rate=<%= hot1.getPerNightRate() %>&roomId=<%= hot1.getRoomId() %>">Book Room</a>
        
      </div>
    </div>
</ul> 
	
	<%
}

%></td>
 </tr>
        </table>
     
		</td>
		<td style="width:400px;height: 600px; "> 
		
		</td>
	</tr>
</table>
</body>
</html> --%>
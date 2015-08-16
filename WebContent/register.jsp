<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <jsp:useBean id="lnk" class="com.igate.label.ConstraintLabels" scope="request"/>
<jsp:useBean id="msg" class="com.igate.label.LblCons" scope="request"/>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link rel="shortcut icon" href="images/Logo1.png" >
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
<title>Cheap Stays</title>
<script type="text/javascript" src="js/noRghtClick.js">
</script>
<script type="text/javascript" src="js/random.js">
</script>
<script type="text/javascript" src="js/datetimepicker.js">
</script>
<script type="text/javascript" src="js/vali.js">
</script>
<script type="text/javascript" src="js/js-image-slider.js">
</script>
<script type="text/javascript">
(function(window, document, undefined) {
	 var spaceinterval = 1;
	 var timeinterval = 10; // `speed`
	 var max;
	 var firstrun = true;
	 // Interval function:
	 var gallery = function() {
	  var elem = document.getElementById("marquee-container");
	  if (elem) {
	   if (firstrun) {
	    max = elem.scrollWidth;
	    // Clone the children of the container until the
	    // scrollWidth is at least twice as large as max.
	    while (elem.scrollWidth < max * 2) {
	     var length = elem.children.length;
	     for (var i = 0; i < length; ++i) {
	      elem.appendChild(elem.children[i].cloneNode(true));
	     }				
	     break;
	    }
	    firstrun = false;
	   }
	   if (elem.scrollLeft >= max) {
	    elem.scrollLeft -= max;
	   } else {
	    elem.scrollLeft += spaceinterval;
	   }
	  }
	 };
	 window.setInterval(gallery, timeinterval);
	})(window, document);

</script>
<link href="css/style.css" rel="stylesheet" type="text/css" media="screen" />
</head>
<body id="body1"  style="cursor:url('images/88.cur'),default">
<div id="header" align="right" style="background-image: url('images/h9.jpg');">
     <img src="images/Logo.png"  id="logo">
    <div id="bind"  align="right"><br />
    
    </div>
         <div id="headcaption" align="center"><font color="#FFFFFF" style="font-family: sans-serif;"><h1 id="h1">Cheap Stays</h1></font>
 
</div>
</div>
<center>
	<div id="menubck" align="center" style="background: url('images/bg5.jpg');">
	
	
    <div id="menu" align="center" style="cursor:url('images/88.cur'),default">
	<div id="bind1">
            <table id="navbar">
        <tr>
        <td>
               <a href="<%=lnk.register %>" style="cursor:url('images/88.cur'),default"> &nbsp;&nbsp;&nbsp;<font color="black"><b><%=msg.refresh %></b></font></a>
            </td>
            <td style="width: 60px;">
                <a href="<%=lnk.index %>" style="cursor:url('images/88.cur'),default"><font color="black"><b><%=msg.home %></b></font></a>
            </td>
           
            <td>
              <a href="<%=lnk.SearchForm %>" style="cursor:url('images/88.cur'),default"><font color="black"><b><%=msg.search %></b></font></a>
            </td>
            
            <td>
               <a href="<%=lnk.contactUs %>" style="cursor:url('images/88.cur'),default"> &nbsp;&nbsp;&nbsp;<font color="black"><b><%=msg.contact %></b></font></a>
            </td>
          
        </tr>
         </table>
        </div>
    </div>
    </div>
</center>

<center>
<br><br>
<table>

<tr> <td align="center" colspan="3"><img src="images/rw.png" width="300" height="90"></td> </tr>
<tr>
<td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
<td>
<iframe scrolling="auto" src="regframe.obj"  width="500px" height="500px" class="scrollbar" id="ex3" >

</iframe>
</td>
<td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
       </tr>
       </table>
        </center>
	<h3 align="center"> </h3>
		<br><br>	
		<footer id="rght">
		<center>	
	<table>
		<tr>
			<td id="tds" style="width: 50px;color: white;" align="center" colspan="3">
				<b><%=msg.copyright %> 
			</td>
		</tr>
		<tr><br>
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
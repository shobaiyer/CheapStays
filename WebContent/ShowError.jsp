<%@ page isErrorPage="true" %>
<html>
<head>
<script type="text/javascript" src="js/vali.js">
</script>
<link rel="shortcut icon" href="..\images/Logo1.png" >
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
<link href="..\css/style.css" rel="stylesheet" type="text/css" media="screen" />
</head>
<body id="body" oncopy="return false;" onpaste="return false;" oncut="return false;" oncontextmenu="return false" style="background-color:purple;cursor:url('../\images/88.cur'),default">
<table background="..\images/h7.jpg" id="tab" >

	<tr>
		<td id="tab"  colspan="3" background="images/h6.jpg" bgcolor="purple" style="text-align: center;color: silver;width: 1366px;height: 200px;font-size: 40px;font-weight: bold;" >
		<img src="images/Logo.png" height="200px" width="210px" align="left"/><br><h2 style="color: white;">Cheap Stays</h2>
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
 <div  id="regis"> 
<center>
 <table>
 		<tr>
 			<td align="center"><h1 style="color: black;">Sorry, an error occurred.</h1></td>
 		</tr>
 		<tr>
 			<td><h1></h1></td>
 		</tr>
 		<tr>
 			<td style="width: 500px;color: black;" align="center"><h1><%=request.getParameter("error") %>!!!</h1></td>
 		</tr>
 		<tr>
	<p align="center"><a href="homeindex.obj" style="cursor:url('images/88.cur'),default"><font color="black"><b>Home</b></font></a></p>
	</tr>
 		
 </table>
 </center>
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
</body>
</html>
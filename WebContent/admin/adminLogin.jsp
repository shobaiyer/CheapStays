<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<script type="text/javascript" src="js/vali.js">
</script>
<link rel="shortcut icon" href="..\images/Logo1.png" >
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
<link href="..\css/style.css" rel="stylesheet" type="text/css" media="screen" />
</head>
<body id="body" oncopy="return false;" onpaste="return false;" oncut="return false;" oncontextmenu="return false" style="cursor:url('../\images/88.cur'),default">
<table background="..\images/h7.jpg" id="tab" >
	<tr>
		<td id="tab"  colspan="3" style="background-image: url('images/h4.jpg'); text-align: center;color: silver;width: 1366px;height: 200px;font-size: 40px;font-weight: bold;" >
		<img src="images/Logo.png" height="200px" width="210px" align="left"/><br><h2 style="color:white;" id="h1">Admin Portal</h2>
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
						<h1 style="color:purple;">Admin Login</h1>
					</th>
				</tr>
 <tr> 
 <td>
 <div  id="regis"> 
        	
         	<form name="frmAdmin" action="..\CSControllerServlet" onsubmit="" method="post" style="cursor:url('../\images/88.cur'),default" >
        	<table align="center" >
        	<tr></tr>
           <tr><td colspan="2"> <br></td></tr>
           
            <tr>
                <td style="color:black;">
                   &nbsp;&nbsp; Admin Id <font color="red">*</font> : 
                </td>
                <td><input id="txt" type="text" name="userId" style="width: 155px;cursor:url('../\images/88.cur'),default" />
                </td>  
            </tr>
         
           <tr>
                <td style="color:black;">
                   &nbsp;&nbsp; Password  <font color="red">*</font> : 
                </td>
                <td><input id="txt" type="password" name="password" style="width: 155px;cursor:url('../\images/88.cur'),default" />
                </td>  
            </tr>
            
          
            <tr>
                <td colspan="2" align='right'>
                    <br><input id="txt" type="submit" name="action" value="adminLogin" id="sbmt" class='button' style="cursor:url('../\images/88.cur'),default" />
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
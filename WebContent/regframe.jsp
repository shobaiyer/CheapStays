<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
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
 
<link href="css/style.css" rel="stylesheet" type="text/css" media="screen" />
</head>
<body id="body1" oncopy="return false;" onpaste="return false;" oncut="return false;" oncontextmenu="return false" onload="randomString()" style="cursor:url('images/88.cur'),default" >

<center>
<table> 
 <tr> 
 <td valign="top">
 <div  id="regis" style="background: url('images/wt.jpg');"> 
        	
         	<c:url var="myAction" value="<%=lnk.insertUser %>" /> 
        	
         	<form:form method="post" modelAttribute="user" action="${myAction}" cssStyle="cursor:url('images/88.cur'),default">
        	<table align="center" >
        	<tr><td colspan="2" >
        	       <font color="brown">&nbsp; <%=msg.mandatory %></font></td></tr>
         
            <tr>
                <td style="color:black; height: 30px;max-height: 30px; width:30px; max-width: 30px;" valign="top">
                   &nbsp;&nbsp; <%=msg.name %> <font color="red">*</font> : 
                </td>
                <td style=" width:40px; max-width: 40px;"><form:input path="userName" id="txt" cssStyle="cursor:url('images/88.cur'),default" />
              <table background="green" id="txt">
              <tr>
              <td>
               <form:errors path="userName" cssStyle="color:red; cursor:url('images/88.cur'),default"/>
                <td>
                </tr>
                </table>
                </td> 
                 <input type="hidden" name="role" value="user"/>  
            </tr>
                      
             <tr>
                <td style="color:black; height: 30px;max-height: 30px; width:30px; max-width: 30px;" valign="top">
                   &nbsp;&nbsp; <%=msg.EmailId %>  <font color="red">*</font> : 
                </td>
                <td style=" width:40px; max-width: 40px;"><form:input path="email" id="txt" cssStyle="cursor:url('images/88.cur'),default"/>
                 <table>
              <tr>
              <td>
                <form:errors path="email" cssStyle="color:red; cursor:url('images/88.cur'),default"/>
                </td></tr></table>
                </td>  
            </tr>
            <tr>
                <td style="color:black; height: 30px;max-height: 30px; width:30px; max-width: 30px;" valign="top">
                   &nbsp;&nbsp;<%=msg.userId %>  <font color="red">*</font> : 
                </td>
                <td style=" width:40px; max-width: 40px;"><form:input path="userId" id="txt" cssStyle="cursor:url('images/88.cur'),default"/>
                 <table>
              <tr>
              <td>
                <form:errors path="userId" cssStyle="color:red; cursor:url('images/88.cur'),default"/>
                </td></tr></table>
                </td>  
            </tr>
            <tr>
                <td style="color:black; height: 30px;max-height: 30px; width:30px; max-width: 30px;" valign="top">
                   &nbsp;&nbsp; 
                   <%=msg.passwd %><font color="red">*</font> :<br>
                     <table>
              <tr>
              <td colspan="1" style="text-align: left;">
                   
                </td></tr></table>
                </td>
                <td style=" width:40px; max-width: 40px; " valign="top">
                <form:password path="password" id="txt" cssStyle="cursor:url('images/88.cur'),default"/>
                <table>
              <tr>
              <td>
                <form:errors path="password" cssStyle="color:red; cursor:url('images/88.cur'),default"/>
                </td></tr></table>
                </td> 
            </tr>
            <tr>
                <td style="color:black; height: 30px;max-height: 30px; width:30px; max-width: 30px;" valign="top">
                   &nbsp;&nbsp; <%=msg.Address %> <font color="red">*</font> : 
                </td>
                <td style=" width:40px; max-width: 40px;" valign="top"><form:textarea id="txt" path="address" cssStyle="height: 50;max-height: 50;max-width: 170 ;cursor:url('images/88.cur'),default"></form:textarea>
                 <table>
              <tr>
              <td>
                <form:errors path="address" cssStyle="color:red; cursor:url('images/88.cur'),default"/>
                </td></tr></table>
                </td>  
            </tr>
           <tr>
           <tr>
                <td style="color:black; height: 30px;max-height: 30px; width:30px; max-width: 30px;" valign="top">
                    &nbsp;&nbsp;<%=msg.Mobile %>  <font color="red">*</font> : 
                </td>
                <td style=" width:40px; max-width: 40px;" valign="top"><form:input path="mobile" id="txt" cssStyle="cursor:url('images/88.cur'),default"/>
                <table>
              <tr>
              <td>
                <form:errors path="mobile" cssStyle="color:red; cursor:url('images/88.cur'),default"/> </td>  
            </tr></table></td>
            </tr>
            <tr>
                <td style="color:black; height: 30px;max-height: 30px; width:30px; max-width: 30px;" valign="top">
                    &nbsp;&nbsp;<%=msg.Phone %>   : 
                </td>
                <td style=" width:40px; max-width: 40px;" valign="top"><form:input path="phone" id="txt" cssStyle="cursor:url('images/88.cur'),default"/>
                <table>
              <tr>
              <td>
                <form:errors path="phone" cssStyle="color:red; cursor:url('images/88.cur'),default"/></td>  
            </tr></table></td>
            </tr>
              
                
            <tr>
                <td colspan="1" align='right'>
                <br><input id="txt" name="action" type="submit" class="button" value="Register" style="cursor:url('images/88.cur'),default"/></td>
           <td valign="bottom"><input id="txt" name="action" type="reset" class="button" value="Cancel" style="cursor:url('images/88.cur'),default"/></td>
        </tr>
        </table>
          </form:form>
        <br>
    </div>
    	</td>
 

        </tr>
        </table>
       </center>
</body>
</html>
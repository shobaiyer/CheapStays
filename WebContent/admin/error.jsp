<%@ page errorPage="ShowError.jsp" %>

<html>
<head>
   <title>Error Handling Example</title>
</head>
<body>
<%
   // Throw an exception to invoke the error page
   int x = 1;
   if (x == 1)
   {
      throw new RuntimeException("Error condition!!! : <br>"+ request.getParameter("error"));
   }
%>
<br/><br/>
<p align="center"><a href="adminHome.obj" style="cursor:url('images/88.cur'),default"><font color="black"><b>Home</b></font></a></p>
</body>
</html>
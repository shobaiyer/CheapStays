<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ taglib prefix="s" uri="/struts-tags"%>
    <%@page import="java.io.File" %>
    <%@page import="java.io.FileOutputStream" %>
    <%@page import="java.io.OutputStream" %>
    <%@page import="com.itextpdf.text.Document" %>
    <%@page import="com.itextpdf.text.Paragraph" %>
    <%@page import="com.itextpdf.text.pdf.PdfWriter" %>
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
<script type="text/javascript" src="js/marquee.js">
</script>
<jsp:useBean id="lnk" class="com.igate.label.ConstraintLabels" scope="request"/>
<jsp:useBean id="msg" class="com.igate.label.LblCons" scope="request"/>
<link href="css/style.css" rel="stylesheet" type="text/css" media="screen" />
</head>

<body id="body1" oncopy="return false;" onpaste="return false;" oncut="return false;" oncontextmenu="return false" style="cursor:url('images/88.cur'),default">
<div id="header" align="right" style="background-image: url('images/h9.jpg');">
     <img src="images/Logo.png"  id="logo">
    <div id="bind"  align="right"><br />
       
    </div>
         <div id="headcaption" align="center"><font color="#FFFFFF" style="font-family: sans-serif;"><h1 id="h1">Cheap Stays</h1></font>
 
</div>
</div>
<%
       String bid=(String)session.getAttribute("bid");
	String rid=(String)session.getAttribute("roomId");
	String user=(String)session.getAttribute("user");
	String amt=(String)session.getAttribute("amt");
	String hotn=(String)session.getAttribute("hotn");
       try {
			OutputStream file = new FileOutputStream(new File("D:\\Gaurab_Eclipse/CheapStays/WebContent/HotelListDocs/bill.pdf"));

			Document document = new Document();
			PdfWriter.getInstance(document, file);

			document.open();
			document.add(new Paragraph("-----------------------------------------------------------------------------------------------------------------"));
			document.add(new Paragraph("    Room Booked in "+hotn+"  Hotel Booked via CheapStays.com"));
			document.add(new Paragraph("-----------------------------------------------------------------------------------------------------------------"));
			
			document.add(new Paragraph(""));
			document.add(new Paragraph(""));
			document.add(new Paragraph(""));
			document.add(new Paragraph("dear customer ,"));
			document.add(new Paragraph("Your Booking Id is :B"+ bid));
			document.add(new Paragraph("Your room Id is  :" + rid));
			document.add(new Paragraph("Your User Id is :" + user));
			document.add(new Paragraph("Per Night Rate  :Rs." + amt +"/-"));
			document.add(new Paragraph(""));
			document.add(new Paragraph("-----------------------------------------------------------------------------------------------------------------"));
			document.add(new Paragraph(""));
			document.add(new Paragraph(""));
			document.add(new Paragraph("Rules :"));
			document.add(new Paragraph("1. Bring this reference Printable while coming checking in."));
			document.add(new Paragraph("2. The person should receive the confirmation call or else the subscription may be cancelled"));
			document.add(new Paragraph("3. payment in advance, at the time of reporting."));
			document.add(new Paragraph("4. Amount Refundable if your living duration is less than registered duration"));
			document.add(new Paragraph("5. discount coupon applicable if claimed"));
			document.add(new Paragraph("-----------------------------------------------------------------------------------------------------------------"));
			
			document.close();
			file.close();

		} catch (Exception e) {

			e.printStackTrace();
		}
	
       
       %> 


<center>
	<%=msg.billsuccess %><%=session.getAttribute("bid") %>
	
        
      <A href="<%=lnk.index3 %>">Go Back</A>  
       <br>
    <s:url id="fileDownload" namespace="/" action="download1"></s:url>

Download Printable reference - <s:a href="%{fileDownload}">bill.pdf</s:a>   
       </center>
	

	
</body>
</html>
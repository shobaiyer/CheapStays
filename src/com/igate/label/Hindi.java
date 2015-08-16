package com.igate.label;

import java.util.Locale;

import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

public class Hindi {

	ApplicationContext context=new ClassPathXmlApplicationContext("messageContext.xml");
	//Locale locale=Locale.ENGLISH;
	Locale locale = new Locale("in","HN");
	/* Enter page: enter.jsp */
	
		public String welcome=context.getMessage("welcome",null,locale);
		public String description=context.getMessage("description",null,locale);
		
		/* menu */

				public String home=context.getMessage("home",null,locale);
				public String search=context.getMessage("search",null,locale);
				public String contact=context.getMessage("contact",null,locale);
				public String logout=context.getMessage("logout",null,locale);
				public String refresh=context.getMessage("refresh",null,locale);
				
		/* members portal login index.jsp */		

				public String member=context.getMessage("member",null,locale);
				public String userId=context.getMessage("userId",null,locale);
				public String passwd=context.getMessage("passwd",null,locale);
				
		/* footer */
				
				public String copyright=context.getMessage("copyright",null,locale);
				public String resolution=context.getMessage("resolution",null,locale);
				
	/* Search.jsp */
				
				public String Qsearch=context.getMessage("Qsearch",null,locale);
				public String SelectLoc=context.getMessage("SelectLoc",null,locale);
				public String delhi=context.getMessage("delhi",null,locale);
				public String chennai=context.getMessage("chennai",null,locale);
				public String mumbai=context.getMessage("mumbai",null,locale);
				public String kolkata=context.getMessage("kolkata",null,locale);
				public String bangalore=context.getMessage("bangalore",null,locale);
				public String hyderabad=context.getMessage("hyderabad",null,locale);
				
				public String HRating=context.getMessage("HRating",null,locale);
				public String S5=context.getMessage("S5",null,locale);
				public String S4=context.getMessage("S4",null,locale);
				public String S3=context.getMessage("S3",null,locale);
				public String S2=context.getMessage("S2",null,locale);
				public String S1=context.getMessage("S1",null,locale);
				
				public String V5=context.getMessage("V5",null,locale);
				public String V4=context.getMessage("V4",null,locale);
				public String V3=context.getMessage("V3",null,locale);
				public String V2=context.getMessage("V2",null,locale);
				public String V1=context.getMessage("V1",null,locale);
				
	/* contact us .jsp  */	
				
				public String contact1=context.getMessage("contact1",null,locale);
				public String contact2=context.getMessage("contact2",null,locale);
				public String contact3=context.getMessage("contact3",null,locale);
				public String contact4=context.getMessage("contact4",null,locale);
				public String contact5=context.getMessage("contact5",null,locale);
				public String contact6=context.getMessage("contact6",null,locale);
				public String contact7=context.getMessage("contact7",null,locale);
				public String contact8=context.getMessage("contact8",null,locale);
				
	/* bookMe.jsp */
				
				public String BookRoom=context.getMessage("BookRoom",null,locale);
				public String bookingId=context.getMessage("bookingId",null,locale);
				public String roomId=context.getMessage("roomId",null,locale);
				//public String userId1=context.getMessage("userId",null,locale);
				public String bookedFromDate=context.getMessage("bookedFromDate",null,locale);
				public String bookedToDate=context.getMessage("bookedToDate",null,locale);
				public String noOfAdults=context.getMessage("noOfAdults",null,locale);
				public String noOfChildren=context.getMessage("noOfChildren",null,locale);
				public String PNR=context.getMessage("PNR",null,locale);
				public String total=context.getMessage("total",null,locale);
				
				
	/* regframe.jsp */		
				
				public String mandatory=context.getMessage("mandatory",null,locale);
				public String name=context.getMessage("name",null,locale);
				public String EmailId=context.getMessage("EmailId",null,locale);
				public String Address=context.getMessage("Address",null,locale);
				public String Mobile=context.getMessage("Mobile",null,locale);
				public String Phone=context.getMessage("Phone",null,locale);
				
	/* success failure */

				public String regsuccess=context.getMessage("regsuccess",null,locale);
				public String billsuccess=context.getMessage("billsuccess",null,locale);
}

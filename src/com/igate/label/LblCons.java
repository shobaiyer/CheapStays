package com.igate.label;

import java.util.HashMap;
import java.util.Locale;
import java.util.Map;

import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;
import org.springframework.web.bind.annotation.RequestParam;

import sun.util.resources.LocaleData;
import sun.util.resources.OpenListResourceBundle;

import javax.servlet.*;
import java.io.*;
import java.util.Locale;
import java.util.ResourceBundle;
public class LblCons {
	
ApplicationContext context=new ClassPathXmlApplicationContext("messageContext.xml");
	
	ResourceBundle bundle=ResourceBundle.getBundle("message");
    Locale locale1=bundle.getLocale();
	String lang=locale1.getLanguage();
	String country=locale1.getCountry();
	Locale locale = new Locale(country,lang);
	// Enter page: enter.jsp 


		public String welcome=context.getMessage("welcome",null,locale1);
		public String description=context.getMessage("description",null,locale1);
		
		// menu 

		public	String home=context.getMessage("home",null,locale1);
				public String search=context.getMessage("search",null,locale1);
				public String contact=context.getMessage("contact",null,locale1);
				public	String logout=context.getMessage("logout",null,locale1);
				public String refresh=context.getMessage("refresh",null,locale1);
				public String change=context.getMessage("change",null,locale1);
		// members portal login index.jsp 		

				public String member=context.getMessage("member",null,locale1);
				 public String userId=context.getMessage("userId",null,locale1);
				 public String passwd=context.getMessage("passwd",null,locale1);
				
		// footer 
				
				 public String copyright=context.getMessage("copyright",null,locale1);
				 public String resolution=context.getMessage("resolution",null,locale1);
				
	// Search.jsp 
				
				 public String Qsearch=context.getMessage("Qsearch",null,locale1);
				 public String SelectLoc=context.getMessage("SelectLoc",null,locale1);
				 public String delhi=context.getMessage("delhi",null,locale1);
				 public String chennai=context.getMessage("chennai",null,locale1);
				 public String mumbai=context.getMessage("mumbai",null,locale1);
				 public	 String kolkata=context.getMessage("kolkata",null,locale1);
				 public String bangalore=context.getMessage("bangalore",null,locale1);
				 public String hyderabad=context.getMessage("hyderabad",null,locale1);
				
				 public String HRating=context.getMessage("HRating",null,locale1);
				 public String S5=context.getMessage("S5",null,locale1);
				 public String S4=context.getMessage("S4",null,locale1);
				 public String S3=context.getMessage("S3",null,locale1);
				 public String S2=context.getMessage("S2",null,locale1);
				 public	 String S1=context.getMessage("S1",null,locale1);
				
				public String V5=context.getMessage("V5",null,locale1);
				public String V4=context.getMessage("V4",null,locale1);
				public String V3=context.getMessage("V3",null,locale1);
				public String V2=context.getMessage("V2",null,locale1);
				public String V1=context.getMessage("V1",null,locale1);
				
	// contact us .jsp  	
				
				public String contact1=context.getMessage("contact1",null,locale1);
				public String contact2=context.getMessage("contact2",null,locale1);
				public String contact3=context.getMessage("contact3",null,locale1);
				public String contact4=context.getMessage("contact4",null,locale1);
				
	// bookMe.jsp 
				
				public String BookRoom=context.getMessage("BookRoom",null,locale1);
				public String bookingId=context.getMessage("bookingId",null,locale1);
				public String roomId=context.getMessage("roomId",null,locale1);
				//public String userId1=context.getMessage("userId",null,locale);
				public String bookedFromDate=context.getMessage("bookedFromDate",null,locale1);
				public String bookedToDate=context.getMessage("bookedToDate",null,locale1);
				public String noOfAdults=context.getMessage("noOfAdults",null,locale1);
				public String noOfChildren=context.getMessage("noOfChildren",null,locale1);
				public String PNR=context.getMessage("PNR",null,locale1);
				public String total=context.getMessage("total",null,locale1);
				
				
	// regframe.jsp 		
				
				public String mandatory=context.getMessage("mandatory",null,locale1);
				public String name=context.getMessage("name",null,locale1);
				public String EmailId=context.getMessage("EmailId",null,locale1);
				public String Address=context.getMessage("Address",null,locale1);
				public String Mobile=context.getMessage("Mobile",null,locale1);
				public String Phone=context.getMessage("Phone",null,locale1);
				
	// success failure 

				public String regsuccess=context.getMessage("regsuccess",null,locale1);
				public String billsuccess=context.getMessage("billsuccess",null,locale1);
}


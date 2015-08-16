package com.igate.label;

import java.util.Locale;

import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

public class AdmnCons {

	ApplicationContext context=new ClassPathXmlApplicationContext("AdmnMsgContext.xml");
	Locale locale=Locale.ENGLISH;
	
	
	public String addRoomSuccess=context.getMessage("addRoomSuccess",null,locale);
	public String redirectmsg=context.getMessage("redirectmsg",null,locale);
	
	public String AddRoom=context.getMessage("AddRoom",null,locale);
	public String DeleteRoom=context.getMessage("DeleteRoom",null,locale);
	public String RoomRate=context.getMessage("RoomRate",null,locale);
	public String AddHotel=context.getMessage("AddHotel",null,locale);
	public String Logout=context.getMessage("Logout",null,locale);
	
	public String hotelName=context.getMessage("hotelName",null,locale);
	public String roomNo=context.getMessage("roomNo",null,locale);
	public String roomType=context.getMessage("roomType",null,locale);
	public String Availability=context.getMessage("Availability",null,locale);
	
	public String StannonAcroom=context.getMessage("StannonAcroom",null,locale);
	public String StanAcroom=context.getMessage("StanAcroom",null,locale);
	public String ExecAcroom=context.getMessage("ExecAcroom",null,locale);
	public String DelAcroom=context.getMessage("DelAcroom",null,locale);
	
	public String DeleteHotel=context.getMessage("DeleteHotel",null,locale);
	public String Ratings=context.getMessage("Ratings",null,locale);
	public String Description=context.getMessage("Description",null,locale);
	
	public String Ahead=context.getMessage("Ahead",null,locale);
	public String DelHotel=context.getMessage("DelHotel",null,locale);
	
	
}

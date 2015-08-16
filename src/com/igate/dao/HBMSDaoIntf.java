/************************************************************************************
 * File:        HBMSDaoIntf.java
 * Package:     com.igate.dao
 * Desc:        Dao interface 
 * Version:     5.0
 * Modifications: additon of few methods
 * Author:  Ketan Hassija , Gaurab Ganguly                  Date: 10-01-2014         Change Description:n/a
  ************************************************************************************/

package com.igate.dao;

import java.util.List;

import com.igate.bean.BookingDetailsBean;
import com.igate.bean.HotelBean;
import com.igate.bean.RoomBean;
import com.igate.bean.UserBean;
import com.igate.exception.HotelNameNotFoundException;
import com.igate.exception.HotelNotFoundException;
import com.igate.exception.InvalidLoginDataException;
import com.igate.exception.RoomNotEmptyException;
import com.igate.exception.RoomNotFoundException;
import com.igate.exception.UserIdAlreadyExistsException;

public interface HBMSDaoIntf {
	
	/*public static final String INSERT_USER_DETAILS="insert into User_details values(?,?,?,?,?,?,?,?)";

	public static String SELECT_UID_FROM_USERS="select user_id from user_details where user_id=?";
	
	public static String SELECT_UID_ROLE_FROM_USERS="select user_id from user_details where user_id=?";
	
	public static final String SEARCH_HOTEL="select * from hotel where rating=? and city=? and hotel_id in (select hotel_id from room_details where available in ('Y') and flag=0)";
	
	public static final String INSERT_BOOKING_DETAILS="insert into Booking_details values('B'||book_seq1.nextVal,?,?,?,?,?,?,?)";
	
	public static final String GET_BOOKING_ID="select book_seq1.nextval-1 from dual ";
	
	public static final String UPDATE_ROOM_BEAN="update room_details set available=? where room_id=?";
	
	public static final String GET_ROOM_DETAILS="select room_id,room_no,room_type,per_night_rate from room_details where hotel_id=? and available like 'Y' and flag=0";
	
	public static final String GET_HOTEL_LIST="select * from hotel where hotel_id=?";
	 
	public static final String ADD_HOTEL="insert into Hotel values('H'||HotelSeq.nextval,?,?,?,?,?,?,?,?,?,?,q1.nextval,0)";
	
	public static final String DELETE_HOTEL="update hotel set flag=1 where name=? ";
	
	public static final String MODIFY_HOTEL_DESC="update hotel set description=? where hotel_id =? and flag=0";
	
	public static final String MODIFY_HOTEL_RATING="update hotel set rating=? where name =? and flag=0";
	*/
	public boolean insertUser(UserBean u) throws UserIdAlreadyExistsException;
	
	public String validateUser(String userId, String password)
	throws InvalidLoginDataException;
	
	public List<HotelBean> searchHotel(String rating, String city);
	
	public boolean insertBookingDetails(BookingDetailsBean bd);
	
	public List<RoomBean> getRoomDetails(String hotelId);
	
	public HotelBean getHotelList(String hotelId);
	
	public boolean addHotel(HotelBean h);
	
	public boolean deleteHotel(String hotelId) ;
	
	public boolean modifyHotelDesc(String hotelId,String desc);
	
	public boolean modifyHotelRating(String hotelId,String rating) /*throws HotelNotFoundException*/;
	
	public boolean addRoom(RoomBean r);
	
	public boolean deleteRoom(String roomId) throws RoomNotFoundException, RoomNotEmptyException;
	
	public boolean modifyRoomRate(int rate,String roomId) throws RoomNotFoundException;
	
	public List<HotelBean> getHotelList();
	
	public List<BookingDetailsBean> getBookingDetailsOn(String bookedFrom);
	
	public List<BookingDetailsBean> getBookingDetailsSpecific(String hotelName);
	
	public List<UserBean> getGuestList(String hotelName) throws HotelNameNotFoundException;
	
	public List<BookingDetailsBean> getBookingId();	

	boolean updatePassword(String password,String userId);
}

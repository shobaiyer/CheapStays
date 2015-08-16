/************************************************************************************
 * File:        HBMSDaoImpl.java
 * Package:     com.igate.dao
 * Desc:        Dao for database interaction
 * Version:     5.0
 * Modifications: additon of few methods
 * Author:  Ketan Hassija,Gaurab Ganguly              Date: 10-01-2014         Change Description:n/a
 ************************************************************************************/

package com.igate.dao;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.jdbc.core.simple.SimpleJdbcTemplate;
import org.springframework.stereotype.Component;

import com.igate.logger.MyLogger;

import org.apache.log4j.Logger;

import com.igate.exception.HotelNameNotFoundException;
import com.igate.exception.HotelNotFoundException;
import com.igate.exception.InvalidLoginDataException;
import com.igate.exception.RoomNotEmptyException;
import com.igate.exception.RoomNotFoundException;
import com.igate.exception.UserIdAlreadyExistsException;

import com.igate.bean.BookingDetailsBean;
import com.igate.bean.HotelBean;
import com.igate.bean.RoomBean;
import com.igate.bean.UserBean;

@Component("hbmsdao")
public class HBMSDaoImpl implements HBMSDaoIntf {

	@Autowired
	SimpleJdbcTemplate simpleJdbcTemplate;

	private String sql;
	private static final Logger logg = MyLogger.myLog();

	public SimpleJdbcTemplate getSimpleJdbcTemplate() {
		return simpleJdbcTemplate;
	}

	public void setSimpleJdbcTemplate(SimpleJdbcTemplate simpleJdbcTemplate) {
		this.simpleJdbcTemplate = simpleJdbcTemplate;
	}

	public HBMSDaoImpl() {

	}

	/**
	 * Inserts a user into database
	 * 
	 * @param userbean
	 * @return boolean
	 * 
	 * **/
	public boolean insertUser(UserBean u) throws UserIdAlreadyExistsException {
		String userId = u.getUserId();
		String password = u.getPassword();
		String role = u.getRole();
		String userName = u.getUserName();
		String mobile = u.getMobile();
		String phone = u.getPhone();
		String address = u.getAddress();
		String email = u.getEmail();

		boolean userInserted = false;
		if (checkUser(userId)) {
			sql = "insert into User_details values(?,?,?,?,?,?,?,?)";
			Object[] params = new Object[] { userId, password, role, userName,
					mobile, phone, address, email };

			int result = simpleJdbcTemplate.update(sql, params);

			if (result == 1)
				userInserted = true;
			else
				userInserted = false;

		} else {
			throw new UserIdAlreadyExistsException("User id " + userId
					+ " already exists.Please select some other user id");
		}
		logg.info("User Insertion succeded");
		return userInserted;
	}

	/**
	 * Checks existence of user, returns true if user does not already exists
	 * 
	 * @param String
	 *            userId
	 * @return boolean
	 */
	private boolean checkUser(String userId) {

		sql = "select user_id from user_details where user_id=?";
		Object[] params = new Object[] { userId };
		@SuppressWarnings("rawtypes")
		RowMapper mapper = new RowMapper() {
			public UserBean mapRow(ResultSet rs, int rowNum)
					throws SQLException {
				UserBean bean = new UserBean();
				bean.setUserId(rs.getString(1));
				return bean;
			}
		};


		@SuppressWarnings("unchecked")
		List<UserBean> list = simpleJdbcTemplate.query(sql, mapper, params);

		boolean result = list.isEmpty();

		return result;
	};

	/**
	 * Validates userId and password against the Database and returns the role
	 * 
	 * @param String
	 *            userId,String Password
	 * @return String
	 */
	@SuppressWarnings("unchecked")
	public String validateUser(String userId, String password)
			throws InvalidLoginDataException, IllegalStateException {

		UserBean user = new UserBean();
		sql = "select user_id,role from user_details where user_id=? and password=?";
		Object[] params = new Object[] { userId, password };

		@SuppressWarnings("rawtypes")
		RowMapper mapper = new RowMapper() {
			public UserBean mapRow(ResultSet rs, int rowNum)
					throws SQLException {
				UserBean bean = new UserBean();
				bean.setUserId(rs.getString("user_id"));
				bean.setRole(rs.getString("role"));
				return bean;
			}
		};

		user = (UserBean) simpleJdbcTemplate
				.queryForObject(sql, mapper, params);

		String role = user.getRole();

		if (role.equals(null)) {

			throw new InvalidLoginDataException("Wrong username or password");
		}
		if (role.equalsIgnoreCase("user"))
			logg.info("user validated successfully");
		else if (role.equalsIgnoreCase("admin"))
			logg.info("admin validated successfully");
		else {
			logg.info("Invalid user data");
			throw new InvalidLoginDataException("Wrong username or password");
		}

		return user.getRole();
	}

	/**
	 * Searches Hotel
	 * 
	 * @param String
	 *            rating,String City.
	 * @return List<HotelBean>
	 */
	@SuppressWarnings({ "rawtypes", "unchecked" })
	public List<HotelBean> searchHotel(String rating, String city) {

		List<HotelBean> listOfHotels = new ArrayList<HotelBean>();

		sql = "select * from hotel where rating=? and city=? and hotel_id in (select hotel_id from room_details where available in ('Y') and flag=0)";
		Object[] params = new Object[] { rating, city };

		RowMapper mapper = new RowMapper() {
			public HotelBean mapRow(ResultSet rs, int rowNum)
					throws SQLException {
				HotelBean bean = new HotelBean();
				bean.setHotelId(rs.getString("hotel_id"));
				bean.setCity(rs.getString("city"));
				bean.setHotelName(rs.getString("name"));
				bean.setAddress(rs.getString("address"));
				bean.setDesc(rs.getString("description"));
				bean.setAvgRatePerNight(rs.getInt("avg_rate_per_night"));
				bean.setPhoneNumber1(rs.getString("phoneno1"));
				bean.setPhoneNumber2(rs.getString("phoneno2"));
				bean.setRating(rs.getString("rating"));
				bean.setEmail(rs.getString("email"));
				bean.setFax(rs.getString("fax"));
				return bean;
			}
		};

		listOfHotels = simpleJdbcTemplate.query(sql, mapper, params);

		logg.info("search succeded");
		return listOfHotels;

	}

	/**
	 * Inserts Booking details in the database
	 * 
	 * @param BookingDetailsBean
	 * @return boolean
	 */
	@SuppressWarnings("deprecation")
	public boolean insertBookingDetails(BookingDetailsBean bd) {

		String roomId = bd.getRoomId();
		String userId = bd.getUserId();

		String bookFrom = bd.getBookedFromDate();
		bookFrom = bookFrom.replaceAll("-", "/");
		java.util.Date bookedFromUtilDate = new java.util.Date(bookFrom);
		java.sql.Date bookedFromSqlDate = new java.sql.Date(
				bookedFromUtilDate.getTime());

		String bookTo = bd.getBookedToDate();
		bookTo = bookTo.replaceAll("-", "/");
		java.util.Date bookedToUtilDate = new java.util.Date(bookTo);
		java.sql.Date bookedToSqlDate = new java.sql.Date(
				bookedToUtilDate.getTime());

		int noOfAdults = bd.getNoOfAdults();
		int noOfChildren = bd.getNoOfChildren();
		double amount = bd.getAmount();

		boolean bookingDetailsInserted;
		sql = "insert into Booking_details values('B'||book_seq1.nextVal,?,?,?,?,?,?,?)";

		Object[] params = new Object[] { roomId, userId, bookedFromSqlDate,
				bookedToSqlDate, noOfAdults, noOfChildren, amount };

		int result = simpleJdbcTemplate.update(sql, params);

		if (result == 1) {
			bookingDetailsInserted = true;
			updateRoomBean(roomId, "N");
		} else
			bookingDetailsInserted = false;

		return bookingDetailsInserted;

	}

	/**
	 * returns most recent booking ID from the database
	 * 
	 * @return bookingId
	 */
	@SuppressWarnings({ "rawtypes", "unchecked" })
	public List<BookingDetailsBean> getBookingId() {

		sql = "select book_seq1.nextval-1 from dual ";

		RowMapper mapper = new RowMapper() {
			public BookingDetailsBean mapRow(ResultSet rs, int rowNum)
					throws SQLException {
				BookingDetailsBean bean = new BookingDetailsBean();
				bean.setBookingId(rs.getString(1));

				return bean;
			}
		};

		List<BookingDetailsBean> bid = simpleJdbcTemplate.query(sql, mapper);

		return bid;
	}
	
	/**
	 * Updates the Room details in the database
	 * 
	 * @param String
	 *            roomId,String available
	 * @return boolean
	 * 
	 */
	private boolean updateRoomBean(String roomId, String available) {

		boolean roomUpdated = false;
		sql = "update room_details set available=? where room_id=?";

		Object[] params = new Object[] { available, roomId };

		int result = simpleJdbcTemplate.update(sql, params);

		if (result == 1) {
			roomUpdated = true;
		} else
			roomUpdated = false;

		logg.info("Update room details succeded");
		return roomUpdated;

	}

	/**
	 * Lists the room details like room_type,per_night_rate
	 * 
	 * @param String
	 *            hotelId
	 * @return List<roomBean>
	 */
	@SuppressWarnings({ "rawtypes", "unchecked" })
	public List<RoomBean> getRoomDetails(String hotelId) {

		sql = "select room_id,room_no,room_type,per_night_rate,available from room_details where hotel_id=? and flag=0";
		List<RoomBean> listOfRooms = new ArrayList<RoomBean>();
		Object[] params = new Object[] { hotelId };
		RowMapper mapper = new RowMapper() {
			public RoomBean mapRow(ResultSet rs, int rowNum)
					throws SQLException {
				RoomBean bean = new RoomBean();
				bean.setRoomId(rs.getString("room_id"));
				bean.setRoomNo(rs.getString("room_no"));
				bean.setRoomType(rs.getString("room_type"));
				bean.setPerNightRate(rs.getInt("per_night_rate"));
				bean.setAvailable(rs.getString("available"));
				return bean;
			}
		};

		listOfRooms = simpleJdbcTemplate.query(sql, mapper, params);

		return listOfRooms;
	}

	/**
	 * Lists the hotel details
	 * 
	 * @param String
	 *            hotelId
	 * @return HotelBean
	 */
	@SuppressWarnings({ "rawtypes", "unchecked" })
	public HotelBean getHotelList(String hotelId) {

		HotelBean hotel = new HotelBean();
		sql = "select * from hotel where hotel_id=?";
		Object[] params = new Object[] { hotelId };
		RowMapper mapper = new RowMapper() {
			public HotelBean mapRow(ResultSet rs, int rowNum)
					throws SQLException {
				HotelBean bean = new HotelBean();
				bean.setHotelId(rs.getString("hotel_id"));
				bean.setCity(rs.getString("city"));
				bean.setHotelName(rs.getString("name"));
				bean.setAddress(rs.getString("address"));
				bean.setDesc(rs.getString("description"));
				bean.setAvgRatePerNight(rs.getInt("avg_rate_per_night"));
				bean.setPhoneNumber1(rs.getString("phoneno1"));
				bean.setPhoneNumber2(rs.getString("phoneno2"));
				bean.setRating(rs.getString("rating"));
				bean.setEmail(rs.getString("email"));
				bean.setFax(rs.getString("fax"));
				return bean;
			}
		};

		hotel = (HotelBean) simpleJdbcTemplate.queryForObject(sql, mapper,
				params);

		return hotel;
	}

	/**
	 * adds a new hotel to the database
	 * 
	 * @param HotelBean
	 * @return boolean
	 */
	public boolean addHotel(HotelBean h) {

		boolean hotelAdded = false;
		String city = h.getCity();
		String name = h.getHotelName();
		String address = h.getAddress();
		String description = h.getDesc();
		int avgRatePerNight = h.getAvgRatePerNight();
		String phoneNo1 = h.getPhoneNumber1();
		String phoneNo2 = h.getPhoneNumber2();
		String rating = h.getRating();
		String email = h.getEmail();
		String fax = h.getFax();

		sql = "insert into Hotel values('H'||HotelSeq.nextval,?,?,?,?,?,?,?,?,?,?,q1.nextval,0)";

		Object[] params = new Object[] { city, name, address, description,
				avgRatePerNight, phoneNo1, phoneNo2, rating, email, fax };

		int result = simpleJdbcTemplate.update(sql, params);

		if (result == 1)
			hotelAdded = true;
		else
			hotelAdded = false;

		return hotelAdded;

	}

	/**
	 * deletes a hotel based on the hotel id in the database
	 * 
	 * @param hotelId
	 * @return boolean
	 * @throws RoomNotEmptyException
	 */
	/*
	 * public boolean deleteHotel(String hotelName) {
	 * 
	 * System.out.println(hotelName); int result=0; boolean hotelDeleted =
	 * false;
	 * 
	 * 
	 * 
	 * 
	 * if(result==1){ sql = "delete from hotel where hotel_id =?"; sql =
	 * "update hotel set flag=1 where name=? "; Object[] paramss = new Object[]
	 * { hotelName };
	 * 
	 * result = simpleJdbcTemplate.update(sql, paramss);
	 * 
	 * if (result == 1) { hotelDeleted = true; } else hotelDeleted = false; }
	 * logg.info("hotel deleted successfully"); return hotelDeleted;
	 * 
	 * }
	 */
	/**
	 * modifies the hotel description in the database
	 * 
	 * @param description
	 * @param hotelId
	 * @return boolean
	 */
	public boolean modifyHotelDesc(String hotelName, String desc) {

		boolean hotelModified;

		sql = "update hotel set description=? where name =? and flag=0";
		Object[] params = new Object[] { desc, hotelName };

		int result = simpleJdbcTemplate.update(sql, params);

		if (result == 1) {
			hotelModified = true;
			logg.info("hotel description modified successfully");
		} else {
			hotelModified = false;
			logg.info("hotel description modification failed");
		}

		return hotelModified;
	}

	/**
	 * modifies the hotel description in the database
	 * 
	 * @param description
	 * @param hotelId
	 * @return boolean
	 */
	public boolean modifyHotelRating(String rating, String hotelName)
	/* throws HotelNotFoundException */{
		System.out.println(hotelName);
		boolean hotelModified;
		/*
		 * if (!checkHotelPresentOnId(hotelName)) { throw new
		 * HotelNotFoundException("Hotel " + hotelName + " not found"); }
		 */

		sql = "update hotel set rating=? where name =? and flag=0";

		Object[] params = new Object[] { rating, hotelName };

		int result = simpleJdbcTemplate.update(sql, params);

		if (result == 1) {
			hotelModified = true;
			logg.info("hotel rating modified successfully");
		} else {
			hotelModified = false;
			logg.info("hotel rating modification failed");
		}

		return hotelModified;
	}

	/**
	 * adds a new room in the database
	 * 
	 * @param roomBean
	 * @return boolean
	 */
	public boolean addRoom(RoomBean r) {

		boolean roomInserted = false;
		String hotelName = r.getHotelName();
		String roomNo = r.getRoomNo();
		String roomType = r.getRoomType();
		int perNightRate = r.getPerNightRate();
		String available = r.getAvailable();
		String hotelId = r.getHotelId();
		sql = "insert into Room_details values(?,'R'||RoomSeq.nextval,?,?,?,?,0)";

		Object[] params = new Object[] { hotelId, roomNo, roomType,
				perNightRate, available };

		int result = simpleJdbcTemplate.update(sql, params);

		if (result == 1) {
			roomInserted = true;
			logg.info("room added successfully");
		} else {
			roomInserted = false;
			logg.info("room addition failed");
		}
		return roomInserted;
	}

	/**
	 * deletes the room based on roomId in the database
	 * 
	 * @param roomId
	 * @return boolean
	 * @throws RoomNotEmptyException
	 */
	public boolean deleteRoom(String roomId) throws RoomNotFoundException,
			RoomNotEmptyException {

		boolean roomDeleted = false;

		if (!checkRoomPresent(roomId)) {
			throw new RoomNotFoundException("Room " + roomId
					+ " does not exists");
		}

		if (!checkRoomEmpty(roomId)) {
			throw new RoomNotEmptyException("Room " + roomId
					+ " is not empty. Hence cannot be deleted");
		}

		/* sql = "delete from room_details where room_id = ?"; */
		sql = "update room_details set available='N',flag=1 where room_id = ?";
		Object[] params = new Object[] { roomId };

		int result = simpleJdbcTemplate.update(sql, params);

		if (result == 1) {
			roomDeleted = true;
			logg.info("room deleted successfully");
		} else {
			roomDeleted = false;
			logg.info("room deletion failed");
		}

		return roomDeleted;
	}
	
	
	public boolean deleteHotel(String hotelId) {

boolean roomDeleted = false;


/* sql = "delete from room_details where room_id = ?"; */
sql = "update hotel set flag=1 where hotel_id = ?";
Object[] params = new Object[] {hotelId };

int result = simpleJdbcTemplate.update(sql, params);

boolean hotelDeleted;
if (result == 1) {
	hotelDeleted = true;
	logg.info("hotel deleted successfully");
} else {
	hotelDeleted = false;
	logg.info("hotel deletion failed");
}

return hotelDeleted;
}

	/**
	 * modifies the room rate in the database
	 * 
	 * @param rate
	 * @param roomId
	 * @return boolean
	 */
	public boolean modifyRoomRate(int rate, String roomId)
			throws RoomNotFoundException {

		boolean roomModified = false;
		if (!checkRoomPresent(roomId)) {
			throw new RoomNotFoundException("Room " + roomId
					+ " does not exists");
		}

		sql = "update room_details set per_night_rate=? where room_Id=? and flag=0";

		Object[] params = new Object[] { rate, roomId };
		
		int result = simpleJdbcTemplate.update(sql, params);

		if (result == 1) {
			roomModified = true;
			logg.info("room modified successfully");
		} else {
			roomModified = false;
			logg.info("room modification failed");
		}

		return roomModified;
	}

	/**
	 * get list of hotels from the database
	 * 
	 * @return List<HotelBean>
	 */
	@SuppressWarnings({ "rawtypes", "unchecked" })
	public List<HotelBean> getHotelList() {

		List<HotelBean> listOfHotels = new ArrayList<HotelBean>();
		sql = "select * from hotel where flag=0 ";

		RowMapper mapper = new RowMapper() {
			public HotelBean mapRow(ResultSet rs, int rowNum)
					throws SQLException {
				HotelBean bean = new HotelBean();
				bean.setHotelId(rs.getString("hotel_id"));
				bean.setCity(rs.getString("city"));
				bean.setHotelName(rs.getString("name"));
				bean.setAddress(rs.getString("address"));
				bean.setDesc(rs.getString("description"));
				bean.setAvgRatePerNight(rs.getInt("avg_rate_per_night"));
				bean.setPhoneNumber1(rs.getString("phoneno1"));
				bean.setPhoneNumber2(rs.getString("phoneno2"));
				bean.setRating(rs.getString("rating"));
				bean.setEmail(rs.getString("email"));
				bean.setFax(rs.getString("fax"));
				return bean;
			}
		};

		listOfHotels = simpleJdbcTemplate.query(sql, mapper);

		logg.info("search succeded");
		return listOfHotels;

	}

	/**
	 * get Booking details based on booked from date from the database
	 * 
	 * @param bookedFrom
	 * @return List<BookinDetailsBean>
	 */
	@SuppressWarnings({ "rawtypes", "unchecked", "deprecation" })
	public List<BookingDetailsBean> getBookingDetailsOn(String bookedFrom) {

		List<BookingDetailsBean> listBooking = new ArrayList<BookingDetailsBean>();

		String b = bookedFrom.replaceAll("-", "/");

		java.util.Date utilDate = new java.util.Date(b);
		java.sql.Date sqldate = new java.sql.Date(utilDate.getTime());

		sql = "select * from booking_details where booked_from like ?";
		Object[] params = new Object[] { sqldate };
		RowMapper mapper = new RowMapper() {
			public BookingDetailsBean mapRow(ResultSet rs, int rowNum)
					throws SQLException {
				BookingDetailsBean bean = new BookingDetailsBean();
				bean.setBookingId(rs.getString("booking_id"));
				bean.setRoomId(rs.getString("room_id"));
				bean.setUserId(rs.getString("user_id"));
				bean.setBookedFromDate(rs.getDate("booked_from").toString());
				bean.setBookedToDate(rs.getDate("booked_to").toString());
				bean.setNoOfAdults(rs.getInt("no_of_adults"));
				bean.setNoOfChildren(rs.getInt("no_of_children"));
				bean.setAmount(rs.getDouble("amount"));
				return bean;
			}
		};

		listBooking = simpleJdbcTemplate.query(sql, mapper, params);

		logg.info("Booking details retrieved successfully");
		return listBooking;
	}

	/**
	 * get Booking details based on hotel name from the database
	 * 
	 * @param hotelName
	 * @return List<BookingDetailsBean>
	 */
	@SuppressWarnings({ "rawtypes", "unchecked" })
	public List<BookingDetailsBean> getBookingDetailsSpecific(String hotelName) {

		List<BookingDetailsBean> listBooking = new ArrayList<BookingDetailsBean>();

		sql = "select * from booking_details b,hotel h,room_details r where r.hotel_id=h.hotel_id and h.name =? and r.room_id=b.room_id";
		Object[] params = new Object[] { hotelName };

		RowMapper mapper = new RowMapper() {
			public BookingDetailsBean mapRow(ResultSet rs, int rowNum)
					throws SQLException {
				BookingDetailsBean bean = new BookingDetailsBean();
				bean.setBookingId(rs.getString("booking_id"));
				bean.setRoomId(rs.getString("room_id"));
				bean.setUserId(rs.getString("user_id"));
				bean.setBookedFromDate(rs.getDate("booked_from").toString());
				bean.setBookedToDate(rs.getDate("booked_to").toString());
				bean.setNoOfAdults(rs.getInt("no_of_adults"));
				bean.setNoOfChildren(rs.getInt("no_of_children"));
				bean.setAmount(rs.getDouble("amount"));
				return bean;
			}
		};

		listBooking = simpleJdbcTemplate.query(sql, mapper, params);

		logg.info("Booking details retrieved successfully");

		return listBooking;
	}

	/**
	 * get Users based on hotel name from the database
	 * 
	 * @param hotelName
	 * @return List<UserBean>
	 */
	@SuppressWarnings({ "rawtypes", "unchecked" })
	public List<UserBean> getGuestList(String hotelName)
			throws HotelNameNotFoundException {

		List<UserBean> userList = new ArrayList<UserBean>();

		if (!checkHotelPresentOnName(hotelName)) {
			throw new HotelNameNotFoundException("Hotel Name " + hotelName
					+ " not found");
		}
		sql = "select username from booking_details b,user_details u,hotel h,room_details r where b.user_id=u.user_id and h.name=?  and h.hotel_id=r.hotel_id and b.room_id=r.room_id";
		Object[] params = new Object[] { hotelName };

		RowMapper mapper = new RowMapper() {
			public UserBean mapRow(ResultSet rs, int rowNum)
					throws SQLException {
				UserBean bean = new UserBean();
				bean.setUserName(rs.getString("username"));
				return bean;
			}
		};

		userList = simpleJdbcTemplate.query(sql, mapper, params);

		logg.info("User details retrieved successfully");

		return userList;
	}

	/**
	 * checks whether hotel exists based on hotel id from the database
	 * 
	 * @param hotelId
	 * @return boolean
	 */

	@SuppressWarnings({ "rawtypes", "unchecked" })
	private boolean checkHotelPresentOnId(String hotelId) {

		List<HotelBean> list = new ArrayList<HotelBean>();
		sql = "select * from hotel where hotel_id=? and flag=0";
		Object[] params = new Object[] { hotelId };

		RowMapper mapper = new RowMapper() {
			public HotelBean mapRow(ResultSet rs, int rowNum)
					throws SQLException {
				HotelBean bean = new HotelBean();
				bean.setHotelId(rs.getString("hotel_id"));
				return bean;
			}
		};

		list = simpleJdbcTemplate.query(sql, mapper, params);

		if (list.isEmpty())
			return false;
		else
			return true;
	}

	/**
	 * checks whether hotel name exists based on hotel name from the database
	 * 
	 * @param hotelName
	 * @return boolean
	 */
	@SuppressWarnings({ "rawtypes", "unchecked" })
	private boolean checkHotelPresentOnName(String hotelName) {

		List<HotelBean> list = new ArrayList<HotelBean>();
		sql = "select hotel_id from hotel where name=?";

		Object[] params = new Object[] { hotelName };

		RowMapper mapper = new RowMapper() {
			public HotelBean mapRow(ResultSet rs, int rowNum)
					throws SQLException {
				HotelBean bean = new HotelBean();
				bean.setHotelName(rs.getString("hotel_id"));
				return bean;
			}
		};

		list = simpleJdbcTemplate.query(sql, mapper, params);

		if (list.isEmpty())
			return false;
		else
			return true;
	}

	/**
	 * checks whether room exists based on room id from the database
	 * 
	 * @param roomId
	 * @return boolean
	 */
	@SuppressWarnings({ "rawtypes", "unchecked" })
	private boolean checkRoomPresent(String roomId) {
		List<RoomBean> list = new ArrayList<RoomBean>();

		sql = "select * from room_details where room_id=?";

		Object[] params = new Object[] { roomId };

		RowMapper mapper = new RowMapper() {
			public RoomBean mapRow(ResultSet rs, int rowNum)
					throws SQLException {
				RoomBean bean = new RoomBean();
				bean.setRoomId(rs.getString("room_id"));
				return bean;
			}
		};

		list = simpleJdbcTemplate.query(sql, mapper, params);

		if (list.isEmpty())
			return false;
		else
			return true;
	}

	/**
	 * checks whether hotel is empty based on hotel id from the database
	 * 
	 * @param hotelId
	 * @return boolean
	 */
	@SuppressWarnings({ "rawtypes", "unchecked" })
	private boolean checkHotelEmpty(String hotelName) {
		System.out.println(hotelName);
		List<RoomBean> list = new ArrayList<RoomBean>();
		sql = " select room_id from room_details where hotel_id=(select hotelId from hotel where name=?) and available='N'";
		Object[] params = new Object[] { hotelName };

		RowMapper mapper = new RowMapper() {
			public RoomBean mapRow(ResultSet rs, int rowNum)
					throws SQLException {
				RoomBean bean = new RoomBean();
				bean.setRoomId(rs.getString("room_id"));
				return bean;
			}
		};

		list = simpleJdbcTemplate.query(sql, mapper, params);

		if (list.isEmpty())
			return true;
		else
			return false;
	}

	/**
	 * checks whether room is empty in a hotel based on room id from the
	 * database
	 * 
	 * @param roomId
	 * @return boolean
	 */
	@SuppressWarnings({ "rawtypes", "unchecked" })
	private boolean checkRoomEmpty(String roomId) {

		List<RoomBean> list = new ArrayList<RoomBean>();

		sql = " select room_id from room_details where room_id=? and available='N'";
		Object[] params = new Object[] { roomId };

		RowMapper mapper = new RowMapper() {
			public RoomBean mapRow(ResultSet rs, int rowNum)
					throws SQLException {
				RoomBean bean = new RoomBean();
				bean.setRoomId(rs.getString("room_id"));
				return bean;
			}
		};

		list = simpleJdbcTemplate.query(sql, mapper, params);

		if (list.isEmpty())
			return true;
		else
			return false;
	}

	
	public boolean updatePassword(String password,String userId) {
		//logg.info("Update Password succeded");
		
		boolean passwordUpdated = false ;
		sql = "update user_details set password=? where user_id=?";
		System.out.println(password+" "+userId);
		Object[] params = new Object[] { password, userId };
		int result=simpleJdbcTemplate.update(sql, params);
		if (result == 1) {
			passwordUpdated = true;
			logg.info("Password modified successfully");
		} else {
			passwordUpdated = false;
			logg.info("Password modification failed");
		}

		return passwordUpdated;

	}






}

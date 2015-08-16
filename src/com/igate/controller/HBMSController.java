/************************************************************************************
 * File:        HBMSController.java
 * Package:     com.igate.controller
 * Desc:        Controller for navigation of pages
 * Version:     5.0
 * Author:  Gaurab Ganguly,Ketan Hassija          Date: 12-01-2014         Change Description:n/a
 ************************************************************************************/

package com.igate.controller;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import com.igate.bean.BookingDetailsBean;
import com.igate.bean.HotelBean;
import com.igate.bean.RoomBean;
import com.igate.bean.UserBean;
import com.igate.dao.HBMSDaoImpl;
import com.igate.exception.HotelNameNotFoundException;
import com.igate.exception.HotelNotFoundException;
import com.igate.exception.InvalidLoginDataException;
import com.igate.exception.RoomNotEmptyException;
import com.igate.exception.RoomNotFoundException;
import com.igate.exception.UserIdAlreadyExistsException;
import com.igate.label.LblCons;

@Scope("session")
@Controller
public class HBMSController implements HBMSControllerIntf {

	@Autowired
	private HttpSession session;

	@Autowired
	HBMSDaoImpl allDao;
	LblCons cons;

	/**
	 * Redirects Enter page to index page
	 * 
	 * @return index
	 * 
	 * **/

	@RequestMapping(value = "/index")
	public String prepareLogin(Model model) {

		// model.addAttribute("hn", hn);
		model.addAttribute("user", new UserBean());
		model.addAttribute("hotel", new HotelBean());

		return INDEX;
	}

	
	@RequestMapping(value = "/change")
	public String change(Model model,@RequestParam("ch") String ch) {

		model.addAttribute("ch", ch);
		

		return "changePassword";
	}
	
	@RequestMapping(value = "/changed")
	public String changed(Model model,@RequestParam("updated") String up) {

		 model.addAttribute("up", up);
		 session.removeAttribute("user");
			return INDEX;

	}
	/*
	 * @RequestMapping(value = "test") public String prepare(Model model ,
	 * @RequestParam("hn") String hn) { System.out.println(hn); List msg =
	 * cons.message(hn);
	 * 
	 * model.addAttribute("msg", msg);
	 * 
	 * return "test"; }
	 */

	/**
	 * Redirects Enter page to index page with errors
	 * 
	 * @return index
	 * 
	 * **/

	@RequestMapping(value = "/index1")
	public String returind(Model model, @RequestParam("ltc") String ltc) {
		model.addAttribute("user", new UserBean());
		model.addAttribute("hotel", new HotelBean());
		model.addAttribute("ltc", ltc);
		return INDEX;
	}

	/**
	 * Redirects user to booking form
	 * 
	 * @return bookMe
	 * 
	 * **/
	@RequestMapping(value = "/index2")
	public String proceed(Model model, @RequestParam("roomId") String roomId,
			@RequestParam("userId") String userId,
			@RequestParam("amount") String amount) {
		model.addAttribute("Booking", new BookingDetailsBean());
		session.setAttribute("roomId", roomId);
		session.setAttribute("amt", amount);
		model.addAttribute("amount", amount);
		return BOOK_ME;
	}

	/**
	 * Redirects user's other pages to user's index page
	 * 
	 * @return loginHome
	 * 
	 * **/
	@RequestMapping(value = "/index3")
	public String logsreturind(@ModelAttribute("user") UserBean user,
			Model model) {
		List<HotelBean> list = new ArrayList<HotelBean>();
		list = allDao.getHotelList();
		model.addAttribute("user", user);
		session.setAttribute("user", user.getUserId());
		model.addAttribute("listOfHotel", list);
		return LOGIN_HOME;
	}

	/**
	 * Redirects user's other pages to user's index page
	 * 
	 * @return loginHome
	 * 
	 * **/
	@RequestMapping(value = "/index5")
	public String returind1(@ModelAttribute("user") UserBean user, Model model) {
		List<HotelBean> list = new ArrayList<HotelBean>();
		list = allDao.getHotelList();
		session.getAttribute("user");
		model.addAttribute("listOfHotel", list);
		return LOGIN_HOME;
	}

	/**
	 * Redirects Enter page to index page
	 * 
	 * @return index
	 * 
	 * **/
	@RequestMapping(value = "/index4")
	public String logreturind(Model model,
			@RequestParam("returns") String returns) {
		// session.getAttribute("user");
		model.addAttribute("user", new UserBean());
		model.addAttribute("hotel", new HotelBean());
		model.addAttribute("returns", returns);
		return INDEX;
	}

	/**
	 * Redirects other pages to search form page
	 * 
	 * @return Search
	 * 
	 * **/

	@RequestMapping(value = "/SearchForm")
	public String searchForm(@ModelAttribute("hotel") HotelBean hotel,
			Model model) {

		return SEARCH;

	}

	/**
	 * Redirects search form page to search result
	 * 
	 * @return resultSearch
	 * 
	 * **/

	@RequestMapping(value = "/Search")
	public String search(@ModelAttribute("hotel") HotelBean hotel, Model model) {

		List<HotelBean> list = new ArrayList<HotelBean>();
		list = allDao.searchHotel(hotel.getRating(), hotel.getCity());

		if (list.isEmpty()) {
			model.addAttribute("user", new UserBean());
			model.addAttribute("hotel", new HotelBean());
			model.addAttribute("error", "No Hotels Found");
			return SEARCH;
		} else {
			model.addAttribute("listOfHotels", list);
			session.setAttribute("listOfHotels", list);
			return SEARCH_RESULT;
		}

	}

	/**
	 * Redirects user to more search details
	 * 
	 * @return moreDetails
	 * 
	 * **/

	@RequestMapping(value = "/moreDetails")
	public String moreDetails(@ModelAttribute("hotel") HotelBean hotel,
			Model model, @RequestParam("hotelId") String hotelId) {
		HotelBean hb = new HotelBean();
		hb = allDao.getHotelList(hotelId);
		List<RoomBean> listOfRoom = new ArrayList<RoomBean>();
		listOfRoom = allDao.getRoomDetails(hotelId);
		
		session.setAttribute("hotn", hb.getHotelName());
		model.addAttribute("hotel", hotel);
		model.addAttribute("hotelDetails", hb);
		model.addAttribute("listOfRooms", listOfRoom);
		return MORE_DETAILS;
	}

	/**
	 * Login for User as well as Admin based on their role
	 * 
	 * @return adminIndex/loginHome
	 * 
	 * **/

	@RequestMapping(value = "/Login")
	public String Login(@ModelAttribute("user") UserBean user, Model model) {

		String validate;

		model.addAttribute("user", user);

		try {

			validate = allDao
					.validateUser(user.getUserId(), user.getPassword());

		} catch (InvalidLoginDataException e) {
			model.addAttribute("error", e.getMessage());
			return ADMIN_SHOWERROR;

		} catch (IllegalStateException e) {
			model.addAttribute("error", "Wrong User");
			return INDEX;

		}

		catch (Exception e) {
			model.addAttribute("error", "Wrong User Id or password");
			return INDEX;

		}
		if (validate.equals("user")) {
			List<HotelBean> list = new ArrayList<HotelBean>();
			list = allDao.getHotelList();
			session.setAttribute("user", user.getUserId());
			session.setAttribute("listOfHotel", list);
			model.addAttribute("listOfHotel", list);
			return LOGIN_HOME;
		} else if (validate.equals("admin")) {
			session.setAttribute("admin", user.getUserId());
			return ADMIN_HOME;
		} else {
			model.addAttribute("error", "Data Access Exception");
			return ADMIN_SHOWERROR;
		}
	}

	/**
	 * Redirects other pages to register page
	 * 
	 * @return register
	 * 
	 * **/

	@RequestMapping(value = "/register")
	public String register(Model model) {

		model.addAttribute("user", new UserBean());
		return REGISTER;
	}

	@RequestMapping(value = "/regframe")
	public String registerFrame(Model model) {

		model.addAttribute("user", new UserBean());
		return SHOW_REG_FORM;
	}

	/**
	 * Inserts user after details have been entered
	 * 
	 * @return regframe/ShowError/userInsSuccess
	 * 
	 * **/

	@RequestMapping(value = "/insertUser")
	public String insertUser(@ModelAttribute("user") @Valid UserBean user,
			BindingResult result, Model model) {

		if (result.hasErrors()) {
			return SHOW_REG_FORM;
		}

		boolean userInserted = false;

		try {
			userInserted = allDao.insertUser(user);
		} catch (UserIdAlreadyExistsException e) {
			model.addAttribute("error", e.getMessage());
			return ADMIN_SHOWERROR;
		} catch (Exception e) {
			model.addAttribute("error", "One Or More Empty Fields Found");
			return ADMIN_SHOWERROR;
		}
		model.addAttribute("user", user);
		if (userInserted)
			return USER_INSERT_SUCCESS;
		else
			model.addAttribute("error", "Data Access Error");
		return ADMIN_SHOWERROR;

	}

	/**
	 * Log out for user/admin
	 * 
	 * @return index
	 * 
	 * **/

	@RequestMapping(value = "/logOut")
	public String logout(Model model,
			@RequestParam("loggedOut") String loggedOut) {

		model.addAttribute("user", new UserBean());
		model.addAttribute("hotel", new HotelBean());
		model.addAttribute("loggedOut", loggedOut);
		session.removeAttribute("user");
		return INDEX;
	}

	@RequestMapping(value = "/loggOut")
	public String loggout(Model model,
			@RequestParam("loggedOut") String loggedOut) {

		model.addAttribute("user", new UserBean());
		model.addAttribute("hotel", new HotelBean());
		model.addAttribute("loggedOut", loggedOut);
		session.invalidate();

		return INDEX;
	}

	/**
	 * User to book room after details have been entered
	 * 
	 * @return bill
	 * 
	 * **/

	@RequestMapping(value = "/book")
	public String book(@ModelAttribute("book") BookingDetailsBean book,
			Model model) {

		boolean booked;
		booked = allDao.insertBookingDetails(book);
		List<BookingDetailsBean> bid = allDao.getBookingId();
		for (BookingDetailsBean bookingId : bid) {
			session.setAttribute("bid", bookingId.getBookingId());
		}
		model.addAttribute("book", book);
		session.getAttribute("roomId");
		session.getAttribute("amt");
		session.getAttribute("hotn");
		if (booked)
			return BILL;
		else
			return ADMIN_SHOWERROR;

	}

	/**
	 * pages are redirected to add room form
	 * 
	 * @return adminAddRoom
	 * 
	 * **/

	@RequestMapping(value = "/linkAddRoom")
	public String linkAddRoom(Model model) {

		List<HotelBean> hotelList = allDao.getHotelList();

		model.addAttribute("hotelList", hotelList);
		return ADD_ROOM;
	}

	/**
	 * Inserts room after details have been entered
	 * 
	 * @return addRoomSuccess
	 * 
	 * **/

	@RequestMapping(value = "/addRoom")
	public String addRoom(@ModelAttribute("room") RoomBean room,
			@ModelAttribute("HotelBean") HotelBean hotel, Model model) {

		boolean result = allDao.addRoom(room);
		if (result) {
			return ADD_ROOM_SUCCESS;
		}

		return SHOW_ERROR;

	}

	/**
	 * redirects pages to admin home page
	 * 
	 * @return adminIndex
	 * 
	 * **/

	@RequestMapping(value = "/adminHome")
	public String admin(Model model) {

		return ADMIN_HOME;
	}

	/**
	 * redirects pages to admin insert hotel page
	 * 
	 * @return adminInsert
	 * 
	 * **/
	@RequestMapping(value = "/modifyHotel")
	public String modifyHotel(Model model) {

		return ADMIN_INSERT;
	}

	/**
	 * redirects pages to list of hotels page
	 * 
	 * @return CSReports
	 * 
	 * **/

	@RequestMapping(value = "/reports")
	public String reports(Model model) {

		List<HotelBean> list = new ArrayList<HotelBean>();
		list = allDao.getHotelList();
		session.getAttribute("admin");
		model.addAttribute("listOfHotel", list);
		session.setAttribute("listOfHotel", list);
		return ADMIN_REPORTS;
	}

	/**
	 * redirects pages to delete hotel page
	 * 
	 * @return adminRoomDelete
	 * 
	 * **/

	@RequestMapping(value = "/delPage")
	public String delPage(Model model) {
		
		model.addAttribute("room", new RoomBean());
		return DELETE_ROOM;
	}

	/**
	 * redirects pages to delete room page
	 * 
	 * @return RoomDeleted
	 * 
	 * **/
	@RequestMapping(value = "/delRoom")
	public String delRoom(@ModelAttribute("room") RoomBean room, Model model) {

		boolean result;
		try {

			result = allDao.deleteRoom(room.getRoomId());
		} catch (RoomNotFoundException e) {

			model.addAttribute("error", "Room Not Found");
			return ADMIN_SHOWERROR;
		} catch (RoomNotEmptyException e) {

			model.addAttribute("error", "Room Not Empty");
			return ADMIN_SHOWERROR;
		}
		if (result) {
			return ADMIN_SHOWERROR;
		} else {
			model.addAttribute("error", "Data Access Error");
			return ADMIN_SHOWERROR;
		}
	}

	/**
	 * redirects pages to room rate update page
	 * 
	 * @return RoomRateUpdate
	 * 
	 * **/

	@RequestMapping(value = "/rateUpdate")
	public String rateUpdate(Model model) {

		model.addAttribute("room", new RoomBean());
		return UPDATE_ROOM;
	}

	/**
	 * redirects pages to update room rate page
	 * 
	 * @return RoomRateUpdated
	 * 
	 * **/

	@RequestMapping(value = "/perNightRateUpdate")
	public String perNightRateUpdate(@ModelAttribute("room") RoomBean room,
			Model model) {

		boolean result;
		try {
			result = allDao.modifyRoomRate(room.getPerNightRate(),
					room.getRoomId());
		} catch (RoomNotFoundException e) {
			model.addAttribute("error", "Room Not Found");
			return ADMIN_SHOWERROR;
		}
		if (result) {
			return ROOM_UPDATED;
		} else {
			model.addAttribute("error", "Data Access Error");
			return ADMIN_SHOWERROR;
		}
	}

	/**
	 * redirects pages to bookings page
	 * 
	 * @return bookings
	 * 
	 * **/

	@RequestMapping(value = "/bookedDates")
	public String bookedDates(Model model) {

		model.addAttribute("booking", new BookingDetailsBean());
		return SHOW_BOOKINGS;
	}

	/**
	 * redirects pages to search result page
	 * 
	 * @return dateBook
	 * 
	 * **/
	@RequestMapping(value = "/showDateBookings")
	public String showDateBookings(
			@ModelAttribute("booking") BookingDetailsBean booking, Model model) {

		List<BookingDetailsBean> list = new ArrayList<BookingDetailsBean>();
		list = allDao.getBookingDetailsOn(booking.getBookedFromDate());

		if (list.isEmpty()) {
			model.addAttribute("error",
					"No Booking data found for the selected dates");
			return ADMIN_SHOWERROR;
		} else {
			model.addAttribute("listOfBookings", list);
			return SHOW_BOOKDATE;
		}
	}

	/**
	 * redirects pages to guest list page page
	 * 
	 * @return guest
	 * 
	 * **/

	@RequestMapping(value = "/guest")
	public String guest(Model model) {
		List<HotelBean> hotelList = allDao.getHotelList();

		model.addAttribute("hotelList", hotelList);
		model.addAttribute("hotel", new HotelBean());
		return SHOW_GUEST;
	}

	/**
	 * redirects pages to guest list page
	 * 
	 * @return guestList
	 * 
	 * **/
	@RequestMapping(value = "/showGuestList")
	public String showGuestList(@ModelAttribute("hotel") HotelBean hotel,
			Model model) {

		List<UserBean> list = new ArrayList<UserBean>();
		try {
			list = allDao.getGuestList(hotel.getHotelName());
		} catch (HotelNameNotFoundException e) {
			model.addAttribute("error", "Hotel Name Not Found");
			return ADMIN_SHOWERROR;
		} catch (Exception e) {
			model.addAttribute("error", "Enter Hotel Name To Continue");
			return ADMIN_SHOWERROR;
		}
		model.addAttribute("listOfUsers", list);
		return SHOW_GUESTLIST;
	}

	/**
	 * redirects pages to booked hotel names page
	 * 
	 * @return bookedHotels
	 * 
	 * **/

	@RequestMapping(value = "/bookedHotelNames")
	public String bookedHotelNames(Model model) {
		List<HotelBean> hotelList = allDao.getHotelList();

		model.addAttribute("hotelList", hotelList);
		model.addAttribute("hotel", new HotelBean());
		return SHOW_HOTELNAMES_BOOKED;
	}

	@RequestMapping(value = "showBookingDetailsByHotelName")
	public String showBookingDetailsByHotelName(
			@ModelAttribute("hotel") HotelBean hotel, Model model) {

		List<BookingDetailsBean> list = new ArrayList<BookingDetailsBean>();
		list = allDao.getBookingDetailsSpecific(hotel.getHotelName());

		if (hotel.getHotelName().equalsIgnoreCase("")) {
			model.addAttribute("error", "Enter the hotel name");
			return ADMIN_SHOWERROR;
		} else if (list.isEmpty()) {
			model.addAttribute("error",
					"No Booking data found for the entered hotel name");
			return ADMIN_SHOWERROR;
		} else {
			model.addAttribute("listOfBookings", list);
			return SHOW_HOTELS_BOOKED;
		}

	}

	@RequestMapping(value = "/home")
	public String home(Model model) {

	
		return ADMIN_HOME;
	}
	
	@RequestMapping(value = "/home1")
	public String home1(Model model,@RequestParam("suc") String suc) {

	 model.addAttribute("suc", suc);
		return ADMIN_HOME;
	}

	@RequestMapping(value = "/addHotel")
	public String addHotel(Model model) {

		// model.addAttribute("hotel", new HotelBean());
		return ADMIN_INSERT;
	}

	@RequestMapping(value = "/adminDelete")
	public String adminDelete(Model model) {
		List<HotelBean> hotelList = allDao.getHotelList();
		model.addAttribute("hotelList", hotelList);
		// model.addAttribute("hotel", new HotelBean());
		return ADMIN_DELETE;
	}

	@RequestMapping(value = "/adminRating")
	public String adminRating(Model model) {
		List<HotelBean> hotelList = allDao.getHotelList();
		model.addAttribute("hotelList", hotelList);
		// model.addAttribute("hotel", new HotelBean());
		return ADMIN_RATING;
	}

	@RequestMapping(value = "/adminUpdate")
	public String adminUpdate(Model model) {
		List<HotelBean> hotelList = allDao.getHotelList();
		model.addAttribute("hotelList", hotelList);
		// model.addAttribute("hotel", new HotelBean());
		return ADMIN_UPDATE;
	}

	@RequestMapping(value = "/insertHotel")
	public String insertHotel(@ModelAttribute("HotelBean") HotelBean hotel,
			Model model) {
		try {
			boolean result = allDao.addHotel(hotel);
			if (result) {
				return SHOW_SUCCES;
			} else {
				model.addAttribute("error", "Hotel Name Not Found");
				return ADMIN_SHOWERROR;

			}
		} catch (Exception e) {
			System.out.println(e);
			model.addAttribute("error", "Data Access Error");
			return ADMIN_SHOWERROR;
		}
	}

	@RequestMapping(value = "/delHotel")
	public String delHotel(@ModelAttribute("hotel") HotelBean hotel, Model model) {
		//return construction;

		
		  boolean result; System.out.println(hotel.getHotelName());
		  
		  try { result = allDao.deleteHotel(hotel.getHotelName()); } catch
		  (Exception e) {
		  
		  System.out.println(e); model.addAttribute("error",
		  "Data Access Error"); return ADMIN_SHOWERROR; }
		  
		  if (result) { return ADMIN_DELETED; }
		  
		  else { model.addAttribute("error", "Empty Field Found"); 
		  return ADMIN_SHOWERROR; }
		 
	}

	@RequestMapping(value = "/UpdateHotelRatings")
	public String UpdateHotelRatings(@ModelAttribute("hotel") HotelBean hotel,
			Model model) {

		boolean result;

		try {
			result = allDao.modifyHotelRating(hotel.getRating(),
					hotel.getHotelName());
		}/*
		 * catch (HotelNotFoundException e) { model.addAttribute("error",
		 * "Select hotel id"); return ADMIN_SHOWERROR; }
		 */catch (Exception e) {
			model.addAttribute("error", "Select Rating for the selected hotel");
			return ADMIN_SHOWERROR;
		}
		if (result) {
			return HOTEL_RATING_UPDATED;
		} else {
			model.addAttribute("error", "Fields Cannot be empty");
			return ADMIN_SHOWERROR;
		}
	}

	@RequestMapping(value = "/UpdateHotelDesc")
	public String UpdateHotelDesc(@ModelAttribute("hotel") HotelBean hotel,
			Model model) {

		boolean result;

		try {
			result = allDao.modifyHotelDesc(hotel.getHotelName(),
					hotel.getDesc());

		} catch (Exception e) {
			System.out.println(e);
			model.addAttribute("error",
					"Enter the description for the selected hotel");
			return ADMIN_SHOWERROR;
		}
		if (result) {
			return ADMIN_UPDATED;
		} else {
			model.addAttribute("error", "Fields Cannot be empty");
			return ADMIN_SHOWERROR;
		}
	}

	@RequestMapping(value = "contactUs")
	public String contactUs(Model model) {

		return CONTACT_US;
	}

	@RequestMapping(value = "homeindex")
	public String prepareHome(Model model) {

		return INDEX;
	}
}

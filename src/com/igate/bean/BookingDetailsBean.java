
/************************************************************************************
 * File:        BookingDetailsBean.java
 * Package:     com.igate.bean.BookingDetailsBean
 * Desc:        Bean Class for Booking details
 * Version:     1.0
 * Modifications: validation
 * Author:  Gaurab Ganguly,Ketan Hassija          Date: 14-01-2014         Change Description:n/a
 ************************************************************************************/


package com.igate.bean;

import javax.validation.constraints.Pattern;
import javax.validation.constraints.Size;

import org.hibernate.validator.constraints.NotEmpty;
public class BookingDetailsBean{


	private String bookingId;
	private String roomId;

	@NotEmpty(message="UserId cannot be empty")
	@Size(min=2,max=4,message="Minimum 2 and Maximum 4 characters required")
	private String userId;
	private String bookedFromDate;
	private String bookedToDate;	
	private int noOfAdults;
	private int noOfChildren;

	@Pattern( message="Only Numbers are allowed", regexp="^[0-9]{3,}$")
	private double amount;

	public BookingDetailsBean() {
		super();
	}
	public BookingDetailsBean(String bookingId, String roomId, String userId,
			String bookedToDate, String bookedFromDate, int noOfAdults,
			int noOfChildren, double amount) {
		super();
		this.bookingId = bookingId;
		this.roomId = roomId;
		this.userId = userId;
		this.bookedToDate = bookedToDate;
		this.bookedFromDate = bookedFromDate;
		this.noOfAdults = noOfAdults;
		this.noOfChildren = noOfChildren;
		this.amount = amount;
	}
	public String getBookingId() {
		return bookingId;
	}
	public void setBookingId(String bookingId) {
		this.bookingId = bookingId;
	}
	public String getRoomId() {
		return roomId;
	}
	public void setRoomId(String roomId) {
		this.roomId = roomId;
	}
	public String getUserId() {
		return userId;
	}
	public void setUserId(String userId) {
		this.userId = userId;
	}
	public String getBookedToDate() {
		return bookedToDate;
	}
	public void setBookedToDate(String bookedToDate) {
		this.bookedToDate = bookedToDate;
	}
	public String getBookedFromDate() {
		return bookedFromDate;
	}
	public void setBookedFromDate(String bookedFromDate) {
		this.bookedFromDate = bookedFromDate;
	}
	public int getNoOfAdults() {
		return noOfAdults;
	}
	public void setNoOfAdults(int noOfAdults) {
		this.noOfAdults = noOfAdults;
	}
	public int getNoOfChildren() {
		return noOfChildren;
	}
	public void setNoOfChildren(int noOfChildren) {
		this.noOfChildren = noOfChildren;
	}
	public double getAmount() {
		return amount;
	}
	public void setAmount(double amount) {
		this.amount = amount;
	}
	@Override
	public String toString() {
		return "BookingDetails [bookingId=" + bookingId + ", roomId=" + roomId
				+ ", userId=" + userId + ", bookedToDate=" + bookedToDate
				+ ", bookedFromDate=" + bookedFromDate + ", noOfAdults="
				+ noOfAdults + ", noOfChildren=" + noOfChildren + ", amount="
				+ amount + "]";
	}



}

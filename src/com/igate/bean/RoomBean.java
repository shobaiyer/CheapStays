/************************************************************************************
 * File:        RoomBean.java
 * Package:     com.igate.bean.RoomBean
 * Desc:        Bean Class for Room details
 * Version:     1.0
 * Modifications: validation
 * Author:  Gaurab Ganguly,Ketan Hassija              Date: 14-01-2014         Change Description:n/a
 ************************************************************************************/

package com.igate.bean;

import javax.validation.constraints.Pattern;

import org.hibernate.validator.constraints.NotEmpty;

public class RoomBean {

	private String hotelId;
	private String roomId;

	@NotEmpty(message = "Hotel Name is mandatory")
	private String hotelName;

	/* private int flag=0; */
	public String getHotelName() {
		return hotelName;
	}

	public void setHotelName(String hotelName) {
		this.hotelName = hotelName;
	}

	/*
	 * public int getFlag() { return flag; } public void setFlag(int flag) {
	 * this.flag = flag; }
	 */

	@NotEmpty(message = "Room No. is mandatory")
	@Pattern(message = "Only Numbers are allowed in Room Number", regexp = "[0-9]{3,}")
	private String roomNo;

	@NotEmpty(message = "Hotel Name is mandatory")
	private String roomType;

	@NotEmpty(message = "Rate Per Night is mandatory")
	@Pattern(message = "Only Numbers are allowed in Rate Per Night", regexp = "[1-9][0-9]{3,}")
	private int perNightRate;

	@NotEmpty(message = "select availability")
	private String available;

	@Override
	public String toString() {
		return "Room [hotelId=" + hotelId + ", roomId=" + roomId + ", roomNo="
				+ roomNo + ", roomType=" + roomType + ", perNightRate="
				+ perNightRate + ", available=" + available + "]";
	}

	public String getHotelId() {
		return hotelId;
	}

	public void setHotelId(String hotelId) {
		this.hotelId = hotelId;
	}

	public String getRoomId() {
		return roomId;
	}

	public void setRoomId(String roomId) {
		this.roomId = roomId;
	}

	public String getRoomNo() {
		return roomNo;
	}

	public void setRoomNo(String roomNo) {
		this.roomNo = roomNo;
	}

	public String getRoomType() {
		return roomType;
	}

	public void setRoomType(String roomType) {
		this.roomType = roomType;
	}

	public int getPerNightRate() {
		return perNightRate;
	}

	public void setPerNightRate(int perNightRate) {
		this.perNightRate = perNightRate;
	}

	public String getAvailable() {
		return available;
	}

	public void setAvailable(String available) {
		this.available = available;
	}

	public RoomBean(String hotelId, String roomId, String roomNo,
			String roomType, int perNightRate, String available) {
		super();
		this.hotelId = hotelId;
		this.roomId = roomId;
		this.roomNo = roomNo;
		this.roomType = roomType;
		this.perNightRate = perNightRate;
		this.available = available;
	}

	public RoomBean() {
		super();
	}

}

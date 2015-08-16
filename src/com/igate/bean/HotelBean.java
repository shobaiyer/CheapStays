/************************************************************************************
 * File:        HotelBean.java
 * Package:     com.igate.bean.HotelBean
 * Desc:        Bean Class for Hotel details
 * Version:     1.0
 * Modifications: validation
 * Author:  Gaurab Ganguly,Ketan Hassija              Date: 14-01-2014         Change Description:n/a
 ************************************************************************************/

package com.igate.bean;

import javax.validation.constraints.Pattern;
import javax.validation.constraints.Size;

import org.hibernate.validator.constraints.Email;
import org.hibernate.validator.constraints.NotEmpty;

import com.sun.istack.internal.NotNull;

public class HotelBean {

	private String hotelId;

	@NotEmpty(message = "City is mandatory")
	@NotNull()
	private String city;

	@NotEmpty(message = "Hotel Name is mandatory")
	@Size(min = 4, message = "Minimum 4 characters required")
	private String hotelName;

	@NotEmpty(message = "Hotel Address is mandatory")
	@Size(min = 10, message = "Minimum 10 characters required")
	private String address;

	@NotEmpty(message = "Hotel Description is mandatory")
	@Size(min = 10, message = "Minimum 10 characters required")
	private String desc;

	@NotEmpty(message = "Rate Per Night is mandatory")
	@Pattern(message = "Only Numbers are allowed in average Rate Per Night", regexp = "[1-9][0-9]{3,}")
	private int avgRatePerNight;

	@NotEmpty(message = "Phone Number1 is mandatory")
	@Pattern(message = "Only Numbers are allowed in phoneNumber1", regexp = "^[0-9]{10}$")
	private String phoneNumber1;

	@NotEmpty(message = "Phone Number2 is mandatory")
	@Pattern(message = "Only Numbers upto 10 digits are allowed in phoneNumber2", regexp = "^[0-9]{10}$")
	private String phoneNumber2;

	@NotEmpty(message = "Rating is mandatory")
	@NotNull()
	private String rating;

	@NotEmpty(message = "Hotel Email Id is mandatory")
	@Email(message = "Please enter valid Email ID")
	private String email;

	@Pattern(message = "Only Numbers upto 10 digits are allowed", regexp = "^[0-9]{8}$")
	private String fax;

	public String getHotelId() {
		return hotelId;
	}

	public void setHotelId(String hotelId) {
		this.hotelId = hotelId;
	}

	public String getCity() {
		return city;
	}

	public void setCity(String city) {
		this.city = city;
	}

	public String getHotelName() {
		return hotelName;
	}

	public void setHotelName(String hotelName) {
		this.hotelName = hotelName;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public String getDesc() {
		return desc;
	}

	public void setDesc(String desc) {
		this.desc = desc;
	}

	public int getAvgRatePerNight() {
		return avgRatePerNight;
	}

	public void setAvgRatePerNight(int avgRatePerNight) {
		this.avgRatePerNight = avgRatePerNight;
	}

	public String getPhoneNumber1() {
		return phoneNumber1;
	}

	public void setPhoneNumber1(String phoneNumber1) {
		this.phoneNumber1 = phoneNumber1;
	}

	public String getPhoneNumber2() {
		return phoneNumber2;
	}

	public void setPhoneNumber2(String phoneNumber2) {
		this.phoneNumber2 = phoneNumber2;
	}

	public String getRating() {
		return rating;
	}

	public void setRating(String rating) {
		this.rating = rating;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getFax() {
		return fax;
	}

	public void setFax(String fax) {
		this.fax = fax;
	}

	@Override
	public String toString() {
		return "Hotel [address=" + address + ", avg_rate_per_night="
				+ avgRatePerNight + ", city=" + city + ", desc=" + desc
				+ ", email=" + email + ", fax=" + fax + ", hotelId=" + hotelId
				+ ", hotelName=" + hotelName + ", phoneNumber1=" + phoneNumber1
				+ ", phoneNumber2=" + phoneNumber2 + ", rating=" + rating + "]";
	}

	public HotelBean(String hotelId, String city, String hotelName,
			String address, String desc, int avgRatePerNight,
			String phoneNumber1, String phoneNumber2, String rating,
			String email, String fax) {
		super();
		this.hotelId = hotelId;
		this.city = city;
		this.hotelName = hotelName;
		this.address = address;
		this.desc = desc;
		this.avgRatePerNight = avgRatePerNight;
		this.phoneNumber1 = phoneNumber1;
		this.phoneNumber2 = phoneNumber2;
		this.rating = rating;
		this.email = email;
		this.fax = fax;
	}

	public HotelBean(String city, String rating) {
		super();
		this.city = city;
		this.rating = rating;
	}

	public HotelBean() {
		super();
	}

}

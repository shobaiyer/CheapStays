/************************************************************************************
 * File:        UserBean.java
 * Package:     com.igate.bean.UserBean
 * Desc:        Bean Class for Booking details
 * Version:     1.0
 * Modifications: validation
 * Author:  Gaurab Ganguly,Ketan Hassija              Date: 14-01-2014         Change Description:n/a
 ************************************************************************************/

package com.igate.bean;

import javax.validation.constraints.Pattern;
import javax.validation.constraints.Size;

import org.hibernate.validator.constraints.NotEmpty;

public class UserBean {

	private String userName;

	private String role;
	@NotEmpty(message = "Email Id is mandatory")
	@org.hibernate.validator.constraints.Email(message = "Please enter valid Email ID")
	private String email;

	@NotEmpty(message = "UserId cannot be empty")
	@Size(min = 2, max = 4, message = "Minimum 2 and Maximum 4 characters required")
	private String userId;

	@NotEmpty(message = "Password is mandatory")
	private String password;

	@NotEmpty(message = "Address is mandatory")
	private String address;

	@NotEmpty(message = "Mobile Number is mandatory")
	@Pattern(message = "Only Numbers are allowed in mobile Number", regexp = "^[0-9]{10}$")
	private String mobile;

	// @Pattern(
	// message="Only Numbers upto 8digits are allowed in mobile Number",
	// regexp="^[0-9]{8}$")
	private String phone;

	// constructor
	public UserBean(String userName, String role, String email, String userId,
			String password, String address, String mobile, String phone) {
		super();
		this.userName = userName;
		this.role = role;
		this.email = email;
		this.userId = userId;
		this.password = password;
		this.address = address;
		this.mobile = mobile;
		this.phone = phone;
	}

	public UserBean() {
		// TODO Auto-generated constructor stub
	}

	@Override
	public String toString() {
		return "UserBean [userName=" + userName + ", role=" + role + ", email="
				+ email + ", userId=" + userId + ", password=" + password
				+ ", address=" + address + ", mobile=" + mobile + ", phone="
				+ phone + "]";
	}

	@NotEmpty(message = "User Name cannot be empty")
	@Size(min = 4, message = "Minimum 4 characters required")
	public String getUserName() {
		return userName;
	}

	public void setUserName(String userName) {
		this.userName = userName;
	}

	public String getRole() {
		return role;
	}

	public void setRole(String role) {
		this.role = role;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getUserId() {
		return userId;
	}

	public void setUserId(String userId) {
		this.userId = userId;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public String getMobile() {
		return mobile;
	}

	public void setMobile(String mobile) {
		this.mobile = mobile;
	}

	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

}

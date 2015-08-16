/************************************************************************************
 * File:        HotelNameNotFoundException.java
 * Package:     com.igate.exception
 * Desc:        User defined exception if hotel not found
 * Version:     5.0
 * Author:  Ketan Hassija,Gaurab Ganguly          Date: 10-01-2014         Change Description:n/a
  ************************************************************************************/

package com.igate.exception;

public class HotelNameNotFoundException extends Exception{
	
	public HotelNameNotFoundException(String message) {
		super(message);
	}

}

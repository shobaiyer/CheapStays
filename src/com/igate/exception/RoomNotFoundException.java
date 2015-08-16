/************************************************************************************
 * File:        RoomNotFoundException.java
 * Package:     com.igate.exception
 * Desc:        User defined exception if Room not found
 * Version:     5.0
 * Author:  Ketan Hassija,Gaurab Ganguly          Date: 10-01-2014         Change Description:n/a
  ************************************************************************************/

package com.igate.exception;

public class RoomNotFoundException extends Exception {

	public RoomNotFoundException(String message) {
		super(message);
	}
}

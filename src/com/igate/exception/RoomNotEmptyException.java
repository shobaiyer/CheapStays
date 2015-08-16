/************************************************************************************
 * File:        RoomNotEmptyException.java
 * Package:     com.igate.exception
 * Desc:        User defined exception if Room is not empty
 * Version:     5.0
 * Author:  Ketan Hassija,Gaurab Ganguly          Date: 10-01-2014         Change Description:n/a
  ************************************************************************************/

package com.igate.exception;

public class RoomNotEmptyException extends Exception{
	
	 public RoomNotEmptyException(String message) {
		 super(message);
	}

}

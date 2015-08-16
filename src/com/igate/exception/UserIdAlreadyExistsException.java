/************************************************************************************
 * File:        UserAlreadyExistsException.java
 * Package:     com.igate.exception
 * Desc:        User defined exception if user exists already
 * Version:     5.0
 * Author:  Ketan Hassija,Gaurab Ganguly          Date: 10-01-2014         Change Description:n/a
  ************************************************************************************/

package com.igate.exception;

@SuppressWarnings("serial")
public class UserIdAlreadyExistsException extends Exception {

	public UserIdAlreadyExistsException() {
		super();
		
	}

	public UserIdAlreadyExistsException(String message) {
		super(message);
		
	}

	
	
}

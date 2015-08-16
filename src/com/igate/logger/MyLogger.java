/************************************************************************************
 * File:       Mylogger.java
 * Package:     com.igate.logger
 * Desc:        log4j for modules
 * Version:     5.0
 * Author:  Ketan Hassija          Date: 10-01-2014         Change Description:n/a
  ************************************************************************************/

package com.igate.logger;

import org.apache.log4j.FileAppender;
import org.apache.log4j.HTMLLayout;
import org.apache.log4j.Layout;
import org.apache.log4j.Logger;

public class MyLogger {
public static Logger myLog()
{
	Logger logger= Logger.getLogger("mylogger");
	Layout myLayout=new HTMLLayout();
	FileAppender myAppender;
	
	try {
		myAppender=new FileAppender(myLayout,"CSLog.html");
		logger.addAppender(myAppender);
	} catch (Exception e) {
		// TODO Auto-generated catch block
		e.printStackTrace();
	}
	return logger;
}
}
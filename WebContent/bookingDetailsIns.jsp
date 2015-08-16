<jsp:useBean id="eobj" class="com.igate.bean.BookingDetailsBean" scope="request">
<jsp:setProperty name="eobj" property="roomId"/>
<jsp:setProperty name="eobj" property="userId"/>
<jsp:setProperty name="eobj" property="bookedToDate"/>
<jsp:setProperty name="eobj" property="bookedFromDate"/>
<jsp:setProperty name="eobj" property="noOfAdults"/>
<jsp:setProperty name="eobj" property="noOfChildren"/>
<jsp:setProperty name="eobj" property="amount"/>
</jsp:useBean>

<jsp:forward page="CSUserController?action=insBooking"></jsp:forward>
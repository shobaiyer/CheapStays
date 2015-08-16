<jsp:useBean id="eobj" class="com.igate.bean.UserBean" scope="request">
<jsp:setProperty name="eobj" property="*"/>
</jsp:useBean>

<jsp:forward page="CSUserController?action=insUser"></jsp:forward>
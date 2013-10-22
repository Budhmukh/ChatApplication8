<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
<script language="javascript">
<%
if(session.isNew()!=true)
{
	session.invalidate();
%>

window.alert("YOU HAVE SUCCESSFULLY LOGGED OUT");
window.location="customerlogin.jsp";
<%
}
%>
</script>

</head>
<body>

</body>
</html>
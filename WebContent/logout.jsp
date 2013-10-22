<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ page import="java.util.ArrayList" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
<script language="javascript">
<%
ServletContext sc=this.getServletContext();
ArrayList<String> adminlist = (ArrayList<String>)sc.getAttribute("adminlist");
System.out.println(adminlist);
String username=(String)request.getParameter("username");
adminlist.remove(username);
System.out.println(adminlist);
if(session.isNew()!=true)
{
	session.invalidate();
%>

window.alert("YOU HAVE SUCCESSFULLY LOGGED OUT");
window.location="adminlogin.jsp";
<%
}
%>
</script>

</head>
<body>

</body>
</html>
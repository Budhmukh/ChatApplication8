<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
  <%@ page import="java.util.ArrayList" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<script src="jquery-1.9.1.min.js"></script> 
<link rel="stylesheet" type="text/css" href="chat1.css">
<title>Insert title here</title>
</head>
<body>
<%
String username=request.getParameter("userid");
%>
Welcome Customer <%=username %>
<%
ServletContext sc=this.getServletContext();
ArrayList<String> adminlist = (ArrayList<String>)sc.getAttribute("adminlist");


if(adminlist.isEmpty()){%>
	Customer Representative not available!!
	<script>
	document.getElementById("chat").disabled=true;
	</script>
	
<% }
else{%>
Admin User Available
<% 
for(int i=0;i<adminlist.size();i++){%>
<input type="Submit" id="chat" class="chat" name="chat" value=<%=adminlist.get(i)%>  />
	
	
<% }
} 


%>
<br />
<div>
<a href="clogout.jsp">Logout</a>
</div>
 <div id="chatwindow">
 <textarea id="textarea" style="display:none"></textarea>
 <br />
    <input id="inputmessage" type="text" style="display:none"/>
  </div>
  <div>
    <input type="submit" value="Broadcast message" onclick="send()" style="display:none" id="submit"  />
  </div>
  <div id="messages"></div>
  <script type="text/javascript">
  $(document).ready(function(){
	  $(".chat").click(function(){
	    $("#textarea").toggle();
	    $("#inputmessage").toggle();
	    $("#submit").toggle();
	  });
	});
    var webSocket = 
      new WebSocket('ws://localhost:8080/ChatApplication8/websocket');

    webSocket.onerror = function(event) {
      onError(event)
    };

    webSocket.onopen = function(event) {
      onOpen(event)
    };

    webSocket.onmessage = function(event) {
      onMessage(event)
    };

    function onMessage(event) {
    	var div = document.getElementById('textarea');

    	div.innerHTML = div.innerHTML +"\n"+ event.data;
       
    }

    function onOpen(event) {
      //document.getElementById('messages').innerHTML 
        //= 'Connection established';
    }

    function onError(event) {
      alert(event.data);
    }

    function send() {
      var txt = document.getElementById('inputmessage').value;
      webSocket.send("Customer :" +" "+txt);
      document.getElementById('inputmessage').value='';
      return false;
    }
  

  </script>
</body>
</html>
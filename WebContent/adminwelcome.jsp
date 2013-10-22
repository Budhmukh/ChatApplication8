<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<link rel="stylesheet" type="text/css" href="chat1.css">
<title>Insert title here</title>
<script type="text/javascript">
    var webSocket = 
      new WebSocket('ws://10.102.54.136:8080/ChatApplication8/websocket');

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
      document.getElementById('messages').innerHTML 
        = 'Connection established';
    }

    function onError(event) {
      alert(event.data);
    }

    function send() {
      var txt = document.getElementById('inputmessage').value;
      webSocket.send("Admin :"+" "+txt);
      document.getElementById('inputmessage').value='';
      return false;
    }
  </script>
</head>
<body>
<%
String username=(String)session.getAttribute("user");
%>
Welcome Admin <%=username %>
<div>
<a href="logout.jsp?username=${user}">Logout</a>
</div>
  <div id="chatwindow">
 <textarea id="textarea"></textarea>
 <br />
    <input id="inputmessage" type="text" />
  </div>
  <div>
    <input type="submit" value="Broadcast message" onclick="send()" />
  </div>
  <div id="messages"></div>
  
</body>
</html>
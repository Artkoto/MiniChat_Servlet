<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Chat</title>
</head>
<body>
<pre>
    <%=request.getAttribute("content") %>
</pre>
<%--Formulaire--%>
<form name="chatForm" action="chat" method="post">
    <input type="text" name="ligne" value="" />
    <input type="submit" name="action" value="submit" />
    <input type="submit" name="action" value="refresh" />
    <button type="submit" name="action" value="logout">LogOut</button>
</form>


</body>
</html>

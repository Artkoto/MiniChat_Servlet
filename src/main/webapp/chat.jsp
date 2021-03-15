<%--
  Created by IntelliJ IDEA.
  User: artkoto
  Date: 08/03/2021
  Time: 18:28
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Chat</title>
</head>
<body>
<pre>
    <%= request.getAttribute("content")  %>
</pre>
<%--Formulaire--%>
<form name="chatForm" action="chat" method="post">
    <input type="text" name="ligne" value="" />
    <input type="submit" name="action" value="submit" />
    <input type="submit" name="action" value="refresh" />
    </form>

</body>
</html>
</body>
</html>

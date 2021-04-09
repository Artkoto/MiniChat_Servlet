
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>yaomiardchat:logIn</title>
    <script src="https://kit.fontawesome.com/9eb878c8fb.js" crossorigin="anonymous"></script>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-eOJMYsd53ii+scO/bJGFsiCZc+5NDVN2yr8+0RDqr0Ql0h+rP48ckxlpbzKgwra6" crossorigin="anonymous">
</head>
    <body>
        <div class="text-center">
            <h4>Connectrez vous pour participer au chat</h4>
            <form  name="authForm" action="chat#form" method="post">
                <label>
                    <input type="text" class="form-control" name="user" value="" required placeholder="Nom d'utilisateur" />
                </label>
                <input type="submit" class="btn btn-primary" name="action" value="login" />
            </form>
        </div>
    </body>
</html>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
    <head>
        <title>yaomiardchat</title>
        <script src="https://kit.fontawesome.com/9eb878c8fb.js" crossorigin="anonymous"></script>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-eOJMYsd53ii+scO/bJGFsiCZc+5NDVN2yr8+0RDqr0Ql0h+rP48ckxlpbzKgwra6" crossorigin="anonymous">
        <link rel="preconnect" href="https://fonts.gstatic.com">
        <link href="https://fonts.googleapis.com/css2?family=Gorditas&family=Lobster&family=Londrina+Solid:wght@300;400;900&family=Merriweather+Sans:ital,wght@0,300;1,300&display=swap" rel="stylesheet">
    </head>
    <body>
            <div class="d-flex justify-content-center">
                    <div class="container">

                        <%
                            String contenu = request.getAttribute("content").toString();
                            String [] lignes = contenu.split("\n");
                            for (String ligne : lignes) {
                                if (ligne.contains("Soyez polis!") && !ligne.contains(":")){
                        %>
                              <h4><%= ligne%> </h4>
                        <%
                                }
                                else if (ligne.contains(" le chat")  &&  !ligne.contains(" : ")){
                        %>          <div style="font-family: 'Merriweather Sans', sans-serif; font-size: x-small; color: dimgray">
                                        <%= ligne%>
                                     </div>

                        <%        }
                                else if (ligne.split("\t").length >=3){
                            String [] details = ligne.split("\t");
                            String date = details[0];
                           String user = details[1];
                            String message = details[2];
                        %>
                        <div class="d-flex flex-column" style="width: 300px ; margin-bottom: 15px;  margin-top: 15px">
                            <div class="d-flex flex-row ">
                                <div>
                                    <i class="fas fa-user-alt" style="font-size: 2rem; color:
                                chocolate;"></i>
                                </div>
                                <div class="d-flex flex-row">
                                    <div class="align-self-center" style="font-family: 'Merriweather Sans',
                                    sans-serif; font-weight: bold; text-transform:
                                    uppercase ; font-size: medium; color: red ">
                                        <%=user%>
                                    </div>
                                    <div class="align-self-end" style="font-family: 'Merriweather Sans', sans-serif;
                                    font-size: x-small; color: gray" >
                                        <%= date%>
                                    </div>
                                </div>
                            </div>
                            <div style="font-family: 'Merriweather Sans', sans-serif; font-size: medium; color: midnightblue">
                                <%=message%>
                            </div>
                        </div>

                        <%        }

                            }
                        %>

                            <form style="margin-top: 15px" id="form" name="chatForm" action="chat#form" method="post">
                                <label>
                                    <input type="text" class="form-control" name="ligne" value=""
                                           placeholder="Ecrivez votre message ici. "/>
                                </label>
                                <button type="submit" class="btn btn-success" name="action" value="submit" ><i
                                        class="fas fa-paper-plane"></i></button>
                                <button type="submit"  class="btn btn-secondary" name="action" value="refresh"><i class="fas fa-redo"></i></button>
                                <button type="submit" class="btn btn-danger" name="action" value="logout">logOut <i class="fas fa-sign-out-alt"></i></button>
                            </form>
                    </div>

            </div>
    </body>
</html>

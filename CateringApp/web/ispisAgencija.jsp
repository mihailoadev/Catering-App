<%-- 
    Document   : ispisAgencija
    Created on : May 26, 2024, 12:01:37 PM
    Author     : Miki
--%>

<%@page import="bean.Agencija"%>
<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="utf-8">
        <meta http-equiv="x-ua-compatible" content="ie=edge">
        <title>Savršeni Zalogaji - Vaš Partner za Ketering</title>
        <meta name="description" content="">
        <meta name="viewport" content="width=device-width, initial-scale=1">

        <link rel="shortcut icon" type="image/x-icon" href="img/logo.png">
        
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.2/css/all.min.css" crossorigin="anonymous" referrerpolicy="no-referrer" />

        <link rel="stylesheet" href="css/bootstrap.min.css">        
        <link rel="stylesheet" href="css/style.css">
    </head>
    <body>
        <%
            HttpSession sesija = request.getSession();
            ArrayList<Agencija> listaAgencija = (ArrayList<Agencija>) sesija.getAttribute("lista");
            String greska = (String) request.getAttribute("greska");
        %>

        <jsp:include page="header.jsp" ></jsp:include>


            <div class="breadcam_area breadcam_bg_1">
                <div class="breadcam_inner">
                    <div class="breadcam_text">
                        <h3>Agencije</h3>
                    </div>
                </div>
            </div>


        <%   if (greska != null) {%>
        <div class="alert alert-warning" role="alert">
            <%= greska%>
        </div>
        <%} %>

        <section class="sample-text-area">
            <div class="container box_1170">
                <div class="row">
                    <%
                        if (!listaAgencija.isEmpty()) {%> <div class="col-md-12"> <br>
                        <table class="table table-striped" style="border: 1px white">
                            <thead style="background-color: #313352; color:white;">
                                <tr>
                                    <th scope="col">ID Agencije</th>                       
                                    <th scope="col">Naziv agencije</th>
                                    <th scope="col">Opis agencije</th> 
                                    <th scope="col"></th>
                                    <th>                                         
                                        <form action="dodajUsluguForma.jsp" method="post">
                                            <button type="submit" class="genric-btn success circle"><i class="fa-solid fa-plus"></i> Dodaj uslugu</button>                                          
                                        </form>                                 
                                    </th>
                                </tr>
                            </thead>
                            <tbody>
                                <%

                                    for (Agencija a : listaAgencija) {
                                        String rola = "Korisnik";
                                %>
                                <tr>
                                    <td><%= a.getIdAgencije()%></td>
                                    <td><%= a.getNaziv()%></td>
                                    <td><%= a.getOpis()%></td>                                    
                                    <td>
                                        <form action="PregledUsluga" method="post">
                                            <button type="submit" class="btn btn-info" ><i class="fa-solid fa-eye"></i> Pregledaj usluge</button>
                                            <input type="hidden" value="<%= a.getIdAgencije()%>" name="idAgencije" />
                                        </form>
                                    </td>
                                    <td>
                                        <form action="IzmenaAgencijaForma" method="post">
                                            <button type="submit" class="btn btn-info" ><i class="fa-solid fa-pen-to-square"></i> Izmeni agenciju</button>
                                            <input type="hidden" value="<%= a.getIdAgencije()%>" name="idAgencije" />
                                        </form>
                                    </td>
                                </tr>
                                <% }%>
                            </tbody>
                        </table>
                    </div>
                    <% }%>
                </div>
            </div>
        </section>
        
        <jsp:include page="footer.jsp" ></jsp:include>
        
        <script src="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.2/js/all.min.js" crossorigin="anonymous" referrerpolicy="no-referrer"></script> 
        <script src="js/vendor/jquery-1.12.4.min.js"></script>        
        <script src="js/bootstrap.min.js"></script>        
        <script src="js/main.js"></script>

    </body>

</html>

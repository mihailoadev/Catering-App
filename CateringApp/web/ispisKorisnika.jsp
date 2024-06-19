<%-- 
    Document   : ispisKorisnika
    Created on : May 26, 2024, 12:02:33 PM
    Author     : Miki
--%>

<%@page import="java.util.ArrayList"%>
<%@page import="bean.Korisnik"%>
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
            ArrayList<Korisnik> listaKorisnika = (ArrayList<Korisnik>) sesija.getAttribute("lista");
            String greska = (String) request.getAttribute("greska");
            if (greska != null) {%>
        <br>
        <div class="alert alert-warning" role="alert">
            <%= greska%>
        </div>
        <%} %>


        <jsp:include page="header.jsp" ></jsp:include>

            <div class="breadcam_area breadcam_bg_1">
                <div class="breadcam_inner">
                    <div class="breadcam_text">
                        <h3>Korisnici</h3>
                    </div>
                </div>
            </div>

            <section class="sample-text-area">
                <div class="container box_1170">
                    <div class="row">
                    <%  if (!listaKorisnika.isEmpty()) {%> <div class="col-md-12"> <br>
                        <table class="table table-striped" style="border: 1px solid white">
                            <thead style="background-color: #313352; color:white;">
                                <tr>
                                    <th scope="col">ID korisnika</th>
                                    <th scope="col">Ime</th>
                                    <th scope="col">Prezime</th>
                                    <th scope="col">Korisnicko ime</th>
                                    <th scope="col">Email</th>
                                    <th scope="col">Adresa</th>
                                    <th scope="col">Grad</th>
                                    <th scope="col">Poeni</th>
                                    <th scope="col">Akcija</th>
                                </tr>
                            </thead>
                            <tbody>
                                <% for (Korisnik k : listaKorisnika) {%>
                                <tr>
                                    <td><%= k.getIdKorisnik()%></td>
                                    <td><%= k.getIme()%></td>
                                    <td><%= k.getPrezime()%></td>
                                    <td><%= k.getKorisnickoIme()%></td>
                                    <td><%= k.getEmail()%></td>
                                    <td><%= k.getAdresa()%></td>
                                    <td><%= k.getGrad()%></td>
                                    <td><%= k.getPoeni()%></td>
                                    <td>
                                        <form action="BrisanjeKorisnika" method="post">
                                            <button type="submit" class="genric-btn danger circle"><i class="fa-solid fa-trash-can"></i> Obriši</button>
                                            <input type="hidden" value="<%= k.getIdKorisnik()%>" name="idKorisnika" />
                                        </form>
                                    </td>
                                </tr>
                                <% } %>
                            </tbody>
                        </table>

                    </div>
                    <%
                        }
                    %>
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

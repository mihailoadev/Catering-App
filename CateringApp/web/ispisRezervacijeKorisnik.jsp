<%-- 
    Document   : ispisRezervacijeKorisnik
    Created on : May 26, 2024, 12:05:08 PM
    Author     : Miki
--%>

<%@page import="bean.Rezervacija"%>
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
            ArrayList<Rezervacija> listaRezervacija = (ArrayList<Rezervacija>) sesija.getAttribute("lista");
            String greska = (String) request.getAttribute("greska");

        %>

        <jsp:include page="header.jsp" ></jsp:include>


            <div class="breadcam_area breadcam_bg_1 zigzag_bg_2">
                <div class="breadcam_inner">
                    <div class="breadcam_text">
                        <h3>Vaše porudžbine</h3>
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
                        if (!listaRezervacija.isEmpty()) {%> <div class="col-md-12"> <br>
                        <table class="table table-striped" style="border: 1px white">
                            <thead>
                                <tr>
                                    <th scope="col">ID korisnika</th>                       
                                    <th scope="col">ID Usluge</th>
                                    <th scope="col">ID Rezervacije</th>
                                    <th scope="col">Korisnicko ime porucioca</th>
                                    <th scope="col">Naziv odabrane usluge</th>
                                    <th scope="col">Datum</th>
                                    <th scope="col">Cena</th>
                                    <th></th>
                                </tr>
                            </thead>
                            <tbody>
                                <%
                                    for (Rezervacija k : listaRezervacija) {
                                        String rola = "Korisnik";
                                %>
                                <tr>
                                    <td><%= k.getIdKorisnik()%></td>
                                    <td><%= k.getIdUsluge()%></td>
                                    <td><%= k.getIdRezervacije()%></td>
                                    <td><%= k.getKorisnickoIme()%></td>
                                    <td><%= k.getNaziv()%></td>
                                    <td><%= k.getDatum()%></td>
                                    <td><%= k.getCena()%></td>
                                    <td>
                                        <form action="BrisanjeRezervacijaKorisnik" method="post">
                                            <button type="submit" class="btn btn-danger"><i class="fa-regular fa-trash-can"></i> Obriši</button>
                                            <input type="hidden" value="<%= k.getIdRezervacije()%>" name="idRezervacije" />
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

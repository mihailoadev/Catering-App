<%-- 
    Document   : ispisUsluga
    Created on : May 26, 2024, 12:06:33 PM
    Author     : Miki
--%>

<%@page import="bean.Usluga"%>
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
            ArrayList<Usluga> listaUsluga = (ArrayList<Usluga>) sesija.getAttribute("usluga");
             
            String greska = (String) request.getAttribute("greska");

        %>

       
        <jsp:include page="header.jsp" ></jsp:include>
           
            <div class="breadcam_area breadcam_bg_1">
                <div class="breadcam_inner">
                    <div class="breadcam_text">                   
                    <h3>Usluge odabrane agencije </h3>                 
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
                        if (!listaUsluga.isEmpty()) {%> <div class="col-md-12"> <br>
                        <table class="table table-striped" style="border: 1px white">
                            <thead style="background-color: #313352; color:white;">
                                <tr>
                                    <th scope="col">ID Usluge</th>     
                                    <th scope="col">ID Agencije</th>     
                                    <th scope="col">Naziv usluge</th>
                                    <th scope="col">Opis usluge</th>
                                    <th scope="col">Cena usluge</th> 
                                    <th scope="col"></th>
                                    <th><a href="ispisAgencija.jsp"><button class="genric-btn success circle"><i class="fa-solid fa-arrow-left"></i> Vrati se</button></a></th>
                                </tr>
                            </thead>
                            <tbody>
                                <%

                                    for (Usluga u : listaUsluga) {
                                        String rola = "Korisnik";
                                %>
                                <tr>
                                    <td><%= u.getIdUsluge()%></td>
                                    <td><%= u.getIdAgencije()%></td>
                                    <td><%= u.getNaziv()%></td>
                                    <td><%= u.getOpis()%></td>
                                    <td><%= u.getCena()%></td>

                                    <td>
                                        <form action="IzmenaUslugaForma" method="post">
                                            <button type="submit" class="btn btn-info"><i class="fa-solid fa-pen-to-square"></i> Izmeni uslugu</button>
                                            <input type="hidden" value="<%= u.getIdUsluge()%>" name="idUsluge" />
                                        </form>
                                    </td>

                                    <td>
                                        <form action="BrisanjeUsluga" method="post">
                                            <button type="submit" class="btn btn-danger"><i class="fa-regular fa-trash-can"></i> Obriši uslugu</button>
                                            <input type="hidden" value="<%= u.getIdUsluge()%>" name="idUsluge" />
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


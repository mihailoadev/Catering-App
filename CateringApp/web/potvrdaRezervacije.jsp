<%-- 
    Document   : potvrdaRezervacije
    Created on : May 26, 2024, 12:10:20 PM
    Author     : Miki
--%>

<%@page import="bean.Korisnik"%>
<%@page import="bean.Usluga"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!doctype html>
<html class="no-js" lang="zxx">

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
            String datum = (String) request.getAttribute("datum");
            String cena = (String) request.getAttribute("bazna");
            int brojPoena = (int) request.getAttribute("brojPoena");
            int ukupno = (int) request.getAttribute("ukupna");
            Usluga usluga = (Usluga) sesija.getAttribute("usluga");
            Korisnik k = (Korisnik) sesija.getAttribute("korisnik");
            int snizenje = (int) request.getAttribute("snizenje");
        %>      


        <jsp:include page="header.jsp" ></jsp:include>

            <div class="breadcam_area breadcam_bg_1">
                <div class="breadcam_inner">
                    <div class="breadcam_text">
                        <h3>Potvrdite porudžbinu</h3>
                    </div>
                </div>
            </div>            

            <section class="sample-text-area">
                <div class="container">
                    <div class="row">
                        <div class="col-md-12">
                            <br>
                            <table class="table">
                                <thead>
                                    <tr>
                                        <th colspan="2">Vaša rezervacija porudžbine</th>
                                    </tr>
                                    <tr>
                                        <th colspan="2">Za datum: <%=datum%></th>
                                </tr>
                            </thead>
                            <tbody>
                                <tr>
                                    <td colspan="2">
                                        <ul class="list-group mb-3">
                                            <li class="list-group-item d-flex justify-content-between lh-condensed">
                                                <div>
                                                    <h6 class="my-0">Meni: <%=usluga.getNaziv()%></h6>
                                                </div>
                                                <span class="text-muted"><%=cena%> dinara</span>
                                            </li>
                                            <li class="list-group-item d-flex justify-content-between bg-light">
                                                <div class="text-success">
                                                    <h6 class="my-0"><i class="fa-solid fa-coins"></i> Vas broj poena nakon porudžbine:</h6>
                                                    <small><%=brojPoena%></small>
                                                </div>
                                                <span class="text-success">Snizenje - <%=snizenje%></span>
                                            </li>
                                            <li class="list-group-item d-flex justify-content-between">
                                                <span>Ukupna cena</span>
                                                <strong><%=ukupno%></strong>
                                            </li>
                                        </ul>
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <a href="PregledRezervacijeKorisnik" class="genric-btn info circle"><i class="fa-solid fa-circle-check"></i> Potvrdi</a>
                                        <a href="rezervacije.jsp" class="genric-btn info circle"><i class="fa-solid fa-arrow-left"></i> Vrati se</a>
                                    </td>                            
                                </tr>
                            </tbody>
                        </table>
                    </div>
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

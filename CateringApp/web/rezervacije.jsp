<%-- 
    Document   : rezervacije
    Created on : May 26, 2024, 12:11:56 PM
    Author     : Miki
--%>

<%@page import="java.util.ArrayList"%>
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
            Usluga u = (Usluga) sesija.getAttribute("usluga");
            Korisnik k = (Korisnik) sesija.getAttribute("korisnik");
        %>        


        <jsp:include page="header.jsp" ></jsp:include>    


            <div class="breadcam_area breadcam_bg_1">
                <div class="breadcam_inner">
                    <div class="breadcam_text">
                        <h3>Potvrdite porudžbinu</h3>
                    </div>
                </div>
            </div>

            <section class="sample-text-area" style="padding-top: 50px; padding-bottom: 50px;">
                <div class="container text-center">
                    <div class="row justify-content-center">
                        <div class="col-lg-8 col-md-8">
                            <h3 class="mb-30">Vaša rezervacija keteringa</h3>
                            <form action="Korpa" method="post">
                                <div class="mt-10">
                                    <input type="text" name="ime" value="<%= k.getIme()%>" placeholder="<%= k.getIme()%>" required class="single-input" style="border-radius: 10px; border: 1px solid #ced4da;">
                            </div>
                            <div class="mt-10">
                                <input type="text" name="prezime" value="<%= k.getPrezime()%>" placeholder="<%= k.getPrezime()%>" required class="single-input" style="border-radius: 10px; border: 1px solid #ced4da;">
                            </div>
                            <div class="mt-10">
                                <input type="text" name="korisnickoIme" value="<%= k.getKorisnickoIme()%>" placeholder="<%= k.getKorisnickoIme()%>" required class="single-input" style="border-radius: 10px; border: 1px solid #ced4da;">
                            </div>
                            <div class="mt-10">
                                <input type="email" name="email" value="<%= k.getEmail()%>" placeholder="<%= k.getEmail()%>" required class="single-input" style="border-radius: 10px; border: 1px solid #ced4da;">
                            </div>
                            <div class="mt-10">
                                <input type="text" name="adresa" value="<%= k.getAdresa()%>" placeholder="<%= k.getAdresa()%>" required class="single-input" style="border-radius: 10px; border: 1px solid #ced4da;">
                            </div>
                            <div class="mt-10">
                                <input type="text" name="grad" value="<%= k.getGrad()%>" placeholder="<%= k.getGrad()%>" required class="single-input" style="border-radius: 10px; border: 1px solid #ced4da;">
                            </div>
                            <div class="mt-10">
                                <textarea class="form-control" id="exampleFormControlTextarea1" rows="5" name="poruka" placeholder="Poruka" style="border-radius: 10px; border: 1px solid #ced4da;"></textarea>
                            </div>
                            <div class="mt-10">
                                <label>Vreme</label>
                                <input type="date" class="form-control" name="datum" required style="border-radius: 10px; border: 1px solid #ced4da;">
                            </div>
                            <div class="mt-10">
                                <h4><i class="fa-solid fa-clipboard-list"></i> Naziv izabrane usluge: <%= u.getNaziv()%></h4>
                                <br>
                                <h5><i class="fa-solid fa-money-bill"></i> Cena usluge: <%= u.getCena()%> RSD</h5>
                                <h6><i class="fa-solid fa-cash-register"></i> Plaćanje po pouzeću</h6>
                                <input type="hidden" name="cena" value="<%= u.getCena()%>">
                            </div>
                            <div class="mt-10">
                                <br>
                                <button type="submit" class="genric-btn info circle e-large"><i class="fa-solid fa-circle-check"></i> Potvrdi</button>
                                <input type="hidden" name="idUsluge" value="<%= u.getIdUsluge()%>">
                                <a href="AgencijaServlet"><button class="genric-btn info circle e-large"><i class="fa-solid fa-arrow-left"></i> Vrati se</button></a>
                            </div>
                        </form>

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


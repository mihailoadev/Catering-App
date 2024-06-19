<%-- 
    Document   : dodajUsluguForma
    Created on : May 26, 2024, 11:56:00 AM
    Author     : Miki
--%>

<%@page import="bean.Agencija"%>
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

        <link rel="stylesheet" href="css/bootstrap.min.css">        
        <link rel="stylesheet" href="css/style.css">
        
    </head>

    <body>       


        <jsp:include page="header.jsp" ></jsp:include>           


            <div class="breadcam_area breadcam_bg_1">
                <div class="breadcam_inner">
                    <div class="breadcam_text">
                        <h3>Dodajte uslugu</h3>
                    </div>
                </div>
            </div>        


            <section class="sample-text-area">
                <div class="container box_1170">
                    <div class="row">
                        <div class="col-lg-8 col-md-8">
                            <h3 class="mb-30">Usluga</h3>
                            <form action="DodajUsluguForma" method="post">
                                <div class="mt-10">
                                    <input type="text" name="naziv"  placeholder="Naziv usluge" required class="single-input">
                                </div>
                                <div class="mt-10">
                                    <textarea class="form-control" id="exampleFormControlTextarea1" rows="3" name="opis" placeholder="Opis usluge" required class="single-input"></textarea>
                                </div>

                                <div class="mt-10">
                                    <input type="number" name="cena"  placeholder="Dodajte cenu" required class="single-input">
                                </div>

                                <div class="mt-10">
                                    <input type="number" name="idAgencije"  placeholder="Dodajte id agencije" max="6" min="1" required class="single-input">
                                </div>

                                <div class="mt-10"><br>
                                    <input type="submit" value="Potvrdi" class="genric-btn info">
                                </div> 
                        </div>
                        </form>
                    </div>
                    <br> 
                    <a href="PregledAgencija" > <button class="btn btn-info">Vrati se</button></a>
                </div> 
            </section>
        

    <jsp:include page="footer.jsp" ></jsp:include>


    
    <script src="js/vendor/jquery-1.12.4.min.js"></script>   
    <script src="js/bootstrap.min.js"></script>    
    <script src="js/main.js"></script>

</body>

</html>

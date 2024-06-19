<%-- 
    Document   : registracija
    Created on : May 26, 2024, 12:11:14 PM
    Author     : Miki
--%>

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

        <link rel="stylesheet" href="css/bootstrap.min.css">        
        <link rel="stylesheet" href="css/style.css">
       
    </head>
    <body>
        <jsp:include page="header.jsp" ></jsp:include>
            
            <div class="breadcam_area breadcam_bg_1">
                <div class="breadcam_inner">
                    <div class="breadcam_text">
                        <h3>Registracija</h3>
                    </div>
                </div>
            </div>           


            <section class="sample-text-area" style="padding-top: 50px; padding-bottom: 50px;">
                <div class="container text-center">
                    <div class="row justify-content-center">
                        <div class="col-lg-4 col-md-4">
                            <h3 class="mb-30">Registrujte se</h3>
                            <form action="Registracija" method="post">
                                <div class="mt-10">
                                    <input type="text" name="ime" placeholder="Vaše ime" required class="single-input" style="border-radius: 10px; border: 1px solid #ced4da;">
                                </div>
                                <div class="mt-10">
                                    <input type="text" name="prezime" placeholder="Vaše prezime" required class="single-input" style="border-radius: 10px; border: 1px solid #ced4da;">
                                </div>
                                <div class="mt-10">
                                    <input type="text" name="adresa" placeholder="Vaša adresa" required class="single-input" style="border-radius: 10px; border: 1px solid #ced4da;">
                                </div>
                                <div class="mt-10">
                                    <input type="text" name="grad" placeholder="Grad" required class="single-input" style="border-radius: 10px; border: 1px solid #ced4da;">
                                </div>
                                <div class="mt-10">
                                    <input type="email" name="email" placeholder="Vaša e-mail adresa" required class="single-input" style="border-radius: 10px; border: 1px solid #ced4da;">
                                </div>
                                <div class="mt-10">
                                    <input type="text" name="korisnickoIme" placeholder="Korisničko ime" required class="single-input" style="border-radius: 10px; border: 1px solid #ced4da;">
                                </div>
                                <div class="mt-10">
                                    <input type="password" name="lozinka" placeholder="Lozinka" required class="single-input" style="border-radius: 10px; border: 1px solid #ced4da; ">
                                </div>
                                <div class="mt-10">
                                    <input type="password" name="lozinkaPotvrda" placeholder="Potvrdite lozinku" required class="single-input" style="border-radius: 10px; border: 1px solid #ced4da;">
                                </div>
                                <div class="mt-10">
                                    <input type="submit" value="Registracija" class="genric-btn circle info e-large">
                                </div>
                            </form>
                        </div>
                    </div>
                </div>
            </section>
         
        <jsp:include page="footer.jsp" ></jsp:include>
        
       
        <script src="js/vendor/jquery-1.12.4.min.js"></script>     
        <script src="js/bootstrap.min.js"></script>        
        <script src="js/main.js"></script>
    </body>
</html>

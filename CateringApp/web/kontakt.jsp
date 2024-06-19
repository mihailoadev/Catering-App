<%-- 
    Document   : kontakt
    Created on : May 26, 2024, 12:08:53 PM
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
        
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.2/css/all.min.css" crossorigin="anonymous" referrerpolicy="no-referrer" />        
        <link rel="stylesheet" href="css/bootstrap.min.css">        
        <link rel="stylesheet" href="css/style.css">
        
    </head>
    <body>
      
        <jsp:include page="header.jsp" ></jsp:include>
           

           
            <div class="breadcam_area breadcam_bg_1">
                <div class="breadcam_inner">
                    <div class="breadcam_text">
                        <h3>Kontakt</h3>
                    </div>
                </div>
            </div>           

            <div class="single_about_area">
                <div class="container">
                    <div class="row">
                        <div class="col-12">
                            <h2 class="contact-title">Imate pitanja?</h2>
                        </div>
                        <div class="col-lg-8">
                            <form class="form-contact contact_form" action="" method="post" id="contactForm" novalidate="novalidate">
                                <div class="row">
                                    <div class="col-12">
                                        <div class="form-group">
                                            <textarea class="form-control w-100" name="message" id="message" cols="30" rows="9" placeholder="Poruka"></textarea>
                                        </div>
                                    </div>
                                    <div class="col-sm-6">
                                        <div class="form-group">
                                            <input class="form-control valid" name="name" id="name" type="text" placeholder="Vaše ime">
                                        </div>
                                    </div>
                                    <div class="col-sm-6">
                                        <div class="form-group">
                                            <input class="form-control valid" name="email" id="email" type="email" placeholder="Vaša e-mail adresa">
                                        </div>
                                    </div>
                                    <div class="col-12">
                                        <div class="form-group">
                                            <input class="form-control" name="subject" id="subject" type="text" placeholder="Naslov poruke">
                                        </div>
                                    </div>
                                </div>
                                <div class="form-group mt-3">
                                    <button type="submit" class="genric-btn info circle e-large" disabled=""><i class="fa-solid fa-paper-plane"></i> Pošalji</button>
                                </div>
                            </form>
                        </div>
                        <div class="col-lg-3 offset-lg-1">
                            <div class="media contact-info">
                                <span class="contact-info__icon"><i class="fa-solid fa-location-dot"></i></span>
                                <div class="media-body">
                                    <h3>Beograd, Srbija.</h3>
                                    <p>Knez Mihailova 12, 11000 Beograd</p>
                                </div>
                            </div>
                            <div class="media contact-info">
                                <span class="contact-info__icon"><i class="fa-solid fa-phone"></i></span>
                                <div class="media-body">
                                    <h3>+381 11 555 1234</h3>
                                    <p>Pon do Pet 9h do 18h</p>
                                </div>
                            </div>
                            <div class="media contact-info">
                                <span class="contact-info__icon"><i class="fa-solid fa-envelope"></i></span>
                                <div class="media-body">
                                    <h3>ketering@primer.com</h3>
                                    <p>Pošaljite nam svoj upit u bilo koje vreme!</p>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>


        <jsp:include page="footer.jsp" ></jsp:include> 
        
        <script src="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.2/js/all.min.js" crossorigin="anonymous" referrerpolicy="no-referrer"></script> 
        <script src="js/vendor/jquery-1.12.4.min.js"></script>        
        <script src="js/bootstrap.min.js"></script>        
        <script src="js/main.js"></script>
    </body>
</html>

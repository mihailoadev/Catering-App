<%-- 
    Document   : izmenaUslugaForma
    Created on : May 26, 2024, 12:08:17 PM
    Author     : Miki
--%>

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
            String greska = (String) request.getAttribute("greska");
        %>      


        <jsp:include page="header.jsp" ></jsp:include>


            <div class="breadcam_area breadcam_bg_1">
                <div class="breadcam_inner">
                    <div class="breadcam_text">
                        <h3>Izmenite uslugu</h3>
                    </div>
                </div>
            </div>

        <%   if (greska != null) {%>
        <div class="alert alert-warning" role="alert">
            <%= greska%>
        </div>
        <%}%>

        <section class="sample-text-area">
            <div class="container box_1170">
                <div class="row">
                    <div class="col-lg-8 col-md-8">
                        <h3 class="mb-30">Izmeni uslugu </h3>
                        <form action="IzmenaUsluga" method="post">
                            <div class="mt-10">
                                <input type="text" name="idAgencije" value="<%= u.getIdUsluge()%>" placeholder="<%= u.getIdUsluge()%>"
                                       required
                                       class="single-input">
                            </div>                                       
                            <div class="mt-10">
                                <input type="text" name="naziv" placeholder="<%= u.getNaziv()%>"
                                       required
                                       class="single-input">
                            </div>
                            <div class="mt-10">
                                <textarea class="form-control" id="exampleFormControlTextarea1" rows="9" name="opis" placeholder="<%= u.getOpis()%> "></textarea>
                            </div>
                            <div class="mt-10">
                                <input type="number" name="cena" placeholder="<%= u.getCena()%>"
                                       required
                                       class="single-input">
                            </div>
                            <div class="mt-10">
                                <br>
                                <button type="submit" class="genric-btn info circle"><i class="fa-solid fa-circle-check"></i> Potvrdi</button>
                                <input type="hidden" value="<%= u.getIdUsluge()%>" name="idUsluge" />

                            </div>
                    </div>
                    </form>
                </div>
                <br> 
                <a href="PregledAgencija" > <button class="genric-btn info circle"><i class="fa-solid fa-arrow-left"></i> Vrati se</button></a>
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

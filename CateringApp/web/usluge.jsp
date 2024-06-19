<%-- 
    Document   : usluge
    Created on : May 26, 2024, 12:12:52 PM
    Author     : Miki
--%>

<%@page import="bean.Agencija"%>
<%@page import="bean.Usluga"%>
<%@page import="bean.Korisnik"%>
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

        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.9.0/css/all.min.css" crossorigin="anonymous" referrerpolicy="no-referrer" />
        <link rel="stylesheet" href="css/bootstrap.min.css">        
        <link rel="stylesheet" href="css/style.css">
    </head>
    <body>

        <%
            HttpSession sesija = request.getSession();
            Agencija agencija = (Agencija) sesija.getAttribute("agencija");
            ArrayList<Usluga> usluga = (ArrayList<Usluga>) sesija.getAttribute("usluga");
        %>      

        <jsp:include page="header.jsp" ></jsp:include>


            <div class="breadcam_area breadcam_bg_1">
                <div class="breadcam_inner">
                    <div class="breadcam_text">
                        <h3>Meni</h3>                   
                    </div>
                </div>
            </div>

            <div class="service_area">
                <div class="container">
                    <div class="row">
                        <div class="col-xl-12">
                            <div class="section_title mb-60">
                                <h3>Meni agencije</h3>
                                <p></p>
                            </div>
                        </div>
                    </div>

                    <div class="row">
                    <% for (Usluga a : usluga) {%>
                    <div class="col-xl-4 col-md-6">
                        <div class="single_service">
                            <div class="service_icon">
                                <i class="fas fa-utensils fa-4x"></i>
                            </div>
                            <form action="RezervacijaServlet" method="post">
                                <h4> <%= a.getNaziv()%></h4>
                                <p> <%= a.getOpis()%></p>
                                <div class="order_prise">
                                    <span><%= a.getCena()%> dinara</span>
                                </div>
                                <br>
                                <input type="submit" class="genric-btn info circle e-large" value="Poruči" id="dugme">
                                <input type="hidden"  value='<%= a.getIdUsluge()%>' name="idUsluge">
                            </form>
                        </div>
                    </div>
                    <% }%>
                </div>
            </div>
        </div>

        <jsp:include page="footer.jsp" ></jsp:include>  



        <script src="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.9.0/js/all.min.js" crossorigin="anonymous" referrerpolicy="no-referrer"></script>        
        <script src="js/vendor/jquery-1.12.4.min.js"></script>       
        <script src="js/bootstrap.min.js"></script>        
        <script src="js/main.js"></script>

    </body>

</html>


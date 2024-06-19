<%-- 
    Document   : header
    Created on : May 26, 2024, 11:59:58 AM
    Author     : Miki
--%>

<%@page import="bean.Korisnik"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        
         <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.2/css/all.min.css" crossorigin="anonymous" referrerpolicy="no-referrer" />
    </head>
    <body>
        <%
            HttpSession sesija = request.getSession();
            Korisnik korisnik = (Korisnik) sesija.getAttribute("korisnik");
            int privilegija;
            if (korisnik == null) {
                privilegija = 0;
            } else //Logovanje korisnika
            {
                int privilegije = korisnik.getPrivilegije();
                if (privilegije == 1) {
                    privilegija = 1;
                } else if (privilegije == 2) {
                    privilegija = 2;
                } else if (privilegije == 3) {
                    privilegija = 3;
                } else {
                    privilegija = 0;
                }
            }

            sesija.setAttribute("privilegije", privilegija);


        %>




        <% if (privilegija == 1) {%>
        <header>
            <nav class="navbar navbar-expand-lg navbar-light bg-light">
                <div class="container">
                    <a class="navbar-brand" href="index.jsp">
                        <img src="img/logo.png" alt="Logo">
                    </a>
                    <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
                        <span class="navbar-toggler-icon"></span>
                    </button>
                    <div class="collapse navbar-collapse" id="navbarSupportedContent">
                        <ul class="navbar-nav mr-auto">
                            <li class="nav-item">
                                <a class="nav-link" href="AgencijaServlet">Ketering meni</a>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link" href="about.jsp">O nama</a>
                            </li>                            
                            <li class="nav-item">
                                <a class="nav-link" href="kontakt.jsp">Kontakt</a>
                            </li>
                        </ul>
                        <form class="form-inline my-2 my-lg-0">
                            <li class="nav-item dropdown">
                                <a class="nav-link dropdown-toggle genric-btn info circle e-large mr-2" href="#" id="navbarDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                    <i class="fa-solid fa-user"></i> Korisnik: <%= korisnik.getIme()%> -> <i class="fa-solid fa-coins"></i> <%= korisnik.getPoeni()%> poena
                                </a>
                                <div class="dropdown-menu" aria-labelledby="navbarDropdown">
                                    <a class="dropdown-item" href="PregledRezervacijeKorisnik"><i class="fa-solid fa-cart-shopping"></i> Korpa</a>
                                </div>
                            </li>
                            <a href="Logout" class="genric-btn info circle e-large"><i class="fa-solid fa-arrow-right-from-bracket"></i> Izloguj se</a>
                        </form>
                    </div>
                </div>
            </nav>
        </header>
        <% } %>


        <% if (privilegija == 2) {%>
        <header>
            <nav class="navbar navbar-expand-lg navbar-light bg-light">
                <div class="container">
                    <a class="navbar-brand" href="index.jsp">
                        <img src="img/logo.png" alt="Logo">
                    </a>
                    <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
                        <span class="navbar-toggler-icon"></span>
                    </button>
                    <div class="collapse navbar-collapse" id="navbarSupportedContent">
                        <ul class="navbar-nav mr-auto">
                            <li class="nav-item">
                                <a class="nav-link" href="AgencijaServlet">Ketering meni</a>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link" href="about.jsp">O nama</a>
                            </li>                            
                            <li class="nav-item">
                                <a class="nav-link" href="kontakt.jsp">Kontakt</a>
                            </li>

                        </ul>
                        <form class="form-inline my-2 my-lg-0">
                            <li class="nav-item dropdown">
                                <a class="nav-link dropdown-toggle genric-btn info circle e-large mr-2" href="#" id="navbarDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                    <i class="fa-solid fa-user-tie"></i> Menadžer: <%= korisnik.getIme()%>
                                </a>
                                <div class="dropdown-menu" aria-labelledby="navbarDropdown">
                                    <a class="dropdown-item" href="PregledAgencija"><i class="fa-solid fa-utensils"></i> Ketering agencije</a>
                                    <a class="dropdown-item" href="PregledRezervacijeZaposleni"><i class="fa-solid fa-list"></i> Porudžbine</a>                                    
                                </div>
                            </li>
                            <a href="Logout" class="genric-btn info circle e-large"><i class="fa-solid fa-arrow-right-from-bracket"></i> Izloguj se</a>
                        </form>
                    </div>
                </div>
            </nav>
        </header>
        <% } %>


        <% if (privilegija == 3) {%>
        <header>
            <nav class="navbar navbar-expand-lg navbar-light bg-light">
                <div class="container">
                    <a class="navbar-brand" href="index.jsp">
                        <img src="img/logo.png" alt="Logo">
                    </a>
                    <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
                        <span class="navbar-toggler-icon"></span>
                    </button>
                    <div class="collapse navbar-collapse" id="navbarSupportedContent">
                        <ul class="navbar-nav mr-auto">
                            <li class="nav-item">
                                <a class="nav-link" href="AgencijaServlet">Ketering meni</a>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link" href="about.jsp">O nama</a>
                            </li>                            
                            <li class="nav-item">
                                <a class="nav-link" href="kontakt.jsp">Kontakt</a>
                            </li>

                        </ul>
                        <form class="form-inline my-2 my-lg-0">

                            <li class="nav-item dropdown">
                                <a class="nav-link dropdown-toggle genric-btn info circle e-large mr-2" href="#" id="navbarDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                    <i class="fa-solid fa-user-shield"></i> Admin: <%= korisnik.getIme()%>
                                </a>
                                <div class="dropdown-menu" aria-labelledby="navbarDropdown">
                                    <a class="dropdown-item" href="PregledKorisnika"><i class="fa-solid fa-user"></i> Korisnici</a>
                                    <a class="dropdown-item" href="PregledAgencija"><i class="fa-solid fa-utensils"></i> Ketering Agencije</a>
                                    <a class="dropdown-item" href="PregledRezervacijeZaposleni"><i class="fa-solid fa-list"></i> Porudžbine</a>
                                </div>
                                <a href="Logout" class="genric-btn info circle e-large"><i class="fa-solid fa-arrow-right-from-bracket"></i> Izloguj se</a>
                            </li>
                        </form>
                    </div>
                </div>
            </nav>
        </header>
        <% } %>



        <%if (privilegija == 0) { %>
        
        <header>
            <nav class="navbar navbar-expand-lg navbar-light bg-light">
                <div class="container">
                    <a class="navbar-brand" href="index.jsp">
                        <img src="img/logo.png" alt="Logo">
                    </a>
                    <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
                        <span class="navbar-toggler-icon"></span>
                    </button>
                    <div class="collapse navbar-collapse" id="navbarSupportedContent">
                        <ul class="navbar-nav mr-auto">
                            <li class="nav-item">
                                <a class="nav-link" href="AgencijaServlet">Ketering meni</a>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link" href="about.jsp">O nama</a>
                            </li>                            
                            <li class="nav-item">
                                <a class="nav-link" href="kontakt.jsp">Kontakt</a>
                            </li>                            
                        </ul>
                        <form class="form-inline my-2 my-lg-0">
                            <a href="login.jsp" class="genric-btn info circle e-large mr-2"><i class="fa-solid fa-user"></i> Login</a>
                            <a href="registracija.jsp" class="genric-btn info circle e-large"><i class="fa-solid fa-user-plus"></i> Registracija</a>
                        </form>

                    </div>
                </div>
            </nav>
        </header>


        <%}%>
        
        
                <script src="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.2/js/all.min.js" crossorigin="anonymous" referrerpolicy="no-referrer"></script>  
    </body>
</html>

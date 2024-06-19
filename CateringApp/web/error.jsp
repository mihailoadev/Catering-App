<%-- 
    Document   : error
    Created on : May 26, 2024, 11:56:36 AM
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

            
            <div class="breadcam_area breadcam_bg_1 zigzag_bg_2">
                <div class="breadcam_inner">
                    <div class="breadcam_text">
                        <h3>${poruka}  ${error} ${$msg}</h3>
                </div>
            </div>
        </div>
        
        <jsp:include page="footer.jsp" ></jsp:include>       


        
        
        <script src="js/vendor/jquery-1.12.4.min.js"></script>       
        <script src="js/bootstrap.min.js"></script>     
        <script src="js/main.js"></script>

    </body>

</html>

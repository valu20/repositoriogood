<!DOCTYPE html>
<html lang="en">

<head>
    <title>INICIO </title>
    <!-- Meta tags -->
    <link rel="icon"  type="image/pnpg" href="favicon.ico">
    <meta name="viewport" content="width=device-width, initial-scale=1" />
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <meta name="keywords" content="Allied Login Form Responsive Widget, Audio and Video players, Login Form Web Template, Flat Pricing Tables, Flat Drop-Downs, Sign-Up Web Templates, Flat Web Templates, Login Sign-up Responsive Web Template, Smartphone Compatible Web Template, Free Web Designs for Nokia, Samsung, LG, Sony Ericsson, Motorola Web Design"
    />
    <script>
        addEventListener("load", function () { setTimeout(hideURLbar, 0); }, false); function hideURLbar() { window.scrollTo(0, 1); }
    </script>
    <!-- Meta tags -->
    <!-- font-awesome icons -->
    <link href="css/font-awesome.min1.css" rel="stylesheet">
    <!-- //font-awesome icons -->
    <!--stylesheets-->
    <link href="css/style2.css" rel='stylesheet' type='text/css' media="all">
    <!--//style sheet end here-->
    <link href="//fonts.googleapis.com/css?family=Montserrat:300,400,500,600" rel="stylesheet">
    <link href="//fonts.googleapis.com/css?family=Open+Sans:400,600,700" rel="stylesheet">
</head>

<body>
    <div class="w3layouts-two-grids">
        <div class="mid-class">
            <div class="txt-left-side">
                <h2>Iniciar Sesión </h2>
           <img src="escudo.png" border="1" width="150" height="150">
           <form action="Validar" method="POST">
                    <div class="form-left-to-w3l">
                        <span class="fa fa-envelope-o" aria-hidden="true"></span>
                        <input type="email" name="email" placeholder="Correo" required="" pattern="[a-zA-Z0-9._%+-]+@[a-z0-9.-]+\.[a-z]{2,}$">

                        <div class="clear"></div>
                    </div>
                    <div class="form-left-to-w3l ">

                        <span class="fa fa-lock" aria-hidden="true"></span>
                        <input type="password" name="password" placeholder="Contraseña" required="">
                        <div class="clear"></div>
                    </div>
                    <div class="main-two-w3ls">
                        <div class="right-side-forget">
                            <a href="reset.jsp" class="for">Olvido su Contraseña?</a>
                        </div>
                    </div>
                    <div class="btnn">
                        <button type="submit" name="accion" value="Ingresar">INGRESAR </button>
                    </div>
                </form>
                
            </div>
            <div class="img-right-side">
                <img src="logo3.png" border="0" width="200" height="40">
                <h3>Bienvenidos a Good Life</h3>
                <p>Sistema Gestor de refrigerios del colegio Enrique Olaya Herrera.</p>
                <img src="fruta.jpg" class="img-fluid" alt="">
            </div>
        </div>
    </div>
    
            <%request.getAttribute("error");%> 

            ${error} 
           
</body>

</html>


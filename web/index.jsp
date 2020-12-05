<!DOCTYPE html>
<html>
    <head>
        <meta charset="utf-8" />
        <title>BIENVENIDO</title>
        <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no" />
        <meta content="A fully featured admin theme which can be used to build CRM, CMS, etc." name="description" />
        <meta content="Coderthemes" name="author" />
        <meta http-equiv="X-UA-Compatible" content="IE=edge" />

        <!-- App favicon -->
        <link rel="shortcut icon" href="favicon.ico">

        <!-- App css -->
        <link href="assets/css/bootstrap.min.css" rel="stylesheet" type="text/css" />
        <link href="assets/css/icons.css" rel="stylesheet" type="text/css" />
        <link href="assets/css/metismenu.min.css" rel="stylesheet" type="text/css" />
        <link href="assets/css/style.css" rel="stylesheet" type="text/css" />
        
        <script src="https://kit.fontawesome.com/30db1f38e8.js" crossorigin="anonymous">
            addEventListener("load", function () {
                setTimeout(hideURLbar, 0);
            }, false);

            function hideURLbar() {
                window.scrollTo(0, 1);
            }
        </script>



        <script src="assets/js/modernizr.min.js"></script>

    </head>


    <body>

        <!-- Begin page -->
        <div id="wrapper">

            <!-- ========== Left Sidebar Start ========== -->
            <div class="left side-menu">

                <div class="slimscroll-menu" id="remove-scroll">

                    <!-- LOGO -->
                    <div class="topbar-left">
                        <a href="index.jsp" class="logo">
                            <span>
                                <img src="logo3.png" alt="" height="22">
                            </span>
                            <i>
                                <img src="assets/images/logo_sm.png" alt="" height="28">
                            </i>
                        </a>
                    </div>

                    <!-- User box -->
                    <div class="user-box">
                        <div class="user-img">
                            <img src="escudo.jpg" alt="user-img" title="Mat Helme" class="rounded-circle img-fluid">
                        </div>
                        
                        <h5> ${usuario.getNom()} </h5>
                        <%request.getAttribute("rol");%>
                        <p class="text-muted">${rol}</p>
                        <p class="text-muted" hidden id="NumeroIngresos"> ${ingresos}</p>
                    </div>

                    <!--- Sidemenu -->
                    <div id="sidebar-menu">

                        <ul class="metismenu" id="side-menu">

                            <!--<li class="menu-title">Navigation</li>-->

                            <li>
                                <a href="index.jsp">
                                    <i class="fas fa-home"></i></span> <span> Inicio </span>
                                </a>
                            </li>
                            
                            <li>
                                <a href="Controlador?accion=Listar&menu=usuario"><i class="fas fa-user"></i><span> Usuarios </span></a>
                            </li>

                            <li>
                                <a href="Controlador?menu=Curso&accion=Listar"><i class="fas fa-graduation-cap"></i><span> Cursos </span></a>
                            </li>

                            <li>
                                <a href="Controlador?accion=Listar&&menu=Refrigerio"><i class="fas fa-utensils"></i><span> Refrigerios </span></a>
                            </li>
                            <li>
                                <a href="Controlador?menu=Reporte&accion=Listar"><i class="fas fa-book-open"></i><span> Reportes </span></a>
                            </li>
                    </div>
                    <!-- Sidebar -->

                    <div class="clearfix"></div>

                </div>
                <!-- Sidebar -left -->

            </div>
            <!-- Left Sidebar End -->



            <!-- ============================================================== -->
            <!-- Start right Content here -->
            <!-- ============================================================== -->

            <div class="content-page">

                <!-- Top Bar Start -->
                <div class="topbar">

                    <nav class="navbar-custom">

                        <ul class="list-unstyled topbar-right-menu float-right mb-0">

                            <li class="hide-phone app-search">
                                <form>
                                    <input type="text" placeholder="Buscar" class="form-control">
                                    <button type="submit"><i class="fa fa-search"></i></button>
                                </form>
                            </li>
                            <li class="dropdown notification-list">
                                <a class="nav-link dropdown-toggle nav-user" data-toggle="dropdown" href="#" role="button"
                                   aria-haspopup="false" aria-expanded="false">
                                    <img src="escudo.jpg" alt="user" class="rounded-circle"> <span class="ml-1"> ${usuario.getNom()} <i class="fas fa-chevron-down"></i></span>
                                </a>
                                <div class="dropdown-menu dropdown-menu-right dropdown-menu-animated profile-dropdown ">
                                    <!-- item-->
                                    <div class="dropdown-item noti-title">
                                        <h6 class="text-overflow m-0">Bienvenido !</h6>
                                    </div>
                                    <!-- item-->
                                    <a href="javascript:void" class="dropdown-item notify-item">
                                    <i class="fas fa-user-lock"></i><span>Cambiar Contraseña</span>
                                    </a>
                                    <!-- item-->
                                    <a href="login.jsp" class="dropdown-item notify-item">
                                    <i class="fas fa-sign-out-alt"></i><span>Cerrar Sesión</span>
                                    </a>
                                </div>
                                <div id="ModalIngresos" class="modal fade">
                <div class="modal-dialog">
                    <div class="modal-content">
                        <form action="Controlador?menu=usuario"  method="POST">
                            <div class="">						
                                <h4 class="modal-title">Cambiar Contraseña</h4>
                                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                                <p>Apreciado usuario como es su primer ingreso al sistema "Good Life" debe cambiar su contraseña,
                                Recuerde maximo 7 caracteres.</p>
                            </div>
                            <br>
                            <div class="row">
                                <div class="col-md-6">
                                    <label for="letras">Contraseña:</label>

                                    <input type="password" name="txtno" class="form-control" required="">
                                </div>
                            <div class="modal-footer">
                                <input type="submit" name="accion" class="btn btn-outline-light" style="background:tomato" value="Guardar">
                            </div>
                        </form>
                    </div>
                </div>
            </div>
                            </li>
                        </ul>
                        <ul class="list-inline menu-left mb-0">
                            <li class="float-left">
                                <button class="button-menu-mobile open-left disable-btn">
                                    <i class="dripicons-menu"></i>
                                </button>
                            </li>
                            <li>
                                <div class="page-title-box">
                                    <h4 class="page-title">Inicio </h4>
                                    <ol class="breadcrumb">
                                        <li class="breadcrumb-item active">Bienvenido a Good Life !</li>
                                    </ol>
                                </div>
                            </li>
                        </ul>
                    </nav>
                </div>
                                
                <!-- Top Bar End -->
                <style>
                    body{
                        margin: 0;
                        padding: 0;
                        
                    }
                 #tarjetas{
    display: flex;
    justify-content: center;
    background: #efefef;
}
.tarjeta img{
    width: 95%;
} 
.tarjeta{
    width: 20%;
    margin: 30px 30px 30px 30px;
    background: #FFF;
    padding: 25px;
    text-align: center;
}
h2{
    font-size: 17px;
    color: #aaa;
    
}
                    
            </style>
                <section id="tarjetas">
                    <div class="tarjeta">
                    <img src="usuario.jpg" alt="">
                    <h2>Usuarios</h2>
                    <p class="parrafo">El sistema dará acceso a los usuarios permitidos, agregar nuevos usuarios, eliminar usuarios, garantizando
                                seguridad y acceso correcto.</p> 
                    </div>
                    <div class="tarjeta">
                        <img src="virrete.jpg" alt="">
                    <h2>Cursos</h2>
                    <p class="parrafo">Llevar un orden y manejo adecuado de los cursos a los cuales se les realizara la gestión permitiendo 
                                    a los administrativos gestionar mejor sus entregas.</p> 
                    </div>
                    <div class="tarjeta">
                        <img src="lu.jpg" alt="">
                    <h2>Refrigerios</h2>
                    <p class="parrafo">Agregar, editar y eliminar la gestion diaria de los refrigerios
                                que llegan a la institucion, para consumo de los alumnos de las 3 Jornadas.</p>
                    </div>
                    <div class="tarjeta">
                        <img src="reporte.jpg" alt="">
                    <h2>Reportes</h2>
                    <p class="parrafo">Contamos con 2 sesiones para reportes, generales y especificos, guardando la gestión 
                                     se tendrá soporte sobre lo que sucedió durante su entrega.</p>
                    </div>
                    
                    
                </section>
                
                </div>

                    </div> <!-- container -->

                 <!-- content -->
            
    <script type="text/javascript">
        $(document).ready(function () {
          var numeroIngresos=$("#NumeroIngresos").val();
          if(numeroIngresos<=1)
              $("#ModalIngresos").removeClass("hidden");
        });
    </script>


        <!-- jQuery  -->
        <script src="assets/js/jquery.min.js"></script>
        <script src="assets/js/popper.min.js"></script>
        <script src="assets/js/bootstrap.min.js"></script>
        <script src="assets/js/metisMenu.min.js"></script>
        <script src="assets/js/waves.js"></script>
        <script src="assets/js/jquery.slimscroll.js"></script>

        <!-- Flot chart -->
        <script src="../plugins/flot-chart/jquery.flot.min.js"></script>
        <script src="../plugins/flot-chart/jquery.flot.time.js"></script>
        <script src="../plugins/flot-chart/jquery.flot.tooltip.min.js"></script>
        <script src="../plugins/flot-chart/jquery.flot.resize.js"></script>
        <script src="../plugins/flot-chart/jquery.flot.pie.js"></script>
        <script src="../plugins/flot-chart/jquery.flot.crosshair.js"></script>
        <script src="../plugins/flot-chart/curvedLines.js"></script>
        <script src="../plugins/flot-chart/jquery.flot.axislabels.js"></script>

        <!-- KNOB JS -->
        <!--[if IE]>
        <script type="text/javascript" src="../plugins/jquery-knob/excanvas.js"></script>
        <![endif]-->
        <script src="../plugins/jquery-knob/jquery.knob.js"></script>

        <!-- Dashboard Init -->
        <script src="assets/pages/jquery.dashboard.init.js"></script>

        <!-- App js -->
        <script src="assets/js/jquery.core.js"></script>
        <script src="assets/js/jquery.app.js"></script>

    </body>
</html>
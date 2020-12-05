

<%@page import="java.io.File"%>
<%@page import="java.util.Map"%>
<%@page import="java.util.HashMap"%>  
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="utf-8" />
        <title>REPORTES</title>
        <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no" />
        <meta content="A fully featured admin theme which can be used to build CRM, CMS, etc." name="description" />
        <meta content="Coderthemes" name="author" />
        <meta http-equiv="X-UA-Compatible" content="IE=edge" />

        <style>
            @media print{
                fas, .accion{
                    display: none;
                }
            }
        </style>
        
        
        
        <!-- App favicon -->
        <link rel="shortcut icon" href="favicon.ico">

        <!-- App css -->
        <link href="assets/css/bootstrap.min.css" rel="stylesheet" type="text/css" />
        <link href="assets/css/icons.css" rel="stylesheet" type="text/css" />
        <link href="assets/css/metismenu.min.css" rel="stylesheet" type="text/css" />
        <link href="assets/css/style.css" rel="stylesheet" type="text/css" />
        <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Roboto|Varela+Round">
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css">
        <link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
        <script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js"></script>
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js"></script>
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
                        <h5> ${usuario.getNombre()} </h5>
                        <p class="text-muted"></p>
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
                                <a href="Controlador?menu=usuario&accion=Listar"><i class="fas fa-user"></i><span> Usuarios </span></a>
                            </li>

                            <li>
                                <a href="Controlador?menu=Curso&accion=Listar"><i class="fas fa-graduation-cap"></i><span> Cursos </span></a>
                            </li>

                            <li>
                                <a href="Controlador?menu=Refrigerio&accion=Listar"><i class="fas fa-utensils"></i><span> Refrigerios </span></a>
                            </li>
                            <li>
                                <a href="Controlador?menu=Reporte&accion=Listar"style="color:tomato"><i class="fas fa-book-open"></i><span> Reportes </span></a>
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
                                <form action="Controlador?menu=Reporte&accion=Listar&id=${r.getUsu()}" method="POST">                                 
                                    <input type="text" name="Usuario" value="${r.getUsu()}" placeholder="Buscar" class="form-control">
                                    <button type="submit" name="accion" value="BuscarReporte"><i class="fa fa-search"></i></button>
                                </form>
                            </li>
                            <li class="dropdown notification-list">
                                <a class="nav-link dropdown-toggle nav-user" data-toggle="dropdown" href="#" role="button"
                                   aria-haspopup="false" aria-expanded="false">
                                    <img src="escudo.jpg" alt="user" class="rounded-circle"> <span class="ml-1"> ${usuario.getNombre()} <i class="fas fa-chevron-down"></i></span>
                                </a>
                                <div class="dropdown-menu dropdown-menu-right dropdown-menu-animated profile-dropdown ">
                                    <!-- item-->
                                    <div class="dropdown-item noti-title">
                                        <h6 class="text-overflow m-0">Bienvenido !</h6>
                                    </div>
                                    <!-- item-->
                                    <a href="javascript:void(0);" class="dropdown-item notify-item">
                                        <i class="fas fa-user-lock"></i><span>Cambiar Contraseña</span>
                                    </a>
                                    <!-- item-->
                                    <a href="login.jsp" class="dropdown-item notify-item">
                                        <i class="fas fa-sign-out-alt"></i><span>Cerrar Sesión</span>
                                    </a>
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
                                    <h4 class="page-title">Reportes</h4>
                                    <ol class="breadcrumb">
                                        <li class="breadcrumb-item"><a href="index.jsp">Inicio</a></li>
                                        <li class="breadcrumb-item"><a href="">Reportes</a></li>
                                        <style>
            @media print{
                .btn{
                    display: none;
                }
            }
        </style>
                                    </ol>
                                </div>
                            </li>
                        </ul>
                    </nav>
                </div>
                <style>
.table-responsive {
    margin: 30px 0;
}
.table-wrapper {
        background: #fff;
        padding: 20px 25px;
        border-radius: 3px;
        min-width: 1000px;
        box-shadow: 0 1px 1px rgba(0,0,0,.05);
}
.table-title {        
        padding-bottom: 15px;
        background: #f85a40;
        color: #fff;
        padding: 16px 30px;
        min-width: 100%;
        margin: -20px -25px 10px;
        border-radius: 3px 3px 0 0;
}
.table-title h2 {
        margin: 5px 0 0;
        font-size: 24px;
}
.table-title .btn-group {
        float: right;
}
.table-title .btn {
        color: #fff;
        float: right;
        font-size: 13px;
        border: none;
        min-width: 50px;
        border-radius: 2px;
        border: none;
        outline: none !important;
        margin-left: 10px;
}
.table-title .btn i {
        float: left;
        font-size: 21px;
        margin-right: 5px;
}
 .btn span {
        float: left;
        margin-top: 2px;
}
.table-title{
    font-size: 50px;
}
table.table tr th, table.table tr td {
        border-color: #e9e9e9;
        padding: 12px 15px;
        vertical-align: middle;
}
table.table tr th:first-child {
        width: 60px;
}
table.table tr th:last-child {
        width: 100px;
}
table.table-striped tbody tr:nth-of-type(odd) {
        background-color: #fcfcfc;
}
table.table-striped.table-hover tbody tr:hover {
        background: #f5f5f5;
}
table.table th i {
        font-size: 13px;
        margin: 0 5px;
        cursor: pointer;
}	
table.table td:last-child i {
        opacity: 0.9;
        font-size: 22px;
        margin: 0 5px;
}
table.table td a {
        font-weight: bold;
        color: #566787;
        display: inline-block;
        text-decoration: none;
        outline: none !important;
}
table.table td a:hover {
        color: #2196F3;
}
table.table td a.edit {
        color: #FFC107;
}
table.table td a.delete {
        color: #F44336;
}
table.table td i {
        font-size: 19px;
}
table.table .avatar {
        border-radius: 50%;
        vertical-align: middle;
        margin-right: 10px;
}
.pagination {
        float: right;
        margin: 0 0 5px;
}
.pagination li a {
        border: none;
        font-size: 13px;
        min-width: 30px;
        min-height: 30px;
        color: #999;
        margin: 0 2px;
        line-height: 30px;
        border-radius: 2px !important;
        text-align: center;
        padding: 0 6px;
}
.pagination li a:hover {
        color: #666;
}	
.pagination li.active a, .pagination li.active a.page-link {
        background: #03A9F4;
}
.pagination li.active a:hover {        
        background: #0397d6;
}
.pagination li.disabled i {
        color: #ccc;
}
.pagination li i {
        font-size: 16px;
        padding-top: 6px
}
.hint-text {
        float: left;
        margin-top: 10px;
        font-size: 13px;
}    
/* Custom checkbox */
.custom-checkbox {
        position: relative;
}
.custom-checkbox input[type="checkbox"] {    
        opacity: 0;
        position: absolute;
        margin: 5px 0 0 3px;
        z-index: 9;
}
.custom-checkbox label:before{
        width: 18px;
        height: 18px;
}
.custom-checkbox label:before {
        content: '';
        margin-right: 10px;
        display: inline-block;
        vertical-align: text-top;
        background: white;
        border: 1px solid #bbb;
        border-radius: 2px;
        box-sizing: border-box;
        z-index: 2;
}
.custom-checkbox input[type="checkbox"]:checked + label:after {
        content: '';
        position: absolute;
        left: 6px;
        top: 3px;
        width: 6px;
        height: 11px;
        border: solid #000;
        border-width: 0 3px 3px 0;
        transform: inherit;
        z-index: 3;
        transform: rotateZ(45deg);
}
.custom-checkbox input[type="checkbox"]:checked + label:before {
        border-color: #03A9F4;
        background: #03A9F4;
}
.custom-checkbox input[type="checkbox"]:checked + label:after {
        border-color: #fff;
}
.custom-checkbox input[type="checkbox"]:disabled + label:before {
        color: #b8b8b8;
        cursor: auto;
        box-shadow: none;
        background: #ddd;
}
/* Modal styles */
.modal .modal-dialog {
        max-width: 550px;
}
.modal .modal-header, .modal .modal .modal-footer {
        padding: 10px 20px;
        
}

.modal .modal-content {
 border-radius: 3px;
font-size: 14px;
padding:    40px 50px;


}      

.modal .modal-footer {
        background: #fff;
        border-radius: 0 0 10px 10px;
        
        
}
.modal .modal-title {
        display: inline-block;
}
.modal .form-control {
        border-radius: 2px;
        box-shadow: none;
        border-color: #dddddd;
        
        
}
.modal textarea.form-control {
        resize: vertical;
        
}
.modal .btn {
        border-radius: 2px;
        min-width: 100px;
        
}	
.modal form label {
        font-weight: normal;
}

                </style>
                <script>
                            $(document).ready(function () {
                                // Activate tooltip
                                $('[data-toggle="tooltip"]').tooltip();

                                // Select/Deselect checkboxes
                                var checkbox = $('table tbody input[type="checkbox"]');
                                $("#selectAll").click(function () {
                                    if (this.checked) {
                                        checkbox.each(function () {
                                            this.checked = true;
                                        });
                                    } else {
                                        checkbox.each(function () {
                                            this.checked = false;
                                        });
                                    }
                                });
                                checkbox.click(function () {
                                    if (!this.checked) {
                                        $("#selectAll").prop("checked", false);
                                    }
                                });
                            });
                </script>
            </head>                 
                                            <h1 align="center">Transacciones dentro del sistema</h1>
                                             <div align="right"><img src="escudo.jpg" width="80" height="80"></div>
                                        
                    <script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
    <script type="text/javascript">
      // Load the Visualization API and the corechart package.
      google.charts.load('current', {'packages':['corechart']});
      // Set a callback to run when the Google Visualization API is loaded.
      google.charts.setOnLoadCallback(drawChart);
      // Callback that creates and populates a data table,
      // instantiates the pie chart, passes in the data and
      // draws it.
      function drawChart() {
        // Create the data table.
        var data = new google.visualization.DataTable();
        data.addColumn('string', 'Topping');
        data.addColumn('number', 'Slices');
        data.addRows([
          ['Usuarios', 3],
          ['Cursos', 2],
          ['Refrigerios', 2]
        ]);

        // Set chart options
        var options = {'title':'Grafico de torta',
                       'width':900,
                       'height':800};

        // Instantiate and draw our chart, passing in some options.
        var chart = new google.visualization.PieChart(document.getElementById('chart_div'));
        
        chart.draw(data, options);
        
      }
    </script>
    <script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
    <script type="text/javascript">
      google.charts.load('current', {'packages':['bar']});
      google.charts.setOnLoadCallback(drawChart);

      function drawChart() {
        var data = google.visualization.arrayToDataTable([
          ['Meses', 'Usuarios', 'Cursos', 'Refrigerios'],
          ['Julio', 100, 200, 90],
          ['Agosto', 105, 201, 80],
          ['Septiembre', 110, 210, 230],
          ['Octubre', 103, 300, 200],
          ['Noviembre', 115, 330, 400],
          ['Diciembre', 120, 310, 200]
        ]);

        var options = {
          chart: {
            title: 'Grafico de barras',
            subtitle: 'Gestiones en el sistema en el ultimo semestre',
          }
        };

        var chart = new google.charts.Bar(document.getElementById('columnchart_material'));

        chart.draw(data, google.charts.Bar.convertOptions(options));
      }
    </script>
    </head>
    <body>
    <!--Div that will hold the pie chart-->
    <div id="chart_div"></div> 
    <div id="columnchart_material" style="width: 600px; height: 500px;"></div>
    <a href="Controlador?menu=Reporte&accion=GenerarReporte" onclick="print()" class="btn btn-success">Generar Reporte</a>
  </body>
</html>

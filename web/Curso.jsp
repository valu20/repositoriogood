<%@page import="Modelo.Curso"%>
<%@page import="Modelo.CursoDAO"%>
<%@page import="java.sql.Statement"%>
<%@page import="config.Conexion"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="utf-8" />
        <title>CURSOS</title>
        <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no" />
        <meta content="A fully featured admin theme which can be used to build CRM, CMS, etc." name="description" />
        <meta content="Coderthemes" name="author" />
        <meta http-equiv="X-UA-Compatible" content="IE=edge" />

        <!-- App favicon -->
        <link rel="shortcut icon" href="favicon.ico">
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">

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


    <body>
            

        <% CursoDAO curdao = new CursoDAO();
            ResultSet res = curdao.buscarlo(0, "0");
        %>
            


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
                                <a href="Controlador?accion=Listar&&menu=usuario"><i class="fas fa-user"></i><span> Usuarios </span></a>
                            </li>

                            <li>
                                <a href="Controlador?menu=Curso&accion=Listar" style="color:tomato"><i class="fas fa-graduation-cap"></i><span> Cursos </span></a>
                            </li>

                            <li>
                                <a href="Controlador?menu=Refrigerio&accion=Listar"><i class="fas fa-utensils"></i><span> Refrigerios </span></a>
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
            <div class="content-page">

                <!-- Top Bar Start -->
                <div class="topbar">

                    <nav class="navbar-custom">

                        <ul class="list-unstyled topbar-right-menu float-right mb-0">
                             <c:forEach var="cu" items="${numcurso}">
                                <form action="Controlador?menu=Curso&accion=BuscarCurso" method="POST">                           
                                    <li class="hide-phone app-search">                                                                                    
                                            <input type="text" name="numcurso" value="${c.getNum()}" placeholder="Buscar" class="form-control">
                                            <button type="submit" name="accion" value="BuscarCurso"><i class="fa fa-search"></i></button>                                        
                                    </li>                            
                                </form>
                                        
                            </c:forEach>
                            
                            
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
                                    <h4 class="page-title">Cursos</h4>
                                    <ol class="breadcrumb">
                                        <li class="breadcrumb-item"><a href="index.jsp">Inicio</a></li>
                                        <li class="breadcrumb-item"><a href="">Cursos</a></li>
                                    </ol>
                                </div>
                            </li>
                        </ul>
                    </nav>
                </div>
                <style>
                    .table-responsive {
                        margin: 20px 0;
                    }
                    .table-wrapper {
                        background: #fff;
                        padding: 10px 10px;
                        border-radius: 3px;
                        min-width: 1px;
                        box-shadow: 0 0 1px rgba(0,0,0,.05);
                    }
                    .table-title {        
                        padding-bottom: 15px;
                        background: #f85a40;
                        color: #fff;
                        padding: 16px 30px;
                        min-width: 100%;
                        margin: -10px -10px 10px;
                        border-radius: 3px 3px 0 0;
                    }
                    .table-title h2 {
                        margin: 1px 0 0;
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
                <body>
                    <div class="container-xl">
                        <div class="table-responsive">
                            <div class="table-wrapper">
                                <div class="table-title">                    
                                    <div class="row">
                                        <div class="col-sm-6">
                                            <h2>Lista <b>Cursos</b></h2>
                                        </div>
                                        <div class="col-sm-6">
                                            <a href="#addEmployeeModal" class="btn btn-success" data-toggle="modal"><i class="material-icons">&#xE147;</i> <span>Agregar Cursos</span></a>						
                                        </div>
                                    </div>
                                </div>
                                <table class="table table-striped table-hover">
                                    <thead>
                                        <tr>
                                            <th>Numero Curso</th>
                                            <th>Jornada Curso</th>
                                            <th>Cantidad Estudiantes</th>
                                            <th>Estado</th>
                                            <th>Aula</th>
                                            <th>Acciones</th>
                                        </tr>

                                    </thead>
                                    <tbody>
                                        <c:forEach var="val" items="${validar}">
                                        <script>${val}</script>
                                        </c:forEach>
                                    <c:forEach var="cu" items="${cursos}">
                                        <tr>
                                            <td>${cu.getNum()}</td>
                                            <td>${cu.getJor()}</td>
                                            <td>${cu.getCan()}</td>
                                            <td>${cu.getEst()}</td>
                                            <td>${cu.getAul()}</td>
                                            <td>
                                                <a href="#editEmployeeModal${cu.getId()}" class="edit" data-toggle="modal"><i class="material-icons" data-toggle="tooltip" title="Editar">&#xE254;</i></a>
                                                <div id="editEmployeeModal${cu.getId()}" class="modal fade">
                                                    <div class="modal-dialog">
                                                        <div class="modal-content">

                                                            <form action="Controlador?menu=Curso&accion=Actualizar&id=${cu.getId()}" method="POST">


                                                                <div class="">						
                                                                    <h4 class="modal-title">Editar Curso</h4>
                                                                    <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                                                                </div>
                                                                <br>
                                                                <div class="row">	
                                                                    <div class="col-sm-6">
                                                                        <label>Numero Curso</label>
                                                                        <input type="text"  value="${cu.getNum()}" name="txtNum" class="form-control" required>
                                                                    </div>
                                                                    <div class="col-md-6 ml-auto">
                                                                        <label>Jornada Curso</label>                                            
                                                                        <select value="${cu.getJor()}" name="txtJor" class="form-control">
                                                                            <option value="JM">JM</option> 
                                                                            <option value="JT">JT</option>
                                                                            <option value="JE">JE</option>
                                                                        </select>                                                
                                                                    </div>
                                                                    
                                                                    <div class="col-sm-6">
                                                                        <label>Cantidad Estudiantes</label>
                                                                        <input type="text" value="${cu.getCan()}" name="txtCan" class="form-control" required>
                                                                    </div>                                                                        
                                                                    <div class="col-sm-6">
                                                                        <label>Estado</label>
                                                                        <select name="txtEst" class="form-control">
                                                                            <option value="Activo">Activo</option>
                                                                            <option value="Inactivo">Inactivo</option>

                                                                        </select>
                                                                    </div>	
                                                                    <div class="col-md-6">
                                                                        <label>Aula</label>
                                                                        <select name="txtAul" class="form-control"> 
                                                                            <%ResultSet resu = curdao.buscarlo(0, "0");
                                                                                while (resu.next()) {
                                                                                    out.println("<option value=" + resu.getInt(1) + ">" + resu.getString(2) + "</option>");
                                                                                }%>
                                                                        </select>

                                                                    </div>	
                                                                </div>
                                                                <div class="modal-footer">
                                                                    <input type="button" class="btn btn-default" data-dismiss="modal" value="Cancelar">
                                                                    <input type="submit" class="btn btn-outline-light" style="background:tomato" value="Actualizar">
                                                                </div>
                                                            </form>
                                                        </div>
                                                    </div>
                                                </div>
                                                <a href="#deleteEmployeeModal${cu.getId()}" class="delete" data-toggle="modal"><i class="fas fa-toggle-on" title="inactivar">&#xE872;</i></a>
                                                <!-- Activa e Inactivar Modal HTML -->
                                                <div id="deleteEmployeeModal${cu.getId()}" class="modal fade">
                                                    <div class="modal-dialog">
                                                        <div class="modal-content">
                                                            <form action="Controlador?menu=Curso&accion=Activar&id=${cu.getId()}&estado=${cu.getEst()}" method="POST">
                                                                <div class="">
                                                                    <c:if test="${cu.getEst() eq 'Activo'}"> 
                                                                        <h4 class="modal-title">Inactivar Curso</h4>
                                                                    </c:if>
                                                                    <c:if test="${cu.getEst() eq 'Inactivo'}"> 
                                                                        <h4 class="modal-title">Activar Curso</h4>
                                                                    </c:if>
                                                                    <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                                                                </div>
                                                                <div class="modal-body">					
                                                                    <c:if test="${cu.getEst() eq 'Activo'}">
                                                                        <p>Esta seguro que desea inactivar este curso?</p>
                                                                    </c:if>
                                                                    <c:if test="${cu.getEst() eq 'Inactivo'}">

                                                                        <p>Esta seguro que desea Activar este curso?</p>
                                                                    </c:if>
                                                                </div>
                                                                <div class="modal-footer">
                                                                    <input type="button" class="btn btn-default" data-dismiss="modal" value="Cancelar">
                                                                    <c:if test="${cu.getEst() eq 'Activo'}"> 
                                                                        <input type="submit" name="estado" class="btn btn-danger" value="Inactivar">
                                                                    </c:if>
                                                                    <c:if test="${cu.getEst() eq 'Inactivo'}"> 
                                                                        <input type="submit" name="estado" class="btn btn-danger" value="Activar">
                                                                    </c:if>
                                                                </div>
                                                            </form>
                                                        </div>
                                                    </div>
                                                </div>
                                            </td>
                                        </tr>

                                    </c:forEach>


                                    </tbody>
                                </table>
                                <div class="clearfix">
                                    <div class="hint-text">Mostrando <b>5</b> de <b>10</b> datos</div>
                                    <ul class="pagination">
                                        <li class="page-item disabled"><a href="#">Anterior</a></li>
                                        <li class="page-item"><a href="#" class="page-link">1</a></li>
                                        <li class="page-item"><a href="#" class="page-link">2</a></li>
                                        <li class="page-item"><a href="#" class="page-link">Siguiente</a></li>
                                    </ul>
                                </div>
                            </div>
                        </div>        
                    </div>


            </div>
            <!-- Agregar Modal HTML -->
            <div id="addEmployeeModal" class="modal fade">
                <div class="modal-dialog">
                    <div class="modal-content">
                        <form action="Controlador?menu=Curso" method="POST">
                            <div class="modal-header">						
                                <h4 class="modal-title">Añadir Curso</h4>
                                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                            </div>
                            <br>
                            <div class="row">
                                <div class="col-md-6">
                                    <label>Numero Curso</label>

                                    <input type="number" name="txtNum"  class="form-control" maxlength="4" required pattern="[0-9]{3}">
                                </div>
                                <div class="col-md-6 ml-auto">
                                    <label>Jornada Curso</label>                                            
                                    <select name="txtJor" class="form-control">
                                        <option value="JM">JM</option> 
                                        <option value="JT">JT</option>
                                        <option value="JE">JE</option>
                                    </select>                                                
                                </div>
                                
                                
                                <br>

                                <div class="col-md-6">
                                    <label>Cantidad Estudiantes</label>

                                    <input type="number" name="txtCan" class="form-control" required>
                                </div>

                                <div class="col-md-6 ml-auto">
                                    <label>Estado</label>                                            
                                    <select name="txtEst" class="form-control">
                                        <option value="Activo">Activo</option> 
                                        <option value="Inactivo">Inactivo</option>
                                        <option value="En progreso">En progreso</option>
                                    </select>                                                
                                </div>
                                <div class="col-md-6">
                                    <label>Aula</label>
                                    <select name="txtAul" class="form-control" required>
                                        <%while (res.next()) {
                                                out.println("<option value=" + res.getInt(1) + ">" + res.getString(2) + "</option>");
                                            }%>
                                    </select>

                                </div>
                            </div>
                            <div class="modal-footer">
                                <input type="button" class="btn btn-light" data-dismiss="modal" value="Cancelar">
                                <input type="submit" name="accion" class="btn btn-outline-light" style="background:tomato" value="Agregar">
                            </div>
                        </form>
                    </div>
                </div>
            </div>

            <%request.getAttribute("validar");%> 

            ${validar} 
    </body>

</html>


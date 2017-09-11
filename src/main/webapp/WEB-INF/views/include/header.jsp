<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
  <head>
    <!-- META DATA -->
    <meta charset="UTF-8">
    <meta content='width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no' name='viewport'>

    <title>물어보자 관리시스템</title>

    <!-- STYLE -->
    <!-- Bootstrap 3.3.4 -->
    <link rel="stylesheet" href="/resources/bootstrap/css/bootstrap.css">
    <!-- Font Awesome Icons -->
    <link href="https://maxcdn.bootstrapcdn.com/font-awesome/4.3.0/css/font-awesome.min.css" rel="stylesheet" type="text/css" />
    <!-- Ionicons -->
    <link href="https://code.ionicframework.com/ionicons/2.0.1/css/ionicons.min.css" rel="stylesheet" type="text/css" />
    <!-- Theme style -->
    <link href="/resources/dist/css/AdminLTE.min.css" rel="stylesheet" type="text/css" />
    <!-- AdminLTE Skins. Choose a skin from the css/skins
         folder instead of downloading all of them to reduce the load. -->
    <link href="/resources/dist/css/skins/_all-skins.min.css" rel="stylesheet" type="text/css" />
    <!-- Custom Style -->
    <link href="/resources/bootstrap/css/style.css" rel="stylesheet">
    <!-- Datatable CSS -->
    <link rel="stylesheet" href=" https://cdn.datatables.net/1.10.15/css/jquery.dataTables.min.css">

	<!-- 데이터테이블 스킨 -->
    <link rel="stylesheet" href=" https://cdn.datatables.net/1.10.15/css/jquery.dataTables.min.css">
	


    <!-- SCRIPT -->
    <!-- jQuery 2.1.4 -->
    <script src="/resources/plugins/jQuery/jQuery-2.1.4.min.js"></script>
    <script src="/resources/bootstrap/js/bootstrap.min.js"></script>
	

    <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
        <script src="https://oss.maxcdn.com/html5shiv/3.7.2/html5shiv.min.js"></script>
        <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
    <![endif]-->
  </head>

  <body>

      <!-- HEADER -->
      <div class="container-fluid header">
        <div class="row">
          <div class="col-md-12">
            <img src="/resources/img/header.png" class="headerlogo">
          </div>
        </div>
      </div>

     <!-- NAVBAR -->
     <div id="nav-wrapper">
       <div id="nav" class="navbar navbar-default navbar-inner">
         <div class="container-fluid colorize">
           <div class="row">
             <div class="col-md-12">
               <!-- LEFT CONTENT -->
               <ul class="nav navbar-nav">
                 <li><a href="/stat">서비스현황</a></li>
                 <li><a href="#">회원관리</a></li>
                 <li><a href="/vote/">투표관리</a></li>
                 <li><a href="/quest">문의사항관리</a></li>
                 <li><a href="/report">신고관리</a></li>
                 <li><a href="/prohibit">금칙어관리</a></li>
                 <li><a href="/myPage">MyPage</a></li>
                 <li><a href="/manager">운영진관리</a></li>
               </ul>
               <!-- RIGHT CONTENT -->
              <ul class="nav navbar-nav navbar-right">
                 <li><a href="/myPage"><u>${login.getMngr_name() }님</u></a></li>
                 <li><a href="/logout"><button class="btn btn-default btn-xs">로그아웃</button></a></li>
              </ul>
            </div>
           </div> <!-- row -->
         </div> <!-- container -->
       </div> <!-- nav -->
     </div> <!-- wrapper -->

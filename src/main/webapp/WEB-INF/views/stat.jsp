<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ page session="true"%>

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

    <!-- SCRIPT -->
    <!-- jQuery 2.1.4 -->
    <script src="/resources/plugins/jQuery/jQuery-2.1.4.min.js"></script>
    <script src="/resources/bootstrap/js/bootstrap.min.js"></script>

    </script>

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
               <li><a href="#">서비스현황</a></li>
               <li><a href="#">회원관리</a></li>
               <li><a href="#">투표관리</a></li>
               <li><a href="#">문의사항관리</a></li>
               <li><a href="#">신고관리</a></li>
               <li><a href="#">금칙어관리</a></li>
               <li><a href="#">MyPage</a></li>
               <li><a href="#">운영진관리</a></li>
             </ul>
             <!-- RIGHT CONTENT -->
            <ul class="nav navbar-nav navbar-right">
               <li><a href="#"><u>###### 님</u></a></li>
               <li><a href="#"><button class="btn btn-default btn-xs">로그아웃</button></a></li>
            </ul>
         </div> <!-- row -->
       </div> <!-- container -->
     </div> <!-- nav -->
   </div> <!-- wrapper -->

   <div class="container-fluid">
     <div class="row">

       <!-- 가입자 / 탈퇴자 통계 -->
       <div class="col-md-6">
         <div class="box box-success">
           <div class="box-header with-border">
             <h3 class="box-title">가입자 / 탈퇴자</h3>
           </div>
           <div class="box-body">
             <div class="chart">
               <div class="">
                 <p><strong>총 가입자 수 : </strong></p>
                 <p><strong>총 탈퇴자 수 : </strong></p>
                 <ul class="nav nav-tabs jointab">
                   <li class="active"><a href="#tab1" data-toggle="tab">주간</a></li>
                   <li><a href="#tab2" data-toggle="tab">월간</a></li>
                 </ul>
                 <div class="tab-content">
                   <div class="tab-pane active fade in" id="tab1">
                    <canvas id="barChart1" width="500" height="300"></canvas>
                   </div>
                   <div class="tab-pane fade" id="tab2">
                      <canvas id="barChart2" width="500" height="300"></canvas>
                   </div>
                 </div>
               </div>
             </div>
           </div>
         </div>
       </div>

       <!-- 질문 글 통계 -->
       <div class="col-md-6">
         <div class="box box-warning">
           <div class="box-header with-border">
             <h3 class="box-title">질문 글</h3>
           </div>
           <div class="box-body">
             <div class="chart">
               <div class="">
                 <p><strong>전체 질문 글 : </strong></p>
                 <ul class="nav nav-tabs" style="margin-top:40px;">
                   <li class="active"><a href="#tab3" data-toggle="tab">주간</a></li>
                   <li><a href="#tab4" data-toggle="tab">월간</a></li>
                 </ul>
                 <div class="tab-content">
                   <div class="tab-pane active fade in" id="tab3">
                    <canvas id="barChart3" width="500" height="300"></canvas>
                   </div>
                   <div class="tab-pane fade" id="tab4">
                    <canvas id="barChart4" width="500" height="300"></canvas>
                   </div>
                 </div>
               </div>
             </div>
           </div>
         </div>
       </div>

       <!-- 문의글 통계 -->
       <div class="col-md-6">
         <div class="box box-info">
           <div class="box-header with-border">
             <h3 class="box-title">문의 글</h3>
           </div>
           <div class="box-body">
             <div class="chart">
               <div class="">
                 <p><strong>전체 문의 글 : </strong></p>
                 <p><strong>미처리된 문의 글 : </strong></p>
                 <p><strong>처리된 문의 글 : </strong></p>
                 <ul class="nav nav-tabs">
                   <li class="active"><a href="#tab5" data-toggle="tab">주간</a></li>
                   <li><a href="#tab6" data-toggle="tab">월간</a></li>
                 </ul>
                 <div class="tab-content">
                   <div class="tab-pane active fade in" id="tab5">
                    <canvas id="barChart5" width="500" height="300"></canvas>
                   </div>
                   <div class="tab-pane fade" id="tab6">
                    <canvas id="barChart6" width="500" height="300"></canvas>
                   </div>
                 </div>
               </div>
             </div>
           </div>
         </div>
       </div>

       <!--신고 글 통계 -->
       <div class="col-md-6">
         <div class="box box-danger">
           <div class="box-header with-border">
             <h3 class="box-title">신고 글</h3>
           </div>
           <div class="box-body">
             <div class="chart">
               <div class="">
                 <p><strong>전체 신고 글 : </strong></p>
                 <p><strong>미처리된 신고 글 : </strong></p>
                 <p><strong>처리된 신고 글 : </strong></p>
                 <ul class="nav nav-tabs">
                   <li class="active"><a href="#tab7" data-toggle="tab">주간</a></li>
                   <li><a href="#tab8" data-toggle="tab">월간</a></li>
                 </ul>
                 <div class="tab-content">
                   <div class="tab-pane active fade in" id="tab7">
                    <canvas id="barChart7" width="500" height="300"></canvas>
                   </div>
                   <div class="tab-pane fade" id="tab8">
                    <canvas id="barChart8" width="500" height="300"></canvas>
                   </div>
                 </div>
               </div>
             </div>
           </div>
         </div>
       </div>

     </div><!-- row -->
   </div><!-- container -->

   <!-- FOOTER -->
   <div class="container-fluid footer">
     <div class="row">
       <div class="col-md-12">
         <h6 class="footer-copy text-center"><strong>Copyright &copy; 2017-2018 <a href="#"> PlantyNet </a>.</strong>   All rights reserved.</h6>
       </div>
     </div>
   </div>


  <!-- Chart.js -->
  <script src="/resources/plugins/chartjs/Chart.js"></script>
  <script type="text/javascript">
    $(function () {

      var today = new Date();

      /* 바 그래프에 표시할 날짜(주간) labels */
      var week = new Array();
      for(var i=6; i>0; i--){
        var temp = "0"+(today.getMonth()+1) + "-" + (today.getDate()-i);
        week[6-i] = temp;
      };
      week[6] = today.toISOString().substr(5,5).replace('T','');

      /* 바 그래프에 표시할 월(월간) labels */
      var months = new Array();
      for(var i=5;i>0; i--){
        var temp = "0"+(today.getMonth()-i+1)+"월";
        months[5-i] = temp;
      }
      months[5]=today.getMonth()+1 + "월";

      /* 그래프 색상 데이터 */
      var colors = new Array(5);
      colors = ['#1FDA11','#8C8C8C','#FFBB00','#0055FF','#FF0000'];

      /*
        예제 데이터
        실 데이터 DB에서 Json 형태로 받아 오기
      */
      var weekDataArray = new Array(5);      // 데이터 가 들어갈 2차원 배열 (주간, 월간)
      var monthDataArray = new Array(5);

      for (var i = 0; i < weekDataArray.length; i++) {                  // 배열 난수로 초기화
        weekDataArray[i] = new Array(7);
        for (var j = 0; j < weekDataArray[i].length; j++) {
          weekDataArray[i][j] = Math.ceil(Math.random()*100);
        }
        monthDataArray[i] = new Array(6);
        for (var k = 0; k < monthDataArray[i].length; k++) {
          monthDataArray[i][k] = Math.ceil(Math.random()*100);
        }
      }


      /* 그래프 파싱 */
      var chartArray = new Array(8);

      for (var i = 0; i < chartArray.length+1; i++) {
        var temp = "#barChart" + (i+1);
        chartArray[i] = $(temp).get(0).getContext('2d');

        switch (i) {
          case 0:
            drawChart1(chartArray[i], week, weekDataArray[0], weekDataArray[1],colors[0],colors[1]);
            break;
          case 1:
            drawChart1(chartArray[i], months, monthDataArray[0], monthDataArray[1],colors[0],colors[1]);
            break;
          case 2:
            drawChart2(chartArray[i], week, weekDataArray[2],colors[2]);
          break;
          case 3:
            drawChart2(chartArray[i], months, monthDataArray[2],colors[2]);
            break;
          case 4:
            drawChart2(chartArray[i], week, weekDataArray[3],colors[3]);
            break;
          case 5:
            drawChart2(chartArray[i], months, monthDataArray[3],colors[3]);
            break;
          case 6:
            drawChart2(chartArray[i], week, weekDataArray[4],colors[4]);
            break;
          case 7:
            drawChart2(chartArray[i], months, monthDataArray[4],colors[4]);
            break;
          default:

        }
      }


      /* 바 그래프 그리기  (가입/탈퇴) */
      function drawChart1(barChartCanvas, dateArray, inDatas, outDatas, inColor, outColor){

        var barChart = new Chart(barChartCanvas);

        var areaChartData = {
             labels  : dateArray,
             datasets: [
               {
                 label               : 'Electronics',
                 fillColor           : inColor,
                 strokeColor         : 'rgba(210, 214, 222, 1)',
                 pointColor          : 'rgba(210, 214, 222, 1)',
                 pointStrokeColor    : '#c1c7d1',
                 pointHighlightFill  : '#fff',
                 pointHighlightStroke: 'rgba(220,220,220,1)',
                 data                : inDatas
               },
               {
                 label               : 'Digital Goods',
                 fillColor           :  '#1FDA11',
                 strokeColor         : 'rgba(60,141,188,0.8)',
                 pointColor          : '#3b8bba',
                 pointStrokeColor    : 'rgba(60,141,188,1)',
                 pointHighlightFill  : '#fff',
                 pointHighlightStroke: 'rgba(60,141,188,1)',
                 data                : outDatas
               }
             ]
           }
        var barChartData = areaChartData;
        barChartData.datasets[1].fillColor   =  outColor
        barChartData.datasets[1].strokeColor =  outColor
        barChartData.datasets[1].pointColor  =  outColor

        var barChartOptions                  = {
          //Boolean - Whether the scale should start at zero, or an order of magnitude down from the lowest value
          scaleBeginAtZero        : true,
          //Boolean - Whether grid lines are shown across the chart
          scaleShowGridLines      : true,
          //String - Colour of the grid lines
          scaleGridLineColor      : 'rgba(0,0,0,.05)',
          //Number - Width of the grid lines
          scaleGridLineWidth      : 1,
          //Boolean - Whether to show horizontal lines (except X axis)
          scaleShowHorizontalLines: true,
          //Boolean - Whether to show vertical lines (except Y axis)
          scaleShowVerticalLines  : true,
          //Boolean - If there is a stroke on each bar
          barShowStroke           : true,
          //Number - Pixel width of the bar stroke
          barStrokeWidth          : 1,
          //Number - Spacing between each of the X value sets
          barValueSpacing         : 5,
          //Number - Spacing between data sets within X values
          barDatasetSpacing       : 1,
          //String - A legend template
          legendTemplate          : '<ul class="<%=name.toLowerCase()%>-legend><% for (var i=0; i<datasets.length; i++){%><li><span style="background-color:<%=datasets[i].fillColor%>"></span><%if(datasets[i].label){%><%=datasets[i].label%><%}%></li><%}%></ul>',
          //Boolean - whether to make the chart responsive
          responsive              : false,
          maintainAspectRatio     : true
        }

        barChartOptions.datasetFill = false
        barChart.Bar(barChartData, barChartOptions)
      }

      /* 바 그래프 그리기  (가입/탈퇴 제외) */
      function drawChart2(barChartCanvas, dateArray, datas, color){

        var barChart = new Chart(barChartCanvas);

        var areaChartData = {
             labels  : dateArray,
             datasets: [
               {
                 label               : 'Digital Goods',
                 fillColor           :  color,
                 strokeColor         :  color,
                 pointColor          : '#3b8bba',
                 pointStrokeColor    : 'rgba(60,141,188,1)',
                 pointHighlightFill  : '#fff',
                 pointHighlightStroke: 'rgba(60,141,188,1)',
                 data                : datas
               }
             ]
           }
        var barChartData = areaChartData;

        var barChartOptions                  = {
          //Boolean - Whether the scale should start at zero, or an order of magnitude down from the lowest value
          scaleBeginAtZero        : true,
          //Boolean - Whether grid lines are shown across the chart
          scaleShowGridLines      : true,
          //String - Colour of the grid lines
          scaleGridLineColor      : 'rgba(0,0,0,.05)',
          //Number - Width of the grid lines
          scaleGridLineWidth      : 1,
          //Boolean - Whether to show horizontal lines (except X axis)
          scaleShowHorizontalLines: true,
          //Boolean - Whether to show vertical lines (except Y axis)
          scaleShowVerticalLines  : true,
          //Boolean - If there is a stroke on each bar
          barShowStroke           : true,
          //Number - Pixel width of the bar stroke
          barStrokeWidth          : 1,
          //Number - Spacing between each of the X value sets
          barValueSpacing         : 5,
          //Number - Spacing between data sets within X values
          barDatasetSpacing       : 1,
          //String - A legend template
          legendTemplate          : '<ul class="<%=name.toLowerCase()%>-legend"><% for (var i=0; i<datasets.length; i++){%><li><span style="background-color:<%=datasets[i].fillColor%>"></span><%if(datasets[i].label){%><%=datasets[i].label%><%}%></li><%}%></ul>',
          //Boolean - whether to make the chart responsive
          responsive              : false,
          maintainAspectRatio     : true
        }

        barChartOptions.datasetFill = false
        barChart.Bar(barChartData, barChartOptions)
      }
    });
  </script>
  </body>
</html>


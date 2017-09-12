<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>


<link rel="stylesheet" href="http://code.jquery.com/ui/1.8.18/themes/base/jquery-ui.css" type="text/css" />  
<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.7.1/jquery.min.js"></script>  
<script src="http://code.jquery.com/ui/1.8.18/jquery-ui.min.js"></script>  



<%@include file="include/header.jsp" %>

 
   <h2>운영진 관리</h2>
   
   <div class="box">
	<div class="box-body">
     <div class="input-group">
     </div>
	 <!-- DataTable로 운영진 리스트 출력 -->
	 <div class="col-md-6">
		 <h3>운영진 리스트</h3>
	 </div>
	 <div class="col-md-6" style="text-align:right">
		 <form style="display: inline;" name="managerCreate" method="get" action="/create">
			<button id="row" style="display:inline; height:40px; width:80px;" type="submit"><strong>계정 생성</strong></button>
		</form>
	 </div>
	 <table id="managerSelect" class="display" cellspacing="0" width="100%">
			<thead>
				<tr>
				<th style="text-align:center">사원번호</th>
				<th style="text-align:center">이름</th>
				<th style="text-align:center">아이디</th>
				<th style="text-align:center">소속</th>
				<th style="text-align:center">직책</th>
				<th style="text-align:center">권한</th>
				<th style="text-align:center">정보 변경</th>
				<th style="text-align:center">계정 삭제</th>
				</tr>
			</thead>	
	        <tbody style="text-align:center">
	        <c:forEach var="mngr" items="${mngrVO}">
			<tr>
			<td>${mngr.emp_no}</td>
			<td>${mngr.mngr_name}</td>
			<td>${mngr.mngr_id}</td>
			<td>${mngr.department}</td>
			<td>${mngr.position}</td>
			<td>${mngr.authority}</td>
			<td>
				<form style="display: inline;" name="managerUpdate"
					method="post" action="/managerUpdate">
					<button class="fa fa-pencil-square-o" id="managerUpdate" onclick="managerUpdate()" 
						style="height:30px; width:40px;"></button>
				</form>
			</td>
			<td>
				<form style="display: inline;" name="managerDelete"
					method="post" action="/managerDelete">
					<button class="fa fa-trash" id="managerDelete" onclick="managerDelete()" 
						style="height:30px; width:40px;"></button>
				</form>
			</td>
			</tr>
			</c:forEach>
	        </tbody>
	</table>
	
	
	 
	<div class="col-md-12">
		 <h3>처리 현황</h3>
	</div>
	<p>기간 설정: 
		<input type="text" id="datepicker1">
		  ~  
		<input type="text" id="datepicker2">
        <button class="fa fa-search" id="datepicker()" onclick="datepicker()" style="height:30px; width:40px;"></button>
	</p>
	 
	<div class="col-md-2"></div>
	<div class="col-md-8">
     	<div class="chart">
             <canvas id="barChart" width="400" height="100"></canvas>
        </div>
    </div>
    
   </div>	
  </div>
  
  <div id="popupWrapper" style="display:none;"></div>



<%@include file="include/footer.jsp" %>


<!-- jQuery 2.2.3 -->
<script src="/resources/plugins/jQuery/jQuery-2.1.4.min.js"></script>
<!-- Bootstrap 3.3.6 -->
<script src="/resources/bootstrap/js/bootstrap.min.js"></script>
<!-- DataTables -->
<script src="/resources/plugins/datatables/jquery.dataTables.min.js"></script>
<script src="/resources/plugins/datatables/dataTables.bootstrap.min.js"></script>
<!-- SlimScroll -->
<script src="/resources/plugins/slimScroll/jquery.slimscroll.min.js"></script>
<!-- FastClick -->
<script src="/resources/plugins/fastclick/fastclick.js"></script>
<!-- AdminLTE App -->
<script src="/resources/dist/js/app.min.js"></script>
<!-- AdminLTE for demo purposes -->
<script src="/resources/dist/js/demo.js"></script>
<script src="/resources/plugins/jQuery/jquery.bpopup.min.js"></script>

<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>

<script src="/resources/plugins/chartjs/Chart.js"></script>

<script type="text/javascript"></script>

<script>
    	var managerSelect = $("#managerSelect").DataTable({
           "language" : {
   				'paginate'		: {
   					"first"			: "처음",
   					"last"			: "마지막",
   					"next"			: "다음",
   					"previous"		: "이전"
   				}
   			},
   		   "scrollY"		: 400,
   		   "scrollCollapse" : true,
           "pagingType"		: "full_numbers",
           "lengthChange": false,
           "searching": false,
    	   "paging": true,
           "info": false, 
           "ordering": false,   
           "autoWidth": false,
           "dom":  '<"top"<"col-md-12"B>>' +
		 		   'rt' +
		    		'<"bottom"<"col-md-8"p><"col-md-4"B>>'
    		});
    		
    	
    	$( function() {
    	     $( "#datepicker1" ).datepicker();
    	     $( "#datepicker2" ).datepicker();
    	 });

    	
    	
    	  $(function () {
    	    var barChartCanvas        = $('#barChart').get(0).getContext('2d')
    	    var barChart              = new Chart(barChartCanvas)
    	    var barChartData = {
      	      labels  : ['김규식', '정연태', '김주승', '홍재혁', '이상순', '박정인', '김대경', '이길여'],
      	      datasets: [
      	        {
      	          label               : 'Electronics',
      	          fillColor           : 'rgba(210, 214, 222, 1)',
      	          strokeColor         : 'rgba(210, 214, 222, 1)',
      	          pointColor          : 'rgba(210, 214, 222, 1)',
      	          pointStrokeColor    : '#c1c7d1',
      	          pointHighlightFill  : '#fff',
      	          pointHighlightStroke: 'rgba(220,220,220,1)',
      	          data                : [32, 38, 14, 33, 15, 33, 44, 22]
      	        },
      	        {
      	          label               : 'Digital Goods',
      	          fillColor           : 'rgba(60,141,188,0.9)',
      	          strokeColor         : 'rgba(60,141,188,0.8)',
      	          pointColor          : '#3b8bba',
      	          pointStrokeColor    : 'rgba(60,141,188,1)',
      	          pointHighlightFill  : '#fff',
      	          pointHighlightStroke: 'rgba(60,141,188,1)',
      	          data                : [13, 15, 32, 24, 22, 27, 30, 45]
      	        }
      	      ]
      	    }
    	    barChartData.datasets[1].fillColor   = '#00a65a'
    	    barChartData.datasets[1].strokeColor = '#00a65a'
    	    barChartData.datasets[1].pointColor  = '#00a65a'
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
    	      barStrokeWidth          : 2,
    	      //Number - Spacing between each of the X value sets
    	      barValueSpacing         : 5,
    	      //Number - Spacing between data sets within X values
    	      barDatasetSpacing       : 1,
    	      
    	      //Boolean - whether to make the chart responsive
    	      responsive              : true,
    	      maintainAspectRatio     : true
    	    }

    	    barChartOptions.datasetFill = false
    	    barChart.Bar(barChartData, barChartOptions)
    	  })
    	  
    	  

	$("#questYetSelect").click(function(){
		createPopup();
    });
	  
	function createPopup(){
		$.ajax({
			
		type:"GET",
		url:"/manager/create",
		dataType:"html",
		success:function(data){
		$("#popupWrapper").bPopup({
			follow: [true, true],
		    position: [465, 0] 
		});
		$("#popupWrapper").html(data);
				
		},
		error:function(request, status){
			$("#popupWrapper").hide();
			alert("팝업 오류");
		}
		});
	}

</script>
</body>
</html>

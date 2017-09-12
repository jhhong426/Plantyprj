<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page session="true"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="include/header.jsp"%>
<head>

<!-- DataPicker -->
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
	href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<script>
	  $( function() {
		    $( "#reportPreDate" ).datepicker({dateFormat: "yy-mm-dd"});
		  });
	  $( function() {
		    $( "#reportPostDate" ).datepicker({dateFormat: "yy-mm-dd"});
		  });
	  $( function() {
		    $( "#questPreDate" ).datepicker({dateFormat: "yy-mm-dd"});
		  });
	  $( function() {
		    $( "#questPostDate" ).datepicker({dateFormat: "yy-mm-dd"});
		  });
  </script>
</head>


<body>
	<h1>My 정보</h1>

	<p>ID : ${login.getMngr_id()}</p>
	<p>이름 : ${login.getMngr_name()}</p>
	<p>사원번호 : ${login.getEmp_no()}</p>
	<p>소속부서 : ${login.getDepartment()}</p>
	<p>직책 : ${login.getPosition()}</p>
	<p>권한 : ${login.getAuthority()}</p>


	<h1>비밀번호 변경</h1>

	<a href="/editPW"><button>비밀번호 변경</button></a>

	<div class="box">
		<div class="box-header">
			<h3>처리된 문의 : 000건</h3>
		</div>
		<div class="box-body">
			<div class="col-md-1">
				<h4>기간 설정 :</h4>
			</div>

			<div class="col-md-4">
				<input type="text" id="questPreDate"> ~ <input type="text"
					id="questPostDate">
			</div>

			<div class="col-md-1">
				<button id="questDoneSearch" onclick="questDoneSearch()">검색</button>
			</div>
			<table id="question" class="display" cellspacing="0" width="100%">
				<thead>
					<tr>
						<th style="text-align: center">등록번호</th>
						<th style="text-align: center">문의 유형</th>
						<th style="text-align: center">제목</th>
						<th style="text-align: center">문의시간</th>
						<th style="text-align: center">문의자</th>
						<th style="text-align: center">담당자</th>
						<th style="text-align: center">답변완료 시간</th>
					</tr>
				</thead>
				<tbody style="text-align: center">
					<c:forEach var="Done" items="${questDoneSelect}">
						<tr>
							<td>${Done.quest_no}</td>
							<td>${Done.quest_category}</td>
							<td>${Done.title}</td>
							<td>${Done.reg_date}</td>
							<td>${Done.email}</td>
							<td>${Done.mngr_id}</td>
							<td>${Done.cmpl_date}</td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
		</div>
	</div>



	<div class="box">
		<div class="box-header">
			<h3>처리된 신고 : 000건</h3>
		</div>
		<div class="box-body">
			<div class="col-md-1">
				<h4>기간 설정 :</h4>
			</div>

			<div class="col-md-4">
				<input type="text" id="reportPreDate"> ~ <input type="text"
					id="reportPostDate">
			</div>

			<div class="col-md-1">
				<button id="reportDoneSearch" onclick="reportDoneSearch()">검색</button>
			</div>
			<table id="report" class="display" cellspacing="0" width="100%">
				<thead>
					<tr>
						<th style="text-align: center">등록번호</th>
						<th style="text-align: center">신고 유형</th>
						<th style="text-align: center">신고 사유</th>
						<th style="text-align: center">신고자</th>
						<th style="text-align: center">담당자</th>
						<th style="text-align: center">접수 시간</th>
						<th style="text-align: center">처리 완료 시간</th>
						<th style="text-align: center">처리 유형</th>
						<th style="text-align: center">신고된 투표 글</th>
					</tr>
				</thead>
				<tbody style="text-align: center">
					<c:forEach var="reportDoneVO" items="${reportDoneVO}">
						<tr>
							<td>${reportDoneVO.report_no}</td>
							<td>${reportDoneVO.report_category}</td>
							<td>${reportDoneVO.report_contents}</td>
							<td>${reportDoneVO.email}</td>
							<td>${reportDoneVO.mngr_id}</td>
							<td>${reportDoneVO.reg_date}</td>
							<td>${reportDoneVO.cmpl_date}</td>
							<td>${reportDoneVO.answer_category}</td>
							<td>${reportDoneVO.survey_no}</td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
		</div>
	</div>


	<!-- page script -->
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
	<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>



	<!-- page script -->
	<script>
	<!--
	function dateCheck(inputDate, point){
        var dateElement = new Array(3);
        
        if(point != ""){
            dateElement = inputDate.split(point);
            if(inputDate.length != 10 || dateElement.length != 3){
                return false;
            }
        }else{
            dateElement[0] = inputDate.substring(0,4);
            dateElement[1] = inputDate.substring(4,6);
            dateElement[2] = inputDate.substring(6,9);
        }
        


        return true;
    }
	-->

		$(function() {
			$("#question")
					.DataTable(
							{
								"language" : {
									'zeroRecords' : "검색결과가 없습니다.",
									'info' : "문의 글 수 :  _TOTAL_ 개",
									'infoEmpty' : "문의 글 수 :  _TOTAL_ 개",
									'infoFiltered' : " ",
									"lengthMenu" : "출력 개수 :  _MENU_",
									'paginate' : {
										"first" : "처음",
										"last" : "마지막",
										"next" : "다음",
										"previous" : "이전"
									}

								},
								"lengthMenu" : [ 15, 25, 50 ],
								"lengthChange" : true,
								"searching" : true,
								"paging" : true,
								"ordering" : false,
								"info" : true,
								"autoWidth" : false,
								"dom" : '<"top"<"col-md-4"i><"col-md-6"B><"col-md-2"l>>'
										+ 'rt'
										+ '<"bottom pull-left"<"col-md-12"p>>'

							})
		});

		$(function() {
			$("#report")
					.DataTable(
							{
								"language" : {
									'zeroRecords' : "검색결과가 없습니다.",
									'info' : "질문 글 수 :  _TOTAL_ 개",
									'infoEmpty' : "질문 글 수 :  _TOTAL_ 개",
									'infoFiltered' : " ",
									"lengthMenu" : "출력 개수 :  _MENU_",
									'paginate' : {
										"first" : "처음",
										"last" : "마지막",
										"next" : "다음",
										"previous" : "이전"
									}

								},
								"lengthMenu" : [ 15, 25, 50 ],
								"lengthChange" : true,
								"searching" : true,
								"paging" : true,
								"ordering" : false,
								"info" : true,
								"autoWidth" : false,
								"dom" : '<"top"<"col-md-4"i><"col-md-6"B><"col-md-2"l>>'
										+ 'rt'
										+ '<"bottom pull-left"<"col-md-12"p>>'

							})
		});
		
	
		var dateParsing =  function(arg) {
			var splitArg = arg.split("-");
			var stringArg = splitArg[0]+splitArg[1]+splitArg[2];
			var intArg = parseInt(stringArg);
			return intArg;
		};
		
		
		

		
		function questDoneSearch(){
			$.fn.dataTable.ext.search.push(
				    function( settings, data, dataIndex ) {
				        var min = parseInt( dateParsing($('#questPreDate').val()) );
				        var max = parseInt( dateParsing($('#questPostDate').val()) );
				        var age = parseFloat( dateParsing(data[6]) ) || 0; // use data for the age column
				 
				        console.log("최소값" + min);
				        console.log("최대값 :" + max);
				        console.log("에이징: "+  age);
				        
				        if ( ( isNaN( min ) && isNaN( max ) ) ||
				             ( isNaN( min ) && age <= max ) ||
				             ( min <= age   && isNaN( max ) ) ||
				             ( min <= age   && age <= max ) )
				        {
				            return true;
				        }
				        return false;
				    }
				);
			
				$("#question").DataTable().draw();
		}
		
		function reportDoneSearch() {
		}
		

	</script>
</body>

<%@ include file="include/footer.jsp"%>
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
	$(function() {
		$("#reportPreDate").datepicker({
			dateFormat : "yy-mm-dd"
		});
	});
	$(function() {
		$("#reportPostDate").datepicker({
			dateFormat : "yy-mm-dd"
		});
	});
	$(function() {
		$("#questPreDate").datepicker({
			dateFormat : "yy-mm-dd"
		});
	});
	$(function() {
		$("#questPostDate").datepicker({
			dateFormat : "yy-mm-dd"
		});
	});
</script>
</head>


<body>
	<h1>내 정보</h1>

	<br>

	<div class="form-group">

		<div class="row">
			<div class="col-md-3">
				<label for="">I&emsp;&emsp;D&emsp;:&emsp;${login.getMngr_id()}</label>
			</div>

			<div class="col-md-3">
				<label for="">이&emsp;&emsp;름&emsp;:&emsp;${login.getMngr_name()}</label>
			</div>
			<div class="col-md-3">
				<label for="">사원번호&emsp;:&emsp;${login.getEmp_no()}</label>
			</div>
		</div>

		<div class="row">
			<div class="col-md-3">
				<label for="">소속부서&emsp;&emsp;:&emsp;${login.getDepartment()}</label>
			</div>

			<div class="col-md-3">
				<label for="">직&emsp;&emsp;책&emsp;:&emsp;${login.getPosition()}</label>
			</div>

			<div class="col-md-3">
				<label for="">권&emsp;&emsp;한&emsp;:&emsp;${login.getAuthority()}</label>
			</div>
		</div>
	</div>
	<br>

	<hr>


	<h1>비밀번호 변경</h1>

	<br>

	<button type="button" id="modifyPW"
		class="btn btn-primary inline-block col-md-offset-0"
		onclick="modify()">비밀번호 변경</button>

	<br>

	<hr>

	<div class="box">
		<div class="box-header">
			<div id="questionCnt"></div>
		</div>
		<div class="box-body">

			<div class="col-md-4">
				<h4 class="inline">기간 설정 :</h4>
				&emsp;&emsp;<input type="text" id="questPreDate" class="inline">&emsp;~&emsp;<input
					type="text" id="questPostDate" class="inline">&emsp;&emsp;&emsp;
				<button class="fa fa-search" id="questDoneSearch"
					onclick="questDoneSearch()" style="height: 30px; width: 40px;"></button>
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
			<div id="reportCnt"></div>
		</div>
		<div class="box-body">

			<div class="col-md-4">
				<h4 class="inline">기간 설정 :</h4>
				&emsp;&emsp;<input type="text" id="reportPreDate" class="inline">&emsp;~&emsp;<input
					type="text" id="reportPostDate" class="inline">&emsp;&emsp;&emsp;
				<button class="fa fa-search" id="reportDoneSearch"
					onclick="reportDoneSearch()" style="height: 30px; width: 40px;"></button>
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

	<!-- 레이어 팝업  Wrapper-->
	<div id="popupWrapper" style="display: none;"></div>

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
	<script src="/resources/plugins/jQuery/jquery.bpopup.min.js"></script>



	<!-- page script -->
	<script>
		$(function() {
			$("#question")
					.DataTable(
							{
								"language" : {
									'zeroRecords' : "검색결과가 없습니다.",
									'info' : "처리된 문의 :  _TOTAL_ 개",
									'infoEmpty' : "처리된 문의 :  _TOTAL_ 개",
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

							}).columns(5).search("${login.getMngr_id()}")
					.draw();
		});

		$(function() {
			$("#report")
					.DataTable(
							{
								"language" : {
									'zeroRecords' : "검색결과가 없습니다.",
									'info' : "처리된 신고 :  _TOTAL_ 개",
									'infoEmpty' : "처리된 신고 :  _TOTAL_ 개",
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

							}).columns(4).search("${login.getMngr_id()}")
					.draw();
		});

		function questinoInit() {
			$('#question').DataTable().columns().search("").draw();

		}
		function reportInit() {
			$('#report').DataTable().columns().search("").draw();

		}

		var dateParsing = function(arg) {
			var splitArg = arg.split("-");
			var stringArg = splitArg[0] + splitArg[1] + splitArg[2];
			var intArg = parseInt(stringArg);
			return intArg;
		};

		function questDoneSearch() {

			questionInit();
			$.fn.dataTable.ext.search.push(function(settings, data, dataIndex) {
				var min = parseInt(dateParsing($('#questPreDate').val()));
				var max = parseInt(dateParsing($('#questPostDate').val()));
				var age = parseFloat(dateParsing(data[6])) || 0; // use data for the age column

				console.log("최소값" + min);
				console.log("최대값 :" + max);
				console.log("에이징: " + age);

				if ((isNaN(min) && isNaN(max)) || (isNaN(min) && age <= max)
						|| (min <= age && isNaN(max))
						|| (min <= age && age <= max)) {
					return true;
				}
				return false;
			});

			$("#question").DataTable().draw();
		}

		$("#questPreDate, #questPostDate").keydown(function(key) {

			if (key.keyCode == 13) {
				questDoneSearch();
			}
		});

		function reportDoneSearch() {
			reportInit();
			$.fn.dataTable.ext.search.push(function(settings, data, dataIndex) {
				var min = parseInt(dateParsing($('#reportPreDate').val()));
				var max = parseInt(dateParsing($('#reportPostDate').val()));
				var age = parseFloat(dateParsing(data[6])) || 0; // use data for the age column

				console.log("최소값" + min);
				console.log("최대값 :" + max);
				console.log("에이징: " + age);

				if ((isNaN(min) && isNaN(max)) || (isNaN(min) && age <= max)
						|| (min <= age && isNaN(max))
						|| (min <= age && age <= max)) {
					return true;
				}
				return false;
			});

			$("#report").DataTable().draw();

		}

		$("#reportPreDate, #reportPostDate").keydown(function(key) {

			if (key.keyCode == 13) {
				reportDoneSearch();
			}
		});

		// 수정 팝업 출력
		function modify() {

			openMemberInfoPopup();
		}

		// 수정 팝업의 정보
		function openMemberInfoPopup() {

			$.ajax({
				type : "GET",
				url : "/myPage/modifyPW",
				data : {

				},
				dataType : "html",
				success : function(data) {
					$("#popupWrapper").bPopup({
						follow : [ true, true ],
						position : [ 700, 40 ]
					});
					$("#popupWrapper").html(data);

				},
				error : function(request, status) {
					$("#popupWrapper").hide();
					alert("팝업 오류");
				}
			});
		}
	</script>
</body>

<%@ include file="include/footer.jsp"%>
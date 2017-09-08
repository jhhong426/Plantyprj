<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page session="false"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@include file="include/header.jsp"%>

<div class="box">
	<div class="box-header">
		<h1>미처리 신고사항</h1>
	</div>
	<div class="box-body">
		<div class="row">
			<div class="col-md-1">
				<h4>검색</h4>
			</div>
			<div class="col-md-2">
				<select id="yetCategory" class="form-control form-group-inline"
					onchange="yetCategoryChange()" style="display: inline-block">
					<option value="3">신고자</option>
					<option value="1">신고유형</option>
				</select>
			</div>
			<div class="col-md-3">
				<input type="text" id="yetInput" class="form-control"></input>
			</div>
			<div class="col-md-1">
				<button id="yetSearch" onclick="yetSearch()">미처리 검색</button>
			</div>
		</div>

		<table id="report1" class="display" cellspacing="0" width="100%">
			<thead>
				<tr>
					<th style="text-align: center">등록번호</th>
					<th style="text-align: center">신고유형</th>
					<th style="text-align: center">신고사유</th>
					<th style="text-align: center">신고자</th>
					<th style="text-align: center">접수시간</th>
					<th style="text-align: center">신고된 질문 글</th>
				</tr>
			</thead>
			<tbody style="text-align: center">
				<c:forEach var="voNot" items="${reportYetVO}">
					<tr>
						<td>${voNot.report_no}</td>
						<td>${voNot.report_category}</td>
						<td>${voNot.report_contents}</td>
						<td>${voNot.email}</td>
						<td>${voNot.reg_date}</td>
						<td>${voNot.survey_no}</td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
	</div>
	<br /> <br /> <br />

</div>


<div class="box">
	<div class="box-header">
		<h1>처리 신고사항</h1>
	</div>
	<div class="box-body">
		<div class="col-md-1">
			<h4>검색</h4>
		</div>

		<div class="col-md-2">
			<select id="doneCategory" class="form-control form-group-inline"
				onchange="DoneCategoryChange()" style="display: inline-block">
				<option value="3">신고자</option>
				<option value="1">신고유형</option>
				<option value="4">담당자</option>
			</select>
		</div>
		<div class="col-md-6">
			<input type="text" id="doneInput" class="form-control"></input>
		</div>
		<div class="col-md-1">
			<button id="doneSearch" onclick="doneSearch()">처리 검색</button>
		</div>
		<table id="report2" class="display" cellspacing="0" width="100%">
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
					<th style="text-align: center">신고된 질문 글</th>
				</tr>
			</thead>
			<tbody style="text-align: center">
				<c:forEach var="voCmpl" items="${reportDoneVO}">
					<tr>
						<td>${voCmpl.report_no}</td>
						<td>${voCmpl.report_category}</td>
						<td>${voCmpl.report_contents}</td>
						<td>${voCmpl.email}</td>
						<td>${voCmpl.mngr_id}</td>
						<td>${voCmpl.reg_date}</td>
						<td>${voCmpl.cmpl_date}</td>
						<td>${voCmpl.answer_category}</td>
						<td>${voCmpl.survey_no}</td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
	</div>
</div>





<%@include file="include/footer.jsp"%>

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
<!-- page script -->
<script>
	$(function() {
		$("#report1, #report2").DataTable(
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
							+ 'rt' + '<"bottom pull-left"<"col-md-12"p>>'

				})
	});

	function yetSearch() {
		var yetCategoryNum = $("#yetCategory option:selected").val();
		console.log(yetCategoryNum);
		$('#report1').DataTable().columns(yetCategoryNum).search(
				$('#yetInput').val()).draw();
		console.log("yet Input:" + $('#yetInput').val());
	}

	function doneSearch() {
		var doneCategoryNum = $("#doneCategory option:selected").val();
		console.log(doneCategoryNum);
		$('#report2').DataTable().columns(doneCategoryNum).search(
				$('#doneInput').val()).draw();
		console.log("done Search" + $('#doneInput').val());
	}

	function DoneCategoryChange() {
	}
	function yetCategoryChange() {
	}
</script>
</body>
</html>
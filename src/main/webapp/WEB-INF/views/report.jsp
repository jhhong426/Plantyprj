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
			<div class="col-md-3" id="yetDynamicCategory">
				<input type="text" id="yetInput" class="form-control"></input>
			</div>
			<div class="col-md-1">
				<button id="yetSearch" onclick="yetSearch()">미처리 검색</button>
			</div>
		</div>

		<table id="report1" class="table table-bordered table-hover display">
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
				onchange="doneCategoryChange()" style="display: inline-block">
				<option value="3">신고자</option>
				<option value="1">신고유형</option>
				<option value="4">담당자</option>
			</select>
		</div>
		<div class="col-md-3" id="doneDynamicCategory">
			<input type="text" id="doneInput" class="form-control"></input>
		</div>
		<div class="col-md-1">
			<button id="doneSearch" onclick="doneSearch()">처리 검색</button>
		</div>
		<table id="report2" class="table table-bordered table-hover display">
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


<!-- 레이어 팝업  Wrapper-->
	        <div id="popupWrapper" style="display:none;">
	        
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
 <script src="/resources/plugins/jQuery/jquery.bpopup.min.js"></script>
<!--  bpopup -->
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
		if ($("#yetCategory option:selected").val() == 1) { //yetCategory -> 신고자(value='3'), 신고유형(value='1')을 담은 카테고리    
			var yetCategoryInput = $("#yetCategoryInput option:selected").val(); //yetCategoryInput ->욕설, 성적표현, 정치적발연, 기타의 값을 가지고 있음 ,yetCategoryChange에서 동저긍로 생성
			$('#report1').DataTable().columns(1).search(yetCategoryInput)
					.draw();//미처리 신고테이블($('#report1').DataTable())의 신고유형(columns(1))에서 동적카테고리값을 찾아(search(YetCategoryInput)) 테이블 리로딩 draw();    
		} else {
			var yetCategoryNum = $("#yetCategory option:selected").val(); //yetCategory -> 신고자(value='3'), 신고유형(value='1')을 담은 카테고리에서 선택된 값을 yetCategoryNum에 담음
			var yetInput = $('#yetInput').val() //인풋창에 키보드로 입력한 값
			$('#report1').DataTable().columns(yetCategoryNum).search(yetInput)
					.draw(); //테이블에서 컬럼YetCategoryNum의 값이 yetInput과 일치하는 값을 찾고 리로딩
		}
	}

	function doneSearch() {
		if ($("#doneCategory option:selected").val() == 1) {
			var doneCategoryInput = $("#doneCategoryInput option:selected")
					.val();
			$('#report2').DataTable().columns(1).search(doneCategoryInput)
					.draw();
			console.log("done DynamicInput:" + $('#doneDynamicInput').val());
		} else {
			var doneCategoryNum = $("#doneCategory option:selected").val();
			var doneInput = $('#doneInput').val();
			$('#report2').DataTable().columns(doneCategoryNum)
					.search(doneInput).draw();
		}
	}

	function yetCategoryChange() {
		if ($("#yetCategory option:selected").val() == 1) {
			$("#yetDynamicCategory")
					.html(
							"<select id='yetCategoryInput' class='form-control form-group-inline'"
						+"style='display: inline-block'>"
									+ "<option value='욕설'>욕설</option>"
									+ "<option value='성적표현'>성적표현</option>"
									+ "<option value='정치적발언'>정치적발언</option>"
									+ "<option value='기타'>기타</option>"
									+ "</select>");
		} else {
			$("#yetDynamicCategory")
					.html(
							"<input type='text' id='yetInput' class='form-control'></input>");
		}
	}

	function doneCategoryChange() {
		if ($("#doneCategory option:selected").val() == 1) {
			$("#doneDynamicCategory")
					.html(
							"<select id='doneCategoryInput' class='form-control form-group-inline'"
					+"style='display: inline-block'>"
									+ "<option value='욕설'>욕설</option>"
									+ "<option value='성적표현'>성적표현</option>"
									+ "<option value='정치적발언'>정치적발언</option>"
									+ "<option value='기타'>기타</option>"
									+ "</select>");
		} else {
			$("#doneDynamicCategory")
					.html(
							"<input type='text' id='doneInput' class='form-control'></input>");
		}
	}

	$("#report1 tr").dblclick(function() {
		var reportNo = $(this).children("td").eq(0).text();
		console.log("reportNo클릭:"+reportNo);
		openReportInfoPopup(reportNo);
	});

	
	$("#report2 tr").dblclick(function() {
		var reportNo = $(this).children("td").eq(0).text();
		console.log("reportNo클릭:"+reportNo);
		openReportInfoPopup(reportNo);
	});

	function openReportInfoPopup(selectedReportNo) {
		console.log("openReportInfoPopup Function gogo");
		 
		$.ajax({
			type : "GET",
			url : "/report/info",
			data : {
				reportNo : selectedReportNo
			},
			dataType : "html",
			success : function(data) {
				$("#popupWrapper").bPopup({
					follow : [ true, true ],
					position : [ 150, 40 ]
				});
				$("#popupWrapper").html(data);

			},
			error : function(request, status) {
				$("#popupWrapper").hide();
				alert("리뷰 팝업 오류");
			}
		});
	}
	
</script>

<%@include file="include/footer.jsp"%>

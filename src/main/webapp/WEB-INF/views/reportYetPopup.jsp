<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page session="true"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<div class="box box-primary">
	<div class="box-header with-border">
		<div class="box-title">
			<p>신고 처리 결과</p>
		</div>
	</div>

	<div class="box-body">
		<div class="col-md-6">


			<div class="form-group">

				<div class="row">
					<div class="center-block" style="width: 600px; padding: 5px 15px;">
						<label for="">등록번호</label> <input type="text" name=""
							value="${survyInfo.survey_no}" disabled> <label for="">작성자</label>
						<input type="text" name="" value="${survyInfo.email}" disabled>
					</div>
				</div>
				<div class="row">
					<div class="center-block" style="width: 600px; padding: 5px 15px;">
						<label for="">작성일</label> <input type="text" name=""
							value="${survyInfo.reg_date}" disabled> <label for="">투표시간</label>
						<input type="text" name="" value="${survyInfo.limit_time}"
							disabled>
					</div>
				</div>
				<div class="row">
					<div class="center-block" style="width: 600px; padding: 5px 15px;">
						<label for="">진행상태</label>
						<c:choose>
							<c:when test="${survyInfo.status == 'SS00'}">
								<input type="text" name="" value="투표 진행중" disabled>
							</c:when>

							<c:when test="${survyInfo.status == 'SS01'}">
								<input type="text" name="" value="투표 완료" disabled>
							</c:when>

							<c:when test="${survyInfo.status == 'SS02'}">
								<input type="text" name="" value="블라인드" disabled>
							</c:when>
							<c:otherwise>
								<input type="text" name="" value="투표 진행중" disabled>
							</c:otherwise>
						</c:choose>
						<label for="">신고건수</label> <input type="text" name=""
							value="${survyInfo.reported_cnt}" disabled>
					</div>

				</div>

				<div class="form-group">
					<label>투표내용</label>
					<textarea class="form-control" rows="8" cols="30" disabled>${survyInfo.survey_contents}</textarea>
				</div>

				<table id="surveyTable" class="table table-bordered">
					<tbody>
						<tr>
							<th>선택지</th>
							<th>투표자 수</th>
							<th>남자</th>
							<th>여자</th>
						</tr>
						<c:forEach items="${survyResult}" var="result">
							<tr>
								<td>${result.item}</td>
								<td>${result.male_score + result.female_score}</td>
								<td>${result.male_score}</td>
								<td>${result.female_score}</td>
							</tr>
						</c:forEach>

					</tbody>
				</table>
			</div>
		</div>


		<div class="col-md-6">

			<form action="/report_answerInsert" onsubmit="onSubmitFunction()"
				method="post">


				<div class="row">
					<div class="center-block" style="width: 600px; padding: 5px 15px;">
						<label for="">신고글 번호</label> <input type="text" name="report_no"
							value="${vo.report_no}" readOnly> <label>신고자</label> <input
							name="report_email" type="text" value="${vo.email}" readOnly>
					</div>
				</div>

				<div class="row">
					<div class="center-block" style="width: 600px; padding: 5px 15px;">
						<label for="">신고유형</label> <input type="text"
							name="report_category" value="${vo.report_category}" readOnly>
						<label for="">접수시간</label> <input type="text" name="reg_date"
							value="${vo.reg_date}" readOnly>
					</div>
				</div>

				<div class="row">
					<div class="center-block" style="width: 600px; padding: 5px 15px;">
						<label>신고사유</label>
						<textarea class="form-control" rows="3" cols="30" readOnly>${vo.report_contents}</textarea>
					</div>
				</div>

				<div class="row">
					<div class="center-block" style="width: 600px; padding: 5px 15px;">

						<label for="">담당자</label> <input type="text" name="mngr_id"
							value="${login.getMngr_id()}" readOnly id="mngr_id"> <label for="">처리시간</label>
						<input type="text" name="" value="" readOnly>

					</div>
					<div class="center-block" style="width: 600px; padding: 5px 15px;">
						<label>처리유형</label> <select id="answer_category"
							name="answer_category" class="form-control form-group-inline"
							onchange="answerCategoryChange()" style="display: inline-block">
							<option value="1">이상없음</option>
							<option value="2">블라인드</option>
						</select>
					</div>


					<div class="center-block" style="width: 600px; padding: 5px 15px;">
						<label>답변내용</label>
						<textarea class="form-control" name="answer_contents" rows="5"
							cols="30"></textarea>
						<label>금칙어 추가</label> <input type="text" id="answerCategoryInput"
							name="popupWord">
						<button id="createBtn" style="display: inline;" type="button"
							onclick="return validateInsert()">추가</button>
					</div>

					<div class="col-md-5"></div>

					<div class="col-md-5">
						<button id="btnSubmit" type="submit" class="btn btn-primary ">등록</button>
						<button id="btnClosePopup" type="button" class="btn btn-primary">취소</button>
					</div>
				</div>
				<input type="hidden" name="survey_no" value="${survyInfo.survey_no}">
				<input type="hidden" name="survey_email" value="${survyInfo.email}">

			</form>
		</div>
	</div>
</div>

<script src="/resources/plugins/jQuery/jQuery-2.1.4.min.js"></script>
<script src="/resources/plugins/jQuery/jquery.bpopup.min.js"></script>
<script type="text/javascript">
	$("#btnClosePopup").click(function() {
		$("#popupWrapper").bPopup().close();
	});

	function validateInsert() {
		var insertWord = $('#answerCategoryInput').val();
		if (confirm(insertWord + "를 삽입하시겠습니까 ?")) {
			
			var _mngr_id = $("#mngr_id").val();
			jQuery.ajax({
				type : "get",
				url : "/reportRegister",
				data : {
					"popupWord" : insertWord,
					"mngr_id" : _mngr_id
				},
				success : function(data) {
					alert(data + "가 금칙어에 추가되었습니다.");
				},
				error : function(xhr, status, error) {
					alert("에러발생");
				}
			});

		} else {
			alert("ss");
		}
	}

	function onSubmitFunction() {
		if (confirm("등록하시겠습니까?")) {
			return true;
		} else {
			return false;
		}

	}

	$("#btnClosePopup").click(function() {
		$("#popupWrapper").bPopup().close();
	});
</script>



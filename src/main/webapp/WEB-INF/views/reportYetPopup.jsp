<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page session="false"%>
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
							value="343543" readOnly> <label for="">작성자</label> <input
							type="text" name="" value="zajan91@nasver.com" readOnly>
					</div>
				</div>
				<div class="row">
					<div class="center-block" style="width: 600px; padding: 5px 15px;">
						<label for="">작성일</label> <input type="text" name=""
							value="15-11-24 14:34:33" readOnly> <label for="">투표시간</label>
						<input type="text" name="" value="30분" disabled>
					</div>
				</div>
				<div class="row">
					<div class="center-block" style="width: 600px; padding: 5px 15px;">
						<label for="">진행상태</label> <input type="text" name="" value="완료"
							readOnly> <label for="">신고건수</label> <input type="text"
							name="" value="1" readOnly>
					</div>

				</div>

				<div class="form-group">
					<label>투표내용</label>
					<textarea class="form-control" rows="8" cols="30" readOnly>전지현이 이쁨, 송혜교가 이쁨</textarea>
				</div>

				<table class="table table-bordered">
					<tbody>
						<tr>
							<th>선택지</th>
							<th>투표자 수</th>
							<th>남자</th>
							<th>여자</th>
						</tr>
						<tr>
							<td>선택지1</td>
							<td>40</td>
							<td>30</td>
							<td>10</td>
						</tr>
						<tr>
							<td>선택지2</td>
							<td>40</td>
							<td>30</td>
							<td>10</td>
						</tr>
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
							value="${vo.report_no}" readOnly> <label>신고자</label>
						<input type="text" value="${vo.email}" readOnly>
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
						<label for="">담당자</label> <input type="text" name="mngr_id" value="${login.mngr_id}" readOnly> 
							<label for="">처리시간</label> <input type="text" name="" value="" readOnly>
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
						<button id="createBtn" style="display: inline;" type="submit"
							onclick="return validateInsertForm()">추가</button>
					</div>

					<div class="col-md-5"></div>

					<div class="col-md-5">
						<button id="btnSubmit" type="submit" class="btn btn-primary ">등록</button>
						<button id="btnClosePopup" type="button" class="btn btn-primary">취소</button>
					</div>
				</div>
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

	function validateInsertForm() {
		var insertWord = $('#answerCategoryInput').val();
		if (confirm(insertWord + "를 삽입하시겠습니까 ?")) {
			jQuery.ajax({
				type : "get",
				url : "/reportRegister",
				data : {
					"popupWord" : insertWord
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



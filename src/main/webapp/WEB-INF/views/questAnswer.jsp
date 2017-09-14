<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page session="true"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<div class="box box-primary">
	<div class="box-header with-border">
	</div>
	<div class="box-body">
		<!--  <c:forEach var="questAnswerSelect" items="${questAnswerSelect}"> -->
			<div class="form-group">
				<div class="row">
					<div class="center-block" style="width: 600px; padding: 15px;">
						<label for="">등록번호</label> 
						<input type="text" name="" value="${questAnswerSelect.quest_no}" disabled> 
						&emsp; &emsp; &emsp; &emsp; &emsp; &emsp; &emsp;
						<label for="">문의유형</label> 
						<input type="text" name="" value="${questAnswerSelect.quest_category}" disabled>
					</div>
				</div>
				<div class="row">
					<div class="center-block" style="width: 600px; padding: 15px;">
						<label for="">문&ensp;의&ensp;자</label> 
						<input type="text" name="" value="${questAnswerSelect.email}" disabled> 
						&emsp; &emsp; &emsp; &emsp; &emsp; &emsp; &emsp;
						<label for="">문의시간</label> 
						<input type="text" name="" value="${questAnswerSelect.reg_date}" disabled>
					</div>
				</div>
				<div class="row">
					<div class="center-block" style="width: 600px; padding: 15px;">
						<label for="">제 &emsp; &ensp; 목 </label> 
						<input type="text" style="width: 490px;" value="${questAnswerSelect.title}" disabled>
					</div>
				</div>
				<div class="form-group">
					<label for="">문의 내용</label>
					<p>
					<textarea type="text" rows="5" cols="90" disabled>${questAnswerSelect.quest_contents}</textarea>
				</div>
			</div>

			<hr />

			<h3>답변 작성</h3>
			<form style="display: inline;" name="insertAnswer" method="post" action="/quest/insertAnswer" onsubmit="return validateConfirmForm()">
			<div class="form-group">
				<div class="row">
					<div class="center-block" style="width: 600px; padding: 15px;">
						<label for="">담&ensp;당&ensp;자</label> 
						<input type="text" name="mngr_id" value="${login.getMngr_id()}" readOnly>
						&emsp; &emsp; &emsp; &emsp; &emsp; &emsp; &emsp;
						<label for="">답변시간</label> 
						<input type="text" name="" value="" disabled>
					</div>
				</div>
			</div>
			<div class="form-group">
					<label for="">답변 작성</label>
					<p>
						<input type="hidden" name="quest_no" value="${questAnswerSelect.quest_no}">
						<textarea type="text" id="answer_contents" rows="5" cols="90" name="answer_contents"></textarea>
						<p>
						<button id="btnRegistPopup" style="float:left" type="submit" name="insertAnswer" class="btn btn-primary inline-block col-md-offset-4">등록</button>
						<button id="btnClosePopup" style="float:left" type="button" name="closeBtn" class="btn btn-danger inline-block col-md-offset-1">취소</button>
			</div>
			</form>
			<!-- </c:forEach>  -->
		</div>
	</div>




<script src="/resources/plugins/jQuery/jQuery-2.1.4.min.js"></script>
<script src="/resources/plugins/jQuery/jquery.bpopup.min.js"></script>
<script type="text/javascript">

	// 팝업창 '취소' 버튼 클릭시 close 하기
	$("#btnClosePopup").click(function() {
		$("#popupWrapper").bPopup().close();
	});
	
	// 답변을 등록하시겠습니까?  확인 Alert 띄우기
	function validateConfirmForm() {
		if (confirm("답변을 등록하시겠습니까?")) {
			return true;
		} else {
			return false;
		}
	}
	
	
</script>



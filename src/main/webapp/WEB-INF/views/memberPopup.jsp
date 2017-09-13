<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@ page session="true"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<div class="box box-primary">
	<div class="box-header with-border">
		<div class="box-title">
			<p>회원 정보 수정</p>
		</div>
	</div>

	<div class="box-body">
		<div class="form-group">

			<form class="frmMemberInfoUpdate" action="/member/update"
				method="POST" >


				<div class="row">
					<div class="center-block" style="width: 600px; padding: 15px;">
						<label for=""></label> <input type="hidden" id="mber_no" name="mber_no"
							value="${member.mber_no}">
					</div>
					<div class="center-block" style="width: 600px; padding: 15px;">
						<label for="">전화번호</label> <input type="text" id="phone" name="phone"
							value="${member.phone}">
					</div>
				</div>
				<div class="row">
					<div class="center-block" style="width: 600px; padding: 15px;">
						<label for="">생년월일</label> <input type="text" id="birth" name="birth"
							value="${member.birth}">
					</div>
				</div>
				<div class="row">
					<div class="center-block" style="width: 600px; padding: 15px;">
						<label for="">이메일</label> <input type="text" id="email" name="email"
							value="${member.email}">
					</div>
				</div>
				<div class="row">
					<div class="center-block" style="width: 600px; padding: 15px;">
						<label for="">성별</label> <input type="text" id="gender" name="gender"
							value="${member.gender}">
					</div>
					>
				</div>
			</form>

			<hr>

			<div class="row">
				<div class="center-block" style="width: 600px; padding: 15px;">
					<label for="">질문수 : ${member.survey_cnt} </label>
				</div>
				<div class="center-block" style="width: 600px; padding: 15px;">
					<label for="">신고수 : ${member.report_cnt}</label>
				</div>
			</div>
			<div class="row">
				<div class="center-block" style="width: 600px; padding: 15px;">
					<label for="">투표수 : ${member.vote_cnt}</label>
				</div>
				<div class="center-block" style="width: 600px; padding: 15px;">
					<label for="">피신고수 : ${member.reported_cnt}</label>
				</div>
			</div>
			<div class="row">
				<div class="center-block" style="width: 600px; padding: 15px;">
					<label for="">문의수 : ${member.quest_cnt }</label>

				</div>
			</div>
		</div>

		<hr>

		<div class="box-footer">
			<button id="btnUpdatePopup" type="button" name="button"
				class="btn btn-primary center-block">저장</button>
			<button id="btnClosePopup" type="button" name="button"
				class="btn btn-primary center-block">취소</button>
		</div>
	</div>
</div>

<script src="/resources/plugins/jQuery/jQuery-2.1.4.min.js"></script>
<script src="/resources/plugins/jQuery/jquery.bpopup.min.js"></script>
<script type="text/javascript">
	// 변경 정보 UPDATE
	$("#btnUpdatePopup")
			.click(
					function() {
						var memberNo = $(".frmMemberInfoUpdate").serialize();

						if ($("#phone").val() != '' && $("#email").val() != ''
								&& $("#birth").val() != ''
								&& $("#gender").val() != '') {

							$.ajax({
								type : "POST",
								url : "/member/update",
								data : memberNo,
								success : function() {

									window.location.reload();
									alert("수정 완료");

								},

								error : function(request, status) {
									alert("수정 중 에러발생");
								}
							});
							
							return true;

						} else {

							alert("비어있는 항목을 마저 작성해주세요!!");
							
							return false;

						}

					});

	$("#btnClosePopup").click(function() {
		$("#popupWrapper").bPopup().close();
	});
</script>
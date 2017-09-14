<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ page session="true"%>


<div style="width: 350px; padding: 15px;">
	<div class="box box-danger center-block">
		<div class="box-header with-border">
			<p>비밀번호 변경</p>
		</div>
		<div class="box-body">
			<form name="frmModifyPW" class="frmModifyPW" action="/myPage/modifyPW" method="POST"
				onSubmit="return frmChk();">
				<input type="hidden" name="mngr_no" id="mngr_no"
					value="${login.getMngr_no()}" />
				<div class="center-block" style="width: 600px; padding: 15px;">
					<label for="">현재 비밀번호</label> <input type="password"
						name="password" id="password" placeholder="현재 비밀번호" /> <br>
				</div>

				<div class="center-block" style="width: 600px; padding: 15px;">
					<label for="">변경 비밀번호</label> <input type="password" name="newPW"
						id="newPW" placeholder="변경 비밀번호" /> <br>
				</div>

				<div class="center-block" style="width: 600px; padding: 15px;">
					<label for="">변경 비밀번호</label> <input type="password" name="chkPW"
						id="chkPW" placeholder="변경 비밀번호 확인" /> <br>
				</div>

			</form>
			<div class="center-block">
				<button id="btnModifyPW" class="btn btn-danger pull-left" onclick="frmChk()" >비밀번호 변경</button>
				<button id="btnClosePopup" class="btn btn-primary pull-right">취소</button>
			</div>

		</div>
	</div>
</div>


<script src="/resources/plugins/jQuery/jQuery-2.1.4.min.js"></script>
<script src="/resources/plugins/jQuery/jquery.bpopup.min.js"></script>
<script type="text/javascript">

$("#password, #newPW, #chkPW").keydown(function(key) {

	if (key.keyCode == 13) {
		frmChk();
	}
});


	
function frmChk(){
	
	var frm = document.frmModifyPW;
	var _data = $(".frmModifyPW").serialize();
	
	
	if(frm.password.value=='') {
		
		alert("현재 비밀번호를 입력하세요!!");
		
		frm.password.focus();
		
	} else if(frm.newPW.value=='') {
		
		alert("변경할 비밀번호를 입력하세요!!");  
		
		frm.newPW.focus();
		
	} else if(frm.chkPW.value=='') {
		
		alert("변경 비밀번호 확인을 위해 다시 한 번 더 입력하세요!!");  
		
		frm.chkPW.focus();
		
	} else if (frm.newPW.value != frm.chkPW.value){
		
		alert("변경할 비밀번호가 불일치합니다!");
		
		frm.newPW.focus();
					
	} else {
		
		if (frm.newPW.value.length<6||frm.newPW.value.length>18) {
			
			alert("비밀번호를 6~18자리로 입력해주세요!");
			
			frm.newPW.focus();
			
		} else {
		
		$.ajax({
			type : "POST",
			url : "/myPage/modifyPW",
			data : _data,
			success : function(result) {

				if(result.flag){
					window.location.reload();
					alert("변경 완료");
					
				}else {
					alert("비밀번호가 일치하지 않습니다.");
				}
			},

			error : function(request, status) {
				alert("변경 중 에러발생");
				
				return false;
			}
		});
		
		}
		
		}
}


$("#btnClosePopup").click(function() {
	$("#popupWrapper").bPopup().close();
});
</script>

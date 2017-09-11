<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>

                  
  	      <div style="width:350px; padding:15px;">
        	<div class="box box-danger center-block">
        		<div class="box-header with-border">
        			<p>슈퍼 관리자 비밀번호 확인</p>
        		</div>
        		<div class="box-body">
        			<form id="frmSuperPwCheck" action="/vote/confirm" method="POST" class="form-group frmForDelete">
        				<input id="password" type="password" name="inputPassword" class="form-control"/>
        			</form>
        			<div class="center-block">
        				<button id="btnPwCheck" class="btn btn-primary">확인</button>
        				<button id="btnClosePopup" class="btn btn-danger">취소</button>
        			</div>
        			
        		</div>
        	</div>
         </div>
         
         
<script src="/resources/plugins/jQuery/jQuery-2.1.4.min.js"></script>
<script src="/resources/plugins/jQuery/jquery.bpopup.min.js"></script>
<script type="text/javascript">
	
	//확인 버튼 클릭 시 비밀번호 확인 및 질문 글 삭제
	$("#btnPwCheck").click(function(){
		
		var _data = $(".frmForDelete").serialize();
			
		$.ajax({
			type: "post",
			url: "/vote/confirm",
			data: _data,
			success: function(result){
			
				if(result.flag){
					window.location.reload();
					alert("삭제 완료");
				}
				else{
					alert("비밀번호가 일치 하지 않습니다.");
					$("#password").val('');
				}
			},
			
			error:function(request,status){
	   			alert("팝업 에러");
	   		}
		});
		
	});
	
	//취소 버튼 클릭 시 팝업 종료
	$("#btnClosePopup").click(function(){
		 $("#popupWrapper").bPopup().close();
	}); 
   
</script>

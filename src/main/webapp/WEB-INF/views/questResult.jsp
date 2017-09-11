<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<div class="box box-primary">
	<div class="box-header with-border">
		<div class="box-title">
        	<p>문의사항 답변결과</p>
        </div>
    </div>
        <div class="box-body">
          <div class="form-group">
            <div class="row">
              <div class="center-block" style="width:600px; padding:15px;">
                <h5><strong>등록번호</strong></h5>
                <input type="text" name="" value="1234" disabled>
                <h5><strong>문의유형</strong></h5>
                <input type="text" name="" value="투표" disabled>
              </div>
            </div>
            <div class="row">
              <div class="center-block" style="width:600px; padding:15px;">
                <h5><strong>제목</strong></h5>
                <input type="text" name="" value="질문 등록이 되지 않습니다." disabled>
                <h5><strong>문의시간</strong></h5>
                <input type="text" name="" value="2017-08-15 16:44:25" disabled>
              </div>
            </div>
            <div class="row">
              <div class="center-block" style="width:600px; padding:15px;">
                <h5><strong>문의자</strong></h5>
                <input type="text" name="" value="abc@gmail.com" disabled>
              </div>
            </div>
            <div class="form-group">
              <h5><strong>투표내용</strong></h5>
              <textarea class="form-control" rows="8" cols="30" disabled>
                            왜 안됩니까!!!
              </textarea>
            </div>
          </div>
          
          <hr /> 
          
          <h3>답변 작성</h3>
          <div class="form-group">
            <div class="row">
              <div class="center-block" style="width:600px; padding:15px;">
                <h5><strong>담당자</strong></h5>
                <input type="text" name="" value="admin123" disabled>
         		<h5><strong>답변시간</strong></h5>
                <input type="text" name="" value="" disabled>
         	  </div>
            </div>
           <div class="form-group">
              <h5><strong>내용</strong></h5>
              <textarea class="form-control" rows="8" cols="30" disabled>
              - 개발팀에 서비스 오류 문의
              - 회원 가입 간 발생 한 오류로 회원가입이 제대로 이루어지지 않은 것으로 확인. 해당 고객분께 안내 후 재가입 유도(17.08.14)     
              </textarea>
           </div>
       </div>
             
        <div class="box-footer">
          <button id="btnCheckPopup" type="button" name="button" class="btn btn-primary center-block">확인</button>
        </div>
      </div>
      
      
      
      
<script src="/resources/plugins/jQuery/jQuery-2.1.4.min.js"></script>
<script src="/resources/plugins/jQuery/jquery.bpopup.min.js"></script>
<script type="text/javascript">
      
	$("#btnClosePopup").click(function(){
		$("#popupWrapper").bPopup().close();
	}); 
 
</script>
      
      

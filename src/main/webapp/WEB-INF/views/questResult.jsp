<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="true" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<div class="box box-primary">
	<div class="box-header with-border">
    </div>
        <div class="box-body">
        <c:forEach var="questResultSelect" items="${questResultSelect}">
          <div class="form-group">
            <div class="row">
              <div class="center-block" style="width:600px; padding:15px;">
                <label for="">등록번호</label>
                <input type="text" name="" value="${questResultSelect.quest_no}" disabled>
                &emsp; &emsp; &emsp; &emsp; &emsp; &emsp;
                <label for="">문의유형</label>
                <input type="text" name="" value="${questResultSelect.quest_category}" disabled>
              </div>
            </div>
            <div class="row">
              <div class="center-block" style="width:600px; padding:15px;">
                <label for="">문&ensp;의&ensp;자</label>
                <input type="text" name="" value="${questResultSelect.email}" disabled>
                &emsp; &emsp; &emsp; &emsp; &emsp; &emsp;
                <label for="">문의시간</label>
                <input type="text" name="" value="${questResultSelect.reg_date}" disabled>
              </div>
            </div>
            <div class="row">
              <div class="center-block" style="width:600px; padding:15px;">
                <label for="">제 &emsp; &ensp; 목 </label>
                <input type="text" style="width:490px;" name="" value="${questResultSelect.title}" disabled>
              </div>
            </div>
            <div class="form-group">
              <label for="">문의 내용</label>
              <p>
              <textarea type="text" rows="5" cols="85" disabled>${questResultSelect.quest_contents}</textarea>
            </div>
          </div>
          
          <hr /> 
          
          <h3>답변 작성</h3>
          <div class="form-group">
            <div class="row">
              <div class="center-block" style="width:600px; padding:15px;">
                <label for="">담&ensp;당&ensp;자</label>
                <input type="text" name="" value="${questResultSelect.mngr_id}" disabled>
                &emsp; &emsp; &emsp; &emsp; &emsp; &emsp; 
         		<label for="">답변시간</label>
                <input type="text" name="" value="${questResultSelect.cmpl_date}" disabled>
         	  </div>
            </div>
           <div class="form-group">
              <label for="">답변 내용</label>
              <p>
              <textarea type="text" rows="5" cols="85" disabled>${questResultSelect.answer_contents}</textarea>
           </div>
       </div>
             
        <div class="box-footer">
          <button id="btnClosePopup" type="button" name="button" class="btn btn-primary center-block">확인</button>
        </div>
        </c:forEach>
      </div>
      </div>
      
      
      
      
<script src="/resources/plugins/jQuery/jQuery-2.1.4.min.js"></script>
<script src="/resources/plugins/jQuery/jquery.bpopup.min.js"></script>
<script type="text/javascript">
      
	$("#btnClosePopup").click(function(){
		$("#popupWrapper").bPopup().close();
	}); 
 
</script>
      
      

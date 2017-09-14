<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="true" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>



<div class="box box-primary">
	<form style="display: inline;" name="updateManager" method="post" action="/update" onsubmit="return validateConfirmForm()">
	<div class="box-header with-border">
		<div class="box-title">
        	<p><strong>관리자 계정 수정</strong></p>
        </div>
    </div>
	<c:forEach var="updateManagerSelect" items="${updateManagerSelect}">
        <div class="box-body">
          <div class="form-group">
            <div class="row">
              <div class="center-block" style="width:600px; padding:15px;">
                <label for="">사원번호</label>
                <input type="text" name="" value="${updateManagerSelect.emp_no}" disabled>
                 &emsp; &emsp; &emsp; &emsp; &emsp;
                <label for="">아 &ensp;이&ensp;디</label>
                <input type="text" name="" value="${updateManagerSelect.mngr_id}" disabled>
              </div>
            </div>
            
            <div class="row">
              <div class="center-block" style="width:600px; padding:15px;">
                <label for="">이 &emsp; &ensp; 름 </label>
                <input type="text" name="mngr_name" value="${updateManagerSelect.mngr_name}">
                 &emsp; &emsp; &emsp; &emsp; &emsp;
                <label for="">소 &emsp; &ensp; 속 </label>
                <input type="text" name="department" value="${updateManagerSelect.department}">
              </div>
            </div>
            <div class="row">
              <div class="center-block" style="width:600px; padding:15px;">
                <label for="">직 &emsp; &ensp; 책 </label>
                <input type="text" name="position" value="${updateManagerSelect.position}">
                 &emsp; &emsp; &emsp; &emsp; &emsp;
                <label for="">권 &emsp; &ensp; 한 </label>
                <input type="text" name="authority" value="${updateManagerSelect.authority}">
                <!-- <select id="" class="form-control form-group-inline"
                    style="display:inline-block">
                    <option value="1">오퍼레이터</option>
                    <option value="2">슈퍼관리자</option>
                </select> -->
            </div>
            </div>
          </div>

          <hr />
       </div>

        <div class="box-footer">
       	  <input type="hidden" name = "mngr_no" value="${updateManagerSelect.mngr_no}">
          <button id="btnUpdatePopup" style="float:left" type="submit" name="updateManager" class="btn btn-primary inline-block col-md-offset-4">수정</button>
		  <button id="btnClosePopup" style="float:left" type="button" name="closeBtn" class="btn btn-danger inline-block col-md-offset-1">취소</button>
        </div>
        </c:forEach>
        </form>
      </div>



    
<script src="/resources/plugins/jQuery/jQuery-2.1.4.min.js"></script>
<script src="/resources/plugins/jQuery/jquery.bpopup.min.js"></script>
<script type="text/javascript">
      
	$("#btnClosePopup").click(function(){
		$("#popupWrapper").bPopup().close();
	}); 
	
	// 정보를 수정하시겠습니까?  확인 Alert 띄우기
	function validateConfirmForm() {
		if (confirm("정보를 수정하시겠습니까?")) {
			return true;
		} else {
			return false;
		}
	}
 
</script>
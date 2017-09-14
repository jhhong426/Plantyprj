<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="true" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<div class="box box-primary">
	<form style="display: inline;" name="registManager" method="post" action="/create" onsubmit="return validateConfirmForm()">
	<div class="box-header with-border">
		<div class="box-title">
        	<p><strong>관리자 계정 생성</strong></p>
        </div>
    </div>
        <div class="box-body">
          <div class="form-group">
            <div class="row">
              <div class="center-block" style="width:600px; padding:15px;">
                <label for="">사원번호</label>
                <input type="text" name="emp_no" value="${registManager.emp_no}">
                &emsp; &emsp; &emsp; &emsp; &emsp;
                <label for="">이 &emsp; &ensp; 름 </label>
                <input type="text" name="mngr_name" value="${registManager.mngr_name}">
              </div>
            </div>
           
            <div class="row">
              <div class="center-block" style="width:600px; padding:15px;">
                <label for="">아 &ensp;이&ensp;디</label>
                <input type="text" name="mngr_id" value="${registManager.mngr_id}">
                &emsp; &emsp; &emsp; &emsp; &emsp;
                <label for="">비밀번호</label>
                <input type="text" name="password" value="${registManager.password}">
              </div>
            </div>
            
            <div class="row">
              <div class="center-block" style="width:600px; padding:15px;">
                <label for="">소 &emsp; &ensp; 속 </label>
                <input type="text" name="department" value="${registManager.department}">
                &emsp; &emsp; &emsp; &emsp; &emsp;
                <label for="">직 &emsp; &ensp; 책 </label>
                <input type="text" name="position" value="${registManager.position}">
              </div>
            </div>
     
            <div class="row">
              <div class="center-block" style="width:600px; padding:15px;">
                <label for="">권 &emsp; &ensp; 한 </label>
                <input type="text" name="authority" value="${registManager.authority}">
                <!-- <select id="optionSelect" name="authority" MULTIPLE class="form-control form-group-inline" style="display:inline-block">
                    <option value="1">Operator</option>
                    <option value="2">Super</option>
                </select> -->
              </div>
            </div>
          </div>
          <hr />
       </div>
        <div class="box-footer">
          <button id="btnRegistPopup" style="float:left" type="submit" name="registManager" class="btn btn-primary inline-block col-md-offset-4">생성</button>
		  <button id="btnClosePopup" style="float:left" type="button" name="closeBtn" class="btn btn-danger inline-block col-md-offset-1">취소</button>
        </div>
     </form>
   </div>

    
<script src="/resources/plugins/jQuery/jQuery-2.1.4.min.js"></script>
<script src="/resources/plugins/jQuery/jquery.bpopup.min.js"></script>
<script type="text/javascript">
      
	$("#btnClosePopup").click(function(){
		$("#popupWrapper").bPopup().close();
	}); 
	
	// 계정을 등록하시겠습니까?  확인 Alert 띄우기
	function validateConfirmForm() {
		if (confirm("계정을 등록하시겠습니까?")) {
			return true;
		} else {
			return false;
		}
	}

</script>

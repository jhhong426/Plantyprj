<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<div class="box box-primary">
	<div class="box-header with-border">
		<div class="box-title">
        	<p>관리자 계정 생성</p>
        </div>
    </div>

        <div class="box-body">
          <div class="form-group">
            <div class="row">
              <div class="center-block" style="width:600px; padding:15px;">
                <label for="">사원번호</label>
                 <input type="text" name="" value="">
              </div>
            </div>
            <div class="row">
              <div class="center-block" style="width:600px; padding:15px;">
                <label for="">이름</label>
                 <input type="text" name="" value="">
              </div>
            </div>
            <div class="row">
              <div class="center-block" style="width:600px; padding:15px;">
                <label for="">아이디</label>
                 <input type="text" name="" value="">
              </div>
            </div>
            <div class="row">
              <div class="center-block" style="width:600px; padding:15px;">
                <label for="">비밀번호</label>
                <input type="text" name="" value="">
              </div>
            </div>
            <div class="row">
              <div class="center-block" style="width:600px; padding:15px;">
                <label for="">소속</label>
                 <input type="text" name="" value="">
              </div>
            </div>
            <div class="row">
              <div class="center-block" style="width:600px; padding:15px;">
                <label for="">직책</label>
                 <input type="text" name="" value="">
              </div>
            </div>
            <div class="row">
              <div class="center-block" style="width:600px; padding:15px;">
                <label for="">권한</label>
                  <select id="" class="form-control form-group-inline"
                    onchange="" style="display:inline-block">
                    <option value="1">오퍼레이터</option>
                    <option value="2">슈퍼관리자</option>
                </select>
              </div>
            </div>
          </div>

          <hr />
       </div>

        <div class="box-footer">
          <button id="btnRegistPopup" type="button" name="button" class="btn btn-primary center-block">생성</button>
          <button id="btnClosePopup" type="button" name="button" class="btn btn-danger center-block">취소</button>
        </div>
      </div>

    
<script src="/resources/plugins/jQuery/jQuery-2.1.4.min.js"></script>
<script src="/resources/plugins/jQuery/jquery.bpopup.min.js"></script>
<script type="text/javascript">
      
	$("#btnClosePopup").click(function(){
		$("#popupWrapper").bPopup().close();
	}); 
 
</script>

<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<div class="box box-primary">
        <div class="box-header with-border">
          <div class="box-title">
            <p>투표 상세 정보</p>
          </div>
        </div>

        <div class="box-body">
          <div class="form-group">

            <div class="row">
              <div class="center-block" style="width:600px; padding:15px;">
                <label for="">등록번호</label>
                <input type="text" name="" value="343543" disabled>
                <label for="">작성자</label>
                <input type="text" name="" value="zajan91@nasver.com" disabled>
              </div>
            </div>
            <div class="row">
	           	<div class="center-block" style="width:600px; padding:15px;">
	                <label for="">작성일</label>
	                <input type="text" name="" value="15-11-24 14:34:33" disabled>
	                <label for="">투표시간</label>
	                <input type="text" name="" value="30분" disabled>
	             	</div>       
            </div>
            <div class="row">
            	<div class="center-block" style="width:600px; padding:15px;">
	                <label for="">진행상태</label>
	                <input type="text" name="" value="완료" disabled>
	                <label for="">신고건수</label>
	                <input type="text" name="" value="1" disabled>
              	</div>  
                
            </div>

            <div class="form-group">
              <label>투표내용</label>
              <textarea class="form-control" rows="8" cols="30" disabled>전지현이 이쁨, 송혜교가 이쁨</textarea>
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
        <div class="box-footer">
          <button id="btnClosePopup" type="button" name="button" class="btn btn-primary center-block">확인</button>
        </div>
      </div>
      
      <script src="/resources/plugins/jQuery/jQuery-2.1.4.min.js"></script>
      <script src="/resources/plugins/jQuery/jquery.bpopup.min.js"></script>
      <script type="text/javascript">
      
		      $("#btnClosePopup").click(function(){
		 		 $("#popupWrapper").bPopup().close();
		 	 }); 
      
      </script>
      
      

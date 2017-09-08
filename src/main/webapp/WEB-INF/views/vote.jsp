<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ page session="true"%>

<%@include file="include/header.jsp"%>

<!-- Content start -->
        <div class="box">
           <div class="box-header">
             <p><h2 class="box-title"><mark>질문 글</mark></h2></p>

           </div>
           <!-- /.box-header -->
           <div class="box-body">
             <div class="input-group">
               <div class="row">
                 <div class="col-md-2">
                    <h4>검색</h4>
                 </div>
                 <div class="col-md-4">
                   <select id="questCategory" class="form-control form-group-inline" onchange="selectChange()" style="display:inline-block">
                     <option value="3">작성자</option>
                     <option value="1">등록번호</option>
                   </select>
                 </div>
                 <div class="col-md-6">
                   <input type="text" id="questSearch" class="form-control"></input>
                 </div>
               </div>

             </div>

             <table id="tabQuest" class="table table-bordered table-hover display">
               <thead>
               <tr>
                 <th><input type="checkbox" name="select_all" value="1" id="tabQuest-select-all"></th>
                 <th>등록번호</th>
                 <th>투표내용</th>
                 <th>작성자</th>
                 <th>참여자 수</th>
                 <th>작성일</th>
                 <th>투표시간</th>
                 <th>진행상태</th>
                 <th>신고건수</th>
               </tr>
               </thead>
               <tbody>
                <c:forEach items="${surveyList}" var="survey">
                 	<tr>
                 		<td></td>
                 		<td>${survey.survey_no}</td>
                 		<td>${survey.survey_contents}</td>
                 		<td>${survey.email}</td>
                 		<td>${survey.total_score}</td>
                 		<td>${survey.reg_date}</td>
                 		<td>${survey.limit_time} 분</td>
                 		<td>
                 			<c:choose>
                 				<c:when test="${survey.status == 'SS00'}">
                 					<c:out value="투표 진행중"/>
                 				</c:when>
                 				<c:when test="${survey.status == 'SS01'}">
                 					<c:out value="투표 완료"/>
                 				</c:when>
                 				<c:when test="${survey.status == 'SS02'}">
                 					<c:out value="블라인드"/>
                 				</c:when>
                 				<c:otherwise>
                 					<c:out value="${survey.status }"/>
                 				</c:otherwise>
                 			</c:choose>
                 		</td>
                 		<td>${survey.reported_cnt}</td>
                 	</tr>
                 </c:forEach>
               </tbody>

              </table>
              <div class="row">
                <div class="col-md-3 pull-right">
                  <button type="button" class="btn btn-primary" id="btnBlind">블라인드 적용</button>
                  <button type="button" class="btn btn-danger" id="btnDelete">삭제</button>
                </div>
              </div>
            </div>
          </div>  <!-- /.box-body -->

          <form id="frmBlind" class="" action="/vote/blind" method="post" hidden="hidden">

          </form>

          <form id="frmDelete" class="" action="" method="post" hidden="hidden">

          </form>



          <div class="box">
             <div class="box-header">
               <p><h2 class="box-title"><mark>투표 참여 관리</mark></h2></p>
             </div>
             <!-- /.box-header -->
             <div class="box-body">
               <div class="input-group">
                 <div class="row">
                   <div class="col-md-4">
                      <h4>참여자</h4>
                   </div>
                   <div class="col-md-8">
                     <input type="text" id="voteSearch" class="form-control"></input>
                   </div>
                 </div>

               </div>

               <table id="tabVote" class="table table-bordered table-hover">
                 <thead>
                 <tr>
                   <th>투표 내용</th>
                   <th>선택지 내용</th>
                   <th>참여자</th>
                   <th>투표일</th>
                 </tr>
                 </thead>
                 <tbody id="body" hidden="hidden">
                 	<c:forEach items="${voteList}" var="vote">
	                 	<tr>
	                 		<input type="text" val="${vote.survey_no }" hidden="hidden"/>
	                 		<td>${vote.survey_contents}</td>
	                 		<td>${vote.item_contents}</td>
	                 		<td>${vote.email}</td>
	                 		<td>${vote.reg_date}</td>
	                 	</tr>
                 	</c:forEach>
                 </tbody>
              </table>
            </div>
          </div>
          
	         <!-- 레이어 팝업  Wrapper-->
	        <div id="popupWrapper" style="display:none;">
	        
	        </div>

    <!-- Bootstrap 3.3.2 JS -->
    <script src="/resources/bootstrap/js/bootstrap.min.js" type="text/javascript"></script>
    <script src="/resources/plugins/slimScroll/jquery.slimscroll.min.js"></script>
    <!-- FastClick -->
    <script src='/resources/plugins/fastclick/fastclick.min.js'></script>
    <!-- AdminLTE App -->
    <script src="/resources/dist/js/app.min.js" type="text/javascript"></script>
    <!-- AdminLTE for demo purposes -->
    <script src="/resources/dist/js/demo.js" type="text/javascript"></script>
    <!-- DataTables -->
    <script src="/resources/plugins/datatables/jquery.dataTables.min.js"></script>
    <script src="/resources/plugins/datatables/dataTables.bootstrap.min.js"></script>
    <!-- BPopup Plugin -->
    <script src="/resources/plugins/jQuery/jquery.bpopup.min.js"></script>

    <script>
      
      // 블라인드 처리 및 삭제 서버 측 alert 
      var rttr = "<c:out value='${rttr}'/>";
      
      if(rttr){
    	  alert(rttr);
      }

      /*******   질문 글 관련 Script *********/

      var tabQuest = $("#tabQuest").DataTable({
        "language"    : {
          'zeroRecords'       : "검색결과가 없습니다.",
          'info'              : "질문 글 수 :  _TOTAL_ 개",
          'infoEmpty'         : "질문 글 수 :  _TOTAL_ 개",
          'infoFiltered'      : " ",
          "lengthMenu"        : "출력 개수 :  _MENU_",
          'paginate'          : {
            "first" : "처음",
            "last"  : "마지막",
            "next"  : "다음",
            "previous" : "이전"
          }

        },
        "scrollY"              : 400,
        "scrollCollapse"       : true,
        "lengthMenu"           : [ 15, 25, 50 ],
        "pageLength"           : 25,
        "pagingType"           : "full_numbers",
        "dom"                  :'<"top"<"col-md-4"i><"col-md-6"B><"col-md-2"l>>' +
                                 'rt' +
                                 '<"bottom pull-left"<"col-md-12"p>>',

        "select"              : "multi",
        'columnDefs'          : [{
                                   'targets': 0,
                                   'searchable': false,
                                   'orderable': false,
                                   'className': 'dt-body-center',
                                   'render': function (data, type, full, meta){
                                       return '<input type="checkbox" name="id[]" value="' + $('<div/>').text(data).html() + '">';
                                           }
                                }],
        "autoWidth" : false,


      });
	  
      // 전체 체크박스 선택 및 해제 기능 구현
      $('#tabQuest-select-all').on('click', function(){
    	  
          var rows = tabQuest.rows({ 'search': 'applied' }).nodes();
          $('input[type="checkbox"]', rows).prop('checked', this.checked);

     });
      
	  //카테고리 변경 시 search 컬럼 변경
      $('#questSearch').on( 'keyup', function () {
          tabQuest
              .columns( $('#questCategory > option:selected').val() )
              .search( this.value )
              .draw();
      });
	  
	  //Select 변화 시 수행되는 함수	
      function selectChange(){

        var temp = $("#questSearch").val();
        tabQuest
              .search('')
              .columns().search('')
              .draw();
        tabQuest
              .columns( $('#questCategory > option:selected').val() )
              .search(temp)
              .draw();
      }
	  
	  
	  // 블라인드 적용 버튼 클릭 시 이벤트
      $("#btnBlind").click(function(){

        tabQuest.$("input[type='checkbox']").each(function(){
          if(this.checked){											//체크된게 있으면 form에 input 동적 추가		
              $("#frmBlind").append(
                 $('<input>')
                    .attr('type', 'hidden')
                    .attr('name', 'blindSurvyNoList')
                    .val($(this).parents("td").next().text())
      			);
          }
        });
        if(confirm("선택된 질문 글을 블라인드 처리 하시겠습니까?")){
        	$("#frmBlind").submit();
        }
      });
	  
	  // 삭제 버튼 클릭 시 이벤트
	  $("#btnDelete").click(function(){
		  
		  tabQuest.$("input[type='checkbox']").each(function(){
	          if(this.checked){											//체크된게 있으면 form에 input 동적 추가		
	              $("#frmDelete").append(
	                 $('<input>')
	                    .attr('type', 'hidden')
	                    .attr('name', 'delSurvyNoList')
	                    .val($(this).parents("td").next().text())
	      			);
	          }
	      });
		  
		  $.ajax({
	  			
	  			type:"GET",
	  			url:"/vote/delete",
	  			data: {
	  				
	  			},
	  			dataType:"html",
	  			success:function(data){
	  				
	  				$("#popupWrapper").bPopup({
	  					follow: [true, true],
	  		            //position: [465, 0] 
	  				});
	  				$("#popupWrapper").html(data);
	  				
	  			},
	  			error:function(request,status){
	  				$("#popupWrapper").hide();
	  				alert("리뷰 팝업 오류");
	  			}
	  		});
		  
	        
	
	  });
	  
	  
	  
	  
	  // Table row 클릭 이벤트
	  $("#tabQuest tr").dblclick(function(){
		 
		  var surveyNo = $(this).children("td").eq(1).text();
		  openVoteInfoPopup(surveyNo);

	  });
	  
	  // 질문 글 상세 정보 팝업 함수
	  function openVoteInfoPopup(selectedSurveyNo){
		  
		  $.ajax({
  			
  			type:"GET",
  			url:"/vote/info",
  			data: {
  				surveyNo : selectedSurveyNo
  			},
  			dataType:"html",
  			success:function(data){
  				
  				$("#popupWrapper").bPopup({
  					follow: [true, true],
  		            position: [465, 0] 
  				});
  				$("#popupWrapper").html(data);
  				
  			},
  			error:function(request,status){
  				$("#popupWrapper").hide();
  				alert("리뷰 팝업 오류");
  			}
  		});
	  }
	  
	 
	  
	  
	  
	  
	  
	  
	  
	  
	  
      /*******   투표 참여 관리 관련 Script *********/

      var tabVote = $("#tabVote").DataTable({

        "language"    : {
          'zeroRecords'       : "검색결과가 없습니다.",
          'info'              : "질문 글 수 :  _TOTAL_ 개",
          'infoEmpty'         : "질문 글 수 :  _TOTAL_ 개",
          'infoFiltered'      : " ",
          "lengthMenu"        : "출력 개수 :  _MENU_",
          'paginate'          : {
            "first" : "처음",
            "last"  : "마지막",
            "next"  : "다음",
            "previous" : "이전"
          }

        },
        "scrollY"              : 400,
        "scrollCollapse"       : true,
        "lengthMenu"           : [ 15, 25, 50 ],
        "pageLength"           : 25,
        "pagingType"           : "full_numbers",
        "dom"                  :'<"top"<"col-md-4"><"col-md-6"B><"col-md-2"l>>' +
                                 'rt' +
                                 '<"bottom pull-left"<"col-md-12"p>>',
        "autoWidth" : false,

      });

      $('#voteSearch').on( 'keyup', function () {

          $("#body").show();
          tabVote
              .columns(2)
              .search( this.value )
              .draw();
      });




    </script>


<%@include file="include/footer.jsp"%>

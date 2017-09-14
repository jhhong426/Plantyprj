<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="true" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<%@include file="include/header.jsp" %>

   <!-- 미처리 문의사항 Count 출력 -->
   <h2>  
	 <div id='countYet' ></div>
   </h2>
   
   <!-- 미처리 문의사항 검색 부분 -->
   <div class="box">
	<div class="box-body">
     <div class="input-group">
       <div class="row">
         <div class="col-md-5">
           <select id="yetCategory" class="form-control form-group-inline" onchange="yetCategoryChange()" style="display:inline-block">
             <option value="4">문의자</option>
             <option value="1">문의유형</option>
           </select>
         </div>
         <div class="col-md-5" id="yetDynamicCategory">
           <input type="text" id="yetInput" class="form-control"></input>
           <select onchange='yetCategoryChangeClick()' id='yetCategoryInput' class='form-control form-group-inline' style='display: inline-block' hidden="hidden">
						<option value='서비스'>서비스</option>
						<option value='투표'>투표</option>
						<option value='회원관리'>회원관리</option>
						<option value='금칙어'>금칙어</option>
						<option value='운영'>운영</option>
						<option value='기타'>기타</option>
			</select>
         </div>
         <div class="col-md-2">
         		<button class="fa fa-search" id="yetSearch" onclick="yetSearch()" style="height:30px; width:40px;"></button>
			</div>
       </div>
     </div>

	<!-- 미처리 문의사항 데이터 출력 -->
	<table id="questYetSelect" class="display" cellspacing="0" width="100%">
			<thead>
				<tr>
				<th style="text-align:center">등록번호</th>
				<th style="text-align:center">문의유형</th>
				<th style="text-align:center">제목</th>
				<th style="text-align:center">문의시간</th>
				<th style="text-align:center">문의자</th>
				</tr>
			</thead>	
	        <tbody style="text-align:center">
	        <c:forEach var="Yet" items="${questYetSelect}">
			<tr>
			<td>${Yet.quest_no}</td>
			<td>${Yet.quest_category}</td>
			<td>${Yet.title}</td>
			<td>${Yet.reg_date}</td>
			<td>${Yet.email}</td>
			</tr>
			</c:forEach>
	        </tbody>
	</table>
   </div>	
  </div>
	

	
   <!-- 처리 문의사항 Count 출력 -->
   <h2> 
	 <div id='countDone' ></div>
   </h2>
   
   <!-- 처리 문의사항 검색 부분 -->
   <div class="box">
	<div class="box-body">
     <div class="input-group">
       <div class="row">
         <div class="col-md-5">
           <select id="doneCategory" class="form-control form-group-inline" onchange="doneCategoryChange()" style="display:inline-block">
             <option value="6">담당자</option>
             <option value="4">문의자</option>
             <option value="1">문의유형</option>
           </select>
         </div>
         <div class="col-md-5" id="doneDynamicCategory">
           <input type="text" id="doneInput" class="form-control"></input>
         </div>
         <div class="col-md-2" >
				<button class="fa fa-search" id="doneSearch" onclick="doneSearch()" style="height:30px; width:40px;"></button>
			</div>
       </div>
     </div>
	
	<!-- 처리 문의사항 데이터 출력 -->
	<table id="questDoneSelect" class="display" cellspacing="0" width="100%">
			<thead>
				<tr>
				<th style="text-align:center">등록번호</th>
				<th style="text-align:center">문의유형</th>
				<th style="text-align:center">제목</th>
				<th style="text-align:center">문의시간</th>
				<th style="text-align:center">문의자</th>
				<th style="text-align:center">답변완료시간</th>
				<th style="text-align:center">담당자</th>
				</tr>
			</thead>	
	        <tbody style="text-align:center">
	        <c:forEach var="Done" items="${questDoneSelect}">
			<tr>
			<td>${Done.quest_no}</td>
			<td>${Done.quest_category}</td>
			<td>${Done.title}</td>
			<td>${Done.reg_date}</td>
			<td>${Done.email}</td>
			<td>${Done.cmpl_date}</td>
			<td>${Done.mngr_id}</td>
			</tr>
			</c:forEach>
	        </tbody>
	</table>
   </div>
  </div>

  <div id="popupWrapper" style="display:none;"></div>




<%@include file="include/footer.jsp" %>


<!-- jQuery 2.2.3 -->
<script src="/resources/plugins/jQuery/jQuery-2.1.4.min.js"></script>
<!-- Bootstrap 3.3.6 -->
<script src="/resources/bootstrap/js/bootstrap.min.js"></script>
<!-- DataTables -->
<script src="/resources/plugins/datatables/jquery.dataTables.min.js"></script>
<script src="/resources/plugins/datatables/dataTables.bootstrap.min.js"></script>
<!-- SlimScroll -->
<script src="/resources/plugins/slimScroll/jquery.slimscroll.min.js"></script>
<!-- FastClick -->
<script src="/resources/plugins/fastclick/fastclick.js"></script>
<!-- AdminLTE App -->
<script src="/resources/dist/js/app.min.js"></script>
<!-- AdminLTE for demo purposes -->
<script src="/resources/dist/js/demo.js"></script>
<script src="/resources/plugins/jQuery/jquery.bpopup.min.js"></script>


<script>

	// 미처리 문의사항 옵션 설정
  	var questYetSelect = $("#questYetSelect").DataTable({
         "language" : {    // 영어로 되어있는 기본 설정값들을 한글로 변경
      	        'zeroRecords'	: "검색결과가 없습니다.",
 				'infoFiltered'	: " ",
 				'lengthMenu'	: "출력 개수 : _MENU_",
 				'paginate'		: {
 					"first"			: "처음",
 					"last"			: "마지막",
 					"next"			: "다음",
 					"previous"		: "이전"
 				 }
 	     },
 		 "scrollY"		: 400,                // 스크롤바 길이 선언
 		 "scrollCollapse" : true,             // 스크롤바 기능
         "lengthMenu"		: [15, 25, 50],   // 출력 게시글 개수 조정
         "pageLength"		: 25,             // 출력 게시글 개수는 default 25개로 설정
         "pagingType"		: "full_numbers",
         "lengthChange": true,
         "searching": true,
  	     "paging": true,
         "info": false,       // 테이블에 출력되어있는 게시글 수가 몇 개인지 세어주는 기능
         "ordering": false,   // 칼럼별로 따로 오름차순, 내림차순 할 수 있는 기능
         "autoWidth": false,
         "dom": '<"top"<"col-md-10"B><"col-md-2"l>>' +   // DataTable 옵션들 위치 수동으로 설정
	   		    'rt' +                                   // B는 공백, l은 게시글 개수 조정, p는 페이지네이션
	            '<"bottom pull-left"<"col-md-12"p>>'
  	});
	 
  	 // 미처리 엔터 이벤트
	 /* $("#yetInput").keydown(function(key){
		if(key.keyCode == 13){
			yetSearch();
		} 

	 }); */
  	 
  	 $(document).on("keydown","#yetInput",function(key){
  		if(key.keyCode == 13){
			yetSearch();
		} 
  	 });
	  

	 // 미처리 카테고리는 해당 카테고리 선택시 자동으로 검색 결과 출력
	 function yetCategoryChangeClick() {
		 yetSearch();
	 }
	 
    // 미처리 검색 옵션 설정
    function yetSearch() { 
		if($("#yetCategory option:selected").val() == 1){   // 문의자(value='4'), 문의유형(value='1')을 담은 카테고리    
			var yetCategoryInput = $("#yetCategoryInput option:selected").val(); // 카테고리는 6가지 값을 가지고 있고  yetCategoryChange에서 동적으로 생성
			$('#questYetSelect').DataTable().columns(1).search(yetCategoryInput).draw();  // 미처리 DataTable의 '문의유형'(columns(1))에서 동적카테고리값을 찾아(search(yetCategoryInput))테이블을 리로딩 draw();
		} else {
			var yetCategoryNum = $("#yetCategory option:selected").val(); // 카테고리에서 선택된 값을 yetCategoryNum에 담음
			var yetInput = $('#yetInput').val()						      // 검색창에 입력한 값
			$('#questYetSelect').DataTable().columns(yetCategoryNum).search(yetInput).draw(); // 테이블에서 yetCategoryNum의 값이 yetInput과 일치하는 값을 찾고 리로딩
		}
	 }
    
    // 미처리 검색 카테고리(문의유형) 설정
    function yetCategoryChange() {  
    	$('#questYetSelect').DataTable().columns().search("").draw();
    	
		/* if($("#yetCategory option:selected").val() == 1 ){
			$("#yetDynamicCategory").html(
					"<select onchange='yetCategoryChangeClick()' id='yetCategoryInput' class='form-control form-group-inline'"
						+"style='display: inline-block'>"
						+"<option value='서비스'>서비스</option>"
						+"<option value='투표'>투표</option>"
						+"<option value='회원관리'>회원관리</option>"
						+"<option value='금칙어'>금칙어</option>"
						+"<option value='운영'>운영</option>"
						+"<option value='기타'>기타</option>"
						+"</select>"	
			);
		} else {
			$("#yetDynamicCategory").html(
					"<input type='text' id='yetInput' class='form-control'></input>"
			);
		} */
    	if($("#yetCategory option:selected").val() == 1 ){
    		$("#yetDynamicCategory").children("input").hide();
			$("#yetDynamicCategory").children("select").show();
		} else {
			$("#yetDynamicCategory").children("input").show();
			$("#yetDynamicCategory").children("select").hide();
			);
		}
	}
    
 	// 미처리 출력 건수를 count 해서 뿌려주는 역할
    var num1 = $('#questYetSelect tr').length-1;  // 미처리 테이블의 총 row 길이에 칼럼부분 한 줄(1)을 뺀 값
    $('#countYet').html("미처리 문의사항 :" + num1);   // 결국 이 값이 화면에 출력된 데이터의 개수이고, count된 값이다.
    
    // 미처리 Table row 클릭 이벤트
	$("#questYetSelect tr").dblclick(function(){
		var answerNo = $(this).children("td").eq(0).text();  // 테이블에서 더블클릭한 줄의 값, 0은 첫번째 칼럼이니 '등록번호'를 의미
		openAnswerPopup(answerNo);                           // question 테이블의 PK인 quest_no와 매핑
    });
	  
	// 미처리 문의사항 팝업창
	function openAnswerPopup(selectedAnswerNo){
		$.ajax({
			
		type:"GET",
		url:"/quest/selectAnswer",   // Controller 클래스 중에 value가 /selectAnswer 로 매핑
		data: {
			answerNo : selectedAnswerNo  // Controller에 quest_no를 전달해줌으로써 DB에 들어감 
		},
		dataType:"html",
		success:function(data){
				
		$("#popupWrapper").bPopup({
			follow: [true, true],   
		    position: [465, 0]       // 팝업창 뜨는 위치
		});
		$("#popupWrapper").html(data);
				
		},
		error:function(request, status){
			$("#popupWrapper").hide();
			alert("미처리 문의사항 팝업 오류");
		}
		});
	}
    
	
	
	
	
	
	// 처리 문의사항 옵션 설정
	var questDoneSelect = $("#questDoneSelect").DataTable({
        "language" : {
     	     search : "검색 : ",
     	    'zeroRecords'	: "검색결과가 없습니다.",
				'infoFiltered'	: " ",
				'lengthMenu'	: "출력 개수 : _MENU_",
				'paginate'		: {
					"first"			: "처음",
					"last"			: "마지막",
					"next"			: "다음",
					"previous"		: "이전"
				}
			},
		   "scrollY"		: 400,
		   "scrollCollapse" : true,
        "lengthMenu"		: [15, 25, 50],
        "pageLength"		: 25,
        "pagingType"		: "full_numbers",
        "lengthChange": true,
        "searching": true,
 	    "paging": true,
        "info": false, 
        "ordering": false, 
        "autoWidth": false,
        "dom": '<"top"<"col-md-10"B><"col-md-2"l>>' +
			    'rt' +
			    '<"bottom pull-left"<"col-md-12"p>>'
 	});
    
	  // 처리 엔터 이벤트
	  $("#doneInput").keydown(function(key){
		  
		 if(key.keyCode == 13){
			 doneSearch();
		 } 
	  });
	  
	  // 처리 카테고리는 해당 카테고리 선택시 자동으로 검색 결과 출력
	  function doneCategoryChangeClick() {
		  doneSearch();
	  }
	  
    // 처리 검색 옵션 설정
    function doneSearch() {
		if($("#doneCategory option:selected").val() == 1){  // 담당자(value='6') 카테고리 추가
			var doneCategoryInput = $("#doneCategoryInput option:selected").val();
			$('#questDoneSelect').DataTable().columns(1).search(doneCategoryInput).draw();   
		}else{
			var doneCategoryNum = $("#doneCategory option:selected").val();
			var doneInput = $('#doneInput').val()						      
			$('#questDoneSelect').DataTable().columns(doneCategoryNum).search(doneInput).draw(); 
			}
	}
    
 	  
    
	// 처리 검색 카테고리(문의유형) 설정
    function doneCategoryChange() {
    	$('#questDoneSelect').DataTable().columns().search("").draw();
    	
		if($("#doneCategory option:selected").val() == 1){
			$("#doneDynamicCategory").html(
					"<select onchange='doneCategoryChangeClick()' id='doneCategoryInput' class='form-control form-group-inline'"
					+"style='display: inline-block'>"
					+"<option value='서비스'>서비스</option>"
					+"<option value='투표'>투표</option>"
					+"<option value='회원관리'>회원관리</option>"
					+"<option value='금칙어'>금칙어</option>"
					+"<option value='운영'>운영</option>"
					+"<option value='기타'>기타</option>"
					+"</select>"	
			);
		}else{
			$("#doneDynamicCategory").html(
					"<input type='text' id='doneInput' class='form-control'></input>"
			);
		}
	}
	
    // 처리 출력 건수를 count 해서 뿌려주는 역할
    var num2 = $('#questDoneSelect tr').length-1; 
  	$('#countDone').html("처리 문의사항 :" + num2);
  
    // 처리 문의사항 Table row 클릭 이벤트
	$("#questDoneSelect tr").dblclick(function(){
		var resultNo = $(this).children("td").eq(0).text()
		openResultPopup(resultNo);
    });
	  
	// 처리 문의사항 팝업창
	function openResultPopup(selectedResultNo){
		$.ajax({
			
		type:"GET",
		url:"/quest/selectResult",
		data: {
			resultNo : selectedResultNo	
		},
		dataType:"html",
		success:function(data){
				
		$("#popupWrapper").bPopup({
			follow: [true, true],
		    position: [465, 0] 
		});
		$("#popupWrapper").html(data);
				
		},
		error:function(request, status){
			$("#popupWrapper").hide();
			alert("처리 문의사항 팝업 오류");
		}
		});
	}
	
	
   
    
</script>
</body>
</html>

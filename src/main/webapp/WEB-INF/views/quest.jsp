<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="true" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<%@include file="include/header.jsp" %>

 
   <h2>  <!-- 미처리 문의사항 Count 출력 -->
	 <div id='countYet' ></div>
   </h2>
   
   <div class="box">
	<div class="box-body">
     <div class="input-group">
       <div class="row">
         <div class="col-md-5">
           <select id="yetCategory" class="form-control form-group-inline" 
           onchange="yetCategoryChange()" style="display:inline-block">
             <option value="4">문의자</option>
             <option value="1">문의유형</option>
           </select>
         </div>
         <div class="col-md-5" id="yetDynamicCategory">
           <input type="text" id="yetInput" class="form-control"></input>
         </div>
         <div class="col-md-2">
         		<button class="fa fa-search" id="yetSearch" onclick="yetSearch()" style="height:30px; width:40px;"></button>
			</div>
       </div>
     </div>

	<!-- DataTable로 '미처리' 문의사항 데이터 출력 -->
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
	

	
	
   <h2>    <!-- 처리 문의사항 Count 출력 -->
	 <div id='countDone' ></div>
   </h2>
   <div class="box">
	<div class="box-body">
     <div class="input-group">
       <div class="row">
         <div class="col-md-5">
           <select id="doneCategory" class="form-control form-group-inline" 
           onchange="doneCategoryChange()" style="display:inline-block">
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
	
	<!-- DataTable로 '처리' 문의사항 데이터 출력 -->
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
	// DataTable 옵션 변경, 미처리 문의사항 옵션 설정
					
    	var questYetSelect = $("#questYetSelect").DataTable({
           "language" : {
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
           "ordering": false,   // 칼럼별로 따로 오름차순, 내림차순할 필요 없어서 설정 꺼놨음
           "autoWidth": false,
           "dom": '<"top"<"col-md-10"B><"col-md-2"l>>' +
			    'rt' +
			    '<"bottom pull-left"<"col-md-12"p>>'  // 페이지네이션 위치는 임의로 설정해놔서 해상도에 따라 가운데에서 벗어날 수 있음
    		});
    		
    function yetSearch() {  // 미처리 검색 옵션 설정
		if($("#yetCategory option:selected").val() == 1){ // yetCategory -> 문의자(value='4'), 문의유형(value='1')을 담은 카테고리    
			var yetCategoryInput = $("#yetCategoryInput option:selected").val(); // yetCategoryInput -> 카테고리는 6가지 값을 가지고 있음 , yetCategoryChange에서 동적으로 생성
			$('#questYetSelect').DataTable().columns(1).search(yetCategoryInput).draw();// 미처리 ($('#Yet').DataTable())의 문의유형(columns(1))에서 동적카테고리값을 찾아(search(yetCategoryInput)) 테이블 리로딩 draw();    
		}else{
			var yetCategoryNum = $("#yetCategory option:selected").val(); // yetCategory -> 문의자(value='4'), 문의유형(value='1')을 담은 카테고리에서 선택된 값을 yetCategoryNum에 담음
			var yetInput = $('#yetInput').val()						      // 검색창에 키보드로 입력한 값
			$('#questYetSelect').DataTable().columns(yetCategoryNum).search(yetInput).draw(); // 테이블에서 yetCategoryNum의 값이 yetInput과 일치하는 값을 찾고 리로딩
			}
	}
    
    function yetCategoryChange() {  // 미처리 검색 카테고리(문의유형) 설정
    	$('#questYetSelect').DataTable().columns().search("").draw();
		if($("#yetCategory option:selected").val() == 1 ){
			$("#yetDynamicCategory").html(
					"<select id='yetCategoryInput' class='form-control form-group-inline'"
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
			$("#yetDynamicCategory").html(
					"<input type='text' id='yetInput' class='form-control'></input>"
			);
		}
	}
    
    var num1 = $('#questYetSelect tr').length-1;  // 미처리 출력 건수를 count 해서 뿌려주는 역할
    $('#countYet').html("미처리 문의사항 :" + num1);
    
   
    // Table row 클릭 이벤트
	$("#questYetSelect tr").dblclick(function(){
		var answerNo = $(this).children("td").eq(0).text();
		openAnswerPopup(answerNo);
    });
	  
	// 질문 글 상세 정보 팝업 함수
	function openAnswerPopup(selectedAnswerNo){
		$.ajax({
			
		type:"GET",
		url:"/quest/selectAnswer",
		data: {
			answerNo : selectedAnswerNo
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
			alert("팝업 오류");
		}
		});
	}
    
    
    
    
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
        "ordering": false,   // 칼럼별로 따로 오름차순, 내림차순할 필요 없어서 설정 꺼놨음
        "autoWidth": false,
        "dom": '<"top"<"col-md-10"B><"col-md-2"l>>' +
			    'rt' +
			    '<"bottom pull-left"<"col-md-12"p>>'  // 페이지네이션 위치는 임의로 설정해놔서 해상도에 따라 가운데에서 벗어날 수 있음
 		});
    
    function doneSearch() {
		if($("#doneCategory option:selected").val() == 1){  // yetCategory -> 담당자(value='6'), 문의자(value='4'), 문의유형(value='1')을 담은 카테고리    
			var doneCategoryInput = $("#doneCategoryInput option:selected").val();
			$('#questDoneSelect').DataTable().columns(1).search(doneCategoryInput).draw();   
		}else{
			var doneCategoryNum = $("#doneCategory option:selected").val();
			var doneInput = $('#doneInput').val()						      
			$('#questDoneSelect').DataTable().columns(doneCategoryNum).search(doneInput).draw(); 
			}
	}
    function doneCategoryChange() {
    	$('#questDoneSelect').DataTable().columns().search("").draw();
		if($("#doneCategory option:selected").val() == 1){
			$("#doneDynamicCategory").html(
					"<select id='doneCategoryInput' class='form-control form-group-inline'"
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
    var num2 = $('#questDoneSelect tr').length-1;  // 처리 출력 건수를 count 해서 뿌려주는 역할
    $('#countDone').html("처리 문의사항 :" + num2);
  
    // 처리 문의사항 Table row 클릭 이벤트
	$("#questDoneSelect tr").dblclick(function(){
		var resultNo = $(this).children("td").eq(0).text()
		openResultPopup(resultNo);
    });
	  
	// 처리 문의사항 상세 팝업 함수
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
			alert("팝업 오류");
		}
		});
	}
    
    
    
    
    
    
    
</script>
</body>
</html>

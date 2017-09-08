<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
  pageEncoding="UTF-8"%>

	<%@include file="include/header.jsp" %>

 
	<h2>  <!-- 미처리 문의사항 Count 출력 -->
		<div id='countNot' ></div>
	</h2>

	<!--  
	<select id="select1" onchange="itemChange()">
		<option>문의자</option>
		<option>문의유형</option>
	</select>
	<select id="select2">
	</select>    -->

	
	<div class="box-body">
     <div class="input-group">
       <div class="row">
         <div class="col-md-6">
           <select id="questCategory" class="form-control form-group-inline" onchange="selectChange()" style="display:inline-block">
             <option value="4">문의자</option>
             <option value="1">문의유형</option>
           </select>
         </div>
         <div class="col-md-6">
           <input type="text" id="questSearch" class="form-control"></input>
         </div>
       </div>
     </div>

	<input type="button" value="문의사항 답변작성" onclick="popup();" />
        <script language="javascript"> 
            function popup() { 
            	window.open("quest_answer.jsp", "문의사항 답변 작성", "width=600, height=400, left=100, top=50"); 
            } 
       </script>
	
	<!-- DataTable로 '미처리' 문의사항 데이터 출력 -->
	<table id="quest_not" class="display" cellspacing="0" width="100%">
			<thead>
				<tr>
				<th style="text-align:center">등록번호</th>
				<th style="text-align:center">문의유형</th>
				<th style="text-align:center">제목</th>
				<th style="text-align:center">문의시간</th>
				<th style="text-align:center">문의자</th>
				</tr>
			</thead>	
	        <tbody id="mouseclick" onchange="selectMouse()" style="text-align:center">
	        <c:forEach var="voNot" items="${voNot}">
			<tr>
			<td>${voNot.quest_no}</td>
			<td>${voNot.quest_category}</td>
			<td>${voNot.title}</td>
			<td>${voNot.reg_date}</td>
			<td>${voNot.email}</td>
			</tr>
			</c:forEach>
	        </tbody>
	</table>
   </div>	
	
	
	<br/>  <!-- 그냥 한 칸 띄운 거 -->
	
	
	<h2>    <!-- 처리 문의사항 Count 출력 -->
		<div id='countCmpl' ></div>
	</h2>
	
	<!-- DataTable로 '처리' 문의사항 데이터 출력 -->
	<table id="quest_cmpl" class="display" cellspacing="0" width="100%">
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
	        <c:forEach var="voCmpl" items="${voCmpl}">
			<tr>
			<td>${voCmpl.quest_no}</td>
			<td>${voCmpl.quest_category}</td>
			<td>${voCmpl.title}</td>
			<td>${voCmpl.reg_date}</td>
			<td>${voCmpl.email}</td>
			<td>${voCmpl.cmpl_date}</td>
			<td>${voCmpl.mngr_id}</td>
			</tr>
			</c:forEach>
	        </tbody>
	</table>




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



<script>

	// DataTable 옵션 변경, 미처리 문의사항 옵션 설정
    var quest_not = $("#quest_not, #quest_cmpl").DataTable({
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
			    '<"bottom"<"col-md-8"p><"col-md-4"B>>'  // 페이지네이션 위치는 임의로 설정해놔서 해상도에 따라 가운데에서 벗어날 수 있음
      });
	
    $('#questSearch').on( 'keyup', function () {
    	quest_not
            .columns( $('#questCategory > option:selected').val() )
            .search( this.value )
            .draw();
    });
    
    function selectChange(){
        var temp = $("#questSearch").val();
        quest_not
              .search('')
              .columns().search('')
              .draw();
        quest_not
              .columns( $('#questCategory > option:selected').val() )
              .search(temp)
              .draw();
      }

     
	$('#mouseclick').on('click', 'tr', function () {
	    alert();
    });
    
    function selectMouse(){
    	var popup = quest_not.row(this).popup();
        alert();
    }
    
    
    
    <%--
    itemChange();
    if($('#selectItem').val() == "문의자" ){  // 1번째 카테고리가 '문의자'일 때
    	$('#select2').hide();   // 2번째 카테고리 드롭박스를 숨김
    } else if($('#selectItem').val() == "문의유형" ){  // 1번째 카테고리가 '문의유형'일 때
    	$('#select2').show();   // 2번째 카테고리 드롭박스를 보여줌
    } 
    
    function itemChange() {
    	var quest_category = ["서비스", "투표", "회원관리", "금칙어", "운영", "기타"];
    	var selectItem = $("#select1").val();
    	var changeItem;
    	if(selectItem == "문의유형") {
    	  changeItem = quest_category;
    	}
    	
    	$('#select2').empty();
    	for(var count = 0; count < changeItem.length; count++){                
    	         var option = $("<option>"+changeItem[count]+"</option>");
    	         $('#select2').append(option);
    	}
    }
	--%>
  
  // 처리/미처리 각 출력 건수를 count 해서 뿌려주는 역할
  var num1 = $('#quest_not tr').length-1;
  var num2 = $('#quest_cmpl tr').length-1;
  $('#countNot').html("미처리 문의사항 :" + num1);
  $('#countCmpl').html("처리 문의사항 :" + num2);
  
  
	
	
</script>
</body>
</html>

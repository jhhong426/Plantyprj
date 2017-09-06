<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
  pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
  <meta charset="utf-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <title>AdminLTE 2 | Data Tables</title>
  <!-- Tell the browser to be responsive to screen width -->
  <meta content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no" name="viewport">
  <!-- Bootstrap 3.3.6 -->
  <link rel="stylesheet" href="/resources/bootstrap/css/bootstrap.min.css">
  <!-- Font Awesome -->
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.5.0/css/font-awesome.min.css">
  <!-- Ionicons -->
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/ionicons/2.0.1/css/ionicons.min.css">
  <!-- DataTables -->
  <link rel="stylesheet" href="/resources/plugins/datatables/dataTables.bootstrap.css">
  <!-- Theme style -->
  <link rel="stylesheet" href="/resources/dist/css/AdminLTE.min.css">
  <!-- AdminLTE Skins. Choose a skin from the css/skins
       folder instead of downloading all of them to reduce the load. -->
  <link rel="stylesheet" href="/resources/dist/css/skins/_all-skins.min.css">
  <link rel="stylesheet" href=" https://cdn.datatables.net/1.10.15/css/jquery.dataTables.min.css">

	<%@include file="include/header.jsp" %>

 
	<h2>  <!-- 미처리 문의사항 Count 출력 -->
		<div id='countNot' ></div>
	</h2>
	
	<!-- DataTable로 '미처리' 문의사항 데이터 출력 -->
	<table id="question1" class="display" cellspacing="0" width="100%">
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
	
	
	<br/>  <!-- 그냥 한 칸 띄운 거 -->
	
	
	<h2>    <!-- 처리 문의사항 Count 출력 -->
		<div id='countCmpl' ></div>
	</h2>
	
	<!-- DataTable로 '처리' 문의사항 데이터 출력 -->
	<table id="question2" class="display" cellspacing="0" width="100%">
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

// DataTable 옵션 변경, 처리/미처리 둘 다 같은 옵션을 쓰므로 같이 설정해줌
$(function () {
    $("#question1, #question2").DataTable({
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
           "dom": '<"top"<"col-md-2"f><"col-md-8"B><"col-md-2"l>>' +
			    'rt' +
			    '<"bottom"<"col-md-8"p><"col-md-4"B>>'  // 페이지네이션 위치는 임의로 설정해놔서 해상도에 따라 가운데에서 벗어날 수 있음
      })
  });
 
  
  // 처리/미처리 각 출력 건수를 count 해서 뿌려주는 역할
  var num1 = $('#question1 tr').length-1;
  var num2 = $('#question2 tr').length-1;
  $('#countNot').html("미처리 문의사항 :" + num1 );
  $('#countCmpl').html("처리 문의사항 :" + num2 );
  
  
	
	
</script>
</body>
</html>

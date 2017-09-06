<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="true" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="include/header.jsp" %>

<body>
  
 	<h1>My 정보</h1>
 	
 	<p> ID : ${login.getMngrId()}</p>
 	<p> 이름 : ${login.getMngrName()}	</p>
 	<p> 사원번호 : ${login.getEmp_no()}		</p>
 	<p> 소속부서 : ${login.getDepartment()}	</p>
 	<p> 직책 : ${login.getPosition()}			</p>
 	<p> 권한 : ${login.getAuthority()}			</p>
 	
 	
 	<h1>비밀번호 변경</h1>
 	
 	<a href="/ask/editPW"><button>비밀번호 변경</button></a>
 	
 	
 	
 	
	<h1>처리내역</h1>
	
	<h3>처리된 내역 : 건</h3>

	<p>기간 설정: <input type="text" id="datepicker"> ~ <input type="text" id="datepicker"></p>
 
 

	
	
	
	
	
	
	<h3>처리된 신고 : 건</h3>
  	
 	
 	
 	
 	
			

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
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>

<!-- page script -->
<script>

$( function() {
    $( "#datepicker" ).datepicker();
  } );
	
</script>
</body>

<%@include file="include/footer.jsp" %>
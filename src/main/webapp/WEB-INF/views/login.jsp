<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!-- 세션 사용 페이지 여부 : False -->
<%@ page session="false" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>


  <!DOCTYPE html>
<html>
<head>
  <meta charset="utf-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <title>관리자 로그인</title>
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
</head>
<body>
  
 	<h1>Manager Login</h1>

	<!-- 로그인 Form -->
 	<form name="frmLogin" action="/loginPost" method="POST" onSubmit="return frmChk();">
 	
 		<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}">
	 	<input type="text" name="mngr_id" id="mngr_id" placeholder="관리자 아이디" /> <br>
	  	<input type="password" name="password" id="password" placeholder="관리자 비밀번호"/>
	  	
	  	<input type="submit" id="btn-login" value="로그인" />
	  	
	  	<!-- 로그인 실패시 실패 문구가 들어간 페이지 상태로 Redirect -->
	
	  	
	
  	</form>

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


<!-- page script -->
<script type="text/javascript">
	
	

	function frmChk(){
		
		var frm = document.frmLogin;
		
    	if(frm.mngr_id.value=='') {
    		
    		alert("관리자 아이디를 입력하세요!!");
    		
    		frm.mngr_id.focus();
    		
    		return false;
    		
    	}else if(frm.password.value=='') {
    		
			alert("관리자 비밀번호를 입력하세요!!");  
			
			frm.password.focus();
			
			return false;
			
		}else {
			
			frm.submit(); 
			
			return true;
		}
	}
</script>
</body>
</html>


<%@include file="include/footer.jsp" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="true" %>
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
  
 	<h1>변경실패</h1>

	
 	<form name="frmEditPW" action="/ask/editPWPost" method="POST" onSubmit="return frmChkBlank();">
 	
	  	
	  	<a href="/ask/editPW"><input type="submit" id="btn-editPW" value="돌아가기" /></a>

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
	
	

	function frmChkBlank(){
		
		var frm = document.frmEditPW;
		
    	if(frm.password.value=='') {
    		
    		alert("현재 비밀번호를 입력하세요!!");
    		
    		frm.password.focus();
    		
    		return false;
    		
    	}else if(frm.newPW.value=='') {
    		
			alert("변경할 비밀번호를 입력하세요!!");  
			
			frm.newPW.focus();
			
			return false;
			
		}else if(frm.chkPW.value=='') {
    		
			alert("변경 비밀번호 확인을 위해 다시 한 번 더 입력하세요!!");  
			
			frm.chkPW.focus();
			
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
]<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
  pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
  <meta charset="utf-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <title>신고 처리</title>
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


   <%@include file="include/header.jsp" %>

 
<h1>미처리 신고사항 : OOO</h1> 


<table id="report1" class="display" cellspacing="0" width="100%">
      <thead>
         <tr>
         <th style="text-align:center">등록번호</th>
         <th style="text-align:center">신고유형</th>
         <th style="text-align:center">신고사유</th>
         <th style="text-align:center">신고자</th>
         <th style="text-align:center">접수시간</th>
         <th style="text-align:center">신고된 질문 글</th>
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

<br/>
<br/>
<br/>

 
<h1>처리 신고사항 : OOO</h1> 


<table id="report2" class="display" cellspacing="0" width="100%">
      <thead>
         <tr>
         <th style="text-align:center">등록번호</th>
         <th style="text-align:center">신고 유형</th>
         <th style="text-align:center">신고 사유</th>
         <th style="text-align:center">신고자</th>
         <th style="text-align:center">담당자</th>
         <th style="text-align:center">접수 시간</th>
         <th style="text-align:center">처리 완료 시간</th>
         <th style="text-align:center">처리 유형</th>
         <th style="text-align:center">신고된 질문 글</th>
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
<!-- page script -->
<script>
  $(function () {
    $("#report1, #report2").DataTable({
           "language" : {
               search : "검색 : "   
             },
           "lengthMenu": [15, 25, 50],
           "lengthChange": true,
           "searching": true,
          "paging": true,
           "ordering": false,
           "info": false,
           "autoWidth": false
      });
  });
  
  
  
</script>
</body>
</html>
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
 
  
 	<h1>테스트 페이지 입니다.</h1>
 	
 	<h1>데이터 베이스 :</h1>
 	<table style="border-collapse:collapse; border:2px black solid">
 		<tr><th>이름</th><th>나이</th></tr>
 		<c:forEach var="vo" items="${vo}">
		<tr><td> ${vo.name}</td><td>${vo.age}</td></tr>
		</c:forEach>
 	</table>
 	
 	<h1>금칙어 실험</h1>
    </table>
 	<table id="example1" class="display" cellspacing="0" width="100%">
		<thead>
			 <tr id="filter_global">
                <td align="left">
 					<form style="display:inline;" name="prohibit_insert" method="post" action="/prohibit_insert">
                		<input type="text" class="global_filter" id="global_filter" name ="word">
                		<button id="createBtn" style="display:inline;" type="submit">생성하기</button>
                	</form>
                </td>
             </tr>
		</thead>	
        <tbody>
        <c:forEach var="vo" items="${vo}">
			<tr>
				<td> ${vo.name} 
					<form style="display:inline;" name="prohibit_delete" method="post" action="/prohibit_delete">
						<button style="display:inline;" type="submit" name="word" value="${vo.name}">X</button>
					</form>
				</td>
			</tr>
		</c:forEach>
        </tbody>
    </table>	
    
    
    <h1> 푸터바 </h1>
			

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
function filterGlobal () {
    $('#example1').DataTable().search(
        $('#global_filter').val(),
    ).draw();
}

 
$(document).ready(function() {
    
   var table = $('#example1').DataTable({
    		  "scrollY":  "300px",
    	      "scrollCollapse": true,
    	      "paging": false,		
    	      "sDom" : 't'
    });
 
    $('input.global_filter').on( 'keyup click', function () {
        filterGlobal();
        if($('#global_filter').val() == "" ){
        	$('#createBtn').hide();
        }else if($('#example1 tr').length-1 > 1 ){
        	$('#createBtn').hide();
        }else{
        	$('#createBtn').show();
        }
    } );
    
    
  
	
    
    
    
    
  
    
    
} );


</script>


</body>
</html>
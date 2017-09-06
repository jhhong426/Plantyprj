<!DOCTYPE html>
<html>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
  pageEncoding="UTF-8"%>
<%@include file="include/header.jsp" %>
 <link rel="stylesheet" href="/resources/dist/css/skins/_all-skins.min.css">
 <link rel="stylesheet" href=" https://cdn.datatables.net/1.10.15/css/jquery.dataTables.min.css">

    <!-- Main content -->
    <section class="content">
      <div class="row">
      <!-- left column -->
      	<div class="col-md-12">
        <!-- general form elements -->
			<h1>금칙어 관리</h1>
			<h1>금칙어 리스트</h1>
			<p id = totalCount></p>
		 	<table id="example1" class="display" cellspacing="0" width="100%">
				<thead>
					 <tr id="filter_global">
		                <td align="left">
		 					<form style="display:inline;" name="prohibit_insert" method="post" action="/prohibit_insert" onsubmit="return validateInsertForm()">
		                		<input type="text" class="global_filter" id="global_filter" name ="word">
		                		<button id="createBtn" style="display:inline;" type="submit">생성하기</button>
		                	</form>
		                </td>
		             </tr>
				</thead>
		        <tbody>
		        <c:forEach var="vo" items="${vo}">
					<tr>
						<td> ${vo.word}
							<form style="display:inline;" name="prohibit_delete" method="post" action="/prohibit_delete" onsubmit="return validateDeleteForm()">
								<button id="row" style="display:inline;" type="submit" name="word" value="${vo.word}">X</button>
							</form>
						</td>
					</tr>
				</c:forEach>
		        </tbody>
		    </table>

  		</div><!--/.col (left) -->
	</div>   <!-- /.row -->
</section><!-- /.content -->


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
function filterGlobal () { //금칙어 관리 검색 함수 (dataTable 플러그인 사용)
    $('#example1').DataTable().search(
        $('#global_filter').val()
    ).draw();
}

$(document).ready(function() { // 데이터 테이블 초기 로딩 및 설정
   var table = $('#example1').DataTable({
    		  "scrollY":  "300px",
    	      "scrollCollapse": true,
    	      "paging": false,
    	      "sDom" : 't'
    });
    var tempCount = $('#example1 tr').length-1;
	$('#totalCount').text("총 금칙어 개수 :" + tempCount  );
	
    $('input.global_filter').on( 'keyup click', function () { //금칙어 추가 vaidation
    	
    	filterGlobal();
    	//$('#count').val($('#example1 tr').length-1);
    	 
    	
        
        if($('#global_filter').val() == "" ){ //입력창이 비어있을시
        	$('#createBtn').hide(); // 금칙어 추가 버튼을 숨김
        }else if($('#global_filter').val() == $('#row').val() ){ //검색값이 이미 존재할경우
        	$('#createBtn').hide(); // 금칙어 추가 버튼을 숨김
        }else{
        	$('#createBtn').show(); //  위의 두조건이 아니면 버튼보여주기
        }
    } );
    
   
} );

// 삽입하시겠습니까 ?? validation
function validateInsertForm() {
	var insertWord =  $('#global_filter').val();
    if (confirm(insertWord+"를 삽입하시겠습니까 ?")) {
        return true;
    }else{
    	return false;
    }
}


//삭제 하시겠습니까 ?? validation
function validateDeleteForm() {
	var deleteWord = $('#row').val();
	if ( confirm(deleteWord+"를 삭제 하시겠습니까 ?") ){
        return true;
    }else{
    	return false;
    }
}

   	</script>
   </body>
</html>

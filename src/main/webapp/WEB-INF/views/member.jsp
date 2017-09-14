<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page session="true"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="include/header.jsp"%>
<h2>회원 리스트</h2>
<hr>
<div class="box-body">
	<div class="input-group">
		<div class="row">
			<div class="col-md-5">
				<select id="searchCategory" class="form-control form-group-inline"
					style="display: inline-block">
					<option value="3">이메일</option>
					<option value="2">전화번호</option>
					<option value="5">생년월일</option>
				</select>
			</div>
			<div class="col-md-5" id="yetDynamicCategory">
				<input type="text" id="keywords" class="form-control"></input>
			</div>
			<div class="col-md-2">
				<button class="fa fa-search" id="searchMember"
					style="height: 30px; width: 40px;"></button>
			</div>
		</div>
	</div>

	<!-- DataTable로 회원 데이터 출력 -->
	<table id="memberList" class="display" cellspacing="0" width="100%">
		<thead>
			<tr>
				<th><input type="checkbox" id="selectAll" name="selectAll"
					value="1" /></th>
				<th style="text-align: center">회원번호</th>
				<th style="text-align: center">전화번호</th>
				<th style="text-align: center">이메일</th>
				<th style="text-align: center">성별</th>
				<th style="text-align: center">생년월일</th>
				<th style="text-align: center">질문 수</th>
				<th style="text-align: center">투표 수</th>
				<th style="text-align: center">문의 수</th>
				<th style="text-align: center">신고 수</th>
				<th style="text-align: center">피 신고 수</th>
				<th style="text-align: center">가입일자</th>
				<th style="text-align: center">수정하기</th>
			</tr>
		</thead>
		<c:forEach var="member" items="${member}">
			<tr>
				<td></td>
				<td>${member.mber_no}</td>
				<td>${member.phone}</td>
				<td>${member.email}</td>
				<td>${member.gender}</td>
				<td>${member.birth}</td>
				<td>${member.survey_cnt}</td>
				<td>${member.vote_cnt}</td>
				<td>${member.quest_cnt}</td>
				<td>${member.report_cnt}</td>
				<td>${member.reported_cnt}</td>
				<td>${member.reg_date}</td>
				<td><button type="button" id="modifyMember" class="fa fa-pencil-square-o" onclick="modify(${member.mber_no})"></button></td>
			</tr>
		</c:forEach>
		</tbody>
	</table>
	<div class="row">

		<div class="col-md-2 pull-right">
			<button type="button" class="btn btn-danger pull-right"
				id="deleteMember">삭제</button>
		</div>
	</div>

	<form id="frmDelete" class="frmForDelete" action="" method="post"
		hidden="hidden"></form>

</div>

<!-- 레이어 팝업  Wrapper-->
<div id="popupWrapper" style="display: none;"></div>




<%@include file="include/footer.jsp"%>

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
<!--  bpopup -->
<script src="/resources/plugins/jQuery/jquery.bpopup.min.js"></script>



<script>

	
	var memberList = $("#memberList").DataTable({
        "language"    : {
          'zeroRecords'       : "검색결과가 없습니다.",
          'info'              : "질문 글 수 :  _TOTAL_ 개",
          'infoEmpty'         : "질문 글 수 :  _TOTAL_ 개",
          'infoFiltered'      : " ",
          "lengthMenu"        : "출력 개수 :  _MENU_",
          'paginate'          : {
            "first" : "처음",
            "last"  : "마지막",
            "next"  : "다음",
            "previous" : "이전"
          }

        },
        "scrollY"              : 400,
        "scrollCollapse"       : true,
        "lengthMenu"           : [ 15, 25, 50 ],
        "pageLength"           : 25,
        "pagingType"           : "full_numbers",
        "dom"                  :'<"top"<"col-md-4"i><"col-md-6"B><"col-md-2"l>>' +
                                 'rt' +
                                 '<"bottom pull-left"<"col-md-12"p>>',

        "select"              : "multi",
        'columnDefs'          : [{
                                   'targets': 0,
                                   'searchable': false,
                                   'orderable': false,
                                   'className': 'dt-body-center',
                                   'render': function (data, type, full, meta){
                                       return '<input type="checkbox" name="id[]" value="' + $('<div/>').text(data).html() + '">';
                                           }
                                }],
        "autoWidth" : false,


      });
	
	function tableInit() {
		$('#memberList').DataTable().columns().search("").draw();
	}

	 // 전체 체크박스 선택 및 해제 기능 구현
    $('#selectAll').on('click', function(){
  	  
        var rows = memberList.rows({ 'search': 'applied' }).nodes();
        $('input[type="checkbox"]', rows).prop('checked', this.checked);

   });
	
	// 검색 버튼 클릭 이벤트
	  $("#searchMember").click(function(){
		 searchMember(); 
	  });
	  
	  // 입력창 엔터 이벤트
	  $("#keywords").keydown(function(key){
		  
		 if(key.keyCode == 13){
			 searchMember();
		 } 
	  });
	  
	  //질문 글 검색 후 테이블 그리는 함수
	  function searchMember(){
		  tableInit();
		  memberList
        .columns( $('#searchCategory > option:selected').val() )
        .search($("#keywords").val())
        .draw();
	  }
	
	// 수정 팝업 출력
	function modify(mberno) {
		//var mberNo = $(this).children("td").eq(0).val();
		var mberNo = mberno;
		console.log(mberNo);
		openMemberInfoPopup(mberNo);
	}

	// 수정 팝업의 정보
	function openMemberInfoPopup(mberNo) {

		$.ajax({
			type : "GET",
			url : "/member/info",
			data : {
				memberNo : mberNo
			},
			dataType : "html",
			success : function(data) {
				$("#popupWrapper").bPopup({
					follow : [ true, true ],
				position : [ 700, 40 ]
				});
				$("#popupWrapper").html(data);

			},
			error : function(request, status) {
				$("#popupWrapper").hide();
				alert("팝업 오류");
			}
		});
	}

	// 회원 삭제
	$("#deleteMember").click(
			function() {

				var cnt = $("input[type='checkbox']:checked").length;

				if (cnt < 1) {
					alert("선택된 회원이 없습니다.");
				} else {

					memberList.$("input[type='checkbox']").each(
							function() {
								if (this.checked) { //체크된게 있으면 form에 input 동적 추가		
									$("#frmDelete").append(
											$('<input>').attr('type', 'hidden')
													.attr('name', 'deleteMemberList')
													.val($(this).parents("td").next().text())); //.next().text()
								}
							});

					$.ajax({

						type : "GET",
						url : "/member/confirm",
						data : {

						},
						dataType : "html",
						success : function(data) {

							$("#popupWrapper").bPopup({
								follow : [ true, true ],
							//position: [465, 0] 
							});
							$("#popupWrapper").html(data);

						},
						error : function(request, status) {
							$("#popupWrapper").hide();
							alert("팝업 오류");
						}
					});
				}
			});
</script>
</body>
</html>
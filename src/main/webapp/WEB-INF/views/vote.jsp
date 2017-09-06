<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ page session="true"%>

<%@include file="include/header.jsp"%>

<!-- Content start -->
        <div class="box">
           <div class="box-header">
             <p><h2 class="box-title"><mark>질문 글</mark></h2></p>

           </div>
           <!-- /.box-header -->
           <div class="box-body">
             <div class="input-group">
               <div class="row">
                 <div class="col-md-2">
                    <h4>검색</h4>
                 </div>
                 <div class="col-md-4">
                   <select id="questCategory" class="form-control form-group-inline" onchange="selectChange()" style="display:inline-block">
                     <option value="3">작성자</option>
                     <option value="1">등록번호</option>
                   </select>
                 </div>
                 <div class="col-md-6">
                   <input type="text" id="questSearch" class="form-control"></input>
                 </div>
               </div>

             </div>

             <table id="tabQuest" class="table table-bordered table-hover">
               <thead>
               <tr>
                 <th><input type="checkbox" name="select_all" value="1" id="tabQuest-select-all"></th>
                 <th>등록번호</th>
                 <th>투표내용</th>
                 <th>작성자</th>
                 <th>참여자 수</th>
                 <th>작성일</th>
                 <th>투표시간</th>
                 <th>진행상태</th>
                 <th>신고건수</th>
               </tr>
               </thead>
               <tbody>
                 <tr>
                   <td></td>
                   <td>2342</td>
                   <td>가나달마바사아자차카파타하</td>
                   <td>zajan91@naver.com</td>
                   <td>433</td>
                   <td>17-12-23 14:34:55</td>
                   <td>30분</td>
                   <td>완료</td>
                   <td>2</td>
                 </tr>
                 <tr>
                   <td></td>
                   <td>2444</td>
                   <td>케케케케케갸캬캬캬컄코코코콬코리</td>
                   <td>abc@gmail.com</td>
                   <td>123</td>
                   <td>17-12-25 14:34:55</td>
                   <td>15분</td>
                   <td>완료</td>
                   <td>0</td>
                 </tr>
                 <tr>
                   <td></td>
                   <td>2444</td>
                   <td>케케케케케갸캬캬캬컄코코코콬코리</td>
                   <td>abc@gmail.com</td>
                   <td>123</td>
                   <td>17-12-25 14:34:55</td>
                   <td>15분</td>
                   <td>완료</td>
                   <td>0</td>
                 </tr>
                 <tr>
                   <td></td>
                   <td>2444</td>
                   <td>케케케케케갸캬캬캬컄코코코콬코리</td>
                   <td>abc@gmail.com</td>
                   <td>123</td>
                   <td>17-12-25 14:34:55</td>
                   <td>15분</td>
                   <td>완료</td>
                   <td>0</td>
                 </tr>
                 <tr>
                   <td></td>
                   <td>2444</td>
                   <td>케케케케케갸캬캬캬컄코코코콬코리</td>
                   <td>abc@gmail.com</td>
                   <td>123</td>
                   <td>17-12-25 14:34:55</td>
                   <td>15분</td>
                   <td>완료</td>
                   <td>0</td>
                 </tr>
                 <tr>
                   <td></td>
                   <td>2444</td>
                   <td>케케케케케갸캬캬캬컄코코코콬코리</td>
                   <td>abc@gmail.com</td>
                   <td>123</td>
                   <td>17-12-25 14:34:55</td>
                   <td>15분</td>
                   <td>완료</td>
                   <td>0</td>
                 </tr>
                 <tr>
                   <td></td>
                   <td>2444</td>
                   <td>케케케케케갸캬캬캬컄코코코콬코리</td>
                   <td>abc@gmail.com</td>
                   <td>123</td>
                   <td>17-12-25 14:34:55</td>
                   <td>15분</td>
                   <td>완료</td>
                   <td>0</td>
                 </tr>
                 <tr>
                   <td></td>
                   <td>2444</td>
                   <td>케케케케케갸캬캬캬컄코코코콬코리</td>
                   <td>abc@gmail.com</td>
                   <td>123</td>
                   <td>17-12-25 14:34:55</td>
                   <td>15분</td>
                   <td>완료</td>
                   <td>0</td>
                 </tr>
                 <tr>
                   <td></td>
                   <td>2444</td>
                   <td>케케케케케갸캬캬캬컄코코코콬코리</td>
                   <td>abc@gmail.com</td>
                   <td>123</td>
                   <td>17-12-25 14:34:55</td>
                   <td>15분</td>
                   <td>완료</td>
                   <td>0</td>
                 </tr>
                 <tr>
                   <td></td>
                   <td>2444</td>
                   <td>케케케케케갸캬캬캬컄코코코콬코리</td>
                   <td>abc@gmail.com</td>
                   <td>123</td>
                   <td>17-12-25 14:34:55</td>
                   <td>15분</td>
                   <td>완료</td>
                   <td>0</td>
                 </tr>
                 <tr>
                   <td></td>
                   <td>2444</td>
                   <td>케케케케케갸캬캬캬컄코코코콬코리</td>
                   <td>abc@gmail.com</td>
                   <td>123</td>
                   <td>17-12-25 14:34:55</td>
                   <td>15분</td>
                   <td>완료</td>
                   <td>0</td>
                 </tr>
                 <tr>
                   <td></td>
                   <td>2444</td>
                   <td>케케케케케갸캬캬캬컄코코코콬코리</td>
                   <td>abc@gmail.com</td>
                   <td>123</td>
                   <td>17-12-25 14:34:55</td>
                   <td>15분</td>
                   <td>완료</td>
                   <td>0</td>
                 </tr>
                 <tr>
                   <td></td>
                   <td>2444</td>
                   <td>케케케케케갸캬캬캬컄코코코콬코리</td>
                   <td>abc@gmail.com</td>
                   <td>123</td>
                   <td>17-12-25 14:34:55</td>
                   <td>15분</td>
                   <td>완료</td>
                   <td>0</td>
                 </tr>
                 <tr>
                   <td></td>
                   <td>2444</td>
                   <td>케케케케케갸캬캬캬컄코코코콬코리</td>
                   <td>abc@gmail.com</td>
                   <td>123</td>
                   <td>17-12-25 14:34:55</td>
                   <td>15분</td>
                   <td>완료</td>
                   <td>0</td>
                 </tr>
                 <tr>
                   <td></td>
                   <td>2444</td>
                   <td>케케케케케갸캬캬캬컄코코코콬코리</td>
                   <td>abc@gmail.com</td>
                   <td>123</td>
                   <td>17-12-25 14:34:55</td>
                   <td>15분</td>
                   <td>완료</td>
                   <td>0</td>
                 </tr>
                 <tr>
                   <td></td>
                   <td>2444</td>
                   <td>케케케케케갸캬캬캬컄코코코콬코리</td>
                   <td>abc@gmail.com</td>
                   <td>123</td>
                   <td>17-12-25 14:34:55</td>
                   <td>15분</td>
                   <td>완료</td>
                   <td>0</td>
                 </tr>
                </tbody>

              </table>
              <div class="row">
                <div class="col-md-3 pull-right">
                  <button type="button" class="btn btn-primary" id="btnBlind">블라인드 적용</button>
                  <button type="button" class="btn btn-danger" id="btnDelete">삭제</button>
                </div>
              </div>
            </div>
          </div>  <!-- /.box-body -->

          <form id="frmBlind" class="" action="" method="post" hidden="hidden">

          </form>

          <form id="frmDelete" class="" action="" method="post" hidden="hidden">

          </form>



          <div class="box">
             <div class="box-header">
               <p><h2 class="box-title"><mark>투표 참여 관리</mark></h2></p>
             </div>
             <!-- /.box-header -->
             <div class="box-body">
               <div class="input-group">
                 <div class="row">
                   <div class="col-md-4">
                      <h4>참여자</h4>
                   </div>
                   <div class="col-md-8">
                     <input type="text" id="voteSearch" class="form-control"></input>
                   </div>
                 </div>

               </div>

               <table id="tabVote" class="table table-bordered table-hover">
                 <thead>
                 <tr>
                   <th>투표 내용</th>
                   <th>선택지 내용</th>
                   <th>참여자</th>
                   <th>투표일</th>
                 </tr>
                 </thead>
                 <tbody id="body" hidden="hidden">
                   <tr>
                       <td>우갸갸갸갸갸갸갸갸갸갸</td>
                       <td>코카콜라</td>
                       <td>zajan91@naver.com</td>
                       <td>17-01-31 14:32:13</td>
                   </tr>
                   <tr>
                       <td>전지현이 이뻐요 송혜교가 이뻐요</td>
                       <td>전지현</td>
                       <td>dgdg@naver.com</td>
                       <td>17-01-31 14:32:13</td>
                   </tr>
                   <tr>
                       <td>커피먹는다 콜라먹는다</td>
                       <td>커피</td>
                       <td>dfgdhwewf@naver.com</td>
                       <td>17-01-31 14:32:13</td>
                   </tr>
                   <tr>
                       <td>커피먹는다 콜라먹는다</td>
                       <td>커피</td>
                       <td>dfgdhwewf@naver.com</td>
                       <td>17-01-31 14:32:13</td>
                   </tr>
                   <tr>
                       <td>커피먹는다 콜라먹는다</td>
                       <td>커피</td>
                       <td>dfgdhwewf@naver.com</td>
                       <td>17-01-31 14:32:13</td>
                   </tr>
                   <tr>
                       <td>커피먹는다 콜라먹는다</td>
                       <td>커피</td>
                       <td>dfgdhwewf@naver.com</td>
                       <td>17-01-31 14:32:13</td>
                   </tr>
                   <tr>
                       <td>커피먹는다 콜라먹는다</td>
                       <td>커피</td>
                       <td>dfgdhwewf@naver.com</td>
                       <td>17-01-31 14:32:13</td>
                   </tr>
                   <tr>
                       <td>커피먹는다 콜라먹는다</td>
                       <td>커피</td>
                       <td>dfgdhwewf@naver.com</td>
                       <td>17-01-31 14:32:13</td>
                   </tr>
                   <tr>
                       <td>커피먹는다 콜라먹는다</td>
                       <td>커피</td>
                       <td>dfgdhwewf@naver.com</td>
                       <td>17-01-31 14:32:13</td>
                   </tr>
                   <tr>
                       <td>커피먹는다 콜라먹는다</td>
                       <td>커피</td>
                       <td>dfgdhwewf@naver.com</td>
                       <td>17-01-31 14:32:13</td>
                   </tr>
                   <tr>
                       <td>커피먹는다 콜라먹는다</td>
                       <td>커피</td>
                       <td>dfgdhwewf@naver.com</td>
                       <td>17-01-31 14:32:13</td>
                   </tr>
                   <tr>
                       <td>커피먹는다 콜라먹는다</td>
                       <td>커피</td>
                       <td>dfgdhwewf@naver.com</td>
                       <td>17-01-31 14:32:13</td>
                   </tr>
                   <tr>
                       <td>커피먹는다 콜라먹는다</td>
                       <td>커피</td>
                       <td>dfgdhwewf@naver.com</td>
                       <td>17-01-31 14:32:13</td>
                   </tr>
                   <tr>
                       <td>커피먹는다 콜라먹는다</td>
                       <td>커피</td>
                       <td>dfgdhwewf@naver.com</td>
                       <td>17-01-31 14:32:13</td>
                   </tr>
                   <tr>
                       <td>커피먹는다 콜라먹는다</td>
                       <td>커피</td>
                       <td>dfgdhwewf@naver.com</td>
                       <td>17-01-31 14:32:13</td>
                   </tr>
                   <tr>
                       <td>커피먹는다 콜라먹는다</td>
                       <td>커피</td>
                       <td>dfgdhwewf@naver.com</td>
                       <td>17-01-31 14:32:13</td>
                   </tr>
                   <tr>
                       <td>커피먹는다 콜라먹는다</td>
                       <td>커피</td>
                       <td>dfgdhwewf@naver.com</td>
                       <td>17-01-31 14:32:13</td>
                   </tr>
                   <tr>
                       <td>커피먹는다 콜라먹는다</td>
                       <td>커피</td>
                       <td>dfgdhwewf@naver.com</td>
                       <td>17-01-31 14:32:13</td>
                   </tr>
                   <tr>
                       <td>커피먹는다 콜라먹는다</td>
                       <td>커피</td>
                       <td>dfgdhwewf@naver.com</td>
                       <td>17-01-31 14:32:13</td>
                   </tr>
                </tbody>
              </table>
            </div>
          </div>

    <!-- Bootstrap 3.3.2 JS -->
    <script src="/resources/bootstrap/js/bootstrap.min.js" type="text/javascript"></script>
    <script src="/resources/plugins/slimScroll/jquery.slimscroll.min.js"></script>
    <!-- FastClick -->
    <script src='/resources/plugins/fastclick/fastclick.min.js'></script>
    <!-- AdminLTE App -->
    <script src="/resources/dist/js/app.min.js" type="text/javascript"></script>
    <!-- AdminLTE for demo purposes -->
    <script src="/resources/dist/js/demo.js" type="text/javascript"></script>
    <!-- DataTables -->
    <script src="/resources/plugins/datatables/jquery.dataTables.min.js"></script>
    <script src="/resources/plugins/datatables/dataTables.bootstrap.min.js"></script>
    <script src="/resources/plugins/datatables/extensions/Select-1.2.2/js/dataTables.select.min.js"></script>

    <script>

      /*******   질문 글 관련 Script *********/

      var tabQuest = $("#tabQuest").DataTable({
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
        "scrollCollapse"       : false,
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

      $('#tabQuest-select-all').on('click', function(){
          // Get all rows with search applied
          var rows = tabQuest.rows({ 'search': 'applied' }).nodes();
          // Check/uncheck checkboxes for all rows in the table
          $('input[type="checkbox"]', rows).prop('checked', this.checked);

     });

      $('#questSearch').on( 'keyup', function () {
          tabQuest
              .columns( $('#questCategory > option:selected').val() )
              .search( this.value )
              .draw();
      });

      function selectChange(){

        var temp = $("#questSearch").val();
        tabQuest
              .search('')
              .columns().search('')
              .draw();
        tabQuest
              .columns( $('#questCategory > option:selected').val() )
              .search(temp)
              .draw();
      }

      $("#btnBlind").click(function(){

        tabQuest.$("input[type='checkbox']").each(function(){
          if(this.checked){
             // Create a hidden element
            //  $(form).append(
            //     $('<input>')
            //        .attr('type', 'hidden')
            //        .attr('name', this.name)
            //        .val(this.
            //  );
            alert($(this).parents("td").next().text());
          }
        });
        // $("#frmEx").submit(function(e){
        //
        //   var form = this;
        //
        // });
      });



      /*******   투표 참여 관리 관련 Script *********/

      var tabVote = $("#tabVote").DataTable({

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
        "dom"                  :'<"top"<"col-md-4"><"col-md-6"B><"col-md-2"l>>' +
                                 'rt' +
                                 '<"bottom pull-left"<"col-md-12"p>>',
        "autoWidth" : false,

      });

      $('#voteSearch').on( 'keyup', function () {

          $("#body").show();
          tabVote
              .columns(2)
              .search( this.value )
              .draw();
      });




    </script>


<%@include file="include/footer.jsp"%>

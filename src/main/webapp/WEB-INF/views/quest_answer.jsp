<html>
<head>
  <title>문의사항 답변 작성</title>
</head>
<body onload="window.resizeTo(400,200)">  <!-- 아직 bPopup 라이브러리 적용 전이라 임의로 팝업창 UI 작성했음. -->

          <input type="button" value="문의사항 답변 작성" onclick="read();" />
          <script language="javascript">
            function read() { window.open("question_read", "문의사항 답변 작성", "width=600, height=400, left=100, top=50"); }
          </script>

          <input type="button" value="문의사항 답변 결과" onclick="answer();" />
          <script language="javascript">
            function answer() { window.open("question_answer", "문의사항 답변 작성", "width=600, height=400, left=100, top=50"); }
          </script>


          <div class="row">
            <div class="col-sm-1 text-right">
              <h4><strong>등록번호</strong></h4>
            </div>
            <div class="col-sm-2">
              <h4 name="quest_no">183</h4>
            </div>
            <div class="col-sm-1 text-right">
              <h4><strong>문의유형</strong></h4>
            </div>
            <div class="col-sm-1">
              <h4 name="quest_category">회원관리</h4>
            </div>
          </div>
          <div class="row">
            <div class="col-sm-1 text-right">
              <h4><strong>제목</strong></h4>
            </div>
            <div class="col-sm-2">
              <h4 name="title">핸드폰 번호 수정하고 싶어요~</h4>
            </div>
            <div class="col-sm-1 text-right">
              <h4><strong>문의시간</strong></h4>
            </div>
            <div class="col-sm-1">
              <h4 name="reg_date">17-08-13 10:21:43</h4>
            </div>
          </div>
          <div class="row">
            <div class="col-sm-1 text-right">
              <h4><strong>문의자</strong></h4>
            </div>
            <div class="col-sm-2">
              <h4 name="mber_no">abc@gamil.com</h4>
            </div>
          </div>
          <div class="row">
           <div class="col-sm-1 text-right">
            <h4><strong>내용</strong></h4>
           </div>
           <div class="col-sm-4">
             <textarea name="contents" rows="4" class="form-control">제가 가입할 때 폰 번호를 잘못기입해서 그러는데 새로 수정해주실 수 있나요? 010-4385-3888 입니다.</textarea>
           </div>
          </div>

          <hr class="col-sm-5" style="border: solid 1px #ADADAD;">


</body>
</html>
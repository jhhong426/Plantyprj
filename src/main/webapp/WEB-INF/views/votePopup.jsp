<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ page session="true"%>

<!DOCTYPE html>
<html>
  <head>
    <!-- META DATA -->
    <meta charset="UTF-8">
    <meta content='width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no' name='viewport'>

    <title>물어보자 관리시스템</title>

    <!-- STYLE -->
    <!-- Bootstrap 3.3.4 -->
    <link rel="stylesheet" href="/resources/bootstrap/css/bootstrap.css">
    <!-- Font Awesome Icons -->
    <link href="https://maxcdn.bootstrapcdn.com/font-awesome/4.3.0/css/font-awesome.min.css" rel="stylesheet" type="text/css" />
    <!-- Ionicons -->
    <link href="https://code.ionicframework.com/ionicons/2.0.1/css/ionicons.min.css" rel="stylesheet" type="text/css" />
    <!-- Theme style -->
    <link href="/resources/dist/css/AdminLTE.min.css" rel="stylesheet" type="text/css" />
    <!-- AdminLTE Skins. Choose a skin from the css/skins
         folder instead of downloading all of them to reduce the load. -->
    <link href="/resources/dist/css/skins/_all-skins.min.css" rel="stylesheet" type="text/css" />
    <!-- Custom Style -->
    <link href="/resources/bootstrap/css/style.css" rel="stylesheet">

    <!-- SCRIPT -->
    <!-- jQuery 2.1.4 -->
    <script src="/resources/plugins/jQuery/jQuery-2.1.4.min.js"></script>
    <script src="/resources/bootstrap/js/bootstrap.min.js"></script>

    </script>

    <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
        <script src="https://oss.maxcdn.com/html5shiv/3.7.2/html5shiv.min.js"></script>
        <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
    <![endif]-->
  </head>

  <body>
      <div class="box box-primary">
        <div class="box-header with-border">
          <div class="box-title">
            <p>투표 상세 정보</p>
          </div>
        </div>

        <div class="box-body">
          <div class="form-group">

            <div class="row">
              <div class="col-md-1">
                <label for="">등록번호</label>
              </div>
              <div class="col-md-4">
                <input type="text" name="" value="343543" disabled>
              </div>
              <div class="col-md-1">
                <label for="">작성자</label>
              </div>
              <div class="col-md-4">
                <input type="text" name="" value="zajan91@nasver.com" disabled>
              </div>
            </div>
            <div class="row">
              <div class="col-md-1">
                <label for="">작성일</label>
              </div>
              <div class="col-md-4">
                <input type="text" name="" value="15-11-24 14:34:33" disabled>
              </div>
              <div class="col-md-1">
                <label for="">투표시간</label>
              </div>
              <div class="col-md-4">
                <input type="text" name="" value="30분" disabled>
              </div>
            </div>
            <div class="row">
              <div class="col-md-1">
                <label for="">진행상태</label>
              </div>
              <div class="col-md-4">
                <input type="text" name="" value="완료" disabled>
              </div>
              <div class="col-md-1">
                <label for="">신고건수</label>
              </div>
              <div class="col-md-4">
                <input type="text" name="" value="1" disabled>
              </div>
            </div>

            <div class="form-group">
              <label>투표내용</label>
              <textarea class="form-control" rows="8" cols="30" disabled>전지현이 이쁨, 송혜교가 이쁨</textarea>
            </div>

            <table class="table table-bordered">
              <tbody>
                <tr>
                  <th>선택지</th>
                  <th>투표자 수</th>
                  <th>남자</th>
                  <th>여자</th>
                </tr>
                <tr>
                  <td>선택지1</td>
                  <td>40</td>
                  <td>30</td>
                  <td>10</td>
                </tr>
                <tr>
                  <td>선택지2</td>
                  <td>40</td>
                  <td>30</td>
                  <td>10</td>
                </tr>
              </tbody>
            </table>

          </div>
        </div>
      </div>


  </body>
</html>

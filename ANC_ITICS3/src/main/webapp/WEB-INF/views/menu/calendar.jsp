<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
 <html>
 <head>
 <meta http-equiv="Content-Type" content = "text/html; charset = utf-8">
 <title>운송현황</title>
 <meta name = "viewport" content = "width=device-width, initial-scale = 1">
  <link rel = "stylesheet" href = "ui/jquery.mobile-1.2.0.min.css" />
 <link href="http://ajax.googleapis.com/ajax/libs/jqueryui/1.8/themes/base/jquery-ui.css" rel="stylesheet" type="text/css"/>
 <script src="http://ajax.googleapis.com/ajax/libs/jquery/1.7/jquery.min.js"></script>
 <script src="http://ajax.googleapis.com/ajax/libs/jqueryui/1.8/jquery-ui.min.js"></script> 
 
<style>
.ui-datepicker{ font-size: 14px; width: 250px; }
.ui-datepicker select.ui-datepicker-month{ width:30%; font-size: 11px; }
.ui-datepicker select.ui-datepicker-year{ width:40%; font-size: 11px; }
</style>
<script language = "javascript" type = "text/javascript">

$(document).ready(function() {
  
   //******************************************************************************
   // 상세검색 달력 스크립트
  //******************************************************************************
   var clareCalendar = {
    monthNamesShort: ['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월'],
    dayNamesMin: ['일','월','화','수','목','금','토'],
    weekHeader: 'Wk',
    dateFormat: 'yy-mm-dd', //형식(2012-03-03)
    autoSize: false, //오토리사이즈(body등 상위태그의 설정에 따른다)
    changeMonth: true, //월변경가능
   changeYear: true, //년변경가능
   showMonthAfterYear: true, //년 뒤에 월 표시
   buttonImageOnly: true, //이미지표시
   buttonText: '달력선택', //버튼 텍스트 표시
   buttonImage: 'menu/cale_bg.jpg', //이미지주소
   showOn: "both", //엘리먼트와 이미지 동시 사용(both,button)
    yearRange: '1990:2020' //1990년부터 2020년까지

  };
   $("#fromDt").datepicker(clareCalendar);
   $("#toDt").datepicker(clareCalendar);
   //$("#Requestdate").datepicker(clareCalendar);
   //$("#tr_time").datepicker(clareCalendar);
   $("img.ui-datepicker-trigger").attr("style","margin-left:5px; vertical-align:middle; cursor:pointer;"); //이미지버튼 style적용
  $("#ui-datepicker-div").hide(); //자동으로 생성되는 div객체 숨김  
  });

</script>
 </head>
 </html>
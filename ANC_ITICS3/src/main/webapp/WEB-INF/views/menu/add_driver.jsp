<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<!DOCTYPE HTML>


<html>
	<head>
		<title>ANC ITICS - 운전자 등록</title>
		<meta charset="utf-8" />
		<meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no" />
		<link rel="stylesheet" href="../assets/css/subpage.css" />
		<script src="http://code.jquery.com/jquery-1.10.1.min.js"></script>
		<script src="../assets/js/jquery-3.2.1.js"></script>
		
		<script type="text/javascript">

	
			function readURL(input) {
			
			    if (input.files && input.files[0]) {
			
			        var reader = new FileReader();
			
			        reader.onload = function (e) {
			
			            $('#driver_pic').attr('src', e.target.result);
			            
			            document.getElementById("imgcode").value = e.target.result; //이미지 base64코드
			            //alert(document.getElementById("imgcode").value); //이미지 base64코드
			
			        }
			        reader.readAsDataURL(input.files[0]);
			    }
			}
			
			 $(document).ready(function() 
				{
				 $('#savedrv_btn').click(function(){
						var formData = $("#AddDriver").serialize();
						//alert(formData);
						
						//alert(document.getElementById("hblno").value);
						//alert(express_name);
					if (confirm("해당정보로 운전자 등록을 하시겠습니까?") == true){ 
						//alert(driver_name);
						   $.ajax({
						        type: 'post',
						        url: '../DriverInsertAction.do',
						        cache : false,
						        data : formData,
						        contentType : 'application/x-www-form-urlencoded; charset=UTF-8',
						        success: function(data){
						        	//$('#searchdrv').html(data);
						        }
						   });
						   alert("등록되었습니다.");
						}
						   return false; //<- 이 문장으로 새로고침(reload)이 방지됨
						});
				});
		</script>
	</head>
<body>
	
<form id="AddDriver" name="AddDriver" method="post">

<input id="imgcode" name="imgcode" type="hidden" value=""/> 
<div class="box container" style="border:none;">

						
				<h1 style="font-size:15px;"><i class="fa fa-plus-square-o" aria-hidden="true"></i> 신규 등록</h1>
				<div>
					<table class="table">
								    <tr>
								        <!-- <td rowspan="2">
								            <img id="driver_pic" name="driver_pic" src="../images/driver_no_image.jpg" width="85" height="111"><input type='file' onchange="readURL(this);" style='position：absolute; margin-left:-80px; width:62px; height:18px; filter:alpha(opacity=0); opacity:0; -moz-opacity:0; cursor:pointer;'/>
								        </td> -->
								       <!--  <td>
								            <font face="맑은 고딕"><b>운전자 등록번호</b><input type="text" id="driver_id" name="driver_id" value=""  style="width:100%;"  size="5" disabled/></font>
								        </td> -->
								        <td>
								            <font face="맑은 고딕"><b>성명</b><input type="text" id="driver_name" name="driver_name" value="" size="15"></font>
								        </td>
								        <td>
								            <font face="맑은 고딕"><b>재직여부</b></font>
								            <select id="status_yn" name="status_yn" size="1" OnKeyDown="">
								                <option value="Y"> 재직</option>
								         		<option value="N"> 퇴직</option>
											</select>
								        </td>
								    </tr>
								    
								    <tr>
								        <td>
								            <font face="맑은 고딕"><b>생년월일</b><input type="text" id="driver_birth" name="driver_birth" value=""  size="15"></font>
								        </td>
								        <!-- <td>
								            <font face="맑은 고딕"><b>차량번호</b><input type="text" id="car_no" name="car_no" value=""  size="13"></font>
								        </td> -->
								        <td>
								            <font face="맑은 고딕"><b>전화번호</b><input type="text" id="driver_hp" name="driver_hp" value="" size="15"></font>
								        </td>
									</tr>
									
									<tr>
								        <td align="center">
								            <font face="맑은 고딕"><b>비고</b></font>
								        </td>
								        <td>
								            <font face="맑은 고딕"><input type="text" id="etc" name="etc" value=""  size="15"/></font>
								        </td>
								    </tr>
   
							<tr>
								<td colspan=2 align="center">
									<table>
										<tr>
											<button id="savedrv_btn" name="savedrv_btn" class="button medium gray">저장</button>
										</tr>
									</table>
								</td>
							</tr>
							</table>
						 </div>
					 
				
								
								
</div>							

							<!-- Section -->
				 
			</form>
			</body>
</html>




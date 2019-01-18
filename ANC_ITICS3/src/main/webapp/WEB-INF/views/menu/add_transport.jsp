<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<!DOCTYPE HTML>



<html>
	<head>
		<title>ANC ITICS - 운송수단 등록</title>
		<meta charset="utf-8" />
		<meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no" />
		<link rel="stylesheet" href="../assets/css/subpage.css" />
		<script src="../assets/js/jquery-3.2.1.js"></script>
		<script type="text/javascript">
		
		$(function() {
		    $("#trans_type").change(function() {
		    	var selectedIdx = $("#trans_type option").index($("#trans_type option:selected")) + 1;
		    	var selectedValue = $(this).val();
		    	
		    	for (i=1; i<8; i++){
		    		if(selectedIdx==i){
		    			$("#view"+selectedIdx).show();
		    			$("#view"+selectedIdx).attr("readonly" ,false);
		    		}else{
		    			$("#view"+i).hide();
		    			$("#view"+i).attr("readonly" ,true); 
		    			
		    		}
		    	}
		    });
		});
		
		 $(function() 
				 {
				 	 $('#savebtn').click(function(){
				 		 
				 			var formData = $("#AddTransport").serialize();
				 			
				 			var trans_type = document.getElementById("trans_type").value; //차량종류

				 			//alert(trans_type);
				 			
				 			switch (trans_type){
				 				case "TRU" :
				 					var car_size = encodeURIComponent(document.getElementById("car_size_TRU").value); //사이즈
					 				var car_no = encodeURIComponent(document.getElementById("car_no_TRU").value); //운송수단 번호
					 				var status_yn = document.getElementById("status_yn_TRU").value; //사용여부
				 					break;
				 				case "CON" :
				 					var car_size = encodeURIComponent(document.getElementById("car_size_CON").value); //사이즈
					 				var car_no = encodeURIComponent(document.getElementById("car_no_CON").value); //운송수단 번호
					 				var status_yn = document.getElementById("status_yn_CON").value; //사용여부
				 					break;
				 				case "TRA" :
					 				var car_no = encodeURIComponent(document.getElementById("car_no_TRA").value); //운송수단 번호
					 				var status_yn = document.getElementById("status_yn_TRA").value; //사용여부
				 					break;
				 				case "ICON" :
				 					var car_size = encodeURIComponent(document.getElementById("car_size_ICON").value); //사이즈
					 				var car_no = encodeURIComponent(document.getElementById("car_no_ICON").value); //운송수단 번호
					 				var status_yn = document.getElementById("status_yn_ICON").value; //사용여부
				 					break;
				 				case "TREC" :
					 				var car_no = encodeURIComponent(document.getElementById("car_no_TREC").value); //운송수단 번호
					 				var status_yn = document.getElementById("status_yn_TREC").value; //사용여부
				 					break;
				 				case "TR" :
					 				var car_no = encodeURIComponent(document.getElementById("car_no_TR").value); //운송수단 번호
					 				var status_yn = document.getElementById("status_yn_TR").value; //사용여부
				 					break;
				 				case "ETC" :
					 				var car_no = encodeURIComponent(document.getElementById("car_no_ETC").value); //운송수단 번호
					 				var status_yn = document.getElementById("status_yn_ETC").value; //사용여부
				 					break;
				 			}
				 			
				 			if (trans_type=="TRU" || trans_type=="CON" || trans_type=="ICON"){
				 				
				 				//alert("트럭 or 컨테이너 들어옴");
				 				
				 				//input ID를 운송수단별로 다 만들어야할듯
				 				//alert("트럭종류:"+car_size +"운송수단번호:"+ car_no +"사용여부:"+status_yn);
				 				
				 				if (confirm("해당정보를 저장하시겠습니까?") == true){ 
						 			
						 			   $.ajax({
						 			        type: 'get',
						 			        url: '../TransportInsertAction.do?trans_type='+ trans_type + "&car_no="+ car_no +"&status_yn="+status_yn +"&car_size="+car_size,
						 			        cache : false,
						 			        data : formData,
						 			        contentType : 'application/x-www-form-urlencoded; charset=UTF-8',
						 			        success: function(data){
						 			        	//$('#searchdrv').html(data);
						 			        }
						 			   });
						 			   alert("저장이 완료되었습니다.");
						 			}
				 			}else{
				 				alert("다른것들 들어옴");
				 				
				 				alert("운송수단번호:"+ car_no +"사용여부:"+status_yn);
				 				
				 				if (confirm("해당정보를 저장하시겠습니까?") == true){ 
						 			//alert(driver_name);
						 			   $.ajax({
						 			        type: 'get',
						 			        url: '../TransportInsertAction.do?trans_type='+ trans_type +"&car_no="+ car_no +"&status_yn="+status_yn,
						 			        cache : false,
						 			        data : formData,
						 			        contentType : 'application/x-www-form-urlencoded; charset=UTF-8',
						 			        success: function(data){
						 			        	//$('#searchdrv').html(data);
						 			        }
						 			   });
						 			   alert("저장이 완료되었습니다.");
						 			}
				 			}
				 		
				 			   return false; //<- 이 문장으로 새로고침(reload)이 방지됨
				 			});
				 		});
		</script>
		
	</head>
<body>
	
<form name="AddTransport" method="post">


<div class="box container" style="border:none;">

						<h1 align="right" style="font-size:13px"><i class="fa fa-list" aria-hidden="true"></i> 차량 종류 
							<select name="trans_type" id="trans_type" style="width:150px;height:20px;display:inline-block;text-align:center;">
								<!--<option value=""></option>-->
									<option value="TRU">트럭</option>
									<option value="CON" >컨테이너</option>
				                    <option value="TRA">트레일러</option>
				                    <option value="ICON">냉동컨테이너</option>
				                    <option value="TREC">트랙터</option>
				                    <option value="TR">TR</option>
				                    <option value="ETC">기타(무게차,유게차)</option>
							</select>
					   </h1>
					   
				<h1 style="font-size:15px;"><i class="fa fa-plus-square-o" aria-hidden="true"></i> 신규 등록</h1>
				
				<div id="view1">
					 <table class="table">
						<tr>
							<td align="center"><b>트럭 종류</b></td>
							<td>
								<select name="car_size_TRU" id="car_size_TRU" size="1">
									<option value="1톤 일반카고">1톤 일반카고</option>
									<option value="1톤 탑차 윙바디">1톤 탑차 윙바디</option>
									<option value="1.4톤 일반카고">1.4톤 일반카고</option>
									<option value="1.4톤 탑차 윙바디">1.4톤 탑차 윙바디</option>
									<option value="2.5톤 일반카고">2.5톤 일반카고</option>
									<option value="2.5톤 탑차 윙바디">2.5톤 탑차 윙바디</option>
									<option value="3.5톤 일반카고">3.5톤 일반카고</option>
									<option value="3.5톤 탑차 윙바디">3.5톤 탑차 윙바디</option>
									<option value="5톤 일반카고">5톤 일반카고</option>
									<option value="5톤 탑차 윙바디">5톤 탑차 윙바디</option>
									<option value="5톤 플러스 축차카고">5톤 플러스 축차카고</option>
									<option value="5톤 플러스 축차 탑차 윙바디">5톤 플러스 축차 탑차 윙바디</option>
									<option value="11~15톤 일반카고">11~15톤 일반카고</option>
									<option value="11~15톤 탑차 윙바디">11~15톤 탑차 윙바디</option>
									<option value="18톤 일반카고">18톤 일반카고</option>
									<option value="18톤 탑차 윙바디">18톤 탑차 윙바디</option>
									<option value="25톤 일반카고">25톤 일반카고</option>
									<option value="25톤 탑차 윙바디">25톤 탑차 윙바디</option>
								</select>
							</td>
						</tr>
						<tr>
							<td align="center"><b>차량 번호</b></td>
							<td>
								<input type="text" name="car_no_TRU" id="car_no_TRU" size="30" value="">
							</td>
						</tr>
					
						
						<tr>
							<td align="center"><b>사용여부</b></td>
							<td>
								<select name="status_yn_TRU" id="status_yn_TRU" size="1">
									<option value="Y">Y</option>
									<option value="N">N</option>
								</select>
							</td>
						</tr>
						
						
						</table>
					 </div>
					 
				<div id="view2" style="display:none;">
				 	<table class="table">
						
						<tr>
							<td align="center"><b>컨테이너 사이즈</b></td>
							<td>
								<select name="car_size_CON" id="car_size_CON" size="1">
									<option value="20DRY">20"DRY</option>
									<option value="20OPENTOP">20"OPEN TOP</option>
									<option value="20FLATRACK">20"FLAT RACK</option>
									<option value="40DRY">40"DRY</option>
									<option value="40OPENTOP">40"OPEN TOP</option>
									<option value="40FLATRACK">40"FLAT RACK</option>
									<option value="40REEFER">40"REEFER</option>
									<option value="40HQDRY">40"HQ DRY</option>
									<option value="45HQDRY">45"HQ DRY</option>
								</select>
							</td>
						</tr>
						
						<tr>
							<td align="center"><b>컨테이너 번호</b></td>
							<td>
								<input type="text" name="car_no_CON" id="car_no_CON" size="30" value="">
							</td>
						</tr>
					
						<tr>
							<td align="center"><b>사용여부</b></td>
							<td>
								<select name="status_yn_CON" id="status_yn_CON" size="1">
									<option value="Y">Y</option>
									<option value="N">N</option>
								</select>
							</td>
						</tr>
						
					
						</table>
				</div>
					 
					 <div id="view3" style="display:none;">
					 <table class="table">
					
						<tr>
							<td align="center"><b>차량 번호</b></td>
							<td>
								<input type="text" name="car_no_TRA" id="car_no_TRA" size="30" value="" >
							</td>
						</tr>
					
						
						<tr>
							<td align="center"><b>사용여부</b></td>
							<td>
								<select name="status_yn_TRA" id="status_yn_TRA" size="1" >
									<option value="Y">Y</option>
									<option value="N">N</option>
								</select>
							</td>
						</tr>
						
						
						</table>
					 </div>
					 
					 <div id="view4" style="display:none;">
					 <table class="table">
						
						<tr>
							<td align="center"><b>컨테이너 사이즈</b></td>
							<td>
								<select name="car_size_ICON" id="car_size_ICON" size="1">
									<option value="20DRY">20"DRY</option>
									<option value="20OPENTOP">20"OPEN TOP</option>
									<option value="20FLATRACK">20"FLAT RACK</option>
									<option value="40DRY">40"DRY</option>
									<option value="40OPENTOP">40"OPEN TOP</option>
									<option value="40FLATRACK">40"FLAT RACK</option>
									<option value="40REEFER">40"REEFER</option>
									<option value="40HQDRY">40"HQ DRY</option>
									<option value="45HQDRY">45"HQ DRY</option>
								</select>
							</td>
						</tr>
						
						<tr>
							<td align="center"><b>컨테이너 번호</b></td>
							<td>
								<input type="text" name="car_no_ICON" id="car_no_ICON" size="30" value="">
							</td>
						</tr>
					
						
						<tr>
							<td align="center"><b>사용여부</b></td>
							<td>
								<select name="status_yn_ICON" id="status_yn_ICON" size="1">
									<option value="Y">Y</option>
									<option value="N">N</option>
								</select>
							</td>
						</tr>
						
						
						</table>
					 </div>
					 
					 <div id="view5" style="display:none;">
					 <table class="table">
						<tr>
							<td align="center"><b>차량 번호</b></td>
							<td>
								<input type="text" name="car_no_TREC" id="car_no_TREC" size="30" value="">
							</td>
						</tr>
					
						
						<tr>
							<td align="center"><b>사용여부</b></td>
							<td>
								<select name="status_yn_TREC" id="status_yn_TREC" size="1">
									<option value="Y">Y</option>
									<option value="N">N</option>
								</select>
							</td>
						</tr>
						
						
						</table>
					 </div>
					 
					 <div id="view6" style="display:none;">
					 <table class="table">	
						<tr>
							<td align="center"><b>차량 번호</b></td>
							<td>
								<input type="text" name="car_no_TR" id="car_no_TR" size="30" value="">
							</td>
						</tr>
					
						
						<tr>
							<td align="center"><b>사용여부</b></td>
							<td>
								<select name="status_yn_TR" id="status_yn_TR" size="1" >
									<option value="Y">Y</option>
									<option value="N">N</option>
								</select>
							</td>
						</tr>
						
					
						</table>
					 </div>
					 
					 <div id="view7" style="display:none;">
					 <table class="table">	
						<tr>
							<td align="center"><b>차량 번호</b></td>
							<td>
								<input type="text" name="car_no_ETC" id="car_no_ETC" size="30" value="" >
							</td>
						</tr>
					
						
						<tr>
							<td align="center"><b>사용여부</b></td>
							<td>
								<select name="status_yn_ETC" id="status_yn_ETC" size="1">
									<option value="Y">Y</option>
									<option value="N">N</option>
								</select>
							</td>
						</tr>
						

					 	</table>
					</div>
					
					<table class="table" style="border:none;">
					<tr style="border:none;">
							<td colspan=2 align="center" style="border:none;">
								<table>
									<tr>
										<input class="button medium gray" id="savebtn" name="savebtn" type="button" value="저장"/>
									</tr>
								</table>
							</td>
						</tr>
					</table>	 	
								
</div>							

							<!-- Section -->
							

			</form>
			</body>
</html>




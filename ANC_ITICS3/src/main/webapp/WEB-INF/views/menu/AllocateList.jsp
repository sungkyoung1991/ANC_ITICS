<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<!DOCTYPE HTML>
<!--
	Editorial by HTML5 UP
	html5up.net | @ajlkn
	Free for personal and commercial use under the CCA 3.0 license (html5up.net/license)
-->
<script type="text/javascript">

	
function change_type(trans_type) {
    
    if (trans_type == "TRA") {
        
        view1.style.display = "inline"
        $('#view1').removeAttr("disabled");
        
        view2.style.display = "none"
        view2.disabled ="true"
        view3.style.display = "none"
        view3.disabled = "true"
        view4.style.display = "none"
        view4.disabled = "true"
        view5.style.display = "none"
        view5.disabled = "true"
        view6.style.display = "none"
    	view6.disabled = "true"
    	view7.style.display = "none"
    	view7.disabled = "true"
    }
    if (trans_type == "CON") {

        view1.style.display = "none"
        view1.disabled = "true"
        
        view2.style.display = "inline"
        $('#view2').removeAttr("disabled");
        
        view3.style.display = "none"
        view3.disabled = "true"
        view4.style.display = "none"
        view4.disabled = "true"
        view5.style.display = "none"
        view5.disabled = "true"
    	view6.style.display = "none"
	    view6.disabled = "true"
	    view7.style.display = "none"
	    view7.disabled = "true"

    }
    if (trans_type == "ICON") {

        view1.style.display = "none";
        view1.disabled = "true"
        view2.style.display = "none";
        view2.disabled = "true"
        
        view3.style.display = "inline";
        $('#view3').removeAttr("disabled");
        
        view4.style.display = "none";
        view4.disabled = "true"
        view5.style.display = "none";
        view5.disabled = "true"
    	view6.style.display = "none"
    	view6.disabled = "true"
    	view7.style.display = "none"
    	view7.disabled = "true"
    }
    if (trans_type == "TRU") {

        view1.style.display = "none"
        view1.disabled = "true"
        view2.style.display = "none"
        view2.disabled = "true"
        view3.style.display = "none"
        view3.disabled = "true"
        
        view4.style.display = "inline";
        $('#view4').removeAttr("disabled");
        
        view5.style.display = "none"
        view5.disabled = "true"
        view6.style.display = "none"
        view6.disabled = "true"
        view7.style.display = "none"
        view7.disabled = "true"	        

        
    }
    if (trans_type == "TREC") {

    	view1.style.display = "none"
        view1.disabled = "true"
        view2.style.display = "none"
        view2.disabled = "true"
        view3.style.display = "none"
        view3.disabled = "true"
    	view4.style.display = "none"
	    view4.disabled = "true"
        
	    view5.style.display = "inline";
        $('#view5').removeAttr("disabled");
        
        view6.style.display = "none"
        view6.disabled = "true"
        view7.style.display = "none"
        view7.disabled = "true"	        

    }
    if (trans_type == "TR") {

    	view1.style.display = "none"
        view1.disabled = "true"
        view2.style.display = "none"
        view2.disabled = "true"
        view3.style.display = "none"
        view3.disabled = "true"
    	view4.style.display = "none"
	    view4.disabled = "true"
	    view5.style.display = "none"
	    view5.disabled = "true"
        
        view6.style.display = "inline";
        $('#view6').removeAttr("disabled");
        
        view7.style.display = "none"
        view7.disabled = "true"	
    }
    if (trans_type == "ETC") {

    	view1.style.display = "none"
        view1.disabled = "true"
        view2.style.display = "none"
        view2.disabled = "true"
        view3.style.display = "none"
        view3.disabled = "true"
    	view4.style.display = "none"
	    view4.disabled = "true"
	    view5.style.display = "none"
	    view5.disabled = "true"
    	view6.style.display = "none"
    	view6.disabled = "true"
    	
        view7.style.display = "inline";
        $('#view7').removeAttr("disabled");
    }
}
	

</script>
<html>
	<head>
		<title>ANC ITICS - 운송수단 등록</title>
		<meta charset="utf-8" />
		<meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no" />
		<link rel="stylesheet" href="../assets/css/subpage.css" />
	</head>
<body>
	
<form name="Code_New" method="post">


<div class="box container" style="border:none;">

						<h1 align="right" style="font-size:13px"><i class="fa fa-list" aria-hidden="true"></i> 차량 종류 
							<select name="trans_type" id="trans_type" style="width:150px;height:20px;display:inline-block;text-align:center;" onChange="change_type(this.options[this.selectedIndex].value);">
								<!--<option value=""></option>-->
									<option value="TRU" selected>트럭</option>
									<option value="CON" >컨테이너</option>
				                    <option value="TRA">트레일러</option>
				                    <option value="ICON">냉동컨테이너</option>
				                    <option value="TREC">트랙터</option>
				                    <option value="TR">TR</option>
				                    <option value="ETC">기타(무게차,유게차)</option>
							</select>
					   </h1>
					   
				<h1 style="font-size:15px;"><i class="fa fa-plus-square-o" aria-hidden="true"></i> 신규 등록</h1>
				<div id="view1" style="display:none;">
					<table class="table">
						<tr>
							<td align="center"><b>차량 번호</b></td>
							<td>
								<input type="text" name="code_name" size="30" value="" onKeypress="hitEnterKey('code_name')">
							</td>
						</tr>
					
						<!-- <tr>
								<td align="center"><b>기사 이름</b></td>
								<td>
								<input type="text" name="code_name" size="30" value="" onKeypress="hitEnterKey('code_name')">
							</td>
							</tr>
						<tr>
							<td align="center"><b>기사 전화번호</b></td>
							<td>
								<input type="text" name="code_name" size="30" value="" onKeypress="hitEnterKey('code_name')">
							</td>
						</tr> -->
						<tr>
							<td align="center"><b>사용여부</b></td>
							<td>
								<select name="use_yn" size="1" onKeypress="hitEnterKey('use_yn')">
									<option value="Y">Y</option>
									<option value="N">N</option>
								</select>
							</td>
						</tr>
						<tr>
							<td colspan=2 align="center">
								<table>
									<tr>
										<input class="button medium gray" type="button" value="저장"  onclick="saveProc(form);"/>
									</tr>
								</table>
							</td>
						</tr>
						</table>
					 </div>
					 
				<div id="view2" style="display:none;">
				 	<table class="table">
						
						<tr>
							<td align="center"><b>차량 번호</b></td>
							<td>
								<input type="text" name="code_name" size="30" value="" onKeypress="hitEnterKey('code_name')">
							</td>
						</tr>
					
						<!-- <tr>
								<td align="center"><b>기사 이름</b></td>
								<td>
								<input type="text" name="code_name" size="30" value="" onKeypress="hitEnterKey('code_name')">
							</td>
							</tr>
						<tr>
							<td align="center"><b>기사 전화번호</b></td>
							<td>
								<input type="text" name="code_name" size="30" value="" onKeypress="hitEnterKey('code_name')">
							</td>
						</tr> -->
						<tr>
							<td align="center"><b>사용여부</b></td>
							<td>
								<select name="use_yn" size="1" onKeypress="hitEnterKey('use_yn')">
									<option value="Y">Y</option>
									<option value="N">N</option>
								</select>
							</td>
						</tr>
						<tr>
							<td colspan=2 align="center">
								<table>
									<tr>
										<input class="button medium gray" type="button" value="저장"  onclick="saveProc(form);"/>
									</tr>
								</table>
							</td>
						</tr>
						</table>
					 </div>
					 
					 <div id="view3" style="display:none;">
					 <table class="table">
					
						<tr>
							<td align="center"><b>차량 번호</b></td>
							<td>
								<input type="text" name="code_name" size="30" value="" onKeypress="hitEnterKey('code_name')">
							</td>
						</tr>
					
						<!-- <tr>
								<td align="center"><b>기사 이름</b></td>
								<td>
								<input type="text" name="code_name" size="30" value="" onKeypress="hitEnterKey('code_name')">
							</td>
							</tr>
						<tr>
							<td align="center"><b>기사 전화번호</b></td>
							<td>
								<input type="text" name="code_name" size="30" value="" onKeypress="hitEnterKey('code_name')">
							</td>
						</tr> -->
						<tr>
							<td align="center"><b>사용여부</b></td>
							<td>
								<select name="use_yn" size="1" onKeypress="hitEnterKey('use_yn')">
									<option value="Y">Y</option>
									<option value="N">N</option>
								</select>
							</td>
						</tr>
						<tr>
							<td colspan=2 align="center">
								<table>
									<tr>
										<input class="button medium gray" type="button" value="저장"  onclick="saveProc(form);"/>
									</tr>
								</table>
							</td>
						</tr>
						</table>
					 </div>
					 
					 <div id="view4" style="display:none;">
					 <table class="table">
						<tr>
							<td align="center"><b>트럭 종류</b></td>
								<td>
									<select name="car_type" size="1" onKeypress="hitEnterKey('use_yn')">
										<option value="1 TON">1 TON</option>
									    <option value="2.5 TON">2.5 TON</option>
									    <option value="5 TON">5 TON</option>
									    <option value="11 TON">11 TON</option>
									    <option value="25 TON">25 TON</option>
									</select>
								</td>
						</tr>
						<tr>
							<td align="center"><b>차량 번호</b></td>
							<td>
								<input type="text" name="code_name" size="30" value="" onKeypress="hitEnterKey('code_name')">
							</td>
						</tr>
					
						<!-- <tr>
								<td align="center"><b>기사 이름</b></td>
								<td>
								<input type="text" name="code_name" size="30" value="" onKeypress="hitEnterKey('code_name')">
							</td>
							</tr>
						<tr>
							<td align="center"><b>기사 전화번호</b></td>
							<td>
								<input type="text" name="code_name" size="30" value="" onKeypress="hitEnterKey('code_name')">
							</td>
						</tr> -->
						<tr>
							<td align="center"><b>사용여부</b></td>
							<td>
								<select name="use_yn" size="1" onKeypress="hitEnterKey('use_yn')">
									<option value="Y">Y</option>
									<option value="N">N</option>
								</select>
							</td>
						</tr>
						<tr>
							<td colspan=2 align="center">
								<table>
									<tr>
										<input class="button medium gray" type="button" value="저장"  onclick="saveProc(form);"/>
									</tr>
								</table>
							</td>
						</tr>
						</table>
					 </div>
					 
					 <div id="view5" style="display:none;">
					 <table class="table">
						<tr>
							<td align="center"><b>차량 번호</b></td>
							<td>
								<input type="text" name="code_name" size="30" value="" onKeypress="hitEnterKey('code_name')">
							</td>
						</tr>
					
						<!-- <tr>
								<td align="center"><b>기사 이름</b></td>
								<td>
								<input type="text" name="code_name" size="30" value="" onKeypress="hitEnterKey('code_name')">
							</td>
							</tr>
						<tr>
							<td align="center"><b>기사 전화번호</b></td>
							<td>
								<input type="text" name="code_name" size="30" value="" onKeypress="hitEnterKey('code_name')">
							</td>
						</tr> -->
						<tr>
							<td align="center"><b>사용여부</b></td>
							<td>
								<select name="use_yn" size="1" onKeypress="hitEnterKey('use_yn')">
									<option value="Y">Y</option>
									<option value="N">N</option>
								</select>
							</td>
						</tr>
						<tr>
							<td colspan=2 align="center">
								<table>
									<tr>
										<input class="button medium gray" type="button" value="저장"  onclick="saveProc(form);"/>
									</tr>
								</table>
							</td>
						</tr>
						</table>
					 </div>
					 
					 <div id="view6" style="display:none;">
					 <table class="table">	
						<tr>
							<td align="center"><b>차량 번호</b></td>
							<td>
								<input type="text" name="code_name" size="30" value="" onKeypress="hitEnterKey('code_name')">
							</td>
						</tr>
					
						<!-- <tr>
								<td align="center"><b>기사 이름</b></td>
								<td>
								<input type="text" name="code_name" size="30" value="" onKeypress="hitEnterKey('code_name')">
							</td>
							</tr>
						<tr>
							<td align="center"><b>기사 전화번호</b></td>
							<td>
								<input type="text" name="code_name" size="30" value="" onKeypress="hitEnterKey('code_name')">
							</td>
						</tr> -->
						<tr>
							<td align="center"><b>사용여부</b></td>
							<td>
								<select name="use_yn" size="1" onKeypress="hitEnterKey('use_yn')">
									<option value="Y">Y</option>
									<option value="N">N</option>
								</select>
							</td>
						</tr>
						<tr>
							<td colspan=2 align="center">
								<table>
									<tr>
										<input class="button medium gray" type="button" value="저장"  onclick="saveProc(form);"/>
									</tr>
								</table>
							</td>
						</tr>
						</table>
					 </div>
					 
					 <div id="view7" style="display:none;">
					 <table class="table">	
						<tr>
							<td align="center"><b>차량 번호</b></td>
							<td>
								<input type="text" name="code_name" size="30" value="" onKeypress="hitEnterKey('code_name')">
							</td>
						</tr>
					
						<!-- <tr>
								<td align="center"><b>기사 이름</b></td>
								<td>
								<input type="text" name="code_name" size="30" value="" onKeypress="hitEnterKey('code_name')">
							</td>
							</tr>
						<tr>
							<td align="center"><b>기사 전화번호</b></td>
							<td>
								<input type="text" name="code_name" size="30" value="" onKeypress="hitEnterKey('code_name')">
							</td>
						</tr> -->
						<tr>
							<td align="center"><b>사용여부</b></td>
							<td>
								<select name="use_yn" size="1" onKeypress="hitEnterKey('use_yn')">
									<option value="Y">Y</option>
									<option value="N">N</option>
								</select>
							</td>
						</tr>
						<tr>
							<td colspan=2 align="center">
								<table>
									<tr>
										<input class="button medium gray" type="button" value="저장"  onclick="saveProc(form);"/>
									</tr>
								</table>
							</td>
						</tr>
					 	</table>
					</div>
								
								
</div>							

							<!-- Section -->
			

				
			<!-- Scripts -->
			<script src="assets/js/jquery.min.js"></script>
			<script src="assets/js/skel.min.js"></script>
			<script src="assets/js/util.js"></script>
			<script src="assets/js/main.js"></script>
								 
			</form>
			</body>
</html>




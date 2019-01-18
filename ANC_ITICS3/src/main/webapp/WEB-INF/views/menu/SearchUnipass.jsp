<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="unipass_api.SearchUnipass"  %>
<%@ page import="java.util.*"  %>
<%@ page import="javax.servlet.http.HttpSession"  %>
<%@ page import = "java.util.*" %>
<%@ page import = "java.io.PrintWriter" %>
<%@ page import = "java.text.*" %>
<%@ page import = "javax.xml.parsers.*" %>
<%@ page import = "org.w3c.dom.Document" %>
<%@ page import = "org.w3c.dom.Element" %>
<%@ page import = "org.w3c.dom.Node" %>
<%@ page import = "org.w3c.dom.NodeList" %>


<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">

<%
	SearchUnipass searchUnipass = new SearchUnipass();

	String hblno = request.getParameter("hblNo");
	DateFormat sdFormat = new SimpleDateFormat("yyyyMMdd");
	Date today = new Date();
	String sDate = sdFormat.format(today);
	String year = sDate.toString().substring(0,4);
	//String url = "https://unipass.customs.go.kr:38010/ext/rest/cargCsclPrgsInfoQry/retrieveCargCsclPrgsInfo?crkyCn=d200p168n074q169p070w070t2&blYy=2018&hblNo=SGN18031017";
    String url = "https://unipass.customs.go.kr:38010/ext/rest/cargCsclPrgsInfoQry/retrieveCargCsclPrgsInfo?crkyCn=d200p168n074q169p070w070t2&blYy="+ year + "&hblNo=" +hblno;
    
	
    System.out.println(url);
    
	DocumentBuilderFactory dbFactoty = DocumentBuilderFactory.newInstance();
	DocumentBuilder dBuilder = dbFactoty.newDocumentBuilder();
	Document doc = dBuilder.parse(url);
	
	// root tag 
	doc.getDocumentElement().normalize();
	System.out.println("Root element :" + doc.getDocumentElement().getNodeName());
	
	// 파싱할 tag
	//NodeList nList = doc.getElementsByTagName("cargCsclPrgsInfoQryVo");
	NodeList nList = doc.getElementsByTagName("cargCsclPrgsInfoQryVo");
	NodeList nList2 = doc.getElementsByTagName("cargCsclPrgsInfoDtlQryVo");
	
	if(nList.getLength()==0){
		response.setContentType("text/html; charset=UTF-8");
        PrintWriter out2 = response.getWriter();
        out2.println("<script>alert('검색결과가 없습니다.'); window.close();</script>");
		out2.flush(); 
	}
	
	System.out.println("파싱할 리스트 수 : "+ nList.getLength());
	
	System.out.println("두번째 파싱할 리스트 수 : "+ nList2.getLength());

/* 	for(int temp = 0; temp < nList2.getLength(); temp++){
		//Node nNode = nList2.item(temp);
		if(nNode.getNodeType() == Node.ELEMENT_NODE){
			
			Element eElement = (Element) nNode;
			
			System.out.println("######################");
			//System.out.println(eElement.getTextContent());
			System.out.println("shedNm  : " + searchUnipass.getTagValue("shedNm", eElement));
			System.out.println("prcsDttm  : " + searchUnipass.getTagValue("prcsDttm", eElement));
			System.out.println("cargTrcnRelaBsopTpcd : " + searchUnipass.getTagValue("cargTrcnRelaBsopTpcd", eElement));
			//System.out.println("ldprCd  : " + getTagValue("ldprCd", eElement));
			//System.out.println("shipNat  : " + getTagValue("shipNat", eElement));
			
			//System.out.println("blPt  : " + getTagValue("blPt", eElement));
		}	// for end
	}	// if end */
	
	Node nNode = nList.item(0);					
	Element eElement = (Element) nNode;
	System.out.println("######################");
	//System.out.println(eElement.getTextContent());
	System.out.println("csclPrgsStts  : " + searchUnipass.getTagValue("csclPrgsStts", eElement));
	System.out.println("vydf  : " + searchUnipass.getTagValue("vydf", eElement));
	System.out.println("prnm : " + searchUnipass.getTagValue("prnm", eElement));
	
	String csclPrgsStts = searchUnipass.getTagValue("csclPrgsStts", eElement); //통관진행상태
	String vydf = searchUnipass.getTagValue("vydf", eElement); //항차
	String prnm = searchUnipass.getTagValue("prnm", eElement); //품명
	String ldprCd = searchUnipass.getTagValue("ldprCd", eElement); // 적재항
	String shipNat = searchUnipass.getTagValue("shipNat", eElement); // 
	String blPt = searchUnipass.getTagValue("blPt", eElement); //B/L 유형
	String dsprNm = searchUnipass.getTagValue("dsprNm", eElement); //양륙항
	String etprDt = searchUnipass.getTagValue("etprDt", eElement); //입항일
	String prgsStCd = searchUnipass.getTagValue("prgsStCd", eElement); //
	String msrm = searchUnipass.getTagValue("msrm", eElement); //용적
	String wghtUt = searchUnipass.getTagValue("wghtUt", eElement); //중량 단위
	String dsprCd = searchUnipass.getTagValue("dsprCd", eElement); //양륙항 영문
	String cntrGcnt = searchUnipass.getTagValue("cntrGcnt", eElement); //컨테이너개수
	String cargTp = searchUnipass.getTagValue("cargTp", eElement); //화물구분
	String shcoFlcoSgn = searchUnipass.getTagValue("shcoFlcoSgn", eElement); //선사/항공사 코드
	String pckGcnt = searchUnipass.getTagValue("pckGcnt", eElement); //포장개수
	String etprCstm = searchUnipass.getTagValue("etprCstm", eElement); //입항세관
	String shipNm = searchUnipass.getTagValue("shipNm", eElement); //선박/항공편명
	String hblNo = searchUnipass.getTagValue("hblNo", eElement); //하우스 BL
	
	//double prcsDttm = Double.parseDouble(searchUnipass.getTagValue("prcsDttm", eElement)); //처리일시
	String prcsDttm = searchUnipass.getTagValue("prcsDttm", eElement); //처리일시
	prcsDttm = prcsDttm.substring(0, 4) + "-" + prcsDttm.substring(4, 6) + "-" + prcsDttm.substring(6, 8) + " " + prcsDttm.substring(8, 10) + ":" + prcsDttm.substring(10, 12) + ":" + prcsDttm.substring(12, 14); 
	String ttwg = searchUnipass.getTagValue("ttwg", eElement); //총중량
	String ldprNm = searchUnipass.getTagValue("ldprNm", eElement); // 적재항 도시 이름
	String mtTrgtCargYnNm = searchUnipass.getTagValue("mtTrgtCargYnNm", eElement); //관리대상지정여부
	String cargMtNo = searchUnipass.getTagValue("cargMtNo", eElement); //화물관리번호
	String cntrNo = searchUnipass.getTagValue("cntrNo", eElement); //컨테이너번호
	String mblNo = searchUnipass.getTagValue("mblNo", eElement); //Master B/L No
	String blPtNm = searchUnipass.getTagValue("blPtNm", eElement); //B/L유형 이름
	String lodCntyCd = searchUnipass.getTagValue("lodCntyCd", eElement); //적재항국가코드
	String prgsStts = searchUnipass.getTagValue("prgsStts", eElement); //진행상태
	String shcoFlco = searchUnipass.getTagValue("shcoFlco", eElement); //선사/항공사 이름
	String pckUt = searchUnipass.getTagValue("pckUt", eElement); //포장개수 단위
	String shipNatNm = searchUnipass.getTagValue("shipNatNm", eElement); //선박국적
	String agnc = searchUnipass.getTagValue("agnc", eElement); //선박대리

%>
<html>
<head>
<meta charset="utf-8" />
<meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no" />
<!--[if lte IE 8]><script src="assets/js/ie/html5shiv.js"></script><![endif]-->
<link rel="stylesheet" href="../assets/css/subpage.css" />
<script src="../assets/js/jquery-3.2.1.js"></script>
<title>ANC Cargo Quick Search System</title>

    <style type="text/css">
      a:link {color: blue; text-decoration: none;}
      a:visited {color: gray; text-decoration: none;}
      a:hover {color: gray; text-decoration: none;}
      a:active {color: white; background-color: silver;}
    </style>

	<script language="javascript" src="cal.js"></script>
	<script language = "JavaScript">		
	    function loadApp(hblno) {
	        //alert(hblno.value);
		    location.href = "SearchUnipass.jsp?hblno=" + hblno.value;
		}
				
		function setInit(){
			if (document.UnipassForm.searchFrom.value == ''){
				document.UnipassForm.searchFrom.value = "20181221-TEST" ;
			}
			else{
				return false ;
			}
			if (document.UnipassForm.searchTo.value == ''){
				document.UnipassForm.searchTo.value = "20181221-TEST" ;
			}
			else{
				return false ;
			}
		
		}
		
		function mouse_Over(id){
			id.style.background = "#D2E1FF";
			id.style.color = "#FF8200";			
		}

		function mouse_Out(id){
			id.style.background = "#F4FFFF";
			id.style.color = "#000000";			
		}

	</Script>
</head>
<body style="background:#F2F2F2;">
<form name="UnipassForm" method="Post" action="SearchUnipass.jsp">


<div class="topFixLogo" style="clear:both; background:#F2F2F2; border-bottom: 1px solid  #BDBDBD">
   <img src="../images/ancquicksearch.png" style="max-width:100%; height:auto; "/>           
</div>


<div id="wrapper">

    <!-- Main -->
	<div id="main">
		<div class="inner">
            <br>
            <div class="box container">
                <!-- Header -->
								<header id="header">
									
									
									<h1 style="font-size:20px"><i class="fa fa-info-circle" aria-hidden="true"></i> Freight information</h1>
									
								</header>
								
		<br>
		<h1 style="font-size:12px"><i class="fa fa-search" aria-hidden="true"></i> House B/L Search</h1>
					<table class="table">
								
									<colgroup>
										<col width="5%" />
									    <col width="10%" />
									    <col width="5%" />
									</colgroup>
								
									<tr>
										<th scope="row" class="th txtr">House B/L No</th>
									<%if (request.getParameter("hblNo").length() ==0){ %>
										<td align="center" class="td">
											<input type="text" name="hblno" id="hblno"   placeholder="Input House B/L No.."  style="text-align:center; height:25px;"/>
										</td>
                                    <%}else{ %>
                                        <td align="center" class="td">
											<input type="text" name="hblno" id="hblno"   value=<%=request.getParameter("hblNo") %>  style="text-align:center;  height:25px;"/>
										</td>
                                    <%} %>
										<td align="center"><button onclick="loadApp(hblno);"><i class="fa fa-search" aria-hidden="true"></i> Search</button></td>
									</tr>
									
									 
							</table>
							
							<br>
							<h1 style="font-size:12px"><i class="fa fa-pencil-square-o" aria-hidden="true"></i> B/L Information</h1>
							
								
							
							<table class="table">
								<colgroup>
										<col width="10%" />
									    <col width="20%" />
									    <col width="10%" />
									    <col width="14%" />
									    <col width="10%" />
									    <col width="10%" />
									    <col width="8%" />
									    <col width="8%" />
									</colgroup>
									  <tr>
									    <th scope="row" class="th txtr">화물관리번호</th>
									    <td class="td">		 
									    	<%=cargMtNo%>				    				
									    </td>
									    <th scope="row" class="th txtr">진행상태</th>
									    <td class="td"><%=prgsStts%></td>
									    <th scope="row" class="th txtr">선사/항공사</th>
									    <td colspan="3" class="tde"> <%=shcoFlco%></td>
									  </tr>
									  <tr>
									    <th scope="row" class="th txtr">M B/L-H B/L</th>
									    <td class="td"><%=mblNo%> - <%=hblNo%></td>
									    <th scope="row" class="th txtr">화물구분</th>
									    <td class="td"><%=cargTp%></td>
									    <th scope="row" class="th txtr">선박/항공편명</th>
									    <td colspan="3" class="tde"><%=shipNm%></td>
									    </tr>
									  <tr>
									    <th scope="row" class="th txtr">통관진행상태</th>
									    <td class="td"><%=csclPrgsStts%></td>
									    <th scope="row" class="th txtr">처리일시</th>
									    <td class="td">
									        <%=prcsDttm%>
									    </td>
									    <th scope="row" class="th txtr">선박국적</th>
									    <td class="td"><%=shipNatNm%></td>
									    <th scope="row" class="th txtr">선박대리점</th>
									    <td class="tde"><%=agnc%></td>
									  </tr>
									  <tr>
									    <th scope="row" class="th txtr">품명</th>
									    <td colspan="3" class="td"><%=prnm%></td>
									    <th scope="row" class="th txtr">적재항</th>
									    <td colspan="3" class="tde"><%=ldprCd%> : <%=ldprNm%>, <%=lodCntyCd%>  </td>
									    </tr>
									  <tr>
									    <th scope="row" class="th txtr">포장개수</th>
									    <td class="td"><%=pckGcnt%> <%=pckUt%></td>
									    <th scope="row" class="th txtr">총 중량</th>
									    <td class="td"> <%=ttwg%> <%=wghtUt %></td>
									    <th scope="row" class="th txtr">양륙항</th>
									    <td class="td"><%=dsprCd%>:<%=dsprNm%></td>
									    <th scope="row" class="th txtr">입항세관</th>
									    <td class="tde"><%=etprCstm%></td>
									  </tr>
									  <tr>
									    <th scope="row" class="th txtr">용적</th>
									    <td class="td"><%=msrm%></td>
									    <th scope="row" class="th txtr">B/L유형</th>
									    <td class="td"><%=blPtNm%></td>
									    <th scope="row" class="th txtr">입항일</th>
									    <td class="td">
											 <%=etprDt%>
									    </td>
									    <th scope="row" class="th txtr">항차</th>
									    <td class="tde"><%=vydf%></td>
									  </tr>
									  <tr>
									    <th scope="row" class="th txtr">관리대상지정여부</th>
									    <td class="td"><%=mtTrgtCargYnNm%></td>
									    <th scope="row" class="th txtr">컨테이너개수</th>
									    <td class="td"><%=cntrGcnt%></td>
									    <th scope="row" class="th txtr">반출의무과태료</th>
									    <td class="tde">&nbsp;</td>
                                        <th scope="row" class="th txtr">신고지연가산세</th>
									    <td class="td">&nbsp;</td>
									    </tr>
									  <tr>
									    <th scope="row" class="th txtr">특수화물코드</th>
									    <td class="td">-</td>
									    <th scope="row" class="th txtr">컨테이너번호</th>
									    <td colspan="5" class="tde"><%=cntrNo%></td>
									   </tr>
									   
									  
							</table>

                <br>
				<h1 style="font-size:12px"><i class="fa fa-tasks" aria-hidden="true"></i> B/L Status</h1>

                <div class="summery">
									<table width="100%" border="0" cellspacing="0" cellpadding="0" class="table">
									<colgroup>
										<col width="5%" />
									    <col width="19%" />
									    <col width="19%" />
									    <col width="19%" />
									    <col width="19%" />
									    <col width="19%" />
									</colgroup>
									  <tr>
									    <th rowspan="2" class="th txtc" scope="col">No</th>
									    <th scope="col" class="th txtc">처리단계</th>
									    <th scope="col" class="th txtc">장치장/장치위치</th>
									    <th scope="col" class="th txtc">포장개수</th>
									    <th scope="col" class="th txtc">반출입(처리)일시</th>
									    <th scope="col" class="the txtc">신고번호</th>
									  </tr>
									  <tr>
									    <th scope="col" class="th txtc">처리일시</th>
									    <th scope="col" class="th txtc">장치장명</th>
									    <th scope="col" class="th txtc">중량</th>
									    <th scope="col" class="th txtc">반출입(처리)내용</th>
									    <th scope="col" class="the txtc">반출입근거번호</th>
									  </tr>
									
                                <% 
                                
                                for(int i = 0; i < nList2.getLength(); i++){
                            		Node nNode2 = nList2.item(i);
                            		if(nNode2.getNodeType() == Node.ELEMENT_NODE){
                            			
                            			Element eElement2 = (Element) nNode2;
                            			
                            			System.out.println("######################");
                            			//System.out.println(eElement.getTextContent());
                            			System.out.println("shedNm  : " + searchUnipass.getTagValue("shedNm", eElement2));
                            			System.out.println("prcsDttm  : " + searchUnipass.getTagValue("prcsDttm", eElement2));
                            			System.out.println("cargTrcnRelaBsopTpcd : " + searchUnipass.getTagValue("cargTrcnRelaBsopTpcd", eElement2));
                            			//System.out.println("ldprCd  : " + getTagValue("ldprCd", eElement));
                            			//System.out.println("shipNat  : " + getTagValue("shipNat", eElement));
                            			
                            			//System.out.println("blPt  : " + getTagValue("blPt", eElement));

								  int Cnt = nList2.getLength();
								  
                                  String shedNm = (searchUnipass.getTagValue("shedNm", eElement2)!=null) ? searchUnipass.getTagValue("shedNm", eElement2):""; //장치장명

                                  //double prcsDttm_sub = Double.parseDouble(searchUnipass.getTagValue("prcsDttm", eElement2)); //처리일시
                                  String prcsDttm_sub = searchUnipass.getTagValue("prcsDttm", eElement2); //처리일시
                                  System.out.println("prcsDttm_sub.substring="+prcsDttm_sub.substring(4, 6));
                                  
                                  prcsDttm_sub = prcsDttm_sub.substring(0, 4) + "-" + prcsDttm_sub.substring(4, 6) + "-" + prcsDttm_sub.substring(6, 8) + " " + prcsDttm_sub.substring(8, 10) + ":" + prcsDttm_sub.substring(10, 12) + ":" + prcsDttm_sub.substring(12, 14);
                                  
                                  String dclrNo = (searchUnipass.getTagValue("dclrNo", eElement2)!=null) ? searchUnipass.getTagValue("dclrNo", eElement2):""; //반출입근거번호
							  	  String rlbrDttm = (searchUnipass.getTagValue("rlbrDttm", eElement2)!=null) ? searchUnipass.getTagValue("rlbrDttm", eElement2):"";  //반출입(처리)일시
							   	  String wght = (searchUnipass.getTagValue("wght", eElement2)!=null) ? searchUnipass.getTagValue("wght", eElement2):""; //중량
							      String rlbrBssNo = (searchUnipass.getTagValue("rlbrBssNo", eElement2)!=null) ? searchUnipass.getTagValue("rlbrBssNo", eElement2):""; //반출입근거번호
								  String bfhnGdncCn = (searchUnipass.getTagValue("bfhnGdncCn", eElement2)!=null) ? searchUnipass.getTagValue("bfhnGdncCn", eElement2):""; //부가사항
								  String wghtUt_sub = (searchUnipass.getTagValue("wghtUt", eElement2)!=null) ? searchUnipass.getTagValue("wghtUt", eElement2):""; //중량단위
								  String pckGcnt_sub = (searchUnipass.getTagValue("pckGcnt", eElement2)!=null) ? searchUnipass.getTagValue("pckGcnt", eElement2):"";//포장개수
								  String cargTrcnRelaBsopTpcd = (searchUnipass.getTagValue("cargTrcnRelaBsopTpcd", eElement2)!=null) ? searchUnipass.getTagValue("cargTrcnRelaBsopTpcd", eElement2):""; //처리단계
								  String pckUt_sub = (searchUnipass.getTagValue("pckUt", eElement2)!=null) ? searchUnipass.getTagValue("pckUt", eElement2):""; //포장개수단위
								  String rlbrCn = (searchUnipass.getTagValue("rlbrCn", eElement2)!=null) ? searchUnipass.getTagValue("rlbrCn", eElement2):""; //반출입(처리)내용
								  String shedSgn = (searchUnipass.getTagValue("shedSgn", eElement2)!=null) ? searchUnipass.getTagValue("shedSgn", eElement2):""; //장치장/장치위치

                                  System.out.println("bfhnGdncCn.length()="+bfhnGdncCn);
                                  System.out.println("shedSgn="+shedSgn);
        
                                %>
 
                                        <% if (bfhnGdncCn==""){ %>
									      <tbody>
										    <tr class="row_0">
										        <td style="text-align:center;" rowspan="2" class="td txtc"><%=Cnt - i%></td>
										        <td style="text-align:center;" class="td txtc"><%=cargTrcnRelaBsopTpcd %></td>
										        <td class="td txtc"><%=shedSgn%></td>
										        <td style="text-align:right;" class="td txtr"><%=pckGcnt_sub%> <%=pckUt_sub%></td>
										        <td style="text-align:center;" class="td txtc"><%=rlbrDttm%></td>
										        <td style="text-align:center;" class="tde txtc"><%=dclrNo%></td>
									  	    </tr>
									  	    <tr class="row_0">
										        <td style="text-align:center;" class="td txtc"><%=prcsDttm_sub%></td>
										        <td class="td txtc"><%=shedNm%></td>
										        <td style="text-align:right;" class="td txtr"><%=wght%> <%=wghtUt_sub%></td>
										        <td style="text-align:center;" class="td txtc"><%=rlbrCn%></td>
										        <td style="text-align:center;" class="tde txtc"><%=rlbrBssNo%></td>
									  	    </tr>
                                        </tbody>
                                     <%}else{ %>
                                            <tbody>
										    <tr class="row_0">
										        <td style="text-align:center;" rowspan="3" class="td txtc"><%=Cnt - i%></td>
										        <td style="text-align:center;" class="td txtc"><%=cargTrcnRelaBsopTpcd %></td>
										        <td class="td txtc"><%=shedSgn%></td>
										        <td style="text-align:right;" class="td txtr"><%=pckGcnt_sub%> <%=pckUt_sub%></td>
										        <td style="text-align:center;" class="td txtc"><%=rlbrDttm%></td>
										        <td style="text-align:center;" class="tde txtc"><%=dclrNo%></td>
									  	    </tr>
									  	    <tr class="row_0">
										        <td style="text-align:center;" class="td txtc"><%=prcsDttm_sub%></td>
										        <td class="td txtc"><%=shedNm%></td>
										        <td style="text-align:right;" class="td txtr"><%=wght%> <%=wghtUt_sub%></td>
										        <td style="text-align:center;" class="td txtc"><%=rlbrCn%></td>
										        <td style="text-align:center;" class="tde txtc"><%=rlbrBssNo%></td>
									  	    </tr>
                                            <tr>
                                               <td style="text-align:center;" colspan="5" class="tde txtc"><%=bfhnGdncCn%></td>
                                            </tr>
                                        </tbody>
                                     
                                     <%} %>     
                                   

                                                  
                                <% 
                            		}	// for end
                            	}	// if end
                                %>

                          </table>
                    </div>


            </div>



               
	 							
							<!-- Banner -->
								<section id="banner">
									<div class="content">
										<header>
										</header>
									</div>
								</section>
							<!-- Section -->	
						</div>
					</div>
    </div>
   
</form>

</body>


<!-- Scripts -->
<script src="../assets/js/jquery.min.js"></script>
<script src="../assets/js/skel.min.js"></script>
<script src="../assets/js/util.js"></script>
<script src="../assets/js/main.js"></script>


<%-- <%Response.Flush();%> --%>
</html>

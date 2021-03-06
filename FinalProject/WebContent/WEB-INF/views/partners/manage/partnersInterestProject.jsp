<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@page import="java.util.Map"%>
<%@page import="java.util.List"%>
<!DOCTYPE html>

<%
	List<Map<String, Object>> list = (List<Map<String, Object>>) request.getAttribute("getStateProject");
%>
<html>
<head>
<meta charset="UTF-8">
<title>관심 프로젝트</title>
</head>
<body>
	<!----------------------------------------------------------------------- top 시작 -->
	<header class="header">
		<div class="ui">
			<!-- header 시작 -->
			<div class="ui">
				<jsp:include page="../../common/menu/PartnersHeaderMenu.jsp" />
			</div>
			<!-- header 종료 -->
		</div>
	</header>
	<!----------------------------------------------------------------------- top 끝 -->

	<div class="ui basicspace">
		<!-- navigation menu와 여백 -->
	</div>

	<!--======================================================================================-->
	<!----------------------------------------------------------------------- main content 시작 -->

	<div class="ui container">
		<!-- main 입력 시작-->
		<!-- *******************************************************************************************************20181014 수정요청 -->
		<div class="ui two column grid container" style="height: auto%;  margin-bottom: 10px;">
			<!-- *******************************************************************************************************20181014 수정요청 -->
			<div class="ui column" style="width: 20%; padding-top: 0px; padding-left: 0px; padding-right: 0px">

				<!-- 로그인 정보 =================================================================================-->
				<div id="partnersback" class="ui segment">
					<jsp:include page="../../auth/PartnersLoginOk.jsp" />
				</div>
				<!-- 로그인 정보 =================================================================================-->

				<!-- 서브 메뉴 ===================================================================================-->
				<div id="partnersback" class="ui fluid vertical menu" style="padding-right: 0px">
					<a class="teal item active"> <font style="vertical-align: inherit;"> 관심 프로젝트 </font>
					</a>
				</div>
				<!-- 서브 메뉴 ===================================================================================-->
			</div>
			<div class="ui column" style="padding-left: 5px; padding-top: 0px; padding-bottom: 0px; width: 80%; height: auto;">
				<div id="partnersback" class="ui container" style="padding: 20px; padding-bottom: 20px; left: 5px; border: 1px solid #dedede;">
					<h3 style="text-align: left">관심 프로젝트</h3>
					<h5 style="text-align: left">관심 프로젝트로 추가한 프로젝트 확인할 수 있습니다.</h5>
				</div>
				<div style="height: 20px;"></div>
<!-- 	설명			 -->
				<div class="ui two column grid container" style="padding-top: 0px; border: 1px solid #dedede; margin-bottom: 5px;">
					<div class="column" style="width: 10%; padding: 20px">
						<img class="ui medium circular image" style="width: 40px;" src="../../image/process-guide-success.png">
					</div>
					<div class="column" style="width: 90%; text-align: left; padding-left: 5px;">
						1. 관심 프로젝트로 추가한 프로젝트 목록입니다. <br> 2. 지원 완료한 프로젝트의 경우, 목록에서 지원 내역으로 이동합니다. <br> 3. 프로젝트 모집이 마갑된 경우, 목록에서 자동으로 삭제됩니다. <br> 4. <strong>[프로젝트 지원하기]</strong> 버튼을 클릭하여 해당 프로젝트에 지원할 수 있습니다.
					</div>
				</div>
<!-- 	설명			 -->				
				<div style="padding-top: 10px; padding-bottom: 0px; padding-left: 15px; padding-right: 15px; border: 1px solid #dedede; background-color: #dedede;">
					<div style="height: 10px;"></div>
					
					<%
						if (list == null && list.size() > 0) {
					%>
					<div style="text-align: left; padding-left: 10px; padding-top: 20px; padding-bottom: 0px">관심 중인 프로젝트가 없습니다.</div>
					<%
						}
					%>
					<%
						for (int i = 0; i < list.size(); i++) {
					%>
					<form id="f_attention" action="/partners/projectAttention" method="get">
						<input type="hidden" name="s_email" value="${email}"> <input type="hidden" name="pro_no" value=<%=list.get(i).get("PRO_NO")%>> <input type="hidden" name="su_money" value=<%=list.get(i).get("PRO_PRICE")%>> <input type="hidden" name="su_state" value="관심">
					</form>

					<!-- <div style="padding: 13px;"></div> -->
					<div class="ui" style="position: relative; margin-bottom: 20px; padding-left: px; padding-right: 0px; padding-top: 0px; padding-bottom: 0px; text-align: left;">
						<div class="ui column segment" style="padding-top: 10px;" align="left">
							<!-- *********************************************************************************************************************************************20181013 수정요청사항 -->
							<div class="ui blue top left attached label" style="position: absolute; top: -10px; left: -10px;">
								관심중
								<!-- <div class="ui ten wide column segment" style="padding-top: 15px; padding-left: 30px; text-align: left !important;">
		<div class="ui green top left attached label"> -->

							</div>
							<h3 class="ui teal header">
								<a href=""><%=list.get(i).get("PRO_NAME")%></a>
							</h3>
							<div class="sub header">
								<i class="won sign icon"></i> 예상금액&nbsp;&nbsp;<%=list.get(i).get("PRO_PRICE")%>
								&nbsp;원 &nbsp; &nbsp; | &nbsp; &nbsp; <i class="clock outline icon"></i> 예상기간&nbsp;<%=list.get(i).get("PRO_PERIOD")%>
							</div>
							<p style="margin-bottom: 30px;"></p>
							<div class="ui two grid column container">
								<div class="column" style="width: 80%;" align="left">
									<div class="sub header" style="margin-bottom: 10px;">
										<%=list.get(i).get("CATE_MAIN")%>
										<i class="angle right icon"></i><%=list.get(i).get("CATE_SUB")%>
										&nbsp;&nbsp;|&nbsp; &nbsp; 위치 <i class="angle right icon"></i><%=list.get(i).get("PRO_ADDR")%>
									</div>
								</div>
								<div class="column" style="width: 20%; bottom: 0;" align="right">
									<div class="ui button blue" onclick="attention()">지원하기</div>
								</div>
							</div>
						</div>

					</div>
					<%
						}
					%>
				</div>
			</div>
			<div>
				<!-- ${getStateProject } -->
			</div>
			<!-- main 입력 끝-->
		</div>
	</div>
	<!----------------------------------------------------------------------- main content 끝 --->
	<!--======================================================================================-->
	<!-- <div class="ui basicspace">
		login title와 main content 여백
	</div> -->
	<!----------------------------------------------------------------------- footer content 시작 -->
	<!-- footer 시작-->
	<footer class="footer">
		<div class="ui inverted segment">
			<jsp:include page="../../common/menu/footerMenu.jsp" />
		</div>
	</footer>
	<!-- footer 끝-->
	<script>
		function attention() {
			$('#f_attention').submit()
		}
	</script>
	<!----------------------------------------------------------------------- footer content 끝 -->
</body>
</html>
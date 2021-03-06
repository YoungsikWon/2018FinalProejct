<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<%@page import="java.util.Map"%>
<%@page import="java.util.List"%>
<head>
<%
	List<Map<String, Object>> getState = (List<Map<String, Object>>) request.getAttribute("getState");
	/*******수정시작20181018******/
	List<Map<String, Object>> userSupport = (List<Map<String, Object>>) request.getAttribute("userSupport");
	/*******수정끝20181018******/
%>

<meta charset="UTF-8">
<title>마이 커프링크</title>
</head>
<body>

	<!----------------------------------------------------------------------- top 시작 -->
	<header class="header">
		<div class="ui">
			<!-- header 시작 -->
			<div class="ui">
				<jsp:include page="../common/menu/headerMenu.jsp" />
			</div>
			<!-- header 종료 -->
		</div>
	</header>
	<!----------------------------------------------------------------------- top 끝 -->

	<script type="text/javascript">
		function news(title) {
			var Json2 = "";

			$.ajax({

				url : "../../../News/callNews.jsp",
				method : "post",
				data : {
					"title" : title
				},
				success : function(Data) {

					$.ajax({

						url : "../../../News/pagination.jsp",
						method : "post",
						data : {
							"Json2" : Data
						},
						success : function(data) {

							$("#News").html(data);

						},
						error : function(xhrObject) {

							alert(xhrObject.responseText);
						}

					});
				},
				error : function(xhrObject) {
					alert(xhrObject.responseText);
				}

			});
		}
		$(document).ready(function() {

			news("자바");

			$("#search").keydown(function(key) {

				if (key.keyCode == 13) {//키가 13이면 실행 (엔터는 13)

					news($("#search").val());
				}

			});
		});
	</script>

	<div class="ui basicspace">
		<!-- navigation menu와 여백 -->
	</div>

	<!--======================================================================================-->
	<!----------------------------------------------------------------------- main content 시작 -->

	<div class="ui container" >

		<!-- main 입력 시작-->

		<div class="ui two column grid container" style="height: auto; margin-bottom: 0px;">
			<div class="ui column" style="padding-left: 0px; padding-top: 0px; padding-bottom: 0px; width: 80%;">
				<div class="ui segment container" style="padding: 20px; padding-bottom: 20px; left: 0px; border: 1px solid #dedede; background-color: #E0ECF8;">
					<div style="padding-bottom: 0px;">
						<h3 style="text-align: left">마이 커프링크</h3>
					</div>
				</div>
				<!-- 상단 +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++-->
				<div class="ui segment container" style="padding: 20px; padding-bottom: 20px; left: 0px; border: 1px solid #dedede; background-color: #E6E6E6;">
					<div class="ui three column grid container">
						<div class="column" style="padding-top: 30px; width: 50%;">
							<h4 style="text-align: left">뉴스센터</h4>
						</div>
						<div class="column" style="padding-bottom: 00px; width: 50%; padding-right: 0;text-align: right;">
							<div class="ui left icon input" style="padding: 10px; padding-right: 0; width: 60%;" align="right">
								<input id="search" name="search" type="text" placeholder="검색" size="40px" style="text-align: right"> <i class="id badge icon"></i>
							</div>
						</div>

					</div>
					<div class="ui container" style="padding-top: 0px; padding-bottom: 10px; padding-left: 0px; padding-right: 0px;">
						<hr class="garo" style="" />
					</div>

					<div id="News" style="background-color: #fff;"></div>
				</div>
				<!-- 중간 +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++-->
				<div class="ui segment container" style="padding: 20px; padding-bottom: 20px; left: 0px; border: 1px solid #dedede; background-color: #E6E6E6; ">
					<div class="ui three column grid container">
						<div class="column" style="padding-bottom: 00px; width: 50%;">
							<h4 style="text-align: left">내 프로젝트</h4>
						</div>
						<div class="column" style="padding-left: 0px; padding-right: 0px; padding-top: 25px; padding-bottom: 20px; text-align: right; width: 40%;">
							<!-- 우측여백 -->
						</div>
						<div class="column" style="padding-left: 0px; padding-right: 0px; padding-top: 20px; padding-bottom: 20px; text-align: right; width: 10%;">
							<!-- 우측여백 -->
						</div>
					</div>
					<div style="padding: 13px;"></div>
					<div class="ui" style="position: relative;padding-left: 5px; padding-right: 5px; padding-top: 0px; padding-bottom: 0px; text-align: left;">
						<div class="ui column segment" style="padding-top: 30px;">
							<div class="ui blue top left attached label" style="position: absolute; top: -10px;left: -10px;">
								<a href="/project/projectRecruiting">>>지원자 모집중<<</a>
							</div>
							<div class="ui four column grid container" style="padding-left: 0px; padding-right: 0px; padding-top: 10px; padding-bottom: 0px; text-align: center;">
								<div class="ui column" style="color:#fff; background-color:#848484; padding-left: 20px; padding-right: 0px; padding-top: 05px; padding-bottom: 05px; text-align: left; width: 40%">프로젝트 제목</div>
								<div class="ui column" style="color:#fff; background-color:#848484; padding-left: 20px; padding-right: 0px; padding-top: 05px; padding-bottom: 05px; text-align: center; width: 20%">마감일자</div>
								<div class="ui column" style="color:#fff; background-color:#848484; padding-left: 20px; padding-right: 0px; padding-top: 05px; padding-bottom: 05px; text-align: center; width: 20%">지원자 수</div>
								<div class="ui column" style="color:#fff; background-color:#848484; padding-left: 20px; padding-right: 0px; padding-top: 05px; padding-bottom: 05px; text-align: center; width: 20%">도구</div>
								<!-- 수정시작20181018 -->
<%
	if (userSupport == null || userSupport.size() <= 0) {
%>
								<div class="column" style="padding-left: 20px; padding-right: 0px; padding-top: 20px; padding-bottom: 0px; text-align: left; width: 40%">모집 중인 프로젝트가 없습니다.</div>
								<div class="column" style="padding-left: 20px; padding-right: 0px; padding-top: 0px; padding-bottom: 0px; text-align: center; width: 20%">
									<!-- 마감일자 -->
								</div>
								<div class="column" style="padding-left: 20px; padding-right: 0px; padding-top: 0px; padding-bottom: 0px; text-align: center; width: 20%">
									<!-- 지원자 수 -->
								</div>
								<div class="column" style="padding-left: 20px; padding-right: 0px; padding-top: 0px; padding-bottom: 0px; text-align: center; width: 20%">
									<!-- 도구 -->
								</div>
								<div class="ui container" style="padding-top: 0px; padding-bottom: 10px; padding-left: 0px; padding-right: 0px;">
									<hr class="dotted" style="" />
								</div>
<%
	} else {
	for (Map<String, Object> user : userSupport) {
%>								
								<div class="column" style="padding-left: 20px; padding-right: 0px; padding-top: 0px; padding-bottom: 0px; text-align: left; width: 40%">
									<%=user.get("PRO_NAME")%></div>
								<div class="column" style="padding-left: 20px; padding-right: 0px; padding-top: 0px; padding-bottom: 0px; text-align: center; width: 20%">
									<%=user.get("PRO_END")%>
								</div>
								<div class="column" style="padding-left: 20px; padding-right: 0px; padding-top: 0px; padding-bottom: 0px; text-align: center; width: 20%">
									<%=user.get("USERCOUNT")%>
									명
								</div>
								<div class="column" style="padding-left: 20px; padding-right: 0px; padding-top: 0px; padding-bottom: 0px; text-align: center; width: 20%">
									<%=user.get("CATE_SUB")%>
								</div>
								<div class="ui container" style="padding-top: 0px; padding-bottom: 10px; padding-left: 0px; padding-right: 0px;">
									<hr class="dotted" style="" />
								</div>
								<%
									}
								%>
								<%
									}
								%>
								<!-- 수정끝20181018 -->
							</div>
						</div>
					</div>
					<div style="padding: 13px;"></div>
					<div class="ui" style="padding-left: 5px; padding-right: 5px; padding-top: 0px; padding-bottom: 0px; text-align: left;">
						<div class="ui column segment" style="padding-top: 0px;">
							<div class="ui orange top left attached label" style="position: absolute; top: -10px;left: -10px;">
								<a href="/project/projectContractInProgress">>>진행중인 프로젝트<<</a>
							</div>
							<div class="ui six column grid container" style="padding-left: 0px; padding-right: 0px; padding-top: 10px; padding-bottom: 0px; text-align: center;">
								<!-- <h3 class="ui header" style="margin-top: 15px;">프로젝트 진행중</h3> -->
								<table class="ui inverted  grey table" style="padding: 0; margin-bottom: 15px; ">
									<thead>
										<tr>
											<th>프로젝트 제목</th>
											<th>금액</th>
											<th>기간</th>
											<th>마감기한</th>
										</tr>
									</thead>
									<tbody>
										<%
											if (getState != null && getState.size() == 0) {
										%>
										<tr>
											<td>모집 중인 프로젝트가 없습니다.</td>
										</tr>
										<%
											} else {
										%>
										<%
											if (getState.size() > 3) {
													for (int i = 0; i < 3; i++) {
										%>
										<tr>
											<td><a href=""><%=getState.get(i).get("PRO_NAME")%></a></td>
											<td><%=getState.get(i).get("PRO_PRICE")%></td>
											<td><%=getState.get(i).get("PRO_PERIOD")%></td>
											<td><%=getState.get(i).get("PRO_END")%></td>
										</tr>
										<%
											}
										%>
										<%
											} else {
													for (int i = 0; i < getState.size(); i++) {
										%>
										<tr>
											<td><a href=""><%=getState.get(i).get("PRO_NAME")%></a></td>
											<td><%=getState.get(i).get("PRO_PRICE")%></td>
											<td><%=getState.get(i).get("PRO_PERIOD")%></td>
											<td><%=getState.get(i).get("PRO_END")%></td>
										</tr>
										<%
											}
										%>
										<%
											}
										%>
										<%
											}
										%>
									</tbody>
								</table>
								<div class="column" style="padding-left: 20px; padding-right: 0px; padding-top: 0px; padding-bottom: 0px; text-align: center; width: 20%">
									<!-- 파트너 -->
								</div>
								<div class="column" style="padding-left: 20px; padding-right: 0px; padding-top: 0px; padding-bottom: 0px; text-align: center; width: 20%">
									<!-- 금액 수 -->
								</div>
								<div class="column" style="padding-left: 20px; padding-right: 0px; padding-top: 0px; padding-bottom: 0px; text-align: center; width: 20%">
									<!-- 기간 -->
								</div>
								<div class="column" style="padding-left: 20px; padding-right: 0px; padding-top: 0px; padding-bottom: 0px; text-align: center; width: 20%">
									<!-- 남은기간 -->
								</div>
								<div class="column" style="padding-left: 20px; padding-right: 0px; padding-top: 0px; padding-bottom: 0px; text-align: center; width: 20%">
									<!-- 도구 -->
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
			<!-- 우측메뉴 +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++-->
			<div class="ui column" style="width: 20%; padding-top: 0px; padding-left: 0px; padding-right: 0px">

				<!-- 로그인 정보 =================================================================================-->
				<div class="ui segment" style=" background-color: #E6E6E6; ">
					<jsp:include page="../auth/loginOk.jsp" />
				</div>
				<!-- 로그인 정보 =================================================================================-->

				<div class="ui fluid vertical menu" style="padding-left: 10px; padding-right: 10px; padding-bottom: 10px; text-align: center; background-color: #E6E6E6; ">
					<div style="padding: 10px; text-align: center;">
						<b>무료로 프로젝트를<br> 등록해 보세요
						</b>
					</div>
					<div class="ui blue labeled submit icon button" onclick="location.href='/clients/projectRegisterDetail'" style="padding: 10px;">
						<i class="icon edit"></i> 프로젝트 등록하기
					</div>
					<div class="ui container" style="padding-top: 10px; padding-bottom: 10px; padding-left: 0px; padding-right: 0px; width: 100%;">
						<hr class="dotted" style="width: 100%;" />
					</div>
					<div class="ui submit fluid icon button" onclick="location.href='#'" style="padding: 10px; background-color: #D8CEF6">프로젝트 등록 도움말</div>
				</div>
				<!-- 수정시작20181018 -->
				<div class="ui fluid vertical menu" style="padding-left: 10px; padding-right: 10px; padding-bottom: 00px; text-align: center; background-color: #E6E6E6; ">
					<div style="padding-top: 10px; text-align: left;">
						<h5>커프링크 히스토리</h5>
					</div>
					<div class="ui container" style="padding-top: 00px; padding-bottom: 10px; padding-left: 0px; padding-right: 0px; width: 100%;">
						<hr class="dotted" style="width: 100%;" />
					</div>
					<div class="column" style="">
						<div class="ui two column grid">
							<div class="column h15" style="text-align: left; padding-top: 10px; padding-bottom: 10px; padding-left: 20px; padding-right: 0px; width: 60%">
								<b>프로젝트 등록</b>
							</div>
							<div class="column h15" style="padding-top: 10px; padding-bottom: 10px; padding-left: 20px; padding-right: 20px; text-align: right; width: 40%;">
								<b>${projectCount} 건</b>
							</div>
							<div class="column h15" style="text-align: left; padding-top: 10px; padding-bottom: 10px; padding-left: 20px; padding-right: 0px; width: 60%">
								<b>계약한 프로젝트</b>
							</div>
							<div class="column h15" style="padding-top: 10px; padding-bottom: 10px; padding-left: 20px; padding-right: 20px; text-align: right; width: 40%;">
								<b>${sup } 건</b>
							</div>
							<div class="column h15" style="text-align: left; padding-top: 10px; padding-bottom: 10px; padding-left: 30px; padding-right: 0px; width: 60%">계약률</div>
							<div class="column h15" style="padding-top: 10px; padding-bottom: 10px; padding-left: 20px; padding-right: 20px; text-align: right; width: 40%;">0 %</div>
							<div class="column h15" style="text-align: left; padding-top: 10px; padding-bottom: 10px; padding-left: 30px; padding-right: 0px; width: 60%">진행중인 프로젝트</div>
							<div class="column h15" style="padding-top: 10px; padding-bottom: 10px; padding-left: 20px; padding-right: 20px; text-align: right; width: 40%;">${ing } 건</div>
							<div class="column h15" style="text-align: left; padding-top: 10px; padding-bottom: 10px; padding-left: 30px; padding-right: 0px; width: 60%">완료한 프로젝트</div>
							<div class="column h15" style="padding-top: 10px; padding-bottom: 10px; padding-left: 20px; padding-right: 20px; text-align: right; width: 40%;">${comp } 건</div>
						</div>
						<div class="ui container" style="padding-top: 20px; padding-bottom: 10px; padding-left: 0px; padding-right: 0px;">
							<hr class="dotted" style="" />
						</div>
						<div class="ui two column grid">
							<div class="column h15" style="text-align: left; padding-top: 10px; padding-bottom: 0px; padding-left: 20px; padding-right: 0px; width: 60%">
								<b>누적 완료 금액</b>
							</div>
							<div class="column h15" style="padding-top: 0px; padding-bottom: 0px; padding-left: 20px; padding-right: 20px; text-align: right; width: 40%;"></div>
							<div class="column h15" style="text-align: left; padding-top: 10px; padding-bottom: 10px; padding-left: 20px; padding-right: 0px; width: 60%">
								<b>￦</b>
							</div>
							<div class="column h15" style="padding-top: 10px; padding-bottom: 10px; padding-left: 20px; padding-right: 20px; text-align: right; width: 40%;">
								<b>${ money } 원</b>
							</div>
						</div>
					</div>
					<div class="ui container" style="padding-top: 00px; padding-bottom: 10px; padding-left: 0px; padding-right: 0px; width: 100%;">
						<hr class="dotted" style="width: 100%;" />
					</div>
				</div>
				<!-- 수정끝20181018 -->
				<div class="ui fluid vertical menu" style="padding-left: 10px; padding-right: 10px; padding-bottom: 00px; text-align: center; background-color: #E6E6E6; ">
					<div style="padding-top: 10px; text-align: left;">
						<h5>새로운 소식</h5>
					</div>
					<div class="ui container" style="padding-top: 00px; padding-bottom: 10px; padding-left: 0px; padding-right: 0px; width: 100%;">
						<hr class="dotted" style="width: 100%;" />
					</div>
					<div class="column" style="height: 100px;">
						<div class="ui container">새로운 소식이 없습니다.</div>
					</div>
					<div class="ui container" style="padding-top: 00px; padding-bottom: 10px; padding-left: 0px; padding-right: 0px; width: 100%;">
						<hr class="dotted" style="width: 100%;" />
					</div>
				</div>
			</div>
		</div>

		<!-- main 입력 끝-->

	</div>

	<!----------------------------------------------------------------------- main content 끝 --->
	<!--======================================================================================-->

	<!-- <div class="ui basicspace">
		login title와 main content 여백
	</div>
 -->
	<!----------------------------------------------------------------------- footer content 시작 -->
	<!-- footer 시작-->
	<footer class="footer">
		<div class="ui inverted segment">
			<jsp:include page="../common/menu/footerMenu.jsp" />
		</div>
	</footer>
	<!-- footer 끝-->
	<!----------------------------------------------------------------------- footer content 끝 -->
</body>
</html>
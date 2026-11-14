<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<c:set var="BASE" value="${pageContext.request.contextPath}" />
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>每小时充值查询</title>
<style type="text/css">
* {
	font-size: 16px;
}

table {
	border-collapse: collapse;
}

.tbl_list {
	margin: 20px auto 0 auto;
	width: 500px;
	border: 1px solid #CCC;
	border-collapse: collapse;
	background-color: #FFF;
}

.tbl_list td {
	border: 1px solid #CCC;
	padding: 0 20px;
	height: 20px;
}

.tbl_list .tr_list_title {
	height: 24px;
	line-height: 24px;
	background-color: #DBE3FF;
}
.red{
	color: #FF0000;
}
body {TEXT-ALIGN: center;}
</style>
<script type="text/javascript"
	src="${BASE}/component/jquery/jquery-1.8.0.min.js"></script>

</head>
<body style="width: 100%;">
	<div style="margin: 10px auto 20px auto;"><span class="red">支持月份和日期2中格式,输入月份则按天统计,输入日期则按小时统计</span></div>
	
	<div style="width: 500px; margin: 0 auto; padding: 0; text-align: center;">
		<form action="./jtddqdc.ly" id="requestForm">
			<span style="width: 200px; margin: 10px auto; height: 30px; text-align: center;">请输入日期:
				<input name="selectDay" id="selectDay" type="text" size="10" value="${reqDate}" /> 
				平台:<select name="platform" style="width: 100px;">
						<option value="" <c:if test="${platform == null}">selected = true"</c:if>>所有服</option>
						<c:forEach items="${snames}" var="sname">
							<option id="" value="${sname}"
								<c:if test="${platform == sname}">selected="selected" </c:if>>${sname}</option>
						</c:forEach>
					</select> 
			<input type="submit" value="查询">
			<c:if test="${ error != null }"> <span class="red">${error }</span> </c:if>
			</span>
		</form>
	</div>

	<div style="margin: 50px auto 0 auto; width: 500px; ">
		<table class="tbl_list" align="center">
			<tr class="tr_list_title">
				<th width="50%" align="center">时间</th>
				<th width="50%" align="center">充值金额</th>
			</tr>

			<c:forEach items="${chargeDayInfo}" var="dayInfo">
				<tr class="tr_list_data">
					<td align=center width="50%">${dayInfo.time}</td>
					<td align=center width="50%">${dayInfo.hour_amount}</td>
				</tr>
			</c:forEach>

		</table>
	</div>
</body>
</html>
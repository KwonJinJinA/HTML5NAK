<%@page import="java.util.List"%>
<%@page import="java.util.Map"%>
<%@page import="java.text.DecimalFormat"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>每月或每日充值排行查询</title>
<style type="text/css">
* {
	font-size: 16px;
	padding: 0; 
}

table {
	border-collapse: collapse;
}

.tbl_list {
	margin: 10px auto 0 auto;
	width: 500px;
	border: 1px solid #CCC;
	border-collapse: collapse;
	background-color: #FFF;
}

.tbl_list td {
	border: 1px solid #CCC;
	padding: 0 20px;
	height: 20px;
	width: 50%;
}

.tbl_list .tr_list_title {
	height: 24px;
	line-height: 24px;
	background-color: #DBE3FF;
}

.tbl_list .tr_list_title td{
	text-align: center;
}

</style>

</head>
<body style="width: 100%;">
	<div style="width: 51%; margin: 20px auto 5px auto; text-align: center;">
		<form action="./chargerank.ly" id="requestForm">
			<span style="width: 200px; margin: 10px auto; height: 30px; text-align: center;">
				请输入日期:<input name="selectDay" id="selectDay" type="text" size="10" value="${reqDate}" /> 
				平台:<select name="platform" style="width: 100px;">
					<option value=""
						<c:if test="${curpid == null}">selected = true"</c:if>>所有服</option>
						<c:forEach items="${snames}" var="sname">
						<option id="" value="${sname}"
							<c:if test="${curpid == sname}">selected="selected" </c:if>>${sname}</option>
						</c:forEach>

					</select> 
				<input type="submit" value="查询">
			</span>
		</form>
	</div>
	
	<div style="width: 51%; margin: 10px auto; text-align: center;">
	(<font color="red">*日期必须满足yyyy-mm-dd</font>)
		<%  String error = (String)request.getAttribute("error");
	  		if(error != null){
		%>
		<font color="red" size="12"><%= error %></font>
		<%
			 }
		%>
	</div>

	<div style="width: 51%; margin: 5px auto 0px auto; text-align: center;">
		<table class="tbl_list" align="center">
			<tr class="tr_list_title">
				<th >userId</th>
				<th >充值金额</th>
			</tr>

			<%
		List<Map<String, String>> chargeDayInfo = (List<Map<String, String>>)request.getAttribute("chargeRank");
		 if(chargeDayInfo != null ){
			
			 for(Map<String, String> data : chargeDayInfo){
				 %>
			<tr class="tr_list_data">
				<td><%= data.get("user_id") %></td>
				<td><%= data.get("money") %></td>
			</tr>
			<% 
			 }
		 }

		%>

		</table>
	</div>
</body>
</html>
<%@page import="java.util.List"%>
<%@page import="java.util.Map"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>根据平台名查询充值</title>
<style type="text/css">
*{font-size: 16px;}
table{
	border-collapse: collapse;
}
.tbl_list{
	margin: 20px auto 0 auto;
	width: 1200px;
	border: 1px solid #CCC;
	border-collapse: collapse;
	background-color: #FFF;
	margin-left: 300px;
	
}
.tbl_list td{
	border: 1px solid #CCC;
	padding: 0 20px;
	height: 20px;
}
.tbl_list .tr_list_title{
	height: 24px;
	line-height: 24px;
	background-color: #DBE3FF;
}
.red{
	color: #FF0000;
}
</style>
</head>
<body style="width: 100%;">
	<div style="width: 100%; margin: 0; padding: 0; text-align:center; font-size: 15;">
	<form action="./jtddpcs.ly">
	<span style="width: 200px; margin: 10px auto; height: 30px; text-align:center; ">
	平台名称:<input name="plat" type="text" size="15" value="${plat}"/> 
	&nbsp;&nbsp;&nbsp;月份：<input name="date" type="text" size="10" value="${date }"><span class="red">（例：2015-04）</span>
	<input type="submit" value="查询"></span>
	<c:if test="${not empty errorCode }"><span class="red">${errorCode}</span></c:if>
	</form>
	</div>
	
	<div style="float:left; width:1200px; margin: 0 20px; padding: 20px 0 0 0 ;">
			<table class="tbl_list" align="center">
				<tr class="tr_list_title">
					<td width="200px"  align="center">user_guid</td>
					<td width="200px"  align="center">订单号</td>
					<td width="200px"  align="center">充值金额</td>
					<td width="400px"  align="center">充值时间</td>
				</tr>
			 <% 
				List<Map<String, Object>> chargeTotalList = (List<Map<String, Object>>)request.getAttribute("chargeTotalList");
				if(chargeTotalList!=null){
				for( Map<String, Object> oneRecord : chargeTotalList ){ %>
				<tr class="tr_list_data">
					<td align="center"><%= oneRecord.get("guid") %></td>
					<td align="center"><%= oneRecord.get("orderid") %></td>
					<td align="center"><%= oneRecord.get("amount") %></td>
					<td align="center"><%= oneRecord.get("time") %></td>
				</tr>
				<% }} %>
			</table>
		</div>
</body>
</html>
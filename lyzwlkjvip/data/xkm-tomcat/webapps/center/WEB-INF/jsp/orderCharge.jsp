<%@page import="java.util.Date"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.List"%>
<%@page import="java.util.Map"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>订单查询</title>
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
</style>
</head>
<body style="width: 100%;">
	<div style="width: 100%; margin: 0; padding: 0; text-align:center;">
	<form action="./jtddors.ly">
	<span style="width: 200px; margin: 10px auto; height: 60px; text-align:center; ">订单号:<input name="order" type="text" size="30" value="${order}"/> &nbsp;&nbsp;&nbsp;月份：  <input name="date" type="text" size="10" value="${date }"><font color="red" size="15">（例：2015-04）</font><input type="submit" value="查询"></span>
	</form>
	</div>
	
	<div style="float:left; width:1200px; margin: 0 20px; padding: 20px 0 0 0 ;">
			<table class="tbl_list" align="center">
				<tr class="tr_list_title">
					<td width="200px"  align="center">订单号</td>
					<td width="200px"  align="center"> user_guid</td>
					<td width="200px"  align="center">server_id</td>
					<td width="200px"  align="center">平台名</td>
					<td width="200px"  align="center">充值金额</td>
					<td width="200px"  align="center">充值结果</td>
					<td width="400px"  align="center">充值时间</td>
				</tr>
			 <% 
				List<Map<String, Object>> chargeTotalList = (List<Map<String, Object>>)request.getAttribute("chargeTotalList");
				if(chargeTotalList!=null){
				for( Map<String, Object> oneRecord : chargeTotalList ){ %>
				<tr class="tr_list_data">
					<td align="center"><%= oneRecord.get("orderid") %></td>
					<td align="center"><%= oneRecord.get("guid") %></td>
					<td align="center"><%= oneRecord.get("serverid") %></td>
					<td align="center"><%= oneRecord.get("platform") %></td>
					<td align="center"><%= oneRecord.get("amount") %></td>
					<td align="center"><%= oneRecord.get("result") %></td>
					<td align="center"><%= oneRecord.get("time") %></td>
				</tr>
				<% }} %>
			</table>
		</div>
</body>
</html>
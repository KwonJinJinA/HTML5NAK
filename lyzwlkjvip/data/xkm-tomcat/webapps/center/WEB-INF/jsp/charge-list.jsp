<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<c:set var="BASE" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>充值统计</title>
<style type="text/css">
*{font-size: 16px;}
table{
	border-collapse: collapse;
}
.tbl_list{
	margin: 20px auto 0 auto;
	width: 500px;
	border: 1px solid #CCC;
	border-collapse: collapse;
	background-color: #FFF;
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
<script type="text/javascript" src="${BASE}/component/jquery/jquery-1.8.0.min.js"></script>

</head>
<body style="width: 100%;">
	<div style="width: 100%; margin: 0; padding: 0; text-align:center;">
	<form action="./chargelist.ly" id="requestForm">
	<span style="width: 200px; margin: 10px auto; height: 30px; text-align:center; ">请输入日期:<input name="selectDay" id="selectDay" type="text" size="10" value="${reqDate}"/>-<input name="endTime" id="endTime" type="text" size="10" value="${endTime }"><input type="submit" value="查询">(<font color="red">*两日期必须在同一个月</font>)<input type="button" value="生成图表" onclick="generalChart()"/><font color="red" size="12">${error }</font></span>
	<div style="text-align: center">
	<input id="addDate" type="button" value="Add Date" />
		<table id="dateTable" border="1" cellpadding="3" cellspacing="0" style="width: 40%;margin:auto" >
	        <tr>
	            <td>默认日期</td><td><input name="date0" id="date0" type="text" /></td>
	        </tr>
	    </table>
	    <br/>
	   <input type="button" value="生成图表" onclick="generalChart()"/>
    </div>
	</form>
	</div>
	
	<div style="float:left; width: 100%; margin: 0 20px; padding: 20px 0 0 0 ;">
		<div style="margin: 0 auto; width: 400px;">各平台[${reqDate}] - [${endTime}]的收入总和</div>
			<table class="tbl_list" align="center">
				<tr class="tr_list_title">
					<td width="200" align="center">平台名</td>
					<td width="200" align="center">总充值</td>
				</tr>
				
				<c:set var="sumVal" value="0"/>
				
				<c:forEach items="${chargeTotalList}" var="oneRecord">
					<tr class="tr_list_data">
						<td align="center">${oneRecord.platform}</td>
						<td align="center"><fmt:formatNumber value="${oneRecord.sumVal}" pattern="0.00"/></td>
						<c:set var="sumVal" value="${sumVal+oneRecord.sumVal}"/>
					</tr>
				</c:forEach>
				<tr class="tr_list_title">
					<td align="center">总计</td>
					<td align="center"><fmt:formatNumber value="${sumVal }" pattern="0.00"/></td></tr>
			</table>
		</div>
		
		<div id="container" style="min-width: 310px; height: 400px; margin: 0 auto"></div>
</body>
<script src="${BASE}/component/highcharts/highcharts.js"></script>
<script type="text/javascript" src="${BASE}/component/highcharts/exporting.js"></script>
<script src="${BASE}/js/chart.js"></script>
<script type="text/javascript">
$(document).ready(function() {
    //add more file components if Add is clicked
    $('#addDate').click(function() {
        var dateIndex = $('#dateTable tr').children().length - 1;
        $('#dateTable').append(
                '<tr><td>比对日期'+ dateIndex +'</td><td>'+
                '   <input type="text" id="date'+ dateIndex +'" name="date'+ dateIndex +'" />'+
                '</td></tr>');
    });
     
});

function generalChart(){	
	var datas = [];
	$("#dateTable input").each(function(){
		datas.push($(this).val());
	});
	 $.ajax({
		url:"./chargelist.ly?reportType=lineChart",
		data:{
			"datas":datas
		},
		success:function(jsondata){
			var data = eval(jsondata);
			/* var data = eval('(' +jsondata+ ')');
			var x = eval(data.xAxisData);
			var xAxis = x[0].xAxisData;
			initLineChart("container","平台充值折线图",data,xAxis); */
			initLineChatHours("container", "平台充值折线图", data);
		}
	}) ; 
}
</script>
</html>
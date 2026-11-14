﻿<%@page import="java.util.Date"%>
<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fns" uri="/WEB-INF/tlds/fns.tld" %>
<%@ taglib prefix="tags" tagdir="/WEB-INF/tags" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>

<html>
<head>
	<title><spring:message code='str1696'/></title>
	<meta name="decorator" content="default"/>
	<%@include file="/WEB-INF/views/include/highcharts.jsp" %>
	<style type="text/css">
		span.input-group-btn {
			display: none;
		}
		#contentTable{
			 margin-left: 47px;
   			 width: 95%;
   			 margin-top: 12px;
		}
		#searchForm{
			margin-left: 45px;
    		width: 93.5%;
    		margin-top: 22px;
		}
	</style>


	<script type="text/javascript">
		function page(n, s) {
			$("#pageNo").val(n);
			$("#pageSize").val(s);
			$("#searchForm").submit();
			return false;
		}
		$(document).ready(function() {
			$(".dblclick").dblclick(function() {
				$(this).parent().find("#entryOpenTime").css("display", "none");
				$(this).parent().find("#showOpen").css("display", "block");
			})
		})
		$(document).ready(function() {
			$(".dblclick1").dblclick(function() {
				$(this).parent().find("#hefuTime").css("display", "none");
				$(this).parent().find("#showHefu").css("display", "block");
			})
		})
		function hideTime(a) {
			$(a).parent().parent().parent().find("#openTime").css("display","block");
			$(a).parent().parent().parent().find("#showOpen").css("display", "none");
			$(a).parent().parent().parent().find("#entryOpenTime").css("display", "block");
		}
		function hideTime1(a) {
			$(a).parent().parent().parent().find("#hefuTime").css("display","block");
			$(a).parent().parent().parent().find("#showHefu").css("display", "none");
		}
		
		function updateTime(a,woldId) {
			var openTime=$(a).parent().parent().parent().find("#openTime").text();
			var open_time=$(a).parent().parent().parent().find("#open_time").val();
			if(openTime!=open_time){
				if(open_time!=""){
					$.ajax({
						type : 'POST',
						url : "${ctx }/tools/gameArea/updateOpenTime",
						dataType : 'json',
						data:{"open_time":open_time,"woldId":woldId},
						before : function() {
							loading("正在提交请稍等...")
						},
						success : function(data) {
							if(data=="1"){
							$(a).parent().parent().parent().find("#openTime").css("display","block");
							$(a).parent().parent().parent().find("#showOpen").css("display", "none");
							$(a).parent().parent().parent().find("#openTime").text(open_time);
							alert("修改成功");
							}else{
							alert("修改失败");
							}
						}
					})
				}else{
					alert("开服时间不能为空");
				}
			 
			}else{
				alert("未进行修改");
			}
		}
		
		function updateEntryOpenTime(a, channelId ,serverId) {
			var oldOpenQueryTime=$(a).parent().parent().parent().find("#entryOpenTime").text();
			var newOpenTime =$(a).parent().find("#newOpenDate").val();
			
			if(oldOpenQueryTime!=newOpenTime){ 
				if(newOpenTime!="" ){
					$.ajax({
						type : 'POST',
						url : "changeEntryOpenTime?newOpenQueryTime="+newOpenTime+"&channelId="+channelId+"&serverId="+serverId,
						dataType : 'json',
						contentType: "application/json; charset=utf-8",  
						data:{"newOpenQueryTime":newOpenTime,"channelId":channelId,"serverId":serverId},
						before : function() {
							loading("正在提交请稍等...")
						},
						success : function(data) {
							if(data=="1"){
								$(a).parent().parent().parent().find("#entryOpenTime").css("display","block");
								$(a).parent().parent().parent().find("#openTime").css("display","block");
								$(a).parent().parent().parent().find("#showOpen").css("display", "none");
								$(a).parent().parent().parent().find("#entryOpenTime").text(newOpenTime); 
								alert("修改成功");
							}else{
								alert("修改失败");
							}
						},
						error:function(data){
							alert("配置错误");
						}
					})
				}else{
					alert("入口开放时间不能为空"); 
				}
			}else{
				alert("未进行修改");
			}
		}
	</script>

</head>
<body>
	<ul class="nav nav-tabs">
		<li class="active"><a href="toListJsp">游戏服务器列表</a></li>
		<li><a href="addNew">添加游戏服务器</a></li>
	</ul>
	<form id="searchForm" action="${ctx}/gameserver/findAll" method="get" class="breadcrumb form-search">
		<input id="pageNo" name="pageNo" type="hidden" value="${page.pageNo}"/>
		<input id="pageSize" name="pageSize" type="hidden" value="${page.pageSize}"/>

		<label><spring:message code='str1307'/> <spring:message code='str4'/></label>
		<select id="pid" name="pids" onchange="setCurrentPlatform()">
			<option value=""><spring:message code='str627'/></option>
			<c:forEach var="item" items="${fns:getGamePlatformList()}">
				<option value="${item}" <c:if test="${item==paramMap.pids}">selected="selected"</c:if>>
				${item}</option>
			</c:forEach>
		</select>
		<label><spring:message code='str768'/>ID<spring:message code='str4'/></label>
		<input id="areaId" name="areaId" value="${paramMap.areaId}"/>
		&nbsp;<input id="btnSubmit" class="btn btn-primary" type="submit" value="<spring:message code="operation.search"/>" onclick="return page();"/>
	</form>
	<tags:message content="${message}"/>
	<table id="contentTable" class="table table-striped table-bordered table-condensed">
		<thead>
		<tr>
			<th>ID</th>  
			<th>渠道</th>
			<th>服名</th> 
			<th>IP</th> 
			<th>端口</th> 
			<th>状态</th> 
			<th>合服到</th> 
			<th>开服时间</th> 
			<th>开入口时间</th>
			<th>操作</th>
		</tr>
		</thead>
		<tbody>
		<c:forEach items="${servers}" var="item">
			<tr>
				<td>${item.serverId}</td>
				<td>${item.platform}</td> 
				<td>${item.platSid}</td>
				<td>${item.ipOut}</td>
				<td>${item.tcpPort}</td>
				<td>
				  <c:choose>
                    <c:when test="${item.status == 0}"><span class="label label-info">运行中</span></c:when>
                    <c:when test="${item.status == 1}"><span class="label label-warning">停机中</span></c:when>
                    <c:otherwise><span class="label label-important">未知</span></c:otherwise>
                   </c:choose>
				</td>
				<td>${item.targetId}</td>
				
				<td>
					<span id="openTime">
						<jsp:useBean id="openTimeDate" class="java.util.Date"></jsp:useBean>
						<jsp:setProperty property="time" name="openTimeDate" value="${item.openTime }"/>
						<fmt:formatDate value="${openTimeDate}" pattern="yyyy-MM-dd HH:mm:ss"/>
					</span>
				</td>
				<td class="dblclick" >
					<jsp:useBean id="entryOpenTime" class="java.util.Date"></jsp:useBean>
					<jsp:setProperty property="time" name="entryOpenTime" value="${item.entryOpenTime }"/>
					<span id="entryOpenTime"><fmt:formatDate value="${entryOpenTime}" pattern="yyyy-MM-dd HH:mm:ss"/></span>
					<span id="showOpen" style="display:none">
						<input type="text" name="newOpenDate" id="newOpenDate" onfocus="WdatePicker({dateFmt:'yyyy-MM-dd HH:mm:ss'})" value="<fmt:formatDate value='${entryOpenTime}' pattern='yyyy-MM-dd HH:mm:ss'/>"/><br/>
						<input type="button" id="tijiao" value="提交" onclick="updateEntryOpenTime(this,'${item.platform}',${item.serverId})"/> 
						<input type="button" value="取消" onclick="hideTime(this)"/>
					</span>
				</td>
				<td>
					<c:choose>
					<c:when test="${item.targetId != 0}">已合服不能操作</c:when>
					<c:when test="${item.status == 0}"><a type="button" href="#" class="btn btn-warning btn-small"   onclick="showContent('${ctx}/viewFollowerId?pids=${item.platSid }&followerId=${item.ipOut }&name=${item.platform }')">停服</a></c:when>
					<c:when test="${item.status == 1}"><a type="button" href="#" class="btn btn-primary btn-small"   onclick="showContent('${ctx}//viewFollowerId?pids=${item.platSid }&followerId=${item.ipOut }&name=${item.platform }')">启服</a></c:when>
					</c:choose>
				 </td>
			</tr>
		</c:forEach>
		</tbody>
	</table>
	
	<script type="text/javascript">
	$(document).ready(function(){
		$('table.highchart').highchartTable();
		$("#s2id_pids").hide();
		$("#pids").multiselect({
			includeSelectAllOption:true,
			enableFiltering:true
		});
	});
	
	function showContent(url) {
		debugger;
	    $.ajax({
	        type : "POST",
	        url: url,
	        dataType: 'text',
	        before:function(){
	            loading(str1189)
	        },
	        success:function(data){
	            var d = top.dialog({
	                title: "<spring:message  code='followerId.config'/>",
	                width:'100%',
	                height:'97%',
	                content: data,
	                ok: function(){
	                    d.close();
	                },
	                cancel: function(){}
	            });
	            $("td.ui-dialog-body", top.document).css('height','auto');
	            d.showModal();
	        }
	    })
	}
	</script>
</html>

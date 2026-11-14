<%@page import="java.util.Date"%>
<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<html>
<head>
	<title><spring:message code='str1696'/></title>
	<meta name="decorator" content="default"/>
	<%@include file="/WEB-INF/views/include/treeview.jsp" %>
	<%@include file="/WEB-INF/views/include/highcharts.jsp" %>
</head>
<body>
	<ul class="nav nav-tabs">
		<li><a href="toListJsp">游戏服务器列表</a></li>
		<li class="active"><a href="addNew">添加游戏服务器</a></li>
	</ul>
	<br/>
	<form:form id="inputForm" modelAttribute="server" action="saveNew" method="post" class="form-horizontal">
		<tags:message content="${message}"/>
		<div class="control-group">
			<label class="control-label">平台id:</label>
			<div class="controls">
				<form:input path="platform" required="true" htmlEscape="false" maxlength="10" class="required"/>
				<label>(qq空间热咔reka;微信河马hema)</label>
			</div>
		</div>

<%-- 		<div class="control-group">
			<label class="control-label">服务器id:</label>
			<div class="controls">
				<form:input path="serverId" required="true" htmlEscape="false" maxlength="10" class="required"/>
				<label>(数字,比如1)</label>
			</div>
		</div> --%>

		<div class="control-group">
			<label class="control-label">开服时间:</label>
			<div class="controls">
				<form:input path="openTimeDate" required="true" maxlength="20" class="input-small Wdate" onclick="WdatePicker({dateFmt:'yyyy-MM-dd',isShowClear:false});" style="width: 12%;"/>
				<label>(年-月-日,与游戏逻辑相关，与是否可见无关。是否可见由入口开启时间决定-在服务器列表中配置)</label>
			</div>
		</div>
		
		<div class="control-group">
			<label class="control-label">服务器显示名:</label>
            <div class="controls">
                <form:input path="platSid" required="true" htmlEscape="false" maxlength="20" class="required"/>
                <label>(比如微信1服)</label>
            </div>
		</div>

<%-- 		<div class="control-group">
			<label class="control-label">内网ip:</label>
            <div class="controls">
                <form:input path="ipIn" required="true" htmlEscape="false" maxlength="20" class="required"/>
                <label>(所在物理服务器内网IP,君海10.104.206.36)</label>
            </div>
		</div> --%>
		
		<div class="control-group">
			<label class="control-label">外网ip:</label>
            <div class="controls">
                <form:input path="ipOut" required="true" htmlEscape="false" maxlength="20" class="required"/>
                <label>(所在物理服务器外网IP,河马111.231.241.155)</label>
            </div>
		</div>
		
		<!--<div class="control-group">
			<label class="control-label">服务器名：</label>
            <div class="controls">
                <form:input path="serverName" name="" required="true" htmlEscape="false" maxlength="20" class="required"/>
            </div>
		</div>

		 <div class="control-group">
			<label class="control-label">qq平台serverId:</label>
			<div class="controls">
				<form:input path="qqServerId" name="" htmlEscape="false" maxlength="10" class="required"/>
				<label>qq开平对应的id，非qq平台忽略</label>
			</div>
		</div> -->
		
		<div class="control-group">
			<div class="controls" style="color:red">${message }</div>
			
		</div>
		
		<div class="form-actions" style="background-color: white;border-top: white;margin-top: 0;padding-top: 0;">
			<input id="btnSubmit" class="btn btn-primary" type="submit" value="<spring:message code='str1176'/> <spring:message code='str1177'/>"/>&nbsp;
			<input id="btnCancel" class="btn" type="button" value="<spring:message code='str1117'/> <spring:message code='str1118'/>" onclick="history.go(-1)"/>
		</div>
	</form:form>
</body>
</html>

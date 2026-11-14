<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>
<head>
	<%-- <title><spring:message code='str1122'/></title> --%>
	<title>热更文件管理</title>
	<meta name="decorator" content="default"/>
	<%@include file="/WEB-INF/views/include/dialog.jsp" %>
	<script src="http://code.jquery.com/jquery-latest.js"></script>
    <script type="text/javascript">
		function searchMethod(){
			/* var value = $('#searchSelect option:selected').val();

			$.ajax({
				type:"post",
				contentType : 'application/json',
				url:"/center/configuration/searchActivity",
				data: JSON.stringify({"searchName":value}),
			}); */
		}
    </script>
    <style type="text/css">
        table{table-layout: fixed;}
		td {
			overflow: hidden;
		}
		td.ui-dialog-body {
            height: auto;
     }
    </style>
</head>
<body>
	<ul class="nav nav-tabs">
		<li class="active"><a href="activityList">热更文件列表</a></li>
		<li><a href="toInsertActivity">上传热更文件</a></li>
		<li ><a href="nameList">类别列表</a></li>
	</ul>
	
    <form:form id="searchForm" action="searchActivity" method="post" class="breadcrumb form-search" >
		<label><spring:message code='str1119'/></label>
		<select name="activityName" id="searchSelect">
			<option value=""><spring:message code='str1129'/></option>
		 	<c:forEach items="${nameLists}" var="item">
				<option value="${item}" <c:if test="${item==paramMap.activityName}">selected="selected"</c:if>>${item}</option>
		 	</c:forEach>
		</select>
        <label><spring:message code='str1130'/></label>
        <input type="text" name="createTimeStart" class="input_search" size="10" readonly="readonly" maxlength="20" value="${paramMap.createTimeStart}" id="startDatePicker" onfocus="WdatePicker({maxDate:'#F{$dp.$D(\'endDatePicker\')}'})">
				-&nbsp;
		<input type="text" name="createTimeEnd" class="input_search" size="10" readonly="readonly" value="${paramMap.createTimeEnd}" id="endDatePicker" onfocus="WdatePicker({minDate:'#F{$dp.$D(\'startDatePicker\')}'})">
        &nbsp;
        <input id="btnSubmit" class="btn btn-primary" type="submit" value="<spring:message code="operation.search"/>" onclick="searchMethod()"/>
		&nbsp;
    </form:form>
	<tags:message content="${message}"/>
    <form id="tableForm" action="">
		<table id="contentTable" class="table table-striped table-bordered table-condensed tooltip-demo">
			<tr>
				<%-- <th width="54px">
					<input id="checkAllOrNot" name="checkAllOrNot" type="checkbox"/><spring:message code='str1133'/>
				</th> --%>
				<th><spring:message code='str1134'/></th>
				<th><spring:message code='str1112'/></th>
				<th><spring:message code='str1124'/></th>
				<th><spring:message code='str1135'/></th>
				<th><spring:message code='str1136'/></th>
				<th><spring:message code='str128'/></th>
				<th><spring:message code='str1137'/></th>
				<th width="120px"><spring:message code='str149'/></th>
			</tr>
			<c:forEach items="${configuration}" var="item">
				<tr>
					<%-- <td><input type="checkbox" name="recordIds" value="${item.activityName}"></td> --%>
	                <td>${item.fileUrl}</td>
	                <td>${item.activityName}</td>
					<td>${item.activityDescription}</td>
	                <td><spring:message code='str1347'/></td>
					<td><fmt:formatDate value="${item.uploadTime}" pattern="yyyy-MM-dd HH:mm:ss"/></td>
					<td><fmt:formatDate value="${item.updateTime}" pattern="yyyy-MM-dd HH:mm:ss"/></td>
					<td>${item.uploadAuther}</td>
	                <td>
						<a href="toInsertActivity?activityName=${item.activityName }" style="float:left;margin-left:10px;">
							<i class="icon-edit"></i><spring:message code='str1365'/></a>
						<a href="delActivity?activityName=${item.activityName }" style="float:left;margin-left:25px;color:red">
							<i class="icon-edit"></i>删除</a>
					</td>
				</tr>
			</c:forEach>
		</table>
		<div class="pagination">${page}</div>
    </form>
    
</body>
</html>

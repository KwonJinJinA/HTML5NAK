<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>
<head>
	<%-- <title><spring:message code='str1104'/></title> --%>
	<title>热更类别管理</title>
	<meta name="decorator" content="default"/>
	<%@include file="/WEB-INF/views/include/treeview.jsp" %>
    <%@include file="/WEB-INF/views/include/dialog.jsp" %>

    <script type="text/javascript">
		$(document).ready(function() {
			$("#inputForm").validate({
				submitHandler: function(form){
					if ($("#isGlobal").val() == "0") {
						var serverId =$("#serverIds").val();
						if (serverId == "") {
							tips("<spring:message code='str1105'/>!");
							return;
						}
					}

					loading('<spring:message code='str1106'/>...');
					form.submit();
				},
				errorContainer: "#messageBox",
				errorPlacement: function(error, element) {
					$("#messageBox").text("<spring:message code='str1107'/>");
					if (element.is(":checkbox")||element.is(":radio")||element.parent().is(".input-append")){
						error.appendTo(element.parent().parent());
					} else {
						error.insertAfter(element);
					}
				},
				rules:{
					name:{
						required: true,
						maxlength:200
					},
					alias:{
						required: true,
						maxlength:200
					}
				}
			})
		})
    </script>
</head>
<body>
	<ul class="nav nav-tabs">
		<li class="active"><a href="nameList">类别列表</a></li>
		<li><a href="toAddName">类别维护</a></li>
		<li><a href="toInsertActivity">上传热更文件</a></li>
	</ul>
    <form:form id="" action="" method="post" class="breadcrumb form-search">
        <input id="pageNo" name="pageNo" type="hidden" value="${page.pageNo}"/>
        <input id="pageSize" name="pageSize" type="hidden" value="${page.pageSize}"/>
		<label><spring:message code='str1119'/></label>
		<input name="name" htmlEscape="false" maxlength="100" class="input-small"/>
		<input id="btnSubmit" class="btn btn-primary" type="submit" value="<spring:message code="operation.search"/>" onclick="return page();"/>
    </form:form>
	<tags:message content="${message}"/>
	
	<table id="contentTable" class="table table-striped table-bordered table-condensed tooltip-demo">
		<tr>
		<th><spring:message code='str1112'/></th>
		<th>文件名</th>
		<th>操作</th>
		</tr>
		<c:forEach items="${nameLists}" var="item">
			<tr>
                <td>${item.activityName}</td>
                <td>${item.aliasName}</td>
                <td>
					<a href="toAddName?activityName=${item.activityName}" style="float:left;margin-left:10px;">
						<i class="icon-edit"></i><spring:message code='str1365'/></a>
					<a href="delName?activityName=${item.activityName}" style="float:left;margin-left:25px;color:red">
						<i class="icon-edit"></i>删除</a>
					<a href="toInsertActivity?activityName=${item.activityName }" style="float:left;margin-left:10px;">
						<i class="icon-edit"></i>上传热更文件</a>
                </a></td>
			</tr>
		</c:forEach>
	</table>
	<div class="pagination">${page}</div>

</body>
</html>

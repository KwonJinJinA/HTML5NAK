<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>
<head>
	<%-- <title><spring:message code='str1139'/></title> --%>
	<title>热更类别管理</title>
	<meta name="decorator" content="default"/>
	<%@include file="/WEB-INF/views/include/treeview.jsp" %>
    <script type="text/javascript">

        $(document).ready(function() {
            $("#content").focus();
            $("#inputForm").validate({
                submitHandler: function(form){

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
                }
            });

        });
  </script>
</head>
<body>
	<jsp:useBean id="activity" class="com.xuanqing.cabal.charge.activity.ActivityNameConfig" scope="request"/>
	<ul class="nav nav-tabs">
		<li><a href="nameList">类别列表</a></li>
		<li class="active">	<a href="toAddName">类别维护</a>	</li>
		<li><a href="toInsertActivity">上传热更文件</a></li>
	</ul><br/>
	<form:form id="inputForm" modelAttribute="activity" action="insertName" method="post" class="form-horizontal">
		<tags:message content="${message}"/>
		<div class="control-group">
			<label class="control-label">活动名称:</label>
			<div class="controls">
				<c:if test="${empty activity.activityName }">
					<form:input path="activityName" required="true" htmlEscape="false" class="required"/>				
				</c:if>
				<c:if test="${not empty activity.activityName }">
					<form:input path="activityName" required="true" htmlEscape="false"  class="required" readonly="true"/>
				</c:if>
			</div>
        </div>
		<div class="control-group">
			<label class="control-label">Alias:</label>
			<div class="controls">
				<form:input path="aliasName" required="true" htmlEscape="false" class="required"/>
			</div>
		</div>
		<div class="form-actions">
			<c:if test="${not empty activity.activityName }">
				<input id="btnSubmit" class="btn btn-success" type="submit" value="修改"> &nbsp;
			</c:if>
		    <c:if test="${empty activity.activityName }">
				<input id="btnSubmit" class="btn btn-primary" type="submit" value="新增"> &nbsp;
			</c:if>
			<input id="btnCancel" class="btn" type="button" value="返 回" onclick="history.go(-1)">
		</div>
	</form:form>

</body>
</html>

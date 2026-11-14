\<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>
<head>
	<title>热更文件管理</title>
	<meta name="decorator" content="default"/>
	<%@include file="/WEB-INF/views/include/treeview.jsp" %>
    <%@include file="/WEB-INF/views/include/dialog.jsp" %>

    <script type="text/javascript">

        $(document).ready(function() {
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
                },
                rules:{
					activityName:{
                        required: true
                    }
                }
            });
        });
    </script>
</head>
<body>
	<ul class="nav nav-tabs">
	 <li ><a href="activityList">热更文件列表</a></li>
	 <li class="active"><a href="toInsertActivity">上传热更文件</a></li>
	 <li ><a href="nameList">类别列表</a></li>
	</ul><br/>
	<form:form id="inputForm" action="saveAcitivity" method="post" class="form-horizontal" enctype="multipart/form-data">
		<tags:message content="${message}"/>
		<div class="control-group">
			<label class="control-label"><spring:message code='str1112'/>:</label>
			<div class="controls">
				<c:if test="${not empty configuration.activityName}">
					<input id="activityName" name="activityName" value="${configuration.activityName}" readonly/>
				</c:if>
				<c:if test="${empty configuration.activityName}">
					<select id="activityName" name="activityName">
						<c:forEach items="${nameLists}" var="item">
							<option value="${item}">${item}</option>
						</c:forEach>
					</select>
				</c:if>	
			</div>
        </div>
		
		<div class="control-group">
			<label class="control-label"><spring:message code='str1124'/>:</label>
			<div class="controls">
				<textarea name="activityDescription" value="${configuration.activityDescription}" htmlEscape="false" rows="3" maxlength="200" class="input-xlarge"></textarea>
			</div>
		</div>
		
		<div class="control-group">
			<label class="control-label"><spring:message code='str1125'/>:</label>
			<div class="controls">
				<c:if test="${empty configuration.fileUrl}">
					<input type="file" name="file" class="required"/>
				</c:if>	
				<c:if test="${not empty configuration.fileUrl}">
					<input type="file" name="file" value="${configuration.fileUrl}"/>
				</c:if>	
			</div>
		</div>
		
		<div class="form-actions">
			<c:if test="${not empty configuration.activityName}">
		       <input id="btnSubmit" class="btn btn-success" type="submit" value="<spring:message code='str1115'/><spring:message code='str1116'/> "/> &nbsp; 
		</c:if>
		<c:if test="${empty configuration.activityName}">
			   <input id="btnSubmit" class="btn btn-primary" type="submit" value="<spring:message code='str1113'/><spring:message code='str1114'/>"/> &nbsp;
		</c:if>
			<input id="btnCancel" class="btn" type="button" value="<spring:message code='str1117'/> <spring:message code='str1118'/>" onclick="history.go(-1)"/>
		</div>
	</form:form>

</body>
</html>

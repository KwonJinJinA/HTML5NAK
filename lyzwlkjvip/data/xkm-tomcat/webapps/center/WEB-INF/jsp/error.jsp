<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>error</title>
<script type="text/javascript">
	function reloadTo(){
		var toUrl=document.getElementById("toUrl").value;
		setTimeout("location.href='"+toUrl+"'",5000);
	}
</script>
</head>
<body onload="reloadTo()">
<input type="hidden"  id="toUrl"  value="${errorRedirectUrl}" />

${errorCode},5秒后跳转至<a href="${errorRedirectUrl}">${errorRedirectUrl}</a>

</body>
</html>
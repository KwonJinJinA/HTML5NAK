<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css"
	integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm"
	crossorigin="anonymous">
<script type="text/javascript"
	src="${BASE}/component/jquery/jquery-1.8.0.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"
	integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl"
	crossorigin="anonymous"></script>
</head>
<body>
	<div class="container" style = "margin:20px;margin-top:35px">
		<div class="row" style="margin-right: -750px;">
			<div class="col-md-2">
				<ul class="list-group">
				    <li class="list-group-item"><a href="activityList" target="mainFrame"><i class="icon-search"></i>&nbsp;活动列表</a></li>
				    <li class="list-group-item"><a href="toInsertActivity" target="mainFrame"><i class="icon-search"></i>&nbsp;添加活动</a></li>
				    <li class="list-group-item"><a href="nameList" target="mainFrame"><i class="icon-search"></i>&nbsp;活动名列表</a></li>
				    <li class="list-group-item"><a href="toAddName" target="mainFrame"><i class="icon-search"></i>&nbsp;添加活动名</a></li>
				</ul>
			</div>
			<div class="col-md-10">
				<iframe id="mainFrame" name="mainFrame" src="activityList" style="overflow: visible; height: 900px;" scrolling="yes"
					frameborder="no" width="100%" height="900"></iframe>
			</div>
		</div>
	</div>
</body>
</html>
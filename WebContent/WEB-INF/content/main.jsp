<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">


<script src="http://www.jeasyui.net/Public/js/jquery.js"></script>
<script
	src="http://www.jeasyui.net/Public/js/easyui/jquery.easyui.min.js"></script>
<link rel="stylesheet" type="text/css"
	href="http://www.jeasyui.net/Public/js/easyui/themes/icon.css">
<link rel="stylesheet" type="text/css"
	href="http://www.jeasyui.net/Public/js/easyui/themes/bootstrap/easyui.css">
<style type="text/css">
.footer {
	text-align: center;
	margin-top: 10px;
}
</style>

<title>欢迎使用_30cms系统</title>
</head>
<body>
<body class="easyui-layout">
	<div data-options="region:'north',border:false"
		style="height: 60px; background: #B3DFDA; padding: 10px; text-align: right;">这里是介绍,及用户信息</div>




	<div data-options="region:'west',split:true,title:'West'"
		style="width: 150px; padding: 10px;">



		<div class="easyui-panel" style="padding: 5px">
			<ul class="easyui-tree"
				data-options="url:'${contextPath }/getMenu/0',method:'delete',loadFilter:treeFilter"></ul>

		</div>


	</div>



	<div data-options="region:'south',border:false"
		style="height: 50px; background: #A9FACD; padding: 10px;">

		<div class="footer">
			<b>网站签名${contextPath }</b>
		</div>

	</div>
	<div data-options="region:'center',title:'Center'"></div>
</body>



<script type="text/javascript">
	function treeFilter(d, p) {

	}
	
</script>


</html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<link rel="stylesheet" type="text/css"
	href="${statics }/easyui/themes/icon.css">
<link rel="stylesheet" type="text/css"
	href="${statics }/easyui/themes/bootstrap/easyui.css">
<style type="text/css">
</style>

<title>欢迎使用_30cms系统</title>
</head>
<body>
<body class="easyui-layout">
	<div
		data-options="region:'north',border:false,href:'${contextPath }/bg/main/north'"
		style="height: 50px; background: #B3DFDA; padding: 10px; text-align: right;"></div>

	<div data-options="region:'west',split:true,title:'功能菜单'"
		style="width: 150px; padding: 10px;">

		<ul class="easyui-tree"
			data-options="method:'get',url:'${contextPath }/bg/menu/getMenu/1',onClick:toURL,lines:true"></ul>


	</div>

	<div
		data-options="region:'south',border:false,href:'${contextPath }/bg/main/south'"
		style="height: 50px; background: #A9FACD; padding: 10px;"></div>
	<div class="easyui-tabs" id="tabs"
		data-options="region:'center',onContextMenu:tabsContent">

		<div title="欢迎页" data-options="href:'${contextPath }/bg/main/center'"></div>

	</div>


	<div id="tabsMenu" style="width: 120px; display: none;">
		<div type="refresh">刷新</div>
		<div class="menu-sep"></div>
		<div type="close">关闭</div>
		<div type="closeOther">关闭其他</div>
		<div type="closeAll">关闭所有</div>
		<div type="closeright" id="mm-tabcloseright">当前页右侧全部关闭</div>
		<div type="closeleft" id="mm-tabcloseleft">当前页左侧全部关闭</div>
	</div>

</body>





<script src="${statics }/easyui/jquery.min.js"></script>
<script
	src="${statics }/easyui/jquery.easyui.min.js"></script>
<script
	src="http://cdn.bootcss.com/jquery-json/2.5.1/jquery.json.min.js"></script>

<script type="text/javascript">
	var tabs = $("#tabs");
	var basePath = '${contextPath}';
</script>
<script type="text/javascript" src="${statics }/js/menu.js"></script>

<script type="text/javascript" src="${statics }/js/main.js"></script>

</html>
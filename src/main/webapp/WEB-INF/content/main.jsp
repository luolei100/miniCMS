<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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
</style>

<title>欢迎使用_30cms系统</title>
</head>
<body>
<body class="easyui-layout">

	<div
		data-options="region:'north',border:false,href:'${contextPath }/main/north'"
		style="height: 50px; background: #B3DFDA; padding: 10px; text-align: right;"></div>

	<div data-options="region:'west',split:true,title:'功能菜单'"
		style="width: 150px; padding: 10px;">

		<ul class="easyui-tree"
			data-options="method:'get',onBeforeLoad:changeUrl,onClick:toURL"></ul>


	</div>

	<div
		data-options="region:'south',border:false,href:'${contextPath }/main/south'"
		style="height: 50px; background: #A9FACD; padding: 10px;"></div>
	<div class="easyui-tabs" id="tabs" data-options="region:'center',onContextMenu:tabsContent">

		<div title="欢迎页" data-options="href:'${contextPath }/main/center'"></div>

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



<script type="text/javascript">
	var tabs = $("#tabs");

	function treeFilter(d, p) {

	}

	function refreshTab(title) {
		var tab = tabs.tabs('getTab', title);
		tabs.tabs('update', {
			tab : tab,
			options : tab.panel('options')
		});
	}

	function toURL(n) {
		$.messager.progress({
			text : '页面加载中....',
			interval : 100
		});
		window.setTimeout(function() {
			try {
				$.messager.progress('close');
			} catch (e) {
			}
		}, 500);

		tabs.tabs('add',{
			title : n.text,
			closable : true,
			iconCls : n.iconCls,
			content : '<iframe src="${contextPath }/'
					+ n.url
					+ '" frameborder="0" style="border:0;width:100%;height:99.4%;"></iframe>',
			tools : [ {
				iconCls : 'icon-mini-refresh',
				handler : function() {
					refreshTab(tabs, n.text);
				}
			} ]
		});

	}

	var tabsMenu = $('#tabsMenu').menu(
			{
				onClick : function(item) {
					var curTabTitle = $(this).data('tabTitle');//获得当前tab标题
					var type = $(item.target).attr('type');//获取当前tab类型

					if (type === 'refresh') {
						refreshTab(tabs, curTabTitle);
						return;
					}

					if (type === 'close') {
						var t = tabs.tabs('getTab', curTabTitle);
						if (t.panel('options').closable) {
							tabs.tabs('close', curTabTitle);
						}
						return;
					}
					if (type == 'closeleft') {
						var prevall = $('.tabs-selected').prevAll();
						if (prevall.length == 0) {
							msgShow('系统提示', '后边没有啦~~', 'info');
							return false;
						}
						prevall.each(function(i, n) {
							var t = $('a:eq(0) span', $(n)).text();
							tabs.tabs('close', t);
						});
						return;

					}
					if (type == 'closeright') {
						var nextall = $('.tabs-selected').nextAll();
						if (nextall.length == 0) {
							msgShow('系统提示', '后边没有啦~~', 'info');

							return false;
						}
						nextall.each(function(i, n) {
							debugger;
							var t = $('a:eq(0) span', $(n)).text();
							tabs.tabs('close', t);
						});
						return;
					}

					var allTabs = centerTabs.tabs('tabs');
					var closeTabsTitle = [];

					$.each(allTabs, function() {
						var opt = $(this).panel('options');
						if (opt.closable && opt.title != curTabTitle
								&& type === 'closeOther') {
							closeTabsTitle.push(opt.title);
						} else if (opt.closable && type === 'closeAll') {
							closeTabsTitle.push(opt.title);
						}
					});

					for (var i = 0; i < closeTabsTitle.length; i++) {
						tabs.tabs('close', closeTabsTitle[i]);
					}
				}
			});
	
	
	function tabsContent(e, title) {
		e.preventDefault();
		tabsMenu.menu('show', {
			left : e.pageX,
			top : e.pageY
		}).data('tabTitle', title);
	}
	
	function changeUrl(n, p) {
		var id = 0;
		if (n) {
			id = n.id;
		}
		$(this).tree('options').url = "${contextPath }/menu/getMenu/" + id;
		p.id = 'unuseable';
	}
</script>


</html>
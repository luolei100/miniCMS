function refreshTab(title) {
		var tab = tabs.tabs('getTab', title);
		tabs.tabs('update', {
			tab : tab,
			options : tab.panel('options')
		});
	}

	function toURL(n) {
		if(!$(this).tree('isLeaf',n.target)) {
			
			if(n.state=='closed'){
				$(this).tree('expand',n.target);	
			}else {
				$(this).tree('collapse',n.target);
			}
			
			
			return ;
		}
		
		if(tabs.tabs('exists',n.text)) {
			tabs.tabs('select',n.text);
			refreshTab(n.text);
			return ;
		}
		
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

		tabs.tabs('add', {
			title : n.text,
			closable : true,
			iconCls : n.iconCls,
			href : basePath+'/'+n.url,
			tools : [ {
				iconCls : 'icon-mini-refresh',
				handler : function() {
					refreshTab(n.text);
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

<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<table id="tg" class="easyui-treegrid" style="width: 100%; height: 100%"
	data-options="
				iconCls: 'icon-ok',
				rownumbers: true,
				animate: true,
				collapsible: true,
				fitColumns: true,
				url: 'treegrid_data2.json',
				method: 'get',
				idField: 'id',
				treeField: 'text',
				onContextMenu: contextMenu">
	<thead>
		<tr>
			<th data-options="field:'text',width:180">名称</th>
			<th data-options="field:'url',width:60,align:'right'">url</th>
			<th data-options="field:'icon',width:80">图标</th>
		</tr>
	</thead>
</table>
<div id="mm" class="easyui-menu" style="width: 120px;">
	<div onclick="append()" data-options="iconCls:'icon-add'">添加</div>
	<div onclick="removeIt()" data-options="iconCls:'icon-remove'">删除</div>
	<div onclick="edit()" data-options="iconCls:'icon-edit'">修改</div>
	<div class="menu-sep"></div>
	<div onclick="collapse()">收缩</div>
	<div onclick="expand()">展开</div>
</div>


<script type="text/javascript">
<!--
	//-->

	function edit() {
		var tg = $("#tg");
		var node = tg.treegrid('getSelected');
		tg.beginEdit(node.id);
	}

	function contextMenu(e, row) {
		e.preventDefault();
		$(this).treegrid('select', row.id);
		$('#mm').menu('show', {
			left : e.pageX,
			top : e.pageY
		});
	}
	var idIndex = 100;
	function append() {
		idIndex++;
		d2.setMonth(d2.getMonth() + 1);
		var node = $('#tg').treegrid('getSelected');
		$('#tg').treegrid('append', {
			parent : node.id,
			data : [ {
				id : idIndex,
				text : '目录名称' + idIndex,
				url : ''
			} ]
		})
	}
	function removeIt() {
		var node = $('#tg').treegrid('getSelected');
		if (node) {
			$('#tg').treegrid('remove', node.id);
		}
	}
	function collapse() {
		var node = $('#tg').treegrid('getSelected');
		if (node) {
			$('#tg').treegrid('collapse', node.id);
		}
	}
	function expand() {
		var node = $('#tg').treegrid('getSelected');
		if (node) {
			$('#tg').treegrid('expand', node.id);
		}
	}
</script>


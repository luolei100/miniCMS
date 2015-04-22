<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>栏目列表</title>
<link rel="stylesheet" type="text/css"
	href="${contextPath }/js/jquery-easyui-1.4/themes/bootstrap/easyui.css">
<link rel="stylesheet" type="text/css"
	href="${contextPath }/js/jquery-easyui-1.4/themes/bootstrap/datagrid.css">
<link rel="stylesheet" type="text/css"
	href="${contextPath }/js/jquery-easyui-1.4/themes/icon.css">
</head>
<body>
	<div id="tb" style="padding: 5px 0px 3px 10px; height: auto">
		<div style="margin-bottom: 5px">
			<a href="#" onclick="$('#w').window('open')"
				class="easyui-linkbutton" iconCls="icon-add" plain="true">添加</a> <a
				href="#" onclick="$('#w').window('open')" class="easyui-linkbutton"
				iconCls="icon-edit" plain="true">修改</a> <a href="#"
				class="easyui-linkbutton" iconCls="icon-save" plain="true">保存</a> <a
				href="#" class="easyui-linkbutton" iconCls="icon-remove"
				plain="true">删除</a>
		</div>
	</div>


	<div id="w" class="easyui-window" title="Custom Window Tools"
		closed="true" data-options="iconCls:'icon-save',minimizable:false"
		style="width: 500px; height: 200px; padding: 10px;">
		<form id="ff" method="post">
			<table cellpadding="5">
				<tr>
					<td>Name:</td>
					<td><input class="easyui-textbox" type="text" name="name"
						data-options="required:true"></input></td>
				</tr>
				<tr>
					<td>Email:</td>
					<td><input class="easyui-textbox" type="text" name="email"
						data-options="required:true,validType:'email'"></input></td>
				</tr>
				<tr>
					<td>Subject:</td>
					<td><input class="easyui-textbox" type="text" name="subject"
						data-options="required:true"></input></td>
				</tr>
				<tr>
					<td>Message:</td>
					<td><input class="easyui-textbox" name="message"
						data-options="multiline:true" style="height: 60px"></input></td>
				</tr>
				<tr>
					<td>Language:</td>
					<td><select class="easyui-combobox" name="language"><option
								value="ar">Arabic</option></select></td>
				</tr>
			</table>
		</form>
		<div style="text-align: center; padding: 5px">
			<a href="javascript:void(0)" class="easyui-linkbutton"
				onclick="submitForm()">Submit</a> <a href="javascript:void(0)"
				class="easyui-linkbutton" onclick="clearForm()">Clear</a>
		</div>
	</div>












	<h2>TreeGrid ContextMenu</h2>
	<p>Right click to display the context menu.</p>
	<div style="margin: 20px 0;"></div>
	<table id="tg" class="easyui-treegrid" title="TreeGrid ContextMenu"
		toolbar="#tb"
		data-options="
				iconCls: 'icon-ok',
				rownumbers: true,
				animate: true,
				collapsible: true,
				fitColumns: true,
				url: '${contextPath }/background/column/getTree?parentId=0',
				method: 'get',
				idField: 'id',
				treeField: 'name',
				onContextMenu: onContextMenu
			">
		<thead>
			<tr>
				<th
					data-options="field:'columnName',width:$(this).width() * 0.3,halign:'center'">栏目名称</th>
				<th
					data-options="field:'columnUrl',width:$(this).width() * 0.4,halign:'center'">访问路径</th>
				<th
					data-options="field:'columnSort',width:$(this).width() * 0.3,halign:'center'"
					editor="{type:'numberbox',options:{precision:1}}">排列顺序</th>
			</tr>
		</thead>
	</table>
	<div id="mm" class="easyui-menu" style="width: 120px;">
		<div onclick="append()" data-options="iconCls:'icon-add'">Append</div>
		<div onclick="removeIt()" data-options="iconCls:'icon-remove'">Remove</div>
		<div class="menu-sep"></div>
		<div onclick="collapse()">Collapse</div>
		<div onclick="expand()">Expand</div>
	</div>
	<script type="text/javascript">
		function formatProgress(value) {
			if (value) {
				var s = '<div style="width:100%;border:1px solid #ccc">'
						+ '<div style="width:' + value
						+ '%;background:#cc0000;color:#fff">' + value + '%'
						+ '</div>';
				'</div>';
				return s;
			} else {
				return '';
			}
		}
		function onContextMenu(e, row) {
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
			var d1 = new Date();
			var d2 = new Date();
			d2.setMonth(d2.getMonth() + 1);
			var node = $('#tg').treegrid('getSelected');
			$('#tg').treegrid('append', {
				parent : node.id,
				data : [ {
					id : idIndex,
					name : 'New Task' + idIndex,
					persons : parseInt(Math.random() * 10),
					begin : $.fn.datebox.defaults.formatter(d1),
					end : $.fn.datebox.defaults.formatter(d2),
					progress : parseInt(Math.random() * 100)
				} ]
			});
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

</body>

<script type="text/javascript"
	src="${contextPath }/js/jquery-easyui-1.4/jquery.min.js"></script>
<script type="text/javascript"
	src="${contextPath }/js/jquery-easyui-1.4/jquery.easyui.min.js"></script>
<script type="text/javascript"
	src="${contextPath }/js/jquery-easyui-1.4/locale/easyui-lang-zh_TW.js"></script>

</html>
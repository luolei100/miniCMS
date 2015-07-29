<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<table id="tg" class="easyui-treegrid" style="width: 100%; height: 100%"
	data-options="
				iconCls: 'icon-ok',
				rownumbers: true,
				animate: true,
				collapsible: true,
				fitColumns: true,
				url:'${contextPath }/bg/menu/getMenu/1',
				method: 'get',
				idField: 'id',
				treeField: 'text',
				toolbar:'#mm',
				onLoadSuccess:function(){$(this).treegrid('expandAll')},
				onDblClickRow:edit ,
				onClickRow:accept">
	<thead>
		<tr>
			<th data-options="field:'id',width:0,hidden:'hidden'"><th
				data-options="field:'text',width:150,align:'center',editor:'text'">名称</th>
			<th data-options="field:'url',width:150,align:'center',editor:'text'">url</th>
			<th
				data-options="field:'iconCls',width:150,align:'center',editor:'text'">图标</th>
		</tr>
	</thead>
</table>
<div id="mm" style="padding:5px;height:auto">
	<div style="margin-bottom:5px">
		<a href="javascript:void(0)" onclick="save()" class="easyui-linkbutton" iconCls="icon-save" plain="true">保存</a>|
		<a href="javascript:void(0)" onclick="append()" class="easyui-linkbutton" iconCls="icon-add" plain="true">添加</a>|
		<a href="javascript:void(0)" onclick="edit()" class="easyui-linkbutton" iconCls="icon-edit" plain="true">修改</a>|
		<a href="javascript:void(0)" onclick="accept()" class="easyui-linkbutton" iconCls="icon-ok" plain="true">确定</a>|
		<a href="javascript:void(0)" onclick="cancel()" class="easyui-linkbutton" data-options="iconCls:'icon-undo',plain:true" >丢弃</a>|
		<a href="javascript:void(0)" onclick="removeit()" class="easyui-linkbutton" iconCls="icon-remove" plain="true">刪除</a>|
	</div>
</div>

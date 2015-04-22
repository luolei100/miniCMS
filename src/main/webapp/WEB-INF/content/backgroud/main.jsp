<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<link rel="stylesheet" type="text/css"
	href="../../themes/default/easyui.css">
<link rel="stylesheet" type="text/css" href="../../themes/icon.css">
<link rel="stylesheet" type="text/css" href="../demo.css">


<title>${companyName}</title>
</head>
<body>
	<h2>${companyName }后台管理程序</h2>
	<p></p>
	<div style="margin: 20px 0;"></div>
	<div class="easyui-layout" style="width: 700px; height: 350px;">
		<div data-options="region:'north'" style="height: 50px"></div>
		<div data-options="region:'west',split:true" title="West"
			style="width: 100px;"></div>
		<div data-options="region:'center',title:'操作窗口',iconCls:'icon-ok'">
			<table class="easyui-datagrid"
				data-options="url:'datagrid_data1.json',method:'get',border:false,singleSelect:true,fit:true,fitColumns:true">
				<thead>
					<tr>
						<th data-options="field:'itemid'" width="80">Item ID</th>
						<th data-options="field:'productid'" width="100">Product ID</th>
						<th data-options="field:'listprice',align:'right'" width="80">List
							Price</th>
						<th data-options="field:'unitcost',align:'right'" width="80">Unit
							Cost</th>
						<th data-options="field:'attr1'" width="150">Attribute</th>
						<th data-options="field:'status',align:'center'" width="60">Status</th>
					</tr>
				</thead>
			</table>
		</div>
	</div>
</body>
</html>
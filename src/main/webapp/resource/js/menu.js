var editingId;
function edit() {
	if (editingId != undefined) {
		$('#tg').treegrid('select', editingId);
		return;
	}
	var row = $('#tg').treegrid('getSelected');
	if (row) {
		editingId = row.id;
		$('#tg').treegrid('beginEdit', editingId);
	}
}
function save() {
	var rows = $('#tg').treegrid('getChanges');

	if (rows && rows.length > 0) {

		$.ajax({
			async : false,
			type : 'post',
			url : basePath + "menu/edit",
			contentType : 'application.json',
			data : rows.serialize(),
			error : function(XMLHttpRequest, textStatus, errorThrown) {
				alert("请求错误!!");
			},
			success : function(data, textStatus, jqXHR) {
				alert(data.message);
				if (data.status) {
					$('#tg').relaod();
				}
			}
		});
	}
}
function cancel() {
	if (editingId != undefined) {
		$('#tg').treegrid('cancelEdit', editingId);
		editingId = undefined;
	}
}

function accept() {
	if (editingId != undefined) {
		// $('#tg').treegrid('acceptChanges');
		$('#tg').treegrid('endEdit', editingId);
		editingId = undefined;
	}
}
function getChanges() {
	var rows = $('#tg').treegrid('getChanges');
	alert(rows.length + ' rows are changed!');
}

function append() {
	var node = $('#tg').treegrid('getSelected');
	if (!node) {
		alert("请选择一列");
		return;
	}

	var id = 0;

	var rows = $('#tg').treegrid('getChildren', node.id);
	if (rows && rows.length > 0) {

		for (var i = 0; i < rows.length; i++) {
			if (rows[i].id > id) {
				id = rows[i].id;
			}
		}
		id++;

	} else {
		id = node.id + '' + 0;
	}

	$("#tg").treegrid('append', {
		parent : node.id,
		data : [ {
			id : id,
			text : '新加菜单'
		} ]

	});
}

function removeit() {
	var node = $('#tg').treegrid('getSelected');
	if (!node) {
		return;
	}
	$('#tg').treegrid('remove', node.id);
}

function exp() {
	alert(11);
	expandAll();
}

function changeGridUrl(n, p) {
	var id = 0;
	if (n) {
		id = n.id;
	}
	$(this).treegrid('options').url = basePath + "/menu/getMenu/" + id;
	p.id = 'unuseable';
}
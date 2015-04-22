	
	var editingId;
	function edit(){
		if (editingId != undefined){
			$('#tg').treegrid('select', editingId);
			return;
		}
		var row = $('#tg').treegrid('getSelected');
		if (row){
			editingId = row.id
			$('#tg').treegrid('beginEdit', editingId);
		}
	}
	function save(){
		if (editingId != undefined){
			var t = $('#tg');
			t.treegrid('endEdit', editingId);
			editingId = undefined;
			var persons = 0;
			var rows = t.treegrid('getChildren');
			for(var i=0; i<rows.length; i++){
				var p = parseInt(rows[i].persons);
				if (!isNaN(p)){
					persons += p;
				}
			}
			var frow = t.treegrid('getFooterRows')[0];
			frow.persons = persons;
			t.treegrid('reloadFooter');
		}
	}
	function cancel(){
		if (editingId != undefined){
			$('#tg').treegrid('cancelEdit', editingId);
			editingId = undefined;
		}
	}

	
	function accept(){
		if (editingId != undefined){
			$('#tg').treegrid('acceptChanges');
			$('#tg').treegrid('endEdit');
			editingId = undefined ;
		}
	}
	function getChanges(){
		var rows = $('#tg').treegrid('getChanges');
		alert(rows.length+' rows are changed!');
	}
	
	
	function append() {
		var node = $('#tg').treegrid('getSelected');
		if(!node) {
			alert("请选择一列") ;
			return ;
		}
		$("#tg").treegrid('append',{
			parent:node.id,
			data:[{
				id:10,
				text:'新加菜单'
			}]
			
		});
	}
	
	
	function exp(){
		alert(11);
		expandAll();
	}
	
	
	function changeGridUrl(n, p) {
		var id = 0;
		if (n) {
			id = n.id;
		}
		$(this).treegrid('options').url = basePath+"/menu/getMenu/" + id;
		p.id = 'unuseable';
	}
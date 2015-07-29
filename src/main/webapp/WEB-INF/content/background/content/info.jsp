<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>新闻编辑</title>
   <link href="${statics }/js/jquery-easyui-1.4/themes/bootstrap/easyui.css" rel="stylesheet" />
   <link href="${statics }/js/jquery-easyui-1.4/themes/icon.css" rel="stylesheet" />
   <link href="${statics }/js/editor/themes/default/default.css" rel="stylesheet" />
   <script src="${statics }/js/jquery-easyui-1.4/jquery.min.js"></script>
   <script src="${statics }/js/jquery-easyui-1.4/jquery.easyui.min.js"></script>
   <script src="${statics }/js/jquery-easyui-1.4/locale/easyui-lang-zh_CN.js"></script>
   <script src="${statics }/js/editor/kindeditor-min.js"></script>
   <script src="${statics }/js/editor/lang/zh_CN.js"></script>
   <script src="${statics }/js/easyui_kindeditor.js"></script>
   
   <style type="text/css">
   	
   	td {
   		padding-top:5px
   	}
   	
   	input {
   		width : 40%
   	}
   </style>
   
</head>
<body>
	<div style="padding: 10px 0 10px 60px" >
        <form id="ff" method="post">
            <table width="100%">
                <tr>
                    <td align="right">标题:</td>
                    <td>
                        <input class="easyui-validatebox" type="text" name="name" data-options="required:true"></input></td>
                </tr>
                <tr>
                    <td align="right">metia介绍:</td>
                    <td>
                        <input class="easyui-validatebox" type="text" name="email" data-options="required:true"></input></td>
                </tr>
                <tr>
                    <td>标题:</td>
                    <td>
                        <input class="easyui-validatebox" type="text" name="subject" data-options="required:true" style="width:40%"></input></td>
                </tr>
                <tr>
                    <td>内容:</td>
                    <td>
                        <textarea name="message" style="height: 60px;width:59%" ></textarea></td>
                </tr>

                <tr>
                    <td>kindeditor编辑器:</td>
                    <td>
                        <textarea name="txtContent" id="txtContent" style="width: 60%; height: 200px; visibility: hidden;">KindEditor</textarea>
                        <a href="javascript:void(0)" class="easyui-linkbutton" onclick="editor.html('我在设置KindEditor内容');">设置</a>
                        <a href="javascript:void(0)" class="easyui-linkbutton" onclick="alert(editor.html())">获取</a>
                    </td>
                </tr>
                <tr>
                    <td>语言:</td>
                    <td>
                        <select class="easyui-combobox" name="language">
                            <option value="ar">Arabic</option>
                            <option value="bg">Bulgarian</option>
                        </select>
                    </td>
                </tr>
            </table>
        </form>
    </div>
    <div style="padding: 5px; margin-left: 100px;">
        <a href="javascript:void(0)" class="easyui-linkbutton" onclick="submitForm()">提交</a>
        <a href="javascript:void(0)" class="easyui-linkbutton" onclick="clearForm()">清除</a>
    </div>
    <div id="dlg" class="easyui-dialog" title="dialog" style="width: 250px; height: 120px; padding: 10px"
        data-options="
				iconCls: 'icon-save',
				buttons: [{
					text:'Ok',
					iconCls:'icon-ok',
					handler:function(){
						alert('ok');
					}
				},{
					text:'Cancel',
					handler:function(){
						alert('cancel');;
					}
				}]
			">
        确认提交吗？
    </div>
    <script>
        //编辑器
        var editor;
        KindEditor.ready(function (K) {
            editor = K.create('textarea[name="txtContent"]', {
                allowFileManager: true,
                resizeType: 1,
                allowPreviewEmoticons: false,
                items: [
                    'fontname', 'fontsize', '|', 'forecolor', 'hilitecolor', 'bold', 'italic', 'underline',
                    'removeformat', '|', 'justifyleft', 'justifycenter', 'justifyright', 'insertorderedlist',
                    'insertunorderedlist', '|', 'emoticons', 'image', 'link','table']
            });
        });
        $(function () {
            $('#dlg').dialog('close')
        })
        function submitForm() {
            $('#dlg').dialog('open')
            //$('#ff').form('submit');
        }
        function clearForm() {
            $('#ff').form('clear');
        }
    </script>
	
	
	
	
	
	
	
</body>
</html>
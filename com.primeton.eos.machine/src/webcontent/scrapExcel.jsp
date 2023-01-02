<%@page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<script type="text/javascript"> 
	var contextPath = "/default";	 // you should define the contextPath of web application
	var EOSDEBUG = true;
	var FINAL_PANEL_HEIGHT = 22;
	
	var IFRAME_MODIFY_HEIGHE = 35;
	
	var TREE_MODIFY_HEIGHT = 22;
</script>
<script  type="text/javascript"  src="/default/common/javascripts/zh_CN/message.js" ></script>
<script  type="text/javascript"  src="/default/common/skins/styles/resource.js.jsp" ></script>
<script  type="text/javascript"  src="/default/common/skins/skin0/scripts/resource.js" ></script>
<script  type="text/javascript"  src="/default/common/fckeditor/ckeditor.js" ></script>
<script  type="text/javascript"  src="/default/common/scripts/eos-web.js" ></script>
<script  type="text/javascript"  src="/default/common/lib/mootools.js" ></script>
<script  type="text/javascript"  src="/default/common/javascripts/common.js" ></script>
<link href="/default/common/skins/styles/default/theme/style-sys.css" type="text/css" rel="stylesheet" />
<link href="/default/common/skins/styles/default/theme/style-component.css" type="text/css" rel="stylesheet" />
<link href="/default/common/skins/styles/default/theme/style-custom.css" type="text/css" rel="stylesheet" />
 
<body topmargin="0" leftmargin="0">
 
<input type="hidden" id="t_rownum" value="1">
 
<input type="hidden" name="_eosFlowAction" value="upload"/>
<form  id="form0.11536585182956771" name="query_form" action="com.primeton.eos.machine.FileUploadManager.flow" enctype="multipart/form-data" method="post" onsubmit="return checkForm(this);">
    <input type="hidden" name="_eosFlowAction" value="upload"/>
	<table align="center" border="0" width="100%" class="form_table" id="table_file">
		<tr height="4%">
		    <td class="eos-panel-title" colspan="6">&nbsp;&nbsp;上传文件</td>
	    </tr>	
		<tr>
			<TD  colspan="2">
				<input id="files" type='file' name="uploadFile" size='90' unselectable="on"> 
			</TD>
		</tr>
	</TABLE>
	<table align="center" border="0" width="100%" class="form_table" id="table_file">
		<tr class="form_bottom">
			<TD class="form_bottom" colspan="4">
		        <input type="button" class="button" value='上传' style="width:50px;" onclick="saveFileload();">
		        &nbsp;
		        <input type="button" class="button" value='关闭' style="width:50px;" onclick="onCancel();">
			</TD>
		</tr>	
	</TABLE>
<input type='hidden' name='_eosFlowKey' value='ae348054-9c5a-4f4b-91f3-180a2bf86a9c.view1'/></form><script type="text/javascript">checkOnsubmit($id('form0.11536585182956771'));</script>	
</body>
<script> 
 
 
function saveFileload()
{
	var frm = $name("query_form");
        
    //表单验证
    if( !checkForm(frm) ) {
        return;
    }
    
    if($id("files").value == "")
    {
    	alert('请选择上传的文件!'); //请选择上传的文件!
    	return false;
    }
    frm.submit();
}
 
function DeleteFileSelectInput(table_id,rowId) {//删除表格
	var myTable = $id(table_id);
	myTable.deleteRow(eval(rowId).rowIndex);
	return;
}
 
function AddFileSelectInput(table_id,hidden_rownum) {//增加表格(附件)
	
	var myTable = $id(table_id);
	var t_rownum= eval(document.getElementById(hidden_rownum).value);
	//向表格中增加一行
	var myNewRow = myTable.insertRow(myTable.rows.length);
	//取得表格的总行数
	var aRows=myTable.rows;
	//取得表格的总网格数
	var aCells=myNewRow.cells;
 
	var oCell1_2=aRows(myNewRow.rowIndex).insertCell();
	oCell1_2.colSpan=2;   
	t_rownum=t_rownum+1;
	document.getElementById(hidden_rownum).value=t_rownum;
	var rowId="rowId"+t_rownum;
	myNewRow.id=rowId;
 
	str="<input type='file' id='files' unselectable='on' name=\"uploadFile\" size='90'>&nbsp;<input type='button' value='删除' class='button' onclick='DeleteFileSelectInput(\""+table_id+"\",\""+rowId+"\");'>";
	oCell1_2.innerHTML=str;	
}
function onCancel(e) {   	
    	if(window.CloseOwnerWindow){
    	 	return window.CloseOwnerWindow(e);
    	}else{
			window.close();
    	}  
    }	    
</script>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@page import="com.eos.data.datacontext.UserObject"%>
<%@page import="com.eos.foundation.eoscommon.BusinessDictUtil"%>
<%
	String contextPath=request.getContextPath();
 %>
<html>
<!-- 
  - Author(s): Administrator
  - Date: 2016-06-20 13:57:53
  - Description:
-->
<head>
<title>Title</title>
<meta http-equiv="content-type" content="text/html; charset=UTF-8" />
<link href="<%= request.getContextPath() %>/ame_common/layer/layui.css" rel="stylesheet">
<script src="<%= request.getContextPath() %>/common/nui/nui.js" type="text/javascript"></script>
<script type="text/javascript" src="<%= request.getContextPath() %>/ame/clipview/assets/js/jquery.min.js"></script>
	<style type="text/css">
	    body{
	        margin:0;padding:0;border:0;width:100%;height:100%;overflow:hidden;
	    }
    </style>
</head>

<body>
<div>
  <div class="nui-toolbar" id="filedetail" style="border-bottom:0;padding:0px;">
  	<table style="width:100%;">
    	<tr><td id="fileTd">相关附件</td></tr>
    </table>
  </div>
	<div id="grid_0" class="nui-datagrid" style="width:100%;height:auto;" showPager="false" sortMode="client" url="com.primeton.eos.ame_common.file.getFiles.biz.ext" dataField="files" allowCellEdit="true" allowCellSelect="true" multiSelect="true" editNextOnEnterKey="true">
		<div property="columns">
			<div name="action" width="70" headerAlign="center" align="center" renderer="onActionRenderer" cellStyle="padding:0;">操作</div>
			<div field="fileName"width="200" headerAlign="center" align="center" renderer="getdetail">附件名称</div>
			<div field="fileType" width="110" renderer="dictKbasetype" align="center" headerAlign="center" >附件类型</div>
			<div field="operatorname" width="110"headerAlign="center" align="center">上传者</div>
			<div field="fileSize" width="50" headerAlign="center" align="center" renderer="getFileSize">文件大小</div>
			<div field="fileTime" width="150" headerAlign="center" dateFormat="yyyy-MM-dd HH:mm:ss" align="center">附件上传时间</div>
		</div>
	</div>
	<fieldset id="field2" style="border:solid 1px #aaa;padding:3px;">
<!-- 		<legend>添加附件</legend> -->
		<form id="form2" class="" action="com.primeton.eos.ame_common.ame_fileupload.flow" target="hidden_frame" method="post" enctype="multipart/form-data">
			<!--附件存放目录-->
			<input type="hidden" name="atFileupload/fileCatalog" id="fileCatalog" value=""/>
			<table id="filetable" width="100%" style="border-collapse:collapse" bordercolor="#A8A8A8" border="1" cellspacing="0" cellpadding="1"  align="center">
			      	<input type="button" id="fileButton" value="增加附件" onclick="addFile()"/>
			      	<font style="color:red;">(附件大小不能超过100兆)不允许上传exe,java,html,htm,class,jar文件类型</font>
		  	</table>
	  </form>
    <iframe name='hidden_frame' id="hidden_frame" style='display:none'></iframe>
    </fieldset>
   </div>
	<script type="text/javascript" src="<%= request.getContextPath() %>/ame_common/layer/layer.js"></script>
	<script src="<%= request.getContextPath() %>/ame_common/layui/layui.all.js"></script>
	<script type="text/javascript">
		<%String amepath = BusinessDictUtil.getDictName("AME_SYSCONF", "AMEPATH"); %>
    	var amepath ="<%=amepath %>";
    	var app = "<%= request.getContextPath() %>";
		var i = 0;
        function addFile(){
            i++;
	        var myTable = document.getElementById('filetable');
			//向表格中增加一行
			var myNewRow = myTable.insertRow(myTable.rows.length);
			//取得表格的总行数
			var aRows=myTable.rows;
			//取得表格的总网格数
			var aCells=myNewRow.cells;
			
			//向新增行中增加4个网格
			var oCell1_1=aRows[myNewRow.rowIndex].insertCell(aCells.length);
			var oCell1_2=aRows[myNewRow.rowIndex].insertCell(aCells.length);
			var oCell1_3=aRows[myNewRow.rowIndex].insertCell(aCells.length);
			var oCell1_4=aRows[myNewRow.rowIndex].insertCell(aCells.length);
			var oCell1_5=aRows[myNewRow.rowIndex].insertCell(aCells.length);
			var tempName=i;
			var tempID ="filea"+i;
			var tempID2='"'+tempID+'"';		
			//设置两个网格的html文本
			
			oCell1_1.innerHTML="附件";
			
			oCell1_2.innerHTML="<input type='file'  name='uploadfile' size='30' onchange='checkempty(this.value," + tempID2 + ")';/>";
			
			oCell1_3.innerHTML="<font style='color:#FF0000;'>*</font>附件名称";
			
			var temp = '<input type="text" name="remarkList" disabled="true" id="'+tempID+'"  size="30" validateAttr="allowNull=false"  size="45"/>';
			oCell1_4.innerHTML= temp;		
			oCell1_5.innerHTML= "<input type='button' value='删除附件' onclick='delFile(this);'/>";		
			return;
        }
        <!--//删除附件-->
		function delFile(obj){
			var explorer=navigator.userAgent;
			if (explorer.indexOf("Trident")>0) {
				obj.parentElement.parentElement.removeNode(true);
			}else{
				obj.parentElement.parentElement.remove(true);
			}	
			return true;
		}
		
		function checkempty(objvalue,flag){
			if(objvalue=="" ||objvalue==null){
				return false;
			}else{
				var textname=objvalue.split("\\");
				textname=textname[textname.length-1];
				textname= textname.substring(0, textname.lastIndexOf("."));
				eval("document.getElementById('"+flag+"')").value = textname;
				eval("document.getElementById('"+flag+"')").disabled =false;
				
			}
		}
		function onActionRenderer(e) {
            var grid = e.sender;
            var record = e.record;
            var uid = record._uid;
            var rowIndex = e.rowIndex;
             var s = ' <a class="Edit_Button" uid="'+uid+'" grid="grid_0" onclick="preview(this)" href="javascript:void(0)" >预览</a>'
                    + ' <a class="Delete_Button" href="javascript:remove(\'' + uid + '\')">删除</a>';
            return s;
        }
        
        function remove(row_uid) {
		    var row = nui.get("grid_0").getRowByUID(row_uid);  //获取所有选中的行对象
		    var data = {files:{fileId:row.fileId}};
		    var json = nui.encode(data);     //序列化成json字符串
        	if (confirm("确定删除选中记录？")) {
                nui.get("grid_0").loading("操作中，请稍后......");
                nui.ajax({
	                url: "com.primeton.eos.ame_common.file.deletefiles.biz.ext",
	                type: "post",
	                data: json, 
	                cache: false,
	                contentType: 'text/json',
	                success: function (text) {
	                	nui.get("grid_0").reload();
	                },
	                error: function () {
                    }
               });
            }
        }
      //附件下载
        function getdetail(e){
            	return "<a href='javascript:void(0)' onclick='checkDetail();' title='点击查看'>" + e.value + "</a>";
            }
        function checkDetail(){
        	var grid = nui.get("grid_0");
        	var selectRow = grid.getSelected();
        	var url="com.primeton.components.web.fileupload.getfile.flow?fileId="+selectRow.fileId;
			window.open(url, '_self');
        }
        function test(msg){ 		
        	nui.get("fileids").setValue(msg);
            SaveData();
    	}
    	function getFileSize(e){
			var value = e.value;
			var unit="KB";
			if(value>0){
				value = (value/1024).toFixed(3);
				if(value >=1024){
					value = (value/1024).toFixed(3);
					unit = "MB";
				}
			}
			return value+unit;
		}
	</script>
</body>
<script type="text/javascript" src="<%= request.getContextPath() %>/ame_common/js/layer-tab.js"></script>
</html>
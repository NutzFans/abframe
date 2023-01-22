<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@page import="com.eos.data.datacontext.UserObject"%>
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
<script src="<%= request.getContextPath() %>/common/nui/nui.js" type="text/javascript"></script>
	<style type="text/css">
	    body{
	        margin:0;padding:0;border:0;width:100%;height:100%;overflow:hidden;
	    }
    </style>
</head>
<body>
<div>
	<fieldset id="field2" style="border:solid 1px #aaa;padding:3px;">
<!-- 		<legend>添加附件</legend> -->
		<form id="form2" class="" action="com.primeton.eos.ame_common.ame_fileupload.flow" target="hidden_frame" method="post" enctype="multipart/form-data">
			<!--附件存放目录-->
			<input type="hidden" name="atFileupload/fileCatalog" id="fileCatalog" value=""/>
			<table id="filetable0" width="100%" style="border-collapse:collapse" bordercolor="#A8A8A8" border="1" cellspacing="0" cellpadding="1"  align="center">
				<tr><!-- 保持一致限制必须上传文件时，比如收入预估流程编辑页面要读取这个table的data.length -->
			      	<input type="button" value="增加附件" id="fileButton" onclick="addFile0()"/>
			      	<font style="color:#A8A8A8;">不允许上传exe,java,html,htm,class,jar文件类型</font>
			    </tr>
		  	</table>
	  </form>
    <iframe name='hidden_frame' id="hidden_frame" style='display:none'></iframe>
    </fieldset>
   </div>
	<script>
		var x = 0;
        function addFile0(){
            x++;
	        var myTable = document.getElementById('filetable0');
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
			var tempName=x;
			var tempID ="filex"+x;
			var tempID2='"'+tempID+'"';		
			//设置两个网格的html文本
			
			oCell1_1.innerHTML="附件";
			
			oCell1_2.innerHTML="<input type='file'  name='uploadfile' size='30' onchange='checkempty0(this.value," + tempID2 + ")';/>";
			
			oCell1_3.innerHTML="<font style='color:#FF0000;'>*</font>附件名称";
			
			var temp = '<input type="text" name="remarkList" disabled="true" id="'+tempID+'"  size="30" validateAttr="allowNull=false"  size="45"/>';
			oCell1_4.innerHTML= temp;		
			oCell1_5.innerHTML= "<input type='button' value='删除附件' onclick='delFile0(this);'/>";		
			return;
        }
            
            
         <!--//删除附件-->
		function delFile0(obj){
			var explorer=navigator.userAgent;
			if (explorer.indexOf("Trident")>0) {
			obj.parentElement.parentElement.removeNode(true);
			}else{
				obj.parentElement.parentElement.remove(true);
			}	
			return true;
		}
		
		function checkempty0(objvalue,flag){
		<%--alert("objvalue="+objvalue+" ,flag="+flag);--%>
			if(objvalue=="" ||objvalue==null){
				return false;
			}else{
				var textname=objvalue.split("\\");
				textname=textname[textname.length-1];
				textname=textname.split(".")[0];
				eval("document.getElementById('"+flag+"')").value = textname;
				eval("document.getElementById('"+flag+"')").disabled =false;
			}
		}
        function test(msg){ 		
        	nui.get("fileids").setValue(msg);
            SaveData();
    	}
	</script>
</body>
</html>
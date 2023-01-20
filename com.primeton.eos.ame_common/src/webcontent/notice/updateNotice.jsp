<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%
	String contextPath=request.getContextPath();
 %>
<html>
<!-- 
  - Author(s): wyy
-->
<head>
    <title>修改公告 </title>
    <meta http-equiv="content-type" content="text/html; charset=UTF-8" />
	<script src="<%= request.getContextPath() %>/common/nui/nui.js" type="text/javascript"></script>
    <script src="../common/nui/nui.js" type="text/javascript"></script>
	<link rel="stylesheet" href="<%=contextPath%>/common/nui/resource/kindeditor/themes/default/default.css" />
	<link rel="stylesheet" href="<%=contextPath%>/common/nui/resource/kindeditor/plugins/code/prettify.css" />
	<script charset="utf-8" src="<%=contextPath%>/common/nui/resource/kindeditor/kindeditor-all-min.js"></script>
	<script charset="utf-8" src="<%=contextPath%>/common/nui/resource/kindeditor/lang/zh-CN.js"></script>
	<script charset="utf-8" src="<%=contextPath%>/common/nui/resource/kindeditor/plugins/code/prettify.js"></script>
</head>
<body>
<div class="nui-fit" style="border:solid 1px #aaa;padding:0px;width:100%;">
		<div style="width:auto;height:380px;" id="form1">
        	<input name="ameNotice.noticeid" id="noticeid" class="nui-hidden"/>
        	<!-- 附件需要 v v v v v v v v v v v v v v v v v v v v v v v v v v v v v v v v v -->
			<input name="ameNotice.fileids" id="fileids"  class="nui-hidden"/>
			<!-- 附件需要 ^ ^ ^ ^ ^ ^ ^ ^ ^ ^ ^ ^ ^ ^ ^ ^ ^ ^ ^ ^ ^ ^ ^ ^ ^ ^ ^ ^ ^ ^ ^ ^ ^ -->
        	<table  style="width:100%">
                <tr>
                	<td align="right" width="60px">公告标题：</td>
					<td align="left" colspan="5"><input name="ameNotice.noticetitle" id="noticeTitle" class="nui-textbox" required="true" style="width:785px"/></td>
                </tr>
                <tr>
                	<td align="right" width="60px">发布部门：</td>
                	<td align="left"><input name="ameNotice.noticedept" id="noticedept" class="nui-combobox" required="true" url="com.bos.mp.common.SelectManage.queryAllOrg.biz.ext" textField="orgname" valueField="orgid" dataField = "orgs"
						    allowInput="true" style="width:170px;" /></td>
					<td align="right" width="95px">发布日期：</td>
                	<td align="left"><input name="ameNotice.noticedate" id="noticedate" class="nui-datepicker" style="width:110px"/></td>
					<td align="right" width="105px">发布状态：</td>
					<td align="left"><input name="ameNotice.noticestate" id="noticeState" class="nui-dictcombobox" required="true" dictTypeId="MIS_YN" style="width:50px"/></td>
                </tr>
               <tr>
					<td align="right" width="60px">公告内容：</td>
			   </tr>
			   <tr>
			   		<td colspan="6">
			   			<input name="ameNotice.noticecontent" id="noticecontent" class="nui-hidden"/>
			   			<textarea id="ke" name="content1" style="width:100%;height:280px;visibility:hidden;"></textarea>
			   		</td>
			   </tr>
            </table>
        </div>
        <!-- 附件需要 v v v v v v v v v v v v v v v v v v v v v v v v v v v v v v v v v -->
		<fieldset id="field1" style="border:solid 1px #aaa;width:97%;padding:3px;">
		<jsp:include page="/ame_common/inputFile.jsp"/>
		</fieldset>
		<!-- 附件需要 ^ ^ ^ ^ ^ ^ ^ ^ ^ ^ ^ ^ ^ ^ ^ ^ ^ ^ ^ ^ ^ ^ ^ ^ ^ ^ ^ ^ ^ ^ ^ ^ ^ -->
        <div style="text-align:center;padding:10px;">               
		    <a class="nui-button" onclick="onOk" style="width:60px;margin-right:20px;">确定</a>       
		    <a class="nui-button" onclick="onCancel" style="width:60px;">关闭</a>       
		</div> 
</div> 
</body>
<script type="text/javascript">
    nui.parse();
    var form = new nui.Form("form1");
    //-------------------------------------------------------------
    var editor1 = null;
	 KindEditor.ready(function(K) {
			editor1 = K.create('textarea[name="content1"]', {
			cssPath : '<%=contextPath%>/common/nui/resource/kindeditor/plugins/code/prettify.css',
			uploadJson : '<%=contextPath%>/common/nui/resource/kindeditor/jsp/upload_json.jsp',
			fileManagerJson : '<%=contextPath%>/common/nui/resource/kindeditor/jsp/file_manager_json.jsp',
			allowFileManager : true,
			afterCreate : function() {
				var self = this;
				K.ctrl(document, 13, function() {
					self.sync();
					document.forms['example'].submit();
				});
				K.ctrl(self.edit.doc, 13, function() {
					self.sync();
					document.forms['example'].submit();
				});
			}
		});
		prettyPrint();
	});
	
	function SetData(data){
    	data = nui.clone(data);
    	if(data.action == "edit"){
    		var json = nui.encode({ameNotice:data}); 
        	nui.ajax({
        		url: "com.primeton.eos.ame_common.ameNotice.queryNotice.biz.ext",
                data: json,
                type: 'POST',
                cache: false,
                contentType: 'text/json',
                success: function (o) {
                
                	<!-- 附件需要 v v v v v v v v v v v v v v v v v v v v v v v v v v v v v v v v v -->
                	//加载附件设置参数
             		nui.get("grid_0").load({"groupid":"ameNotice","relationid":o.ameNotice.noticeid});
                    <!-- 附件需要 ^ ^ ^ ^ ^ ^ ^ ^ ^ ^ ^ ^ ^ ^ ^ ^ ^ ^ ^ ^ ^ ^ ^ ^ ^ ^ ^ ^ ^ ^ ^ ^ ^ -->
                    form.setData(o);
                    editor1.html(o.ameNotice.noticecontent);
                    form.isChanged(false);		 
                },
                error: function (jqXHR, textStatus, errorThrown) {
                    alert(jqXHR.responseText);
                    CloseWindow();
                }
        	});
		}
    }
 	function onOk(){
 		var filePaths = document.getElementsByName("uploadfile").length;
        	for(var j=0;j<filePaths;j++){
        		var a=document.getElementsByName("remarkList")[j].value;
        		if(a==null||a==""){
        			alert("新增附件不可以为空");
        			return false;
        		}
        	}
    
        document.getElementById("fileCatalog").value="ame_notice";
        form2.submit();
 	}
 	
 	function SaveData(){
	 	var text = editor1.html();
        nui.get("noticecontent").setValue(text);
        form.validate();
        var data = form.getData();
        var json = nui.encode(data);
        if(form.isValid()){
        	nui.ajax({
                    url: "com.primeton.eos.ame_common.ameNotice.updateNotice.biz.ext",
					type: 'POST',
					data: json,	
					contentType: 'text/json',
                    success: function (o) {
                    	CloseWindow("saveSuccess");
                    	<%-- window.location.href="<%=request.getContextPath()%>/ame_common/notice/noticeList.jsp"; --%>
                    }
	         });
        }else{
        	return;
        }
	}
 	//标准方法接口定义
    function CloseWindow(action) {
        if (action == "close" && form.isChanged()) {
            if (confirm("数据被修改了，是否先保存？")) {
                return false;
            }
        }
        if (window.CloseOwnerWindow) return window.CloseOwnerWindow(action);
        else window.close();            
    }
 	function onCancel(e){
 		CloseWindow("cancel");
 	}
  
</script>
</html>

<%@page pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@include file="/common/common.jsp"%>
<%@include file="/common/skins/skin0/component.jsp" %>
<%
	String contextPath=request.getContextPath();
 %>
<html>
<!-- 
  - Author(s): wqq
  - Date: 2016-08-08 11:05:08
  - Description:
-->
<head>
    <title>规章制度</title>
	<meta http-equiv="content-type" content="text/html; charset=UTF-8" />
	<script src="<%= request.getContextPath() %>/common/nui/nui.js" type="text/javascript"></script>
    <script src="../common/nui/nui.js" type="text/javascript"></script>
	<link rel="stylesheet" href="<%=contextPath%>/common/nui/resource/kindeditor/themes/default/default.css" />
	<link rel="stylesheet" href="<%=contextPath%>/common/nui/resource/kindeditor/plugins/code/prettify.css" />
	<script charset="utf-8" src="<%=contextPath%>/common/nui/resource/kindeditor/kindeditor-all-min.js"></script>
	<script charset="utf-8" src="<%=contextPath%>/common/nui/resource/kindeditor/lang/zh-CN.js"></script>
	<script charset="utf-8" src="<%=contextPath%>/common/nui/resource/kindeditor/plugins/code/prettify.js"></script>
	<script type="text/javascript" src="<%=contextPath %>/common/components/swffileupload/swfupload/swffileupload.js"></script>
	<style type="text/css">
	    body{
	        margin:0;padding:0;border:0;width:100%;height:100%;overflow:hidden;
	    }
    </style>
</head>
<body>
<div class="nui-fit" style="border:solid 1px #aaa;padding:0px;width:auto">
	<div style="width:auto;padding-top:10px;padding-right:40px;padding-left:40px;padding-bottom:10px">
    	<input type="hidden" class="mini-hidden" id="regularid" name="ameRegular.regularid">
    	<table style="table-layout:fixed;" style="width:auto;">
            <tr>
            	<th  align="center" id="ameRegular.title" style="font-size:16px;" width="auto"></th>
            </tr>
            <tr>
            	<td  align="center" id="ameRegular.pubdate" width="auto"></td>
            </tr>
		   <tr id="isShowFile" style="display: ">
		   	<td align="left" width="auto">
		   		<div id="grid_0" class="nui-datagrid" style="width:100%;height:auto;" showPager="false" url="com.primeton.eos.ame_common.file.getFiles.biz.ext" dataField="files">
					<div property="columns">
						<div type="indexcolumn" headerAlign="center" width="40">编号</div>
						<div field="fileName"width="200" headerAlign="center" align="center" renderer="getdetail">附件名称</div>
						<div field="fileType" width="120" renderer="dictKbasetype" align="center" headerAlign="center">附件类型</div>
						<div field="operatorname" width="80" headerAlign="center" align="center">操作员名称</div>
						<div field="fileTime" width="120" headerAlign="center" align="center" dateFormat="yyyy-MM-dd HH:mm:ss">附件上传时间</div>
					</div>
				</div>
		   	</td>
		   </tr>
           <tr>
				<td id="content1" width="auto"></td>
		   </tr>
        </table>
    </div>
    <!--body-->
    <div style="text-align:center;padding:10px;">               
	    <a class="nui-button" onclick="onCancel" style="width:60px;">关闭</a>       
	</div>  
</div>
</body>
<script type="text/javascript">
    nui.parse();
    var editorId = "ke";
    var regularid = getUrlParam("id");
 	function getUrlParam(name) { 
		var reg = new RegExp("(^|&)" + name + "=([^&]*)(&|$)"); 
		var r = window.location.search.substr(1).match(reg); 
		if (r != null) 
		return unescape(r[2]); 
		return null; 
	 }
 	  SetData(regularid);
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
        var json = nui.encode({ameRegular:{regularid: data}});
    	nui.ajax({
    		url: "com.primeton.eos.ame_common.ameRegular.queryRegular.biz.ext",
            data: json,
            type: 'POST',
            cache: false,
            contentType: 'text/json',
            success: function (o) {
                obj = nui.decode(o);
                document.getElementById("ameRegular.title").innerHTML = o.ameRegular.title == null ? "" : o.ameRegular.title;
                var strInfo = o.ameRegular.orgname+"  "+o.ameRegular.pubdate.substr(0,10);
                document.getElementById("ameRegular.pubdate").innerHTML = o.ameRegular.pubdate == null ? "" : strInfo;
           		document.getElementById("content1").innerHTML = o.ameRegular.content == null ? "" : o.ameRegular.content;
		    	nui.get("grid_0").load({"groupid":"ameRegular","relationid":o.ameRegular.regularid},
		    		function (){
		    			if(nui.get("grid_0").data.length == 0){
		    				document.getElementById("isShowFile").style.display = "none";
		    			}
		    		}
		    	);
            },
            error: function (jqXHR, textStatus, errorThrown) {
                alert(jqXHR.responseText);
                CloseWindow();
            }
    	});
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
   
    function onCancel(e) {
        CloseWindow("cancel");
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
 
</script>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@page import="com.eos.data.datacontext.UserObject"%>
<%
	String contextPath=request.getContextPath();
 %>
 <%@page import="com.eos.foundation.eoscommon.BusinessDictUtil"%>
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
	<div style="width:100%;">
		        <div class="nui-toolbar" style="border-bottom:0;padding:0px;">
		            <table style="width:100%;">
		            	<tr>
		                    <td style="width:20%;" id="innerHtml">
		                    	相关附件
		                    </td>
		                </tr>
	                 </table>           
		        </div>
		    </div>
	<div id="grid_2" class="nui-datagrid" style="width:100%;height:auto;" showPager="false" sortMode="client" url="com.primeton.eos.ame_common.file.getFiles.biz.ext" dataField="files" allowCellEdit="true" allowCellSelect="true" multiSelect="true" editNextOnEnterKey="true">
		<div property="columns">
			<div type="indexcolumn" headerAlign="center" width="40" >编号</div>
			<div renderer="deleteContractFile2" width="80" headerAlign="center" align="center">操作</div>
			<div field="fileName"width="200" headerAlign="center" align="left" renderer="getdetail2">附件名称</div>
			<div field="fileType" width="120" renderer="dictKbasetype" align="center" headerAlign="center" >附件类型</div>
			<div field="operatorname" width="80"headerAlign="center" align="center">操作员名称</div>
			<div field="fileSize" width="50" headerAlign="center" align="center" renderer="getFileSize">文件大小</div>
			<div field="fileTime" width="120" headerAlign="center" align="center" dateFormat="yyyy-MM-dd HH:mm:ss" allowSort="true">附件上传时间</div>
		</div>
	</div>
	<script type="text/javascript" src="<%= request.getContextPath() %>/ame_common/layer/layer.js"></script>
	<script src="<%= request.getContextPath() %>/ame_common/layui/layui.all.js"></script>
	<script>
        <%String amepath = BusinessDictUtil.getDictName("AME_SYSCONF", "AMEPATH"); %>
    	var amepath ="<%=amepath %>";
    	var app = "<%= request.getContextPath() %>";
    	var isViewDelete = true;//判断是否要展示删除按钮
        //附件下载
        function getdetail2(e){
        	return "<a href='javascript:void(0)' onclick='checkDetail2();' title='点击查看'>" + e.value + "</a>";
        }
        
        function checkDetail2(){
        	var grid = nui.get("grid_2");
        	var selectRow = grid.getSelected();
        	var url="com.primeton.components.web.fileupload.getfile.flow?fileId="+selectRow.fileId;
			window.open(url,"_self");
        }
        
        function deleteContractFile2(e){
	        var record = e.record;
	        var uid = record._uid;
	        var groupId = record.groupId;
	        var s;
	        if(isViewDelete){
	        	s = ' <a class="Edit_Button" uid="'+uid+'" grid="grid_2" onclick="preview(this)" href="javascript:void(0)" >预览</a>'
                    + " <a href='javascript:void(0)' onclick='deleteFile2(" + uid + ")'>删除</a>";
            }else{
            	s = ' <a class="Edit_Button" uid="'+uid+'" grid="grid_2" onclick="preview(this)" href="javascript:void(0)" >预览</a>';
            }
            return s;
	    }
	    
	    function deleteFile2(uid){
		var grid = nui.get("grid_2");
    	var row = grid.getRowByUID(uid);  //获取所有选中的行对象
        var data = {files:row};
	    var json = nui.encode(data); 
    	if (confirm("确定删除此附件信息？")) {
            grid.loading("操作中，请稍后......");
            nui.ajax({
                url: "com.primeton.eos.ame_common.file.deletefiles.biz.ext",
                type: "post",
                data: json, 
                cache: false,
                contentType: 'text/json',
                success: function (text) {
                	grid.reload();
                },
                error: function () {
                }
           });
        }
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
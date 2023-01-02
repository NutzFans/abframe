<%@page pageEncoding="UTF-8"%>
<%@include file="/common/common.jsp"%>
<%@include file="/common/skins/skin0/component.jsp" %>
<html>
<!-- 
  - Author(s): yaoyi
  - Date: 2018-06-06 17:15:04
  - Description:
-->
<head>
	<title>流程节点审核检查点详情</title>
	<meta http-equiv="content-type" content="text/html; charset=UTF-8" />
	<script src="<%= request.getContextPath() %>/common/nui/nui.js" type="text/javascript"></script>
	<style type="text/css">
		html, body
	    {
	        font-size:12px;
	        padding:0;
	        margin:0;
	        border:0;
	        height:100%;
	        overflow:hidden;
	    }
	    .asLabel
	    {
	        border:0;background-color:#F5F5F5;cursor:default;    
	    }
    </style>
</head>
<body>
<div title="核查要点详情">
	<div class="nui-panel" title="基本信息" style="width: 100%;">
		<input name="checklistid" id="checklistid" class="nui-hidden" />
    	<table style="table-layout:fixed;" id="table_file1">
            <tr>
            	<td align="right" style="width:120px;font-size: 13px;" > 审核要点序号：</td>
				<td id="checklistseq" class="asLabel" style="width:100px;font-size: 13px;"></td>
				<td align="right" style="font-size: 13px;width:150px;"> 层级：</td>
				<td id="level" class="asLabel" style="font-size: 13px;width:150px;"></td>
				<td align="right" style="font-size: 13px; width:150px;">排序：</td>
				<td id="sortno" class="asLabel" style="font-size: 13px;width:150px;"></td>
			</tr>
			<tr>
				<td align="right"  style="font-size: 13px;">审核要点描述：</td>
				<td id="checklistname" class="asLabel" style="font-size: 13px;" colspan="3"></td>
				<td align="right" style="font-size: 13px;"> 是否可以审核：</td>
				<td id="iscancheck" class="asLabel" style="font-size: 13px;"></td>
				
			</tr>
    	</table>
    </div>
</div>
<!--核查要点与配置关联关系 -->
<fieldset style="border:solid 1px #aaa;padding:3px;width: 99%;">
    <legend>核查要点与配置关联关系</legend>
	<div id="datagrid1" class="nui-datagrid" style="width: 100%;height:400px;" allowResize="true" 
		allowCellSelect="true" showPager="false" >
		<div property="columns">
			<div field="processdefname" width="140" headerAlign="center" visible="false">流程定义名称</div>
			<div field="processchname" width="140" headerAlign="center">流程定义名称</div>
			<div field="activitydefid" width="70" align="center" headerAlign="center" visible="false">活动定义ID</div>
			<div field="activityinstname" width="70" align="center" headerAlign="center">环节名称</div>
			<div field="busicode" width="30" align="center" headerAlign="center">业务参数项</div>
			<div field="busicodedesc" width="200" align="left" headerAlign="left">业务参数项说明</div>
		</div>
	</div>
</fieldset>
</body>
<script type="text/javascript">
	nui.parse();
	var grid = nui.get("datagrid1");
	var checklistid = <%=request.getParameter("checklistid") %>;
	if(checklistid==null||checklistid==''){
		
	}else{
		init();
	}
	
	function init(){
		var json = nui.encode({"checklistid":checklistid});
		nui.ajax({
        	url: "com.primeton.eos.ame_common.csIncomecheck.getIncomecheckDetail.biz.ext",
        	data: json,
        	type: 'POST',
        	cache: false,
        	contentType: 'text/json',
        	success: function (text) {					 
				var checklist = text.checklist;
				var checkAct = text.checkAct;
				document.getElementById("checklistseq").innerHTML = checklist.checklistseq == null ?"":checklist.checklistseq;
				document.getElementById("checklistname").innerHTML = checklist.checklistname == null ?"":checklist.checklistname;
				document.getElementById("sortno").innerHTML = checklist.sortno == null ?"":checklist.sortno;
				document.getElementById("level").innerHTML = checklist.level == null ?"":checklist.level;
				document.getElementById("iscancheck").innerHTML = nui.getDictText('MIS_YN',checklist.iscancheck);
				grid.setData(checkAct);
				
        	},
        	error: function (jqXHR, textStatus, errorThrown) {
				CloseWindow();
            }
        });
	}
</script>
</html>
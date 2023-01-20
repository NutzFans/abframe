<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@include file="/common/common.jsp"%>
<%@ page import="com.eos.data.datacontext.UserObject"%>
<html>
<!-- 
  - Author(s): mengyy
  - Date: 2017-08-21 17:51:37
  - Description:
-->
<head>
<title>审批意见查询</title>
	<meta http-equiv="content-type" content="text/html; charset=UTF-8" />
	<script src="<%= request.getContextPath() %>/common/nui/nui.js" type="text/javascript"></script>
	<style type="text/css">
	    body{
	        margin:0;padding:0;border:0;width:100%;height:100%;
	    }
    </style>
</head>
<body>
<div class="nui-fix">
	<div class="nui-panel" title="审批意见查询" style="width:100%;">
        <div style="width:100%;height:100%;padding:0px;margin:0px;" id="form1">
        	<div class="nui-toolbar" style="border-bottom:0;padding:0px;">
	            <table align="center" border="0" width="100%" class="form_table">
			        <tr>
			        	<td class="form_label" align="right">处理意见</td>
			            <td colspan="1">
				            <input name="criteria._expr[1]._value" class="nui-textbox" style="width:150px;" onenter="onKeyEnter"/>
						    <input class="nui-hidden" name="criteria._expr[1]._property" value="auditopinion"/>
						    <input class="nui-hidden" name="criteria._expr[1]._op" value="like"/>
						    <input class="nui-hidden" name="criteria._expr[1]._likeRule" value="all"/>
			            </td>
		        		<td class = "form_label" align="right">流程发起人</td>
					    <td colspan="1">
							<input name="criteria._expr[3]._value" class="nui-textbox" style="width:150px;" onenter="onKeyEnter"/>
						    <input class="nui-hidden" name="criteria._expr[3]._property" value="empname"/>
						    <input class="nui-hidden" name="criteria._expr[3]._op" value="like"/>
						    <input class="nui-hidden" name="criteria._expr[3]._likeRule" value="all"/>
						</td>
				        <td class="form_label" align="right">业务目录</td>
				        <td colspan="1" align="left">
				            <input id="catalogName" class="nui-combobox" valueField="catalogId" textField="catalogName"  name="criteria._expr[0]._value" showNullItem="true" style="width:150px;" onenter="onKeyEnter"/>
						    <input class="nui-hidden" name="criteria._expr[0]._property" value="catalogname"/>
						    <input class="nui-hidden" name="criteria._expr[0]._op" value="="/>
				        </td>
			            <td class="form_label" align="right">流程实例名称</td>
			            <td colspan="1">
		          			<input name="criteria._expr[2]._value" class="nui-textbox" style="width:200px;" onenter="onKeyEnter"/>
						    <input class="nui-hidden" name="criteria._expr[2]._property" value="processinstname"/>
						    <input class="nui-hidden" name="criteria._expr[2]._op" value="like"/>
						    <input class="nui-hidden" name="criteria._expr[2]._likeRule" value="all"/>
			            </td>
			        </tr>
			        <tr>
			        	<td class="form_label" align="right">审批人</td>
			            <td colspan="1">
			                <input class="nui-textbox" name="criteria._expr[4]._value" style="width:150px;"/>
			           		<input class="nui-hidden" name="criteria._expr[4]._property" value="operatorname"/>
			                <input class="nui-hidden" name="criteria._expr[4]._op" value="like" />
					    	<input class="nui-hidden" name="criteria._expr[4]._likeRule" value="all"/> 
			        	</td>
			            <td class="form_label" align="right">环节名称</td>
			            <td colspan="1">
			          		<input class="nui-textbox" name="criteria._expr[5]._value" style="width:150px;"/>
			           		<input class="nui-hidden" name="criteria._expr[5]._property" value="workitemname"/>
			                <input class="nui-hidden" name="criteria._expr[5]._op" value="like" />
					    	<input class="nui-hidden" name="criteria._expr[5]._likeRule" value="all"/> 
			            </td>
			          <td class="form_label" align="right">处理结果</td>
			          <td colspan="1">
						<input name="criteria._expr[6]._value" class="nui-dictcombobox" dictTypeId="MIS_AUDITSTATUS" style="width:150px;" showNullItem="true" multiSelect="true" />
					    <input class="nui-hidden" name="criteria._expr[6]._property" value="auditstatus"/>
					    <input class="nui-hidden" name="criteria._expr[6]._op" value="in"/>
			          </td>
			          <td class = "form_label" align="right">处理日期</td>
				      <td colspan="1">
						 <input class="nui-datepicker" name="criteria._expr[7]._min" style="width:98px"/>-<input class="nui-datepicker" name="criteria._expr[7]._max" style="width:98px"/>
						 <input class="nui-hidden" name="criteria._expr[7]._property" value="time"/>
						 <input class="nui-hidden" name="criteria._expr[7]._op" value="between"/>
						 <input class="nui-hidden" name="criteria._expr[7]._pattern" value="yyyy-MM-dd"/>
					  </td>
				  </tr>
  				</table>
      			<table style="width:100%;" id = "toolbars1">
			    	<tr>
			            <td style="width:20%;" align="center">
				            <a class="nui-button" id="search" iconCls="icon-search" onclick="search()">查询</a>
				            <a class="nui-button" id="reset" iconCls="icon-reload" onclick="reset()">重置</a>
				        </td>
			        </tr>
		        </table>           
			</div>
		</div>
    	<div style="width:100%;" >
    		<div class="nui-toolbar" id="toolbars" style="border-bottom:0;padding:0px;">
	            <table style="width:100%;">
	            	<tr>
	                    <td style="width:20%;">
				            <a class="nui-button" id="updateRecord" iconCls="icon-edit" onclick="updateRecord()">修改</a>
				        </td>
	                </tr>
	            </table>           
	        </div>
            <div id="datagrid1" sizeList="[10,20,50,100,500]" showPager="true" dataField="misOpinions"  allowCellWrap="true"
            	class="nui-datagrid" style="width:100%;height:400px;" url="com.primeton.eos.ame_common.misOpinions.queryMisOpinions.biz.ext" 
            	multiSelect="true" allowSortColumn=true>
                <div property="columns">
                	<div type="checkcolumn"></div>
                	<div field="empname" width="60" headerAlign="center" align="center">发起人</div>
                	<div field="catalogname" width="60" headerAlign="center" align="center">业务目录</div>
                	<div field="processchname" width="100" headerAlign="center" align="center">流程定义名称</div>
                	<div field="processinstname" width="200" align="left" headerAlign="center" renderer="onGender2Renderer">流程实例名称</div>
			        <div field="operatorname" width="60" headerAlign="center" align="center">处理人</div>
			         <div field="orgname" width="100" align="center" headerAlign="center">处理人所在机构</div>
			        <div field="workitemname" width="100" align="center" headerAlign="center">处理环节</div>
			        <div field="auditstatus" renderer="onCheckRenderer" width="80" align="center" headerAlign="center">处理结果</div>
			        <div field="auditopinion" width="150" headerAlign="center">处理意见</div>
			        <div field="time" width="120" headerAlign="center" align="center" dateFormat="yyyy-MM-dd HH:mm:ss">处理时间</div>
			        <div field="files" renderer="onFileRenderer" width="100" hight="100"  align="center" headerAlign="center">附件</div>
                </div>
            </div>
		</div>
	</div>
</div>
<form name="viewlist1" id="viewlist1" action="com.primeton.eos.ame_common.ameExportCommon.flow" method="post">
		<input type="hidden" name="_eosFlowAction" value="action0" filter="false"/>
		<input type="hidden" name="downloadFile" filter="false"/>
		<input type="hidden" name="fileName" filter="false"/>
</form>
<script type="text/javascript">
		nui.parse();
		var grid = nui.get("datagrid1");
		var form = new nui.Form("#form1");
		init();
		function init(){
			//org.gocom.bps.wfclient.task.business.task.getCatalogName
			var json = nui.encode({});
            nui.ajax({
                url: "org.gocom.bps.wfclient.task.business.task.getCatalogName.biz.ext",
                data: json,
                type: 'POST',
                cache: false,
                contentType: 'text/json',
                success: function (text) {
                	text = nui.clone(text);
                	var isntsdata = [];
    				for(var i = 0;i < text.wfProcessInsts.length;i ++){
    					isntsdata[i] = {"catalogId": text.wfProcessInsts[i].catalogName,"catalogName": text.wfProcessInsts[i].catalogName};
    				}
    				nui.get("catalogName").setData(isntsdata);
                },
                error: function (jqXHR, textStatus, errorThrown) {
                    alert(jqXHR.responseText);
                    CloseWindow();
                }
            });
			search();
		}
		
		function updateRecord(){
			var rows = grid.getSelecteds();
        	if (rows.length > 1) {
        		alert("只能选中一条记录进行编辑");
        	}else{
	            var row = grid.getSelected();
	            if (row) {
	                nui.open({
	                    url: "<%=request.getContextPath() %>/ame_common/misOpinion/updateMisOpinion.jsp",
	                    title: "编辑审批意见", width: 400, height: 200,
	                    onload: function () {
					        var iframe = this.getIFrameEl();
					        iframe.contentWindow.setData(row);
					    },
	                    ondestroy: function (action) {
	                    	if(action == "ok"){
		                        grid.reload();
	                    	}
	                    }
	                });
	                
	            } else {
	                alert("请选中一条记录");
	            }
            }
		}
		
		function onCheckRenderer(e) {
			return nui.getDictText('MIS_AUDITSTATUS',e.value);//设置业务字典值
		}
		
		
		function reset(){
			var form = new nui.Form("#form1");
			form.reset();
			init();
		}
		
		function onOk(){
			search();
		}
		
		//回车触发
		function onKeyEnter(){
			search();
		}
		
		function search(){
			var form = new nui.Form("#form1");
			var data = form.getData();
		  	grid.load(data);
			grid.sortBy("time","desc");
		}
		
	    function onFileRenderer(e) {
        	var tempSrc = "";
        	for(var i=0;i<e.record.files.length;i++){
        		tempSrc += "<a href='com.primeton.components.web.fileupload.getfile.flow?fileId=" + e.record.files[i].fileId + "'>" + e.record.files[i].fileName + "</a>,&nbsp;&nbsp;&nbsp;&nbsp;";
        	}
       		return tempSrc;
    	}
    	
    	function onGender2Renderer(e){
			return "<a  href='javascript:void(0)' onclick='feeView();' title='查看流程'>" + e.value + "</a>";
		}
		
		function feeView(){
	        var selectRow = grid.getSelected();
	        var processInstID=selectRow.processinstid;
			var url = "<%=request.getContextPath() %>/bps/wfclient/task/processinstView.jsp";
			var title = "流程图查看";
			var width=1000;
		    nui.open({
				url: url,
				title: title,
				width: width,
				height: 550,
				onload: function () {
					var iframe = this.getIFrameEl();
					if(iframe.contentWindow.initData) {
						iframe.contentWindow.initData({"processInstID": processInstID});
					}
				},
				ondestroy: function (action){
				}
			});
	    }
</script>
</body>
</html>
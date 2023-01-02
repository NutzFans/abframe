<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@page import="com.eos.data.datacontext.UserObject"%>
<%
	String contextPath=request.getContextPath();
 %>
<html>
<!-- 
  - Author(s): wlq
  - Date: 2016-06-02 18:18:37
  - Description:
-->
<head>
	<title>审核意见</title>
	<meta http-equiv="content-type" content="text/html; charset=UTF-8" />
	<script src="<%= request.getContextPath() %>/common/nui/nui.js" type="text/javascript"></script>
	<style type="text/css">
	    body{
	        margin:0;padding:0;border:0;width:100%;height:100%;overflow:hidden;
	    }
    </style>
</head>
<body>
	<form id="opioionform" method="post">
<!-- 	    <input name="misOpinion.auditopinion" value="修改合同审批信息" class="nui-hidden" /> -->
	    <input name="misOpinion.processinstid" id="processinstid" class="nui-hidden" />
	    <input name="misOpinion.processinstname" id="processinstname" class="nui-hidden" />
	    <input name="misOpinion.activitydefid" id="activitydefid" class="nui-hidden" />
	    <input name="misOpinion.workitemid" id="workitemid" class="nui-hidden" />
	    <input name="misOpinion.workitemname" id="workitemname" class="nui-hidden" />
	    <input name="misOpinion.isshow" id="isshow" class="nui-hidden" />
		<input name="misOpinion.fileids" id="fileids"  class="nui-hidden"/>
		<fieldset style="border:solid 1px #aaa;padding:3px;">
	        <legend>处理意见列表</legend>
	        	<div id="datagrid1" class="nui-datagrid" style="width:100%;height:auto;" dataField="misOpinions"
				    url="com.primeton.eos.ame_pur.purContractProcess.queryAuditOpinions.biz.ext"  idField="id" allowResize="true"
				    allowAlternating="true" multiSelect="true" showPager="false" allowCellWrap="true">
				    <div property="columns">
				    	<div type="indexcolumn" headerAlign="center" width="30" >编号</div>
				        <div field="operatorname" width="50" headerAlign="center" align="center">处理人</div>
				        <div field="workitemname" width="80" align="center" headerAlign="center">处理环节</div>
				        <div field="auditstatus" renderer="onCheckRenderer" width="80" align="center" headerAlign="center">处理结果</div>
				        <div field="auditopinion" width="150" headerAlign="center">处理意见</div>
				        <div field="time" width="100" headerAlign="center" align="center" dateFormat="yyyy-MM-dd HH:mm:ss">处理时间</div>
				        <div field="orgname" width="100" align="center" headerAlign="center">处理人所在机构</div>
				        <!-- <div field="files" renderer="onFileRenderer" width="100" hight="100"  align="center" headerAlign="center">附件</div> -->
				    </div>
				</div>
	        <div style="padding:5px;" id="opinionHide">
	            <table style="table-layout:fixed;">
	            	<tr id="salesEdit">
	                    <td style="width:150px;" align="right">审核结果：</td>
	                    <td style="width:250px;">  
							<input name="misOpinion.auditstatus" id="auditstatus" class="mini-dictradiogroup" value="1" style="width:250px;" required="true" dictTypeId="MIS_AUDITSTATUS"  onvaluechanged="show()" />
	                    </td>
	                    <td style="width:366px;display: none" align="right" colspan="2">  
	                    	<a class="nui-button" onclick="doSHZT" style="width:100px;margin-right:20px;">悬挂意见保存</a>
	                    </td>
	                </tr>
	                <tr id="choosehide">
	                    <td  style="width:150px;" align="right">回退到：</td> 
	                    <td style="width:250px;" colspan="3">
	                    	<input name="misOpinion.backTo" id="backTo" class="nui-combobox" valueField="id" textField="name" style="width:200px" required="true" />
	                    	<input name="misOpinion.isNode" id="isNode" class="nui-checkbox"/><span>驳回的节点通过后直接返回本节点</span>
	                    </td>
	                </tr>
	                <tr id="auditop">
	                    <td style="width:150px;height:auto;" align="right" id="auditopinion1">处理意见：</td>
	                    <td colspan="3">
	                        <input name="misOpinion.auditopinion" id="auditopinion" class="nui-textarea" required="false" style="width:600px;height: 40px;"/>
	                    </td>
	                </tr>
	            </table>
	        </div>
	    </fieldset>
    </form>
    <script type="text/javascript">
	    document.getElementById("auditopinion").value="同意。";
	    document.getElementById("choosehide").style.display="none";
	    function onCheckRenderer(e) {
			return nui.getDictText('MIS_AUDITSTATUS',e.value);//设置业务字典值
		}
		
		function initMisOpinion(data){
			//初始化处理意见
			var dataStatus=[{"dictID": 1,"dictName": "通过"},{"dictID": 0,"dictName": "退回"},{"dictID": 2,"dictName": "终止流程"}];
			nui.get("auditstatus").setData(dataStatus);
			nui.get("auditstatus").setValue(data.auditstatus);
		}
	    //审核结果触发
	    function show(){
			var auditopinion = nui.get("auditopinion").getValue().trim();
			var auditstatus = nui.get("auditstatus").getValue();
			if(auditstatus=='0'){
				if(auditopinion=="同意。"){
					nui.get("auditopinion").setValue("");
				}
				chooselink();
			}else if(auditstatus=='1'){
				if(auditopinion==""){
					nui.get("auditopinion").setValue("同意。");
				}
				showNone();
			}else if (auditstatus=='4'){
				showNone();
			}else if(auditstatus=='2'){
				if(auditopinion=="同意。"){
					nui.get("auditopinion").setValue("");
				}
				showNone();
			}
		}
		function showNone(){
			nui.get("backTo").setValue("");
			nui.get("isNode").setValue("");
			document.getElementById("choosehide").style.display="none";
		}
		function chooselink(){
			document.getElementById("choosehide").style.display="";
		}
		
		//合同处理意见附件信息
	     function onFileRenderer(e) {
	        var tempSrc = "";
        	//长度为1，不换行
        	if(e.record.files.length == 1){
	        	tempSrc += "<a href='com.primeton.components.web.fileupload.getfile.flow?fileId=" + e.record.files[0].fileId + "'>" + e.record.files[0].fileName + "</a>";
        	}else{
		        for(var i=0;i<e.record.files.length;i++){
		        	//长度大于1小于长度length换行
		        	if(i< e.record.files.length-1){
		        		tempSrc += "<a href='com.primeton.components.web.fileupload.getfile.flow?fileId=" + e.record.files[i].fileId + "'>" + e.record.files[i].fileName + "</a><br/>&nbsp;&nbsp;";
		        	}
		        	//最后一个不换行
	        		if(i == e.record.files.length-1){
		        		tempSrc += "<a href='com.primeton.components.web.fileupload.getfile.flow?fileId=" + e.record.files[i].fileId + "'>" + e.record.files[i].fileName + "</a>";
		        	}
		        }
        	}
	       	return tempSrc;
	     }
	     var opioionform = new nui.Form("opioionform");
    	function doSHZT(){
    		if(nui.get("auditopinion").getValue().trim() == ""){
    			nui.alert("悬挂时审核意见不可以为空");
        		return false;
    		}else{
    			if (!confirm("是否保存悬挂时的审核意见？")) {
                    return false;
                }else{
		    		debugger;
		    		var data = opioionform.getData();
		    		data.misOpinion.auditstatus = "5";
		    		var json = nui.encode(data);
		    		nui.ajax({
		    			url:"com.primeton.eos.ame_common.mail.saveMisopinion.biz.ext",
		    			data:json,
		    			type:"post",
		    			contentType:"text/json",
		    			success:function(action){
		    				if(action.exception == null){
					        	nui.alert("提交成功",null,function(){
						        	nui.get("datagrid1").reload();
					        	});
		    				}else{
		    					nui.alert("提交失败，请联系信息技术部人员！","系统提示", function(action){
		    					});
		    				}
		    			},
		    			error:function(jqXHR, textStatus, errorThrown){
		    				nui.alert("error:" + jqXHR.responseText);
		    			}
		    		});
		    	}
    		}
    	}
    </script>
</body>
</html>
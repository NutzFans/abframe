<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@page import="com.eos.data.datacontext.UserObject"%>
<%@page import="commonj.sdo.DataObject"%>
<%@page import="java.util.Map"%>
<%
	String contextPath=request.getContextPath();
 %>
<html>
<!-- 
  - Author(s): xuqingqian
  - Date: 2016-10-18 15:01:58
  - Description:
-->
<head>
    <title>用章申请流程</title>
    <meta http-equiv="content-type" content="text/html; charset=UTF-8" />
	<script src="<%= request.getContextPath() %>/common/nui/nui.js"
		type="text/javascript"></script>
	<script src="../common/nui/nui.js" type="text/javascript"></script>
	<style type="text/css">
	    body{
	        margin:0;padding:0;border:0;width:100%;height:100%;overflow:hidden;
	    }
	    html, body
	    {
	        font-size:12px;
	        padding:0;
	        margin:0;
	        border:0;
	        height:100%;
	        overflow:hidden;
	    }
	     .myIndex{
	        background:#FFF68F;
	    }
	</style>
</head>
<body>
<div class="nui-fit">
    <div class="mini-panel" title="用章申请流程" style="width: auto">
        <!-- 提示信息展示 -->
		<jsp:include page="/ame_common/ameFlowOperTips/ameFlowOperTipsInfo.jsp"/>
		<form id="form1" method="post">
			<input name="seal.fileids" id="fileids" class="nui-hidden"/>
			<input name="seal.sealname" id="sealname" class="nui-hidden"/>
			<input name="seal.applyno" id="applyno" class="nui-hidden"/>
		     <fieldset id="field1" style="border:solid 1px #aaa;padding:3px;">
		       <legend>基本信息</legend>
		       		<table style="table-layout:fixed;">
						<tr>
							<td align="right" style="width:120px;">用章类型：</td>
							<td>
								<input name="seal.sealtype" id="sealtype" class="nui-combobox" style="width:150px" multiSelect="true" allowInput="false" required="true" onvaluechanged="getSealname"
									textField="sealname" valueField="confid" url="com.primeton.eos.ame_common.SealConfigure.querySealname.biz.ext" dataField="sealConfigures"/>
							</td>
							<td align="right" style="width:120px;">用章日期：</td>
							<td>
								<input name="seal.sealdate" class="nui-datepicker" id="sealdate" required="true" style="width:150px" onvaluechanged="checkDate" />
							</td>
							<td align="right" style="width:120px;">受益部门：</td>
							<td>
								<input name="seal.orgid" id="orgid" class="nui-combobox" url="com.primeton.rdmgr.labor.labormgr.getAllOrgs.biz.ext" 
							filterType="like" textField="orgname" valueField="orgid" dataField="allorgs" valueFromSelect="true" allowInput="true" style="width:150px;" required="true">
							</td>
						</tr>
						<tr>
							<td align="right" style="width:120px;">用章地点：</td>
							<td>
								<input name="seal.sealaddress" class="nui-dictcombobox" dictTypeId="AREA4SEAL" style="width:150px" required="true"/>
							</td>
							<td align="right" style="width:120px;">文件接收单位：</td>
							<td colspan="3">
								<input name="seal.misCustinfo.custid" id="custid" onbuttonclick="selectCustmer" class="nui-buttonedit" style="width:100%" allowInput="false" />
							</td>
						</tr>
						<tr>
							<td align="right" style="width:120px;">文件类型：</td>
							<td>
								<input name="seal.filetype" id="filetype" class="nui-dictcombobox" multiSelect="true" shownullItem="true" dictTypeId="MIS_FILETYPE" required="true" style="width:150px" onvaluechanged="checkFiletype">
							</td>
							<td align="right" style="width:120px;">文件份数：</td>
							<td>
								<input name="seal.filenum" id="filenum" class="nui-spinner" format="n0" allowLimitValue="false" changeOnMousewheel="false" showbutton="false" inputStyle="text-align: right" style="width:150px;"/>
							</td>
							<td align="right">金额(单位：元)：</td>
			                <td>    
			                    <input name="seal.money" id="money" class="nui-spinner" format="n2" allowLimitValue="false" changeOnMousewheel="false" showbutton="false" inputStyle="text-align: right" style="width:150px;"/>
			                </td>
						</tr>
						<tr>
							<td align="right" style="width:120px;">用章主体：</td>
							<td>
								<input name="seal.subject" id="subject" class="nui-dictcombobox" dictTypeId="company" style="width:150px" />
							</td>
						</tr>
						<tr>
							<td align="right" style="width:120px;">用章事由：</td>
							<td colspan="5">
								<input name="seal.memo" id="memo" class="nui-textarea" style="width: 100%;height: 140px;" maxLength="500" required="true"/>
							</td>
						</tr>
					</table>
		     </fieldset>
		</form>
		 <fieldset id="field2" style="border:solid 1px #aaa;padding:3px;">
			<legend>用章申请附件</legend>
			<jsp:include page="/ame_common/addFiles.jsp"/>
			<div style="color: red;font-size: 14px;">请保持上传文件小于10M，大于10M的文件请直接联系商务部</div>
		</fieldset>
		<form id="opioionform" method="post">
	        <div style="padding: 5px;" id="opinionHide">
	            <table style="table-layout: fixed;">
	            	<tr id="salesEdit">
	                    <td style="width: 150px;" align="right">审核结果：</td>
	                    <td style="width: 250px;">
							<input name="misOpinion.auditstatus" id="auditstatus" class="nui-dictradiogroup" style="width: 250px;" 
								required="false" dictTypeId="MIS_AUDITSTATUS" onvaluechanged="show()" value="1" />
	                    </td>
	                </tr>
	                <tr>
	                    <td style="width: 150px;height: auto;" align="right">任务处理说明：</td>
	                    <td colspan="3">
	                        <input name="misOpinion.auditopinion" id="auditopinion" class="nui-textarea" 
	                        	style="width: 600px;height: 40px;"/>
	                    </td>
	                </tr>
	            </table>
	        </div>
    	</form>
    </div>
</div>
<div style="text-align:center;padding:10px;" class="nui-toolbar">
	<a class="nui-checkbox" style="width:100px;padding-left: 10px;float: left;" id="guanZhuButton">关注流程</a>
   <a class="nui-button" onclick="onOk('1')" iconCls="icon-upload" style="width:140px;margin-right:20px;" id="appButton">发起用章申请流程</a>
</div>
<form name="viewlist1" id="viewlist1" action="com.primeton.eos.ame_common.ameExportCommon.flow" method="post">
   <input type="hidden" name="_eosFlowAction" value="action0" filter="false"/>
   <input type="hidden" name="downloadFile" filter="false"/>
   <input type="hidden" name="fileName" filter="false"/>
</form> 
	<script type="text/javascript">
	
		nui.parse();
		
		var form = new nui.Form("form1");
		var opioionform = new nui.Form("opioionform");
		nui.get("auditstatus").setValue(3);
		nui.get("subject").setValue("1");
		document.getElementById("salesEdit").style.display="none";
		document.getElementById("opioionform").style.display="none";
		promptInit({"workItemID": 0,"processDefName": "com.primeton.mis.contract.sealApproval","activityDefID": "manualActivity3"});
	  	<%
	   		UserObject user = (UserObject) session.getAttribute("userObject");
	   		String username = user.getUserName();
	   		String userno = user.getUserId();
	   		String userOrgName = user.getUserOrgName();
	   		String userOrgId = user.getUserOrgId();
	    %>
	    nui.get("applyno").setValue('<%=userno %>');
	    nui.get("orgid").setValue('<%=userOrgId %>');
	    nui.get("orgid").setText('<%=userOrgName %>');
	    nui.get("filenum").setValue(null);
	    nui.get("money").setValue(null);
       
		//发起流程
		function SaveData(){
			var data = form.getData();
			var data_opioion = opioionform.getData();
			var seal = data.seal;
			seal.guanzhu = nui.get("guanZhuButton").getValue();
			var json = nui.encode({"seal":seal,"misOpinion": data_opioion.misOpinion});
			 nui.ajax({
                url: "com.primeton.eos.ame_common.seal.createSeal.biz.ext",
                data: json,
                type: 'POST',
                cache: false,
                contentType: 'text/json',
                success: function (text) {
                   	var returnJson = nui.decode(text);
	              	if(returnJson.result == "success"){
	              		form.unmask();
	                   	nui.alert("发起流程成功！","系统提示",function (){
	                   		window.location="<%=request.getContextPath() %>/bps/wfclient/task/taskList.jsp?taskType=finishedSelf";
	                   	});
	              	}else{
                   		form.unmask();
						nui.get("appButton").enable();
	                   	nui.alert("发起流程失败！");
	              	}
                },
                error: function (jqXHR, textStatus, errorThrown) {
                    alert(jqXHR.responseText);
                }
            });
		}
		
		
		function onOk(e){
			if(!form.validate()){
    			nui.alert("表单信息填写不完整，请确认必输项是否填写!");
    			return;
    		}
    		var tb = document.getElementById("filetable0"); 
			var rows = tb.rows;
		 	if(rows.length<2||rows.length == null){
		 		nui.alert("请至少添加一个附件后在进行提交!");
    			return;
		 	}
        	nui.confirm("是否确定发起用章申请流程?","操作提示",function(o){
	    		if("ok" == o){
	    			nui.get("appButton").disable();
	    			document.getElementById("fileCatalog").value="seal";
		        	form2.submit();
	    		}else{
	    			
	    		}
	    	});
	    }
	    
	    //获取用章类型
	    function getSealname(){
	    	var sealname = nui.get("sealtype").getText();
	    	nui.get("sealname").setValue(sealname);
	    }
	    
	    //根据文件类型判断条件
	    function checkFiletype(){
        	var filetype = nui.get("filetype").getValue();
        	if(filetype.match("3")){//当文件类型包含报价时，金额必须填写
        		nui.get("money").setRequired(true);
        	}else{
        		nui.get("money").setRequired(false);
        		//nui.get("memo").setRequired(false);
        	}
        }
        
		//选择用章单弹窗
		function selectCustmer(){
			var btnEdit = this;
			nui.open({
				url:"<%=request.getContextPath() %>/contract/contract/MisCustinfo_lookup.jsp",
			    title: "选择用章单位",
			    width: 650,
			    height: 380,
			    ondestroy: function (action) {
			        if (action == "ok") {
			            var iframe = this.getIFrameEl();
			            var data = iframe.contentWindow.GetData();
			            data = nui.clone(data);    //必须
			            if (data) {
			                btnEdit.setValue(data.id);
			                btnEdit.setText(data.text);
			            }
			        }
			    }
		    });
		}
    
        function onCancel(e) {
            var data = form.getData();
        	if(data){
	        	nui.showMessageBox({
		            title: "关闭提示",
		            iconCls: "nui-messagebox-question",
		            buttons: ["yes", "no"],
		            message: "是否关闭？",
		            callback: function (action) {
		                if(action=="yes"){
		                	CloseWindow("cancel");
		                }
		            }
		        });
			}else{
				CloseWindow("cancel");
			}
        }
        function checkDate(e){
       		 var sealdate = nui.get("sealdate").getValue();
       		 var json={sealdate:sealdate}
		        nui.ajax({
		                url: "com.primeton.eos.common.misisworkdaybiz.isOrNotWorkdays.biz.ext",
		                data: json,
		                type: 'POST',
		                cache: false,
		                contentType: 'text/json',
		                success: function (text) {
		                   	var returnJson = nui.decode(text);
			              	if(returnJson.out1 =="false"){
			              	nui.alert("您所选择的时间为非工作日，请重新选择工作日为用章日期!")
			              	 nui.get("sealdate").setValue("");
			              	return;
			              	}
		                },
		                error: function (jqXHR, textStatus, errorThrown) {
		                    alert(jqXHR.responseText);
		                }
		            });
		        
        
        }
       
	</script>
</body>
</html>
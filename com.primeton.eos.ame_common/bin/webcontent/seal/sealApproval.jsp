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
    <div class="mini-panel" title="用章审核人审批" style="width: auto">
        <!-- 提示信息展示 -->
		<jsp:include page="/ame_common/ameFlowOperTips/ameFlowOperTipsInfo.jsp"/>
		<form id="form1" method="post">
			<input name="seal.fileids" id="fileids" class="nui-hidden"/>
			<input name="seal.sealid" id="sealid" class="nui-hidden"/>
			<input name="seal.sealname" id="sealname" class="nui-hidden"/>
		     <fieldset id="field1" style="border:solid 1px #aaa;padding:3px;">
		       <legend>基本信息</legend>
		       		<table style="table-layout:fixed;">
						<tr>
							<td align="right" style="width:120px;">申请人：</td>
							<td>
								<input name="seal.applyno" id="applyno" class="nui-buttonedit" onbuttonclick="showEmployee" style="width:150px;" showClose="false" allowInput="false" required="true"/>
							</td>
							<td align="right" style="width:120px;">用章类型：</td>
							<td>
								<input name="seal.sealtype" id="sealtype" multiSelect="true" class="nui-combobox" style="width:150px" allowInput="false" required="true" onvaluechanged="getSealname"
									textField="sealname" valueField="confid" url="com.primeton.eos.ame_common.SealConfigure.querySealname.biz.ext" dataField="sealConfigures"/>
							</td>
							<td align="right" style="width:120px;">用章日期：</td>
							<td>
								<input name="seal.sealdate" class="nui-datepicker" required="true" style="width:150px" id="sealdate" onvaluechanged="checkDate" />
							</td>
						</tr>
						<tr>
							<td align="right" style="width:120px;">受益部门：</td>
							<td>
								<input name="seal.orgid" id="orgid" class="nui-combobox" url="com.primeton.rdmgr.labor.labormgr.getAllOrgs.biz.ext" 
							filterType="like" textField="orgname" valueField="orgid" dataField="allorgs" valueFromSelect="true" allowInput="true" style="width:150px;" required="true">
							</td>
							<td align="right" style="width:120px;">文件接收单位：</td>
							<td colspan="3">
								<input name="seal.misCustinfo.custid" id="custid" onbuttonclick="selectCustmer" class="nui-buttonedit" style="width:100%" allowInput="false" />
							</td>
						</tr>
						<tr>
							<td align="right" style="width:120px;">文件类型：</td>
							<td>
								<input name="seal.filetype" id="filetype" class="nui-dictcombobox" dictTypeId="MIS_FILETYPE" required="true" style="width:150px" onvaluechanged="checkFiletype">
							</td>
							<td align="right" style="width:120px;">文件份数：</td>
							<td>
								<input name="seal.filenum" id="filenum" class="nui-spinner" format="n0" allowLimitValue="false" changeOnMousewheel="false" showbutton="false" inputStyle="text-align: right" style="width:150px;"/>
							<span>份</span>
							</td>
							<td align="right">金额：</td>
			                <td>    
			                    <input name="seal.money" id="money" class="nui-spinner" format="n2" allowLimitValue="false" changeOnMousewheel="false" showbutton="false" inputStyle="text-align: right" style="width:150px;"/>
			                <span>元</span>
			                </td>
			                
						</tr>
						<tr>
							<td align="right" style="width:120px;">用章地点：</td>
							<td >
								<input name="seal.sealaddress" class="nui-dictcombobox" dictTypeId="AREA4SEAL" style="width: 150px;" required="true"/>
							</td>
							<td align="right" style="width:120px;">用章主体：</td>
							<td>
								<input name="seal.subject" id="subject" class="nui-dictcombobox" dictTypeId="company" style="width:150px" required="true"/>
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
	        <table style="table-layout:fixed;" id="tb2">
				<tr>
	                <td style="width: 125px;height: auto;" align="right">用章审批人：</td>
	                <td >
						<input name="checkman.name" id="checkmanname" class="nui-hidden"/>
	                    <input id="checkman" class="mini-textboxlist"  name="checkman.userid" searchField="name" style="width:180px;"
							url="com.primeton.eos.ame_budget.budgetOrgManager.queryUseridByName.biz.ext" value="" text=""
							textField="empname" valueField="userid" required="true" onvaluechanged="getcheckmanname"/>
	                </td>
	            </tr>		
	        </table>
		     <table style="table-layout:fixed;" id="tb1">
				<tr>
	                <td style="width: 125px;height: auto;" align="right">业务部门审批人：</td>
	                <td >
	                	<input name="leader.name" id="leadername" class="nui-hidden"/>
	                   <input id="leader" class="mini-textboxlist"  name="leader.userid" searchField="name" style="width:180px;"
							url="com.primeton.eos.ame_budget.budgetOrgManager.queryUseridByName.biz.ext" value="" text=""
							textField="empname" valueField="userid" required="true" onvaluechanged="getLeadername"/>
	                </td>
	            </tr>		
	        </table>
	        <table style="table-layout:fixed;" id="tb3">
				<tr>
	                <td style="width: 125px;height: auto;" align="right">用章处理人：</td>
	                <td >
						<input name="admin.name" id="adminname" class="nui-hidden"/>
	                    <input id="admin" class="mini-textboxlist"  name="admin.userid" searchField="name" style="width:180px;"
							url="com.primeton.eos.ame_budget.budgetOrgManager.queryUseridByName.biz.ext" value="" text=""
							textField="empname" valueField="userid" required="true" onvaluechanged="getAdminname"/>
	                </td>
	            </tr>		
	        </table>
	        <table style="table-layout:fixed;" id="tb4">
				<tr>
	                <td >
	                	<div name="seal.ischeck" id="ischeck" class="nui-checkboxlist" data="[{'id': '1','text': '无需业务审核'}]" value="0" onvaluechanged="changeges" style="margin-left: 25px;"></div>
	                </td>
	            </tr>		
	        </table>
		</form>
		 <fieldset id="field3" style="border:solid 1px #aaa;padding:3px;">
			<legend>用章申请附件</legend>
			<jsp:include page="/ame_common/detailFile.jsp"/>
			<jsp:include page="/ame_common/addFiles.jsp"/>
		</fieldset>
		<form id="opioionform" method="post">
		    <input name="misOpinion.processinstid" id="processinstid" class="nui-hidden" />
		    <input name="misOpinion.processinstname" id="processinstname" class="nui-hidden" />
		    <input name="misOpinion.activitydefid" id="activitydefid" class="nui-hidden" />
		    <input name="misOpinion.workitemid" id="workitemid" class="nui-hidden" />
		    <input name="misOpinion.workitemname" id="workitemname" class="nui-hidden" />
		    <input name="misOpinion.isshow" id="isshow" class="nui-hidden" />
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
					        <div field="files" renderer="onFileRenderer" width="100" hight="100"  align="center" headerAlign="center">附件</div>
					    </div>
					</div>
		        <div style="padding:5px;" id="opinionHide">
		            <table style="table-layout:fixed;">
		            	<tr id="salesEdit">
		                    <td style="width:150px;" align="right">审核结果：</td>
		                    <td style="width:250px;">  
								<input name="misOpinion.auditstatus" id="auditstatus" class="mini-dictradiogroup" value="1" style="width:250px;" required="true" dictTypeId="MIS_AUDITSTATUS"  onvaluechanged="show()" />
		                    </td>
		                    <td style="width:366px;" align="right" colspan="2">  
		                    	<a class="nui-button" onclick="doSHZT" style="width:100px;margin-right:20px;">悬挂意见保存</a>
		                    </td>
		                </tr>
		                <tr id="choosehide">
		                    <td  style="width:150px;" align="right">回退到：</td> 
		                    <td style="width:250px;" colspan="3">
		                    	<input name="misOpinion.backTo" id="backTo" class="nui-combobox" valueField="id" textField="name" style="width:200px" required="true" />
		                    </td>
		                </tr>
		                <tr>
		                    <td style="width:150px;height:auto;" align="right">处理意见：</td>
		                    <td colspan="3">
		                        <input name="misOpinion.auditopinion" id="auditopinion" class="nui-textarea" required="false" style="width:600px;height: 40px;"/>
		                    </td>
		                </tr>
		            </table>
		        </div>
		    </fieldset>
	    </form>
    </div>
</div>
<div style="text-align:center;padding:10px;" class="nui-toolbar">
	<a class="nui-checkbox" style="width:100px;padding-left: 10px;float: left;" id="guanZhuButton">关注流程</a>
   	<a class="nui-button" onclick="onOk" style="width: 60px;margin-right:20px;" id="appButton" iconCls="icon-upload">提交</a>
	<a class="nui-button" onclick="onCancel('cancel')" id="closeWin" style="width:60px;">关闭</a>
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
		nui.get("auditopinion").setValue("同意。");
	    document.getElementById("choosehide").style.display="none";
	    initMisOpinion({auditstatus:"1"});
	    <%
	  		long workItemID=(Long)request.getAttribute("workItemID");
	    %>
	    
	    //初始化
		init();
		function init(){
        	form.mask("数据加载中...");
        	//流程提示信息
			promptInit({workItemID: <%=workItemID %>});
			var json=nui.encode({workItemID: <%=workItemID %>});
			nui.ajax({
				url: "com.primeton.eos.ame_common.seal.getSealApplication.biz.ext",
				type: "post",
				data: json,
				contentType: "text/json",
				success: function (o){
					var form = new nui.Form("form1");
					var seal = o.seal;//流程业务数据
					var leader = seal.leader;//二级部门领导
					var admin = seal.admin;//用章处理人
					var checkman = seal.checkman;//用章处理人
					//加载附件设置参数
            		nui.get("grid_0").load({"groupid":"seal","relationid": seal.sealid});
            		form.setData(o);
            		
					//特殊字段设置
					nui.get("applyno").setText(seal.applyname);
                    nui.get("custid").setText(seal.custname);
                    nui.get("custid").setValue(seal.custno);
                    nui.get("orgid").setText(seal.orgname);
                    nui.get("sealtype").setText(seal.sealname);
					//审批人设置
					nui.get("leader").setValue(leader.userid);
					nui.get("leader").setText(leader.name);
					nui.get("leadername").setValue(leader.name);
					nui.get("admin").setValue(admin.userid);
					nui.get("admin").setText(admin.name);
					nui.get("adminname").setValue(admin.name);
					nui.get("checkman").setValue(checkman.userid);
					nui.get("checkman").setText(checkman.name);
					nui.get("checkmanname").setValue(checkman.name);
					//设置审核意见基本信息
					nui.get("processinstid").setValue(o.workitem.processInstID);
	               	nui.get("processinstname").setValue(o.workitem.processInstName);
	               	nui.get("activitydefid").setValue(o.workitem.activityDefID);
	               	nui.get("workitemname").setValue(o.workitem.workItemName);
					nui.get("workitemid").setValue(<%=workItemID %>);
	               	nui.get("isshow").setValue("1");
	               	nui.get("auditstatus").setValue("1");
	               	nui.get("backTo").setData(seal.backList);
	               	
	               	checkFiletype()
	            	//查询审核意见
					var grid = nui.get("datagrid1");
					if(o.workitem.processInstID!=null||o.workitem.processInstID!=""){
						grid.sortBy("time", "desc");
						grid.load({processInstID: o.workitem.processInstID},function(){
							form.unmask();
						});
					}
					
					var activityDefID = o.workitem.activityDefID ;
					if(activityDefID != "manualActivity4"){
						nui.get("ischeck").setValue('1');
						changeges();
        				document.getElementById("tb2").style.display = "none";
        				document.getElementById("tb3").style.display = "none";
        				document.getElementById("tb4").style.display = "none";
			    	}
				},
				error: function(){}
			});
        }
       
		//提交流程
		function SaveData(){
			var data = form.getData();
			var data_opioion = opioionform.getData();
			var seal = data.seal;
			seal.guanzhu = nui.get("guanZhuButton").getValue();
			var json = nui.encode({"seal":seal,"misOpinion": data_opioion.misOpinion,admin:data.admin,leader:data.leader,checkman:data.checkman});
			 nui.ajax({
                url: "com.primeton.eos.ame_common.seal.submitProcessSeal.biz.ext",
                data: json,
                type: 'POST',
                cache: false,
                contentType: 'text/json',
                success: function (text) {
                   	var returnJson = nui.decode(text);
	              	if(returnJson.result == "success"){
	              		form.unmask();
	                   	nui.alert("提交流程成功！","系统提示",function (){
	                   		CloseWindow("ok");
	                   	});
	              	}else{
                   		form.unmask();
						nui.get("appButton").enable();
	                   	nui.alert("提交流程失败！");
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
        	nui.confirm("是否提交流程?","操作提示",function(o){
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
	    
	    //获取业务部门审批人
	    function getLeadername(){
	    	var leadername = nui.get("leader").getText();
	    	nui.get("leadername").setValue(leadername);
	    }
	    
	    //获取用章处理人
	    function getAdminname(){
	    	var adminname = nui.get("admin").getText();
	    	nui.get("adminname").setValue(adminname);
	    }
	    
	    function getcheckmanname(e){
	    	var length = e.value.split(",").length;
	        if (length > 1) {
	        
	            var text = e.sender.getText().split(",")[0];
	            var value = e.sender.getValue().split(",")[0];
	            setTimeout(function () {
	                
	                e.sender.setValue(value);
	                e.sender.setText(text);
	            }, 200)
	        }
	    	var adminname = nui.get("checkman").getText();
	    	nui.get("checkmanname").setValue(adminname);
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
        //隐藏业务审核人
        function changeges(){
        	var ischeck = nui.get("ischeck").getValue();
        	if(ischeck=='1'){
        		document.getElementById("tb1").style.display = "none";
        	}else{
        		document.getElementById("tb1").style.display = "";
        	}
        }
        
        //选择人员
		function showEmployee(e) {
		    var btnEdit = this;
		    nui.open({
				url:"<%=request.getContextPath() %>/machine/SelectEmployee.jsp",
				title: "选择人员",
				width: 600,
				height: 400,
				ondestroy: function (action) {
					if (action == "ok") {
						var iframe = this.getIFrameEl();
						var data = iframe.contentWindow.GetData();
						data = nui.clone(data);    //必须
						if (data) {
			                btnEdit.setValue(data.userid);
			                btnEdit.setText(data.empname);		 
						}
					}
				}
			});
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
        
        //标准方法接口定义
	    function CloseWindow(action) {           
	        if (window.CloseOwnerWindow) return window.CloseOwnerWindow(action);
	        else window.close();
	    }
        
        <!-- 审批意见 -->
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
			}else if(auditstatus=='2'){
				if(auditopinion=="同意。"){
					nui.get("auditopinion").setValue("");
				}
				showNone();
			}
		}
		
		function showNone(){
			nui.get("backTo").setValue("");
			document.getElementById("choosehide").style.display="none";
		}
		
		function chooselink(){
			document.getElementById("choosehide").style.display="";
		}
		
		//意见附件信息
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
	     
    	function doSHZT(){
    		if(nui.get("auditopinion").getValue().trim() == ""){
    			nui.alert("悬挂时审核意见不可以为空");
        		return false;
    		}else{
    			if (!confirm("是否保存悬挂时的审核意见？")) {
                    return false;
                }else{
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
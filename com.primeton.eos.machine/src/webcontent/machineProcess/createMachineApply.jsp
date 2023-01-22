<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@page import="com.eos.data.datacontext.UserObject"%>
<%@ page import="java.util.Map" %>
<html>
<!-- 
  - Author(s): mengyy
  - Date: 2018-12-06 10:51:47
  - Description:
-->
<head>
	<title>创建资产申请流程</title>
	<meta http-equiv="content-type" content="text/html; charset=UTF-8" />
	<link id="css_skin" rel="stylesheet" type="text/css" href="/default/coframe/tools/skins/skin1/style.css" />
	<script src="<%= request.getContextPath() %>/common/nui/nui.js" type="text/javascript"></script>
	<style type="text/css">
	    body{
	        margin:0;padding:0;border:0;width:100%;height:100%;overflow:hidden;
	    }
    </style>
</head>
<body>
<div class="nui-fit">
	<div class="mini-panel" title="发起资产采购申请" style="width: 100%;">
		<!-- 提示信息展示  -->
		<jsp:include page="/ame_common/ameFlowOperTips/ameFlowOperTipsInfo.jsp"/>
		<div id="form1" >
			<fieldset id="field1" style="border:solid 1px #aaa;padding:3px;">
				<input name="machineApply.fileids" id="fileids2" class="nui-hidden"/>
				<input name="machineApply.status" id="status" class="nui-hidden"/>
	            <legend>资产申请信息</legend>
	            <table style="table-layout:fixed;" id="table_file">
	            	<tr>
	            		<td style="width:120px;" align="right">资产类型：</td>
	                    <td style="width:150px;">    
	                        <input class="nui-dictcombobox" name="machineApply.type" id="type" dictTypeId="MIS_MA_TYPE" required="true" emptyText="请选择" onvaluechanged="onTypeFilterChanged"/>
	                    </td>
	                    <td style="width:120px;" align="right">子类型：</td>
	                    <td style="width:150px;">    
	                        <input class="nui-combobox" name="machineApply.sectype" id="sectype" required="true" emptyText="请选择" valueField="dictID" textField="dictName" parentField="parentId"/>
	                    </td>
	                    <td style="width:120px;" align="right">区域：</td>
	                    <td style="width:150px;">    
	                        <input class="nui-dictcombobox" name="machineApply.area" id="area" dictTypeId="EXP_REGION" required="true" emptyText="请选择" />
	                    </td>
	            	</tr>
	            	<tr>
	            		<td style="width:120px;" align="right">管理方式：</td>
	                    <td style="width:150px;">    
	                        <input class="nui-dictcombobox" name="machineApply.storagetype" id="storageType" dictTypeId="MIS_MA_STORAGE" required="true" onvaluechanged="onNameFilterChanged(this.value)" emptyText="请选择"/>
	                    </td>
	                    <td style="width:120px;" align="right">数量：</td>
	                    <td style="width:150px;">    
	                        <input name="machineApply.num" id="num" class="nui-textbox" required="true" maxLength="10"/>
	                    </td>
	            		<td style="width:120px;" align="right">购买总金额：</td>
		                <td style="width:150px;"> 
		                 	<input name="machineApply.price" id="price" class="nui-spinner" format="n2" required="true"allowLimitValue="false" changeOnMousewheel="false"  showbutton="false"/>	                   
		                </td>
	            	</tr>
	            	<tr id="temp">
	                	<td width="120px" align="right">负责人：</td>
	                    <td width="150px">    
							<input property="editor" name="machineApply.usingemp" id="usingemp" class="nui-buttonedit" onbuttonclick="showEmployee" showClose="false" required="true" allowInput="false" />
	                    </td>
	                    <td width="120px" align="right">所属部门：</td>
	                    <td width="150px">    
	                        <input property="editor" name="machineApply.dept" id="deptname" class="nui-buttonedit" value="" text="" onbuttonclick="showDept" showClose="false" required="true" allowInput="false"   />
	                    </td>
	                    <td width="120px" align="right">所属项目：</td>
	                    <td width="150px">    
	                        <input property="editor" name="machineApply.projectno" id="projectno" class="nui-buttonedit" value="" text="" onbuttonclick="selectProject" showClose="false"  />
	                    </td>
	            	</tr>
	            	<tr>
	            		<td style="width:120px;" align="right">型号：</td>
	                    <td style="width:200px;" colspan="5">    
	                        <input name="machineApply.model" id="model" style = "width: 680px;" class="nui-textbox" required="false" maxLength="50"/>
	                    </td>
	            	</tr>
	            	<tr>
	                    <td style="width:120px;" align="right">配置：</td>
	                    <td style="width:200px;" colspan="5">    
	                        <input name="machineApply.configuration"  style = "width: 680px;height:40px" id="configuration" class="nui-textarea" required="false" maxLength="500"/>
	                    </td>
	            	</tr>
	            	<tr>
	            		<td style="width:120px;" align="right">采购途径：</td>
	                    <td style="width:200px;" colspan="5">    
	                        <input name="machineApply.purmeans" id="purmeans"  style = "width: 680px;height:40px" class="nui-textarea" emptyText="可输入采购物品的链接或供应商" required="false" maxLength="500"/>
	                    </td>
	            	</tr>
	                <tr>
	                	<td style="width:120px;" id="third31" align="right">备注：</td>
	                    <td style="width:150px;" colspan="5">    
	                        <input name="machineApply.remarks" id="remarks" class="nui-textarea" style="width:680px;" required="false"/>
	                    </td>
					</tr>
	            </table>
        		<jsp:include page="/ame_common/addFiles2.jsp"/> 
			</fieldset> 
		</div>
		<form id="opioionform" method="post" >
	        <div style="padding: 5px;" id="opinionHide">
	            <table style="table-layout: fixed;">
	            	<tr id="salesEdit">
	                    <td style="width: 150px;" align="right">审核结果：</td>
	                    <td style="width: 250px;">
							<input name="misOpinion.auditstatus" id="auditstatus" class="nui-dictradiogroup" style="width: 250px;" 
								required="true" dictTypeId="MIS_AUDITSTATUS" value="4" />
								 <input name="misOpinion.auditopinion" id="auditopinion" value="" class="nui-hidden" />
	                    </td>
	                </tr>
	            </table>
	        </div>
    	</form>
	</div>
</div>
<div style="text-align: center;padding: 10px;" class="nui-toolbar">
	<a class="nui-checkbox" style="width:100px;padding-left: 10px;float: left;" id="guanZhuButton">关注流程</a>
	<a class="nui-button" onclick="onOk('1')" id="creatProcess" style="width: 80px;margin-right: 20px;">发起流程</a>
	<a class="nui-button" onclick="onOk('0')" id="saveProcess" style="width: 80px;margin-right: 140px;">暂时保存</a>
</div>
</body>
<script type="text/javascript">
	nui.parse();
	var orgname;//受益部门名称
	
  	var form = new nui.Form("#form1");//申请信息
  	var opioionform = new nui.Form("opioionform");//审核意见
  	
  	document.getElementById("salesEdit").style.display="none";
	//流程操作提示
	promptInit({"workItemID": 0,"processDefName": "com.primeton.eos.machine.machinePur","activityDefID": "manualActivity"});
	//获取资产申请相关数据
	<%
   		UserObject user = (UserObject) session.getAttribute("userObject");
   		String username = user.getUserName();
   		String userno = user.getUserId();
   		String userOrgName = user.getUserOrgName();
   		String userOrgId = user.getUserOrgId();
	%>
	init();
	function init(){
		//资产采购申请人默认填报人
		orgname = "<%=userOrgName %>"
		nui.get("usingemp").setValue("<%=userno %>");
	  	nui.get("usingemp").setText("<%=username %>");
	  	nui.get("deptname").setValue("<%=userOrgId %>");
	  	nui.get("deptname").setText(orgname);
	  	
	}
	
	var type ; //发起还是暂存
    function onOk(e){
        var msg;//提示信息
        if(e == "1"){//发起
        	if(!form.validate()){
	    		nui.alert("信息录入不完整！");
	        	return;
        	}
        	var price = nui.get("price").getValue();
        	if(price <= 0){
        		nui.alert("购买总金额必须大于0");
        		return;
        	}
        	msg="是否发起资产采购申请流程？";
        	type=1;
        }else{
        	var machinetype = nui.get("type").getValue();
        	if(machinetype == null || machinetype == ""){
        		nui.alert("请选择资产类型");
        		return;
        	}
        	msg="是否暂存资产申请流程？暂时保存后可以在待办任务中进行查询处理！";
        	type=0;
        	nui.get("status").setValue('0');
        }
        nui.confirm(msg,"操作提示",function(o){
        	if("ok" == o){
				//按钮禁用
		    	nui.get("creatProcess").disable();
		    	nui.get("saveProcess").disable();
				document.getElementById("fileCatalog2").value="MIS_MACHINEAPPLY";
				form6.submit();
        	}
        });
        
    }
	function SaveData2(){
		var mis = form.getData();//申请信息
		var misOpinion = opioionform.getData().misOpinion;//审核意见
    	mis.machineApply.typename = nui.get("type").getText();
    	mis.machineApply.sectypename = nui.get("sectype").getText();
    	mis.machineApply.state = '0';
		var guanZhu = nui.get("guanZhuButton").getValue();//是否关注
		mis.machineApply.guanZhu = guanZhu;//是否关注
		var json =nui.encode({machineApply:mis.machineApply,misOpinion:misOpinion});
        save(json);
	}
	
	
	function save(data){
		var content;
    	if(type == '1'){
           	content = '发起中...';
		}else if(type == '0'){
           	content = '暂存中...';
		}
    	mini.mask({
            el: document.body,
            cls: 'mini-mask-loading',
            html: content
        });
    	nui.ajax({
            url: "com.primeton.eos.machine.machineProcess.createMachineApply.biz.ext",
            data: data,
            type: 'POST',
            cache: false,
            contentType: 'text/json',
            success: function (text) {
            	nui.unmask(document.body);
        		var returnJson = nui.decode(text);
              	if(returnJson.result == "success"){
    				if(type==1){
	                   	nui.alert("发起流程成功！","系统提示",function (){
	                   		window.location="<%=request.getContextPath() %>/bps/wfclient/task/taskList.jsp?taskType=finishedSelf";
	                   	});
    				}else if(type==0){
    					nui.alert("暂时保存成功！","系统提示",function (){
    						window.location="<%=request.getContextPath() %>/bps/wfclient/task/taskList.jsp?taskType=self";
    						form.unmask();
    					});
    				}
              	}else if(text.result == "-2"){
      				nui.get("creatProcess").enable();
    				nui.get("saveProcess").enable();
    				if(type==1){
	                   	nui.alert("发起流程失败！失败原因：未设置审批人，请立即联系信息技术部！");
    				}else if(type==0){
    					nui.alert("暂时保存失败！失败原因：未设置审批人，请立即联系信息技术部！");
    				}
      			}else {
					nui.get("creatProcess").enable();
					nui.get("saveProcess").enable();
    				if(type==1){
	                   	nui.alert("发起流程失败！");
    				}else if(type==0){
    					nui.alert("暂时保存失败！");
    				}
              	}
            },
            error: function (jqXHR, textStatus, errorThrown) {
                nui.alert(jqXHR.responseText);
                CloseWindow();
            }
        });
	}
	
	function onTypeFilterChanged(e){
    	var tempType = e.value;
    	var json = {parentId:tempType};
    	nui.ajax({
    		url: "com.primeton.eos.machine.machine.getSecType.biz.ext",
            data: json,
            type: 'POST',
            cache: false,
            contentType: 'text/json',
            success: function(o){
				var data = o.childType;
				var secType = nui.get("sectype");      	
				secType.load(data);
				secType.select(0);
            }
    	});
    }
    
    function onNameFilterChanged(e){
    	var tempType=e;
    	showEmpAndOrg(tempType);
    }
    
    function showEmpAndOrg(tempType){
    	if(tempType == 2){
    		nui.get("usingemp").setValue("");
			nui.get("deptname").setValue("");
			nui.get("projectno").setValue("");   		
			document.getElementById("temp").style.display = "none";
    		nui.get("usingemp").setRequired(false);    
    		nui.get("deptname").setRequired(false);    
    	} else {
    		document.getElementById("temp").style.display = "";
    		nui.get("usingemp").setRequired(true);    
    		nui.get("deptname").setRequired(true);    
    	} 
    }
    
    function showEmployee(e) {
        var btnEdit = this;
        nui.open({
			url:"<%=request.getContextPath() %>/machine/SelectEmployee.jsp",
			title: "选择列表",
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
		                var temp2=nui.get("deptname");
		                temp2.setValue(data.orgid);
		                temp2.setText(data.orgname);
		                orgname = data.orgname;
					}
				}
				nui.get("usingemp").validate();
				nui.get("deptname").validate();
			}
		});
	}
	
    function showDept(e){
    	var btnEdit = this;
		nui.open({
            url:"<%=request.getContextPath() %>/machine/SelectOrganization.jsp",
			title: "选择列表",
			width: 650,
			height: 380,
			ondestroy: function (action) {
                //if (action == "close") return false;
                if (action == "ok") {
                    var iframe = this.getIFrameEl();
                    var data = iframe.contentWindow.GetData();
                    data = nui.clone(data);    //必须克隆
                    if (data) {                   	
						btnEdit.setValue(data.orgid);
		                btnEdit.setText(data.orgname);
		                orgname = data.orgname;
                    }
                }
				nui.get("deptname").validate();
			}
        });
    }
	//选择项目
	function selectProject(){
		var btnEdit = this;
		var usingemp = nui.get("usingemp").getValue();
		if(usingemp == null || usingemp ==""){
			nui.alert("请先选择负责人，再选项目。");
			return;
		}else{
	        nui.open({
	            url:"<%=request.getContextPath()%>/ame_common/SelectProject.jsp?orgname="+orgname,
	            title: "选择项目",
	            width: 850,
	            height: 420,
	            ondestroy: function (action) {
	                if (action == "ok") {
	                    var iframe = this.getIFrameEl();
	                    var data = iframe.contentWindow.GetData();
	                    data = nui.clone(data);
	                    if (data) {
	                        btnEdit.setValue(data.projectno);
	                        btnEdit.setText(data.projectno);
	                    }
					}
				}
	        });
        }
	}
	
</script>
</html>
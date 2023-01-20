<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@include file="/purchase/common/common.jsp"%>
<html>
<head>
	<title>收费合同签订申请 </title>
	<style type="text/css">
	    body{
	        margin: 0;padding: 0;border: 0;width: 100%;height: 100%;overflow: hidden;	
	    } 
    </style>
</head>
<body>
 <%long workitemid = (Long)request.getAttribute("workItemID");%> 
	<div class="nui-fit">
		<fieldset id="field1" style="border: solid 1px #aaa;padding: 3px;width: 97%;">
			<legend>收费合同签订信息</legend>
			<form id="form1" method="post">
				<input name="files" id="fileids" class="nui-hidden"/>
				<input name="id" id="id" class="nui-hidden"/>
				<div style="padding: 5px;">
					<table style="table-layout: fixed;">
						<tr>
								<td align="right" style="width: 110px">协议名称:</td>
								<td colspan="7">
									<input id="contractName" name="contractName"  class="nui-textbox" style="width: 100%" required="true"/>
								</td>
							</tr>
							<tr>
								<td align="right" style="width: 110px">原合同名称:</td>
								<td colspan="3">
									<input id="originalContractName" name="originalContractName"  class="nui-textbox" style="width: 100%"  enabled="false"/>
								</td>
								<td align="right" style="width:110px">申请日期:</td>
								<td colspan="1">
									<input id="createTime" name="createTime" enabled="false" class="nui-datepicker" style="width: 100%" required="true"/>
								</td>
							</tr>
							<tr>
								<td align="right" style="width: 110px">合同签约主体：</td>
									<td colspan="1"><input id="contractSubject" name="contractSubject"  class="nui-dictcombobox" dictTypeId="ZH_INVOICE_NAME_TYPE" style="width: 100%"  required="true"/></td>
								<td class="form_label" align = "right"> 申请人</td>
								<td colspan="1">
									<input name="createUserid" id="createUserid" class="nui-hidden" style="width: 100%"/>
									<input id="createUsername" name="createUsername" class="nui-textbox" enabled="false" style="width: 100%" required="true"/>
								</td>
								<td align="right" style="width: 110px">合同实施部门:</td>
								<td colspan="1">
									<input name="implementOrg" id="implementOrg" class="nui-combobox" valueField="orgid" textField="orgname" 
									style="width: 100%" shownullitem="false" allowinput="true" required="true" enabled="false"/>
									<input name="implementOrgname" id="implementOrgname" class="nui-hidden">
						     	</td>
							</tr>
							<tr>
								<td align="right" style="width: 110px">协议编号:</td>
								<td colspan="1"><input id="contractNo" name="contractNo"  class="nui-textbox" style="width: 100%" required="true"/></td>
								<td align="right" style="width: 110px">原合同编号:</td>
									<td colspan="1"><input id="originalContractNo" name="originalContractNo" enabled="false" class="nui-textbox" style="width: 100%" required="true"/></td>
								<td align="right" style="width: 110px">实施地点:</td>
									<td colspan="1"><input id="projectLocal" name="projectLocal"  class="nui-textbox" style="width: 100%" required="true"/></td>
							</tr>
							<tr>
								<td align="right" style="width: 110px">签约方:</td>
								<td colspan="1"><input id="signatoryname" name="signatoryname"  class="nui-textbox" style="width: 100%" required="true" enabled="false"/>
									<input id="signatory" name="signatory"  class="nui-hidden"/>
								</td>
								<td align="right" style="width:160px">合同起始日期：</td>
								<td colspan="1"><input name="startTime"  class="nui-datepicker" style="width: 100%" /></td>
								<td align="right" style="width:160px">合同结束日期：</td>
								<td colspan="1"><input name="endTime"  class="nui-datepicker" style="width: 100%" /></td>
							</tr>
							<tr>
							<td align="right" style="width: 110px">标的规模:</td>
									<td colspan="1"><input id="projectSize" name="projectSize"   class="nui-textbox" style="width: 100%" required="true"/></td>
								<td align="right" style="width: 110px">合同最终金额(元):</td>
									<td colspan="1"><input id="contractSum" name="contractSum" class="nui-textbox"  style="width: 100%" required="true"/></td>
								<td align="right" style="width: 110px">合同增加金额(元):</td>
									<td colspan="1"><input id="increaseDecreaseSum" name="increaseDecreaseSum" class="nui-textbox"  style="width: 100%" required="true"/></td>
							</tr>
							<tr>
							    <td align="right" style="width: 110px">会签部门领导:</td>
							    <td  colspan="1">
								  	<input id = "fDeptCountersignId" name="fDeptCountersignId" class="nui-textboxlist"  searchField="name" style="width:300px;"
										url="com.primeton.eos.ame_budget.budgetOrgManager.queryEmpByName.biz.ext" 
										textField="EMPNAME" valueField="EMPID" emptyText="请选择.." onvaluechanged="onFUseridsValueChanged" />
									<input name="fDeptCountersignName" id="fDeptCountersignName"  class="nui-hidden"/>
								</td>
								<td  colspan="3" style="color:red">
									⬅注:请按照合同管理办法规定选择相应会签部门进行审批(请输入名字搜索选择)
								</td>
							</tr>
						<tr>
							<td align="right" >变更说明：</td>
								<td colspan="8">
									<input id="remark" name="remark"  class="nui-textarea" style="width:100%;height: 50px" required="true"/>
								</td>
						</tr>
					</table>
				</div>
			</form>
			
			<fieldset id="field2" style="border:solid 1px #aaa;padding:3px;">
				<legend>相关附件</legend>
				<jsp:include page="/ame_common/inputFile.jsp"/>
			</fieldset>
			<jsp:include page="/ame_common/misOpinion_Freeflow.jsp"/>
		</fieldset>
	</div>
	<div style="text-align: center;padding: 10px;" class="nui-toolbar">
		<a class="nui-button" onclick="countersign()" id="countersign" iconCls="icon-user" style="width: 80px;margin-right: 20px;">加签</a>
		<a class="nui-button" onclick="submit()" id="creatReimbProcess" iconCls="icon-ok" style="width: 80px;margin-right: 20px;">提交</a>
		<a class="nui-button" onclick="closeCancel()" id="saveReimbProcess" iconCls="icon-close" style="width: 80px;margin-right: 140px;">关闭</a>
	</div>
	<script type="text/javascript">
        nui.parse();
    	var form = new nui.Form("form1");
    	var projectid = <%=request.getParameter("projectid")%>;
    	var workItemID = <%=request.getParameter("workItemID")%>;
    	var opioionform = new nui.Form("#opioionform");
    	var titleText,countersignUsers;
        init();
        isViewDelete=false;
        
        function init(){
        	var data = {workItemID:<%=workitemid%>};
			var json = nui.encode(data);
			nui.ajax({
		        url:"com.zhonghe.ame.chargeContractAlteration.chargeContractAlteration.getChargeContractAlteration.biz.ext",
		        type: "post",
		        data: json ,
		        contentType:'text/json',
		        success: function (o) {
				      	form.setData(o.chargeContract);
				      	 form.setEnabled(false);
						nui.get("implementOrg").setText(o.chargeContract.implementOrgname);
					 	nui.get("fDeptCountersignId").setText(o.chargeContract.fDeptCountersignName);
			            nui.get("backTo").setData(o.chargeContract.backList);
						//查询并加载附件
						var grid_0 = nui.get("grid_0");
        				grid_0.load({"groupid":"CHARGE_CONTRACT","relationid":o.chargeContract.id});
						grid_0.sortBy("fileTime","desc");
						
						var grid = nui.get("datagrid1");
						grid.load({processInstID:o.chargeContract.processid});
						grid.sortBy("time", "desc");
						
						setTimeout(function(){
							//注销掉删除操作
							$(".Delete_Button").hide();
						},300);
						//初始化处理意见
						initMisOpinion({auditstatus:"1"});

			        }
			    });
        }
        
        function countersign(){
        	selectOmEmployee();
        }
        
        function selectOmEmployee(){
	    	var btnEdit = this;
	        nui.open({
	            url: "<%=request.getContextPath() %>/contractPact/selectUsers.jsp",
	            title: "立项单位经办人",
	            width: 430,
	            height: 400,
	            ondestroy: function (action) {
	            	var user,users = "【";
	            	countersignUsers =[];
	                if (action == "ok") {
	                    var iframe = this.getIFrameEl();
	                    var data = iframe.contentWindow.GetData();
	                    data = nui.clone(data);    //必须
	                    if (data) {
                        	for(var i = 0;i<data.length ;i++){
                        		user = {};
                        		user.id = data[i].userid
                        		user.name = data[i].empname
                        		user.typeCode = "person"
                        		countersignUsers.push(user);
                        		if(i==0){
                        			users = users +data[i].empname;
                        		}else{
                        		
	                        		users = users +","+data[i].empname;
                        		}
                        	}
                        	users = users+"】";
                        	titleText ="增加审批人员"+ users +"并提交";
		                    form2.submit();
	                       }
	                    }
	
	                }
	            });
	        }
        
		function submit(){
	    	var auditstatus = nui.get("auditstatus").getValue();
	    	console.log(auditstatus);
	    	if(auditstatus == "2"){	//终止流程
	    		titleText = "终止";
	    	}else if(auditstatus == "0"){	//退回流程
	    		if(!nui.get("backTo").getValue()){
	    			nui.alert("退回环节不能为空！");
	    			return;
	    		}
	    		titleText = "退回";
	    	}else if(auditstatus == "1"){	//提交流程
	    		titleText = "提交";
	    	}
	    		form2.submit();
    	}
   		 // 提交 
    function SaveData(){
    	saveData();
    }
    
    	function saveData(json){
    			nui.confirm("确定" + titleText + "流程吗？", "操作提示",function (action) {            
		            if (action == "ok") {
		            	var data = form.getData();
						var misOpinion = opioionform.getData().misOpinion;//审核意见
		            	//nui.get("creatReimbProcess").setEnabled(false);
		            	data.files = nui.get("fileids").getValue();
		            	var json = {'cpData':data,misOpinion:misOpinion,workItemID: <%=workitemid %>,"countersignUsers":countersignUsers};
		            	//saveData(json);
				    	ajaxCommon({
				  			url: "com.zhonghe.ame.chargeContract.chargeContract.chargeContractReview.biz.ext",
							data: json,
							success: function (o){
								if(o.result == "success"){
						        	showTips("提交成功","系统提示")
					        		closeOk();
								}else{
									showTips("提交失败，请联系信息技术部人员！")
								    closeOk();
								}
							}
				  		}) 
		  	 	}
	        }); 
		}
		
		
    	 function onCancel(e) {
            CloseWindow("cancel");
        }
        //标准方法接口定义
        function CloseWindow(action) {           
            if (window.CloseOwnerWindow) return window.CloseOwnerWindow(action);
            else window.close();            
        }
        

    </script></body>
</html>

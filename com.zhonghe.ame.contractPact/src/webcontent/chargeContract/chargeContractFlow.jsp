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
							<!-- <td align="right" style="width: 160px">合同编号：</td>
									<td><input id="contractNo" name="contractNo"  class="nui-textbox" enabled="false" style="width: 200px"/></td> -->
							<td class="form_label" align = "right"> 申请人</td>
								<td>
									<input name="createUserid" id="createUserid" class="nui-hidden" style="width: 200px"/>
									<input id="createUsername" name="createUsername"   class="nui-textbox" enabled="false" style="width: 200px" required="true"/>
								</td>
								<td align="right" style="width: 160px">合同实施部门：</td>
								<td >   
									<input name="implementOrg" id="implementOrg" class="nui-hidden" style="width: 200px;" />
									<input id="implementOrgname" name="implementOrgname" class="nui-textbox" enabled="false" style="width: 200px" required="true"/>
								</td>
								<td align="right" style="width:160px">申请日期：</td>
								<td><input id="createTime" name="createTime" enabled="false" class="nui-datepicker" style="width: 200px"/></td>				
						</tr>
						<tr>
							
								<td align="right" style="width: 160px">合同名称：</td>
								<td><input id="contractName" name="contractName" enabled="false" class="nui-textbox" style="width: 200px"/></td>
								<td align="right" style="width: 160px">合同金额（元）：</td>
								<td><input id="contractSum" name="contractSum" enabled="false" class="nui-textbox" style="width: 200px" required="true"/></td>
								<td align="right" style="width: 160px">签约方：</td>
								<td><input id="signatoryname" name="signatoryname" enabled="false" class="nui-textbox" style="width: 200px"/></td>	
						</tr>
						<tr>
							
							<td align="right" style="width: 160px">专业类别：</td>
								<td><input id="major" name="major" enabled="false" class="nui-dictcombobox" dictTypeId="ZH_MAJOR_TYPE" style="width: 200px" required="true"/></td>
							<td align="right" style="width: 160px">工程类别：</td>
								 <td><input id="projectType" name="projectType" enabled="false" class="nui-dictcombobox" dictTypeId="ZH_PROJECT_TYPE" style="width: 200px" required="true"/></td>						
							<td align="right" style="width: 160px">集团内外：</td>
								<td><input id="headquarterGroup" name="headquarterGroup" enabled="false" class="nui-dictcombobox" dictTypeId="ZH_GROUP" style="width: 200px" required="true"/></td>
						</tr>
						<tr>
							
							<td align="right" style="width: 160px">合同签约主体：</td>
								<td><input id="contractSubject" name="contractSubject" enabled="false" class="nui-dictcombobox" dictTypeId="ZH_INVOICE_NAME_TYPE" style="width: 200px" required="true"/></td>
							<td align="right" style="width: 160px">实施地点：</td>
								<td><input id="projectLocal" name="projectLocal" enabled="false" class="nui-textbox" style="width: 200px"/></td>
							<td align="right" style="width: 160px">标的规模：</td>
								<td><input id="projectSize" name="projectSize" enabled="false" class="nui-textbox" style="width: 200px"/></td>									
						</tr>
						<tr>
							<td align="right" style="width:160px">合同起始日期：</td>
								<td><input id="startTime" name="startTime" enabled="false" class="nui-datepicker" style="width: 200px"/></td>
							<td align="right" style="width:160px">合同结束日期：</td>
								<td><input id="endTime" name="endTime" enabled="false" class="nui-datepicker" style="width: 200px"/></td>
							<td align="right" style="width:160px">会签部门领导：</td>
								<td><input id="fDeptCountersignName" name="fDeptCountersignName" enabled="false" class="nui-textbox" style="width: 200px"/></td>
							
							
							<!-- <td align="right" style="width: 160px">合同增加金额（元）：</td>
								<td><input id="increaseDecreaseSum" name="<input name="zDeptCountersignName" id="zDeptCountersignName" class="nui-hidden">" enabled="false" class="nui-textbox" style="width: 200px"/></td> -->
						</tr>
						<tr>
							<td align="right" style="width: 160px">备注：</td>
							<td  colspan="5"><input name="remark"  class="nui-textarea" style="width: 100%" required="false" enabled="false"/></td>
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
        	var data = {workitemid:<%=workitemid%>};
			var json = nui.encode(data);
			nui.ajax({
		        url: "com.zhonghe.ame.chargeContract.chargeContract.queryChargeContractInfo.biz.ext",
		        type: "post",
		        data: json ,
		        contentType:'text/json',
		        success: function (o) {
			            form.setData(o.data);
				        /* nui.get("major").setValue(nui.getDictText('ZH_MAJOR_TYPE',o.data.major));
				        nui.get("projectType").setValue(nui.getDictText('ZH_PROJECT_TYPE',o.data.projectType));
				        nui.get("headquarterGroup").setValue(nui.getDictText('ZH_GROUP',o.data.headquarterGroup));
				        nui.get("contractSubject").setValue(nui.getDictText('ZH_INVOICE_NAME_TYPE',o.data.contractSubject)); */
				      
			            nui.get("backTo").setData(o.data.backList);
						//查询并加载附件
						var grid_0 = nui.get("grid_0");
        				grid_0.load({"groupid":"CHARGE_CONTRACT","relationid":o.data.id});
						grid_0.sortBy("fileTime","desc");
						
						var grid = nui.get("datagrid1");
						grid.load({processInstID:o.data.processid});
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

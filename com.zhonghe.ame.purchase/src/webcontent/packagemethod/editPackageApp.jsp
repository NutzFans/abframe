<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@include file="/purchase/common/common.jsp"%>
<html>
<head>
	<title>采购计划发包方式发起 </title>
	<style type="text/css">
	    body{
	        margin: 0;padding: 0;border: 0;width: 100%;height: 100%;overflow: hidden;	
	    } 
    </style>
</head>
<body>
 <%long workitemid = (Long)request.getAttribute("workItemID");%> 
	<div class="nui-fit">
		<div class="mini-panel" title="" style="width: 100%;">
			<fieldset id="field1" style="border: solid 1px #aaa;padding: 3px;width: 100%;">
				<legend>采购发包信息</legend>
				<form id="form1" method="post">
					<input name="files" id="fileids" class="nui-hidden"/>
					<input class="nui-hidden" name="id"/>
					<input class="nui-hidden" name="processid"/>
					<div style="padding: 5px;">
						<table style="table-layout: fixed;">
							<tr>
							<td class="form_label" align = "right">发包编号：</td>
								<td>
									<input name="packageCode"  class="nui-textbox" style="width: 200px" readonly="readonly"/>
								</td>
							<td align="right" style="width:110px">发包方式：</td>
									<td colspan="1"><input class="nui-dictcombobox" dictTypeId="ZH_CGFS" required="true"   name="packageType"  shownullItem="true"
								style="width: 200px;" /> 
							<td align="right" style="width:110px">立项编号：</td>
								<td><input name="proappId" id="proappId" onbuttonclick="onButtonEdit" class="nui-buttonedit" allowInput="false" style="width: 200px" emptyText="请选择"  required="true" /></td>
							</tr>
							<tr>
								<td align="right" style="width: 140px">立项金额(万元)：</td>
								<td>
									<input name="price" id="price" class="nui-textbox" style="width: 200px" readOnly="readOnly" />
								</td>
								<td align="right" style="width: 140px">项目名称：</td>
									<td><input name="projectId" id="projectName" class="nui-textbox" style="width: 200px" readonly="readonly" /></td>
								<td align="right" style="width: 100px">立项部门：</td>
									<td><input name="orgId" id="orgId" class="nui-buttonedit" style="width: 200px" readOnly="readOnly" /></td>
								
							</tr>
							<tr>
								<td align="right" style="width: 140px">是否设招标限价：</td>
									<td colspan="1"><input class="nui-dictcombobox"
								dictTypeId="ZH_BIDSTATUS"  name="isPriceLimit" shownullItem="true"
								style="width: 200px;" onValueChanged="priceTypeChange" required="true" /> 
								<td align="right" style="width: 140px">招标限价(万元)：</td>
									<td><input name="limitPrice" id="limitPrice" class="nui-textbox" style="width: 200px" /></td>
									<td align="right" style="width:110px">申请日期：</td>
									<td><input name="appTime"  class="nui-datepicker" style="width: 200px" value="new Date()"/></td>
							</tr>
							<tr>
								<td align="right" style="width: 140px">分公司职能部门经办人：</td>
									<td>
										<input name="agentUserid" id="agentUserid"  class="nui-buttonedit" onbuttonclick="selectOmEmployee" style="width: 200px"  />
										<input name="agentUsername" id="agentUsername"  class="nui-hidden"/>
										<input name="agentOrgid" id="agentOrgid"  class="nui-hidden"/>
									</td>
									<td style="color: red" colspan="2" align="left">
									公司本部发起时此项无需选择，分公司发起时此项非必选。
									</td>
							</tr>
							<tr id="yaoqing">
								<td class="form_label"  align="right" style="width:140px;">此种发包方式的理由：</td>
			                    <td colspan="7">    
			                        <input style="width:100%;height: 40px;" name="invitationReason" class="nui-textarea" required="true" />
			                    </td>
							</tr>
							<tr>
								<td class="form_label"  align="right" style="width:140px;">发包范围：</td>
			                    <td colspan="7">
			                        <input style="width:100%;height: 40px;" name="packageRange" class="nui-textarea"  required="true"  />
			                    </td>
							</tr>						
							<tr id="one111">
			              		<td class="form_label"  align="right" style="width:140px;">相关情况说明：</td>
			                    <td colspan="7">    
		                        	<input style="width:100%;height: 40px;" name="relevantRemark" class="nui-textarea" />
			                    </td>
              				</tr>
              				<tr>
						        <td class="form_label"  align="right" id="chooseSupplierReason1" style="width:140px;">选择上述供应商原因：</td>
					                <td colspan="7">    
					                    <input style="width:100%;height: 40px;" name="chooseSupplierReason" class="nui-textarea"  id="chooseSupplierReason" dictTypeId="ZH_PURCHASE" />
					                </td>
							</tr>
						</table>
					</div>
				</form>
			</fieldset>

			<fieldset id="field2" style="border:solid  1px #aaa;padding:3px;">
				<legend>发包方式支持性材料附件</legend>
				<jsp:include page="/ame_common/inputFile.jsp"/>
			</fieldset>
			
			  <fieldset  style="height:100%; border:solid 1px #aaa;padding:3px ;width: 100%; ">
			  <legend>推荐邀请供应商信息</legend>
			     <div class="fieldset-body"  style="width:100%; height:100%; margin: 0px auto">
			     <a class="nui-button" id="addbtn" iconCls="icon-add" onclick="addTicket()">增加</a> 
              	 <a class="nui-button" id="deltbtn" iconCls="icon-remove" onclick="removeTicket()">删除</a> 
		    	<div id="grid_traveldetail" class="nui-datagrid" style="width: 80%;height: auto;" url="com.zhonghe.ame.purchase.purchasePackage.queryPurPackageSup.biz.ext" 
		    	 dataField="sups" allowCellSelect="true" showPager="false" allowCellEdit="true" multiSelect="true">
		            <div property="columns">
		            	
		                <div field="custname"  width="130" align="center" headerAlign="center"  >供应商名称
		                		<input id="custname" onbuttonclick="onButtonEdit1" allowInput="false"  class="nui-buttonedit" name="custname" width="100%"property="editor" />
		                </div>
		               <div  field="status" width="130" align="center" headerAlign="center" renderer="dictstatus"  >是否合格供应商
								
		                </div>
		                <div  field="registercap"  width="130" align="center" headerAlign="center"  >注册资金(万元)
							
		                </div>
		                <div  field="linkman"  width="130" align="center" headerAlign="center"  >联系人
								
		                </div>
		                <div   field="linktel" width="130" align="center" headerAlign="center"  >联系电话
								
		                </div>
		            </div>
		        </div>
		</div>
	        
		</div>
		</fieldset>
		<jsp:include page="/ame_common/misOpinion_Freeflow.jsp"/>	
		</div>
	</div>
	<div style="text-align:center;padding:10px;border-width:1px 0px 0px 0px;" class="nui-toolbar">               
	    <a class="nui-button" onclick="onOk(0)" id="saveReimb" iconCls="icon-save" style="width: 80px;margin-right: 20px;">保存</a>
		<a class="nui-button" onclick="onOk(1)" id="creatReimbProcess" iconCls="icon-ok" style="width: 80px;margin-right: 20px;">提交</a>
		<a class="nui-button" onclick="onOk(2)" id="zzFeame" style="width: 80px;margin-right: 20px;">中止</a>	
		<a class="nui-button" onclick="closeCancel()" id="saveReimbProcess" iconCls="icon-close" style="width: 80px;margin-right: 140px;">关闭</a>
	</div>  
	<script type="text/javascript">
        nui.parse();
	    var judge = getJudge(); // 1为公司本部 2为分子公司
	    nui.get("limitPrice").disable();
	    var form = new nui.Form("#form1");
	    var grid_traveldetail = nui.get("grid_traveldetail");
	    var istype;
        function init(){
		  	nui.get("createUserid").setValue(userId);
		  	nui.get("createUsername").setValue(userName);
		}
		  init();
        function init(){
        	var json = nui.encode({"workitemid":<%=workitemid%>});
        	nui.ajax({
		                url: "com.zhonghe.ame.purchase.purchasePackage.queryPurPackage.biz.ext",
		                data: json,
		                type: 'POST',
		                success: function (o) {
		               		 var result=o.proApp[0]
		               		 form.setData(result)
		               		 console.log(result)
		               		 nui.get("proappId").setText(result.proAppCode)
							/*  nui.get("noBidReason").setValue(result.noBidReason); */
							 var grid_0 = nui.get("grid_0");
	        				 grid_0.load({"groupid":"purcahsePackageApp","relationid":result.id});
							 grid_0.sortBy("fileTime","desc");
							 nui.get("grid_traveldetail").load({'id':result.id});
							 nui.get("backTo").setData(o.backList);
							 var grid = nui.get("datagrid1");
							 grid.load({processInstID:result.processid});
							 grid.sortBy("time", "desc");
							 
							nui.get("processinstid").setValue(o.workitem.processInstID);
			               	nui.get("processinstname").setValue(o.workitem.processInstName);
			               	nui.get("activitydefid").setValue(o.workitem.activityDefID);
			               	nui.get("workitemname").setValue(o.workitem.workItemName);
							nui.get("workitemid").setValue(<%=workitemid %>);
			               	nui.get("isshow").setValue("1");
			               	nui.get("auditstatus").setValue(3);
			               	document.getElementById("salesEdit").style.display="none";
			               	nui.get("auditopinion").setValue("");
							
							 //初始化处理意见
							 initMisOpinion({auditstatus:"1"});
		                }
		            }); 
		  	
		}
	function addTicket(){
    	var rowS = {name: "New Row"} 
		grid_traveldetail.addRow(rowS);
    }
    
    function packageTypeChange(e){
    	//邀请招标
    	if(e.value==2){
	    	document.getElementById("yaoqing").style.display = "";
	    	document.getElementById("bzb").style.display = "none";
    	}else if(e.value==3){
	    	document.getElementById("yaoqing").style.display = "none";
	    	document.getElementById("bzb").style.display = "";
    	}
    }
    
    function priceTypeChange(e){
    	console.log(e.value);
    	if(e.value==1){
    	nui.get("limitPrice").enable();
    	
    	}else if(e.value==0){
    	    	nui.get("limitPrice").disable();
    	}
    }
    
   		function dictstatus(e) {
			return nui.getDictText('MIS_YN',e.value);//设置业务字典值
		}
    
       function removeTicket(){
		var rows = grid_traveldetail.getSelecteds();
        if (rows.length>0) {
            grid_traveldetail.removeRows(rows, true);
        }else{
        	nui.alert("请至少选中一条记录！");
        }
	}
    
	    function selectProjectList(){
        	//var allpurProj = purProjOutper_grid.getData();
        	var btnEdit = this;
        	nui.open({
                url:"<%=request.getContextPath() %>/ame_common/SelectProject.jsp",
                title: "选择项目",
                width: 850,
                height: 420,
                allowResize: false,
                ondestroy: function (action) {
                    if (action == "ok") {
                        var iframe = this.getIFrameEl();
                        var data = iframe.contentWindow.GetData();
                        data = nui.clone(data);    //必须
                        if (data) {
                            btnEdit.setValue(data.projectId);
                            btnEdit.setText(data.projectName);
                            //连带出项目服务客户
                           /*  var row = purProjOutper_grid.getSelected();
                            var rowData = {custid: data.custid,custname: data.custname,manager: data.userid,managername: data.manager};
                            purProjOutper_grid.updateRow(row,rowData);  */
                        }
                    }
                }
            });
        }
		
		
		function selectOmEmployee(){
	    	var btnEdit = this;
	        nui.open({
	            url: "<%=request.getContextPath() %>/machine/SelectEmployee.jsp",
	            title: "立项单位经办人",
	            width: 430,
	            height: 400,
	            ondestroy: function (action) {
	                if (action == "ok") {
	                    var iframe = this.getIFrameEl();
	                    var data = iframe.contentWindow.GetData();
	                    data = nui.clone(data);    //必须
	                    if (data) {
	                        btnEdit.setValue(data.userid);
	                        btnEdit.setText(data.empname);
	                        console.log(data);
	                        nui.get("agentUserid").setValue(data.userid);
	                        nui.get("agentUserid").setText(data.empname);
	                        nui.get("agentUsername").setValue(data.empname);
	                         nui.get("agentOrgid").setValue(data.orgid)
                        }
                    }
                }
            });
        }
		
    	function onOk(e){
    		istype = e;
			nui.get("auditstatus").setValue(3);
			if (judge==2){
				var agentUserid = nui.get("agentUserid").getValue();
					if(agentUserid==null || agentUserid==''){
						nui.alert("分公司发起'分公司职能部门经办人'不能为空");
						return;
					}
			}
			if(istype==1){
				info="是否提交？"
			}else if(istype==0){
				info="是否暂时保存？"
			}else{
				info="是否中止流程？"
				nui.get("auditstatus").setValue(2);
			}
    		if(!form.validate()){
				nui.alert("请检查表单的完整性!");
				return;
			}
			var data = form.getData(); 
		    document.getElementById("fileCatalog").value="purcahsePackageApp";
			form2.submit();
		  	 
	    }
    	function SaveData(){
			var data = form.getData();
			var grid_traveldetail = nui.get("grid_traveldetail");
			var supData = grid_traveldetail.getData();
			var data_opioion =opioionform.getData();
			data.chooseSupplierReason=nui.get("chooseSupplierReason").getValue()
			data.files = nui.get("fileids").getValue();
			data.istype = istype;
			console.log(data_opioion);
			var json = nui.encode({'purchasePackage':data,'supData':supData,"judge":judge,"misOpinion": data_opioion.misOpinion});
			if(!confirm("是否提交？")){
    				return;
			}else{	
    			ajaxCommon({
	                url: "com.zhonghe.ame.purchase.purchasePackage.editPurchasePackage.biz.ext",
	                data: json,
	                success: function (text) {
	                	if(text.result == "1"){
		               		 showTips("提交成功")
		               		 closeOk();
		                }else{
		                	showTips("提交失败")
		                	
		                }
	                }
	            }); 
            }
    	}
    	function SaveData1(){
    	}
    	
        function onButtonEdit(e) {
            var btnEdit = this;
            mini.open({
                url: "/default/purchase/project/procurementProAppList.jsp",
                title: "采购立项列表",
                width: '73%',
                height: '75%',
                ondestroy: function (action) {
                    if (action == "ok") {
                   
                        var iframe = this.getIFrameEl();
                        var data = iframe.contentWindow.GetData();
                        data = mini.clone(data);    //必须
                        if (data) {
                        
                        	clog(data)
                            btnEdit.setValue(data.id);
                            btnEdit.setText(data.proAppCode);
                            nui.get("projectName").setValue(data.projectId);
                            nui.get("orgId").setValue(data.proAppOrgId);
                            nui.get("orgId").setText(data.proAppOrgName);
                            nui.get("price").setValue(data.proAppApplyPrice);
                            btnEdit.doValueChanged();
                            
                        }
                    }

                }
            });

        }
       
        function onButtonEdit1(e) {
            var btnEdit = this;
            mini.open({
                url: "/default/purchase/packagemethod/zhPurSup.jsp",
                title: "供应商列表",
                width: '73%',
                height: '75%',
                ondestroy: function (action) {
                    if (action == "ok") {
                   
                        var iframe = this.getIFrameEl();
                        var data = iframe.contentWindow.GetData();
                        data = mini.clone(data);    //必须
                        
                        if (data) {
                        	nui.get("custname").setText(data.custname);
                        	nui.get("custname").setValue(data.custname);
                            var grid_traveldetail = nui.get("grid_traveldetail");
                          	    var row = grid_traveldetail.getSelected();
				                  	grid_traveldetail.updateRow(row,{
										linkman:data.linkman,
										status:data.status,
										custid:data.custid,
										registercap:data.registercap,
										linktel:data.linktel
				                  	});      
                           
                            
                        }
                    }

                }
            });

        }
    </script></body>
</html>

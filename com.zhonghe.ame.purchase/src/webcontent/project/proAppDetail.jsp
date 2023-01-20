<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@include file="/purchase/common/common.jsp"%>
<html>
<head>
	<title>采购计划立项查看 </title>
	<style type="text/css">
	    body{
	        margin: 0;padding: 0;border: 0;width: 100%;height: 100%;overflow: hidden;	
	    } 
    </style>
</head>
<body>
	<div class="nui-fit">
		<div class="mini-panel" title="" style="width: 100%;">
			<fieldset id="field1" style="border: solid 1px #aaa;padding: 3px;width: 99%;">
				<legend>采购立项</legend>
				<form id="form1" method="post" >
					<input name="files" id="fileids" class="nui-hidden"/>
					<input name="files1" id="fileids1" class="nui-hidden"/>
					<input name="processid" id="processid" class="nui-hidden"/>
					<input class="nui-hidden" name="id"/>
					<div style="padding: 5px;">
						<table style="table-layout: fixed;">
							<tr>
								<td class="form_label" align = "right">立项名称：</td>
								<td>
									<input name="proAppName"  class="nui-textbox" style="width: 200px" required="true"/>
								</td>
								<td align="right" style="width: 140px">分公司职能部门经办人：</td>
								<td  >
									<input name="proAppAgentUserid" id="proAppAgentUserid"  class="nui-buttonedit" 
										onbuttonclick="selectOmEmployee" style="width: 170px"  />
								</td>
								<td align="right" style="width: 120px">立项单位：</td>
								<td >
									<input
										name="proAppOrgId" id="proAppOrgId" class="nui-combobox" 
										url="com.primeton.rdmgr.labor.labormgr.getAllOrgs.biz.ext"
										filterType="like" textField="orgname" valueField="orgid" dataField="allorgs" valueFromSelect="true" allowInput="true"
										style="width: 170px;" enabled="false" />
									<input name="proAppOrgName" class="nui-hidden" style="width: 100%" required="true"/>
								</td>
							</tr>
							<tr>
								<td align="right" style="width: 130px">所属项目名称：</td>
									<td><input name="projectId"  class="nui-textbox"    style="width: 100%" /></td>
								<td align="right" style="width: 140px">立项申请金额(万元)：</td>
								<td>
									<input name="proAppApplyPrice"  id="proAppApplyPrice" class="nui-textbox" readonly="readonly" style="width: 100%"  required="ture"/>
								</td>
								<td align="right" style="width:140px">项目拟实施日期：</td>
								<td>
									<input name="proAppImplTime"  class="nui-datepicker"  value="new Date()"  style="width: 100%"/>
								</td>
							</tr>
							<tr>
								<td align="right" style="width: 100px">费用来源：</td>
								<td>
									<input name="costFrom"  class="nui-radiobuttonlist"  data="[{id: '1', text: '公司自筹资金'}, {id:'2', text: '中央预算内资金'}]" required="ture"/>
								</td>
								<td align="right" style="width:140px">立项对象类别：</td>
								<td>
									<input name="proAppObjType"  class="nui-radiobuttonlist"  data="[{id: '1', text: '工程'}, {id:'2', text: '物资'}, {id:'3', text: '服务'}]" required="ture"/>
								</td>
							</tr>
							<tr id="one111">
			              		<td class="form_label"  align="right" style="width:120px;">立项范围说明：</td>
			                    <td colspan="7">    
			                        <input style="width:100%;height: 40px;" name="proAppRange" class="nui-textarea"  id="technologyNeed" />
			                    </td>
	              			</tr>
					</table>
				</div>
			</form>
			</fieldset>
			<fieldset  style="height:80%; border:solid 1px #aaa;padding:3px;">
		     <div class="fieldset-body"  style="width:100%; height:100%; margin: 0px auto">
			    	<div id="grid_detail" class="nui-datagrid" style="width: 100%;height: auto;" allowCellSelect="true" 
			    	url="com.zhonghe.ame.purchase.dao.projectApproval.queryProAppDtl.biz.ext" dataField="datas" showPager="false" multiSelect="true" oncellendedit="getHTZQ" >
			           <div property="columns">
		       				<div  type="checkcolumn"></div>
			           		<div type="indexcolumn" align="center" headerAlign="center"  visible="false"></div>
			           		<div  field="code" width="110" align="center" headerAlign="center" >计划编号</div>
			                <div field="materialName"  width="110" align="center" headerAlign="center" vtype="required"  >采购物项名称 </div>
			                <div field="budgetAmount"  width="110" align="center" headerAlign="center" vtype="required">预算金额(万元)</div>
			                <div field="amount"  width="110" align="center" headerAlign="center" vtype="required" headerStyle="color:red">立项金额(万元)
			                	<input property="editor" class="nui-spinner" minValue="0"  maxValue="999999999" name="amount" visible="true"/>
			                </div>
			                <div field="needOrgName"  width="60" align="center" headerAlign="center" >采购单位</div> 
			                <div field="contractamount"  width="100" align="center" headerAlign="center" vtype="true" visible="false">拟签合同金额(元)
			                </div>
			            </div>
			        </div>
				</div>
			</fieldset>
			<fieldset id="field2" style="border:solid 1px #aaa;padding:3px;">
				<legend>费用估算证明附件</legend>
				<jsp:include page="/ame_common/detailFile.jsp"/>
			</fieldset>
			<fieldset id="field3" style="border:solid 1px #aaa;padding:3px;">
				<legend>立项支持材料附件</legend>
				<jsp:include page="/ame_common/detailFile2.jsp"/>
			</fieldset>
		</div>
	</div>
	<div style="text-align: center;padding: 10px;" class="nui-toolbar">
		<a class="nui-button" onclick="onCancel" id="saveReimbProcess" style="width: 80px;margin-right: 140px;">关闭</a>
	</div>
	<script type="text/javascript">
        nui.parse();
	    var id = <%=request.getParameter("id")%>;
		isViewDelete=false;
		var form = new nui.Form("form1")
		var gridDtl = nui.get("grid_detail");
		var processid = <%=request.getParameter("processid")%>;
	   	if(processid==null){
	   		processid = <%=request.getParameter("processInstID")%>;
	   	}
		
		init();
        function init(){
        	var json = nui.encode({"id":id});
        	var jsonPid = nui.encode({"processid":processid});
        	form.setEnabled(false);
	   		nui.ajax({	
					url: "com.zhonghe.ame.purchase.purchaseProApp.queryProApp.biz.ext",
				    type: 'POST',
			        data: json,
			        success: function (o) {
						 var result=o.proApp[0]
						 console.log(result)
						 form.setData(result);
						 nui.get("proAppAgentUserid").setText(result.agentempname)
					 	gridDtl.load({"pid":result.id})
						 var grid_0 = nui.get("grid_0");
        				 grid_0.load({"groupid":"proAppCost","relationid":id});
						 grid_0.sortBy("fileTime","desc");
						 var grid_1 = nui.get("grid_1");
        				 grid_1.load({"groupid":"proAppSup","relationid":id});
						 grid_1.sortBy("fileTime","desc");
			        },
				    error: function (jqXHR, textStatus, errorThrown) {
				        alert(jqXHR.responseText);
				    }
			    }); 
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

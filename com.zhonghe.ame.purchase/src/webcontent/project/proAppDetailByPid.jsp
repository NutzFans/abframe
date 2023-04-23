
<%@page import="org.json.simple.JSONObject"%>
<%@page import="java.util.List"%>
<%@page import="commonj.sdo.DataObject"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@page import="com.eos.data.datacontext.UserObject"%>
<%@ page import="java.util.Map" %>
<%
	String contextPath=request.getContextPath();
 %>
<html>
<!-- 
  - Author(s): wanglinqiong
  - Date: 2016-05-12 16:17:56
  - Description:
-->
<head>
	<title>采购计划立项申请 </title>
	<meta http-equiv="content-type" content="text/html; charset=UTF-8" />
	<script src="<%= request.getContextPath() %>/common/nui/nui.js" type="text/javascript"></script>
	<style type="text/css">
	    body{
	        margin: 0;padding: 0;border: 0;width: 100%;height: 100%;overflow: hidden;	
	    } 
    </style>
</head>
<body>
	<div class="nui-fit">
		<div class="mini-panel" title="" style="width: 100%;">
			<fieldset id="field1" style="border: solid 1px #aaa;padding: 3px;width: 100%;">
				<legend>采购立项</legend>
				<form id="form1" method="post">
				<input name="files" id="fileids" class="nui-hidden" />
				<input name="files1" id="fileids1" class="nui-hidden" />
				<input class="nui-hidden" name="id" />
				<div style="padding: 5px;">
					<table style="table-layout: fixed;">
						<tr>
							<td align="right" style="width: 110px">立项名称：</td>
							<td colspan="3">
								<input name="proAppName" class="nui-textbox" style="width: 450px" />
								<input name="putunder" id="putunder" class="nui-hidden" />
							</td>
							<td align="right" style="width: 110px">立项编号：</td>
							<td>
								<input name="proAppCode" class="nui-textbox" style="width: 250px" />
							</td>
							<td align="right" style="width: 110px">立项金额(万元)：</td>
							<td>
								<input name="proAppApplyPrice" id="proAppApplyPrice" class="nui-textbox" readonly="readonly" style="width: 250px" emptyText="系统自动计算" />
							</td>
						</tr>
						<tr>
							<td align="right" style="width: 110px">申请单位：</td>
							<td colspan="3">
								<input name="proAppOrgName" id="proAppOrgName" class="nui-textbox" style="width: 450px;" />
							</td>
							<td align="right" style="width: 110px">涉密协作配套：</td>
							<td>
								<input id="isSmpt" name="isSmpt" class="nui-dictcombobox" dictTypeId="ZH_YN" style="width: 250px;" />
							</td>
							<td align="right" style="width: 110px">费用来源：</td>
							<td>
								<input name="costFrom" class="nui-dictcombobox" dictTypeId="ZH_COST_FROM" style="width: 250px;" />
							</td>
						</tr>
						<tr>
							<td align="right" style="width: 110px">所属项目名称：</td>
							<td colspan="3">
								<input name="projectId" class="nui-textbox" style="width: 450px" />
							</td>
							<td align="right" style="width: 110px">集采类型：</td>
							<td>
								<input class="nui-dictcombobox" name="type" id="type" dictTypeId="ZH_PURCHASE" visible="true" style="width: 250px" />
							</td>
							<td align="right" style="width: 110px">物项类别：</td>
							<td>
								<input id="proAppObjType" name="proAppObjType" class="nui-dictcombobox" dictTypeId="MIS_APPOBJTYPE" style="width: 250px" />
							</td>
						</tr>
						<tr>
							<td align="right" style="width: 110px">采购方式：</td>
							<td>
								<input id="purchasMode" name="purchasMode" class="nui-dictcombobox" dictTypeId="ZH_CGFS" style="width: 165px" />
							</td>
							<td align="right" style="width: 110px;">是否招标限价：</td>
							<td>
								<input id="tenderLimit" name="tenderLimit" class="nui-dictcombobox" dictTypeId="ZH_YN" style="width: 155px" />
							</td>
							<td align="right" style="width: 110px">招标限价金额：</td>
							<td>
								<input id="limit" name="limit" class="nui-textbox" required="ture" style="width: 250px" />
							</td>
						</tr>
						<tr>
							<td align="right" style="width: 110px">采购方式理由：</td>
							<td colspan="3">
								<input id="wayReason" name="wayReason" class="nui-textarea" style="width: 450px" emptyText="若为一级集采，则此项非必填" />
							</td>
							<td align="right" style="width: 120px;">立项范围：</td>
							<td colspan="3">
								<input name="proAppRange" style="width: 630px" class="nui-textarea" />
							</td>
						</tr>
						<tr>
							<td align="right" style="width: 110px">是否电子采购：</td>
							<td>
								<input id="isDzcg" name="isDzcg" class="nui-dictcombobox" dictTypeId="ZH_YN" style="width: 165px" />
							</td>
							<td align="right" style="width: 120px">电采平台发布公告：</td>
							<td>
								<input id="isGb" name="isGb" class="nui-dictcombobox" dictTypeId="ZH_YN" style="width: 155px" />
							</td>
							<td align="right" style="width: 120px">合同/订单性质：</td>
							<td>
								<input id="nature" name="nature" class="nui-dictcombobox" dictTypeId="ZH_NATURE" onvaluechanged="isSupplierScope" required="true" style="width: 250px" />
							</td>
							<td align="right" style="width: 120px">供应商选取范围：</td>
							<td>
								<input id="supplierScope" name="supplierScope" class="nui-dictcombobox" dictTypeId="ZH_SUPPLIER_SCOPE" style="width: 250px" />
							</td>
						</tr>
						<tr>
							<td align="right" style="width: 110px">供应商信息：</td>
							<td colspan="5" style="background: #f0f0f0">
								<input class="nui-textboxlist" style="width: 828px;" textField="custname" valueField="custid" id="supplierSel" name="supplierSel"
									url="com.zhonghe.ame.purchase.purSupplier.querySupplierByName.biz.ext" dataField="purSuppliers" inputMode="false" />
							</td>
						</tr>
						<tr>
							<td align="right" style="width: 130px">选择上述供应商原因：</td>
							<td colspan="3">
								<input id="supplierReason" name="supplierReason" class="nui-textarea" required="ture" style="width: 450px" />
							</td>
							<td align="right" style="width: 110px">相关情况说明：</td>
							<td colspan="3">
								<input name="remark" class="nui-textarea" style="width: 630px" />
							</td>
						</tr>
					</table>
				</div>
			</form>
			</fieldset>
			
			<fieldset id="field1" style="border: solid 1px #aaa;">
			<legend>计划明细</legend>
			<div class="fieldset-body" style="width: 100%; height: auto; margin: 0px auto">
				<div id="grid_detail" class="nui-datagrid" style="width: 100%; height: auto;" allowCellSelect="true" url="com.zhonghe.ame.purchase.dao.projectApproval.queryProAppDtl.biz.ext" dataField="datas"
					showPager="false" multiSelect="true">
					<div property="columns">
						<div type="indexcolumn" align="center" headerAlign="center" visible="false"></div>
						<div field="planName" width="110" align="left" headerAlign="center">计划名称</div>
						<div field="planCode" width="110" align="center" headerAlign="center">计划编号</div>
						<div field="materialName" width="110" align="center" headerAlign="center" vtype="required">采购物项名称</div>
						<div field="budgetAmount" width="110" align="center" headerAlign="center" vtype="required">预算金额(万元)</div>
						<div field="amount" width="110" align="center" headerAlign="center" vtype="required" headerStyle="color:red">立项金额(万元)</div>
						<div field="sumamount" width="110" align="center" headerAlign="center" vtype="required">剩余可立项金额(万元)</div>
						<div field="needOrgName" width="60" align="center" headerAlign="center">采购单位</div>
						<div field="contractamount" width="100" align="center" headerAlign="center" vtype="true" visible="false">
							拟签合同金额(元)
							<input property="editor" class="nui-spinner" minValue="0" maxValue="999999999" id="contractamount" name="contractamount" />
						</div>
					</div>
				</div>
			</div>
			</fieldset>

			<fieldset id="field2" style="border:solid 1px #aaa;padding:3px;">
				<legend>估算表、采购方案和支撑材料</legend>
				<jsp:include page="/ame_common/detailFile.jsp"/>
			</fieldset>
			<%-- <fieldset id="field3" style="border:solid 1px #aaa;padding:3px;">
				<legend>立项支持材料附件</legend>
				<jsp:include page="/ame_common/detailFile2.jsp"/>
			</fieldset> --%>



		</div>
	</div>
	<script type="text/javascript">
        nui.parse();
        var form = new nui.Form("form1");
		var gridDtl = nui.get("grid_detail");
        <%
	   		UserObject user = (UserObject) session.getAttribute("userObject");
	   		String username = user.getUserName();
	   		String userno = user.getUserId();
	   		String userOrgName = user.getUserOrgName();
	   		String userOrgId = user.getUserOrgId();
	   		Map<String,Object> a = user.getAttributes();
	   		String empid = (String) a.get("empid");
	   		DataObject[] roles = (DataObject[])a.get("roles");

	    %>
	    var id = <%=request.getParameter("id")%>;
		isViewDelete=false;
		
		var processid = <%=request.getParameter("processid")%>;
	   	if(processid==null){
	   		processid = <%=request.getParameter("processInstID")%>;
	   	}
		
		init();
        function init(){
        	var json = nui.encode({"processid":processid});
        	console.log(json);
        	form.setEnabled(false);
	   		nui.ajax({	
					url: "com.zhonghe.ame.purchase.purchaseItems.queryProAppByPid.biz.ext",
				    type: 'POST',
			        data: json,
			        success: function (o) {
						 var result=o.proApp;
						 form.setData(result);
						 
						 // 计划详细信息
						 gridDtl.load({
							"pid" : result.id
						 })
						 var grid_0 = nui.get("grid_0");
        				 grid_0.load({"groupid":"proAppCost","relationid":result.id});
						 grid_0.sortBy("fileTime","desc");
						
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
		
		
		 function selectOmEmployee(){
    	var btnEdit = this;
        nui.open({
            url: "<%=request.getContextPath() %>/machine/SelectEmployee.jsp",
            title: "选择报销人",
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
                        nui.get("proAppAgentUserid").setValue(data.userid);
                        nui.get("proAppAgentUserid").setText(data.empname);
                       
                        }
                    }

                }
            });
        }
        
        
        function selectOmEmployee1(){
    	var btnEdit = this;
        nui.open({
            url: "<%=request.getContextPath() %>/machine/SelectEmployee.jsp",
            title: "选择报销人",
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
                        /* nui.get("proAppChargeUserid").setValue(data.userid);
                        nui.get("proAppChargeUserid").setText(data.empname); */
                       
                        }
                    }

                }
            });
        }
		
    	function onOk(){
    	
    	
			//定义变量接受form表单数据
			var form = new nui.Form("#form1");
			/* form.validate();
    			if(form.isValid()==false){
    				nui.alert("请检查必填项");
    				return;
    			}	 */
			var data = form.getData(); 
		  	document.getElementById("fileCatalog").value="proAppCost";
		  	document.getElementById("fileCatalog1").value="proAppSup";
			form2.submit();
		  	form4.submit();
	    }
    	function SaveData(){
			//debugger;
				var form = new nui.Form("#form1");
    			var data = form.getData();
				data.files = nui.get("fileids").getValue();
				data.files1=nui.get("fileids1").getValue();
    			var json = nui.encode({'proApp':data});
    			console.log(data);
				if(!confirm("是否提交？")){
        				return;
        			}else{	
		    	nui.ajax({
		                url: "com.zhonghe.ame.purchase.purchaseProApp.addProApp.biz.ext",
		                data: json,
		                type: 'POST',
		                cache: false,
		                contentType: 'text/json',
		                success: function (text) {
		                debugger;
		                if(text.result == "1"){
		               		 nui.alert("提交成功",null,function(){

		               		 window.CloseOwnerWindow("save");
		               		 });
		                }else{
		                	nui.alert("提交失败",null,function(){
		               		 window.CloseOwnerWindow("save");
		               		 });
		                }
		                },
		                error: function (jqXHR, textStatus, errorThrown) {
		                    alert(jqXHR.responseText);
		                }
		            }); 
		            }
    	}

    	
        function onButtonEdit(e) {
            var btnEdit = this;
            mini.open({
                url: "/default/contractPact/payContract/procurementPlanList.jsp",
                title: "采购计划列表",
                width: '90%',
                height: '90%',
                ondestroy: function (action) {
                    if (action == "ok") {
                    debugger;
                        var iframe = this.getIFrameEl();
                        var data = iframe.contentWindow.GetData();
                        data = mini.clone(data);    //必须
                        if (data) {
                            btnEdit.setValue(data.id);
                            btnEdit.setText(data.purchaseNumber);
                            btnEdit.doValueChanged();
                            
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

<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@include file="/purchase/common/common.jsp"%>
<html>
	<head>
		<title>零星采购计划</title>
		<style type="text/css">
			body {
				margin: 0;
				padding: 0;
				border: 0;
				width: 100%;
				height: 100%;
				overflow: hidden;
			}
		</style>
	</head>
	<body>
		<div class="nui-fit"> 
			<div class="mini-panel" title="" style="width: 100%;">
				<fieldset id="field1" style="border: solid 1px #aaa;padding: 3px;width: 99%;">
					<legend>零星采购计划信息</legend>
					<form id="form1" method="post">
						<div style="padding: 5px; margin-left:5%;">
							<table style="table-layout: fixed;" id="table_file">

								<tr>
            		<td width="120px" class="form_label" align="right">零星采购名称：</td>
	                <td >
	                    <input id="purchaseName" name="purchaseName" class="nui-textbox" required="true" style="width: 200px" readonly="readonly"/>
	                </td>
	                <td class="form_label" align="right">部门负责人：</td>
					<td >
						<input name="manager" id="manager"  class="nui-buttonedit" 
							onbuttonclick="selectManager" style="width: 200px" required="true"/>
						<input name="managerName" id="managerName"  class="nui-hidden"/>
							
					</td>
	                <td class="form_label leader" align="right" style="display:none">分管领导：</td>
	                <td >
	                    <input name="leader" id="leader"  class="nui-buttonedit leader"  
							onbuttonclick="selectLeader" style="width: 200px;display:none" required="true"/>
						<input name="leaderName" id="leaderName"  class="nui-hidden" />
	                </td>
            	</tr>
            	<tr>
            		<td  width="120px" class="form_label" align="right">编号：</td>
	                <td >
	                    <input id="purchaseCode" name="purchaseCode" class="nui-textbox" emptyText="系统自动生成" readonly="readonly"style="width: 200px"/>
	                </td>
	                <td class="form_label" align="right">总金额(万元)：</td>
	                <td >
						<input name="totalAmount" id="totalAmount"  style="width: 200px" class="nui-textbox" readonly="readonly"/>
	                </td>
	                <td width="100px" class="form_label" align="right">采购单位：</td>
                    <td >
                    	<input name="orgId" id="orgId" class="nui-combobox" required="true" 
								url="com.primeton.rdmgr.labor.labormgr.getAllOrgs.biz.ext"
								filterType="like" textField="orgname" valueField="orgid" value="<%=userOrgId %>"
								dataField="allorgs" valueFromSelect="true" allowInput="true" style="width:240px;" readonly="readonly" />    
                    </td>
                  
            	</tr>
            	<tr>
        		   <td class="form_label selectReportUser" align="right" style="display:none">采购备案人员：</td>
	                <td >
	                    <input name="reportUser" id="reportUser"  class="nui-buttonedit selectReportUser"  
							onbuttonclick="selectReportUser" style="width: 200px;display:none" required="true"/>
						<input name="reportUserName" id="reportUserName"  class="nui-hidden" />
	                </td>
            	</tr>
            	<tr>
            		<td class="form_label" align="right">申请原因：</td>
	                 <td  colspan="7">    
                        <input style="width:100%;height: 40px;" name="applyReason" class="nui-textarea" id="applyReason"  required="true"/>
                    </td>
            	</tr>
							</table>
						</div>
					</form>
					<fieldset style="height:100%; border:solid 1px #aaa;padding:3px;">
						<div class="fieldset-body" style="width:100%; height:100%; margin: 0px auto">
							<div id="grid_traveldetail" class="nui-datagrid" style="width: 80%;height: auto;"
								allowCellSelect="true" showPager="false" allowCellEdit="false" multiSelect="true"
								dataField="purZeroItem" url="com.zhonghe.ame.purchase.purchaseItems.queryPurZeroItem.biz.ext">
								<div property="columns">
					                <div field="itemName"  width="130" align="center" headerAlign="center"  vtype="required">采购物项名称
											<input id="itemName" name="itemName" property="editor"  class="nui-textbox"  />
					                </div>
					               <div  field="brandSpec" width="130" align="center" headerAlign="center"  >品牌/型号/规格
											<input id="brandSpec" name="brandSpec" property="editor"  class="nui-textbox"   />
					                </div>
				
					                <div   field="unit" displayField="unit"  width="130" align="center" headerAlign="center"  >单位
											<input  name="unit" property="editor"  class="nui-textbox"  style="width:200px;" />
					                </div>
					                <div  field="onePrice"  width="130" align="center" headerAlign="center"  vtype="required">单价(万元)
											<input id="onePrice" name="onePrice" property="editor"  class="nui-spinner"  minValue="0"  maxValue="999999999"   />
					                </div>
					                <div  field="num"  width="130" align="center" headerAlign="center"   vtype="required">数量
											<input id="num" name="num" property="editor"  class="nui-spinner" minValue="0"  maxValue="999999999"  />
					                </div>
					                <div   field="totalPrice" width="130" align="center" headerAlign="center"  >总价(万元)
											<input id="totalPrice" name="totalPrice" property="editor"  class="nui-textbox"  readonly="readonly"/>
					                </div>
					                <!-- <div  field="plansimplementtime"  width="130" align="center" headerAlign="center"  >拟实施时间
											<input id="plansimplementtime" name="plansimplementtime" property="editor"  class="nui-datepicker"  />
					                </div> -->
					            </div>
							</div>
						</div>
					</fieldset>
				</fieldset>
			</div>
		</div>
		<div style="text-align:center;padding:10px;border-width:1px 0px 0px 0px;" class="nui-toolbar">
			<a class="nui-button" onclick="onCancel" style="width:60px;">关闭</a>
		</div>
		<script type="text/javascript">
			nui.parse();
			var form = new nui.Form("#form1");
			var grid_traveldetail = nui.get("grid_traveldetail");

			var id = <%= request.getParameter("id") %> ;
			isViewDelete = false;

			var processid = <%= request.getParameter("processid") %> ;
			if (processid == null) {
				processid = <%= request.getParameter("processInstID") %> ;
			}
			init();
			function init() {
				var json = nui.encode({
					"id": id
				});
				nui.ajax({
					url: "com.zhonghe.ame.purchase.purchaseProApp.queryPurZeroDetailByid.biz.ext",
					type: 'POST',
					data: json,
					success: function(o) {
						form.setData(o.purZero)
						form.setEnabled(false);
			       	  	 nui.get("orgId").setText(o.purZero.orgname);
			       	  	 nui.get("leader").setText(o.purZero.leaderName);
			       	  	 nui.get("manager").setText(o.purZero.managerName);


						var grid = nui.get("datagrid1");
						/*  grid.load({processInstID:o.purZero.processid});
						 grid.sortBy("time", "desc"); */
						//初始化处理意见
						/* initMisOpinion({auditstatus:"1"}); */
						var jsonData = {
							"zeroId": o.purZero.id
						}
						console.log(jsonData);
						grid_traveldetail.load(jsonData);
					},
					error: function(jqXHR, textStatus, errorThrown) {
						alert(jqXHR.responseText);
					}
				});


			}


			function GetData() {
				var node = tree.getSelectedNode();
				return node;
			}


			function onCancel() {
				CloseWindow("cancel");
			}

			function onKeyEnter(e) {
				search();
			}

			function onNodeDblClick(e) {
				var node = tree.getSelectedNode();
				if (node && tree.isLeaf(node) == false) {
					alert("不能选中父节点");
					return;
				}

				CloseWindow("ok");
			}

			function CloseWindow(action) {
				if (window.CloseOwnerWindow) return window.CloseOwnerWindow(action);
				else window.close();
			}
		</script>
	</body>
</html>

<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@include file="/purchase/common/common.jsp"%>
<html>
	<head>
		<title>采购计划信息</title>
		<style type="text/css">
			html,
			body {
				font-size: 12px;
				padding: 0;
				margin: 0;
				border: 0;
				height: 100%;
				overflow: hidden;
				width: 100%;
			}
		</style>
	</head>
	<body>
		<div class="nui-fit">
			<div id="form1" method="post">
				<fieldset style="border:solid 1px #aaa;padding:3px;width: 99%">
					<legend>采购计划信息</legend>
					<form id="form1" method="post">
						<div style="padding: 5px;  ">
							<table style="table-layout: fixed;" id="table_file">
								<tr>
				            		<td class="form_label" align="right" style="width:120px;">年度采购计划名称：</td>
					                <td colspan="6">
					                    <input id="name" name="name" class="nui-textbox" required="true"  style="width:100%;" />
					                </td>
				
				            	</tr>
				            	<tr>
				            		<td class="form_label" align="right" style="width:120px;">计划年度：</td>
					                <td style="width: 300px;">
					                    <input id="year" name="year" style="width:100%;" class="nui-textbox" style="width:150px;" required="true"/>   
					                </td>
					                <td class="form_label" align="right" style="width:120px;">提报人姓名：</td>
				                    <td>
				                        <input class="nui-textbox"  name="infomantUser" id="infomantUser" required="true" style="width:100%;"readonly="readonly"/>
				                    </td>
					                <td class="form_label" align="right" style="width:80px;">采购单位：</td>
				                    <td style="width: 300px;">
				                    
				                    <input id="needOrgName" name="needOrgName" class="nui-textbox" required="true" style="width:100%;" readonly="readonly"/>
				                    <input id="needOrgId" name="needOrgId" class="nui-hidden" required="true" style="width:100%;" />
				
				            	</tr>
				               	<tr>
				                    <td class="form_label" align="right" style="width:120px;">采购类型：</td>
				                    <td >    
				                        <input class="nui-dictcombobox" name="type" id="type" dictTypeId="ZH_PURCHASE" required="true" onvaluechanged="loadItem()" style="width:100%;"/>
				                    </td>
				                    <td class="form_label" align="right" style="width:200px;">计划总金额(万元)：</td>
					                <td >
					                    <input id="budgetAmount" name="budgetAmount" class="nui-textbox" required="true"   readOnly="readOnly"  style="width:100%;" />
					                </td>
					                 <td class="form_label" align="right" style="width:200px;">物项归口部门：</td>
					                <td >
					                    <input id="putunder" name="putunder" class="nui-dictcombobox"  dictTypeId="ZH_PUTUNDER"  onvaluechanged="loadItem()"  style="width:100%;" />
					                </td>
				                 </tr>
				              	<tr>
				              		<td class="form_label" style="width:120px;" align="right">备注：</td>
				                    <td  colspan="7">    
				                        <input style="width:100%;height:70px;" name="remark" class="nui-textarea" id="remark"/>
				                    </td>
				              	</tr>
							</table>
						</div>
						<div id="tabs1" class="nui-tabs" activeIndex="0" style="width:100%;height:auto">
						    <div title="相关附件">
								<jsp:include page="/ame_common/detailFile.jsp"/>
							</div>
						</div>
					</form>
						<div id="grid_traveldetail" class="nui-datagrid" style="width: 100%;height: auto;"
							allowCellSelect="true" showPager="false" allowCellEdit="false" multiSelect="true"
							dataField="purPlanItem"
							url="com.zhonghe.ame.purchase.purchaseItems.queryPurPlanItem.biz.ext">
							<div property="columns">
       							<div type="checkcolumn"></div>
				           		<div type="indexcolumn" align="center" headerAlign="center"></div>
       							<div field="isAdopt"  width="50" align="center" headerAlign="center" type="checkboxcolumn" trueValue="1" falseValue="0"  headerStyle="color:red">是否通过
				                </div>
				           		<div  field="code" width="110" align="center" headerAlign="center" >计划编号</div>
				                <div  field="purchaseFirstCode" width="110" align="center" headerAlign="center" visible="false">物项大类编码</div>
				                <div field=purchaseFirstName width="110" align="center" headerAlign="center"  >物项大类名称 </div>
				                <div  field="purchaseTwoCode" width="110" align="center" headerAlign="center" visible="false">物项中类编码</div>
				                <div  field="purchaseTwoName" width="110" align="center" headerAlign="center" renderer="onViewL" >物项中类名称 </div>
				                <div field="purchaseThreeCode" id="purchaseThreeCode" width="110" align="center" headerAlign="center"  readOnly="true"  visible="false">物项小类编码</div>
				                <div field="purchaseThreeName"  width="110" align="center" headerAlign="center" renderer="onViewL" >物项小类名称 </div>
				                <div field="materialName"  width="110" align="center" headerAlign="center" vtype="required"  renderer="onViewL" >采购物项名称 </div>
				                <div field="unit"  width="70" align="center" headerAlign="center" renderer="unitValue">单位</div>
				                <div field="number"  width="80" align="center" headerAlign="center"  renderer="onViewL">数量</div>
				                <div field="onePrice" width="100"  align="center" headerAlign="center" vtype="required" headerStyle="color:red">单价(万元) </div>
				                <div field="budgetAmount"  width="100" align="center" headerAlign="center" renderer="onViewL"   vtype="required">预算金额(万元)</div>
				                <div field="contractname"  width="100" align="center" headerAlign="center" renderer="onViewL" visible="false">拟签合同名称</div>
				                <div field="plansimplementtime"  width="100" align="center" headerAlign="center"  visible="false" vtype="required">拟实施采购时间</div>
				                <div field="contractamount"  width="100" align="center" headerAlign="center" renderer="onViewL" visible="false">拟签合同金额(元)</div>
				                <!--<div field="technologyNeed"  width="100" align="center" headerAlign="center" >技术要求</div>
				                <div field="keyIssus"  width="100" align="center" headerAlign="center"  renderer="onYn">是否关键事项</div>
				                <div field="isProject"  width="100" align="center" headerAlign="center" value="1" renderer="onYn">是否工程建设下项目采购</div>
				                <div field="projectname"  width="100" align="center" headerAlign="center" >所属项目名称</div>-->
				                <div field="remark"  width="100" align="center" headerAlign="center"  >备注</div>
				            </div>
						</div>
						<div class="nui-fit">
					    <div id="materialData" frozenStartColumn="0"  sizeList="[10,20,50,100]" showPager="true" dataField="data" 
					    	class="nui-datagrid" style="width:100%;height:100%;" url="com.zhonghe.ame.purchase.purchaseCatalogManage.materialDataListByCatalogId.biz.ext" 
					    	multiSelect="false" allowSortColumn=true sortMode="client"  >
					        <div property="columns">
					            <div type="indexcolumn" align="center"  width="40" headerAlign="center">序号</div>
					        	<div field="categorycode" width="70" align="center" headerAlign="center" allowSort="true" >类别编码</div>
					            <div field="categoryname" width="110" align="center" headerAlign="center" allowSort="true" >类别名称</div>
					            <div field="code" width="70" align="center" headerAlign="center" allowSort="true" >主编码</div>
					            <div field="desclong" width="200" align="center" headerAlign="center" allowSort="true"  >长描述</div>
					            <div field="descshort" width="200" align="center" headerAlign="center" allowSort="true"  >短描述</div>
					            <div field="desc10" width="65" align="center" headerAlign="center" allowSort="true"  >单位编码</div>
					            <div field="desc11" width="65" align="center" headerAlign="center" allowSort="true"  >单位名称</div>
					            <div field="desc20"  width="45" align="center"headerAlign="center" >状态</div>
					        </div>
				        </div>
					</div>
				</fieldset>
			</div>
		</div>
		<div style="text-align:center;padding:10px;border-width:1px 0px 0px 0px;" class="nui-toolbar">
			<a class="nui-button" onclick="onCancel" style="width:60px;">关闭</a>
		</div>
	</body>
	<script type="text/javascript">
		nui.parse();
		var form = new nui.Form("#form1");
		var grid_traveldetail = nui.get("grid_traveldetail");
		var competBidPrice = nui.get("competBidPrice");
		var materialData = nui.get("materialData");
		var id = <%=request.getParameter("id") %> ;
		isViewDelete = false;
		form.setEnabled(false)
		var processid = <%=request.getParameter("processid") %> ;
		if (processid == null) {
			processid = <%=request.getParameter("processInstID") %> ;
		}
		init();
		function init() {
			var json = nui.encode({
				"id": id
			});
			nui.ajax({
				url: "com.zhonghe.ame.purchase.purchaseItems.queryPurPlanDetailById.biz.ext",
				type: 'POST',
				data: json,
				success: function(o) {
					console.log(o)
					form.setData(o.purPlan)
					var jsonData = {
						"planId": o.purPlan.id
					}
					var grid_0 = nui.get("grid_0");
        			grid_0.load({"groupid":"PURCHASEPLAN","relationid":o.purPlan.id});
					grid_0.sortBy("fileTime","desc");
					grid_traveldetail.load(jsonData);
					materialData.load({"id":"221199"})
				},
				error: function(jqXHR, textStatus, errorThrown) {
					alert(jqXHR.responseText);
				}
		    });
		}

		function addPrice(e) {
			var totalPrice = 0;
			var grid_traveldetail = nui.get("grid_traveldetail");
			var list = grid_traveldetail.data;
			for (var i = 0; i < list.length; i++) {
				totalPrice = totalPrice + list[i].competBidPrice;
			}
		}

		function unitValue(e) {
			return nui.getDictText("ZH_UNIT", e.value);
		}

		function onCancel() {
			CloseWindow("cancel");
		}

		function CloseWindow(action) {
			if (window.CloseOwnerWindow) return window.CloseOwnerWindow(action);
			else window.close();
		}
	</script>
</html>

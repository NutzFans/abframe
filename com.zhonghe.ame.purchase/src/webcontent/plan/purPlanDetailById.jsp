<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@include file="/purchase/common/common.jsp"%>
<html>
	<head>
		<title>采购计划信息</title>
		<style type="text/css">
			html,
			body {
				font-size: 14px;
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
				<fieldset style="border:solid 1px #aaa;padding:1px;width: 98%">
            <legend>采购计划信息</legend>
            <form id="form1" method="post">
				<div style="padding: 5px;  ">
					<table style="table-layout: fixed; width: 100%" id="table_file">
		        	<tr>
		        		<td colspan="1" class="form_label" align="right" style="width:120px;">年度采购计划名称：</td>
		                <td colspan="5">
		                	<input id="id" name="id" class="nui-hidden"readonly="readonly"/>
		                    <input id="name" name="name" class="nui-textbox" style="width:100%;" readonly="readonly"/>
		                </td>
		        	</tr>
		        	<tr>
		                <td colspan="1" class="form_label" align="right" style="width:100px;">提报人姓名：</td>
	                    <td colspan="1">
	                        <input class="nui-textbox"  name="infomantUser" id="infomantUser" style="width:100%;" readonly="readonly"/>
	                    </td>
		                <td colspan="1" class="form_label" align="right" style="width:100px;">采购单位：</td>
	                    <td colspan="3">
	                    	<input id="needOrgName" name="needOrgName" class="nui-textbox" style="width:100%;" readonly="readonly"/>
						</td>
	            	</tr>
	            	<tr>
	               		<td class="form_label" align="right" style="width:120px;">计划年度：</td>
		                <td colspan="1">
		                    <input id="year" name="year" style="width:100%;" class="nui-textbox" style="width:100%;" readonly="readonly"//>   
		                </td>
	                    <td class="form_label" align="right" style="width:100px;">采购类型：</td>
	                    <td colspan="1">    
	                        <input class="nui-dictcombobox" name="type" id="type" dictTypeId="ZH_PURCHASE" readonly="readonly"  style="width:100%;"/>
	                    </td>
	                    <td class="form_label" align="right" style="width:120px;">计划总金额(万元)：</td>
		                <td colspan="1">
		                    <input id="budgetAmount" name="budgetAmount" class="nui-textbox" readonly="readonly" style="width:100%;" />
		                </td>
	                 </tr>
	               	<tr>
	               		<td class="form_label" align="right" style="width:120px;">物项归口部门：</td>
		                <td colspan="3">
		                    <input id="putunder" name="putunder" class="nui-dictcombobox"  dictTypeId="ZH_PUTUNDER"  multiSelect="true"  readonly="readonly" style="width:100%;" />
		                </td>
		                <td class="form_label" align="right" style="width:120px;">财务年度预算科目：</td>
		                <td colspan="1">
		                    <input id="SUBJECT" name="subject" class="nui-textbox"  style="width:100%;" readonly="readonly"/>
		                </td>
	               	</tr>
	                 <!-- <tr>
	              		<td class="form_label" style="width:120px;" align="right">归口部门下可采购物项：</td>
	                    <td  colspan="6">    
	                        <input style="width:100%;height:60px;" id="items" type="checkbox" class="nui-textarea" readonly="readonly"/>
	                    </td>
	              	</tr> -->
	              	<tr>
	              		<td class="form_label" style="width:120px;" align="right">备注：</td>
	                    <td  colspan="6">    
	                        <input style="width:100%;height:70px;" name="remark" class="nui-textarea" id="remark"/>
	                    </td>
	              	</tr>
		        </table>
		    </div>
    	</form>
    	</fieldset>
    	<fieldset style="border:solid 1px #aaa;padding:1px;width: 98%">
	    	<legend>采购预算明细</legend>
	    	<div id="grid_traveldetail" class="nui-datagrid" style="width: 100%;height: auto;" allowCellSelect="true" 
	    		showPager="false" allowCellEdit="false" multiSelect="true" dataField="purPlanItem"  
	    		url="com.zhonghe.ame.purchase.purchaseItems.queryPurPlanItem.biz.ext">
	            <div property="columns">
	           		<div type="checkcolumn"></div>
	           		<div type="indexcolumn" align="center" headerAlign="center">序号</div>
	           			<div field="code" width="110" align="center" headerAlign="center" >计划编号</div>
	                <div field="purchaseFirstCode" width="110" align="center" headerAlign="center"  visible="false">物项大类编码</div>
	                <div field=purchaseFirstName width="100" align="center" headerAlign="center"  >物项大类名称  </div> 
	                <div field="purchaseTwoCode" width="110" align="center" headerAlign="center" visible="false">中类编码</div>
	                <div field="purchaseTwoName" width="110" align="center" headerAlign="center"  >中类名称 </div> 
	                <!-- <div field="purchaseThreeCode" width="110" align="center" headerAlign="center"  readOnly="true"  visible="false">小类编码</div>
	                <div field="purchaseThreeName"  width="100" align="center" headerAlign="center"  readOnly="true" >小类名称</div> -->
	                <div field="materialName"  width="110" align="center" headerAlign="center" vtype="required" headerStyle="color:red">采购物项名称 
	                	<input property="editor" class="nui-textbox" name="materialName"  width="100%"  height="100%" required="true"/>
	                </div>
	                <div field="unit"  width="60" align="center" headerAlign="center" renderer="unitValue">单位
	                	<input property="editor" class="nui-dictcombobox" width="100%" dictTypeId="ZH_UNIT"   name="unit"/>
	                </div> 
	                <div  field="onePrice" width="100"  align="center" headerAlign="center" vtype="required" headerStyle="color:red">单价(万元)
										<input id="supplierName" name="onePrice" width="100%" property="editor"  class="nui-textbox" />
	                </div>
	                <div  field="number" width="100"  align="center" headerAlign="center"  vtype="required" headerStyle="color:red">数量
										<input id="number" name="onePrice" property="editor" width="100%"  class="nui-textbox"/>
	                </div>
	                <div field="budgetAmount"  width="100" align="center" headerAlign="center" headerStyle="color:red" vtype="required">预算金额(万元)
	                	<input property="editor" class="nui-spinner" minValue="0" width="100%" maxValue="999999999" name="budgetAmount" readonly="readonly" visible="true"/>
	                </div>
	                <div field="remark"  width="100" align="center" headerAlign="center"  >备注
	                	<input property="editor" class="nui-textarea" name="remark" width="100%" />
	                </div>
	                <div field="centralizedDept"  width="100" align="center" headerAlign="center"  renderer="zhPutUnder">物项归口部门</div>
	            </div>
        	</div>
         </fieldset>
				<div id="detailFile"  activeIndex="0" style="width:100%;height:auto">
					<jsp:include page="/ame_common/detailFile.jsp"/>
				</div>
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
				},
				error: function(jqXHR, textStatus, errorThrown) {
					alert(jqXHR.responseText);
				}
		    });
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
		function zhPutUnder(e) {
		return nui.getDictText("ZH_PUTUNDER", e.value);
	}
	</script>
</html>

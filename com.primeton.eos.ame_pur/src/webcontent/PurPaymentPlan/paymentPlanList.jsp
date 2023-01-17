<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>	
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<%@include file="/common/common.jsp"%>
<%@include file="/common/skins/skin0/component.jsp" %>

<%@page import="com.eos.data.datacontext.UserObject"%>

<html>
<%-- 
  - Author(s): weisz
  - Date: 2020-07-13 15:37:02
  - Description: 采购付款计划
--%>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
<script src="<%= request.getContextPath() %>/common/nui/nui.js" type="text/javascript"></script>
<title>Title</title>
</head>
<body>
	<div class="mini-panel" title="采购付款计划管理" width="auto">
		<div id="form1" style="width:100%;height:20;padding:0px;margin:0px;">
			<div class="nui-toolbar" style="border-bottom:0;padding:0px;">
				<table style="width:100%;">
					<tr>
						<td align="right"><span>采购合同编号：</span></td>
		            	<td align="left">
						    <input class="nui-textbox" name="criteria._expr[0]._value" style="width:220px;"/>
						    <input class="nui-hidden" name="criteria._expr[0]._property" value="purContract.purcontnum"/>
						    <input class="nui-hidden" name="criteria._expr[0]._op" value="like"/>
							<input class="nui-hidden" name="criteria._expr[0]._likeRule" value="all"/>
						</td>
																	
						<td align="right"><span>采购合同名称：</span></td>
						<td align="left">
							<input class="nui-textbox" name="criteria._expr[1]._value" style="width:220px;"/>
			            	<input class="nui-hidden" name="criteria._expr[1]._property" value="purContract.purcontname"/>
							<input class="nui-hidden" name="criteria._expr[1]._op" value="like"/>
							<input class="nui-hidden" name="criteria._expr[1]._likeRule" value="all"/>
						</td>
						
						<td align="right"><span>供应商简称：</span></td>
		            	<td align="left">
		            		<input class="nui-textbox" name="criteria._expr[2]._value" style="width:220px;"/>
			            	<input class="nui-hidden" name="criteria._expr[2]._property" value="purContract.purSupplier.suppliersname"/>
							<input class="nui-hidden" name="criteria._expr[2]._op" value="like"/>
							<input class="nui-hidden" name="criteria._expr[2]._likeRule" value="all"/>
						</td>
					</tr>
					
					<tr>
						<td align="right"><span>项目编号：</span></td>
		            	<td align="left">
						    <input class="nui-hidden" name="criteria._expr[3]._property" value="purContract.purcontid"/>
					        <input class="nui-hidden" name="criteria._expr[3]._op" value="in" id="tempOP2"/>
					        <input class="nui-hidden" name="criteria._expr[3]._ref" value="0" id="tempREF2"/>
					        <input class="nui-hidden" name="criteria._ref[0]._id" value="0"/>
					        <input class="nui-hidden" name="criteria._ref[0]._entity" value="com.primeton.eos.ame_pur.ame.PurProjCont"/>
					        <input class="nui-hidden" name="criteria._ref[0]._select._field[0]" value="purcontid"/>
					        <input class="nui-textbox" name="criteria._ref[0]._expr[0]._value" style="width:220px" id="projectno"/>
						    <input class="nui-hidden" name="criteria._ref[0]._expr[0]._property" value="projectno"/>
						    <input class="nui-hidden" name="criteria._ref[0]._expr[0]._op" value="like"/>
						    <input class="nui-hidden" name="criteria._ref[0]._expr[0]._likeRule" value="all"/>
						</td>
						
						
						<td align="right"><span>受益部门：</span></td>
		            	<td align="left">
					        <input class="nui-hidden" name="criteria._expr[4]._property" value="purContract.purcontid"/>
					        <input class="nui-hidden" name="criteria._expr[4]._op" value="in" id="tempOP1"/>
					        <input class="nui-hidden" name="criteria._expr[4]._ref" value="1" id="tempREF1"/>
					        
					        <input class="nui-hidden" name="criteria._ref[1]._id" value="1"/>
					        <input class="nui-hidden" name="criteria._ref[1]._entity" value="com.primeton.eos.ame_pur.ame.PurProjCont"/>
					        <input class="nui-hidden" name="criteria._ref[1]._select._field[0]" value="purcontid"/>
					        <input class="nui-hidden" name="criteria._ref[1]._expr[0]._property" value="projectno"/>
					        <input class="nui-hidden" name="criteria._ref[1]._expr[0]._op" value="in"/>
					        <input class="nui-hidden" name="criteria._ref[1]._expr[0]._ref" value="2"/>
					        
					        <input class="nui-hidden" name="criteria._ref[2]._id" value="2"/>
					        <input class="nui-hidden" name="criteria._ref[2]._select._field[0]" value="projectno"/>
					        <input class="nui-hidden" name="criteria._ref[2]._entity" value="com.primeton.rdmgr.data.rd.RdProject"/>
					        <input class="nui-hidden" name="criteria._ref[2]._expr[0]._property" value="omOrganization.orgid">
					        <input class="nui-hidden" name="criteria._ref[2]._expr[0]._op" value="in" id="tempOP3"/>
					        <input class="nui-treeselect" expandOnLoad="0" textField="orgname" valueField="orgid" parentField="parentorgid" dataField="orgs" 
						   	showTreeIcon="true" valueFromSelect="true" showNullItem="true" multiSelect="true" checkRecursive = "true" showFolderCheckBox="true" 
						   	name="criteria._ref[2]._expr[0]._value" id="syb" style="width:220px;"  nullItemText="" />
						   	<input class="nui-hidden" name="criteria._ref[2]._expr[1]._property" value="omOrganization.orgid">
						   	<input class="nui-hidden" name="criteria._ref[2]._expr[1]._op" value="in" id="tempOP4"/>
						   	<input class="nui-hidden" name="criteria._ref[2]._expr[1]._value" value="" id="tempVAL4"/>
					        
						</td>
						
						<td align="right"><span>付款依据：</span></td>
		            	<td align="left">
		            		<input class="nui-textbox" name="criteria._expr[5]._value" style="width:220px;"/>
						    <input class="nui-hidden" name="criteria._expr[5]._property" value="evidence"/>
						    <input class="nui-hidden" name="criteria._expr[5]._op" value="like"/>
						    <input class="nui-hidden" name="criteria._expr[5]._likeRule" value="all"/>
						</td>	
					</tr>	
					<tr>	
						<td align="right"><span>预计付款年月(早于)：</span></td>
		            	<td align="left">
						    <input class="mini-monthpicker" style="width:220px;" nullValue="null"  showClearButton="false" name="criteria._expr[6]._value"/>
							<input class="nui-hidden" name="criteria._expr[6]._property" value="expectedDate"/>
						    <input  class="nui-hidden" name="criteria._expr[6]._op" value="<="/>
						</td>	
					</tr>	
					<tr>
		    			<td align="center" colspan="15">
                            <a class="nui-button" id="search" iconCls="icon-search" onclick="search()">查找</a>
                            <a class="nui-button" id="reset" iconCls="icon-reload" onclick="reset()">重置</a>	
    
                       </td>
	                </tr>
	                
	            </table>           
	        </div>
	    </div>

		<div style="width:100%;">
	        <div class="nui-toolbar" style="border-bottom:0;padding:0px;">
	            <table style="width:100%;">
	            	<tr>
	                    <td style="width:20%;">
	                        <a class="nui-button" id="PurPaymentPlanManage_AddBtn" iconCls="icon-add" onclick="add()">增加</a>
	                        <a class="nui-button" id="PurPaymentPlanManage_UpdateBtn" iconCls="icon-edit"  onclick="edit()">编辑</a>
	                        <a class="nui-button" id="PurPaymentPlanManage_Deletebtn" iconCls="icon-remove"  onclick="remove()">删除</a>
	                    </td>
	                </tr>
                 </table>
	        </div>
	    </div>
	    <div id="datagrid1" class="nui-datagrid" style="width:100%;height:320px;" allowResize="true" dataField="paymentPlans" 
	    url="com.primeton.eos.ame_pur.purPaymentPlan.paymentPlanQuery.biz.ext" sizeList="[10,20,50,100,200,500,1000]"  idField="id" sortField="id" sortOrder="desc" multiSelect="true">
			<div property="columns">
				<div type="checkcolumn" width="25"></div>	
				<div field="id" width="0" align="center" headerAlign="center" >ID</div>		
				<div field="purContract.purcontnum" width="120" align="center" headerAlign="center" allowSort="true" renderer="getContractDetail">采购合同编号</div>		
				<div field="purContract.purcontname" width="260" align="left" headerAlign="center" >采购合同名称</div>	
				<div field="purContract.purSupplier.suppliersname" width="120" align="center" headerAlign="center" renderer="getSupplierDetail">供应商简称</div>							
				<div field="payCount" width="80" align="center" headerAlign="center" >付款次数</div>	
				<div field="expectedAmount" width="100" align="center"  headerAlign="center" allowSort="true" dataType="currency">付款金额</div>
				<div field="percentage" width="80" align="center"  headerAlign="center" allowSort="true" renderer="percentageRenderer">付款比例</div>			
				<div field="expectedDate" width="100" align="center"  headerAlign="center" allowSort="true" renderer="onDealDate">预计付款年月</div>
				<div field="evidence" width="140" align="center" headerAlign="center" >付款依据</div>
				<div field="nodeRemark" width="280" align="center"  headerAlign="center" >付款节点备注</div>
			</div>
		</div>
	</div>
	<form name="viewlist1" id="viewlist1" action="com.primeton.eos.ame_common.ameExportCommon.flow" method="post">
		<input type="hidden" name="_eosFlowAction" value="action0" filter="false"/>
		<input type="hidden" name="downloadFile" filter="false"/>
		<input type="hidden" name="fileName" filter="false"/>
	</form>
<script type="text/javascript">
	nui.parse();
	var form = new nui.Form("#form1");
	var grid = nui.get("datagrid1");
	var orgids = "0"; <%-- 机构权限 --%>
	var isall= false;
	<% 
		UserObject user = (UserObject)session.getAttribute("userObject");
		String nowuserid = user.getUserId();
		String nowusername = user.getUserName();
		String nowuserorgid=user.getUserOrgId(); 
	%>
	
	var nowuserorgid = '<%=nowuserorgid %>';
	
	init1();
	
	function init1(){
	    getOpeatorButtonAuth("PurPaymentPlanManage_AddBtn,PurPaymentPlanManage_UpdateBtn,PurPaymentPlanManage_Deletebtn");//操作按钮权限初始化 
		form.reset();
		var json = {"code":"PurPaymentPlanManage","map":{"property":"status","op":"=","value":"running"}};
		nui.ajax({
            url: "com.primeton.eos.ame_auth.ame_auth.getownorg.biz.ext",
            data:json,
            type: "post",
            cache: false,
            contentType: 'text/json',
            success: function (text) {
					
				if( text.orgs && text.orgs.length > 0){
					nui.get("syb").loadList(text.orgs, "orgid", "parentorgid");
					orgids = text.orgids;
					for(var i=0;i<text.orgs.length;i++){
						if(text.orgs[i].orgid == "1"){
							isall = true;
							break;
						}
					}
				}
				search();
            },
            error: function () {
            }
       	});
      	
	}
	
	function search() {
		//受益部门
		 nui.get("tempVAL4").setValue(orgids);
		if(isall) {//如果拥有全公司的权限就取消部门限制
			if(nui.get("syb").getValue() == null || nui.get("syb").getValue() == "") {
				nui.get("tempOP1").setValue("=");
				nui.get("tempREF1").setValue("");
			} else {
				nui.get("tempOP1").setValue("in");
				nui.get("tempREF1").setValue("1");
				
				nui.get("tempOP4").setValue("=");
				nui.get("tempVAL4").setValue("");
			}
		}  else {	
			if(nui.get("syb").getValue() == null || nui.get("syb").getValue() == "") {
				nui.get("tempOP3").setValue("=");
				nui.get("tempOP4").setValue("in");
			} else {
				nui.get("tempOP3").setValue("in");
				
				nui.get("tempOP4").setValue("=");
				nui.get("tempVAL4").setValue("");
			}
		} 
	
		//项目编号
		if(nui.get("projectno").getValue() == null || nui.get("projectno").getValue() == ""){
			nui.get("tempOP2").setValue("=");
			nui.get("tempREF2").setValue("");
		}else{
			nui.get("tempOP2").setValue("in");
			nui.get("tempREF2").setValue("0");
		}

		var data = form.getData(); 
	  	grid.load(data); 
	  
	}
	
	function reset() {
		form.reset();
		search();
	}
	function getContractDetail(e){
		if(e.value == null) {
			e.value = '暂无编号';
		}
    	return "<a href='javascript:void(0)' onclick='checkContractDetail();' title='点击查看'>" + e.value + "</a>";
    }
    function checkContractDetail(){
 		var selectRow = grid.getSelected();
		var executeUrl = "<%=request.getContextPath() %>/ame_pur/PurContract/DetailPurContract.jsp?id=" + selectRow.purContract.purcontid;
		window.open(executeUrl, "合同详细信息","fullscreen=1" );
    }
    function getSupplierDetail(e){
    	if(e.value == null) {
			e.value = '暂无简称';
		}
    	return "<a href='javascript:void(0)' onclick='checkSupplierDetail();' title='点击查看'>" + e.value + "</a>";
    }
    function checkSupplierDetail(){
 		var selectRow = grid.getSelected();
 		var executeUrl = "<%=request.getContextPath() %>/ame_pur/PurSupplier/DetailPurSupplier.jsp?id=" + selectRow.purContract.purSupplier.custid;
		window.open(executeUrl, "供应商详细信息", "fullscreen=1");
    }
    //设置业务字典值
    function dictTypeEvidence(e) {
		return nui.getDictText('MIS_INCOMECONV',e.value);
	}
	function percentageRenderer(e) {
		if(e.value == null) {
			return "";
		}
		return e.value + "%";
	}
	
	function add() {        	
        nui.open({
            url: "<%=request.getContextPath() %>/ame_pur/PurPaymentPlan/paymentPlanAdd.jsp",
            title: "新增采购付款计划", 
			width: 1000,
            height: 500,
            onload: function () {
           	 //页面提供“发起采购合同流程”按钮
                var iframe = this.getIFrameEl();
                var data = { action: "new"};
                iframe.contentWindow.SetData(data);
            },
            ondestroy: function (action) {
                grid.reload();
            }
        });
    }
    
    function remove() {
    	//删除权限
	    var rows = grid.getSelecteds(); 
	    if (rows.length < 1) {
	    	alert("请至少选中一条记录");
	    	return;
	    }
	    var jsonData = nui.encode({"plans":rows});     
    	if (confirm("确定删除选中记录？")) {
            grid.loading("操作中，请稍后......");
            nui.ajax({
                url: "com.primeton.eos.ame_pur.purPaymentPlan.paymentPlanDelete.biz.ext",
                type: "post",
                data: jsonData, 
                cache: false,
                contentType: 'text/json',
                success: function (text) {
                	grid.reload();
                },
                error: function (jqXHR, textStatus, errorThrown) {
                	alert(jqXHR.responseText);
            	}
           });
        }
    }
    
    function edit() {
		var row = grid.getSelected();
	  
		if (!row) {
           nui.alert("请选中一条记录","提示");
           return;
        }	
        
  		nui.open({
            url: "<%=request.getContextPath() %>/ame_pur/PurPaymentPlan/paymentPlanAdd.jsp",
            title: "编辑采购付款计划",
            width: 1000,
            height: 500,
            onload: function () {
              var iframe = this.getIFrameEl();
              var data = {action: "edit", paymentPlanId: row.id };
              iframe.contentWindow.SetData(data);
            },
            ondestroy: function (action) {
                if(action=="saveSuccess"){
                  grid.reload();
                }
            }
        });
    }
    
    //导出
	function exportData(){
		var result = form.getData();
		grid.loading("操作中，请稍后...");
		nui.ajax({
	        url: "com.primeton.eos.ame_pur.purPaymentPlan.paymentPlanExport.biz.ext",
	        type: "post",
	        data: result,
	        success: function (o) {
	     		grid.unmask();
	        	var filePath = o.downloadFile;
	        	var fileName = "采购付款计划清单";
	        	var myDate = new Date();
	        	var year = myDate.getFullYear();
	        	var month = myDate.getMonth()+1;
	        	var day = myDate.getDate();
	        	var hours = myDate.getHours();
	        	var minutes = myDate.getMinutes();
	        	var seconds = myDate.getSeconds();
	        	var curDateTime = year;
	        	if(month>9){
					curDateTime = curDateTime + "" + month;
				}else{
					curDateTime = curDateTime + "0" + month;
				}
	        	if(day>9){
					curDateTime = curDateTime + day;
				}else{
					curDateTime = curDateTime + "0" + day;
					}
				if(hours>9){
					curDateTime = curDateTime + hours;
				}else{
					curDateTime = curDateTime + "0" + hours;
				}
				if(minutes>9){
					curDateTime = curDateTime + minutes;
				}else{
					curDateTime = curDateTime + "0" + minutes;
				}
				if(seconds>9){
					curDateTime = curDateTime + seconds;
				}else{
					curDateTime = curDateTime + "0" + seconds;
				}
				fileName = fileName + "_" + curDateTime + ".xls";
				var frm = document.getElementById("viewlist1");
	        	frm.elements["downloadFile"].value = filePath;
	        	frm.elements["fileName"].value = fileName;
			    frm.submit();
	        },
	        error: function () {
	        	nui.alert("error");
	        }
	    });	
	}
	function percentageRenderer(e) {
    	if(e.value == null) {
			return "";
		}
		return e.value + "%";
	}
	function onDealDate(e){
		if(e.field == "expectedDate"){
			var date = e.value;
			if(date){
				return e.cellHtml.substring(0,7);
			}
			return "";
		}
	}
</script>
</body>
</html>
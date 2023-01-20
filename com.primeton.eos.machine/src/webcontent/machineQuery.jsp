<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@page import="com.eos.data.datacontext.UserObject"%>
<%@page import="java.util.Map"%>
<%@page import="commonj.sdo.DataObject"%>
<html xmlns="http://www.w3.org/1999/xhtml">
<%@include file="/nui/common.jsp"%>
<%@include file="/common/common.jsp"%>
<head>
	<title>资产查询</title>
	<meta http-equiv="content-type" content="text/html; charset=UTF-8" />
	<script src="../common/nui/nui.js" type="text/javascript"></script>
	<link href="../demo.css" rel="stylesheet" type="text/css" />
</head>
<body style="width:100%;height:100%;padding:0px;margin:0px;">
	    <div id="form1">
			<input class="nui-hidden" name="sortField" value="assetid"/>
			<input class="nui-hidden" name="sortOrder" value="desc"/>
			<div class="nui-toolbar" style="border-bottom:0;padding:0px;">
				<table style="width:100%;">
					<tr>
			        	<td align="right"><span>购买日期：</span></td>
		            	<td align="left">
		            		<input class="nui-datepicker" name="criteria._expr[0]._min" style="width:100px"/>-<input class="nui-datepicker" name="criteria._expr[0]._max" style="width:100px"/>
					        <input class="nui-hidden" name="criteria._expr[0]._property" value="buytime"/>
					        <input class="nui-hidden" name="criteria._expr[0]._op" value="between"/>
					        <input class="nui-hidden" name="criteria._expr[0]._pattern" value="yyyy-MM-dd"/>
					    </td>
					    <!--<td align="right"><span>报废操作人员：</span></td>
		            	<td align="left">
					        <input class="nui-textbox" name="criteria._ref[0]._expr[0]._value" id="bfr"/>
					        <input class="nui-hidden" name="criteria._expr[1]._property" value="scrapOperator"/>
					        <input class="nui-hidden" name="criteria._expr[1]._op" value="in" id="tempcond11"/>
					        <input class="nui-hidden" name="criteria._expr[1]._ref" value="1" id="tempcond12"/>
					        <input class="nui-hidden" name="criteria._ref[0]._id" value="1"/>
					        <input class="nui-hidden" name="criteria._ref[0]._select._field[0]" value="userid"/>
					        <input class="nui-hidden" name="criteria._ref[0]._entity" value="org.gocom.abframe.dataset.organization.OmEmployee"/>
					        <input class="nui-hidden" name="criteria._ref[0]._expr[0]._property" value="empname">
					        <input class="nui-hidden" name="criteria._ref[0]._expr[0]._op" value="like"/>
					        <input class="nui-hidden" name="criteria._ref[0]._expr[0]._likeRule" value="all"/>
					    </td>-->
					    <td align="right"><span>资产父类型：</span></td>
		            	<td align="left">
		            		<input class="nui-dictcombobox" name="criteria._expr[1].type" dictTypeId="MIS_MA_TYPE" multiSelect="true" onvaluechanged="onTypeFilterChanged"/>
		            		<input class="nui-hidden" name="criteria._expr[1]._op" value="in"/>
					    </td>
					    <td align="right"><span>资产原值：</span></td>
		            	<td align="left">
		            		<input class="nui-textbox" name="criteria._expr[8]._min" width="80px"/>-<input class="nui-textbox" name="criteria._expr[8]._max" width="80px"/>
		            		<input class="nui-hidden" name="criteria._expr[8]._property" value="assetAmount"/>
					        <input class="nui-hidden" name="criteria._expr[8]._op" value="between"/>
					    </td>
					    <td align="right"><span>负责人：</span></td>
		            	<td align="left">
					        <input class="nui-textbox" name="criteria._ref[1]._expr[0]._value" id="fzr"/>
		            		<input class="nui-hidden" name="criteria._expr[10]._property" value="usingemp"/>
					        <input class="nui-hidden" name="criteria._expr[10]._op" value="in" id="tempcond31"/>
					        <input class="nui-hidden" name="criteria._expr[10]._ref" value="3" id="tempcond32"/>
					        <input class="nui-hidden" name="criteria._ref[1]._id" value="3"/>
					        <input class="nui-hidden" name="criteria._ref[1]._select._field[0]" value="userid"/>
					        <input class="nui-hidden" name="criteria._ref[1]._entity" value="org.gocom.abframe.dataset.organization.OmEmployee"/>
					        <input class="nui-hidden" name="criteria._ref[1]._expr[0]._property" value="empname">
					        <input class="nui-hidden" name="criteria._ref[1]._expr[0]._op" value="like"/>
					        <input class="nui-hidden" name="criteria._ref[1]._expr[0]._likeRule" value="all"/>
					    </td>
		    		</tr>
		    		<tr>
		    			<td align="right"><span>操作日期：</span></td>
		            	<td align="left">
		            		<input class="nui-datepicker" name="criteria._expr[15]._min" style="width:100px"/>-<input class="nui-datepicker" name="criteria._expr[15]._max" style="width:100px"/>
					        <input class="nui-hidden" name="criteria._expr[15]._property" value="operatingTime"/>
					        <input class="nui-hidden" name="criteria._expr[15]._op" value="between"/>
					        <input class="nui-hidden" name="criteria._expr[15]._pattern" value="yyyy-MM-dd"/>
					    </td>
					    <td align="right"><span>资产子类型：</span></td>
		            	<td align="left">
		            		<input class="nui-dictcombobox" name="criteria._expr[5].secType" dictTypeId="MIS_MA_SECTYPE" multiSelect="true" id="sectype"/>
		            		<input class="nui-hidden" name="criteria._expr[5]._op" value="in"/>
					    </td>
					    <td align="right"><span>管理方式：</span></td>
		            	<td align="left">
		            		<input class="nui-dictcombobox" name="criteria._expr[2]._value" dictTypeId="MIS_MA_STORAGE" multiSelect="true" width="165px"/>
		            		<input class="nui-hidden" name="criteria._expr[2]._property" value="storageType"/>
					        <input class="nui-hidden" name="criteria._expr[2]._op" value="in"/>
					    </td>
					    <td align="right"><span>资产编号：</span></td>
		            	<td align="left">
		            		<input class="nui-textbox" name="criteria._expr[9]._value"/>
		            		<input class="nui-hidden" name="criteria._expr[9]._property" value="assetnum"/>
					        <input class="nui-hidden" name="criteria._expr[9]._op" value="like"/>
					        <input class="nui-hidden" name="criteria._expr[9]._likeRule" value="all"/>
					    </td>
		    		</tr>
		    		<tr>
		    			<td align="right"><span>报废时间：</span></td>
		            	<td align="left">
		            		<input class="nui-datepicker" name="criteria._expr[4]._min" style="width:100px"/>-<input class="nui-datepicker" name="criteria._expr[4]._max" style="width:100px"/>
					        <input class="nui-hidden" name="criteria._expr[4]._property" value="scrapTime"/>
					        <input class="nui-hidden" name="criteria._expr[4]._op" value="between"/>
					        <input class="nui-hidden" name="criteria._expr[4]._pattern" value="yyyy-MM-dd"/>
					    </td>
					    <td align="right"><span>资产分类：</span></td>
		            	<td align="left">
		            		<input class="nui-dictcombobox" name="criteria._expr[14]._value" showNullItem="true" dictTypeId="MIS_MA_GUOTENG" />
		            		<input class="nui-hidden" name="criteria._expr[14]._property" value="isguoteng" />
					        <input class="nui-hidden" name="criteria._expr[14]._op" value="="/>
					    </td>
					     <td align="right"><span>区域：</span></td>
		            	<td align="left">
		            		<input class="nui-dictcombobox" name="criteria._expr[3]._value" showNullItem="true" dictTypeId="EXP_REGION" width="165px"/>
		            		<input class="nui-hidden" name="criteria._expr[3]._property" value="area"/>
					        <input class="nui-hidden" name="criteria._expr[3]._op" value="="/>
					    <!--<input class="nui-hidden" name="criteria._expr[3]._likeRule" value="all"/> -->
					    </td>
					    <td align="right"><span>品牌：</span></td>
		            	<td align="left">
		            		<input class="nui-textbox" name="criteria._expr[11].brand"/>
					        <input class="nui-hidden" name="criteria._expr[11]._op" value="like"/>
					        <input class="nui-hidden" name="criteria._expr[11]._likeRule" value="all"/>
					    </td>
					</tr>
					<tr>
		    			<td align="right"><span>资产领取日期：</span></td>
		            	<td align="left">
		            		<input class="nui-datepicker" name="criteria._expr[17]._min" style="width:100px"/>-<input class="nui-datepicker" name="criteria._expr[17]._max" style="width:100px"/>
					        <input class="nui-hidden" name="criteria._expr[17]._property" value="startusedate"/>
					        <input class="nui-hidden" name="criteria._expr[17]._op" value="between"/>
					        <input class="nui-hidden" name="criteria._expr[17]._pattern" value="yyyy-MM-dd"/>
					    </td>
		    			<td align="right"><span>状态：</span></td>
		            	<td align="left">
		            		<input class="nui-dictcombobox" name="criteria._expr[7]._value" id="status" dictTypeId="MIS_MA_STATUS" multiSelect="true"/>
		            		<input class="nui-hidden" name="criteria._expr[7]._property" value="status"/>
					        <input class="nui-hidden" name="criteria._expr[7]._op" value="in"/>
					    </td>
					    <td align="right"><span>资产所属部门：</span></td>
		            	<td align="left">
					        <input class="nui-combobox" name="criteria._ref[0]._expr[0]._value" id="ssbm"
					               textField="orgname" valueField="orgseq" dataField="orgs" showNullItem="true" allowInput="true" width="165px"/>
		            		<input class="nui-hidden" name="criteria._expr[6]._property" value="dept"/>
					        <input class="nui-hidden" name="criteria._expr[6]._op" value="in" id="tempcond21"/>
					        <input class="nui-hidden" name="criteria._expr[6]._ref" value="2" id="tempcond22"/>
					        <input class="nui-hidden" name="criteria._ref[0]._id" value="2"/>
					        <input class="nui-hidden" name="criteria._ref[0]._select._field[0]" value="orgid"/>
					        <input class="nui-hidden" name="criteria._ref[0]._entity" value="org.gocom.abframe.dataset.organization.OmOrganization"/>
					        <input class="nui-hidden" name="criteria._ref[0]._expr[0]._property" value="orgseq"/>
					        <input class="nui-hidden" name="criteria._ref[0]._expr[0]._op" value="like"/>
					        <input class="nui-hidden" name="criteria._ref[0]._expr[0]._likeRule" value="all"/>
					        
		            		<input class="nui-hidden" name="criteria._or[0]._expr[0]._property" value="dept"/> 
					        <input class="nui-hidden" name="criteria._or[0]._expr[0]._op" value="in"/>
					        <input class="nui-hidden" name="criteria._or[0]._expr[0]._value" id="orgids"/>
					        
					        <input class="nui-hidden" name="criteria._or[0]._expr[1]._property" value="usingemp"/>
					        <input class="nui-hidden" name="criteria._or[0]._expr[1]._op" value="="/>
					        <input class="nui-hidden" name="criteria._or[0]._expr[1]._value" id="userid1"/>
					        
					        <input class="nui-hidden" name="criteria._or[0]._expr[2]._property" value="empdeptorgid"/> 
					        <input class="nui-hidden" name="criteria._or[0]._expr[2]._op" value="in"/>
					        <input class="nui-hidden" name="criteria._or[0]._expr[2]._value" id="empdeptorgids"/>
					    </td>
					    <td align="right"><span>备注：</span></td>
		            	<td align="left" colspan="7">
		            		<input class="nui-textbox" name="criteria._expr[18].remarks"/>
					        <input class="nui-hidden" name="criteria._expr[18]._op" value="like"/>
					        <input class="nui-hidden" name="criteria._expr[18]._likeRule" value="all"/>
					    </td>	
		    		</tr>
		    		<tr>
		    			<td align="right"><span>资产变更时间：</span></td>
		            	<td align="left">
		            		<input class="nui-datepicker" name="criteria._expr[16]._min" style="width:100px"/>-<input class="nui-datepicker" name="criteria._expr[16]._max" style="width:100px"/>
					        <input class="nui-hidden" name="criteria._expr[16]._property" value="lastoperatingtime"/>
					        <input class="nui-hidden" name="criteria._expr[16]._op" value="between"/>
					        <input class="nui-hidden" name="criteria._expr[16]._pattern" value="yyyy-MM-dd"/>
					    </td>
				    	<td align="right"><span>项目编号：</span></td>
		            	<td align="left">
		            		<input class="nui-textbox" name="criteria._expr[12].projectno"/>
					        <input class="nui-hidden" name="criteria._expr[12]._op" value="like"/>
					        <input class="nui-hidden" name="criteria._expr[12]._likeRule" value="all"/>
					    </td>
					    <td align="right"><span>折旧完成日期：</span></td>
		            	<td align="left">
		            		<input class="nui-datepicker" name="criteria._expr[19]._min" style="width:100px"/>-<input class="nui-datepicker" name="criteria._expr[19]._max" style="width:100px"/>
					        <input class="nui-hidden" name="criteria._expr[19]._property" value="zjwcrq"/>
					        <input class="nui-hidden" name="criteria._expr[19]._op" value="between"/>
					        <input class="nui-hidden" name="criteria._expr[19]._pattern" value="yyyy-MM-dd"/>
					    </td>
					    <td align="right"><span>项目名称：</span></td>
		            	<td align="left">
					        <input class="nui-textbox" name="criteria._ref[2]._expr[0]._value" id="projectno"/>
		            		<input class="nui-hidden" name="criteria._expr[13]._property" value="projectno"/>
					        <input class="nui-hidden" name="criteria._expr[13]._op" value="in" id="tempcond33"/>
					        <input class="nui-hidden" name="criteria._expr[13]._ref" value="4" id="tempcond34"/>
					        <input class="nui-hidden" name="criteria._ref[2]._id" value="4"/>
					        <input class="nui-hidden" name="criteria._ref[2]._select._field[0]" value="projectno"/>
					        <input class="nui-hidden" name="criteria._ref[2]._entity" value="com.primeton.rdmgr.data.rd.RdProject"/>
					        <input class="nui-hidden" name="criteria._ref[2]._expr[0]._property" value="projectName">
					        <input class="nui-hidden" name="criteria._ref[2]._expr[0]._op" value="like" >
					        <input class="nui-hidden" name="criteria._ref[2]._expr[0]._likeRule" value="all">
					    </td>
					 </tr>
					 <tr>
					 	<td align="right"><span>人员所属部门：</span></td>
		            	<td align="left">
					        <input id="empdeptseq"  name="criteria._expr[20]._value"  class="nui-combobox" 
						    textField="orgname" valueField="orgseq" dataField="orgs" showNullItem="true" allowInput="true" style="width:200px;"/>
					        <input class="nui-hidden" name="criteria._expr[20]._property" value="empdeptseq"/>
					        <input class="nui-hidden" name="criteria._expr[20]._op" value="like"/>
					        <input class="nui-hidden" name="criteria._expr[20]._likeRule" value="end"/>
					        
					    </td>
					 </tr>
		    		<tr>
		    			<td colspan="8" align="center">
							<a class="nui-button" id="search" iconCls="icon-search" onclick="search()">查找</a>
							<a class="nui-button" id="reset" iconCls="icon-reload" onclick="reset">重置</a>
						</td>
		    		</tr>
		    	</table>
	    	</div>
	    </div>
	    <div style="width:100%;">
	        <div class="nui-toolbar" style="border-bottom:0;padding:0px;">
	            <table style="width:100%;">
	            	<tr>
	            		<td>
	                        <a class="nui-button" id="addBtn" iconCls="icon-add" onclick="add">增加</a>
	                        <a class="nui-button" id="updateBtn" iconCls="icon-edit" onclick="edit">编辑</a>
	                        <a class="nui-button" id="updateBatchBtn" iconCls="icon-goto" onclick="modifyBatch">资产变更</a> 
	                        <a class="nui-button" id="addExBtn" iconCls="icon-addfolder" onClick="importExcel">Excel批量增加</a>   
	                        <a class="nui-button" id="discardeBtnExcel" iconCls="icon-remove" onclick="scrapExcel">Excel上传报废</a>
	                        <a class="nui-button" id="machineChangeQuery" iconCls="icon-search" onclick="machineChangQuery">查看设备变更表</a>
	                        <a class="nui-button" id="exportCurrentExcel" iconCls="icon-download" onclick="exportCurrent">导出明细表</a>
	                        <a class="nui-button" id="discardBatchBtn" iconCls="icon-remove" onclick="discardBatch">批量报废</a>
	                    </td>
	                </tr>
	            </table>           
	        </div>
    	</div>
	    <div id="datagrid1" class="nui-datagrid" style="width:auto;height:auto;" frozenStartColumn="0" frozenEndColumn="5" 
	            url="com.primeton.eos.machine.machine.machineQuery.biz.ext" dataField="machinedata" 
	            idField="assetid"  sizeList="[10,20,50,100,1000,10000]" pageSize="10" multiSelect="true" onload="onGridLoad" onselectionchanged="onSelectionChanged" showSummaryRow="true" 
	            allowCellEdit="true" allowCellSelect="true">
	        <div property="columns">
	        	<div type="checkcolumn"></div>
	        	<div field="assetid" width="0" headerAlign="center">资产id</div>
	        	<div field="assetnum" width="80" headerAlign="center" renderer="onActionRenderer" allowSort="true">资产编号</div>
	        	<div field="buytime"width="80" headerAlign="center" dateFormat="yyyy-MM-dd" allowSort="true">购买日期</div>
	        	<div field="depreciableTime"width="80" headerAlign="center" allowSort="true">折旧期限(月)</div>
	        	<div field="zjwcrq"width="80" headerAlign="center" dateFormat="yyyy-MM-dd" allowSort="true">折旧完成日期</div>
	        	<div field="assetAmount" width="100" headerAlign="center" dataType="currency" currencyUnit="￥" allowSort="true" summaryType="sum">资产原值(元)</div>
	        	<div field="type"width="80" renderer="dictType" headerAlign="center" allowSort="true">资产父类型</div>
	        	<div field="secType"width="80" renderer="dictSecType" headerAlign="center" allowSort="true">资产子类型</div>
	        	<div field="status"width="50" renderer="dictStatus" headerAlign="center" allowSort="true">状态</div>
	        	<div field="area" renderer="dictArea" width="50" headerAlign="center" allowSort="true">区域</div>
	        	<div field="storageType"width="50" renderer="dictStorageType" headerAlign="center" allowSort="true">管理类型</div>
	        	<div field="emp"width="60" headerAlign="center">负责人</div>
	        	<div field="empdeptname" width="120" headerAlign="center">负责人所属部门</div>
	        	<div field="deptname" width="120" headerAlign="center">资产所属部门</div>
	        	<div field="isguoteng" renderer="dictIsGuoteng" width="100" headerAlign="center">资产分类</div>
	        	<div field="projectno" width="100" headerAlign="center">项目编号</div>
	        	<div field="projectName" renderer="getProjectNameDetail" width="100" headerAlign="center">项目名称</div>
	        	<div field="projectorgname" width="100" headerAlign="center">项目受益部门</div>
	        	<div field="brand"width="100" headerAlign="center" allowSort="true">品牌</div>
	        	<div field="configuration"width="120" headerAlign="center" allowSort="true">配置</div>
	        	<div field="startusedate"width="80" headerAlign="center" allowSort="true">资产领取日期</div>
	        </div>
	    </div>
		</div>
	<form name="viewlist1" id="viewlist1" action="com.primeton.eos.ame_common.ameExportCommon.flow" method="post">
		<input type="hidden" name="_eosFlowAction" value="action0" filter="false"/>
		<input type="hidden" name="downloadFile" filter="false"/>
		<input type="hidden" name="fileName" filter="false"/>
	</form>   

<script type="text/javascript">
	var form = new nui.Form("#form1");
	nui.parse();
	var grid=nui.get("datagrid1");
	init();
	
	function init(){
		var isAdmin=false;
		var isFinance=false;
		<% 
	    		UserObject user = (UserObject)session.getAttribute("userObject");
	    		String nowuserid = user.getUserId();
	    		String nowusername = user.getUserName();
	    		String userorgid=user.getUserOrgId();
    		%>
    		<l:iterate id="roles" property="userObject/attributes/roles" scope="session">
				var roleid = "<b:write iterateId='roles' property='roleid'/>";
				if(roleid=="admin"){
					isAdmin=true;
				}else if(roleid=="finance"){
					isFinance = true;
				}
			</l:iterate>
		if(isFinance == true && isAdmin == true){
			nui.get("status").setValue("0,1,2,3");
		} else if(isFinance == true && isAdmin != true){
			document.getElementById("addBtn").style.display = "none";
			document.getElementById("addExBtn").style.display = "none";
			document.getElementById("machineChangeQuery").style.display = "none";
			document.getElementById("discardBatchBtn").style.display = "none";
			nui.get("status").setValue("0,1,2,3");
		} else if(isAdmin == true && isFinance != true){
			document.getElementById("discardeBtnExcel").style.display = "none";
			nui.get("status").setValue("0,1,2,3");
		} else {
			document.getElementById("addExBtn").style.display = "none";
			document.getElementById("addBtn").style.display = "none";
			document.getElementById("machineChangeQuery").style.display = "none";
			document.getElementById("discardeBtnExcel").style.display = "none";
			document.getElementById("exportCurrentExcel").style.display = "none";
			document.getElementById("discardBatchBtn").style.display = "none";
		}
		//机构权限初始化
		//code:对应功能编码，map：对于机构的查询条件
					
		var json = {"code":"machineManager","map":{"property":"status","op":"=","value":"running"}};
		nui.ajax({
			url:"com.primeton.eos.ame_auth.ame_auth.getownorg1.biz.ext",
			data:json,
			type:'POST',
			contentType:'text/json',
			success:function(text){
				if(text.orgs){
					if(text.orgs.length==0){
						// 没有有权的机构时只能查项目负责人为自己的数据
						nui.get("fzr").setValue('<%=nowusername %>');
						nui.get("fzr").setReadOnly(true);
					}
					var isall;//是否拥有全公司的权限
					for(var i=0;i<text.orgs.length;i++){
						if(text.orgs[i].orgid == "1"){
							isall = "1";
							break;
						}
					}
					//如果拥有全公司的权限就取消部门限制
					if(isall == "1"){
					
					}else{
						nui.get("orgids").setValue(text.orgids);
						nui.get("empdeptorgids").setValue(text.orgids);
						nui.get("userid1").setValue('<%=nowuserid %>');
					}
					nui.get("ssbm").setData(text.orgs);
					nui.get("empdeptseq").setData(text.orgs);
					
				}else{
					// 没有有权的机构时只能查项目负责人为自己的数据
						nui.get("fzr").setValue('<%=nowusername %>');
						nui.get("fzr").setReadOnly(true);
				}
				search();
				
			}
		});		
		
	}
	
	function search(){
		if(nui.get("ssbm").getValue()==""){
			nui.get("tempcond21").setValue("=");
			nui.get("tempcond22").setValue("");
		} else {
			nui.get("tempcond21").setValue("in");
			nui.get("tempcond22").setValue("2");
		}
		if(nui.get("fzr").getValue()==""){
			nui.get("tempcond31").setValue("=");
			nui.get("tempcond32").setValue("");
		} else {
			nui.get("tempcond31").setValue("in");
			nui.get("tempcond32").setValue("3");
		}
		if(nui.get("projectno").getValue()==""){
			nui.get("tempcond33").setValue("=");
			nui.get("tempcond34").setValue("");
		} else {
			nui.get("tempcond33").setValue("in");
			nui.get("tempcond34").setValue("4");
		}
		var form = new nui.Form("#form1");
		var data = form.getData();
        grid.load(data);
		grid.sortBy("assetid","desc");
	}

 	function onActionRenderer(e) {
 		return "<a href='javascript:void(0)' onclick='doView();' title='点击查看'>" + e.value + "</a>";
 	}
 
 	function doView(){
 		var selectRow = grid.getSelected();
		var executeUrl = "/default/machine/machineDetail.jsp?id=" + selectRow.assetid;
		window.open(executeUrl, "机器详细信息", "fullscreen=1");
    }
	function getProjectNameDetail(e){
    	if(e.value){
    		return "<a href='javascript:void(0)' onclick='checkProjectName();' title='点击查看'>" + e.value + "</a>";
    	}
    }
    function checkProjectName(){
    	var selectRow = grid.getSelected();
		var executeUrl = "/default/project/rdproject/projectDetail.jsp?projid=" + selectRow.projectId;
		window.open(executeUrl);
    }
	function modifyBatch(){
		var rows = grid.getSelecteds();
		var id="";
		var status=0;
		if(rows.length<1){
			nui.alert("请至少选择一条资产数据进行变更！");
			return;
		}
		for(var i=0;i<rows.length;i++){
			if(i==0){
				id+=rows[i].assetid.toString();
			}else{
				id+=","+rows[i].assetid.toString();
			}
			status = rows[i].status;
			if(status == 4){
				nui.alert("已报废的资产不能变更!");
				return;
			}
			if(rows[i].usingemp != '<%=nowuserid %>'){
				nui.alert("只能更改负责人为本人的资产，请重新选择");
				return;
			}			
		}
		nui.open({
			url:"<%=request.getContextPath() %>/machine/machineModifyBatch.jsp",
			title:"资产变更" , width:1100 ,  height:400,
			onload:function(){
				var iframe = this.getIFrameEl();
                var data = { id: id };
                iframe.contentWindow.SetData(data);
			}
		});
	}
	
	function edit() {
		var rows = grid.getSelecteds();
    	if (rows.length > 1) {
    		nui.alert("只能选中一条资产进行编辑");
    	}else{
			var row = grid.getSelected();
	    	if(!row){
				nui.alert("请选择其中一条资产数据!");
				return;
			}
	    	if(row.status == 4){
				nui.alert("已报废的资产无法编辑");    	
	    	} else {
	            if (row) {
	                nui.open({
	                    url: "<%=request.getContextPath() %>/machine/machineModify.jsp",
	                    title: "编辑资产", width: 900, height: 500,
	                    onload: function () {
	                        var iframe = this.getIFrameEl();
	                        var data = { action: "edit", id: row.assetid };
	                        iframe.contentWindow.SetData(data);
	                    },
	                    ondestroy: function (action) {
	                        if(action=='save'){
		        	        	grid.reload();
		        	        	nui.alert("资产编辑成功！");
		                	}
	                    }
	                });
	            } 
       		}
       }
    }

	function add() {
            nui.open({
                url: "<%=request.getContextPath() %>/machine/machineModify.jsp",
                title: "新增资产", width: 900, height: 500,
                onload: function () {
                    var iframe = this.getIFrameEl();
                    var data = { action: "new"};
                    iframe.contentWindow.SetData(data);
                },
                ondestroy: function (action) {
      	       		if(action=='save'){
        	        	grid.reload();
//        	        	nui.showTips({content:"资产添加成功！",timeout:10000});
        	        	nui.alert("资产添加成功！");
                	}
                }
            });
        }

	function importExcel(){
   		nui.open({
   			url:"<%=request.getContextPath()%>/machine/importExcel.jsp",
   			title:"选择要导入的Excel",
   			width:650,
   			height:380,
   			ondestory: function (action){
   				alert("action = " + action );
        		grid.reload();
               
   			}
   		});
   	}
	
	function scrapExcel(){
		nui.open({
   			url:"<%=request.getContextPath()%>/machine/scrapExcel.jsp",
   			title:"选择要导入的Excel",
   			width:1050,
   			height:380,
   			ondestory: function (action){
   				if(action == 'success'){
        	        grid.reload();
                }
   			}
   		});
	}
	
	function onTypeFilterChanged(e){
		var tempType = e.value;
		getSecType(tempType);
	}
	
	function getSecType(tempType){
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
            }
    	});
    }
	
	function dictType(e){
		return nui.getDictText("MIS_MA_TYPE",e.value);
	}
	function dictIsGuoteng(e){
		return nui.getDictText("MIS_MA_GUOTENG",e.value);
	}
	
	function dictSecType(e){
		return nui.getDictText("MIS_MA_SECTYPE",e.value);
	}
	
	function dictStorageType(e){
		return nui.getDictText("MIS_MA_STORAGE",e.value);
	}
	
	function dictStatus(e){
		return nui.getDictText("MIS_MA_STATUS",e.value);
	}
	
	function dictArea(e){
		return nui.getDictText("EXP_REGION",e.value);
	}
	
    function exportCurrent(){
        var json = form.getData();
			nui.ajax({
                url: "com.primeton.eos.machine.machine.exportCurrentExcel.biz.ext",
                type: "post",
                data: json,
                cache: false,
                contentType: 'text/json',
                success: function (o) {
             	nui.unmask();
                	var filePath = o.downloadFile;
                	var fileName = "currentMachine";
                	var myDate = new Date();
                	var year = myDate.getYear();
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
                	alert("error");
                }
            });	
    }
        
	function showDept(){
    	var btnEdit = this;
		nui.open({
            url:"<%=request.getContextPath() %>/machine/SelectOrganization.jsp",
			title: "选择列表",
			width: 650,
			height: 380,
			ondestroy: function (action) {
                if (action == "ok") {
                    var iframe = this.getIFrameEl();
                    var data = iframe.contentWindow.GetData();
                    data = nui.clone(data);    //必须克隆
                    if (data) {                  	
						btnEdit.setValue(data.orgid);
		                btnEdit.setText(data.orgname);
                    }
                }
			}
        });
    }
    
	function reset(){
		var form = new nui.Form("#form1");
		form.reset();
		init();
	}
	
	function machineChangQuery(){
		nui.open({
   			url:"<%=request.getContextPath()%>/machine/machineChangeQuery.jsp",
   			title:"变更日志表",
   			width:980,
   			height:680,
   			ondestory: function (action){
   				grid.reload();
   			}
   		});
	}
	
	function onCancel(e) {
		if (window.CloseOwnerWindow) 
			return window.CloseOwnerWindow(e);
        else window.close();  
    }
    
    function discardBatch() {
		var rowdata = grid.getSelecteds();
		if(rowdata.length == 0){
			nui.alert("请至少选择一条资产数据进行报废！");
			return;
		}
		var selectids1;
		for(var i=0;i<rowdata.length;i++){
			if(rowdata[i].status == 4){
				nui.alert("已报废的资产不能报废!");
				return;
			}else{
				if(selectids1==""||selectids1==null){
					selectids1 = rowdata[i].assetid;
				}else{
					selectids1 = selectids1+","+rowdata[i].assetid;
				}
			}
		}
		nui.open({
			url:"<%=request.getContextPath() %>/machine/machineDiscardBatch.jsp",
			title:"批量报废" , width:1100 ,  height:400,
			onload:function(){
				var iframe = this.getIFrameEl();
                var data = { id: selectids1 };
                iframe.contentWindow.SetData(data);
			}
		});
    	
    }
    var selectids = "";
    var statuss = "";
    function onGridLoad(e) {
    	var strs = new Array();
	    strs = selectids.split(",");
    	for(var i=0;i<grid.getResultObject().data.length;i++){
    		for(var j=0;j<strs.length;j++){
    			if(grid.getResultObject().data[i].assetid == strs[j]){
    				grid.select(grid.getRow(i));
    			}
    		}
    	}
    }
    function onSelectionChanged(e) {
    	if(e.select == true){
	    	if(selectids == ""){
	    		selectids = selectids + e.records[0].assetid;
	    		statuss = statuss + e.records[0].status;
	    	}else{
	    		var strs = new Array();
	    		var str1s = new Array();
	    		strs = selectids.split(",");
	    		str1s = statuss.split(",");
	    		var isExists = false;
	    		for(var i=0;i<strs.length;i++){
	    			if(strs[i] == e.records[0].assetid){
	    				isExists = true;
	    			}
	    		}
	    		if(isExists == false){
	    			selectids = selectids + "," + e.records[0].assetid;
	    			statuss = statuss + "," + e.records[0].status;
	    		}
	    	}
	    }else{
	    	if(selectids == ""){
	    		
	    	}else{
	    		var strs = new Array();
	    		var str1s = new Array();
	    		strs = selectids.split(",");
	    		str1s = statuss.split(",");
	    		for(var i=0;i<strs.length;i++){
	    			if(strs[i] == e.records[0].assetid){
	    				strs.splice(i,1);
	    				str1s.splice(i,1);
	    			}
	    		}
	    		selectids = strs.join(",");
	    		statuss = str1s.join(",");
	    	}
	    }
    }
</script>
</body>
</html>
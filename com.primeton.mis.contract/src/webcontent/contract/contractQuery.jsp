<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@page import="com.eos.data.datacontext.UserObject"%>
<%@page import="commonj.sdo.DataObject"%>
<%@page import="java.util.Map"%>
<html>
<!-- 
  - Author(s): huangqj
  - Date: 2014-01-02 13:46:35
  - Description:
-->
<head>
	<title>合同信息管理</title>
	<meta http-equiv="content-type" content="text/html; charset=UTF-8" />
	<script src="<%= request.getContextPath() %>/common/nui/nui.js" type="text/javascript"></script>
</head>
<body>
	<div class="nui-panel" title="合同信息查询" style="width:100%;">
		<div id="form1">
			<input class="nui-hidden" name="sortField" value="contractid"/>
			<input class="nui-hidden" name="sortOrder" value="desc"/>
			<div class="nui-toolbar" style="border-bottom:0;padding:0px;">
				<table style="width:100%;">
					<tr>
		            	<td align="right" style="width: 140px;"><span>合同存档编号：</span></td>
		            	<td align="left">
		            		<input class="nui-textbox" name="criteria._expr[0]._value" style="width: 110px;"/>
		            		<input class="nui-hidden" name="criteria._expr[0]._property" value="contnum"/>
					        <input class="nui-hidden" name="criteria._expr[0]._op" value="like"/>
					        <input class="nui-hidden" name="criteria._expr[0]._likeRule" value="all"/>
					    </td>
			        	<td align="right" style="width: 170px;"><span>合同登记日期：</span></td>
		            	<td align="left" style="width: 220px;">
		            		<input class="nui-datepicker" name="criteria._expr[1]._min" style="width:98px"/>-<input class="nui-datepicker" name="criteria._expr[1]._max" style="width:98px"/>
					        <input class="nui-hidden" name="criteria._expr[1]._property" value="contreg"/>
					        <input class="nui-hidden" name="criteria._expr[1]._op" value="between"/>
					        <input class="nui-hidden" name="criteria._expr[1]._pattern" value="yyyy-MM-dd"/>
					    </td>
		            	<td align="right" style="width: 120px;"><span>合同类型：</span></td>
		            	<td align="left">
		            		<input class="nui-dictcombobox" name="criteria._expr[2]._value" dictTypeId="MIS_CONTRACTTYPE" multiSelect="true" style="width: 120px;"/>
		            		<input class="nui-hidden" name="criteria._expr[2]._property" value="contracttype"/>
		            		<input class="nui-hidden" name="criteria._expr[2]._op" value="in"/>
					    </td>
					    <td align="right" style="width: 130px;"><span>合同项目名称：</span></td>
		            	<td align="left"style="width: 210px;">
		            		<input class="nui-textbox" name="criteria._expr[3]._value" style="width: 200px;"/>
		            		<input class="nui-hidden" name="criteria._expr[3]._property" value="projectname"/>
					        <input class="nui-hidden" name="criteria._expr[3]._op" value="like"/>
					        <input class="nui-hidden" name="criteria._expr[3]._likeRule" value="all"/>
					    </td>
					</tr>
					<tr>
						<td align="right"><span>合同订单编号：</span></td>
		            	<td>
		            		<input class="nui-textbox" name="criteria._ref[3]._expr[1]._value" id="contorderno" style="width: 110px;"/>
					        <input class="nui-hidden" name="criteria._ref[3]._expr[1]._property" value="contorderno"/>
					        <input class="nui-hidden" name="criteria._ref[3]._expr[1]._op" value="like"/>
					        <input class="nui-hidden" name="criteria._ref[3]._expr[1]._likeRule" value="all"/>
					    </td>
					    <td align="right"><span>订单登记日期：</span></td>
		            	<td>
		            		<input class="nui-datepicker" id="orderreg1" name="criteria._ref[3]._expr[0]._min" style="width:98px"/>-<input class="nui-datepicker" id="orderreg2" name="criteria._ref[3]._expr[0]._max" style="width:98px"/>
		            		<input class="nui-hidden" name="criteria._expr[18]._property" value="contractid"/>
					        <input class="nui-hidden" name="criteria._expr[18]._op" value="in" id="tempCond41"/>
					        <input class="nui-hidden" name="criteria._expr[18]._ref" value="4" id="tempCond42"/>
					        <input class="nui-hidden" name="criteria._ref[3]._id" value="4"/>
					        <input class="nui-hidden" name="criteria._ref[3]._entity" value="com.primeton.mis.contract.contract.CsContOrder"/>
					        <input class="nui-hidden" name="criteria._ref[3]._select._field[0]" value="contractid"/>
					        <input class="nui-hidden" name="criteria._ref[3]._expr[0]._property" value="orderreg"/>
					        <input class="nui-hidden" name="criteria._ref[3]._expr[0]._op" value="between"/>
					        <input class="nui-hidden" name="criteria._ref[3]._expr[0]._pattern" value="yyyy-MM-dd"/>
					    </td>
					    <td align="right"><span>行业：</span></td>
		            	<td>
		            		<input class="nui-dictcombobox" name="criteria._expr[15]._value" dictTypeId="MIS_INDUSTRY_SUBDIVISION" id="industry" multiSelect="true" style="width: 120px;"/>
		            		<input class="nui-hidden" name="criteria._expr[15]._property" value="industry"/>
		            		<input class="nui-hidden" name="criteria._expr[15]._op" value="in"/>
					    </td>
					    <td align="right"><span>签署单位：</span></td>
		            	<td align="left">
		            		<input class="nui-textbox" name="criteria._ref[4]._expr[0]._value" id="custname" style="width: 200px;"/>
		            		<input class="nui-hidden" name="criteria._expr[4]._property" value="custid"/>
					        <input class="nui-hidden" name="criteria._expr[4]._op" value="in" id="tempCond51"/>
					        <input class="nui-hidden" name="criteria._expr[4]._ref" value="5" id="tempCond52"/>
					        <input class="nui-hidden" name="criteria._ref[4]._id" value="5"/>
					        <input class="nui-hidden" name="criteria._ref[4]._entity" value="com.primeton.mis.contract.contract.MisCustinfo"/>
					        <input class="nui-hidden" name="criteria._ref[4]._select._field[0]" value="custid"/>
					        <input class="nui-hidden" name="criteria._ref[4]._expr[0]._property" value="custname"/>
					        <input class="nui-hidden" name="criteria._ref[4]._expr[0]._op" value="like"/>
					        <input class="nui-hidden" name="criteria._ref[4]._expr[0]._likeRule" value="all"/>
					    </td>
					</tr>
					<tr>
						<td align="right"><span>合同状态：</span></td>
		            	<td>
		            		<input class="nui-dictcombobox" name="criteria._expr[19]._value" dictTypeId="CS_CONTRACTTYPE" multiSelect="true" style="width: 110px;"/>
		            		<input class="nui-hidden" name="criteria._expr[19]._property" value="status"/>
		            		<input class="nui-hidden" name="criteria._expr[19]._op" value="in"/>
					    </td>
					    <td align="right"><span>合同总金额：</span></td>
					    <td>
		            		<input class="nui-textbox" name="criteria._expr[5]._min" style="width:98px"/>-<input class="nui-textbox" name="criteria._expr[5]._max" style="width:98px"/>
					        <input class="nui-hidden" name="criteria._expr[5]._property" value="contsum"/>
					        <input class="nui-hidden" name="criteria._expr[5]._op" value="between"/>
					    </td>
					    <!-- <td align="right"><span>事业部：</span></td>
		            	<td>
		            		<input class="nui-dictcombobox" id="org" name="criteria._expr[10]._value" dictTypeId="CONT_ORG" showNullItem="true" nullItemText="全部" style="width: 110px;"/>
		            		<input class="nui-hidden" name="criteria._expr[10]._property" value="org"/>
					        <input class="nui-hidden" name="criteria._expr[10]._op" value="like"/>
					        <input class="nui-hidden" name="criteria._expr[10]._likeRule" value="all"/>
					    </td> -->
		            	<td align="right"><span>是否400转化：</span></td>
		            	<td>
		            		<input class="nui-dictcombobox" name="criteria._expr[7]._value" dictTypeId="MIS_YN" showNullItem="true" nullItemText="全部" style="width: 120px;"/>
					    	<input class="nui-hidden" name="criteria._expr[7]._property" value="istrans"/>
					    </td>
					    <td align="right"><span>所属集团客户：</span></td>
		            	<td align="left">
		            		<input class="nui-textbox" name="criteria._ref[5]._expr[0]._value" id="groupno" style="width: 200px;"/>
		            		<input class="nui-hidden" name="criteria._expr[24]._property" value="custid"/>
					        <input class="nui-hidden" name="criteria._expr[24]._op" value="in" id="tempCond71"/>
					        <input class="nui-hidden" name="criteria._expr[24]._ref" value="7" id="tempCond72"/>
					        <input class="nui-hidden" name="criteria._ref[5]._id" value="7"/>
					        <input class="nui-hidden" name="criteria._ref[5]._entity" value="com.primeton.rdmgr.data.csomsData.MisCustinfo"/>
					        <input class="nui-hidden" name="criteria._ref[5]._select._field[0]" value="groupno"/>
					        <input class="nui-hidden" name="criteria._ref[5]._expr[0]._property" value="custname"/>
					        <input class="nui-hidden" name="criteria._ref[5]._expr[0]._op" value="like"/>
					        <input class="nui-hidden" name="criteria._ref[5]._expr[0]._likeRule" value="all"/>
					    </td>
					</tr>
					<tr>
						<td align="right"><span>服务开通情况：</span></td>
		            	<td>
		            		<input class="nui-dictcombobox" name="criteria._expr[8]._value" dictTypeId="CS_SERVSTAGE" showNullItem="true" nullItemText="全部" style="width: 110px;"/>
		            		 <input class="nui-hidden" name="criteria._expr[8]._property" value="servstage"/>
					    </td>
					    <td align="right"><span>产品单价：</span></td>
					    <td>
		            		<input class="nui-textbox" name="criteria._ref[2]._expr[1]._min" style="width:98px" id="price1"/>-<input class="nui-textbox" name="criteria._ref[2]._expr[1]._max" style="width:98px" id="price2"/>
					        <input class="nui-hidden" name="criteria._ref[2]._expr[1]._property" value="price"/>
					        <input class="nui-hidden" name="criteria._ref[2]._expr[1]._op" value="between"/>
					    </td>
					    <td align="right"><span>是否发货：</span></td>
		            	<td>
		            		<input class="nui-dictcombobox" id="issend" name="criteria._expr[13]._value" dictTypeId="MIS_YN" showNullItem="true" nullItemText="全部" style="width: 120px;"/>
		            		<input class="nui-hidden" name="criteria._expr[13]._property" value="goodsenddate"/>
		            		<input class="nui-hidden" name="criteria._expr[13]._op" value="=" id="tempCond3"/>
					    </td>
					    <td align="right"><span>最终用户：</span></td>
		            	<td align="left">
		            		<input class="nui-textbox" name="criteria._ref[1]._expr[0]._value" id="userid" style="width: 200px;"/>
		            		<input class="nui-hidden" name="criteria._expr[26]._property" value="userid"/>
					        <input class="nui-hidden" name="criteria._expr[26]._op" value="in" id="tempCond91"/>
					        <input class="nui-hidden" name="criteria._expr[26]._ref" value="9" id="tempCond92"/>
					        <input class="nui-hidden" name="criteria._ref[1]._id" value="9"/>
					        <input class="nui-hidden" name="criteria._ref[1]._entity" value="com.primeton.rdmgr.data.csomsData.MisCustinfo"/>
					        <input class="nui-hidden" name="criteria._ref[1]._select._field[0]" value="custid"/>
					        <input class="nui-hidden" name="criteria._ref[1]._expr[0]._property" value="custname"/>
					        <input class="nui-hidden" name="criteria._ref[1]._expr[0]._op" value="like"/>
					        <input class="nui-hidden" name="criteria._ref[1]._expr[0]._likeRule" value="all"/>
					    </td>
					</tr>
					<tr>
		            	<td align="right"><span>合同号：</span></td>
					    <td>
					    	<input class="nui-textbox" name="criteria._expr[6]._value" style="width: 110px;"/>
					    	<input class="nui-hidden" name="criteria._expr[6]._property" value="contid"/>
					        <input class="nui-hidden" name="criteria._expr[6]._op" value="like"/>
					        <input class="nui-hidden" name="criteria._expr[6]._likeRule" value="all"/>
					    </td>
						<td align="right"><span>所属公司：</span></td>
		            	<td>
		            		<input class="nui-dictcombobox" name="criteria._expr[27]._value" dictTypeId="company" multiSelect="true" style="width: 200px;"/>
		            		<input class="nui-hidden" name="criteria._expr[27]._property" value="company"/>
		            		<input class="nui-hidden" name="criteria._expr[27]._op" value="in"/>
					    </td>
		            	<td align="right"><span>销售姓名：</span></td>
		            	<td>
		            		<input class="nui-textbox" name="criteria._expr[9]._value" id="salename" style="width: 120px;"/>
		            		<input class="nui-hidden" name="criteria._expr[9]._property" value="salename"/>
					        <input class="nui-hidden" name="criteria._expr[9]._op" value="like"/>
					        <input class="nui-hidden" name="criteria._expr[9]._likeRule" value="all"/>
					    </td>
					    <td align="right"><span>销售所在部门：</span></td>
		            	<td align="left">
							<input id="orgid1"  name="criteria._ref[0]._expr[0]._value"  style="width:200px;" class="nui-treeselect" expandOnLoad="0"
							textField="orgname" valueField="orgid" parentField="parentorgid" dataField="orgs" showTreeIcon="true" valueFromSelect="true"
							showNullItem="true" multiSelect="true" checkRecursive = "true" showFolderCheckBox="true"/>
		            		<input class="nui-hidden" name="criteria._expr[11]._property" value="contractid"/>
					        <input class="nui-hidden" name="criteria._expr[11]._op" value="in" id="tempCond11"/>
					        <input class="nui-hidden" name="criteria._expr[11]._ref" value="2" id="tempCond21"/>
					        <input class="nui-hidden" name="criteria._ref[0]._id" value="2"/>
					        <input class="nui-hidden" name="criteria._ref[0]._entity" value="com.primeton.mis.contract.contract.CsContractsale"/>
					        <input class="nui-hidden" name="criteria._ref[0]._select._field[0]" value="contractid"/>
					        <input class="nui-hidden" name="criteria._ref[0]._expr[0]._property" value="orgid"/>
					        <input class="nui-hidden" name="criteria._ref[0]._expr[0]._op" value="in"/>
					      
					        <input class="nui-hidden" name="criteria._ref[6]._expr[0]._value" id="orgids1" />
		            		<input class="nui-hidden" name="criteria._expr[25]._property" value="contractid"/>
					        <input class="nui-hidden" name="criteria._expr[25]._op" value="in" id ="temps1"/>
					        <input class="nui-hidden" name="criteria._expr[25]._ref" value="8" id ="temps2"/>
					        <input class="nui-hidden" name="criteria._ref[6]._id" value="8"/>
					        <input class="nui-hidden" name="criteria._ref[6]._entity" value="com.primeton.mis.contract.contract.CsContractsale"/>
					        <input class="nui-hidden" name="criteria._ref[6]._select._field[0]" value="contractid"/>
					        <input class="nui-hidden" name="criteria._ref[6]._expr[0]._property" value="orgid"/>
					        <input class="nui-hidden" name="criteria._ref[6]._expr[0]._op" value="in"/>
					    </td>
					</tr>
					<tr>
					    <td align="right"><span>是否产品分成：</span></td>
		            	<td>
		            		<input class="nui-dictcombobox" name="criteria._expr[28]._value" dictTypeId="MIS_YN"  style="width: 110px;" showNullItem="true" />
		            		<input class="nui-hidden" name="criteria._expr[28]._property" value="isproductreve"/>
		            		<input class="nui-hidden" name="criteria._expr[28]._op" value="="/>
					    </td>
					    <td align="right"><span>是否允许对外宣传：</span></td>
		            	<td>
		            		<input class="nui-dictcombobox" name="criteria._expr[29]._value" dictTypeId="MIS_YN"  style="width: 200px;" showNullItem="true" nullItemText="全部"/>
		            		<input class="nui-hidden" name="criteria._expr[29]._property" value="publicity"/>
		            		<input class="nui-hidden" name="criteria._expr[29]._op" value="="/>
					    </td>
					    <td align="right"><span>分包外包：</span></td>
		            	<td>
		            		<input class="nui-dictcombobox" name="criteria._expr[21]._value" dictTypeId="MIS_YN"  style="width: 120px;" showNullItem="true" nullItemText="全部"/>
		            		<input class="nui-hidden" name="criteria._expr[21]._property" value="isforbid"/>
		            		<input class="nui-hidden" name="criteria._expr[21]._op" value="="/>
					    </td>
					    <td align="right"><span>产品名称：</span></td>
		            	<td align="left">
		            		<input url="com.primeton.eos.ame_product.QuoProdType.getQuoProdTypeTree.biz.ext" id = "prodname" style="width:200px;" class="nui-treeselect" name="criteria._ref[2]._expr[0]._value"
                    		textField="prodtypename" valueField="prodtypeid" parentField="parenttypeid" dataField="quoProdtypes" showTreeIcon="true" valueFromSelect="true" multiSelect="true" expandOnLoad="true" showFolderCheckBox="false" allowInput="true"/>
		            		<input class="nui-hidden" name="criteria._expr[12]._property" value="contractid"/>
					        <input class="nui-hidden" name="criteria._expr[12]._op" value="in" id="tempCond1"/>
					        <input class="nui-hidden" name="criteria._expr[12]._ref" value="1" id="tempCond2"/>
					        <input class="nui-hidden" name="criteria._ref[2]._id" value="1"/>
					        <input class="nui-hidden" name="criteria._ref[2]._entity" value="com.primeton.mis.contract.contract.CsContractProduct"/>
					        <input class="nui-hidden" name="criteria._ref[2]._select._field[0]" value="contractid"/>
					        <input class="nui-hidden" name="criteria._ref[2]._expr[0]._property" value="prodname"/>
					        <input class="nui-hidden" name="criteria._ref[2]._expr[0]._op" value="in"/>
					    </td> 
					</tr>
					<tr>
					    <td align="right"><span>收入类型：</span></td>
		            	<td>
		            		<input class="nui-dictcombobox" name="criteria._expr[16]._value" dictTypeId="MIS_HTINCOMETYPE" multiSelect="true" style="width: 110px;"/>
		            		<input class="nui-hidden" name="criteria._expr[16]._property" value="incometype"/>
		            		<input class="nui-hidden" name="criteria._expr[16]._op" value="in"/>
					    </td>
					    <td align="right"><span>客户类型：</span></td>
		            	<td>
		            		<input class="nui-dictcombobox" name="criteria._expr[17]._value" dictTypeId="CS_SIGNTARGET" multiSelect="true" style="width: 200px;"/>
		            		<input class="nui-hidden" name="criteria._expr[17]._property" value="signtarget"/>
		            		<input class="nui-hidden" name="criteria._expr[17]._op" value="="/>
					    </td>
					    <td align="right" id="a21"><span>高风险：</span></td>
		            	<td id="a22">
		            		<input class="nui-dictcombobox" name="criteria._expr[22]._value" dictTypeId="MIS_YN"  style="width: 120px;" showNullItem="true" nullItemText="全部"/>
		            		<input class="nui-hidden" name="criteria._expr[22]._property" value="ishighrisk"/>
		            		<input class="nui-hidden" name="criteria._expr[22]._op" value="="/>
					    </td>
					    <td align="right" style="width: 80px;"><span>项目编号：</span></td>
		            	<td align="left">
					        <input class="nui-textbox" name="criteria._expr[20]._value" style="width: 200px;"/>
		            		<input class="nui-hidden" name="criteria._expr[20]._property" value="projectno"/>
					        <input class="nui-hidden" name="criteria._expr[20]._op" value="like"/>
					        <input class="nui-hidden" name="criteria._expr[20]._likeRule" value="all"/>
					    </td>
					</tr>
					<tr>
						<td align="right">是否批量预估收入：</td>
						<td >
							<input class="nui-dictcombobox" name="criteria._expr[10]._value" dictTypeId="MIS_YN" style="width: 110px;"  showNullItem="true" nullItemText="全部"/>
		            		<input class="nui-hidden" name="criteria._expr[10]._property" value="isfinreve"/>
		            		<input class="nui-hidden" name="criteria._expr[10]._op" value="="/>
						</td>
						<td align="right">结转类型：</td>
						<td >
							<input class="nui-dictcombobox" name="criteria._expr[14]._value" dictTypeId="CONTRACT_CARRY_TYPE" style="width: 200px;" multiSelect="true" />
		            		<input class="nui-hidden" name="criteria._expr[14]._property" value="carrytype"/>
		            		<input class="nui-hidden" name="criteria._expr[14]._op" value="in"/>
						</td>
					
					
					</tr>
					<tr>
						<td align="center" colspan="8">
		                    <a class="nui-button" iconCls="icon-search" id = "search" onclick="search()">查找</a>
							<a class="nui-button" iconCls="icon-download" id="contractQuery_exportContract" onclick="exportC('Contract')">导出合同信息</a>
							<a class="nui-button" iconCls="icon-download" id="contractQuery_exportContractProd" onclick="exportC('ContractProd')">导出合同产品信息</a>
							<a class="nui-button" iconCls="icon-download" id="contractQuery_exportContractOrder" onclick="exportC('ContractOrder')">导出合同订单信息</a>
		                </td>
					</tr>
			    </table>
			</div>
	    </div>
	    <div style="width:100%;">
	        <div class="nui-toolbar" id= "toolbars" style="border-bottom:0;padding:0px;">
	            <table style="width:100%;">
	                <tr>
	                    <td style="width:100%;">
	                        <a class="nui-button" id="contractQuery_contractAdd" iconCls="icon-add" onclick="add()">增加</a>
	                        <a class="nui-button" id="contractQuery_contractEdit" iconCls="icon-edit" onclick="edit()">编辑</a>
	                        <a class="nui-button" id="contractQuery_contractDel" iconCls="icon-remove" onclick="remove()">删除</a> 
	                        <a class="nui-button" id="contractQuery_contractAddOrder" iconCls="icon-add" onclick="addOrder()">新增订单</a>           
	                    </td>
	                </tr>
	            </table>           
	        </div>
	    </div>
	    <div id="datagrid1" dataField="contracts" class="nui-datagrid" style="width:100%;height:auto;" showSummaryRow="true"
	    	url="com.primeton.mis.contract.contract.queryContract.biz.ext" idField="id" allowResize="true" ondrawsummarycell="doCountNowPage"
	    	sizeList="[10,20,30,50,100,200,500,1000,5000,10000]" pageSize="10" allowAlternating="true" multiSelect="true">
		    <div property="columns">
		    	<div name="temp123" type="checkcolumn"></div>
		        <div field="contnum" width="73" renderer="onTitleRenderer" headerAlign="center" allowSort="true">合同存档编号</div>
		        <div field="contreg" width="70" headerAlign="center" dateFormat="yyyy-MM-dd" allowSort="true">登记日期</div>
		        <div field="custname" width="130" dateFormat="yyyy-MM-dd" headerAlign="center" allowSort="true">签署单位</div>
		        <div field="projectname" width="140" headerAlign="center">合同项目名称</div>
		        <div field="prodmon" dataType="currency" summaryType="sum" currencyUnit="￥" align="right" width="100" headerAlign="center" allowSort="true">产品金额（元）</div>
		        <div field="servmon" dataType="currency" summaryType="sum" currencyUnit="￥" align="right" width="100" headerAlign="center" allowSort="true">服务金额（元）</div>
		        <div field="contsum" dataType="currency" summaryType="sum" currencyUnit="￥" align="right" width="100" headerAlign="center" allowSort="true">总金额（元）</div>
		        <div field="gathermon" dataType="currency" summaryType="sum" currencyUnit="￥" align="right" width="100" headerAlign="center">已收款金额（元）</div>
		        <div field="salename" width="50" headerAlign="center" allowSort="true">销售姓名</div>
		        <div field="org" renderer="onGenderRenderer" width="80" headerAlign="center" allowSort="true">部门</div>
		        <div field="status" renderer="onGender1Renderer" width="60" headerAlign="center" allowSort="true">合同状态</div>
		       	<div field="isfinreve" width="70"  renderer="isfinreve1" align="center" headerAlign="center"allowSort="true">是否批量预估收入</div>
		        <div field="carrytype" width="70"  renderer="carrytype1" align="center" headerAlign="center"allowSort="true">结转类型</div>
		        
		        <!-- <div field="status" renderer="onGender1Renderer" width="45" headerAlign="center" allowSort="true">合同状态</div> -->
		    </div>
		</div>
	</div>
<form name="viewlist1" id="viewlist1" action="com.primeton.eos.ame_common.ameExportCommon.flow" method="post">
	<input type="hidden" name="_eosFlowAction" value="action0" filter="false"/>
	<input type="hidden" name="downloadFile" filter="false"/>
	<input type="hidden" name="fileName" filter="false"/>
</form>
</body>
<script type="text/javascript">
    nui.parse();
    var grid = nui.get("datagrid1");       
	init();
	function init(){
		<% 
			UserObject user = (UserObject)session.getAttribute("userObject");
			//String nowuserid = user.getUserId();
			String nowusername = user.getUserName();
			Map attr = user.getAttributes();
			DataObject[] roles = (DataObject[])attr.get("roles");
			
			Boolean isCommerce = false;	//是否商务
			Boolean isFinance = false; //是否财务
			Boolean isLeader = false; //是否是领导（含：COO、事业部总经理、事业部副总经理、产品支持中心总监、软件产品部总经理、合同查询员）
			Boolean isAssistant = false;//是否是事业部助理
			//Boolean isOrgLeader = false; //是否是销售部门的主管
			
			for(int i=0;i < roles.length;i++){
				if(roles[i].getString("roleid").equals("commerce")){
					isCommerce = true;
				}
				if(roles[i].getString("roleid").equals("finance")){
					isFinance = true;
				}
			   	if( roles[i].getString("roleid").equals("assistant") || 
			   		roles[i].getString("roleid").equals("HDJRZL") || 
			   		roles[i].getString("roleid").equals("general") ||
			   		roles[i].getString("roleid").equals("viceGeneral") ){
					isAssistant = true;
				}
				if( roles[i].getString("roleid").equals("COO") ||
					roles[i].getString("roleid").equals("prodGeneral") ||
					roles[i].getString("roleid").equals("CSManager") ||
					roles[i].getString("roleid").equals("contractQuery") ||
					roles[i].getString("roleid").equals("csoper") ||
					roles[i].getString("roleid").equals("legal") ||
					roles[i].getString("roleid").equals("PMO") ||
					roles[i].getString("roleid").equals("YYPT") ||
					roles[i].getString("roleid").equals("YYPTZL") ||
					roles[i].getString("roleid").equals("prodUnit")){
					isLeader = true;
				}
			}
		%> 
		
		var isCommerce = "<%=isCommerce %>";//是否商务
		var isFinance = "<%=isFinance %>";//是否财务
		var isLeader = "<%=isLeader %>";//是否是领导（含：COO、事业部总经理、事业部副总经理、产品支持中心总监、软件产品部总经理、合同查询员）
		var isAssistant = "<%=isAssistant %>";//是否是事业部助理
		//var syborgid = "";
		
		//按钮权限的控制
		getOpeatorButtonAuth("contractQuery_exportContract,contractQuery_exportContractProd,contractQuery_exportContractOrder,contractQuery_contractAdd,contractQuery_contractEdit,contractQuery_contractDel,contractQuery_contractAddOrder");//操作按钮权限初始化
		
		if(isCommerce == 'false'){//非商务，不能增删改
			/* nui.get("addBtn").setEnabled(false);
			nui.get("editBtn").setEnabled(false);
			nui.get("deleteBtn").setEnabled(false); */
			document.getElementById("a21").style.display="none"; 
			document.getElementById("a22").style.display="none";
			document.getElementById("a21").innerHTML =  '';
		    document.getElementById("a22").innerHTML =  '';
			grid.hideColumn("temp123");
		}
		if(isAssistant == 'true' && isLeader == 'false'){//助理，可以看本事业部的
			/* nui.get("addBtn").setEnabled(false);
			nui.get("editBtn").setEnabled(false);
			nui.get("deleteBtn").setEnabled(false); */
			grid.hideColumn("temp123");
		}
		//初始化有权的机构
		//code:对应功能编码，map：对于机构的查询条件
		var json = {"code":"contract","map":{"property":"status","op":"=","value":"running"}};
		nui.ajax({
			url:"com.primeton.eos.ame_auth.ame_auth.getownorg.biz.ext",
			data:json,
			type:'POST',
			contentType:'text/json',
			success:function(text){
				if(text.orgs){
					if(text.orgs.length==0){
						// 没有有权的机构时只能查销售为自己的数据
						nui.get("salename").setValue('<%=nowusername %>');
						nui.get("salename").setReadOnly(true);
					}
					nui.get("orgid1").loadList(text.orgs, "orgid", "parentorgid");
					var isall;
					for(var i=0;i<text.orgs.length;i++){
						if(text.orgs[i].orgid == "1"){
							isall = "1";
							break;
						}
					}
					//如果拥有全公司的权限就取消部门限制
					if(isall == "1"){
						nui.get("temps1").setValue("=");
        				nui.get("temps2").setValue("");
					}else{
						nui.get("orgids1").setValue(text.orgids);
					}
				}else{
					// 没有有权的机构时只能查销售为自己的数据
					nui.get("salename").setValue('<%=nowusername %>');
					nui.get("salename").setReadOnly(true);
				}
				search();//权限控制之后开始查询数据
			}
		});
	}
	
    //对该页的总金额做合计
    function doCountNowPage(e){        	
        //客户端汇总计算
        if (e.field == "prodmon") {
            e.cellHtml = "<div align='right'><b>" + e.cellHtml + "</b></div>";
        }
        if (e.field == "servmon") {
            e.cellHtml = "<div align='right'><b>" + e.cellHtml + "</b></div>";
        }
        if (e.field == "contsum") {
            e.cellHtml = "<div align='right'><b>" + e.cellHtml + "</b></div>";
        }
        if (e.field == "gathermon") {
            e.cellHtml = "<div align='right'><b>" + e.cellHtml + "</b></div>";
        }
    }
    
    //查询
    function search() {
        grid.load(returnJson());
    }
	
	function doView(){//查看合同明细
		var selectRow = grid.getSelected();
		if(!selectRow){
			nui.alert("请选择其中一条合同数据!");
			return;
		}
		var executeUrl = "<%=request.getContextPath() %>/contract/contract/contractView.jsp?contractid=" + selectRow.contractid;
		window.open(executeUrl);
	}
	
	//新增合同模态框
    function add() {
        nui.open({
            url: "<%=request.getContextPath() %>/contract/contract/contractModify.jsp",
            title: "新增合同", width: 1100, height: 495,
            onload: function () {
                var iframe = this.getIFrameEl();
                var data = { action: "new"};
                iframe.contentWindow.SetData(data);
            },
            ondestroy: function (action) {
            	if(action=='save'){
                	grid.reload();
            	}
            }
        });
    }
    
    //修改合同模态框
    function edit() {
    	var rows = grid.getSelecteds();
    	if (rows.length > 1) {
    		nui.alert("只能选中一条记录进行编辑");
    	}else{
            var row = grid.getSelected();
            if (row) {
                nui.open({
                    url: "<%=request.getContextPath() %>/contract/contract/contractModify1.jsp",
                    title: "编辑合同", width: 1100, height: 495,
                    onload: function () {
                        var iframe = this.getIFrameEl();
                        var data = { action: "edit", contractid: row.contractid };
                        iframe.contentWindow.SetData(data);
                    },
                    ondestroy: function (action) {
                    	<%--if(action == "save"){
	                        grid.reload();
                    	}--%>
                    }
                });
                
            } else {
                nui.alert("请选中一条记录");
            }
        }
    }
    
    function addOrder(){
    	var rows = grid.getSelecteds();
    	if (rows.length > 1) {
    		nui.alert("只能选中一条记录进行编辑");
    	}else{
            var row = grid.getSelected();
            if (row) {
            	var contractid = row.contractid;
            	nui.ajax({
		            url: "com.primeton.mis.contract.contract.getCsContSale.biz.ext",
					type: 'POST',
					data: {contractid:contractid},	
					contentType: 'text/json',
		            success: function (o) {
		            	var num = o.num;
		            	if(num == 1){
		            		nui.open({
			                    url: "<%=request.getContextPath() %>/contract/contract/addOrder.jsp",
			                    title: "新增订单", width: 1100, height: 495,
			                    onload: function () {
			                        var iframe = this.getIFrameEl();
			                        var data = { contractid: row.contractid };
			                        iframe.contentWindow.SetData(data);
			                    },
			                    ondestroy: function (action) {
			                    }
			                });
		            	}else{
		            		nui.alert("涉及多销售的订单，请点击编辑按钮添加订单。");
		            	}
		            }
		        });
                
                
            } else {
                nui.alert("请选中一条记录");
            }
        }
    }
    
    //删除一个合同
    function remove() {            
        var rows = grid.getSelecteds();
        var data = {cscontracts:rows};
        var json = nui.encode(data);
        if (rows.length > 0) {
            if (confirm("确定删除选中记录？")) {
                grid.loading("操作中，请稍后......");
                nui.ajax({
                    url: "com.primeton.mis.contract.contract.deleteContracts.biz.ext",
                    type: "post",
                    data: json, 
                    cache: false,
                    contentType: 'text/json',
                    success: function (text) {
                        grid.reload();
                    },
                    error: function () {
                    }
                });
            }
        } else {
            nui.alert("请选中一条记录");
        }
    }
       
    //导出合同、合同订单、合同产品
    function exportC(e){
    	var fileName;
    	var url;
    	if(e == 'Contract'){
    		fileName = "contract";
    		url = 'com.primeton.mis.contract.contract.exportContract.biz.ext';
    	}else if(e == 'ContractProd'){
    		fileName = "contractProduct";
    		url = 'com.primeton.mis.contract.contract.exportContractProd.biz.ext';
    	}else{
    		fileName = "contractOrder";
    		url = 'com.primeton.mis.contract.contract.exportContractOrder.biz.ext';
    	}
        var json = nui.encode(returnJson());
    	grid.loading("操作中，请稍后......");
		nui.ajax({
            url: url,
            type: "post",
            data: json,
            cache: false,
            contentType: 'text/json',
            success: function (o) {
         		grid.unmask();
            	var filePath = o.downloadFile;
            	var myDate = new Date();
            	var year = myDate.getYear();
            	var month = myDate.getMonth()+1;
            	var day = myDate.getDate();
            	var hours = myDate.getHours();
            	var minutes = myDate.getMinutes();
            	var seconds = myDate.getSeconds();
            	var curDateTime = year;
            	if(month>9)
					curDateTime = curDateTime + "" + month;
				else
					curDateTime = curDateTime + "0" + month;
            	if(day>9)
					curDateTime = curDateTime + "" + day;
				else
					curDateTime = curDateTime + "0" + day;
				if(hours>9)
					curDateTime = curDateTime + "" + hours;
				else
					curDateTime = curDateTime + "0" + hours;
				if(minutes>9)
					curDateTime = curDateTime + "" + minutes;
				else
					curDateTime = curDateTime + "0" + minutes;
				if(seconds>9)
					curDateTime = curDateTime + "" + seconds;
				else{
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
    
	//获取form表单及控制
	function returnJson(){
		if(nui.get("prodname").getValue() == "" && nui.get("price1").getValue() == "" && nui.get("price2").getValue() == ""){
    		nui.get("tempCond1").setValue("=");
    		nui.get("tempCond2").setValue("");
    	}else{
    		nui.get("tempCond1").setValue("in");
    		nui.get("tempCond2").setValue("1");
    	}
    	if(nui.get("orderreg1").getValue() == "" && nui.get("orderreg2").getValue() == "" && nui.get("contorderno").getValue() == ""){
    		nui.get("tempCond41").setValue("=");
    		nui.get("tempCond42").setValue("");
    	}else{
    		nui.get("tempCond41").setValue("in");
    		nui.get("tempCond42").setValue("4");
    	}
    	if(nui.get("orgid1").getValue() == ""){
    		nui.get("tempCond11").setValue("=");
    		nui.get("tempCond21").setValue("");
    	}else{
    		nui.get("tempCond11").setValue("in");
    		nui.get("tempCond21").setValue("2");
    	}
    	if(nui.get("custname").getValue() == ""){
    		nui.get("tempCond51").setValue("=");
    		nui.get("tempCond52").setValue("");
    	}else{
    		nui.get("tempCond51").setValue("in");
    		nui.get("tempCond52").setValue("5");
    	}
    	if(nui.get("groupno").getValue() == ""){
    		nui.get("tempCond71").setValue("=");
    		nui.get("tempCond72").setValue("");
    	}else{
    		nui.get("tempCond71").setValue("in");
    		nui.get("tempCond72").setValue("6");
    	}
    	if(nui.get("userid").getValue() == ""){
    		nui.get("tempCond91").setValue("=");
    		nui.get("tempCond92").setValue("");
    	}else{
    		nui.get("tempCond91").setValue("in");
    		nui.get("tempCond92").setValue("9");
    	}
    	if(nui.get("issend").getValue() == "0"){
    		nui.get("tempCond3").setValue("null");
    	}else if(nui.get("issend").getValue() == "1"){
    		nui.get("tempCond3").setValue("notnull");
    	}else{
    		nui.get("tempCond3").setValue("=");
    	}
        var form = new nui.Form("#form1");
		var data = form.getData();
		return data;
	}
	
	function onGenderRenderer(e) {//部门业务字典
        return nui.getDictText('CONT_ORG',e.value);
    }
    function isfinreve1(e) {//部门业务字典
        return nui.getDictText('MIS_YN',e.value);
    }
    
    function onGender1Renderer(e) {//合同状态
        return nui.getDictText('CS_CONTRACTTYPE',e.value);
    }
    function carrytype1(e) {//结转类型
        return nui.getDictText('CONTRACT_CARRY_TYPE',e.value);
    }
    
    
    function onTitleRenderer(e) {//给合同标号加链接
		return "<a href='javascript:void(0)' onclick='doView();' title='点击查看'>" + e.value + "</a>";
	}
</script>
</html>
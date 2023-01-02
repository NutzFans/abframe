<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>	
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<!-- 
  - Author(s): mengyy
  - Date: 2020-05-22 10:28:57
  - Description:
-->
<head>
<title>合同订单表单</title>
</head>
<body>
	<div id="form_csContOrder" >
		<fieldset id="field1" style="border:solid 1px #aaa;padding:3px;">
			<input name="csContOrder.contractid" id="contractid" class="nui-hidden"/>
			<input name="csContOrder.contnum" id="contnum1" class="nui-hidden"/>
			<input name="csContOrder.projectname" id="projectname1" class="nui-hidden"/>
			<input name="csContOrder.salename" id="salename1" class="nui-hidden"/>
			<input name="csContOrder.custname" id="custname1" class="nui-hidden"/>
			
			<input name="csContOrder.conproid" id="conproid" class="nui-hidden"/><!-- 产品id -->
			<input name="csContOrder.prodmon" id="prodmon" class="nui-hidden"/><!-- 产品金额 -->
			<input name="csContOrder.prodmonold" id="prodmonold" class="nui-hidden"/><!-- 产品金额 旧-->
			<input name="csContOrder.prodsubmon" id="prodsubmon" class="nui-hidden"/><!-- 产品采购1 -->
			<input name="csContOrder.prodsubmonold" id="prodsubmonold" class="nui-hidden"/><!-- 产品采购1 -->
			<input name="csContOrder.prodothmon" id="prodothmon" class="nui-hidden"/><!-- 产品采购2 -->
			<input name="csContOrder.prodothmonold" id="prodothmonold" class="nui-hidden"/><!-- 产品采购2 -->
			<input name="csContOrder.netprodmon" id="netprodmon" class="nui-hidden"/><!-- 产品净额 -->
			<input name="csContOrder.prodwbmon" id="prodwbmon1" class="nui-hidden"/><!-- 产品维保金额 -->
			<input name="csContOrder.prodwbmon1old" id="prodwbmon1old" class="nui-hidden"/><!-- 产品维保金额 -->
			<input name="csContOrder.prodwbsubmon" id="prodwbsubmon" class="nui-hidden"/><!-- 产品维保分包费 -->
			<input name="csContOrder.prodwbsubmonold" id="prodwbsubmonold" class="nui-hidden"/><!-- 产品维保分包费 -->
			<input name="csContOrder.prodwbothmon" id="prodwbothmon" class="nui-hidden"/><!-- 产品维保服务费 -->
			<input name="csContOrder.prodwbothmonold" id="prodwbothmonold" class="nui-hidden"/><!-- 产品维保服务费 -->
			<input name="csContOrder.prodwbnetmon" id="prodwbnetmon" class="nui-hidden"/><!-- 产品维保净额 -->
			
			<input name="csContOrder.contsaleid" id="contsaleid" class="nui-hidden"/><!-- 销售id -->
			<input name="csContOrder.salecontsum" id="salecontsum" class="nui-hidden"/><!-- 合同总金额  -->
			<input name="csContOrder.salecontsumold" id="salecontsumold" class="nui-hidden"/><!-- 合同总金额  -->
			<input name="csContOrder.saleprodmon" id="saleprodmon" class="nui-hidden"/><!-- 产品金额  -->
			<input name="csContOrder.saleprodmonold" id="saleprodmonold" class="nui-hidden"/><!-- 产品金额  -->
			<input name="csContOrder.saleservmon" id="saleservmon" class="nui-hidden"/><!-- 服务总金额 -->
			<input name="csContOrder.saleservmonold" id="saleservmonold" class="nui-hidden"/><!-- 服务总金额 -->
			<input name="csContOrder.saleprodwbmon" id="saleprodwbmon" class="nui-hidden"/><!-- 产品维保金额 -->
			<input name="csContOrder.saleprodwbmonold" id="saleprodwbmonold" class="nui-hidden"/><!-- 产品维保金额 -->
			<input name="csContOrder.saleservjsmon" id="saleservjsmon" class="nui-hidden"/><!-- 技术服务金额 -->
			<input name="csContOrder.saleservjsmonold" id="saleservjsmonold" class="nui-hidden"/><!-- 技术服务金额 -->
			<input name="csContOrder.saleservsubmon" id="saleservsubmon" class="nui-hidden"/><!-- 服务采购1 -->
			<input name="csContOrder.saleservsubmonold" id="saleservsubmonold" class="nui-hidden"/><!-- 服务采购1 -->
			<input name="csContOrder.saleothmon" id="saleothmon" class="nui-hidden"/><!-- 服务采购2 -->
			<input name="csContOrder.saleothmonold" id="saleothmonold" class="nui-hidden"/><!-- 服务采购2 -->
			<input name="csContOrder.netservmon" id="netservmon" class="nui-hidden"/><!-- 服务净额 -->
			<input name="csContOrder.contpolmon" id="contpolmon" class="nui-hidden"/><!-- 合同净额 -->
			
			<input name="csContOrder.summon" id="summon" class="nui-hidden"/><!-- 合同业务分类金额 -->
			<input name="csContOrder.summon2" id="summon2" class="nui-hidden"/><!-- 合同业务分类不含税金额 -->
			
			<input name="csContOrder.productsum" id="productsum" class="nui-hidden"/><!-- 收款产品 -->
			<input name="csContOrder.servicesum" id="servicesum" class="nui-hidden"/><!-- 收款服务 -->
			<input name="csContOrder.fcsum" id="fcsum" class="nui-hidden"/><!-- 收款总金额 -->
			<input name="csContOrder.fcreverate" id="fcreverate" class="nui-hidden"/><!-- 收款比例 -->
			<input name="csContOrder.productsum2" id="productsum2" class="nui-hidden"/><!-- 收款产品不含税 -->
			<input name="csContOrder.servicesum2" id="servicesum2" class="nui-hidden"/><!-- 收款服务不含税 -->
			<input name="csContOrder.fcsum2" id="fcsum2" class="nui-hidden"/><!-- 收款总金额不含税 -->
			<input name="csContOrder.productrate" id="productrate" class="nui-hidden"/><!-- 收款产品税率 -->
			<input name="csContOrder.servicerate" id=servicerate class="nui-hidden"/><!-- 收款服务税率 -->
			<input name="csContOrder.orderservmon" id="orderservmon" class="nui-hidden"/><!-- 订单服务金额 -->
			
	        <legend>新增合同订单</legend>
	        <table style="table-layout:fixed;" id="table_file">
	        	<tr>
	                <td style="width:100px;" align="right">订单编号：</td>
	                <td style="width:150px;">    
	                    <input name="csContOrder.contorderno" id="contorderno" class="nui-textbox"required="true" allowInput="true" />
	                </td>
	                <td style="width:100px;" align="right">订单登记日期：</td>
	                <td style="width:150px;">    
	                    <input class="nui-datepicker" name="csContOrder.orderreg" id="orderreg" />
	                </td>
	                <td style="width:100px;" align="right">订单签订日期：</td>
	                <td style="width:150px;">    
	                    <input class="nui-datepicker" name="csContOrder.orderdate" id="orderdate"/>
	                </td>
	                <td style="width:100px;" align="right">产品信息：</td>
	                <td style="width:150px;">    
	                    <input name="csContOrder.prodname" id="prodname"  class="nui-combobox" filterType="like" 
							textField="prodtypename" valueField="prodname" dataField="csproducts" valueFromSelect="true" 
							allowInput="true" style="width: 140px;" showNullItem="true" onvaluechanged="changeProduct(e)" />
	                </td>
	                
	        	</tr>
	        	<tr>
	                <td style="width:100px;" align="right">订单产品金额：</td>
	                <td style="width:150px;" >    
	                    <input name="csContOrder.orderprodmon" id="orderprodmon" onvaluechanged="changeOrderMon(e)" class="nui-spinner" format="n2"  allowLimitValue="false" changeOnMousewheel="false"  showbutton="false"/>
	                </td>
	                <td style="width:100px;" align="right">技术服务金额：</td>
	                <td style="width:150px;" >    
	                    <input name="csContOrder.servjsmon" id="servjsmon" onvaluechanged="changeOrderMon(e)" class="nui-spinner" format="n2"  allowLimitValue="false" changeOnMousewheel="false"  showbutton="false" />
	                </td> 
	                <td style="width:100px;" align="right">产品维保金额：</td>
	                <td style="width:150px;" >    
	                    <input name="csContOrder.prodwbmon" id="prodwbmon" onvaluechanged="changeOrderMon(e)" class="nui-spinner" format="n2"  allowLimitValue="false" changeOnMousewheel="false"  showbutton="false"/>
	                </td>
	                <td style="width:100px;" align="right">合同订单金额：</td>
	                <td style="width:150px;" >    
	                    <input name="csContOrder.ordermon" id="ordermon" class="nui-spinner" format="n2"  allowLimitValue="false" changeOnMousewheel="false"  showbutton="false" readonly="readonly"/>
	                </td>
	        	</tr>
	            <tr>
	                <td style="width:100px;" align="right">订单采购1：</td>
	                <td style="width:150px;" >    
	                    <input name="csContOrder.servsubmon" id="servsubmon" onvaluechanged="changeOrderMon(e)" class="nui-spinner" format="n2"  allowLimitValue="false" changeOnMousewheel="false"  showbutton="false" />
	                </td>
	                <td style="width:100px;" align="right">订单采购2：</td>
	                <td style="width:150px;" >    
	                    <input name="csContOrder.othmon" id="othmon" onvaluechanged="changeOrderMon(e)" class="nui-spinner" format="n2"  allowLimitValue="false" changeOnMousewheel="false"  showbutton="false" />
	                </td>
	                <td style="width:100px;" align="right">合同业务分类：</td>
	                <td style="width:150px;">    
	                    <input name="csContOrder.type" id="type" class="nui-dictcombobox" dictTypeId="CS_CONTRACT_TYPE" onvaluechanged="selectContractType(e)" required="true" allowInput="true" />
	                </td>
	                <td style="width:100px;" align="right">税率：</td>
	                <td style="width:150px;">    
	                    <input name="csContOrder.taxrate" id="taxrate" class="nui-spinner" onvaluechanged="changeSummon(e)" format="n2"  allowLimitValue="false" changeOnMousewheel="false"  showbutton="false" />
	                </td>
	            </tr>
	            <tr> 
	            	<td style="width:100px;" align="right">产品数量单位：</td>
	                <td style="width:150px;">    
	                    <input name="csContOrder.prodnumtype" id="prodnumtype" class="nui-dictcombobox" dictTypeId="CS_PROD_UNIT"  valueFromSelect="true"  allowInput="true" />
	                </td>
	                <td style="width:100px;" align="right">产品数量：</td>
	                <td style="width:150px;">    
	                    <input name="csContOrder.prodnum" id="prodnum" class="nui-spinner" format="n0"  allowLimitValue="false" changeOnMousewheel="false"  showbutton="false" />
	                </td>
	            </tr>
	            <tr>
	                <td style="width:100px;" align="right">收款确认次数：</td>
	                <td style="width:150px;">    
	                    <input name="csContOrder.gatherno" id="gatherno"  class="nui-combobox" filterType="like" 
							textField="gatherno" valueField="gatherno" dataField="gathers"
							allowInput="true" style="width: 125px;" showNullItem="true"/>
	                </td>
	                <td style="width:100px;" align="right">收款类型：</td>
	                <td style="width:150px;">    
	                    <input name="csContOrder.gathertype" id="gathertype" class="nui-dictcombobox" dictTypeId="AME_GATHERTYPE"/>
	                </td>
	                <td style="width:100px;" align="right">预计收款年月：</td>
	                <td style="width:150px;">    
	                    <input id="yearmonth" class="nui-monthpicker" format="yyyy-MM" onvaluechanged="changeyear(e,'yearmonth1')" />
	                    <input name="csContOrder.yearmonth" id="yearmonth1" class="nui-hidden"/>
	                </td>
	            </tr>
	            <tr>
	                <td style="width:100px;" align="right">收款时点描述：</td>
	                <td style="width:150px;" colspan="7">    
	                    <input name="csContOrder.gathertimedesc" id="gathertimedesc" class="nui-textbox" style="width: 900px;"/>
	                </td>
	            </tr>
	            <tr>
	                <td style="width:100px;" align="right">收入次数：</td>
	                <td style="width:150px;">    
	                     <input name="csContOrder.reveno" id="reveno"  class="nui-combobox" filterType="like" 
							textField="reveno" valueField="reveno" dataField="csreves" showNullItem="true"
							allowInput="true" style="width: 125px;"/>
	                </td>
	                <td style="width:100px;" align="right">收入类型：</td>
	                <td style="width:150px;">    
	                    <input name="csContOrder.revetype" id="revetype" class="nui-dictcombobox" dictTypeId="AME_REVETYPE" />
	                </td>
	                <td style="width:100px;" align="right">新合同收入类型：</td>
	                <td style="width:150px;">    
	                    <input name="csContOrder.newtype" id="newtype" class="nui-dictcombobox" dictTypeId="AME_NEWTYPE" />
	                </td>
	                <td style="width:100px;" align="right">收入确认证据：</td>
	                <td style="width:150px;">    
	                    <input name="csContOrder.reveproof" id="reveproof" class="nui-dictcombobox" dictTypeId="MIS_INCOMECONV"/>
	                </td>
	            </tr>
	            <tr>
	                <td style="width:100px;" align="right">预计确认年月：</td>
	                <td style="width:150px;">    
	                    <input id="reveyearmonth" class="nui-monthpicker"  format="yyyy-MM"  onvaluechanged="changeyear(e,'reveyearmonth1')"/>
	                    <input name="csContOrder.reveyearmonth" id="reveyearmonth1" class="nui-hidden"/>
	                </td>
	                <td style="width:100px;" align="right">预计确认旬度：</td>
	                <td style="width:150px;">    
	                    <input name="csContOrder.monthperiod" id="monthperiod"  class="nui-dictcombobox" dictTypeId="AME_MONTHPERIOD" />
	                </td>
	                <td style="width:100px;" align="right">销售评估：</td>
	                <td style="width:150px;">    
	                    <input name="csContOrder.saleseva" id="saleseva" class="nui-dictcombobox" dictTypeId="MIS_YN" />
	                </td>
	            </tr>
	            <tr>
	                <td style="width:100px;" align="right">收入时点描述：</td>
	                <td style="width:150px;" colspan="7">    
	                    <input name="csContOrder.revetimedesc" id="revetimedesc" class="nui-textbox"  style="width: 900px;"/>
	                </td>
	            </tr>
                <tr>
	            	<td style="width:90px;" align="right">备注：</td>
	                <td style="width:150px;" colspan="7">    
	                    <input name="csContOrder.memo" id="memo" class="nui-textarea"style="width:98%;"  maxLength="100"/>
	                </td>
	                
                </tr>
	        </table>
		</fieldset>
	</div>
</body>
</html>
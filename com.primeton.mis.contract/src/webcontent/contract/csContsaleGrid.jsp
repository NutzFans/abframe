<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>	
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<!-- 
  - Author(s): mengyy
  - Date: 2020-05-21 19:32:22
  - Description:
-->
<head>
<title>Title</title>
</head>
<body>
	<fieldset style="width:99%;border:solid 1px #aaa;padding:3px;">
        <legend>合同销售人员</legend>
        <div style="padding:5px;">
        	<div style="width:140px;">
		        <div class="nui-toolbar" style="border-bottom:0;padding:0px;">
		            <table style="width:100%;">
		                <tr>
		                    <td style="width:100%;">
		                        <a class="nui-button" iconCls="icon-add" onclick="addRow('sales_grid')" plain="true">增加</a>
		                        <a class="nui-button" iconCls="icon-remove" onclick="removeRow('sales_grid')" plain="true">删除</a>
		                    </td>
		                </tr>
		            </table>           
		        </div>
		    </div>
        	<div id="sales_grid" class="nui-datagrid" style="width:1060px;height:auto;" allowResize="true" oncellendedit="doCal"
		        url="com.primeton.mis.contract.contract.querySalesByContractid.biz.ext"  idField="contsaleid"
		        onshowrowdetail="onShowRowDetail" showPager="false" allowCellEdit="true" allowCellSelect="true" multiSelect="true" editNextOnEnterKey="true">			        
		        <div property="columns">            
		            <div type="expandcolumn">#</div>
		            <div type="checkcolumn"></div>
		            <div name="oldsalename" field="oldsalename" width="75" headerAlign="center">原销售姓名
		            	<input property="editor" class="nui-textbox" style="width:100%;"/>
		            </div>
		            <div field="saleid" width="45" headerAlign="center" >销售ID
		            	<input property="editor" class="nui-buttonedit" style="width:100%;" onbuttonclick="onButtonEdit1" required="true" allowInput="false"/> 
		            </div>
		            <div field="salename" width="55" headerAlign="center" >销售姓名
		            	<input property="editor" class="nui-textbox" style="width:100%;" required="true" allowInput="false"/>
		            </div>
		            <div field="orgid" width="0" headerAlign="center" >销售所在部门ID</div>
		            <div field="orgname" width="80" headerAlign="center">销售所在部门</div>
		            <div field="org" width="95" headerAlign="center" renderer="onGenderRenderer">销售所属事业部
		            	<input property="editor" class="nui-dictcombobox" style="width:100%;" dictTypeId="CONT_ORG" required="true"/>
		            </div>
		            <div field="techdirector" width="0" headerAlign="center" >技术负责人ID</div>
		            <div field="techdirectorname" width="70" headerAlign="center" >技术负责人
		            	<input property="editor" class="nui-buttonedit" onbuttonclick="onButtonEdit2" style="width:100%;" required="true" allowInput="false"/>
		            </div>
		            <div field="techorg" width="0" headerAlign="center" >技术负责部门ID</div>
		            <div field="techorgname" width="90" headerAlign="center" >技术负责部门</div>
		            <div field="contsum" dataType="currency" width="100" headerAlign="center" align="right" >合同总金额
		            	<input property="editor" class="nui-textbox" style="width:100%;" allowInput="false"/>
		            </div>
		            <div field="prodmon" dataType="currency" width="80" headerAlign="center" align="right" >产品金额
		            	<input property="editor" class="nui-textbox" style="width:100%;" vtype="float" allowInput="false"/>
		            </div>
		            <div field="prodwbmon" dataType="currency" width="80" headerAlign="center" align="right" >产品维保金额
		            	<input property="editor" class="nui-textbox" style="width:100%;" vtype="float" allowInput="false"/>
		            </div>
		            <div field="servjsmon" dataType="currency" width="80" headerAlign="center" align="right" >技术服务金额
		            	<input property="editor" class="nui-textbox" style="width:100%;" vtype="float"/>
		            </div>
		            <div field="servmon" dataType="currency" width="90" headerAlign="center" align="right" >服务总金额
		            	<input property="editor" class="nui-textbox" style="width:100%;" vtype="float" allowInput="false"/>
		            </div>
		            <div field="servsubmon" dataType="currency" width="80" headerAlign="center" align="right" >服务采购1
		            	<input property="editor" class="nui-textbox" style="width:100%;" vtype="float"/>
		            </div>
		            <div field="othmon" dataType="currency" width="80" headerAlign="center" align="right" >服务采购2
		            	<input property="editor" class="nui-textbox" style="width:100%;" vtype="float"/>
		            </div>
		            <div field="netservmon" dataType="currency" width="80" headerAlign="center" align="right" >服务净额
		            	<input property="editor" class="nui-textbox" style="width:100%;" vtype="float" allowInput="false"/>
		            </div>
		            <div field="contpolmon" dataType="currency" width="80" headerAlign="center" align="right" >合同净额
		            	<input property="editor" class="nui-textbox" style="width:100%;" vtype="float" allowInput="false"/>
		            </div>
		        </div>
		    </div>
		    <div id="detailGrid_Form" style="display:none;">
		    	<div style="width:140px;">
			        <div class="nui-toolbar" style="border-bottom:0;padding:0px;">
			            <table style="width:100%;">
			                <tr>
			                    <td style="width:100%;">
			                        <a class="nui-button" iconCls="icon-add" onclick="addRow('product_grid')" plain="true">增加</a>
			                        <a class="nui-button" iconCls="icon-remove" onclick="removeRow('product_grid')" plain="true">删除</a>
			                    </td>
			                </tr>
			            </table>           
			        </div>
			    </div>
		        <div id="product_grid" class="nui-datagrid" style="width:100%;height:auto;" frozenStartColumn="0" frozenEndColumn="3" oncellendedit="doSubCal"
		            url="com.primeton.mis.contract.contract.queryProdsBySaleid.biz.ext" showPager="false" allowCellEdit="true" allowCellSelect="true" multiSelect="true" editNextOnEnterKey="true">			            
		            <div property="columns">
		            	<div type="checkcolumn"></div>
		                <div field="prodname" displayField="prodtypename" width="210" headerAlign="center" >产品名称
		                    <input property="editor"  url="com.primeton.eos.ame_product.QuoProdType.getQuoProdTypeTree.biz.ext" style="width:200px;" class="nui-treeselect" 
		                    textField="prodtypename" valueField="prodtypeid" parentField="parenttypeid" dataField="quoProdtypes" showTreeIcon="true" valueFromSelect="true"
							showNullItem="true" multiSelect="false" expandOnLoad="true" showFolderCheckBox="true" onbeforenodeselect="beforenodeselect" allowInput="true"/>
		                </div>
		                <div field="price" dataType="currency" width="100" align="right" headerAlign="center">产品单价
		                	<input property="editor" class="nui-textbox" vtype="float" inputstyle="text-align: right;"/>
		                </div>
		                <div field="prodnumtype" width="100" align="center" headerAlign="center" renderer="dictProdUnit">产品数量单位
		                	<input property="editor" class="nui-dictCombobox" dictTypeId="CS_PROD_UNIT" showNullItem="true"/>
		                </div>
		                <div field="prodnum" width="100" align="right" headerAlign="center">产品数量
		                	<input property="editor" class="nui-spinner" changeOnMousewheel="false" inputstyle="text-align: right;" showbutton="false" minValue="-100000000" maxValue="100000000"/>
		                </div>
		                <div field="prodmon" dataType="currency" width="100" align="right" headerAlign="center">产品金额
		                	<input property="editor" class="nui-textbox" vtype="float" inputstyle="text-align: right;"/>
		                </div>
		                <div field="prodsubmon" dataType="currency" width="90" align="right" headerAlign="center">产品采购1
		                	<input property="editor" class="nui-textbox" vtype="float" inputstyle="text-align: right;"/>
		                </div>
		                <div field="othmon" dataType="currency" width="90" align="right" headerAlign="center">产品采购2
		                	<input property="editor" class="nui-textbox" vtype="float"  inputstyle="text-align: right;"/>
		                </div>
		                <div field="netprodmon" dataType="currency" width="90" align="right" headerAlign="center">产品净额
		                	<input property="editor" class="nui-textbox" vtype="float" allowInput="false" inputstyle="text-align: right;"/>
		                </div>
		                <div field="prodwbmon" dataType="currency" width="90" align="right" headerAlign="center">产品维保金额
		                	<input property="editor" class="nui-textbox" vtype="float" inputstyle="text-align: right;"/>
		                </div>
		                <div field="prodwbsubmon" dataType="currency" width="90" align="right" headerAlign="center">产品维保分包费
		                	<input property="editor" class="nui-textbox" vtype="float" inputstyle="text-align: right;"/>
		                </div>
		                <div field="prodwbothmon" dataType="currency" width="90" align="right" headerAlign="center">产品维保服务费
		                	<input property="editor" class="nui-textbox" vtype="float" inputstyle="text-align: right;"/>
		                </div>
		                <div field="prodwbnetmon" dataType="currency" width="90" align="right" headerAlign="center">产品维保净额</div>
		                <div field="buyprod" width="120" align="left" headerAlign="center">说明
		                	<input property="editor" class="nui-textarea" inputstyle="text-align: left;" style="width:100px;" minWidth="100" minHeight="50"/>
		                </div>
		            </div>
		        </div>    
		    </div>
        </div>
    </fieldset>
	
</body>
</html>
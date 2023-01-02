<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>	
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<!-- 
  - Author(s): mengyy
  - Date: 2020-05-19 11:04:07
  - Description:
-->
<head>
	<title>合同审批表产品授权列表</title>
    <meta http-equiv="content-type" content="text/html; charset=UTF-8" />
	<script src="<%= request.getContextPath() %>/common/nui/nui.js" type="text/javascript"></script>
</head>
<body>
	<fieldset id="csContLicense_fieldset" style="border:solid 1px #aaa;padding:3px;width: 750px;">
        <legend>产品授权清单</legend>
    	<div style="width:140px;" id="csContLicenseBar">
	        <div class="nui-toolbar" style="border-bottom:0;padding:0px;">
	            <table style="width:100%;">
	                <tr>
	                    <td style="width:100%;">
	                        <a class="nui-button" iconCls="icon-add" onclick="addRow('csContLicense_grid')" id="addCsContLicense" plain="true">增加</a>
	                        <a class="nui-button" iconCls="icon-remove" onclick="removeRow('csContLicense_grid')" id="delCsContLicense" plain="true">删除</a>
	                    </td>
	                </tr>
	            </table>           
	        </div>
	    </div>
        <div id="csContLicense_grid" class="nui-datagrid" style="width:100%;height:auto;" dataField="csContLicenses" 
        	showPager="false" allowCellEdit="true" allowCellSelect="true" multiSelect="true" 
        	editNextOnEnterKey="true"  url="com.primeton.mis.contract.contractApproval.getAmeContLicense.biz.ext" 
        	oncellendedit="doContLicsum"  showSummaryRow="true" ondrawsummarycell="drawCsReveForecastSum">			            
            <div property="columns">
            	<div type="checkcolumn"></div>
                <div field="contnum" width="100" headerAlign="center" align="left">合同编号</div>
                <div field="prodname" displayField="prodtypename" width="300" headerAlign="center" >产品名称
                    <input property="editor"  url="com.primeton.eos.ame_product.QuoProdType.getQuoProdTypeTree.biz.ext" style="width:200px;" class="nui-treeselect" 
                    textField="prodtypename" valueField="prodtypeid" parentField="parenttypeid" dataField="quoProdtypes" showTreeIcon="true" valueFromSelect="true"
					showNullItem="true" multiSelect="false" expandOnLoad="true" showFolderCheckBox="true" onbeforenodeselect="beforenodeselect" allowInput="true"/>
                </div>
                <div field="grantunit" width="100" renderer="getCsContLicType" headerAlign="center" align="left">授权单位
                	<input property="editor" class=nui-dictcombobox  dictTypeId="CS_CONT_LIC_UNIT" />
                </div>
                <div field="total" width="80" headerAlign="center" align="right" summaryType="sum">约定数量
                	<input property="editor" class="nui-spinner" format="n0" allowLimitValue="false" showbutton="false" inputStyle="text-align: right;"/>
                </div>
                <div field="grantnum" width="80" headerAlign="center" align="right" summaryType="sum">已发放数量
                	<input property="editor" class="nui-spinner" format="n0" allowLimitValue="false" showbutton="false" inputStyle="text-align: right;"/>
                </div>
                <div field="lastnum" width="80" headerAlign="center" align="right" summaryType="sum">剩余数量</div>
            </div>
        </div>
    </fieldset>
</body>
</html>
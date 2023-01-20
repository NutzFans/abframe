<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>	
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<!-- 
  - Author(s): mengyy
  - Date: 2020-04-20 18:05:06
  - Description:
-->
<head>
<title>Title</title>
</head>
<body>
	<fieldset style="border:solid 1px #aaa;padding:3px;">
        <legend>本次申请产品授权</legend>
        <div id="csLicProd_grid" class="nui-datagrid"  
        	style="width:99%;height:auto;" dataField="csLicProds" 
        	showPager="false" allowCellEdit="true" allowCellSelect="true" multiSelect="true" 
        	editNextOnEnterKey="true"  url="com.primeton.mis.contract.csLicense.getCsLicProd.biz.ext" 
        	showSummaryRow="true" ondrawsummarycell="drawSum" >			            
            <div property="columns">
                <div field="sendreas" width="100" renderer="getSendreas" headerAlign="center" align="left">发放类型
                	<input property="editor" class=nui-dictcombobox  dictTypeId="CS_SENDREAS" />
                </div>
                <div field="licfilenum" width="80" headerAlign="center" align="right" summaryType="sum">许可文件数
                	<input property="editor" class=nui-spinner  format="n0" showbutton="false" allowLimitValue="false" changeOnMousewheel="false" />
                </div>
                <div field="licfilebindcpu" width="80" headerAlign="center" align="right" summaryType="sum">许可绑定CPU数
                	<input property="editor" class=nui-spinner  format="n0" showbutton="false" allowLimitValue="false" changeOnMousewheel="false" />
                </div>
                <div field="prodname" displayField="prodtypename" width="150" headerAlign="center" >产品名称
                	<input property="editor"  url="com.primeton.eos.ame_product.QuoProdType.getQuoProdTypeTree.biz.ext" style="width:200px;" class="nui-treeselect" 
                    textField="prodtypename" valueField="prodtypeid" parentField="parenttypeid" dataField="quoProdtypes" showTreeIcon="true" valueFromSelect="true"
					showNullItem="true" multiSelect="false" expandOnLoad="true" showFolderCheckBox="true" onbeforenodeselect="beforenodeselect" allowInput="true"/></div>
                <div field="prodnameold" displayField="prodtypenameold" width="150" headerAlign="center" >旧产品名称
                	<input property="editor"  url="com.primeton.eos.ame_product.QuoProdType.getQuoProdTypeTree.biz.ext" style="width:200px;" class="nui-treeselect" 
                    textField="prodtypename" valueField="prodtypeid" parentField="parenttypeid" dataField="quoProdtypes" showTreeIcon="true" valueFromSelect="true"
					showNullItem="true" multiSelect="false" expandOnLoad="true" showFolderCheckBox="true" onbeforenodeselect="beforenodeselect" allowInput="true"/></div>
                <div field="bindip" width="100" headerAlign="center" align="left">IP地址
                	<input property="editor" class="nui-textarea" dictTypeId="CS_SENDREAS" />
                </div>
                <div field="bindipold" width="100" headerAlign="center" align="left">旧IP地址
                	<input property="editor" class="nui-textarea"  dictTypeId="CS_SENDREAS" />
                </div>
                <div field="projectnum" width="100" headerAlign="center" align="right">项目数
                	<input property="editor" class=nui-spinner  format="n0" showbutton="false" allowLimitValue="false" changeOnMousewheel="false" />
                </div>
                <div field="usernum" width="60" headerAlign="center" align="right" summaryType="sum">用户数
                	<input property="editor" class=nui-spinner  format="n0" showbutton="false" allowLimitValue="false" changeOnMousewheel="false" />
                </div>
                <div field="domainmax" width="80" headerAlign="center" align="right" summaryType="sum">被管域最大数
                	<input property="editor" class=nui-spinner  format="n0" showbutton="false" allowLimitValue="false" changeOnMousewheel="false" />
                </div>
                <div field="instancemax" width="80" headerAlign="center" align="right" summaryType="sum">被管实例最大数
                	<input property="editor" class=nui-spinner  format="n0" showbutton="false" allowLimitValue="false" changeOnMousewheel="false" />
                </div>
                <div field="tenantmax" width="80" headerAlign="center" align="right" summaryType="sum">租户最大数
                	<input property="editor" class=nui-spinner  format="n0" showbutton="false" allowLimitValue="false" changeOnMousewheel="false" />
                </div>
                <div field="tenantsysmax" width="80" headerAlign="center" align="right" summaryType="sum">租户内系统最大数
                	<input property="editor" class=nui-spinner  format="n0" showbutton="false" allowLimitValue="false" changeOnMousewheel="false" />
                </div>
                <div field="tenantusermax" width="80" headerAlign="center" align="right" summaryType="sum">租户内用户最大数
                	<input property="editor" class=nui-spinner  format="n0" showbutton="false" allowLimitValue="false" changeOnMousewheel="false" />
                </div>
            </div>
        </div>
    </fieldset>
</body>
</html>
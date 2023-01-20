<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>	
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<!-- 
  - Author(s): mengyy
  - Date: 2020-04-21 11:12:26
  - Description:
-->
<head>
<title>许可申请表单</title>
</head>
<body>
    <div id="form_" >
		<fieldset id="field1" style="border:solid 1px #aaa;padding:3px;">
			<legend id="legend_">许可申请表单</legend>
		    <table style="table-layout:fixed;">
		    	<tr>
			    	<td style="width:120px;" align="right">License发放类型：</td>
			        <td style="width:145px;">    
			            <input class="nui-dictcombobox" name="sendreas" id="sendreas_" dictTypeId="CS_SENDREAS" onvaluechanged="changeSendreas"/>
			        </td>
					<td style="width: 120px;" align="right">许可文件个数：</td>
					<td style="width:140px;">
						<input class="nui-hidden"name="licfilenumMax" id="licfilenumMax_" />
						<input class="nui-spinner" name="licfilenum" id="licfilenum_" format="n0" showbutton="false" allowLimitValue="false" changeOnMousewheel="false" onvaluechanged="changelicfilenum"/>
					</td>
					<td style="width: 120px;" align="right">许可绑定CPU个数：</td>
					<td style="width:150px;" colspan="1">
						<input class="nui-spinner" name="licfilebindcpu" id="licfilebindcpu_" format="n0" showbutton="false" allowLimitValue="false" changeOnMousewheel="false" />
					</td>
		    	</tr>
		    	<tr>
		            <td style="width:120px;" align="right">产品名称：</td>
		            <td style="width:145px;"colspan="3">    
		                <input name="prodname" id="prodname_" url="com.primeton.eos.ame_product.QuoProdType.getQuoProdTypeTree.biz.ext" required="true" style="width:400px;" class="nui-treeselect" 
		                textField="prodtypename" valueField="prodtypeid" parentField="parenttypeid" dataField="quoProdtypes" showTreeIcon="true" valueFromSelect="true"
						showNullItem="true" multiSelect="false" expandOnLoad="true" showFolderCheckBox="true" onbeforenodeselect="beforenodeselect" allowInput="true" readonly="readonly"/>
		            </td>
		            <td style="width:120px;" align="right">旧产品名称：</td>
		            <td style="width:150px;"colspan="1">    
		                <input name="prodnameold" id="prodnameold_" url="com.primeton.eos.ame_product.QuoProdType.getQuoProdTypeTree.biz.ext" style="width:400px;" class="nui-treeselect" 
		                textField="prodtypename" valueField="prodtypeid" parentField="parenttypeid" dataField="quoProdtypes" showTreeIcon="true" valueFromSelect="true"
						showNullItem="true" multiSelect="false" expandOnLoad="true" showFolderCheckBox="true" onbeforenodeselect="beforenodeselect" allowInput="true"/>
		            </td>
		    	</tr>
		    	<tr>
		            <td style="width:120px;" align="right">IP地址：</td>
		            <td style="width:145px;" colspan="3">    
		                <input name="bindip" id="bindip_" required="true" class="nui-textarea" style="width:400px"/>
		            </td>
		            <td style="width:120px;" align="right">旧IP地址：</td>
		            <td style="width:150px;" colspan="1">    
		                <input name="bindipold" id="bindipold_" class="nui-textarea" style="width:400px"/>
		            </td>
		    	</tr>
		    </table>
		    <div id ="dyProdForm_"></div>
		</fieldset>
	</div>
</body>
</html>
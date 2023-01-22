<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>	
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<!-- 
  - Author(s): mengyy
  - Date: 2020-04-21 11:12:26
  - Description:
-->
<head>
<title>分包报备表单</title>
</head>
<body>
    <div id="form_purSubCont" >
		<fieldset id="field1" style="border:solid 1px #aaa;padding:3px;">
    		<input name="purSubCont.fileids" id="fileids1" class="nui-hidden"/>
			<input name="purSubCont.subcontid" class="nui-hidden"/>
			<input name="purSubCont.processinstid" id="processinstid" class="nui-hidden"/>
			<input name="purSubCont.applystatus" id="applystatus" class="nui-hidden"/><!-- 发起/暂存 -->
			<input name="purSubCont.custname" id="custname" class="nui-hidden"/>
            <legend>分包报备表单</legend>
            <table style="table-layout:fixed;border-spacing: 0px 8px;" id="table_file">
            	<tr>
                    <td style="width:140px;" align="right">客户：</td>
                    <td style="width:150px;"colspan="3">    
                        <input class="nui-buttonedit" style="width:380px" name="purSubCont.custid" id="custid" value="" text="" onbuttonclick="onButtonEdit" showClose="true" oncloseclick="onCloseClick" required="true" allowInput="false"/>
                    </td>
                    <td style="width:120px;" align="right">项目名称：</td>
                    <td style="width:150px;" colspan="3">    
                        <input class="nui-textbox"name="purSubCont.projectname" required="true" id="projectname" style="width:380px"/>
                    </td>
            	</tr>
            	<tr>
            		<td style="width:100px;" align="right">项目对应阶段：</td>
                    <td style="width:150px;" colspan="1">    
                        <input name="purSubCont.outstatus" id="outstatus" required="true" class="nui-dictcombobox" dictTypeId="MIS_PROJOUTSTATUS"  allowInput="false"/>
                    </td>
                    <td style="width:100px;" align="right">分包类型：</td>
                    <td style="width:150px;" colspan="1">    
                        <input name="purSubCont.subtype" id="subtype" required="true" class="nui-dictcombobox" dictTypeId="PURSUBTYPE"  allowInput="false" multiSelect="true"/>
                    </td>
                    <td style="width:120px;display: none;" align="right" id="project1">对应系统项目：</td>
                    <td style="width:150px;display: none;" colspan="3" id="project2"> 
                    	<input name="purSubCont.projectno" id="projectno" onbuttonclick="selectProject" class="nui-buttonedit" allowInput="false" style="width:380px"/>
                    </td>
            	</tr>
            	<tr>
                    <td style="width:100px;" align="right">产品金额(万元)：</td>
                    <td style="width:150px;"colspan="1">    
                         <input name="purSubCont.prodmon" id="prodmon" onvaluechanged="changeMon" class="nui-spinner" required="true" format="n2"  allowLimitValue="false" changeOnMousewheel="false"  showbutton="false" />
                    </td>
                    <td style="width:100px;" align="right">服务金额(万元)：</td>
                    <td style="width:150px;"colspan="1">    
                         <input name="purSubCont.servmon" id="servmon" onvaluechanged="changeMon" class="nui-spinner" required="true" format="n2"  allowLimitValue="false" changeOnMousewheel="false"  showbutton="false" />
                    </td>
                    <td style="width:100px;" align="right">总金额(万元)：</td>
                    <td style="width:150px;"colspan="1">    
                         <input name="purSubCont.contsum" id="contsum" class="nui-spinner" required="true" format="n2"  allowLimitValue="false" changeOnMousewheel="false"  showbutton="false" readonly="readonly" />
                    </td>
            	</tr>
            	<tr >
            		<td style="width:100px;" align="right">拟承接供应商1：</td>
                    <td style="width:150px;" colspan="3">    
                        <input name="purSubCont.supplier1" id="supplier1" style="width:380px" required="true" class="nui-textbox" />
                    </td>
                    <td style="width:100px;" align="right">拟采购金额1(万元)：</td>
                    <td style="width:150px;"colspan="1">    
                         <input name="purSubCont.purmon1" id="purmon1" required="true"  class="nui-spinner" format="n2"  allowLimitValue="false" changeOnMousewheel="false"  showbutton="false" />
                    </td>
            	</tr>
            	<tr>
            		<td style="width:100px;" align="right">拟承接供应商2：</td>
                    <td style="width:150px;" colspan="3">    
                        <input name="purSubCont.supplier2" id="supplier2" style="width:380px" class="nui-textbox" />
                    </td>
                    <td style="width:100px;" align="right">拟采购金额2(万元)：</td>
                    <td style="width:150px;"colspan="1">    
                         <input name="purSubCont.purmon2" id="purmon2" class="nui-spinner" format="n2"  allowLimitValue="false" changeOnMousewheel="false"  showbutton="false" />
                    </td>
            	</tr>
                <tr>
	            	<td style="width:90px;" align="right">采购背景说明：</td>
	                <td style="width:150px;" colspan="7">    
	                    <input name="purSubCont.background" id="background" required="true" class="nui-textarea"style="width:99%;height: 140px;"  maxLength="1800"/>
	                </td>
                </tr>
                <tr>
	            	<td style="width:90px;" align="right">采购内容：</td>
	                <td style="width:150px;" colspan="7">    
	                    <input name="purSubCont.purcontent" id="purcontent" required="true" class="nui-textarea"style="width:99%;height: 140px;"  maxLength="1800"/>
	                </td>
                </tr>
                <tr>
	            	<td style="width:90px;" align="right">普元承担内容：</td>
	                <td style="width:150px;" colspan="7">    
	                    <input name="purSubCont.bearcontent" id="bearcontent" required="true" class="nui-textarea"style="width:99%;height: 140px;"  maxLength="1800"/>
	                </td>
                </tr>
                <tr id="saleleader" style="display: none;">
	            	<td style="width:90px;" align="right">业务BG负责人：</td>
	                <td style="width:150px;" colspan="7">    
	                    <input class="nui-textboxlist" name="" id="saleleaders" searchField="name" style="width:98%"
    						url="com.primeton.mis.contract.contractApproval.getEmpByName.biz.ext" value="" text=""
    						textField="EMPNAME" valueField="USERID" allowInput="true"/>
	                </td>
                </tr>
                <tr id="leader" style="display: none;">
	            	<td style="width:90px;" align="right">审批人：</td>
	                <td style="width:150px;" colspan="7">    
	                    <input class="nui-textboxlist" name="" id="leaders" searchField="name" style="width:98%"
    						url="com.primeton.mis.contract.contractApproval.getEmpByName.biz.ext" value="" text=""
    						textField="EMPNAME" valueField="USERID" allowInput="true"/>
	                </td>
                </tr>
            </table>
		</fieldset>
	</div>
</body>
</html>
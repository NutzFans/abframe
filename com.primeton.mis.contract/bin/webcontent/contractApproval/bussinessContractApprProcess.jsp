<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>	
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@include file="/common/common.jsp"%> 
<h:script src='<%="/common/scripts/eos-web.js"%>' />
<%
	String contextPath=request.getContextPath();
 %>
<html xmlns="http://www.w3.org/1999/xhtml">
<!-- 
  - Author(s): mengyy
  - Date: 2018-01-12 16:38:45
  - Description:
-->
<head>
    <title>合同预处理审核</title>
    <meta http-equiv="content-type" content="text/html; charset=UTF-8" />
	<script src="<%= request.getContextPath() %>/common/nui/nui.js" type="text/javascript"></script>
	<link id="css_skin" rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/coframe/tools/skins/skin1/style.css" />
	<link href="../demo.css" rel="stylesheet" type="text/css" />
	<link rel="stylesheet" href="<%=request.getContextPath()%>/common/nui/resource/kindeditor/themes/default/default.css" />
	<link rel="stylesheet" href="<%=request.getContextPath()%>/common/nui/resource/kindeditor/plugins/code/prettify.css" />
	<script charset="utf-8" src="<%=request.getContextPath()%>/common/nui/resource/kindeditor/kindeditor-all-min.js"></script>
	<script charset="utf-8" src="<%=request.getContextPath()%>/common/nui/resource/kindeditor/lang/zh-CN.js"></script>
	<script charset="utf-8" src="<%=request.getContextPath() %>/common/nui/resource/kindeditor/plugins/code/prettify.js"></script>
	<script type="text/javascript" src="<%=request.getContextPath() %>/common/components/swffileupload/swfupload/swffileupload.js"></script>
    <style type="text/css">
    html, body
    {
        font-size:12px;
        padding:0;
        margin:0;
        border:0;
        height:100%;
        overflow: visible;
    }
    .asLabel
    {
        border:0;background-color:#F5F5F5;cursor:default;    
    }
    </style>
</head>
<body style="width:100%;height:100%;padding:0px;margin:0px;">
<div class="nui-fit" style="border:solid 0px #aaa;padding:0px;width:100%;">
	<div class="mini-panel" title="编辑合同审批流程" style="width:100%;">
		<!-- 提示信息展示  -->
		<jsp:include page="/ame_common/ameFlowOperTips/ameFlowOperTipsInfo.jsp"/>
	<!-- 
		针对OEM合同、框架合同，需要新增订单
		1、增加合同时允许选择对应的项目（选择后项目外部状态变更为：项目实施阶段
		2、合同收入预测提供表格（子表）方式增加
		3、合同订单处理提供表格(子表）方式增加
	 -->
    <div id="form1" >
    	<input name="cscontract.fileids" id="fileids" class="nui-hidden"/>
        <input name="cscontract.fileids1" id="fileids1" class="nui-hidden" />
        <input name="cscontract.fileids2" id="fileids2" class="nui-hidden" />
		<input name="cscontract.eStatus" id="eStatus" class="nui-hidden"/><!-- 暂时保存/发起 -->
        <input name="cscontract.contractid" id="conId" class="nui-hidden" />
        <input class="nui-hidden" name="cscontract.salename" id="salename"/>
        <input class="nui-hidden" name="cscontract.org" id="org"/>
        <input class="nui-hidden" id="t_rownum" value="1"/>
        <input class="nui-hidden" name="cscontract.projectId" id="projectId" />
        <input class="nui-hidden" name="cscontract.custname" id="custname" />
        <fieldset style="border:solid 1px #aaa;padding:3px;width: 100%;">
            <legend>合同基本信息</legend>
            <div style="padding:5px;">
            <table style="table-layout:fixed;" id="table_file">
                <tr>
                    <td style="width:140px;" align="right">合同类型：</td>
                    <td style="width:150px;" colspan="2">    
                        <input class="mini-dictcombobox" name="cscontract.contracttype" id="contracttype" dictTypeId="MIS_CONTRACTTYPE" required="true"/>
                    </td>
                    <td style="width:140px;" align="right">合同号：</td>
                    <td style="width:320px;"colspan="2">    
                        <input name="cscontract.contid" style="width:300px" class="nui-textbox"/>
                    </td>
                </tr>
                <tr>
                	<td style="width:140px;" align="right">合同名称（项目）：</td>
                    <td style="width:320px;" colspan="2">    
                        <input name="cscontract.projectname" style="width:320px" class="nui-textbox"/>
                    </td>
                    <td style="width:140px;" align="right">签署单位：</td>
                    <td style="width:320px;" colspan="2">    
                        <input class="nui-buttonedit" style="width:300px" name="cscontract.misCustinfo.custid" id="custid" value="" text="" onbuttonclick="onButtonEdit" showClose="true" oncloseclick="onCloseClick" required="true" allowInput="false"/>
                    </td>
                    
                </tr>
                <tr>
                    <td style="width:140px;" align="right">客户类型：</td>
                    <td style="width:150px;"colspan="2">    
                        <input name="cscontract.signtarget"  id="signtarget" class="mini-dictcombobox" onvaluechanged="changesigntarget(e)"  dictTypeId="CS_SIGNTARGET" multiSelect="true"/>
                    </td>
                    <td style="width:140px;" align="right">最终用户：</td>
                    <td style="width:320px;" colspan="2">    
                        <input class="nui-buttonedit" style="width:300px" name="cscontract.userid" id="userid" value="" text="" onbuttonclick="onButtonEdit" showClose="true" oncloseclick="onCloseClick" required="true" allowInput="false"/>
                    </td>
                </tr>
                <tr>
                	<td style="width:140px;" align="right">是否已提供项目预算：</td>
					<td style="width:150px;">  
						<input id="purChaseYesOrNo" class="nui-dictcombobox"   required="true" readonly="readonly" dictTypeId="MIS_YN"  allowInput="false"/>
					</td>
                    <td style="width:120px;" align="right">是否禁止分包外包：</td>
                    <td style="width:150px;">
                    	<input class="nui-dictcombobox" name="cscontract.isforbid" id="isforbid" dictTypeId="MIS_YN" onvaluechanged="changedisforbid(e)" /><!-- showNullItem="true"  -->
                    </td>
                    <td style="width:120px;" align="right">是否高风险标识：</td>
                    <td style="width:150px;">
                    	<input class="nui-dictcombobox" style="width:135px"  name="cscontract.ishighrisk" id="ishighrisk" onvaluechanged="changedishighrisk(e)" dictTypeId="MIS_YN"/>
                    </td>
                </tr>
                <tr>
                    <td style="width:120px" align="right">SOA金额：</td>
                    <td style="width:150px;">    
                        <input name="cscontract.soamon" id="soamon" class="nui-spinner" format="n2"  allowLimitValue="false" changeOnMousewheel="false"  showbutton="false" />
                    </td>
                    <td style="width:120px;" align="right">云计算金额：</td>
                    <td style="width:150px;">    
                        <input name="cscontract.yjsmon" id="yjsmon" class="nui-spinner" format="n2"  allowLimitValue="false" changeOnMousewheel="false"  showbutton="false" />
                    </td>
                    <td style="width:120px;" align="right">大数据金额：</td>
                    <td style="width:150px;">    
                        <input name="cscontract.dsjmon" style="width:135px" id="dsjmon" class="nui-spinner" format="n2"  allowLimitValue="false" changeOnMousewheel="false"  showbutton="false" />
                    </td>
                    
                </tr>
                <tr>
                    <td style="width:120px;" align="right">移动金额：</td>
                    <td style="width:150px;">    
                        <input  name="cscontract.mobilemon" id="mobilemon" class="nui-spinner" format="n2"  allowLimitValue="false" changeOnMousewheel="false"  showbutton="false" />
                    </td>
                    <td style="width:120px;" align="right">其他金额：</td>
                    <td style="width:150px;">    
                        <input  name="cscontract.qtmon" id="qtmon" class="nui-spinner" format="n2"  allowLimitValue="false" changeOnMousewheel="false"  showbutton="false" />
                    </td>
                    <td id="temp1" style="width:120px;" align="right">行业：</td>
                    <td id="temp4" style="width:150px;">    
                        <input class="mini-dictcombobox" name="cscontract.industry" dictTypeId="MIS_INDUSTRY_SUBDIVISION" style="width:135px" multiSelect="true"/>
                    </td>
                </tr>
                <tr>
                    <td style="width:120px;" align="right">合同总金额：</td>
                    <td style="width:150px;">    
                        <input name="cscontract.contsum" id="contsum" class="nui-spinner" format="n2"  allowLimitValue="false" changeOnMousewheel="false"  showbutton="false" readonly="readonly"/>
                    </td>
                    <td style="width:120px;" align="right">产品金额：</td>
                    <td style="width:150px;">    
                        <input name="cscontract.prodmon" id="prodmon" class="nui-spinner" format="n2"  allowLimitValue="false" changeOnMousewheel="false"  showbutton="false" readonly="readonly"/>
                    </td>
                    <td style="width:120px;" align="right">服务金额：</td>
                    <td style="width:150px;">    
                        <input class="nui-spinner" format="n2"  allowLimitValue="false" changeOnMousewheel="false"  showbutton="false"  name="cscontract.servmon" style="width:135px"  id="servmon" readonly="readonly"/>
                    </td>
                </tr>
                <tr>
                    <td style="width:120px;" align="right">采购1：</td>
                    <td style="width:150px;">    
                        <input name="cscontract.servsubmon" id="servsubmon" class="nui-spinner" format="n2"  allowLimitValue="false" changeOnMousewheel="false"  showbutton="false" readonly="readonly"/>
                    </td>
                	<td style="width:120px;" align="right">采购2：</td>
                    <td style="width:150px;">    
                        <input class="nui-spinner" format="n2"  allowLimitValue="false" changeOnMousewheel="false"  showbutton="false"  name="cscontract.othmon"  id="othmon"  readonly="readonly" />
                    </td>
                    <!-- <td style="width:120px;" align="right">质保金比例：</td>
                    <td style="width:150px;">    
                        <input class="nui-textbox" name="cscontract.zbjbl" style="width:135px" />
                    </td> -->
                </tr>
                <tr id="temp2" style="display:">
                    <td style="width:140px;" align="right">协议有效期开始：</td>
                    <td style="width:150px;">    
                        <input name="cscontract.xystart" class="nui-datepicker" emptyText="请选择日期"/>
                    </td>
                    <td style="width:140px;" align="right">协议有效期结束：</td>
                    <td style="width:150px;">    
                        <input name="cscontract.xyend" class="nui-datepicker" emptyText="请选择日期"/>
                    </td>
                    <td style="width:140px;" align="right">是否有排他合作：</td>
                    <td style="width:150px;">   
                        <input class="mini-dictcombobox" name="cscontract.ispt" style="width:135px" id="ispt" dictTypeId="MIS_YN"/>
                    </td>
                </tr>
                <tr id="temp3" style="display:">
                    <td style="width:140px;" align="right">排他合作的条件：</td>
                    <td style="width:690px;" colspan="5">    
                        <input name="cscontract.ptcondition" id="ptcondition" class="nui-textarea" style="width:840px;" />
                    </td>
                </tr>
                <tr>
                	<td style="width:140px;" align="right">合同备注说明：</td>
                    <td style="width:690px;" colspan="5">    
                        <input name="cscontract.paycondition" id="paycondition" class="nui-hidden"/>
				   		<textarea id="ke" name="content1" style="width:100%;height:200px;visibility:hidden;"></textarea>
                    </td> 
                </tr>
                <tr>
                	<td style="width:140px;"></td>
			   		<td colspan="5">
			   		<span class="word_surplus"></span>
			   		</td>
			   	</tr>
            </table>
        </div>
        </fieldset>
        <fieldset id="project" style="border:solid 1px #aaa;padding:3px;width: 100%;">
        	<legend>合同项目信息</legend>
        		<div style="padding:5px;">
	        	<table style="table-layout:fixed;" id="table_file1">
		            <tr>
						<td align="right" style="width:120px">项目编号：</td>
						<td  style="width:180px" colspan="2">
						<input name="cscontract.projectno" id="projectno" style="width:180px" onbuttonclick="selectProject" class="nui-buttonedit" allowInput="false"/>
						</td>	
						<td align="right" width="120px">对应客户：</td>
						<td id="rdproject.custname" colspan="2"  style="width:180px" class = "asLabel"></td>
					</tr>
					<tr>
						<td align="right" style="width:120px">项目名称：</td>
						<td id="rdproject.projectName" colspan="3"  style="width:180px" class = "asLabel"></td>
						<td align="right" style="width:120px"> 受益部门：</td>
						<td id="omOrganization.orgname" colspan="2" style="width:180px"  class = "asLabel"></td>
					</tr>
					<tr>
						<td align="right" style="width:120px">项目经理：</td>
						<td id="rdproject.manager" style="width:200px" class = "asLabel"></td>
						<td align="right" style="width:120px">项目类型：</td>
						<td id="rdproject.projectType" style="width:250px" class = "asLabel"></td>
					</tr>
					<tr>
						<td align="right" style="width:120px">是否延续性项目：</td>
						<td id="rdproject.isconproj" style="width:200px" class = "asLabel"></td>
						<td align="right" style="width:120px">项目开始日期：</td>
						<td id="rdproject.startdate" style="width:150px" class = "asLabel"></td>
						<td align="right" style="width:120px">预计结束日期：</td>
						<td id="rdproject.expenddate" style="width:250px" class = "asLabel"></td>
					</tr>
					<tr>
						<td align="right" style="width:120px">项目内部状态：</td>
						<td id="rdproject.projectStatus" style="width:200px" class = "asLabel"></td>
						<td align="right" style="width:120px"> 项目外部状态：</td>
						<td  style="width:150px" id="rdproject.outstatus" class = "asLabel"></td>
						<td></td>
						<td></td>
					</tr>
				</table>
			</div>
        </fieldset>
		<div id="tabs1" class="nui-tabs" activeIndex="0" style="width:100%;overflow: auto;">
			<div title="合同销售人员" >
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
		        	<div id="sales_grid" class="nui-datagrid" style="width:100%;;height:auto;" allowResize="true" oncellendedit="doCal"
				        dataField="cscontractsales"
				        onshowrowdetail="onShowRowDetail" showPager="false" allowCellEdit="true" allowCellSelect="true" multiSelect="true" editNextOnEnterKey="true">			        
				        <div property="columns">            
				            <div type="expandcolumn">#</div>
				            <div type="checkcolumn"></div>
				            <!-- <div name="oldsalename" field="oldsalename" width="75" headerAlign="center">原销售姓名
				            	<input property="editor" class="nui-textbox" style="width:100%;"/>
				            </div> -->
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
				            <!-- <div field="techdirector" width="0" headerAlign="center" >技术负责人ID</div>
				            <div field="techdirectorname" width="70" headerAlign="center" >技术负责人
				            	<input property="editor" class="nui-buttonedit" onbuttonclick="onButtonEdit2" style="width:100%;" required="true" allowInput="false"/>
				            </div>
				            <div field="techorg" width="0" headerAlign="center" >技术负责部门ID</div>
				            <div field="techorgname" width="90" headerAlign="center" >技术负责部门</div> -->
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
				            <!-- <div field="netservmon" dataType="currency" width="80" headerAlign="center" align="right" >服务净额
				            	<input property="editor" class="nui-textbox" style="width:100%;" vtype="float" allowInput="false"/>
				            </div>
				            <div field="contpolmon" dataType="currency" width="auto" headerAlign="center" align="right" >合同净额
				            	<input property="editor" class="nui-textbox" style="width:100%;" vtype="float" allowInput="false"/>
				            </div> -->
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
				        <div id="product_grid" class="nui-datagrid" style="width:100%;height:auto;" oncellendedit="doSubCal"
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
				                <div field="prodmon" dataType="currency" width="100" align="right" headerAlign="center">产品金额
				                	<input property="editor" class="nui-textbox" vtype="float" inputstyle="text-align: right;"/>
				                </div>
				                <div field="prodsubmon" dataType="currency" width="90" align="right" headerAlign="center">产品采购1
				                	<input property="editor" class="nui-textbox" vtype="float" inputstyle="text-align: right;"/>
				                </div>
				                <div field="othmon" dataType="currency" width="90" align="right" headerAlign="center">产品采购2
				                	<input property="editor" class="nui-textbox" vtype="float"  inputstyle="text-align: right;"/>
				                </div>
				                <!-- <div field="netprodmon" dataType="currency" width="90" align="right" headerAlign="center">产品净额
				                	<input property="editor" class="nui-textbox" vtype="float" allowInput="false" inputstyle="text-align: right;"/>
				                </div> -->
				                <div field="prodwbmon" dataType="currency" width="90" align="right" headerAlign="center">产品维保金额
				                	<input property="editor" class="nui-textbox" vtype="float" inputstyle="text-align: right;"/>
				                </div>
				                <div field="prodwbsubmon" dataType="currency" width="90" align="right" headerAlign="center">产品维保分包费
				                	<input property="editor" class="nui-textbox" vtype="float" inputstyle="text-align: right;"/>
				                </div>
				                <div field="prodwbothmon" dataType="currency" width="90" align="right" headerAlign="center">产品维保服务费
				                	<input property="editor" class="nui-textbox" vtype="float" inputstyle="text-align: right;"/>
				                </div>
				               <!--  <div field="prodwbnetmon" dataType="currency" width="90" align="right" headerAlign="center">产品维保净额</div> -->
				                <div field="buyprod" width="150" align="left" headerAlign="center">说明
				                	<input property="editor" class="nui-textarea" inputstyle="text-align: left;" style="width:100px;" minWidth="100" minHeight="50"/>
				                </div>
				            </div>
				        </div>    
				    </div>
	            </div>
			</div>
			<!-- 合同收款 -->
        	<div title="合同收款预估" >
        		<fieldset style="border:solid 1px #aaa;padding:3px;width: 98%;">
        		<legend>合同收款预估</legend>
	        	<div style="width:140px;">
			        <div class="nui-toolbar" style="border-bottom:0;padding:0px;">
			            <table style="width:100%;">
			                <tr>
			                    <td style="width:100%;">
			                        <a class="nui-button" iconCls="icon-add" onclick="addRow('csGatherFc_grid')" plain="true">增加</a>
			                        <a class="nui-button" iconCls="icon-remove" onclick="removeRow('csGatherFc_grid')" plain="true">删除</a>
			                    </td>
			                </tr>
			            </table>           
			        </div>
			    </div>
	            <div id="csGatherFc_grid" class="nui-datagrid" frozenStartColumn="0" frozenEndColumn="4"  style="width:100%;height:auto;" dataField="csGatherFcs"
		            showPager="false" allowCellEdit="true" allowCellSelect="true" multiSelect="true" editNextOnEnterKey="true"
		            url="com.primeton.mis.contract.contract.getCsGatherFc.biz.ext" onrowclick="doUpdateCsGatherFc" 
		            oncellendedit="doCsGatherFcEnd" oncellbeginedit="doCsGatherFcBegin" 
		            showSummaryRow="true" ondrawsummarycell="drawCsGahterFcSum" allowCellWrap="true">			            
		            <div property="columns">
		            	<div type="checkcolumn"></div>
		                <div field="gatherno" width="80" headerAlign="center" align="center">收款确认次数
		                	<input property="editor" class="nui-textbox" />
		                </div>
		                <!-- AME_GATHERTYPE-收款类型：0-产品、1-服务、2-产品+服务 -->
		                <div field="gathertype" width="80" renderer="onGatherType" headerAlign="center" align="left">收款类型
		                	<input property="editor" class="nui-dictcombobox" multiSelect="false" dictTypeId="AME_GATHERTYPE"/>
		                </div>
		                <div field="gathertimedesc" width="180" headerAlign="center" align="left">收款确认时点描述
		                	<input property="editor" class="nui-textarea" style="width: 200px" minWidth="200" minHeight="50" />
		                </div>
		                <!-- 最初预计确认年月 -->
		                <div field="yearmonth" width="80" headerAlign="center" dateFormat="yyyy-MM" align="left">预计收款年月
		                	<input property="editor" class="nui-monthpicker" inputStyle="text-align: left"/>
		                </div>
		                <!-- 最新预计确认年月 -->
		                <div field="newyearmonth" width="80" headerAlign="center" dateFormat="yyyy-MM" align="left">预计收款年月
		                	<input property="editor" class="nui-monthpicker" inputStyle="text-align: left"/>
		                </div>
		                <div field="productsum" width="80" dataType="currency" headerAlign="center" align="right">预计产品额
		                	<input property="editor" class="nui-textbox" vtype="float" inputStyle="text-align: right"/>
		                </div>
		                <div field="servicesum" width="80" dataType="currency" headerAlign="center" align="right">预计服务额
		                	<input property="editor" class="nui-textbox" vtype="float" inputStyle="text-align: right"/>
		                </div>
		                <div field="fcsum" width="100" dataType="currency" headerAlign="center" align="right" summaryType="sum">预计收款金额</div>
		                <div field="fcreverate" width="80" headerAlign="center" align="right" numberFormat="p1">预计收款比例</div>
		                <div field="status" width="80" renderer="onGatherStatus" headerAlign="center" align="left">当前收款状态
		                	<input property="editor" class="nui-dictcombobox" dictTypeId="AME_GATHERSTATUS"/>
		                </div>
		                <div field="billstatus" width="80" renderer="onGatherBillStatus" headerAlign="center" align="left">收款开票状态
		                	<input property="editor" class="nui-dictcombobox" dictTypeId="MIS_GATHERBILL"/>
		                </div>
		                <div field="memo" width="150" headerAlign="center" align="left">说明
		                	<input property="editor" class="nui-textarea" style="width: 200px" minWidth="200" minHeight="50" />
		                </div>
		                <!-- 订单编号 -->
		                <!-- <div field="contorderno" width="auto" headerAlign="center" align="center">订单编号
		                	<input property="editor" class="nui-textbox" />
		                </div>
		                <div field="saleseva" width="70" headerAlign="center" renderer="onGenderSaleseva" align="center">销售评估
		                	<input property="editor" class="nui-dictcombobox" dictTypeId="MIS_YN" />
		                </div> -->
		            </div>
		        </div>
		        </fieldset>
		        <!--合同保函  -->
		        <fieldset style="border:solid 1px #aaa;padding:3px;width: 98%;">
		            <legend>合同保函记录</legend>
			    	<div style="width:140px;">
				        <div class="nui-toolbar" style="border-bottom:0;padding:0px;">
				            <table style="width:100%;">
				                <tr>
				                    <td style="width:100%;">
				                        <a class="nui-button" iconCls="icon-add" onclick="addRow('csContBack_grid')" plain="true">增加</a>
				                        <a class="nui-button" iconCls="icon-remove" onclick="removeRow('csContBack_grid')" plain="true">删除</a>
				                    </td>
				                </tr>
				            </table>           
				        </div>
				    </div>
		            <div id="csContBack_grid" class="nui-datagrid" style="width:100%;height:auto;" 
			            showPager="false" allowCellEdit="true" allowCellSelect="true" multiSelect="true" editNextOnEnterKey="true"
			            showSummaryRow="true" ondrawsummarycell="drawCsBackdepSum" dataField="ameCsContBacks" allowCellWrap="true">			            
			            <div property="columns">
			            	<div type="checkcolumn"></div>
			                <div field="type" width="0" headerAlign="center" align="center">类型
			                </div>
			                <div field="backdepmon" width="80" dataType="currency" headerAlign="center" align="right" summaryType="sum">金额
			                	<input property="editor" class="nui-textbox" vtype="float" inputStyle="text-align: right"/>
			                </div>
			                <div field="perioddesc" width="180" headerAlign="center" align="left">期间描述
			                	<input property="editor" class="nui-textarea" style="width: 200px" minWidth="200" minHeight="50" />
			                </div>
			                <div field="isdeal" width="80" renderer="onGenderSaleseva" headerAlign="center" align="left">保函是否已办理
			                	<input property="editor" class="nui-dictcombobox" dictTypeId="MIS_YN"/>
			                </div>
			                <div field="status" width="80" renderer="onCsBackDepStatus" headerAlign="center" align="left">状态
			                	<input property="editor" class="nui-dictcombobox" dictTypeId="CS_BACK_DEP"/>
			                </div>
			                <div field="returnmon" width="80" dataType="currency" headerAlign="center" align="right" summaryType="sum">退还金额
			                	<input property="editor" class="nui-textbox" vtype="float" inputStyle="text-align: right"/>
			                </div>
			                <div field="paydate" width="80" headerAlign="center"  renderer="onDealDate" dateFormat="yyyy-MM-dd" align="left">保函开具日期
			                	<input property="editor" class="nui-datepicker" inputStyle="text-align: left"/>
			                </div>
			                <div field="predredate" width="80" headerAlign="center" renderer="onDealDate" dateFormat="yyyy-MM-dd" align="left">保函到期日期
			                	<input property="editor" class="nui-datepicker" inputStyle="text-align: left"/>
			                </div>
			                <div field="remark" width="100" headerAlign="center" align="left">备注
			                	<input property="editor" class="nui-textarea" style="width: 200px" minWidth="200" minHeight="50" />
			                </div>
			            </div>
			        </div>
			        <div style="width:100%;">
				        <div class="nui-toolbar" style="border-bottom:0;padding:0px;">
				            <table style="width:100%;">
				            	<tr>
				                    <td style="width:20%;">
				                    	相关附件
				                    </td>
				                </tr>
			                 </table>           
				        </div>
				    </div>
			        <div id="grid_2" class="nui-datagrid" style="width:100%;height:auto;" showPager="false" sortMode="client" url="com.primeton.eos.ame_common.file.getFiles.biz.ext" dataField="files" allowCellEdit="true" allowCellSelect="true" multiSelect="true" editNextOnEnterKey="true">
						<div property="columns">
							<div type="indexcolumn" headerAlign="center" width="15" >编号</div>
							<div field="fileName"width="50" headerAlign="center" align="center" renderer="getfiledetail">附件名称</div>
							<div field="fileType" width="50" align="center" headerAlign="center" >附件类型</div>
							<div field="operatorname" width="50"headerAlign="center" align="center">操作员名称</div>
							<div field="fileTime" width="50" headerAlign="center" align="center" dateFormat="yyyy-MM-dd HH:mm:ss">附件上传时间</div>
						</div>
					</div>
			     	<jsp:include page="/ame_common/addFiles1.jsp"/>
		        </fieldset>
		        <!--合同保证金  -->
		        <fieldset style="border:solid 1px #aaa;padding:3px;width: 98%;">
		            <legend>合同保证金记录</legend>
			    	<div style="width:140px;">
				        <div class="nui-toolbar" style="border-bottom:0;padding:0px;">
				            <table style="width:100%;">
				                <tr>
				                    <td style="width:100%;">
				                        <a class="nui-button" iconCls="icon-add" onclick="addRow('csContDep_grid')" plain="true">增加</a>
				                        <a class="nui-button" iconCls="icon-remove" onclick="removeRow('csContDep_grid')" plain="true">删除</a>
				                    </td>
				                </tr>
				            </table>           
				        </div>
				    </div>
		            <div id="csContDep_grid" class="nui-datagrid" style="width:100%;height:auto;" 
			            showPager="false" allowCellEdit="true" allowCellSelect="true" multiSelect="true" editNextOnEnterKey="true"
			            showSummaryRow="true" ondrawsummarycell="drawCsBackdepSum"  dataField="ameCsContDeps" allowCellWrap="true">			            
			            <div property="columns">
			            	<div type="checkcolumn"></div>
			                <div field="type" width="0" headerAlign="center" align="center">类型
			                </div>
			                <div field="backdepmon" width="80" dataType="currency" headerAlign="center" align="right" summaryType="sum">金额
			                	<input property="editor" class="nui-textbox" vtype="float" inputStyle="text-align: right"/>
			                </div>
			                <div field="expno" width="100" headerAlign="center" align="center">付款申请单号
			                	<input property="editor" class="nui-textbox" />
			                </div>
			                <div field="perioddesc" width="180" headerAlign="center" align="left">期间描述
			                	<input property="editor" class="nui-textarea" style="width: 200px" minWidth="200" minHeight="50" />
			                </div>
			                <div field="isdeal" width="80" renderer="onGenderSaleseva" headerAlign="center" align="left">保证金是否已办理
			                	<input property="editor" class="nui-dictcombobox" dictTypeId="MIS_YN"/>
			                </div>
			                <div field="status" width="80" renderer="onCsBackDepStatus" headerAlign="center" align="left">状态
			                	<input property="editor" class="nui-dictcombobox" dictTypeId="CS_BACK_DEP"/>
			                </div>
			                <div field="returnmon" width="80" dataType="currency" headerAlign="center" align="right" summaryType="sum">退还金额
			                	<input property="editor" class="nui-textbox" vtype="float" inputStyle="text-align: right"/>
			                </div>
			                <div field="paydate" width="80" headerAlign="center" renderer="onDealDate" dateFormat="yyyy-MM-dd" align="left">保证金打款日期
			                	<input property="editor" class="nui-datepicker" inputStyle="text-align: left"/>
			                </div>
			                <div field="predredate" width="100" headerAlign="center" renderer="onDealDate" dateFormat="yyyy-MM-dd" align="left">保证金预计退回日期
			                	<input property="editor" class="nui-datepicker" inputStyle="text-align: left"/>
			                </div>
			                <div field="practredate" width="100" headerAlign="center" renderer="onDealDate" dateFormat="yyyy-MM-dd" align="left">保证金实际退回日期
			                	<input property="editor" class="nui-datepicker" inputStyle="text-align: left"/>
			                </div>
			                <div field="remark" width="100" headerAlign="center" align="left">备注
			                	<input property="editor" class="nui-textarea" style="width: 200px" minWidth="200" minHeight="50" />
			                </div>
			            </div>
			        </div>
			        <div style="width:100%;">
				        <div class="nui-toolbar" style="border-bottom:0;padding:0px;">
				            <table style="width:100%;">
				            	<tr>
				                    <td style="width:20%;">
				                    	相关附件
				                    </td>
				                </tr>
			                 </table>           
				        </div>
				    </div>
			        <div id="grid_3" class="nui-datagrid" style="width:100%;height:auto;" showPager="false" sortMode="client" url="com.primeton.eos.ame_common.file.getFiles.biz.ext" dataField="files" allowCellEdit="true" allowCellSelect="true" multiSelect="true" editNextOnEnterKey="true">
						<div property="columns">
							<div type="indexcolumn" headerAlign="center" width="15" >编号</div>
							<div field="fileName"width="50" headerAlign="center" align="center" renderer="getfiledetail">附件名称</div>
							<div field="fileType" width="50" align="center" headerAlign="center" >附件类型</div>
							<div field="operatorname" width="50"headerAlign="center" align="center">操作员名称</div>
							<div field="fileTime" width="50" headerAlign="center" align="center" dateFormat="yyyy-MM-dd HH:mm:ss">附件上传时间</div>
						</div>
					</div>
			     	<jsp:include page="/ame_common/addFiles2.jsp"/>
		        </fieldset>
        	</div>
        	<!-- 合同收入确认预估 -->
        	<div title="合同收入确认预估" >
	        	<div style="width:220px;">
			        <div class="nui-toolbar" style="border-bottom:0;padding:0px;">
			            <table style="width:100%;">
			                <tr>
			                    <td style="width:100%;">
			                        <a class="nui-button" iconCls="icon-add" onclick="addRow('csReveForecast_grid')" plain="true">增加</a>
			                        <a class="nui-button" iconCls="icon-remove" onclick="removeRow('csReveForecast_grid')" plain="true">删除</a>
			                        <a class="nui-button" iconCls="icon-split" onclick="maSplit()" plain="false">MA拆分</a>
			                    </td>
			                </tr>
			            </table>           
			        </div>
			    </div>
	            <div id="csReveForecast_grid" class="nui-datagrid" frozenStartColumn="0" frozenEndColumn="4" style="width:1055px;height:auto;" dataField="csReveForecasts"
		            showPager="false" allowCellEdit="true" allowCellSelect="true" multiSelect="true" editNextOnEnterKey="true"
		            url="com.primeton.mis.contract.contract.getCsReveForecast.biz.ext" onrowclick="doUpdateForecast" 
		            oncellendedit="doCsReveForecastEnd" oncellbeginedit="doCsReveForecastBegin" 
		            showSummaryRow="true" ondrawsummarycell="drawCsReveForecastSum" allowCellWrap="true">			            
		            <div property="columns">
		            	<div type="checkcolumn"></div>
		                <div field="reveno" width="55" headerAlign="center" align="center">收入次数
		                	<input property="editor" class="nui-textbox" />
		                </div>
		                <div field="revetype" width="120" renderer="onGenderInComeType" headerAlign="center" align="left">收入类型
		                	<input property="editor" class="nui-dictcombobox" multiSelect="true" dictTypeId="AME_REVETYPE"/>
		                </div>
		                <div field="newtype" width="160" renderer="onGenderNewType" headerAlign="center" align="left">新合同收入类型
		                	<input property="editor" class="nui-dictcombobox" multiSelect="true" dictTypeId="AME_NEWTYPE"/>
		                </div>
		                <div field="reveproof" width="150" renderer="onGenderInComeConv" headerAlign="center" align="left">收入确认证据
		                	<input property="editor" class="nui-dictcombobox" multiSelect="true" dictTypeId="MIS_INCOMECONV"/>
		                </div>
		                <div field="revetimedesc" width="130" headerAlign="center" align="left">收入时点描述
		                	<input property="editor" class="nui-textarea" style="width: 200px" minWidth="200" minHeight="50" />
		                </div>
		                <!-- 最初预计确认年月 -->
		                <div field="yearmonth" width="90" headerAlign="center" dateFormat="yyyy-MM" align="left">预计确认年月
		                	<input property="editor" class="nui-monthpicker" inputStyle="text-align: left"/>
		                </div>
		                <!-- 最初预计确认旬度 -->
		                <div field="monthperiod" width="90" renderer="onGenderMonthperiod" headerAlign="center" align="left">预计确认旬度
		                	<input property="editor" class="nui-dictcombobox" dictTypeId="AME_MONTHPERIOD"/>
		                </div>
		                <!-- 最新预计确认年月 -->
		               <!--  <div field="newyearmonth" width="90" headerAlign="center" dateFormat="yyyy-MM" align="left">最新预计确认年月
		                	<input property="editor" class="nui-monthpicker" inputStyle="text-align: left" format="yyyy-MM"/>
		                </div> -->
		                <!-- 最新预计确认旬度 -->
		                <!-- <div field="newmonthperiod" width="90" renderer="onGenderMonthperiod" headerAlign="center" align="left">最新预计确认旬度
		                	<input property="editor" class="nui-dictcombobox" dictTypeId="AME_MONTHPERIOD"/>
		                </div> -->
		                <div field="productsum" width="80" dataType="currency" headerAlign="center" align="right">预计产品额
		                	<input property="editor" class="nui-textbox" vtype="float" inputStyle="text-align: right"/>
		                </div>
		                <div field="servicesum" width="80" dataType="currency" headerAlign="center" align="right">预计服务额
		                	<input property="editor" class="nui-textbox" vtype="float" inputStyle="text-align: right"/>
		                </div>
		                <div field="masum" width="80" dataType="currency" headerAlign="center" align="right">预计MA额
		                	<input property="editor" class="nui-textbox" vtype="float" inputStyle="text-align: right"/>
		                </div>
		                <div field="fcsum" width="100" dataType="currency" headerAlign="center" align="right" summaryType="sum">预计确认金额
		                	<!-- <input property="editor" class="nui-textbox" vtype="float" inputStyle="text-align: right"/> -->
		                </div>
		                <div field="fcreverate" width="80" headerAlign="center" align="right" numberFormat="p1">预计确认比例
		                	<!-- <input property="editor" vtype="float" class="nui-textbox"/> -->
		                </div>
		                <div field="status" width="100" renderer="onGenderStatus" headerAlign="center" align="left">状态
		                	<input property="editor" class="nui-dictcombobox" dictTypeId="AME_REVESTATUS"/>
		                </div>
		                <!-- 订单编号 -->
		                <div field="contorderno" width="110" headerAlign="center" align="center">订单编号
		                	<input property="editor" class="nui-textbox" />
		                </div>
		                <div field="saleseva" width="70" headerAlign="center" renderer="onGenderSaleseva" align="center">销售评估
		                	<input property="editor" class="nui-dictcombobox" dictTypeId="MIS_YN" />
		                </div>
		                <div field="memo" width="150" headerAlign="center" align="left">说明
		                	<input property="editor" class="nui-textarea" />
		                </div>
		            </div>
		        </div>
		        <div style="width:220px;">
			        <div class="nui-toolbar" style="border-bottom:0;padding:0px;">
			            <table style="width:100%;">
			                <tr>
			                    <td style="width:100%;">
			                        <a class="nui-button" iconCls="icon-add" onclick="addRow('product_reve_grid')" plain="true">增加</a>
			                        <a class="nui-button" iconCls="icon-remove" onclick="removeRow('product_reve_grid')" plain="true">删除</a>
			                    </td>
			                </tr>
			            </table>           
			        </div>
			    </div>
	            <div id="product_reve_grid" class="nui-datagrid" style="width:1055px;height:auto;" oncellendedit="changeProdReve" showSummaryRow="true" ondrawsummarycell="drawProdReveSum" dataField="productReves" 
		            url="com.primeton.mis.contract.contractApproval.queryNewProdReve.biz.ext" showPager="false" allowCellEdit="true" allowCellSelect="true" multiSelect="true" editNextOnEnterKey="true">			            
		            <div property="columns">
		            	<div type="checkcolumn"></div>
		                <div field="reveno" width="100" headerAlign="center" >收入次数</div>
		                <div field="prodname" displayField="prodtypename" width="210" headerAlign="center" >产品名称
		                    <input property="editor"  url="com.primeton.eos.ame_product.QuoProdType.getQuoProdTypeTree.biz.ext" style="width:200px;" class="nui-treeselect" 
		                    textField="prodtypename" valueField="prodtypeid" parentField="parenttypeid" dataField="quoProdtypes" showTreeIcon="true" valueFromSelect="true"
								showNullItem="true" multiSelect="false" expandOnLoad="true" showFolderCheckBox="true" onbeforenodeselect="beforenodeselect" allowInput="true"/>
		                </div>
		                <div field="prodrevetype"  width="80" align="center"headerAlign="center" renderer="getReveProdtype">收入产品类型
		                	<input property="editor" class="nui-dictcombobox" dictTypeId="REVE_PRODTYPE" onvaluechanged="selectProdtype(e)" />
		                </div>
		                <div field="contsum" dataType="currency" width="80" align="right" headerAlign="center" summaryType="sum">参与分成合同额
		                	<input property="editor" class="nui-textbox" vtype="float" inputStyle="text-align: right"  allowInput="false" />
		                </div>
		                <div field="tax" dataType="currency" width="80" align="right" headerAlign="center" summaryType="sum">税金
		                	<input property="editor" class="nui-textbox" vtype="float" inputStyle="text-align: right" />
		                </div>
		                <div field="productrate" dataType="currency" width="80" align="right" headerAlign="center">产品税率
		                	<input property="editor" class="nui-textbox" vtype="float" inputStyle="text-align: right" />
		                </div>
		                <div field="contsum2" dataType="currency" width="80" align="right" headerAlign="center" summaryType="sum">不含税合同额
		                </div>
		                <div field="pratio" dataType="currency" width="80" align="right" headerAlign="center">分成比例
		                	<input property="editor" class="nui-textbox" vtype="float" inputstyle="text-align: right;"/>
		                </div>
		                <div field="pratiomon" dataType="currency" width="80" align="right" headerAlign="center" summaryType="sum">分成金额
		                </div>
		            </div>
		        </div>
        	</div>
        	<div title="合同附件">
        		<jsp:include page="/ame_common/detailFile.jsp"/>
				<jsp:include page="/ame_common/addFiles.jsp"/>
        	</div>
		</div>
       <fieldset style="border:solid 1px #aaa;padding:3px;">
            <legend>合同其他信息</legend>
            <div style="padding:5px;">
	        <table>
	            <tr>
                    <td style="width:140px;" align="right">MA服务开始日期：</td>
                    <td style="width:130px;">    
                        <input name="cscontract.servstartdate" id="servstartdate" class="nui-datepicker" allowInput="false"/>
                    </td>
	                <td style="width:120px;" align="right">MA服务结束日期：</td>
	                <td style="width:130px;">    
	                    <input name="cscontract.servenddate" id="servenddate" class="nui-datepicker" allowInput="false"/>
	                </td>
	                <td style="width:120px;" align="right">是否400转化合同：</td>
                    <td style="width:150px;">
                    	<input class="mini-dictcombobox" name="cscontract.istrans" style="width:135px"  id="istrans" dictTypeId="MIS_YN" />
                    </td>
                </tr>
                <tr style="display:">
                    <td style="width:140px;" align="right">服务数量类型：</td>
                    <td style="width:150px;">    
                        <input class="mini-dictcombobox" name="cscontract.servnumtype" dictTypeId="SERV_NUM_TYPE"/>
                    </td>
                    <td style="width:140px;" align="right">服务数量：</td>
                    <td style="width:150px;">    
                        <input class="nui-textbox" name="cscontract.servnum" vtype="float"/>
                    </td>
                    <td style="width:140px;" align="right">服务开始日期：</td>
                    <td style="width:150px;">    
                        <input name="cscontract.servstart" style="width:135px" class="nui-datepicker" emptyText="请选择日期"/>
                    </td>
                </tr>
                <tr>                	
                    <td style="width:140px;" align="right">赠送服务数量类型：</td>
                    <td style="width:150px;">    
                        <input class="mini-dictcombobox" name="cscontract.zsservtype" dictTypeId="SERV_NUM_TYPE"/>
                    </td>
                    <td style="width:140px;" align="right">赠送服务数量：</td>
                    <td style="width:150px;">    
                        <input class="nui-textbox" name="cscontract.zsservnum" vtype="float"/>
                    </td>
                    <td style="width:140px;" align="right">服务结束日期：</td>
                    <td style="width:150px;">    
                        <input name="cscontract.servend" style="width:135px" class="nui-datepicker" emptyText="请选择日期"/>
                    </td>
                </tr>
                <tr>
                   	<td style="width:120px;" align="right">销售线索：</td>
            		<td style="width:600px;" colspan="5">
            		<input class="nui-buttonedit" style="width:600px" name="cscontract.saleshapid" 
            			id="saleshapid" value="" text="" onbuttonclick="onButtonEdit" showClose="true" 
            			oncloseclick="onCloseClick" required="false" allowInput="false"/>
            		</td>
                </tr>
        	</table>
            </div>
        </fieldset>
    </div>
    <fieldset style="border:solid 1px #aaa;padding:3px;">
        <legend>审批人</legend>
        <div style="padding:5px;" >
            <table style="table-layout:fixed;">
	            <tr>
                    <td style="width:150px;" align="right">审批人：</td>
                    <td style="width:200px" align="left" colspan="3">
                    	<input id="cbl1" class="nui-checkboxlist" repeatItems="8" repeatLayout="table"
						textField="empname" valueField="userid" dataField="leaders" onbeforeselect="onbeforeselect(e)" onvaluechanged="setspr(e)" 
						url="com.primeton.mis.contract.contractApproval.getLeaders.biz.ext" />
						
	   					<input id="lookup2" class="nui-textboxlist"  searchField="name" style="width:800px"
    						url="com.primeton.mis.contract.contractApproval.getEmpByName.biz.ext" onvaluechanged="setspr1(e)" value="" text=""
    						textField="EMPNAME" valueField="USERID"/>
	   				</td>
                </tr>
            </table>
        </div>
    </fieldset>
    <div id="email" style="width: 970px;">
    	<fieldset style="border:solid 1px #aaa;padding:3px;">
    		<legend>邮件发送</legend>
    		<div style="padding:5px;" >
        		<input name="mailinfo.attaches" id="attaches" class="nui-hidden" />
    			<table style="table-layout:fixed;">
    				<tr>
    					<td style="width:150px;" align="right">收件人：</td>
    					<td>
    						<input id="mailtolist" name="mailinfo.to" class="nui-textboxlist"  searchField="name" style="width:600px"
        						url="com.primeton.mis.contract.contractApproval.getEmpByName.biz.ext" onvaluechanged="setsjr(e)" value="" text=""
        						textField="EMPNAMES" valueField="OEMAIL"/>
    					</td>
    				</tr>
    				<tr>
    					<td style="width:150px;" align="right">抄送人：</td>
    					<td>
    						<input id="mailcclist"  name="mailinfo.cc" class="nui-textboxlist"  searchField="name" style="width:600px"
								url="com.primeton.mis.contract.contractApproval.getEmpByName.biz.ext" value="" text=""
								textField="EMPNAMES" valueField="OEMAIL"/>
    					</td>
    				</tr>
    				<tr>
    					<td style="width:150px;"  align="right" >邮件主题：</td>
    					<td><input  name="mailinfo.subject"  id="subject" class="nui-textbox"  style="width:700px"/>
    					</td>
    				</tr>
    				<tr>
    					<td style="width:150px;" align="right" valign="top">正文：</td>
    					<td><input name="mailinfo.message" id="message" class="nui-hidden"  style="width:750px;"/>
    						<textarea id="ke1" name="content2" style="width:100%;height:680px;visibility:hidden;"></textarea>
    					</td>
    				</tr>
    				<tr>
    					<td style="width:150px;" align="right">邮件附件：</td>
    					<td>
    					<div id="grid_1" class="nui-datagrid" style="width:100%;height:auto;" showPager="false" sortMode="client" url="com.primeton.eos.ame_common.file.getFiles.biz.ext" dataField="files" allowCellEdit="true" allowCellSelect="true" multiSelect="true" editNextOnEnterKey="true">
							<div property="columns">
                				<div type="checkcolumn"></div>
								<div type="indexcolumn" headerAlign="center" width="15" >编号</div>
								<div field="fileName"width="50" headerAlign="center" align="center" renderer="getfiledetail1">附件名称</div>
								<div field="fileType" width="50" align="center" headerAlign="center" >附件类型</div>
								<div field="operatorname" width="50"headerAlign="center" align="center">操作员名称</div>
								<div field="fileTime" width="50" headerAlign="center" align="center" dateFormat="yyyy-MM-dd HH:mm:ss">附件上传时间</div>
							</div>
						</div>
						</td>
    				</tr>
    			</table>
    		</div>
    	</fieldset>
    </div>
    <form id="opioionform" method="post">
		<input name="misOpinion.auditstatus" value="1" class="nui-hidden" />
	    <input name="misOpinion.processinstid" id="processinstid" class="nui-hidden" />
	    <input name="misOpinion.processinstname" id="processinstname" class="nui-hidden" />
	    <input name="misOpinion.activitydefid" id="activitydefid" class="nui-hidden" />
	    <input name="misOpinion.workitemid" id="workitemid" class="nui-hidden" />
	    <input name="misOpinion.workitemname" id="workitemname" class="nui-hidden" />
	    <input name="misOpinion.isshow" id="isshow" class="nui-hidden" />
		<fieldset style="border:solid 1px #aaa;padding:3px;">
	        <legend>审批意见列表</legend>
        	<div id="datagrid1" class="nui-datagrid" style="width:100%;height:auto;" dataField="misOpinions"
			    url="com.primeton.eos.ame_pur.purContractProcess.queryAuditOpinions.biz.ext"  idField="id" allowResize="true"
			    allowAlternating="true" multiSelect="true" showPager="false" allowCellWrap="true">
			    <div property="columns">
			    	<div type="indexcolumn" headerAlign="center" width="30" >编号</div>
			        <div field="operatorname" width="50" headerAlign="center" align="center">处理人</div>
			        <div field="workitemname" width="80" align="center" headerAlign="center">处理环节</div>
			        <div field="auditstatus" renderer="onCheckRenderer" width="80" align="center" headerAlign="center">处理结果</div>
			        <div field="auditopinion" width="150" headerAlign="center">处理意见</div>
			        <div field="time" width="100" headerAlign="center" align="center" dateFormat="yyyy-MM-dd HH:mm:ss">处理时间</div>
			        <div field="orgname" width="100" align="center" headerAlign="center">处理人所在机构</div>
			        <div field="files" renderer="onFileRenderer" width="100" hight="100"  align="center" headerAlign="center">附件</div>
			    </div>
			</div>
	        <div style="padding:5px;" id="opinionHide">
	            <table style="table-layout:fixed;">
	            	<tr>
	                    <td style="width:150px;" align="right">审核结果：</td>
	                    <td style="width:250px;">  
							<input name="misOpinion.auditstatus" id="auditstatus" class="mini-dictradiogroup" value="1" style="width:250px;" required="true" dictTypeId="MIS_AUDITSTATUS"  onvaluechanged="show()" />
						</td> 
	                    <td style="width:366px;" align="right" colspan="2">
							<!-- <a class="nui-button" onclick="doSHZT" style="width:100px;margin-right:20px;">悬挂意见保存</a> -->
	                    </td>
	                </tr>
	                <tr id="choosehide">
	                    <td  style="width:150px;" align="right">回退到：</td> 
	                    <td style="width:140px;" colspan="3">
	                    	<input name="misOpinion.backTo" id="backTo" class="nui-combobox" valueField="id" textField="name" style="width:200px" required="true" />
	                    </td>
	                </tr>
	                <tr>
	                    <td style="width:150px;" align="right">审核意见：</td>
	                    <td style="width:300px;" colspan="3">
	                        <input name="misOpinion.auditopinion" id="auditopinion" class="nui-textarea" required="false" style="width:600px;height:40px;"/>
	                    </td>
	                </tr>
	            </table>
	        </div>
	    </fieldset>
    </form>
	</div>
</div>
<div style="text-align: center;padding: 10px;border-width:1px 0px 0px 0px;" class="nui-toolbar">
	<a class="nui-button" onclick="onOk()" id="appButton" style="width: 80px;margin-right: 20px;">提交流程</a>
	<a class="nui-button" onclick="onCancel('cancel')" id="closeWin" style="width:60px;">关闭</a>  
</div>          
<script type="text/javascript">
    nui.parse();
    var form = new nui.Form("#form1");
	var opioionform = new nui.Form("opioionform");
	var emails = new nui.Form("#email");
	//邮件附件查询
	var grid_1 = nui.get("grid_1");
	
    //销售人员对应的grid的增加、删除方法
    //销售人员对应的产品的grid的增加、删除方法
	var sales_grid = nui.get("sales_grid");
	var product_grid = nui.get("product_grid");
	//合同收入预测
	var csReveForecast_grid = nui.get("csReveForecast_grid");
	//合同收款
	var csGatherFc_grid = nui.get("csGatherFc_grid");
	//项目预算版本
	var projectBudget_grid = nui.get("projectBudget_grid");
	//产品分成
	var product_reve_grid = nui.get("product_reve_grid");
	//合同保函
	var csContBack_grid = nui.get("csContBack_grid");
	//合同保证金
	var csContDep_grid = nui.get("csContDep_grid");
	
	//产品税率
	var  productrate  = parseFloat(nui.getDictText('AME_SYSCONF','PRODUCTRATE'))
	//服务税率
	var  servicerate  = parseFloat(nui.getDictText('AME_SYSCONF','SERVICERATE'))
	//MA税率
	var  marate  = parseFloat(nui.getDictText('AME_SYSCONF','MARATE'))
	
	function selectProdtype(e){
		var grid = nui.get("product_reve_grid");
		var row = grid.getSelected();
		if(e.value=="1"){
			var rowData = {"productrate":productrate};
    		product_reve_grid.updateRow(row,rowData);
		}else if(e.value=="2"){
			var rowData = {"productrate":servicerate};
    		product_reve_grid.updateRow(row,rowData);
		}else if(e.value=="3"){
			var rowData = {"productrate":marate};
    		product_reve_grid.updateRow(row,rowData);
		}
	}
    function addRow(gridid) {          
        if(gridid == "csReveForecast_grid"){
	    	var newRow = { name: "New Row",status: "0" };
	        var grid = nui.get(gridid);
	        grid.addRow(newRow, 0);
        }else if(gridid == "csContBack_grid"){
        	//合同保函新增行：状态默认为履行中,类型为保函
        	var newRow = { name: "New Row",type:"1",status: "0" };
        	var grid = nui.get(gridid);
        	grid.addRow(newRow, 0);
        }else if(gridid == "csContDep_grid"){
        	//合同保证金新增行：状态默认为履行中,类型为保证金
        	var newRow = { name: "New Row",type:"2",status: "0" };
        	var grid = nui.get(gridid);
        	grid.addRow(newRow, 0);
        }else if(gridid == "csGatherFc_grid"){
        	//合同收款新增行：状态默认为未收款
        	var newRow = { name: "New Row",status: "0",billstatus:"0" };
        	var grid = nui.get(gridid);
        	grid.addRow(newRow, 0);
        }else if(gridid == "product_reve_grid"){
			var datas=product_grid.getData();
			var csReveForecasts = csReveForecast_grid.getData();
			if(csReveForecasts==null||csReveForecasts==""){
				alert("请先填写收入确认预估，然后在添加产品分成记录！");
				return;
			}else{
				for(var u=0;u<csReveForecasts.length;u++){
					var reveno = csReveForecasts[u].reveno;
					if(reveno==null||reveno==""){
						alert("收入确认预估信息填写不完整，请完善信息后再进行添加产品分成记录！");
						return;
					}
				}
			}
			var json = nui.encode({});
			var urL="com.primeton.mis.contract.contract.getPratio.biz.ext";
			nui.ajax({
	            url: urL,
	            data: json,
	            type: 'POST',
	            cache: false,
	            contentType: 'text/json',
	            success: function (text) {
	            	var pratio = text.parameters;
	            	for(var p=0;p<csReveForecasts.length;p++){
	            		var reveno = csReveForecasts[p].reveno;
	            		var newRow = { name: "New Row","reveno":reveno,"pratio":pratio};
			        	var grid = nui.get("product_reve_grid");
			        	grid.addRow(newRow,0);
	            	}
	            },
	            error: function (jqXHR, textStatus, errorThrown) {
	                alert(jqXHR.responseText);
	                CloseWindow();
	            }
	        });
        }else{
        	var newRow = { name: "" };
        	var grid = nui.get(gridid);
        	grid.addRow(newRow, 0);
        }
    }
    function removeRow(gridid) {
        var grid = nui.get(gridid);
        var rows = grid.getSelecteds();
        if (rows.length > 0) {
        	//收入预测确认记录状态为已确认和收入确认流程中不能删除
	    	if(gridid == "csReveForecast_grid"){
	    		for(var i = 0;i < rows.length;i ++){
	    			if(rows[i].name != "New Row"){
		    			if(doaction == "edit"){
			    			if(rows[i].status == "2" || rows[i].status == "3"){
			    				nui.alert("状态为已确认和收入确认流程中不能删除");
			    				return;
			    			}
		    			}
	    			}
	    		}
	    	}
            grid.removeRows(rows, false);
        }
        if(gridid=='csReveForecast_grid'){
        	var productReves = product_reve_grid.getData();
        	if(productReves!=null&&productReves!=''){
    			for(var i=0;i<rows.length;i++){
	        		var reveno = rows[i].reveno;
	        		grid.removeRow (rows[i], false);
	        		for(var k=0;k<productReves.length;k++){
	        			var reveid = productReves[k].reveno;
	        			if(reveid == reveno){
	        				product_reve_grid.removeRow (productReves[k], false);
	        			}
	        		}
	        	}
        	}
        }
        doCal();
    }
    //销售人员点开对应的产品子grid时的方法
    var detailGrid_Form = document.getElementById("detailGrid_Form");        
	var currentRow=null;
	function onShowRowDetail(e) {
        var grid = e.sender;
        var row = e.record;            
        if(currentRow){//如果有当前行
        	var datas=product_grid.getData();
        	currentRow.saleProds=datas;
        }
		currentRow=row;		
        var td = grid.getRowDetailCellEl(row);
        td.appendChild(detailGrid_Form);            
        var saleProds = row.saleProds;
        if(saleProds){
            saleProds = nui.decode(saleProds);
            product_grid.setData(saleProds);
        }else{
			product_grid.setData({});
			row.saleProds = {};
		}
		$('#detailGrid_Form').show();
	}
	
	<%--审核界面相关js 开始--%>
	//事业部领导拼接
  	var empllist = [];
  	document.getElementById("choosehide").style.display="none";
	function onCheckRenderer(e) {
		return nui.getDictText('MIS_AUDITSTATUS',e.value);//设置业务字典值
	}
	var dataStatus = [{"dictID": 1,"dictName": "通过"},{"dictID": 0,"dictName": "退回"},{"dictID": 2,"dictName": "终止流程"}];
	nui.get("auditstatus").setData(dataStatus);
	nui.get("auditstatus").setValue("1");
    nui.get("auditopinion").setValue("同意。");
    //审核结果触发
    function show(){
		var auditopinion = nui.get("auditopinion").getValue().trim();
		var auditstatus = nui.get("auditstatus").getValue();
		if(auditstatus=='0'){
			if(auditopinion=="同意。"){
				nui.get("auditopinion").setValue("");
			}
			chooselink();
		}else if(auditstatus=='1'){
			if(auditopinion==""){
				nui.get("auditopinion").setValue("同意。");
			}
			showNone();
		}else if(auditstatus=='2'){
			if(auditopinion=="同意。"){
				nui.get("auditopinion").setValue("");
			}
			showNone();
		}
	}
	function showNone(){
		nui.get("backTo").setValue("");
		document.getElementById("choosehide").style.display="none";
	}
	function chooselink(){
		document.getElementById("choosehide").style.display="";
	}
	<%--审核界面相关js 结束--%>
	
	<% 
	long workItemID=(Long)request.getAttribute("workItemID");
	%>
	
	var doaction;
	var custname=null;
	var projectno=null;
	var projectid=null;
	var email = null;
	init();
    function init() {
    	form.mask("数据加载中...");
    	doaction = "new";
    	//流程提示信息
		promptInit({workItemID:<%=workItemID %>});
		var data={workItemID:<%=workItemID %>};
		var json=nui.encode(data);
		
		nui.ajax({
			url:"com.primeton.mis.contract.contractApproval.getAmeContract.biz.ext",
			type:"post",
			data:json,
			contentType:"text/json",
			success:function (o){
				form.unmask();
				form.setData(o);
                form.isChanged(false);
                sales_grid.setData(o.cscontract.cscontractsales);
                csGatherFc_grid.setData(o.cscontract.csGatherFcs);
                csReveForecast_grid.setData(o.cscontract.csReveForecasts);
                csContBack_grid.setData(o.cscontract.ameCsContBacks);
                csContDep_grid.setData(o.cscontract.ameCsContDeps);
                //产品分成
				product_reve_grid.sortBy("reveid","asc");
				product_reve_grid.load({contractid: o.cscontract.contractid});
                editor1.html(o.cscontract.paycondition);
               	custname=o.cscontract.misCustinfo.custname;
               	email = o.cscontract.email;
               
				//加载附件设置参数
        		nui.get("grid_0").load({"groupid":"AME_CS_CONTRACT","relationid": o.cscontract.contractid},function(){
					//加载合同保函附件
	        		nui.get("grid_2").load({"groupid":"AME_CS_CONT_BACK","relationid": o.cscontract.contractid},function(){
	        			//加载接通保证金附件
        				nui.get("grid_3").load({"groupid":"AME_CS_CONT_DEP","relationid": o.cscontract.contractid});
	        		});
        		});
				
				grid_1.load({"groupid":"AME_CS_CONTRACT","relationid":o.cscontract.contractid},function(e){
					 var data1 = e.data;
					 grid_1.selects(data1);//默认全部选中
				});
				grid_1.sortBy("fileTime","desc");
        		if(o.cscontract == null || o.cscontract.saleshapid==null){
        		
				}else{
					 nui.get("saleshapid").setText(o.cscontract.csSaleshap.telcontent);
               		 nui.get("saleshapid").setValue(o.cscontract.saleshapid);
				}
				
				if(o.cscontract == null || o.cscontract.projectno == null ){
					/* var tabs = nui.get("tabs1");
					var list_tab =tabs.tabs[3];
					tabs.updateTab(list_tab, { visible: false }); */
				}else{
				/*合同项目信息*/
					projectid = o.cscontract.rdproject.projectId;
					projectno = o.cscontract.projectno;
					nui.get("projectno").setText(o.cscontract.projectno);
               		nui.get("projectno").setValue(o.cscontract.projectno);
               		document.getElementById("rdproject.projectName").innerHTML = o.cscontract.rdproject.projectName == null ?"":o.cscontract.rdproject.projectName;
	                document.getElementById("omOrganization.orgname").innerHTML = o.cscontract.rdproject.omOrganization == null ?"":o.cscontract.rdproject.omOrganization.orgname;
	                document.getElementById("rdproject.projectType").innerHTML = nui.getDictText('PROJECT_TYPE',o.cscontract.rdproject.projectType);
	                document.getElementById("rdproject.custname").innerHTML = o.cscontract.rdproject.custname == null ?"":o.cscontract.rdproject.custname;
	                document.getElementById("rdproject.projectStatus").innerHTML = nui.getDictText('MIS_PROJSTATUS',o.cscontract.rdproject.projectStatus);
	                document.getElementById("rdproject.outstatus").innerHTML = nui.getDictText('MIS_PROJOUTSTATUS',o.cscontract.rdproject.outstatus);
	                document.getElementById("rdproject.startdate").innerHTML = o.cscontract.rdproject.startdate == null ?"":o.cscontract.rdproject.startdate;
	                document.getElementById("rdproject.expenddate").innerHTML = o.cscontract.rdproject.expenddate == null ?"":o.cscontract.rdproject.expenddate;
					document.getElementById("rdproject.isconproj").innerHTML = nui.getDictText('MIS_YN',o.cscontract.rdproject.isconproj);
					document.getElementById("rdproject.manager").innerHTML = o.cscontract.rdproject.managername == null ?"":o.cscontract.rdproject.managername;
               		
               		var tabs1 =nui.get("tabs1");
					var tab_bb = {name: "tab_service", id: "tab_service", title: "项目预算损益信息",url:"<%=request.getContextPath() %>/project/rdproject/projectprofit.jsp?projid="+projectid};//项目损益页面
					tabs1.addTab(tab_bb,3);
				}
				
        		nui.get("purChaseYesOrNo").setValue(o.cscontract.isProBudget);
        		setmailtext();
        		if(o.cscontract.misCustinfo){
                	nui.get("custid").setText(o.cscontract.misCustinfo.custname);
                	nui.get("custname").setValue(o.cscontract.misCustinfo.custname);
                }
                nui.get("userid").setText(o.cscontract.username);
               	//nui.get("contracttype").disable();
				var contracttype = o.cscontract.contracttype;
            	//编辑的时候隐藏合同收款的最初预计确认年月
            	csGatherFc_grid.hideColumn(csGatherFc_grid.getColumn(5));
            	if(contracttype == "01" || contracttype == "04" || contracttype == "20"){//产品合同、混合合同
					document.getElementById("temp1").style.display = "";
					document.getElementById("temp4").style.display = "";
					document.getElementById("temp2").style.display = "none";
					document.getElementById("temp3").style.display = "none";
				}else if(contracttype == "08" || contracttype == "10"){//服务合同
					document.getElementById("temp1").style.display = "";
					document.getElementById("temp4").style.display = "";
					document.getElementById("temp2").style.display = "none";
					document.getElementById("temp3").style.display = "none";
				}else{//框架协议
					document.getElementById("temp1").style.display = "none";
					document.getElementById("temp4").style.display = "none";
					document.getElementById("temp2").style.display = "";
					document.getElementById("temp3").style.display = "";
				}
				//设置审批人
				var leaders = o.cscontract.leaders;
				if(leaders !=null && leaders.length > 0){
					var sprValue="";
					for(var i = 0;i < leaders.length;i ++){
						var oldValue = nui.get("lookup2").getValue();
	        			var oldText = nui.get("lookup2").getText();
	        			if(oldValue == null || oldValue == ""){
		                    nui.get("lookup2").setValue(leaders[i].id);
		                    nui.get("lookup2").setText(leaders[i].name);
		                    sprValue=sprValue+leaders[i].id+"("+leaders[i].name+")";
		                }else{
		                	nui.get("lookup2").setValue(oldValue+","+leaders[i].id);
	         				nui.get("lookup2").setText(oldText+","+leaders[i].name);
		                    sprValue=sprValue+","+leaders[i].id+"("+leaders[i].name+")";
		                }
					}
					//nui.get("cbl1").setValue(sprValue);
				}
				
				//设置审核意见基本信息
				nui.get("processinstid").setValue(o.workitem.processInstID);
               	nui.get("processinstname").setValue(o.workitem.processInstName);
               	nui.get("activitydefid").setValue(o.workitem.activityDefID);
               	nui.get("workitemname").setValue(o.workitem.workItemName);
				nui.get("workitemid").setValue(<%=workItemID %>);
               	nui.get("isshow").setValue("1");
               	nui.get("backTo").setData(o.cscontract.backList);
            	//查询审核意见
				var grid = nui.get("datagrid1");
				if(o.workitem.processInstID!=null && o.workitem.processInstID!=""){
					grid.load({processInstID:o.workitem.processInstID});
					grid.sortBy("time", "desc");
				}
				
			},
			error:function(){}
		});
	}
	
	function setmailtext(){
   		nui.get("attaches").setValue(email.attaches);
   		nui.get("mailtolist").setValue(email.tovalue);
   		nui.get("mailtolist").setText(email.tomame);
   		nui.get("mailcclist").setValue(email.ccvalue);
   		nui.get("mailcclist").setText(email.ccmame);
		nui.get("subject").setValue(email.subject);
		editor2.html(email.message);
	}
	
	function onGenderRenderer(e) {
        return nui.getDictText('CONT_ORG',e.value);
    }
    function onGenderInComeType(e) {
        return nui.getDictText('AME_REVETYPE',e.value);
    }
    function onGenderNewType(e) {
        return nui.getDictText('AME_NEWTYPE',e.value);
    }
    function onGenderMonthperiod(e){
    	return nui.getDictText('AME_MONTHPERIOD',e.value);
    }
    function onGenderInComeConv(e){
    	return nui.getDictText('MIS_INCOMECONV',e.value);
    }
    function onGenderStatus(e){
    	return nui.getDictText('AME_REVESTATUS',e.value);
    }
    //是否提供预算
    function onGenderSaleseva(e){
    	return nui.getDictText('MIS_YN',e.value);
    } 
    //合同保函保证金状态
    function onCsBackDepStatus(e){
    	return nui.getDictText('CS_BACK_DEP',e.value);
    }
    
    function dictstatus(e) {
		return nui.getDictText('MIS_BUDSTATUS',e.value);//设置业务字典值
	}
	function dictversion(e) {
		return nui.getDictText('MIS_YN',e.value);//设置业务字典值
	}
	//“签署单位”、“最终用户”、“接收人所在单位”清除时的方法
    function onCloseClick(e) {
        var obj = e.sender;
        obj.setText("");
        obj.setValue("");
    }
    function changedisforbid(e){
    	var text = editor1.html();
    	var mes=""
    	if(e.value == 1){
    		if(text){
    			mes=text+"<br/>禁止分包外包条款提示："
    		}else{
    			mes="禁止分包外包条款提示：";
    		}
    		editor1.html(mes);
    		
    	}else{
    		editor1.html(text);
    	}
    }
    
    function changedishighrisk(e){
    	var text = editor1.html();
    	var mes=""
    	if(e.value == 1){
    		if(text){
    			mes=text+"<br/>高风险提示："
    		}else{
    			mes="高风险提示：";
    		}
    		editor1.html(mes);
    	}else{
    		editor1.html(text);
    	}
    } 
    //“签署单位”、“最终用户”、“接收人所在单位”点击选择时的方法
    function onButtonEdit(e) {
        var btnEdit = this;	
        var lookupUrl="";
        if ( btnEdit.name=="cscontract.misCustinfo.custid" || btnEdit.name=="cscontract.userid" || btnEdit.name=="cscontract.receivercompid")
        lookupUrl = "/contract/contract/MisCustinfo_lookup.jsp";
        if(btnEdit.name == "cscontract.saleshapid"){
        	var salesData = sales_grid.getData();
        	var salesnames = "";
        	for(var i = 0;i < salesData.length;i ++){
        		if(salesnames){
        			salesnames = salesnames + "," + salesData[i].salename;
        		}else{
        			salesnames = salesData[i].salename;
        		}
        	}
        	if(salesnames){
		        lookupUrl = "/contract/contract/CsSaleShap_lookup.jsp?salesnames=" + salesnames;
        	}else{
        		nui.alert("销售人员不能为空！");
        		return;
        	}
        }
        if (lookupUrl=="") return;
        if(btnEdit.name == "cscontract.saleshapid"){
        	nui.open({
			url:"<%=request.getContextPath()%>"+lookupUrl,
			title: "选择列表",
			width: 1050,
			height: 450,
			ondestroy: function (action) {
				if (action == "ok") {
					var iframe = this.getIFrameEl();
					var data = iframe.contentWindow.GetData();
					data = nui.clone(data);    //必须
					if (data) {
		                //销售线索
						btnEdit.setValue(data.id);
		                btnEdit.setText(data.telcontent);
					}
				}
			}
		});
        }else{
        	nui.open({
			url:"<%=request.getContextPath()%>"+lookupUrl,
			title: "选择列表",
			width: 600,
			height: 400,
			ondestroy: function (action) {
				if (action == "ok") {
					var iframe = this.getIFrameEl();
					var data = iframe.contentWindow.GetData();
					data = nui.clone(data);    //必须
					if (data) {
		                btnEdit.setValue(data.id);
		                btnEdit.setText(data.text);
					}
				}
			}
			});
        }
        
	}
	//选择销售时的方法
	function onButtonEdit1(e) {
		var btnEdit = this;
		nui.open({
            url:"<%=request.getContextPath()%>/contract/contract/SelectSale.jsp",
			title: "选择列表",
			width: 650,
			height: 380,
			ondestroy: function (action) {
                //if (action == "close") return false;
                if (action == "ok") {
                    var iframe = this.getIFrameEl();
                    var data = iframe.contentWindow.GetData();
                    data = nui.clone(data);    //必须
                    if (data) {
                    	var row = sales_grid.getSelected();
                    	btnEdit.setValue(data.userid);
                    	var rowData = {saleid: data.userid, salename: data.empname, orgid: data.orgid, orgname: data.orgname};
                    	sales_grid.updateRow(row,rowData);
                    	var json = nui.encode({"userID":data.userid});
                    	nui.ajax({
				            url: "com.primeton.mis.contract.contractApproval.getSaleSyb.biz.ext",
				            data: json,
				            type: 'POST',
				            cache: false,
				            contentType: 'text/json',
				            success: function (text) {
				        		var returnJson = nui.decode(text);
				        		var syb = returnJson.syb[0];
				        		var rowData = {org: syb.syb};
				        		sales_grid.updateRow(row,rowData);
				            },
				            error: function (jqXHR, textStatus, errorThrown) {
				                alert(jqXHR.responseText);
				                CloseWindow();
				            }
				        });
                    }
                }
			}
        });
	}
	
	//选择项目
	function selectProject(){
		//nui.alert("选择项目");
		var btnEdit = this;
        nui.open({
            url:"<%=request.getContextPath()%>/ame_common/SelectProject.jsp?custname="+custname,
            title: "选择项目",
            width: 850,
            height: 420,
            ondestroy: function (action) {
                if (action == "ok") {
                    var iframe = this.getIFrameEl();
                    var data = iframe.contentWindow.GetData();
                    data = nui.clone(data);
                    if (data) {
                        btnEdit.setValue(data.projectno);
                        btnEdit.setText(data.projectno);
                        nui.get("projectId").setValue(data.projectId);
                        document.getElementById("rdproject.projectName").innerHTML = data.projectName == null ?"":data.projectName;
		                document.getElementById("omOrganization.orgname").innerHTML = data.omOrganization == null ?"":data.omOrganization.orgname;
		                document.getElementById("rdproject.projectType").innerHTML = nui.getDictText('PROJECT_TYPE',data.projectType);
		                document.getElementById("rdproject.custname").innerHTML = data.custname == null ?"":data.custname;
		                document.getElementById("rdproject.projectStatus").innerHTML = nui.getDictText('MIS_PROJSTATUS',data.projectStatus);
		                document.getElementById("rdproject.outstatus").innerHTML = nui.getDictText('MIS_PROJOUTSTATUS',data.outstatus);
		                document.getElementById("rdproject.startdate").innerHTML = data.startdate == null ?"":data.startdate;
		                document.getElementById("rdproject.expenddate").innerHTML = data.expenddate == null ?"":data.expenddate;
						document.getElementById("rdproject.isconproj").innerHTML = nui.getDictText('MIS_YN',data.isconproj);
						document.getElementById("rdproject.manager").innerHTML = data.manager == null ?"":data.manager;
                    }
				}
			}
        });
	}
	
	//计算合同总金额、合同净额
	function doCal(e){
		var row = sales_grid.getSelected();
		if(row){
			if(row.servjsmon != null && isNaN(row.servjsmon)){
				alert("请输入实数！");
				var rowData = {servjsmon: 0};
				sales_grid.updateRow(row,rowData);
				return;
			}		
			if(row.servsubmon != null && isNaN(row.servsubmon)){
				alert("请输入实数！");
				var rowData = {servsubmon: 0};
				sales_grid.updateRow(row,rowData);
				return;
			}
			if(row.othmon != null && isNaN(row.othmon)){
				alert("请输入实数！");
				var rowData = {othmon: 0};
				sales_grid.updateRow(row,rowData);
				return;
			}
			var prodmon = 0;
			var netprodmon = 0;
			var servjsmon = 0;
			var prodwbmon = 0;
			var servsubmon = 0;
			var othmon =0;
			if(row.prodmon){
				prodmon = row.prodmon;
			}
			if(row.netprodmon){
				netprodmon = row.netprodmon;
			}
			if(row.servjsmon){
				servjsmon = row.servjsmon;
			}
			if(row.prodwbmon){
				prodwbmon = row.prodwbmon;
			}
			if(row.servsubmon){
				servsubmon = row.servsubmon;
			}
			if(row.othmon){
				othmon = row.othmon;
			}
			var servmon = (parseFloat(servjsmon) + parseFloat(prodwbmon)).toFixed(2);
			var contsum = (parseFloat(prodmon) + parseFloat(servmon)).toFixed(2);
			var netservmon = (parseFloat(servmon)/(1+servicerate) - parseFloat(servmon)/(1+servicerate)*servicerate*0.07 - parseFloat(servsubmon) - parseFloat(othmon)).toFixed(2);
			var contpolmon = (parseFloat(netprodmon) + parseFloat(netservmon)).toFixed(2);
			var rowData = {servmon: servmon, contsum: contsum, contpolmon: contpolmon, netservmon: netservmon};
			sales_grid.updateRow(row,rowData);
		}
		var datas=sales_grid.getData();
		var sumprodmon = 0;
		var sumservmon = 0;
		var sumcontsum = 0;
		var sumservsubmon = 0;
		var sumothmon = 0;
		var sumcontpolmon = 0;
		var sumsalename = "";
		var sumorg = "";
		for(var i=0;i<datas.length;i++){
			//销售的产品金额总和
			var prodmon = datas[i].prodmon;
			//销售的服务金额
			var servmon = datas[i].servmon;
			//销售的合同总金额
			var contsum = datas[i].contsum;
			//服务分包金额
			var servsubmon = datas[i].servsubmon;
			//汇总的单个销售的所有产品分包金额总和
			var prodsubmon = datas[i].prodsubmon;
			//服务服务费
			var othmon = datas[i].othmon;
			//汇总的单个销售的所有产品的服务费总和
			var prodothmon = datas[i].prodothmon;
			//单个销售的合同净额
			var contpolmon = datas[i].contpolmon;
			var salename = datas[i].salename;
			var org = datas[i].org;
			if(prodmon){
				if(!isNaN(prodmon)){
					sumprodmon += parseFloat(prodmon);
				}
			}
			if(servmon){
				if(!isNaN(servmon)){
					sumservmon += parseFloat(servmon);
				}
			}			
			if(contsum){
				if(!isNaN(contsum)){
					sumcontsum += parseFloat(contsum);
				}
			}
			if(servsubmon){
				if(!isNaN(servsubmon)){
					sumservsubmon += parseFloat(servsubmon);
				}
			}
			if(prodsubmon){
				if(!isNaN(prodsubmon)){
					sumservsubmon += parseFloat(prodsubmon);
				}
			}	
			if(othmon){
				if(!isNaN(othmon)){
					sumothmon += parseFloat(othmon);
				}
			}	
			if(prodothmon){
				if(!isNaN(prodothmon)){
					sumothmon += parseFloat(prodothmon);
				}
			}
			if(contpolmon){
				if(!isNaN(contpolmon)){
					sumcontpolmon += parseFloat(contpolmon);
				}
			}
			if(salename){
				sumsalename = sumsalename + salename + ",";
			}			
			if(org){
				sumorg = sumorg + org + ",";
			}
		}
		nui.get("prodmon").setValue(sumprodmon);
		nui.get("servmon").setValue(sumservmon);
		nui.get("contsum").setValue(sumcontsum);
		nui.get("servsubmon").setValue(sumservsubmon);
		nui.get("othmon").setValue(sumothmon);
		//nui.get("contpolmon").setValue(sumcontpolmon);
		nui.get("salename").setValue(sumsalename.substring(0,sumsalename.length-1));
		nui.get("org").setValue(sumorg.substring(0,sumorg.length-1));
	}
	//计算产品金额
	function doSubCal(e){
		//计算产品净额
		var row = product_grid.getSelected();
		var prodmon = 0;
		var prodsubmon = 0;
		var othmon = 0;
		var prodwbmon = 0;
		var prodwbsubmon = 0;
		var prodwbothmon = 0;
		if(row.prodmon != null && isNaN(row.prodmon)){
			alert("请输入实数！");
			var rowData = {prodmon: 0};
			product_grid.updateRow(row,rowData);
			return;
		}		
		if(row.prodsubmon != null && isNaN(row.prodsubmon)){
			alert("请输入实数！");
			var rowData = {prodsubmon: 0};
			product_grid.updateRow(row,rowData);
			return;
		}
		if(row.othmon != null && isNaN(row.othmon)){
			alert("请输入实数！");
			var rowData = {othmon: 0};
			product_grid.updateRow(row,rowData);
			return;
		}
		if(row.prodwbmon != null && isNaN(row.prodwbmon)){
			alert("请输入实数！");
			var rowData = {prodwbmon: 0};
			product_grid.updateRow(row,rowData);
			return;
		}
		if(row.prodwbsubmon != null && isNaN(row.prodwbsubmon)){
			alert("请输入实数！");
			var rowData = {prodwbsubmon: 0};
			product_grid.updateRow(row,rowData);
			return;
		}
		if(row.prodwbothmon != null && isNaN(row.prodwbothmon)){
			alert("请输入实数！");
			var rowData = {prodwbothmon: 0};
			product_grid.updateRow(row,rowData);
			return;
		}
		if(row.prodmon != null && !isNaN(row.prodmon)){
			prodmon = row.prodmon;
		}
		if(row.prodsubmon != null && !isNaN(row.prodsubmon)){
			prodsubmon = row.prodsubmon;
		}
		if(row.othmon != null && !isNaN(row.othmon)){
			othmon = row.othmon;
		}
		if(row.prodwbmon != null && !isNaN(row.prodwbmon)){
			prodwbmon = row.prodwbmon;
		}
		if(row.prodwbsubmon != null && !isNaN(row.prodwbsubmon)){
			prodwbsubmon = row.prodwbsubmon;
		}
		if(row.prodwbothmon != null && !isNaN(row.prodwbothmon)){
			prodwbothmon = row.prodwbothmon;
		}
		var netprodmon = (prodmon/(1+productrate)-prodmon/(1+productrate)*productrate*0.07-prodsubmon-othmon).toFixed(2);
		var prodwbnetmon = (prodwbmon/(1+marate)-prodwbmon/(1+marate)*marate*0.07-prodwbsubmon-prodwbothmon).toFixed(2);
		var rowData = {netprodmon: netprodmon, prodwbnetmon: prodwbnetmon};
		product_grid.updateRow(row,rowData);
		//汇总产品金额、产品净额、产品分包金额、产品服务费、产品维保金额
		var datas=product_grid.getData();
		var sumprodmon = 0;
		var sumnetprodmon = 0;
		var sumprodsubmon = 0;
		var sumothmon = 0;
		var sumprodwbmon = 0;
		for(var i=0;i<datas.length;i++){
			var prodmon = 0;
			var netprodmon = 0;
			var prodsubmon = 0;
			var othmon = 0;
			var prodwbmon = 0;
			if(datas[i].prodmon){
				if(!isNaN(datas[i].prodmon)){
					prodmon = datas[i].prodmon;
					sumprodmon += parseFloat(prodmon);
				}else{
					datas[i].prodmon = 0;
				}
			}
			if(datas[i].netprodmon){
				if(!isNaN(datas[i].netprodmon)){
					netprodmon = datas[i].netprodmon;
					sumnetprodmon += parseFloat(netprodmon);
				}else{
					datas[i].netprodmon = 0;
				}
			}
			if(datas[i].prodsubmon){
				if(!isNaN(datas[i].prodsubmon)){
					prodsubmon = datas[i].prodsubmon;
					sumprodsubmon += parseFloat(prodsubmon);
				}else{
					datas[i].prodsubmon = 0;
				}
			}
			if(datas[i].othmon){
				if(!isNaN(datas[i].othmon)){
					othmon = datas[i].othmon;
					sumothmon += parseFloat(othmon);
				}else{
					datas[i].othmon = 0;
				}
			}			
			if(datas[i].prodwbmon){
				if(!isNaN(datas[i].prodwbmon)){
					prodwbmon = datas[i].prodwbmon;
					sumprodwbmon += parseFloat(prodwbmon);
				}else{
					datas[i].prodwbmon = 0;
				}
			}
		}
		var row = sales_grid.getSelected();
		var rowData = {prodmon: sumprodmon.toFixed(2), netprodmon: sumnetprodmon.toFixed(2), prodsubmon: sumprodsubmon.toFixed(2), prodothmon: sumothmon.toFixed(2), prodwbmon: sumprodwbmon.toFixed(2)};
		sales_grid.updateRow(row,rowData);
		doCal();
	}
    //点击保存时调用的方法
    function SaveData(){
   	 	var text = editor1.html();
		nui.get("paycondition").setValue(text);
    	var o = form.getData();
    	var row = sales_grid.getSelected();
    	data_opioion = opioionform.getData();//审批意见
    	o.isProBudget = nui.get("purChaseYesOrNo").getValue();//是否提供预算
    	//邮件附件
    	var rows = grid_1.getSelecteds();
		var attaches = "";
		if(rows.length>0){
			for(z=0;z<rows.length;z++){
				if(z==rows.length-1){
					attaches=attaches+rows[z].fileId;
				}else{
					attaches=attaches+rows[z].fileId+",";
				}
			}
			nui.get("attaches").setValue(attaches);
		}
    	var text = editor2.html();
		nui.get("message").setValue(text);
    	var email1 = emails.getData();
    	email1.mailinfo.tovalue = nui.get("mailtolist").getValue();
    	email1.mailinfo.ccvalue = nui.get("mailcclist").getValue();
    	email1.mailinfo.tomame = nui.get("mailtolist").getText();
    	email1.mailinfo.ccmame = nui.get("mailcclist").getText();
    	//附件ID赋值
    	o.cscontract.fileids = nui.get("fileids").getValue();
    	//审批人
		var userids = nui.get("lookup2").getValue().split(",");
        var empnames = nui.get("lookup2").getText().split(",");
        //重新选择审核人后，先清空之前默认的审核人集合再赋值
        empllist.length = 0;
        for(var i = 0;i < userids.length;i ++){
        	empllist[i] = {"userid": userids[i],"empname": empnames[i]};
        }
		o.cscontract.empllist = empllist;
    	//合同保函
		o.cscontract.csContBacks = nui.clone(csContBack_grid.getData());
		//合同保证金
		o.cscontract.csContDeps = nui.clone(csContDep_grid.getData());
        //收入预测记录
        o.cscontract.csReveForecasts = nui.clone(csReveForecast_grid.getData());
        o.cscontract.csReveForecastsAdded = nui.clone(csReveForecast_grid.getChanges("added",true));
        o.cscontract.csReveForecastsRemoved = nui.clone(csReveForecast_grid.getChanges("removed",true));
        o.cscontract.csReveForecastsModified = nui.clone(csReveForecast_grid.getChanges("modified",false));
        for(var i = 0;i < o.cscontract.csReveForecasts.length;i ++){
	        //收入确认次数不能为空
        	if(!o.cscontract.csReveForecasts[i].reveno){
        		nui.alert("收入确认次数不能为空!");
        		nui.get("appButton").enable();
        		return;
        	}  
        	if(!o.cscontract.csReveForecasts[i].revetype){
        		nui.alert("收入类型不能为空!");
        		nui.get("appButton").enable();
        		return;
        	}
        	
        	if(!o.cscontract.csReveForecasts[i].saleseva){
        		nui.alert("销售评估不能为空!");
        		nui.get("appButton").enable();
        		return;
        	}
        	//最初预计确认年月不能为空 
        	if(!o.cscontract.csReveForecasts[i].yearmonth){
        		nui.alert("合同收入确认预估的预计确认年月不能为空!");
        		nui.get("appButton").enable();
        		return;
        	}else{
        		var firstyear = "";
        		var firstmonth = "";
        		if(typeof(o.cscontract.csReveForecasts[i].yearmonth) == "string" && o.cscontract.csReveForecasts[i].yearmonth.length == 7){
        			firstyear = o.cscontract.csReveForecasts[i].yearmonth.substr(0,4);
        			firstmonth = o.cscontract.csReveForecasts[i].yearmonth.substr(5,2);
        		}else if(typeof(o.cscontract.csReveForecasts[i].yearmonth) == "string" && o.cscontract.csReveForecasts[i].yearmonth.length == 6){
        			firstyear = o.cscontract.csReveForecasts[i].yearmonth.substr(0,4);
        			firstmonth = o.cscontract.csReveForecasts[i].yearmonth.substr(4,2);
        		}else{
        			firstyear = o.cscontract.csReveForecasts[i].yearmonth.getFullYear();
        			firstmonth = o.cscontract.csReveForecasts[i].yearmonth.getMonth() + 1;
        			if(firstmonth < 10){
        				firstmonth = "0" + firstmonth;
        			}else{
        				firstmonth = "" + firstmonth;
        			}
        		}
        		o.cscontract.csReveForecasts[i].yearmonth = firstyear + "" +  firstmonth;
        	}
        	
        }
        //收入确认新增对象数据处理
        for(var i = 0;i < o.cscontract.csReveForecastsAdded.length;i ++){
        	//合同新增时
        		if(o.cscontract.csReveForecastsAdded[i].yearmonth){
	        		var firstyear = "";
	        		var firstmonth = "";
	        		if(typeof(o.cscontract.csReveForecastsAdded[i].yearmonth) == "string" && o.cscontract.csReveForecastsAdded[i].yearmonth.length == 7){
	        			firstyear = o.cscontract.csReveForecastsAdded[i].yearmonth.substr(0,4);
	        			firstmonth = o.cscontract.csReveForecastsAdded[i].yearmonth.substr(5,2);
	        		}else if(typeof(o.cscontract.csReveForecastsAdded[i].yearmonth) == "string" && o.cscontract.csReveForecastsAdded[i].yearmonth.length == 6){
	        			firstyear = o.cscontract.csReveForecastsAdded[i].yearmonth.substr(0,4);
	        			firstmonth = o.cscontract.csReveForecastsAdded[i].yearmonth.substr(4,2);
	        		}else{
	        			firstyear = o.cscontract.csReveForecastsAdded[i].yearmonth.getFullYear();
	        			firstmonth = o.cscontract.csReveForecastsAdded[i].yearmonth.getMonth() + 1;
	        			if(firstmonth < 10){
	        				firstmonth = "0" + firstmonth;
	        			}else{
	        				firstmonth = "" + firstmonth;
	        			}
	        		}
	        		o.cscontract.csReveForecastsAdded[i].yearmonth = firstyear + "" +  firstmonth;
	        	}
        }
        
        //收入确认编辑对象数据处理
        o.cscontract.productReves = product_reve_grid.getData();
        for(var i = 0;i < o.cscontract.csReveForecastsModified.length;i ++){
    		//最初预计确认年月不能为空 
        	if(o.cscontract.csReveForecastsModified[i].yearmonth){
        		var firstyear = "";
        		var firstmonth = "";
        		if(typeof(o.cscontract.csReveForecastsModified[i].yearmonth) == "string" && o.cscontract.csReveForecastsModified[i].yearmonth.length == 7){
        			firstyear = o.cscontract.csReveForecastsModified[i].yearmonth.substr(0,4);
        			firstmonth = o.cscontract.csReveForecastsModified[i].yearmonth.substr(5,2);
        		}else if(typeof(o.cscontract.csReveForecastsModified[i].yearmonth) == "string" && o.cscontract.csReveForecastsModified[i].yearmonth.length == 6){
        			firstyear = o.cscontract.csReveForecastsModified[i].yearmonth.substr(0,4);
        			firstmonth = o.cscontract.csReveForecastsModified[i].yearmonth.substr(4,2);
        		}else{
        			firstyear = o.cscontract.csReveForecastsModified[i].yearmonth.getFullYear();
        			firstmonth = o.cscontract.csReveForecastsModified[i].yearmonth.getMonth() + 1;
        			if(firstmonth < 10){
        				firstmonth = "0" + firstmonth;
        			}else{
        				firstmonth = "" + firstmonth;
        			}
        		}
        		o.cscontract.csReveForecastsModified[i].yearmonth = firstyear + "" +  firstmonth;
        	}
        }
		//合同收款
		o.csGatherFcs = nui.clone(csGatherFc_grid.getData());
		o.cscontract.csGatherFcsAdded = nui.clone(csGatherFc_grid.getChanges("added",true));
        o.cscontract.csGatherFcsRemoved = nui.clone(csGatherFc_grid.getChanges("removed",true));
        o.cscontract.csGatherFcsModified = nui.clone(csGatherFc_grid.getChanges("modified",false));
		for(var i = 0; i < o.csGatherFcs.length; i ++){
			if(!o.csGatherFcs[i].gatherno){
        		nui.alert("收款确认次数不能为空!");
        		nui.get("appButton").enable();
        		return;
        	}
        	if(!o.csGatherFcs[i].yearmonth){
        		nui.alert("合同收款记录的预计收款年月不能为空!");
        		nui.get("appButton").enable();
        		return;
        	}else{
        		var firstyear = "";
        		var firstmonth = "";
        		if(typeof(o.csGatherFcs[i].yearmonth) == "string" && o.csGatherFcs[i].yearmonth.length == 7){
	        		firstyear = o.csGatherFcs[i].yearmonth.substr(0,4);
    	    		firstmonth = o.csGatherFcs[i].yearmonth.substr(5,2);
        		}else if(typeof(o.csGatherFcs[i].yearmonth) == "string" && o.csGatherFcs[i].yearmonth.length == 6){
	        		firstyear = o.csGatherFcs[i].yearmonth.substr(0,4);
    	    		firstmonth = o.csGatherFcs[i].yearmonth.substr(4,2);
        		}else{
        			firstyear = o.csGatherFcs[i].yearmonth.getFullYear();
        			firstmonth = o.csGatherFcs[i].yearmonth.getMonth() + 1;
        			if(firstmonth < 10){
        				firstmonth = "0" + firstmonth;
        			}else{
        				firstmonth = "" + firstmonth;
        			}
        		}
        		o.csGatherFcs[i].yearmonth = firstyear + "" +  firstmonth;
        	}
		}
		//收款新增记录
		for(var i = 0; i < o.cscontract.csGatherFcsAdded.length; i ++){
        	if(o.cscontract.csGatherFcsAdded[i].yearmonth){
        		var firstyear = "";
        		var firstmonth = "";
        		if(typeof(o.cscontract.csGatherFcsAdded[i].yearmonth) == "string" && o.cscontract.csGatherFcsAdded[i].yearmonth.length == 7){
	        		firstyear = o.cscontract.csGatherFcsAdded[i].yearmonth.substr(0,4);
    	    		firstmonth = o.cscontract.csGatherFcsAdded[i].yearmonth.substr(5,2);
        		}else if(typeof(o.cscontract.csGatherFcsAdded[i].yearmonth) == "string" && o.cscontract.csGatherFcsAdded[i].yearmonth.length == 6){
	        		firstyear = o.cscontract.csGatherFcsAdded[i].yearmonth.substr(0,4);
    	    		firstmonth = o.cscontract.csGatherFcsAdded[i].yearmonth.substr(4,2);
        		}else{
        			firstyear = o.cscontract.csGatherFcsAdded[i].yearmonth.getFullYear();
        			firstmonth = o.cscontract.csGatherFcsAdded[i].yearmonth.getMonth() + 1;
        			if(firstmonth < 10){
        				firstmonth = "0" + firstmonth;
        			}else{
        				firstmonth = "" + firstmonth;
        			}
        		}
        		o.cscontract.csGatherFcsAdded[i].yearmonth = firstyear + "" +  firstmonth;
        	}
		}
		//收款修改记录
		for(var i = 0; i < o.cscontract.csGatherFcsModified.length; i ++){
        	if(o.cscontract.csGatherFcsModified[i].yearmonth){
        		var firstyear = "";
        		var firstmonth = "";
        		if(typeof(o.cscontract.csGatherFcsModified[i].yearmonth) == "string" && o.cscontract.csGatherFcsModified[i].yearmonth.length == 7){
	        		firstyear = o.cscontract.csGatherFcsModified[i].yearmonth.substr(0,4);
    	    		firstmonth = o.cscontract.csGatherFcsModified[i].yearmonth.substr(5,2);
        		}else if(typeof(o.cscontract.csGatherFcsModified[i].yearmonth) == "string" && o.cscontract.csGatherFcsModified[i].yearmonth.length == 6){
	        		firstyear = o.cscontract.csGatherFcsModified[i].yearmonth.substr(0,4);
    	    		firstmonth = o.cscontract.csGatherFcsModified[i].yearmonth.substr(4,2);
        		}else{
        			firstyear = o.cscontract.csGatherFcsModified[i].yearmonth.getFullYear();
        			firstmonth = o.cscontract.csGatherFcsModified[i].yearmonth.getMonth() + 1;
        			if(firstmonth < 10){
        				firstmonth = "0" + firstmonth;
        			}else{
        				firstmonth = "" + firstmonth;
        			}
        		}
        		o.cscontract.csGatherFcsModified[i].yearmonth = firstyear + "" +  firstmonth;
        	}
		}
        if(row){
        	var datas=product_grid.getData();
        	row.saleProds=datas;
        }
        o.cscontract.sales = nui.clone(sales_grid.getData());
        if(!form.validate()){
        	nui.alert("信息录入不完整！");
        	nui.get("appButton").enable();
        	return;
        }
		
		//如果合同收入汇总金额与合同总金额不相等，提示
		var checkSumMoney = 0;
        for(var i = 0;i < o.cscontract.csReveForecasts.length;i ++){
	        checkSumMoney += o.cscontract.csReveForecasts[i].fcsum;
        }
        var checkContsum = nui.get("contsum").getValue();
        checkContsum = parseFloat(checkContsum).toFixed(2);
        checkSumMoney = parseFloat(checkSumMoney).toFixed(2);
        var json = nui.encode({"cscontract":o.cscontract,"csGatherFcs":o.csGatherFcs,"isProBudget":o.isProBudget,"misOpinion": data_opioion.misOpinion,email:email1.mailinfo});
        if(checkSumMoney != checkContsum){
        	nui.confirm("合同执行总金额："+checkContsum+"，与合同收入确认预估汇总金额："+checkSumMoney+"不相等，确定执行此操作？","系统提示",function(a){
        		if(a == "ok"){
			        form.loading("提交中，请稍候...");
			        nui.ajax({
			            url: "com.primeton.mis.contract.contractApproval.bussinessRevContractAppr.biz.ext",
			            data: json,
			            type: 'POST',
			            cache: false,
			            contentType: 'text/json',
			            success: function (text) {
		            		var returnJson = nui.decode(text);
		                   	var eStatus = nui.get("eStatus").getValue();
			              	if(returnJson.result == "success"){
			              		form.unmask();
		    					alert("流程提交成功！");
                   				CloseWindow("ok");
			              	}else{
		                   		form.unmask();
								nui.get("appButton").enable();
			                   	alert("流程提交失败！请联系信息技术部！");
			              	}
			            },
			            error: function (jqXHR, textStatus, errorThrown) {
			                alert(jqXHR.responseText);
			                CloseWindow();
			            }
			        });
        		}else{
        			nui.get("appButton").enable();
        		}
        	});
        }else{
	        form.loading("提交中，请稍候...");
	        nui.ajax({
	            url: "com.primeton.mis.contract.contractApproval.bussinessRevContractAppr.biz.ext",
	            data: json,
	            type: 'POST',
	            cache: false,
	            contentType: 'text/json',
	            success: function (text) {
            		var returnJson = nui.decode(text);
                   	var eStatus = nui.get("eStatus").getValue();
	              	if(returnJson.result == "success"){
	              		form.unmask();
    					alert("流程提交成功！");
           				CloseWindow("ok");
	              	}else{
                   		form.unmask();
						nui.get("appButton").enable();
	                   	alert("流程提交失败！请联系信息技术部！");
	              	}
	            },
	            error: function (jqXHR, textStatus, errorThrown) {
	                alert(jqXHR.responseText);
	                CloseWindow();
	            }
	        });
        }
    }
    //根据合同类型获取合同存档编号
    nui.get('contracttype').on('valuechanged',function(e){
		var contracttype = nui.get('contracttype').getValue();
    	//针对OEM合同、框架合同，需要新增订单
    	if(contracttype == "04" || contracttype == "30"){
	    	csReveForecast_grid.showColumn(csReveForecast_grid.getColumn(16));
    	}else{
	    	csReveForecast_grid.hideColumn(csReveForecast_grid.getColumn(16));
    	}
		var tempType = "";
		if(contracttype == "01" || contracttype == "04" || contracttype == "20"){//产品合同、混合合同
			tempType = "L";
			document.getElementById("temp1").style.display = "";
			document.getElementById("temp4").style.display = "";
			document.getElementById("temp2").style.display = "none";
			document.getElementById("temp3").style.display = "none";
		}else if(contracttype == "08" || contracttype == "10"){//服务合同
			tempType = "S";
			document.getElementById("temp1").style.display = "";
			document.getElementById("temp4").style.display = "";
			document.getElementById("temp2").style.display = "none";
			document.getElementById("temp3").style.display = "none";
		}else{//框架协议
			tempType = "F";
			document.getElementById("temp1").style.display = "none";
			document.getElementById("temp4").style.display = "none";
			document.getElementById("temp2").style.display = "";
			document.getElementById("temp3").style.display = "";
		}
	})
	
	
    function GetData() {
        var o = form.getData();
        return o;
    }
    
    //附件下载
    function getfiledetail(e){
    	var record = e.record;
        var uid = record._uid;
        var groupId = record.groupId;
    	return "<a href='javascript:void(0)' type='"+groupId+"' uid='"+uid+"' onclick='checkfiledetail(this);' title='点击查看'>" + e.value + "</a>";
    }
    function checkfiledetail(obj){
    	var groupId = $(obj).attr("type");
    	var uid = $(obj).attr("uid");
    	if(groupId == "AME_CS_CONTRACT"){
    		var grid = nui.get("grid_0");
    	}else if(groupId == "AME_CS_CONT_BACK"){
    		var grid = nui.get("grid_2");
    	}else{
    		var grid = nui.get("grid_3");
    	}
    	var selectRow = grid.getSelected();
    	var url="com.primeton.components.web.fileupload.getfile.flow?fileId="+selectRow.fileId;
		window.open(url, '_self');
    }
    //附件下载
    function getfiledetail1(e){
    	return "<a href='javascript:void(0)' onclick='checkfiledetail1();' title='点击查看'>" + e.value + "</a>";
    }
    function checkfiledetail1(){
    	var grid = nui.get("grid_1");
    	var selectRow = grid.getSelected();
    	var url="com.primeton.components.web.fileupload.getfile.flow?fileId="+selectRow.fileId;
		window.open(url, '_self');
    }
    //关闭
   function onCancel(){
		CloseWindow("cancel");
	}
	function CloseWindow(action) {
		if (window.CloseOwnerWindow) return window.CloseOwnerWindow(action);
		else window.close();
	}
    function onOk() {
    	if(!onOkCheck()){
			return;
		}
    	if(!form.validate()){
    		nui.alert("信息录入不完整！");
        	return;
        }else if(nui.get("salename").getValue() == ""){
        	nui.alert("请至少添加一个销售！","销售未添加");
        	return;
        }else if(nui.get("contracttype").getValue() == "30" && nui.get("ispt").getValue() == ""){
        	nui.alert("合同类型为框架协议时，是否有排他合作必填！","是否有排他合作必填");
        	return;
        }else if(nui.get("contracttype").getValue() == "30" && nui.get("ispt").getValue() == "1" && nui.get("ptcondition").getValue() == ""){
        	nui.alert("合同类型为框架协议且有排他合作时，排他合作的条件必填！","排他合作条件必填");
        	return;
        }else if(nui.get("contracttype").getValue() == "08" && (nui.get("servstartdate").getValue() == "" || nui.get("servenddate").getValue() == "")){
        	nui.alert("合同类型为产品维保合同时，MA服务开始日期、MA服务结束日期必选！","MA服务日期必填");
        	return;
        }else{
        	var contsum = (nui.get("contsum").getValue() == null || nui.get("contsum").getValue() == "") ? 0:nui.get("contsum").getValue();
        	var soamon = (nui.get("soamon").getValue() == null || nui.get("soamon").getValue() == "") ? 0:nui.get("soamon").getValue();
        	var yjsmon = (nui.get("yjsmon").getValue() == null || nui.get("yjsmon").getValue() == "") ? 0:nui.get("yjsmon").getValue();
        	var dsjmon = (nui.get("dsjmon").getValue() == null || nui.get("dsjmon").getValue() == "") ? 0:nui.get("dsjmon").getValue();
        	var qtmon = (nui.get("qtmon").getValue() == null || nui.get("qtmon").getValue() == "") ? 0:nui.get("qtmon").getValue();
        	var mobilemon = (nui.get("mobilemon").getValue() == null || nui.get("mobilemon").getValue() == "") ? 0:nui.get("mobilemon").getValue();
        	if(parseFloat(contsum).toFixed(2) != (parseFloat(soamon) + parseFloat(yjsmon) + parseFloat(dsjmon) + parseFloat(qtmon) + parseFloat(mobilemon)).toFixed(2)){
        		alert("合同执行总金额不等于五类金额之和，请确认！");
        		return;
        	}
        	var datas = sales_grid.getData();
        	var isHaveOrg = true;
        	for(var i=0;i<datas.length;i++){
				var org = datas[i].org;
				if(org ==null || org == ""){
					isHaveOrg = false;
				}
        	}
        	if(isHaveOrg == false){
        		nui.alert("销售所属事业部必选！","销售所属事业部");
        		return;
        	}
        	//预估金额要和执行合同金额相等
        	var rows = csReveForecast_grid.getData();
			//预估金额总和
			if(rows){
				var sumPrice = 0;
				//合同执行总金额
				for(var i = 0;i < rows.length;i ++){
					//新增行fcsum为空需赋值为0
					if(!rows[i].fcsum){
						rows[i].fcsum = 0;
					}
					rows[i].fcsum = parseFloat(rows[i].fcsum);
					sumPrice = sumPrice + rows[i].fcsum;
				}
				sumPrice = parseFloat(sumPrice).toFixed(2);
				var contsumPrice = nui.get("contsum").getValue();
				contsumPrice = parseFloat(contsumPrice).toFixed(2);
				//因故暂时放开金额不等限制2016/9/9朱勇伦
				/* if(sumPrice != contsumPrice){
					nui.alert("预计确认金额总和：" + sumPrice + "与执行合同金额：" + contsumPrice + "不相等！");
					return;
				} */
			}
			var csReveForecastRows = csReveForecast_grid.getData();
			for(var i = 0;i < csReveForecastRows.length;i ++){
		        //收入确认次数不能为空
	        	if(!csReveForecastRows[i].reveno){
	        		nui.alert("收入确认次数不能为空!");
	        		nui.get("appButton").enable();
	        		return;
	        	}  
	        	if(!csReveForecastRows[i].revetype){
	        		nui.alert("收入类型不能为空!");
	        		nui.get("appButton").enable();
	        		return;
	        	}
	        	if(!csReveForecastRows[i].saleseva){
	        		nui.alert("销售评估不能为空!");
	        		nui.get("appButton").enable();
	        		return;
	        	}
			}
			sureOK();
	    }
    }
    
     var beforeuserids=null;
    function onbeforeselect(e){
    	beforeuserids = nui.get("cbl1").getValue();
    	//alert(document.getElementById("mini-323$2").className);
    }
    
   	function setspr(e){
   		var data = e.sender.data;
		var empcode1=null;
   		var empname1=null;
   		var oldValue1 = nui.get("lookup2").getValue();
   		var oldText1 = nui.get("lookup2").getText();
   		var temp=null;
   		var tempname=null;
   		if(oldValue1 == null || oldValue1 ==""){
   			
   		}else{
   			var oldValues1 = oldValue1.split(",");
   			var oldTexts1 = oldText1.split(",");
   			for(y=0 ; y<oldValues1.length;y ++){
   				var isExist = false;
   				for (k=0 ; k<data.length;k ++){
		   			empcode1 = data[k].userid.substring(0,data[k].userid.indexOf("("));
		   			if(oldValues1[y]==empcode1){
		   				 isExist = true;
            				break;
		   			}
   				}
	   			if(!isExist){
	   				if (temp==null || temp ==""){
	   					temp=oldValues1[y];
		   				tempname=oldTexts1[y];
	   				}else{
		   				temp=temp+","+oldValues1[y];
		   				tempname=tempname+","+oldTexts1[y];
	   				}
			   	}
	   		}
   		}
   		nui.get("lookup2").setValue('');
   		nui.get("lookup2").setValue(temp);
        nui.get("lookup2").setText(tempname);
   		
   		var userids = nui.get("cbl1").getValue().split(",");
   		if(userids != null && userids !=""){
   			for(var i = 0;i < userids.length;i ++){
   				empnamecode = userids[i];
        		var empname = empnamecode.substring(empnamecode.indexOf("(")+1,empnamecode.indexOf(")"));
	        	var empcode = empnamecode.substring(0,empnamecode.indexOf("("));
	        	var oldValue = nui.get("lookup2").getValue();
	        	var oldText = nui.get("lookup2").getText();
        		if(oldValue == null || oldValue == ""){
                    nui.get("lookup2").setValue(empcode);
                    nui.get("lookup2").setText(empname);
                }else{
                	var isHaveMe = false;
             		var oldValues = oldValue.split(",");
             		for(var j=0;j<oldValues.length;j++){
             			if(empcode == oldValues[j]){
             				isHaveMe = true;
             			}
             		}
             		if(isHaveMe == false){
	         			nui.get("lookup2").setValue(oldValue+","+empcode);
	         			nui.get("lookup2").setText(oldText+","+empname);
             		}
                }
        	}
        }
        
        var leaders = nui.get("lookup2").getValue(); 
        var json = nui.encode({leaders:leaders});
        nui.ajax({
	        url: "com.primeton.mis.contract.contractApproval.getemailbyleaders.biz.ext",
			type: 'POST',
			data: json,	
			contentType: 'text/json',
	        success: function (text) {
          	 	var returnJson = nui.decode(text);
          	 	nui.get("mailtolist").setValue('');
          	 	var emails = text.emails;
          	 	var emailvalue="";
          	 	var emailname="";
          	 	if(emails!=null ){
	          	 	if(emails.length>0){
	          	 		for(m=0;m<emails.length;m++){
	          	 			if(m==emails.length-1){
	          	 				emailvalue=emailvalue+emails[m].OEMAIL;
	          	 				emailname=emailname+emails[m].EMPNAMES;
	          	 			}else{
	          	 				emailvalue=emailvalue+emails[m].OEMAIL+",";
	          	 				emailname=emailname+emails[m].EMPNAMES+",";
	          	 			}
	          	 		}
	          	 		nui.get("mailtolist").setValue(emailvalue);
	          	 		nui.get("mailtolist").setText(emailname);
	          	 	}
          	 	}
		    }
		});
   	}
   	
   	function setspr1(e){
    	var leaders = nui.get("lookup2").getValue();
        var json = nui.encode({leaders:leaders});
        nui.ajax({
	        url: "com.primeton.mis.contract.contractApproval.getemailbyleaders.biz.ext",
			type: 'POST',
			data: json,	
			contentType: 'text/json',
	        success: function (text) {
          	 	var returnJson = nui.decode(text);
          	 	nui.get("mailtolist").setValue('');
          	 	var emails = text.emails;
          	 	var emailvalue="";
          	 	var emailname="";
          	 	if(emails.length>0){
          	 		for(m=0;m<emails.length;m++){
          	 			if(m==emails.length-1){
          	 				emailvalue=emailvalue+emails[m].OEMAIL;
          	 				emailname=emailname+emails[m].EMPNAMES;
          	 			}else{
          	 				emailvalue=emailvalue+emails[m].OEMAIL+",";
          	 				emailname=emailname+emails[m].EMPNAMES+",";
          	 			}
          	 		}
          	 		nui.get("mailtolist").setValue(emailvalue);
          	 		nui.get("mailtolist").setText(emailname);
          	 	}
		    }
		});
    }
    
    function sureOK(){
    	//审核结果
    	var auditstatus = nui.get("auditstatus").getValue();
    	if(auditstatus == "2")
    	{
    	   massage="您的审核意见是“终止流程”，"
    	}
    	else if(auditstatus == "0")
    	{
    	  massage="您的审核意见是“退回”，"
    	}
    	else if(auditstatus == "1")
    	{ 
    	  massage="您的审核意见是“通过”，"
    	}
    	var backTo = nui.get("backTo").getValue();
    	if(auditstatus == "2" ||  auditstatus == "0" ){
    	    if((backTo == null || backTo == "") && auditstatus == "0")
    	    { 
    	       nui.alert("退回时请选择退回到的环节！");
    	       return;
    	    }
    	 }
    	 nui.confirm(massage+"确认提交吗？", "确定？",
            function (action) {            
                if (action == "ok") {
                	nui.get("appButton").setEnabled(false);
					document.getElementById("fileCatalog1").value="AME_CS_CONT_BACK";
					form4.submit();
				}else{
					return;
				}
		}); 
    }
    
    function SaveData1(){
    	document.getElementById("fileCatalog2").value="AME_CS_CONT_DEP";
		form6.submit();
    }
    function SaveData2(){
    	document.getElementById("fileCatalog").value="ameCsContractAppr";
		form2.submit();
    }
    
    //编辑合同订单csContOrder_grid，计算金额updateRow
    function doSumfee(e){
		var row = csContOrder_grid.getRow(e.rowIndex);
		if(row){
			if(row.orderprodmon != null && isNaN(row.orderprodmon)){
				nui.alert("请输入实数！");
				var rowData = {orderprodmon: 0};
				csContOrder_grid.updateRow(row,rowData);
				return;
			}
			if(row.orderservmon != null && isNaN(row.orderservmon)){
				nui.alert("请输入实数！");
				var rowData = {orderservmon: 0};
				csContOrder_grid.updateRow(row,rowData);
				return;
			}
			if(row.servsubmon != null && isNaN(row.servsubmon)){
				nui.alert("请输入实数！");
				var rowData = {servsubmon: 0};
				csContOrder_grid.updateRow(row,rowData);
				return;
			}
			if(row.othmon != null && isNaN(row.othmon)){
				nui.alert("请输入实数！");
				var rowData = {othmon: 0};
				csContOrder_grid.updateRow(row,rowData);
				return;
			}
			var ordermon = 0;
			var orderprodmon = 0;
			var orderservmon = 0;
			if(row.ordermon){
				ordermon = row.ordermon;
			}
			if(row.orderprodmon){
				orderprodmon = row.orderprodmon;
			}
			if(row.orderservmon){
				orderservmon = row.orderservmon;
			}
			var sumordermon = (parseFloat(orderprodmon) + parseFloat(orderservmon)).toFixed(2);
			var rowData = {ordermon: sumordermon, orderprodmon: orderprodmon, orderservmon: orderservmon};
			csContOrder_grid.updateRow(row,rowData);
		}
    }
    
    //已确认和流程中的收入预估不能修改
    function doUpdateForecast(e){
    	if(e.record.status == 2 || e.record.status == 3){	//2、收入确认流程中,3、已确认
    		if(e.record.name != "New Row"){
    			if(doaction == "edit"){
					cancelEditRow(e.record);
    			}
    		}
		}
    }
    
    //确认比例(编辑前)
    var fcreverateBegin = 0;
    //确认金额(编辑前)
	var fcsumBegin = 0;
    //收入预估 计算比例金额(编辑前)
    function doCsReveForecastBegin(e){
    	var row = csReveForecast_grid.getRow(e.rowIndex);
    	if(row.fcreverate){
        	fcreverateBegin = row.fcreverate;
        }
        if(row.fcsum){
        	fcsumBegin = row.fcsum;
        }
    }
    //收入预估 计算比例金额(编辑后)
    function doCsReveForecastEnd(e){
    	var contsum = nui.get("contsum").getValue();
    	var row = csReveForecast_grid.getRow(e.rowIndex);
    	//确认比例
    	var fcreverate = 0;
    	//确认金额
    	var fcsum = 0;
    	//预计金额产品额
    	var productsum = 0;
    	//预计金额服务额
    	var servicesum = 0;
    	//预计金额MA额
    	var masum = 0;
    	if(row.fcreverate){
        	fcreverate = row.fcreverate;
        }
        if(row.fcsum){
        	fcsum = row.fcsum;
        }
        if(row.productsum){
        	productsum = row.productsum;
        }
        if(row.servicesum){
        	servicesum = row.servicesum;
        }
        if(row.masum){
        	masum = row.masum;
        }
        productsum = parseFloat(productsum);
        servicesum = parseFloat(servicesum);
        masum = parseFloat(masum);
        fcsum = productsum + servicesum + masum;
        if(contsum){
	        fcreverate = fcsum/contsum;
        }else{
        	fcreverate = 0;
        }
        fcsum = parseFloat(fcsum).toFixed(2);
        fcreverate = parseFloat(fcreverate).toFixed(3);
        /* 
        //根据预计确认金额改预计确认比例
        if(fcsumBegin != fcsum){
	        fcreverate = fcsum/contsum;
	        fcsum = fcreverate * contsum;
        }
        //根据预计去人比例改预计确认金额
        if(fcreverateBegin != fcreverate){
        	fcsum = fcreverate * contsum;
	        fcreverate = fcsum/contsum;
        }
        fcreverate = parseFloat(fcreverate).toFixed(3);
        fcsum = parseFloat(fcsum).toFixed(2);
         */
        
        var rowData = {productsum: productsum,servicesum: servicesum,masum: masum,fcreverate: fcreverate,fcsum: fcsum};
		csReveForecast_grid.updateRow(row,rowData);
    }
        
    function onCancel(e) {
        CloseWindow("cancel");
    }
     //合同收款列表-行点击
     function doUpdateCsGatherFc(){
     
     }
     
     //合同收款列表-单元格编辑前
     function doCsGatherFcBegin(e){
     	var row = csGatherFc_grid.getRow(e.rowIndex);
     	if(row){
     		if(row.newyearmonth){
				newyearmonth = row.newyearmonth;
			}
     	}
     }
     
     //合同收款列表-单元格编辑后
     function doCsGatherFcEnd(e){
     	var contsum = nui.get("contsum").getValue();
     	var row = csGatherFc_grid.getRow(e.rowIndex);
     	if(row){	//productsum servicesum fcsum fcreverate
			if(row.productsum != null && isNaN(row.productsum)){
				nui.alert("请输入实数！");
				var rowData = {productsum: 0};
				csGatherFc_grid.updateRow(row,rowData);
				return;
			}
			if(row.servicesum != null && isNaN(row.servicesum)){
				nui.alert("请输入实数！");
				var rowData = {servsubmon: 0};
				csGatherFc_grid.updateRow(row,rowData);
				return;
			}
			//预计产品额
			var productsum = 0;
			//预计服务额
			var servicesum = 0;
			//预计确认金额
			var fcsum = 0;
			//预计确认比例
			var fcreverate = 0;
			if(row.productsum){
				productsum = row.productsum;
			}
			if(row.servicesum){
				servicesum = row.servicesum;
			}
			fcsum = parseFloat(productsum) + parseFloat(servicesum);
			if(contsum){
				if(contsum == 0){
					fcreverate = 0;
				}else{
			        fcreverate = parseFloat(fcsum)/parseFloat(contsum);
				}
	        }else{
	        	fcreverate = 0;
	        }
	        fcsum = parseFloat(fcsum).toFixed(2);
	        fcreverate = parseFloat(fcreverate).toFixed(3);
			var rowData = {productsum: productsum, servicesum: servicesum, fcsum: fcsum, fcreverate: fcreverate};
			csGatherFc_grid.updateRow(row,rowData);
		}
     }
     
     //合同收款列表-收款类型业务字典
     function onGatherType(e){
     	return nui.getDictText('AME_GATHERTYPE',e.value);
     }
     
     //合同收款列表-收款状态业务字典
     function onGatherStatus(e){
     	return nui.getDictText('AME_GATHERSTATUS',e.value);
     }
     function onGatherBillStatus(e){
     	return nui.getDictText('MIS_GATHERBILL',e.value);
     }
     
      /**
	 * 合同销售样式
	 */
	sales_grid.on("drawcell", function (e) {
	    var record = e.record,
	    column = e.column,
	    field = e.field,
	    value = e.value;
	    //设置行样式   
	    if("saleid" == field || "org" == field || "servjsmon" == field || "servsubmon" == field 
	    	|| "othmon" == field ){
	    	e.cellStyle = "background: yellow";
	    }
	});
     
     
	 /**
	 * 合同收款样式
	 */
	csGatherFc_grid.on("drawcell", function (e) {
	    var record = e.record,
	    column = e.column,
	    field = e.field,
	    value = e.value;
	    //设置行样式   
	    if("gatherno" == field || "gathertype" == field || "gathertimedesc" == field || "yearmonth" == field || "newyearmonth" == field 
	    	|| "productsum" == field || "servicesum" == field || "status" == field || "billstatus" == field
	    	|| "memo" == field){
	    	e.cellStyle = "background: yellow";
	    }
	     //状态为已收款的，设置行样式
		if(record.status == 2){
	    	e.cellStyle = "background-color: #33FFFF";
		}
	});
	/**
	 * 合同保函样式
	 */
	csContBack_grid.on("drawcell", function (e) {
	    var record = e.record,
	    column = e.column,
	    field = e.field,
	    value = e.value;
	    //设置行样式   
	    if("backdepmon" == field || "perioddesc" == field || "isdeal" == field || "status" == field || "returnmon" == field 
	    	|| "paydate" == field || "predredate" == field || "remark" == field ){
	    	e.cellStyle = "background: yellow";
	    }
	});
	/**
	 * 合同保证金样式
	 */
	csContDep_grid.on("drawcell", function (e) {
	    var record = e.record,
	    column = e.column,
	    field = e.field,
	    value = e.value;
	    //设置行样式   
	    if("backdepmon" == field || "expno" == field || "perioddesc" == field || "isdeal" == field || "status" == field || "returnmon" == field 
	    	|| "paydate" == field || "predredate" == field || "remark" == field  || "practredate"==field){
	    	e.cellStyle = "background: yellow";
	    }
	});
		/**
		 * 合同收入样式
		 */
		csReveForecast_grid.on("drawcell", function (e) {
		    var record = e.record,
		    column = e.column,
		    field = e.field,
		    value = e.value;
		    //设置行样式   
		    if("reveno" == field || "revetype" == field || "newtype" == field || "reveproof" == field || "revetimedesc" == field 
		    	|| "yearmonth" == field || "monthperiod" == field || "newyearmonth" == field || "newmonthperiod" == field
		    	|| "productsum" == field || "servicesum" == field || "masum" == field || "status" == field 
		    	|| "contorderno" == field || "saleseva" == field || "memo" == field){
		    	e.cellStyle = "background: yellow";
		    }
		    //状态为已确认收入的，设置行样式
	    	if(record.status == "3"){
	        	e.cellStyle = "background-color: #33FFFF";
	    	}
		});
		/**
		 * 合同产品样式
		 */
		product_grid.on("drawcell", function (e) {
		    var record = e.record,
		    column = e.column,
		    field = e.field,
		    value = e.value;
		    //设置行样式   
		    if("prodname" == field || "price" == field || "prodmon" == field || "prodsubmon" == field 
		    	|| "othmon" == field || "prodwbmon" == field || "prodwbsubmon" == field || "prodwbothmon" == field
		    	|| "buyprod" == field){
		    	e.cellStyle = "background: yellow";
		    }
		});
		
	function drawCsGahterFcSum(e){
		if (e.field == "fcsum") {
            e.cellHtml = "<div align='right'><b>" + e.cellHtml + "</b></div>";
        }
	}
	function drawCsBackdepSum(e){
		if (e.field == "backdepmon" || e.field == "returnmon") {
            e.cellHtml = "<div align='right'><b>" + e.cellHtml + "</b></div>";
        }
	}
		
	function drawCsReveForecastSum(e){
		if (e.field == "fcsum") {
            e.cellHtml = "<div align='right'><b>" + e.cellHtml + "</b></div>";
        }
	}
	
	//MA合同收入记录拆分
	function maSplit(){
		//已存在的收入数据
		var oldReve = csReveForecast_grid.getData();
		//已存在的收入数据记录条数
		var oldReveLength = oldReve.length;
		//合同类型
		var contracttype = nui.get("contracttype").getValue();
		//合同金额
		var contsum = nui.get("contsum").getValue();
		//产品维保金额
		var masum = 0;
		var deptGridRows = sales_grid.data;
		for(var i = 0;i < deptGridRows.length;i ++){
			masum += parseFloat(deptGridRows[i].prodwbmon);
		}
		masum = parseFloat(masum);
        //合同签订日期
        var signdate = null;
        //MA服务开始日期
        var servstartdate = nui.get("servstartdate").getValue();
        //MA服务结束日期
        var servenddate = nui.get("servenddate").getValue();
        if(!contracttype){
        	nui.alert("合同类型不能为空！");
        	return;
        }
        if(!contsum){
        	nui.alert("合同执行金额不能为空！");
        	return;
        }
		nui.open({
			url:"<%=request.getContextPath()%>/contract/contract/contractMASplit.jsp",
			title: "MA合同收入记录拆分",
			width: 450,
			height: 340,
			onload:function(){
				var iframe = this.getIFrameEl();
				iframe.contentWindow.SetData(masum,signdate,servstartdate,servenddate,contsum,oldReveLength);
			},
			ondestroy: function (action) {
				if (action == "ok") {
					var iframe = this.getIFrameEl();
					var reveObject = iframe.contentWindow.GetData();
					reveObject = nui.clone(reveObject);
					if (reveObject) {
				    	//设置MA开始日期
				    	nui.get("servstartdate").setValue(reveObject.startDate);
				    	//设置MA结束日期
				    	nui.get("servenddate").setValue(reveObject.endDate);
						//设置合同收入确认记录
						if(contracttype == "04" || contracttype == "30"){
					        var grid = nui.get("csReveForecast_grid");
					        for(var i = 0;i < reveObject.data.length;i ++){
					        	//reveObject.data[i].contorderno = nui.get("contnum").getValue();
						        grid.addRow(reveObject.data[i], i);
					        }
				    	}else{
					        var grid = nui.get("csReveForecast_grid");
					        for(var i = 0;i < reveObject.data.length;i ++){
						        grid.addRow(reveObject.data[i], i);
					        }
				    	}
					}
				}
			}
		});
     }
  	
  	 /**
    *验证
    */
    function onOkCheck(){
    	var filePaths = document.getElementsByName("uploadfile").length;
    	for(var j = 0;j < filePaths;j++){
    		var a = document.getElementsByName("remarkList")[j].value;
    		if(a == null || a == ""){
    			nui.alert("新增附件不可以为空");
    			return false;
    		}
    	}
        var filePaths = document.getElementsByName("uploadfile1").length;
    	for(var j=0;j<filePaths;j++){
    		var a=document.getElementsByName("remarkList1")[j].value;
    		if(a==null||a==""){
    			alert("新增附件不可以为空");
    			return false;
    		}
    	}
    	var filePaths1 = document.getElementsByName("uploadfile2").length;
    	for(var j=0;j<filePaths1;j++){
    		var a=document.getElementsByName("remarkList2")[j].value;
    		if(a==null||a==""){
    			alert("新增附件不可以为空");
    			return false;
    		}
    	}
       return true;
    }
    
    var editor1 = null;
	 KindEditor.ready(function(K) {
			editor1 = K.create('textarea[name="content1"]', {
			cssPath : '<%=contextPath%>/common/nui/resource/kindeditor/plugins/code/prettify.css',
			uploadJson : '<%=contextPath%>/common/nui/resource/kindeditor/jsp/upload_json.jsp',
			fileManagerJson : '<%=contextPath%>/common/nui/resource/kindeditor/jsp/file_manager_json.jsp',
			allowFileManager : true,
			afterCreate : function() {
				var self = this;
				K.ctrl(document, 13, function() {
					self.sync();
					document.forms['example'].submit();
				});
				K.ctrl(self.edit.doc, 13, function() {
					self.sync();
					document.forms['example'].submit();
				});
			},
			 afterChange : function() {
		     $('.word_count1').html(this.count()); //字数统计包含HTML代码
		     //$('.word_count2').html(this.count('text'));  //字数统计包含纯文本、IMG、EMBED，不包含换行符，IMG和EMBED算一个文字
		     var a = this.count();
	     	 var a1 = this.count('text');
		     var limitNum = 2000;  //设定限制字数
		     var pattern = "您当前输入了<span style='color:red'>"+a1+"</span>个文字（<span style='color:red'>"+a+"</span>个字符），大约还可以输入<span style='color:red'>"+limitNum+"</span>字。（字数统计包含纯文本、HTML代码）"; 
		     $('.word_surplus').html(pattern); //输入显示
		     if(a > limitNum) {
	      		 pattern = ('字数超过限制，请适当删除部分内容');
	      		 var strValue = editor1.text();
	      		 strValue = strValue.substring(0,limitNum);
	      		 editor1.text(strValue);      
		     } else {//计算剩余字数
	      		 var result = limitNum - this.count(); 
		      	 pattern = "您当前输入了<span style='color:red'>"+a1+"</span>个文字（<span style='color:red'>"+a+"</span>个字符），大约还可以输入<span style='color:red'>"+result+"</span>字。（字数统计包含纯文本、HTML代码）"; 
	      	 }
	      	 $('.word_surplus').html(pattern); //输入显示
		     ////////
    		} 
		});
		prettyPrint();
	});
	
     var editor2 = null;
	 KindEditor.ready(function(K) {
			editor2 = K.create('textarea[name="content2"]', {
			cssPath : '<%=contextPath%>/common/nui/resource/kindeditor/plugins/code/prettify.css',
			uploadJson : '<%=contextPath%>/common/nui/resource/kindeditor/jsp/upload_json.jsp',
			fileManagerJson : '<%=contextPath%>/common/nui/resource/kindeditor/jsp/file_manager_json.jsp',
			allowFileManager : true,
			items : [  
			    'source', '|', 'undo', 'redo', '|', 'preview', 'print', 'template', 'code', 'cut', 'copy', 'paste',  
			    'plainpaste', 'wordpaste', '|', 'justifyleft', 'justifycenter', 'justifyright',  
			    'justifyfull', 'insertorderedlist', 'insertunorderedlist', 'indent', 'outdent', 'subscript',  
			    'superscript', 'clearhtml', 'quickformat', 'selectall', '|', 'fullscreen', '/',  
			    'formatblock', 'fontname', 'fontsize', '|', 'forecolor', 'hilitecolor', 'bold',  
			    'italic', 'underline', 'strikethrough', 'lineheight', 'removeformat', '|', 'image', 'multiimage',  
			    'flash', 'media', 'insertfile', 'table', 'hr', 'emoticons', 'baidumap', 'pagebreak',  
			    'anchor', 'link', 'unlink', '|', 'about'  
			] ,
			cssData: '* {font: 12px;line-height:13px}',
			afterCreate : function() {
				var self = this;
				K.ctrl(document, 13, function() {
					self.sync();
					document.forms['example'].submit();
				});
				K.ctrl(self.edit.doc, 13, function() {
					self.sync();
					document.forms['example'].submit();
				});
			}
		});
		prettyPrint();
	});
	
	//产品分成汇总
	function drawProdReveSum(e){
		if (e.field == "contsum" || e.field == "tax"|| e.field == "contsum2"|| e.field == "pratiomon") {
            e.cellHtml = "<div align='right'><b>" + e.cellHtml + "</b></div>";
        }
	}
	
	function getReveProdtype(e){
		return nui.getDictText('REVE_PRODTYPE',e.value);
	}
	
	function beforenodeselect(e){
        if (e.isLeaf == false) {
        	e.cancel = true;
        }
	}
	
	//产品分成修改时触发
	function changeProdReve(e){
		var row = product_reve_grid.getSelected();
		var pratio = row.pratio;
		if(row){
			if(row.contsum != null && isNaN(row.contsum)){
				alert("请输入实数！");
				var rowData = {contsum: 0};
				product_reve_grid.updateRow(row,rowData);
				return;
			}
			if(row.tax != null && isNaN(row.tax)){
				alert("请输入实数！");
				var rowData = {tax: 0};
				product_reve_grid.updateRow(row,rowData);
				return;
			}
			var contsum = 0;
			var tax = 0;
			var contsum2 = 0;
			var pratiomon = 0;
			var productrate1=0;
			if(row.contsum){
				contsum = row.contsum;
			}
			if(row.productrate){
				productrate1 = parseFloat(row.productrate);
			}
			if(row.tax){
				tax = row.tax;
			}
			if(row.contsum2){
				contsum2 = row.contsum2;
			}
			contsum2 = (parseFloat(contsum)/parseFloat(1+productrate1)).toFixed(2);
			tax = (parseFloat(contsum2)*parseFloat(productrate1)).toFixed(2);
			if(pratio){
				pratiomon = (parseFloat(contsum2)*parseFloat(pratio)).toFixed(2);
			}
			var rowData = {tax: tax, contsum2: contsum2,pratiomon:pratiomon};
			product_reve_grid.updateRow(row,rowData);
		}
	}
	//日期处理
	function onDealDate(e){
		if(e.value==null){
			return null;
		}
		if(typeof(e.value)=="object"){
			//return e.cellHtml.toISOString().slice(0,10);//日期少一
			var d = new Date(e.value); 
			var month =d.getMonth() + 1; 
			if(month.toString().length<2){
				month = "0"+month;
			}
			var day =d.getDate();
			if(day.toString().length<2){
				day = "0"+day;
			}
			return d.getFullYear() + '-' + month + '-' + day ; 
		}else{
			if(e.value){
				return e.value.substring(0,10);
			}
		}
	}
</script>
</body>
</html>
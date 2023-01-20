<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>	
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@include file="/common/common.jsp"%> 
<h:script src='<%="/common/scripts/eos-web.js"%>' />
<%
	String contextPath=request.getContextPath();
 %>
<html>
<!-- 
  - Author(s): mengyy
  - Date: 2018-01-12 16:38:45
  - Description:
-->
<head>
    <title>编辑合同审批</title>
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
        overflow:hidden;
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
        <input name="cscontract.contractid" id="conId" class="nui-hidden" />
        <input class="nui-hidden" name="cscontract.salename" id="salename"/>
        <input class="nui-hidden" name="cscontract.org" id="org"/>
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
                        <input name="cscontract.projectname" id="projectname" style="width:320px" class="nui-textbox" onvaluechanged="changeProject(e)"/>
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
                  
                     <td style="width:140px;display: none" align="right" id='starttime1'>协议有效期开始：</td>
                    <td style="width:150px; display: none;"  id='starttime2'>    
                        <input name="cscontract.xystart" class="nui-datepicker" emptyText="请选择日期"/>
                    </td>
                    <td style="width:140px;display: none" align="right"  id='endtime1'>协议有效期结束：</td>
                    <td style="width:150px;display: none"  id='endtime2'>    
                        <input name="cscontract.xyend" class="nui-datepicker" emptyText="请选择日期"/>
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
                    <td id="temp1" style="width:120px;" align="right">行业：</td>
                    <td id="temp4" style="width:150px;">    
                        <input class="mini-dictcombobox" name="cscontract.industry" dictTypeId="MIS_INDUSTRY_SUBDIVISION" style="width:135px" multiSelect="true"/>
                    </td>
                </tr>
                <tr id="temp2" style="display:">
                    <td style="width:120px;" align="right">是否禁止分包外包：</td>
                    <td style="width:150px;">
                    	<input class="nui-dictcombobox" name="cscontract.isforbid" id="isforbid" dictTypeId="MIS_YN" onvaluechanged="changedisforbid(e)" /><!-- showNullItem="true"  -->
                    </td>
                    <td style="width:120px;" align="right">是否高风险标识：</td>
                    <td style="width:150px;">
                    	<input class="nui-dictcombobox" style="width:135px"  name="cscontract.ishighrisk" id="ishighrisk" onvaluechanged="changedisforbid(e)" dictTypeId="MIS_YN"/>
                    </td>
                     <td style="width:120px;" align="right">是否允许对外宣传：</td>
                    <td style="width:150px;">
                    	<input class="mini-dictcombobox" name="cscontract.publicity" style="width:135px" id="publicity" dictTypeId="MIS_YN" />
                    </td>
                </tr>
                <tr id="temp3" style="display:">
                    <td style="width:140px;" align="right">是否有排他合作：</td>
                    <td style="width:150px;">   
                        <input class="mini-dictcombobox" name="cscontract.ispt"  id="ispt" dictTypeId="MIS_YN"  onvaluechanged="changePtcondition"/>
                    </td>
                    <td style="width:140px;display: none" align="right" id='pt1'>排他合作的条件：</td>
                    <td style="width:150px;display: none" colspan="5" id='pt2'>    
                        <input name="cscontract.ptcondition" id="ptcondition" class="nui-textarea" style="width:450px;" />
                    </td>
                </tr>
                <tr>
                	<td style="width:140px;" align="right">是否批量预估收入：</td> 
					<td style="width:150px;">  
						<input id="isfinreve" class="nui-dictcombobox"   required="true" readonly="readonly" dictTypeId="MIS_YN"  />
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
			   		您当前输入了 <span class="word_count1">0</span> 个字符,<span class="word_surplus"></span>
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
						<input name="cscontract.projectno" id="projectno" style="width:180px" onbuttonclick="selectProject1" class="nui-buttonedit" allowInput="false"/>
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
				                <div field="prodwbmon" dataType="currency" width="90" align="right" headerAlign="center">产品维保金额
				                	<input property="editor" class="nui-textbox" vtype="float" inputstyle="text-align: right;"/>
				                </div>
				                <div field="prodwbsubmon" dataType="currency" width="90" align="right" headerAlign="center">产品维保分包费
				                	<input property="editor" class="nui-textbox" vtype="float" inputstyle="text-align: right;"/>
				                </div>
				                <div field="prodwbothmon" dataType="currency" width="90" align="right" headerAlign="center">产品维保服务费
				                	<input property="editor" class="nui-textbox" vtype="float" inputstyle="text-align: right;"/>
				                </div>
				                <div field="buyprod" width="auto" align="left" headerAlign="center">说明
				                	<input property="editor" class="nui-textarea" inputstyle="text-align: left;" style="width:100px;" minWidth="100" minHeight="50"/>
				                </div>
				            </div>
				        </div>    
				    </div>
	            </div>
			</div>
			<div title="合同业务分类" >
				<fieldset id="csContType_fieldset" style="border:solid 1px #aaa;padding:3px;width: 750px;">
	            <legend>合同业务分类</legend>
		    	<div style="width:140px;">
			        <div class="nui-toolbar" style="border-bottom:0;padding:0px;">
			            <table style="width:100%;">
			                <tr>
			                    <td style="width:100%;">
			                        <a class="nui-button" iconCls="icon-add" onclick="addRow('csContType_grid')" plain="true">增加</a>
			                        <a class="nui-button" iconCls="icon-remove" onclick="removeRow('csContType_grid')" plain="true">删除</a>
			                    </td>
			                </tr>
			            </table>           
			        </div>
			    </div>
	            <div id="csContType_grid" class="nui-datagrid" style="width:100%;height:auto;"
		            showPager="false" allowCellEdit="true" allowCellSelect="true" multiSelect="true" editNextOnEnterKey="true"
		            oncellendedit="doContsum"  showSummaryRow="true" ondrawsummarycell="drawCsReveForecastSum">			            
		            <div property="columns">
		            	<div type="checkcolumn"></div>
		                <div field="type" width="100" renderer="getCsContracttype" headerAlign="center" align="left">合同业务分类
		                	<input property="editor" class=nui-dictcombobox  dictTypeId="CS_CONTRACT_TYPE"  onvaluechanged="selectContractType(e)"/>
		                </div>
		                <div field="summon" dataType="currency" width="80" headerAlign="center" align="right" summaryType="sum">业务分类金额
		                	<input property="editor" class="nui-textbox" vtype="float" inputStyle="text-align: right;"/>
		                </div>
		                <div field="taxrate" dataType="currency" width="80" headerAlign="center" align="right">税率
		                	<input property="editor" class="nui-textbox" vtype="float" inputStyle="text-align: right;"/>
		                </div>
		                <div field="summon2" dataType="currency" width="80" headerAlign="center" align="right" summaryType="sum">不含税金额</div>
		            </div>
		        </div>
	        	</fieldset>
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
		            oncellendedit="doCsGatherFcEnd" oncellbeginedit="doCsGatherFcBegin" 
		            showSummaryRow="true" ondrawsummarycell="drawCsReveForecastSum" allowCellWrap="true">			            
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
		                <div field="newyearmonth" width="80" headerAlign="center" dateFormat="yyyy-MM" align="left">最新预计收款年月
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
			            showSummaryRow="true" ondrawsummarycell="drawCsReveForecastSum" dataField="ameCsContBacks" allowCellWrap="true">			            
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
			        <jsp:include page="/ame_common/detailFile2.jsp"/>
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
			            showSummaryRow="true" ondrawsummarycell="drawCsReveForecastSum"  dataField="ameCsContDeps" allowCellWrap="true">			            
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
			        <jsp:include page="/ame_common/detailFile3.jsp"/>
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
	            <div id="csReveForecast_grid" class="nui-datagrid" frozenStartColumn="0" frozenEndColumn="4"  style="width:1055px;height:auto;" dataField="csReveForecasts"
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
	            <div id="product_reve_grid" class="nui-datagrid" style="width:1055px;height:auto;" oncellendedit="changeProdReve" showSummaryRow="true" ondrawsummarycell="drawCsReveForecastSum" dataField="productReves" 
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
		                	<input property="editor" class="nui-dictcombobox" dictTypeId="REVE_PRODTYPE"  onvaluechanged="selectProdtype(e)"/>
		                </div>
		                <div field="contsum" dataType="currency" width="80" align="right" headerAlign="center" summaryType="sum">参与分成合同额
		                	<input property="editor" class="nui-textbox" vtype="float" inputStyle="text-align: right" />
		                </div>
		                <div field="tax" dataType="currency" width="80" align="right" headerAlign="center" summaryType="sum">税金
		                	<input property="editor" class="nui-textbox" vtype="float" inputStyle="text-align: right" allowInput="false" />
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
        	<div title="合同产品授权清单">
				<jsp:include page="/contract/contractApproval/ameCsLicGrid.jsp"/>
			</div> 
        	<div title="合同附件">
        		<jsp:include page="/ame_common/detailFile1.jsp"/>
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
                    	<input class="mini-dictcombobox" name="cscontract.istrans" id="istrans" style="width:135px" dictTypeId="MIS_YN" />
                    </td>
                </tr>
                <tr style="display:">
                    <td style="width:120px;" align="right">服务数量类型：</td>
                    <td style="width:150px;">    
                        <input class="mini-dictcombobox" name="cscontract.servnumtype" dictTypeId="SERV_NUM_TYPE"/>
                    </td>
                    <td style="width:120px;" align="right">服务数量：</td>
                    <td style="width:150px;">    
                        <input class="nui-textbox" name="cscontract.servnum" vtype="float"/>
                    </td>
                    <td style="width:120px;" align="right">服务开始日期：</td>
                    <td style="width:150px;">    
                        <input name="cscontract.servstart" style="width:135px" class="nui-datepicker" emptyText="请选择日期"/>
                    </td>
                </tr>
                <tr>                	
                    <td style="width:120px;" align="right">赠送服务数量类型：</td>
                    <td style="width:150px;">    
                        <input class="mini-dictcombobox" name="cscontract.zsservtype" dictTypeId="SERV_NUM_TYPE"/>
                    </td>
                    <td style="width:120px;" align="right">赠送服务数量：</td>
                    <td style="width:150px;">    
                        <input class="nui-textbox" name="cscontract.zsservnum" vtype="float"/>
                    </td>
                    <td style="width:120px;" align="right">服务结束日期：</td>
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
						textField="empname" valueField="userid" dataField="leaders" onvaluechanged="setspr(e)" 
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
    						<textarea id="ke1" name="content2" style="width:100%;height:650px;visibility:hidden;"></textarea>
    					</td>
    				</tr>
    				<tr style="display:none;">
    					<td style="width:150px;" align="right">邮件附件：</td>
    					<td>
    						<jsp:include page="/ame_common/detailFile4.jsp"/>
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
</body>
<script type="text/javascript">
    nui.parse();
    var form = new nui.Form("#form1");
	var opioionform = new nui.Form("opioionform");
	var email = new nui.Form("#email");
	//产品分成
	var product_reve_grid = nui.get("product_reve_grid");
	//合同保函
	var csContBack_grid = nui.get("csContBack_grid");
	//合同保证金
	var csContDep_grid = nui.get("csContDep_grid");
	//合同业务分类
	var csContType_grid = nui.get("csContType_grid");
	
    //销售人员对应的grid的增加、删除方法
    //销售人员对应的产品的grid的增加、删除方法
	var sales_grid = nui.get("sales_grid");
	var product_grid = nui.get("product_grid");
	//合同收入预测
	var csReveForecast_grid = nui.get("csReveForecast_grid");
	
	var csContLicense_grid = nui.get("csContLicense_grid");//合同授权清单
	//合同收款
	var csGatherFc_grid = nui.get("csGatherFc_grid");
	
	var paths = "<%= request.getContextPath() %>"; //默认路径，js文件不能直接取，定义全局变量
	
	//产品税率
	var  productrate  = parseFloat(nui.getDictText('AME_SYSCONF','PRODUCTRATE'));
	//服务税率
	var  servicerate  = parseFloat(nui.getDictText('AME_SYSCONF','SERVICERATE'));
	//MA税率
	var  marate  = parseFloat(nui.getDictText('AME_SYSCONF','MARATE'));//产品税率
	//普元
	var  primeton  = nui.getDictText('AME_SYSCONF','primeton');
	//普元信息技术股份有限公司
	var  primetonName  = nui.getDictText('AME_SYSCONF','primetonName');
	//商务部
	var  commerce  = nui.getDictText('AME_SYSCONF','commerce');
	
	//商务组邮件
	var  emailBizValue  =nui.getDictText('AME_SYSCONF','emailBizValue');
    //销售人员点开对应的产品子grid时的方法
    var detailGrid_Form = document.getElementById("detailGrid_Form");        
	var currentRow=null; 
    //确认比例(编辑前)
    var fcreverateBegin = 0;
    //确认金额(编辑前)
	var fcsumBegin = 0;
	
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
        	var newRow = { name: "New Row",status: "0",billstatus:"0"};
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
	<%--审核界面相关js 开始--%>
	//事业部领导拼接
  	var empllist = [];
  	document.getElementById("choosehide").style.display="none";
	
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
	var projectno="无";
	var projectid=null;
	var projectname="";
	var contractProjectname="";
	var contracttype1=null;
	var cscontractsales=null;
	var csReveForecasts=null;
	var prodReves=null;//产品分成
	var cscontractsum=null;//合同总金额
	var cscontractprodmon=null;//合同产品
	var cscontractservmon=null;//合同服务
	var isforbid="";//是否禁止分包外包
	var email2 = null;
	var mailPay="";//邮件业务领域
	var mailPay1="";//邮件支付方式
	var csGatherFcs=null;
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
                cscontractsales = nui.clone(o.cscontract.cscontractsales);
                csReveForecasts = nui.clone(o.cscontract.csReveForecasts);
                csGatherFcs = o.cscontract.csGatherFcs;
                sales_grid.setData(cscontractsales);
                csGatherFc_grid.setData(csGatherFcs);
                csReveForecast_grid.setData(csReveForecasts);
                csContBack_grid.setData(o.cscontract.ameCsContBacks);
                csContDep_grid.setData(o.cscontract.ameCsContDeps);
                csContType_grid.setData(o.cscontract.ameCsContTypes);
                
                //合同产品授权
				csContLicense_grid.load({contractid: o.cscontract.contractid});
				csContLicense_grid.hideColumn(1);
				
                //产品分成
				product_reve_grid.sortBy("reveid","asc");
				product_reve_grid.load({contractid: o.cscontract.contractid},function(){
					prodReves = product_reve_grid.getData();
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
						nui.get("cbl1").setValue(sprValue);//把已选审批人选中
						nui.get("mailtolist").setValue(o.cscontract.email.tovalue);
				   		nui.get("mailtolist").setText(o.cscontract.email.tomame);
				   		nui.get("mailcclist").setValue(o.cscontract.email.ccvalue);
				   		nui.get("mailcclist").setText(o.cscontract.email.ccmame);
						nui.get("subject").setValue(o.cscontract.email.subject);
						editor2.html(o.cscontract.email.message);
					}else{
						setmailtext();
					}
				});
				
                editor1.html(o.cscontract.paycondition);
               	custname=o.cscontract.misCustinfo.custname;
               	cscontractsum = o.cscontract.contsum;
               	cscontractprodmon = o.cscontract.prodmon;
               	cscontractservmon = o.cscontract.servmon;
               	isforbid = o.cscontract.isforbid;
               	contracttype1 = o.cscontract.contracttype;
               	email2 = o.cscontract.email;
               	contractProjectname = o.cscontract.projectname==null?"":o.cscontract.projectname;
               	
				//加载附件设置参数
        		nui.get("grid_0").load({"groupid":"AME_CS_CONTRACT","relationid": o.cscontract.contractid},function(){
					//加载合同保函附件
	        		nui.get("grid_1").load({"groupid":"AME_CS_CONT_BACK","relationid": o.cscontract.contractid},function(){
	        			//加载接通保证金附件
        				nui.get("grid_2").load({"groupid":"AME_CS_CONT_DEP","relationid": o.cscontract.contractid});
	        		});
        		});
        		isViewDelete3=false;
				nui.get("grid_3").load({"groupid":"AME_CS_CONTRACT","relationid":o.cscontract.contractid},function(e){
					 var files=[];
					 var data1 = e.data;
					 nui.get("grid_3").selects(data1);//默认全部选中邮件
				});
				nui.get("grid_3").sortBy("fileTime","desc");
        		
        		nui.get("purChaseYesOrNo").setValue(o.cscontract.isProBudget);
        		nui.get("isfinreve").setValue(o.cscontract.isfinreve);
        		
        		if(o.cscontract == null || o.cscontract.saleshapid==null){
        		
				}else{
					 nui.get("saleshapid").setText(o.cscontract.csSaleshap.telcontent);
               		 nui.get("saleshapid").setValue(o.cscontract.saleshapid);
				}
        		if(o.cscontract == null || o.cscontract.projectno == null ){
        		
				}else{
				/*合同项目信息*/
					projectid = o.cscontract.rdproject.projectId == null ?"":o.cscontract.rdproject.projectId;
					projectno = o.cscontract.projectno== null ?"":o.cscontract.projectno;
					projectname = o.cscontract.rdproject.projectName== null ?"":o.cscontract.rdproject.projectName;
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
				//设置业务领域
				if(o.cscontract.soamon !=null && o.cscontract.soamon!="" && o.cscontract.soamon!=0){
               		mailPay=mailPay+"SOA金额："+(o.cscontract.soamon)/10000+"万元&nbsp;&nbsp;&nbsp;";
               	}
               	if(o.cscontract.yjsmon !=null && o.cscontract.yjsmon!="" && o.cscontract.yjsmon!=0){
               		mailPay=mailPay+"云计算金额："+(o.cscontract.yjsmon)/10000+"万元&nbsp;&nbsp;&nbsp;";
               	}
               	if(o.cscontract.dsjmon !=null && o.cscontract.dsjmon!="" && o.cscontract.dsjmon!=0){
               		mailPay=mailPay+"大数据金额："+(o.cscontract.dsjmon)/10000+"万元&nbsp;&nbsp;&nbsp;";
               	}
               	if(o.cscontract.mobilemon !=null && o.cscontract.mobilemon!="" && o.cscontract.mobilemon!=0){
               		mailPay=mailPay+"移动金额："+(o.cscontract.mobilemon)/10000+"万元&nbsp;&nbsp;&nbsp;";
               	}
				//设置支付方式
				if(csGatherFcs.length>0){
					for(z=0;z<csGatherFcs.length;z++){
		       			mailPay1=mailPay1+csGatherFcs[z].gatherno+"、"+csGatherFcs[z].gathertimedesc;
       				}
				}
				
               	if(o.cscontract.misCustinfo){
                	nui.get("custid").setText(o.cscontract.misCustinfo.custname);
                	nui.get("custname").setValue(o.cscontract.misCustinfo.custname);
                }
                nui.get("userid").setText(o.cscontract.username);
            	//编辑的时候隐藏合同收款的最初预计确认年月
            	csGatherFc_grid.hideColumn(csGatherFc_grid.getColumn(5));
            	
            	if(contracttype1 == "01" || contracttype1 == "04" || contracttype1 == "20" || 
            		contracttype1 == "08" || contracttype1 == "10"){//产品合同、混合合同、服务合同
					//document.getElementById("temp1").style.display = "";
					//document.getElementById("temp4").style.display = "";
					//document.getElementById("temp2").style.display = "none";
					document.getElementById("starttime1").style.display = "none";
			        document.getElementById("starttime2").style.display = "none";
			        document.getElementById("endtime1").style.display = "none";
			        document.getElementById("endtime2").style.display = "none";
					//document.getElementById("temp3").style.display = "none";
				}else{//框架协议
					document.getElementById("starttime1").style.display = "";
			        document.getElementById("starttime2").style.display = "";
			        document.getElementById("endtime1").style.display = "";
			        document.getElementById("endtime2").style.display = "";
					//document.getElementById("temp1").style.display = "none";
					//document.getElementById("temp4").style.display = "none";
					//document.getElementById("temp2").style.display = "";
					//document.getElementById("temp3").style.display = "";
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
				changePtcondition()
			},
			error:function(){}
		});
	}
	
	function setmailtext(){
		var mailtitle = "合同审批通知:";
		var mailcclist = emailBizValue;
		var mailcclistValue = emailBizValue;
		if(custname){
        	mailtitle = mailtitle+custname;
        }
        if(contractProjectname){
        	mailtitle = mailtitle +" "+contractProjectname;
        }
        
        nui.get("subject").setValue(mailtitle);
        var empname=null;
        var oemail=null;
       	if(cscontractsales.length==1){
       		empname = cscontractsales[0].salename;
       		oemail = cscontractsales[0].oemail;
       		mailcclist= mailcclist+","+empname+"< "+oemail+">";
       		mailcclistValue=mailcclistValue+","+oemail;
       		nui.get("mailcclist").setValue(mailcclistValue);
       		nui.get("mailcclist").setText(mailcclist);
       	}else if(cscontractsales.length>1){
       		for(i=0;i<cscontractsales.length;i++){
       			empname = cscontractsales[i].salename;
       			oemail = cscontractsales[i].oemail;
       			mailcclist= mailcclist+","+empname+"< "+oemail+">";
       			mailcclistValue=mailcclistValue+","+oemail;
       		}
       		nui.get("mailcclist").setValue(mailcclistValue);
       		nui.get("mailcclist").setText(mailcclist);
       	}
       	var rowspan="";
       	if(contracttype1 == "10" || contracttype1 == "20" || contracttype1 == "08" ){
       		rowspan =2;//设置合并行数
       	}else{
       		rowspan =3;
       	}
       	var content="";
       	content=content+"<p style='color:#E81010;font-size:18px;font-weight:bold;'>请大家在Ame+待办任务中审批本合同</p><p style='font-size:16px;font-weight:bold;'>本邮件由系统自动推送，无需回复！</p><p>事业部-销售："+nui.getDictText('CONT_ORG',cscontractsales[0].org)+"-"+cscontractsales[0].salename+"</p><p>该合同总金额："+(cscontractsum)/10000+"万（产品"+(cscontractprodmon)/10000+"万+服务"+(cscontractservmon)/10000+"万）</p><p>1、合同基本信息</p>";
       	content=content+"<table style='table-layout:fixed ;border:solid windowtext 0.5pt;' border='1' cellspacing='0'><tr><td width='60' style='text-align:center;background:#DBE5F1;font-weight:bold;'>序号</td><td width='60' style='text-align:center;background:#DBE5F1;font-weight:bold;'>章节</td><td width='100' style='text-align:center;background:#DBE5F1;font-weight:bold;'>类别</td><td style='text-align:center;background:#DBE5F1;font-weight:bold;'>合同条款</td><td width='100' style='text-align:center;background:#DBE5F1;font-weight:bold;'>审批人</td></tr>";
      	content=content+"<tr><td style='text-align:center;'>1</td><td style='text-align:center;'>--</td><td style='text-align:center;'>合同签订方</td><td><p>甲方：<span style='color:#0066CC;'>"+custname+"<span></p><p>乙方："+primeton+"</p></td><td>--</td></tr>";
      	content=content+"<tr><td style='text-align:center;'>2</td><td style='text-align:center;'>--</td><td style='text-align:center;'>项目</td><td><p>项目："+contractProjectname+"</p><p>项目编号："+projectno+"</p></td><td>--</td></tr>";
      	content=content+"<tr><td style='text-align:center;'>3</td><td style='text-align:center;'>--</td><td style='text-align:center;'>业务领域</td><td>"+mailPay+"</td><td>--</td></tr>";
      	content=content+"<tr><td style='text-align:center;'>4</td><td style='text-align:center;'>X.X</td><td style='text-align:center;'>金额</td><td><p>合同总金额：<span style='color:#E81010;'>"+(cscontractsum)/10000+"万元<span></p><p>1）标准产品交付数量及价格：</p><p>2）赠送：无</p></td><td rowspan='"+rowspan+"' >"+address+"</td></tr>";
      	content=content+"<tr><td style='text-align:center;'>5</td><td style='text-align:center;'>X.X</td><td style='text-align:center;'>支付方式</td><td>"+mailPay1+"</td></tr>";
       	if(contracttype1 == "01"){//产品
	      	content=content+"<tr><td style='text-align:center;'>6</td><td style='text-align:center;'>X.X</td><td style='text-align:center;'>维保</td><td>X年 基本/增强型</td></tr>";
	      	content=content+"<tr><td style='text-align:center;'>7</td><td style='text-align:center;'>X.X</td><td style='text-align:center;'>--</td><td>违约责任</td><td>请逯亚娟审批</td></tr></table>";
	      	content=content+setCsReveForecasts();
       	}else if(contracttype1 == "10" || contracttype1 == "20"){//服务、混合销售
	      	content=content+"<tr><td style='text-align:center;'>6</td><td style='text-align:center;'>X.X</td><td style='text-align:center;'>--</td><td>违约责任</td><td>请逯亚娟审批</td></tr>";
	      	content=content+"<tr><td style='text-align:center;'>7</td><td style='text-align:center;'>X.X</td><td style='text-align:center;'>禁止分包/外包</td><td>"+nui.getDictText('MIS_YN',isforbid)+"</td><td style='background: yellow'><span>提醒事业部注意</span></td></tr>";
	      	content=content+"<tr><td style='text-align:center;'>8</td><td style='text-align:center;'>X.X</td><td style='text-align:center;'>附件</td><td></td><td>请XXX审批</td></tr></table>";
       		content=content+setCsReveForecasts();
       	}else if(contracttype1 == "08" ){//维保
       		content=content+"</table>";
       		content=content+setCsReveForecasts();
       	}else{
	      	content=content+"<tr><td style='text-align:center;'>6</td><td style='text-align:center;'>X.X</td><td style='text-align:center;'>维保</td><td>X年 基本/增强型</td></tr>";
	      	content=content+"<tr><td style='text-align:center;'>7</td><td style='text-align:center;'>X.X</td><td style='text-align:center;'>--</td><td>违约责任</td><td>请XXX审批</td></tr></table>";
       	}
       	content=content+"<p>"+commerce+"</p><p>"+primetonName+"</p>";
       	
      	editor2.html(content);
	}
	function setCsReveForecasts(){
		var content = "";
		if(csReveForecasts.length > 0){
	      		content=content+"<p>2、收入确认方式</p>";
	          	content=content+"<p>收入类型："+nui.getDictText('AME_REVETYPE',csReveForecasts[0].revetype)+"</p>";
	          	content=content+"<table style='table-layout:fixed ;border:solid windowtext 0.5pt;' border='1' cellspacing='0'><tr><td width='5%' style='text-align:center;background:#DBE5F1;' rowspan='2'>次数</td><td width='15%' style='text-align:center;background:#DBE5F1;' rowspan='2'>收入确认时点</td><td width='10%'style='text-align:center;background:#DBE5F1;' rowspan='2'>收入确认证据</td><td width='15%' style='text-align:center;background:#DBE5F1;color:#E81010;' colspan='3'>*预计确认时间</td><td width='8%' style='text-align:center;background:#DBE5F1;' rowspan='2'>确认比例</td><td width='12%' style='text-align:center;background:#DBE5F1;' rowspan='2'>确认金额</td><td width='25%' style='text-align:center;background:#DBE5F1;color:#E81010;'colspan='3'>产品线收入分成</td></tr>";
	          	content=content+"<tr><td width='40' style='text-align:center;background:#DBE5F1;color:#E81010;'>年</td><td width='40' style='text-align:center;background:#DBE5F1;color:#E81010;'>月</td><td width='70' style='text-align:center;background:#DBE5F1;color:#E81010;'>上旬/下旬</td><td width='20%' style='text-align:center;background:#DBE5F1;color:#E81010;'colspan='2'>参与分成的合同额</td><td width='50%' style='text-align:center;background:#DBE5F1;color:#E81010;'>分成收入(不含税)分成比例14%</td></tr>";
	      		
	      		var yearmonth="";
	      		var year="";
	      		var month ="";
	      		var monthperiod="";
	      		var fcreverate=0;
	      		var total=0;//参与分成的合同额合计
      			var total1=0;//分成收入合计
      			var total2 =0;//确认金额合计
	      		for(j=0;j<csReveForecasts.length;j++){
	      			yearmonth = csReveForecasts[j].yearmonth;
	      			var soa=0;//soa产品分成含税
	      			var soa1=0;//soa分成金额
	      			var dsj=0;//dsj产品分成含税
	      			var dsj1=0;//dsj分成金额
	      			var yd=0;//yd产品分成含税
	      			var yd1=0;//yd分成金额
	      			var fcsum=0;
	      			var fcsum1=0;
	      			if(prodReves!=null){
	      				var SOA = new Array();
	      				var DSJ = new Array();
	      				var YD = new Array();
	      				for(var p=0;p<prodReves.length;p++){
	      					if(prodReves[p].reveid==csReveForecasts[j].reveid){
  							    if(prodReves[p].prodtypeid=='01'){
		      						SOA.push(prodReves[p]);
		      					}else if(prodReves[p].prodtypeid=='02'){
		      						DSJ.push(prodReves[p]);
		      					}else if(prodReves[p].prodtypeid=='03'){
		      						YD.push(prodReves[p]);
		      					}
	      					}
	      				}
	      				if(DSJ!=null){
	      					for(var u=0;u<DSJ.length;u++){
	      						dsj += parseFloat(DSJ[u].contsum);
	      						dsj1 += parseFloat(DSJ[u].pratiomon);
	      					}
	      				}
	      				if(YD!=null){
	      					for(var u=0;u<YD.length;u++){
	      						yd += parseFloat(YD[u].contsum);
	      						yd1 += parseFloat(YD[u].pratiomon);
	      					}
	      				}
	      				if(SOA!=null){
	      					for(var u=0;u<SOA.length;u++){
	      						soa += parseFloat(SOA[u].contsum);
	      						soa1 += parseFloat(SOA[u].pratiomon);
	      					}
	      				}
	      			}
	      			soa = parseFloat(parseFloat(soa)/parseFloat(10000)).toFixed(2);
	      			soa1 = parseFloat(parseFloat(soa1)/parseFloat(10000)).toFixed(2);
	      			dsj = parseFloat(parseFloat(dsj)/parseFloat(10000)).toFixed(2);
	      			dsj1 = parseFloat(parseFloat(dsj1)/parseFloat(10000)).toFixed(2);
	      			yd = parseFloat(parseFloat(yd)/parseFloat(10000)).toFixed(2);
	      			yd1 = parseFloat(parseFloat(yd1)/parseFloat(10000)).toFixed(2);
	      			total += parseFloat(soa) + parseFloat(dsj) + parseFloat(yd);
	      			total1 += parseFloat(soa1) + parseFloat(dsj1) + parseFloat(yd1);
	      			fcsum = csReveForecasts[j].fcsum;
	      			fcsum1 = parseFloat(fcsum/10000).toFixed(2);
	      			total2 += fcsum;
	      			fcreverate = fcreverate+csReveForecasts[j].fcreverate;
	        		if(typeof(yearmonth) == "string" && yearmonth.length == 7){
	        			year = yearmonth.substr(0,4);
	        			month = yearmonth.substr(5,2);
	        		}else if(typeof(yearmonth) == "string" && yearmonth.length == 6){
	        			year = yearmonth.substr(0,4);
	        			month = yearmonth.substr(4,2);
	        		}else{
	        			year = yearmonth.getFullYear();
	        			month = yearmonth.getMonth() + 1;
	        			if(month < 10){
	        				month = "0" + month;
	        			}else{
	        				month = "" + month;
	        			}
	        		}
	      			monthperiod = nui.getDictText('AME_MONTHPERIOD',csReveForecasts[j].monthperiod);
	      			content=content+"<tr><td style='text-align:center;'>"+csReveForecasts[j].reveno+"</td><td>"+csReveForecasts[j].revetimedesc+"</td><td>"+nui.getDictText('MIS_INCOMECONV',csReveForecasts[j].reveproof)+"</td><td style='background:yellow;text-align:center;'>"+year+"</td><td style='background:yellow;text-align:center;'>"+month+"</td><td style='background:yellow;text-align:center;'>"+monthperiod+"</td><td style='text-align:center;'>"+(csReveForecasts[j].fcreverate)*100+"%</td><td style='text-align:center;'>"+ fcsum1 +"万元</td><td style='color:#E81010;' colspan='2'><span>SOA产品："+ soa +"万元</span><br/><span>大数据产品："+ dsj +"万元</span><br/><span>移动产品："+ yd +"万元</span><br/></td><td style='color:#E81010;'><span>"+ soa1 +"万元</span><br/><span>"+ dsj1 +"万元</span><br/><span>"+ yd1 +"万元</span><br/></td></tr>";
	      		}
	      		total = parseFloat(total).toFixed(2);
	      		total1 = parseFloat(total1).toFixed(2);
	      		total2 = parseFloat(total2/10000).toFixed(2);
	      		content=content+"<tr><td colspan='3'></td><td colspan='3'align='right'>合计：</td><td style='text-align:center;'>"+fcreverate*100+"%</td><td style='text-align:center;'>"+ total2 +"万元</td><td colspan='2' style='color:#E81010;'>"+ total +"万元</td><td style='color:#E81010;'>"+ total1 +"万元</td></tr></table>";
	      	}
	     return content;
	}
    
	function changeProject(e){
		contractProjectname=nui.get("projectname").getValue();
		if(email2 != null && email2 != ""){
  	 	}else{
  	 		setmailtext();
  	 	}
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
		var prodwbnetmon = (prodwbmon/(1+servicerate)-prodwbmon/(1+servicerate)*servicerate*0.07-prodwbsubmon-prodwbothmon).toFixed(2);
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
	
    //根据合同类型获取合同存档编号
   /*  nui.get('contracttype').on('valuechanged',function(e){
		var contracttype = nui.get('contracttype').getValue();
		if(contracttype == "01" || contracttype == "04" || contracttype == "20" || contracttype == "08" || contracttype == "10"){//产品合同、混合合同、服务合同
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
	}) */
	
		
    //根据合同类型获取合同存档编号
    nui.get('contracttype').on('valuechanged',function(e){
		var contracttype = nui.get('contracttype').getValue();
		if(contracttype == "01" || contracttype == "04" || contracttype == "20" || contracttype == "08" || contracttype == "10"){//产品合同、混合合同、服务合同，框架协议
			/* document.getElementById("temp1").style.display = "";
			document.getElementById("temp4").style.display = ""; */
			/* document.getElementById("temp2").style.display = "none"; */
			/* 	document.getElementById("temp3").style.display = "none"; */
			document.getElementById("starttime1").style.display = "none";
			document.getElementById("starttime2").style.display = "none";
			document.getElementById("endtime1").style.display = "none";
			document.getElementById("endtime2").style.display = "none";

		 }else{//框架协议
			/* document.getElementById("temp1").style.display = "none";
			document.getElementById("temp4").style.display = "none"; */
			/* document.getElementById("temp2").style.display = ""; */
			/* document.getElementById("temp3").style.display = ""; */
			document.getElementById("starttime1").style.display = "";
			document.getElementById("starttime2").style.display = "";
			document.getElementById("endtime1").style.display = "";
			document.getElementById("endtime2").style.display = "";
		} 
	})
	
	
    function GetData() {
        var o = form.getData();
        return o;
    }
    function checkDetail4(){
		var executeUrl = "/default/ame_budget/detailPdircost.jsp?id=" + projectid;
		window.open(executeUrl, "应用详细信息", "fullscreen=1");
    }
    function checkDetail1(){
		var executeUrl = "/default/ame_budget/detailPempcost.jsp?id=" + projectid;
		window.open(executeUrl, "应用详细信息", "fullscreen=1");
    }
    function checkDetail2(){
		var executeUrl = "/default/ame_budget/detailPoutcost.jsp?id=" + projectno+"&costtype="+1;
		window.open(executeUrl, "应用详细信息", "width=900px,height=700px","resizable=yes");
    }
    function checkDetail3(){
		var executeUrl = "/default/ame_budget/detailPoutcost.jsp?id=" + projectno+"&costtype="+0;
		window.open(executeUrl, "应用详细信息", "width=900,height=700","resizable=yes");
    }
    function onOk() {
    	var msg=null;
    	if(!onOkCheck()){
			return;
		}
		if(nui.get("isforbid").getValue()==1 || nui.get("ishighrisk").getValue()==1){
    		if(!editor1.html()){
    			nui.alert("是否允许分包外包或是否高风险为是时，合同备注说明必填！","合同备注说明未添加");
    			return;
    		}
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
        	msg = checkConttype();//验证合同总金额是否等于合同业务分类数据之和
    	 	if(msg){
	    	 	nui.alert(msg);
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
			}
			//合同收款
			var csGatherFcsRows = csGatherFc_grid.getData();
			for(var j = 0;j < csGatherFcsRows.length;j ++){
				if(!csGatherFcsRows[j].gatherno){
	        		nui.alert("收款确认次数不能为空!");
	        		nui.get("appButton").enable();
					nui.get("saveButton").enable();
	        		return;
	        	}
	        	if(!csGatherFcsRows[j].yearmonth){
	        		nui.alert("合同收款记录的预计收款年月不能为空!");
	        		nui.get("appButton").enable();
					nui.get("saveButton").enable();
	        		return;
	        	}
			}
			var csReveForecastRows = csReveForecast_grid.getData();
			//如果合同收入汇总金额与合同总金额不相等，提示
			var checkSumMoney = 0;
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
	        	//最初预计确认年月不能为空 
	        	if(!csReveForecastRows[i].yearmonth){
	        		nui.alert("合同收入确认预估的预计确认年月不能为空!");
	        		nui.get("appButton").enable();
					nui.get("saveButton").enable();
	        		return;
	        	}
				checkSumMoney += csReveForecastRows[i].fcsum;
			}
			checkSumMoney = parseFloat(checkSumMoney).toFixed(2);
			var checkContsum = parseFloat(contsum).toFixed(2);
			if(checkSumMoney != checkContsum){
	        	nui.confirm("合同总金额："+checkContsum+"，与合同收入确认预估汇总金额："+checkSumMoney+"不相等，确定要执行此操作？","系统提示",function(a){
	        		if(a == "ok"){
				        sureOK();
	        		}else{
	        			nui.get("appButton").enable();
						nui.get("saveButton").enable();
	        		}
	        	});
	        }else{
				sureOK();
	        }
	    }
    }
    function sureOK(){
    	//审核结果
    	var auditstatus = nui.get("auditstatus").getValue();
		//判断审批信息
    	if(auditstatus == "1" && nui.get("lookup2").getValue() == ""){
    		nui.alert("审批通过时审批人不允许为空");
    		return false;
    	}
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
     //点击保存时调用的方法
    function SaveData(){
    	var text = editor1.html();
		nui.get("paycondition").setValue(text);
    	var o = form.getData();
    	var row = sales_grid.getSelected();
    	data_opioion = opioionform.getData();//审批意见
    	//邮件附件
    	var rows = nui.get("grid_3").getSelecteds();
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
		nui.get("attaches").setValue("");
    	var text = editor2.html();
		nui.get("message").setValue(text);
    	var email1 = email.getData();
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
		//合同业务分类
		o.cscontract.csContTypes = csContType_grid.getChanges();
		//合同产品授权
        o.cscontract.csContLicenses = csContLicense_grid.getChanges();
        //收入预测记录
        o.cscontract.csReveForecasts = nui.clone(csReveForecast_grid.getData());
        for(var i = 0;i < o.cscontract.csReveForecasts.length;i ++){
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
        //产品分成
        o.cscontract.productReves = product_reve_grid.getData();
		//合同收款
		o.csGatherFcs = nui.clone(csGatherFc_grid.getData());
		for(var i = 0; i < o.csGatherFcs.length; i ++){
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
        if(row){
        	var datas=product_grid.getData();
        	row.saleProds=datas;
        }
        o.cscontract.sales = nui.clone(sales_grid.getData());
		
        var json = nui.encode({"cscontract":o.cscontract,"csGatherFcs":o.csGatherFcs,"misOpinion": data_opioion.misOpinion,email:email1.mailinfo});
        submit(json);
    }
    function submit(json){
    	form.loading("提交中，请稍候...");
        nui.ajax({
            url: "com.primeton.mis.contract.contractApproval.bussinessRevContractAppr.biz.ext",
            data: json,
            type: 'POST',
            cache: false,
            contentType: 'text/json',
            success: function (text) {
        		var returnJson = nui.decode(text);
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
    var address='';//设置邮件审批人
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
        
        address='';
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
	          	 			address = address+'<p>请'+emails[m].EMPNAME+'审批</p>';
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
	          	 		if(email2 != null && email2 != ""){
	          	 		}else{
	          	 			setmailtext();
	          	 		}
	          	 	}else{
	          	 		if(email2 != null && email2 != ""){
	          	 		}else{
	          	 			address="";
	          	 			setmailtext();
	          	 		}
	          	 	}
          	 	}else{
          	 		if(email2 != null && email2 != ""){
          	 		}else{
          	 			address="";
          	 			setmailtext();
          	 		}
          	 	}
		    }
		});
   	}
    
    function setspr1(e){
    	address='';
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
	          	 		for(n=0;n<emails.length;n++){
	          	 			address = address+'<p>请'+emails[n].EMPNAME+'审批</p>';
	          	 			if(n==emails.length-1){
	          	 				emailvalue=emailvalue+emails[n].OEMAIL;
	          	 				emailname=emailname+emails[n].EMPNAMES;
	          	 			}else{
	          	 				emailvalue=emailvalue+emails[n].OEMAIL+",";
	          	 				emailname=emailname+emails[n].EMPNAMES+",";
	          	 			}
	          	 		}
	          	 		nui.get("mailtolist").setValue(emailvalue);
	          	 		nui.get("mailtolist").setText(emailname);
	          	 		if(email2 != null && email2 != ""){
	          	 		}else{
	          	 			setmailtext();
	          	 		}
          	 		}else{
          	 			if(email2 != null && email2 != ""){
	          	 		}else{
	          	 			address="";
	          	 			setmailtext();
	          	 		}
          	 		}
          	 	}else{
          	 		if(email2 != null && email2 != ""){
          	 		}else{
          	 			address="";
          	 			setmailtext();
          	 		}
          	 	}
		    }
		});
    }
    
    function setsjr(e){
    	address='';
    	var mailtolist = nui.get("mailtolist").getText().split(",");
    	if(mailtolist != null && mailtolist !=""){
   			for(var i = 0;i < mailtolist.length;i ++){
   				mailtolistname = mailtolist[i];
        		var mailtolistname = mailtolistname.substring(0,mailtolistname.indexOf("<"));
        		address=address+'<p>请'+mailtolistname+'审批</p>';
        	}
        	if(email2 != null && email2 != ""){
  	 		}else{
  	 			setmailtext();
  	 		}
        }else{
        	if(email2 != null && email2 != ""){
  	 		}else{
  	 			address="";
  	 			setmailtext();
  	 		}
        } 
    }
    
	var editor2 = null;
	 KindEditor.ready(function(K) {
			editor2 = K.create('textarea[name="content2"]', {
			cssPath : '<%=contextPath%>/common/nui/resource/kindeditor/plugins/code/prettify.css',
			uploadJson : '<%=contextPath%>/common/nui/resource/kindeditor/jsp/upload_json.jsp',
			fileManagerJson : '<%=contextPath%>/common/nui/resource/kindeditor/jsp/file_manager_json.jsp',
			allowFileManager : true,
			cssData: '* {font: 12px;line-height:13px}',
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
	//汇总
	function drawCsReveForecastSum(e){
		if (e.field == "fcsum" || e.field == "contsum" || e.field == "tax"|| e.field == "contsum2"|| e.field == "pratiomon"
			|| e.field == "backdepmon" || e.field == "returnmon" 
			|| e.field == "summon"|| e.field == "summon2"
			|| e.field == "total"  || e.field == "grantnum"  || e.field == "lastnum" ) {
            e.cellHtml = "<div align='right'><b>" + e.cellHtml + "</b></div>";
        }
	}
	
	//是否有排他合作
	function changePtcondition(){
		var ispt = nui.get("ispt").getValue();
		if(ispt=='1'){
	document.getElementById("pt1").style.display = ""; 
	document.getElementById("pt2").style.display = ""; 

		}else{
	 document.getElementById("pt1").style.display = "none";
	 document.getElementById("pt2").style.display = "none"; 
		}		
	}
	
	
</script>
<!-- 付款申请相关公用的js包括各种触发事件以及计算公式 -->
<script src="<%= request.getContextPath() %>/contract/contractApproval/js/contractAppr.js" type="text/javascript"></script>
</html>
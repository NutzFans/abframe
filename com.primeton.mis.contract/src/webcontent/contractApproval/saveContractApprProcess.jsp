<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>	
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
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
    <title>合同编号及存档</title>
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
	<div class="mini-panel" title="合同编号及存档" style="width:100%;">
		<div id="tips">
			<!-- 提示信息展示  -->
			<jsp:include page="/ame_common/ameFlowOperTips/ameFlowOperTipsInfo.jsp"/>
		</div>
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
        <input class="nui-hidden" name="cscontract.saveStatus" id="saveStatus"/>
        <input class="nui-hidden" name="cscontract.stat" id="stat"/>
        <input class="nui-hidden" name="cscontract.salename" id="salename"/>
        <input class="nui-hidden" name="cscontract.org" id="org"/>
        <input id="contnum_old" class="nui-hidden" />
        <input class="nui-hidden" name="cscontract.projectId" id="projectId" />
        <input class="nui-hidden" name="cscontract.custname" id="custname" />
		<input class="nui-hidden" name="cscontract.contorderid" id="contorderid" />
        <input class="nui-hidden" name="cscontract.ocstartdate" id="ocstartdate" />
        <input class="nui-hidden" name="cscontract.contpolmon" id="contpolmon" />
        <input class="nui-hidden" id="servjsmon1" name="servjsmon1"/>
        <input class="nui-hidden" id="prodwbmon1" name="prodwbmon1"/>
        <fieldset style="border:solid 1px #aaa;padding:3px;width: 100%;">
            <legend>合同基本信息</legend>
            <div style="padding:5px;">
            <table style="table-layout:fixed;" id="table_file">
                <tr>
                    <td style="width:160px;" align="right">合同类型：</td>
                    <td style="width:150px;" colspan="2">    
                        <input class="mini-dictcombobox" name="cscontract.contracttype" id="contracttype" dictTypeId="MIS_CONTRACTTYPE" required="true"/>
                    </td>
                    <td style="width:140px;" align="right">合同号：</td>
                    <td style="width:320px;"colspan="2">    
                        <input name="cscontract.contid" style="width:300px" class="nui-textbox" required="true"/>
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
                	<td style="width:120px;" align="right">合同存档编号：</td>
                    <td style="width:150px;">    
                        <input name="cscontract.contnum" id="contnum" class="nui-textbox" required="true" onvaluechanged="changeContnum(e)"/>
                    </td>
	                <td style="width:120px;" align="right">登记日期：</td>
	                <td style="width:150px;">
	                    <input name="cscontract.contreg" id="contreg" class="nui-datepicker" required="true" allowInput="false" onValuechanged="changeOcDate"/>
	                </td>
	                <td style="width:120px;" align="right">合同签署日期：</td>
	                <td style="width:150px;">    
	                    <input name="cscontract.signdate" style="width:135px" id="signdate" class="nui-datepicker" emptyText="请选择日期"  required="true"/>
	                </td>
                </tr>
                <tr>
					
                    <td id="temp1" style="width:140px;" align="right">行业：</td>
                    <td id="temp4" style="width:150px;">    
                        <input class="mini-dictcombobox"  name="cscontract.industry" dictTypeId="MIS_INDUSTRY_SUBDIVISION" multiSelect="true"/>
                    </td>
                       <td style="width:140px;display:none;" align="right" id='starttime1'>协议有效期开始：</td>
                    <td style="width:150px; display: none;" id='starttime2'>    
                        <input name="cscontract.xystart" class="nui-datepicker" emptyText="请选择日期"/>
                    </td>
                    <td style="width:140px;display: none;" align="right" id='endtime1'>协议有效期结束：</td>
                    <td style="width:150px;display: none;" id='endtime2'>    
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
                        <input class="nui-spinner" format="n2"  allowLimitValue="false" changeOnMousewheel="false"  showbutton="false"  name="cscontract.servmon" style="width:135px"  id="servmon"  readonly="readonly"/>
                    </td>
                </tr>
                <tr>
                    <td style="width:120px;" align="right">采购1：</td>
                    <td style="width:150px;">    
                        <input name="cscontract.servsubmon" id="servsubmon"  readonly="readonly" class="nui-spinner" format="n2"  allowLimitValue="false" changeOnMousewheel="false"  showbutton="false"  />
                    </td>
                	<td style="width:120px;" align="right">采购2：</td>
                    <td style="width:150px;">    
                        <input class="nui-spinner" name="cscontract.othmon" id="othmon" readonly="readonly"  format="n2"  allowLimitValue="false" changeOnMousewheel="false"  showbutton="false"  />
                    </td>
                    <td style="width:120px;" align="right">所属公司：</td>
                    <td style="width:150px;" >    
                        <input class="mini-dictcombobox" name="cscontract.company" id="company"  dictTypeId="company" required="true" style="width:135px"/>
                    </td>
                </tr>
                <tr id="temp2" style="display:">
                 
                   
                    <td style="width:140px;" align="right">是否禁止分包外包：</td>
                    <td style="width:150px;">
                    	<input class="mini-dictcombobox" name="cscontract.isforbid" id="isforbid" dictTypeId="MIS_YN"  onvaluechanged="changedisforbid(e)"/>
                    </td>
                    <td style="width:140px;" align="right">是否高风险标识：</td>
                    <td style="width:150px;">
                    	<input class="mini-dictcombobox" name="cscontract.ishighrisk" id="ishighrisk" dictTypeId="MIS_YN"  onvaluechanged="changedisforbid(e)"/>
                    </td>
                     <td style="width:120px;" align="right">是否允许对外宣传：</td>
                    <td style="width:150px;">
                    	<input class="mini-dictcombobox" name="cscontract.publicity" style="width:135px" id="publicity" dictTypeId="MIS_YN" />
                    </td>
                </tr>
                <tr id="temp3" style="display:">
                    <td style="width:140px;" align="right">是否有排他合作：</td>
                    <td style="width:150px;">   
                        <input class="mini-dictcombobox" name="cscontract.ispt" id="ispt" dictTypeId="MIS_YN" onvaluechanged="changePtcondition"/>
                    </td>
                    <td style="width:140px;" align="right" id='pt1'>排他合作的条件：</td>
                    <td style="width:150px;" colspan="3" id='pt2'>    
                        <input name="cscontract.ptcondition" id="ptcondition" class="nui-textarea" style="width:450px;" />
                    </td>
                </tr>
                <tr>
                	<td style="width:140px;" align="right">是否批量预估收入：</td>
                    <td style="width:150px;">
                    	<input class="mini-dictcombobox" name="cscontract.isfinreve" style="width:135px" id="isfinreve" dictTypeId="MIS_YN" />
                    </td>
                </tr>
                <tr>
                    <td style="width:120px;" align="right">是否发送邮件：</td>
                    <td style="width:150px;"colspan="5">
                    	<input class="mini-dictcombobox" name="cscontract.issendmail" id="issendmail" dictTypeId="MIS_YN" value="0" />
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
        <fieldset id="project" style="border:solid 1px #aaa;padding:3px;width:100%;">
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
		        	<div id="sales_grid" class="nui-datagrid" style="width:100%;height:auto;" allowResize="true" oncellendedit="doCal"
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
		            	<div field="contnum" width="80" headerAlign="center" align="left" >合同编号
		            		<input property="editor" class="nui-textbox"/>
		            	</div>
		            	<div field="contorderno" width="80" headerAlign="center" align="left" >合同订单编号
		            		<input property="editor" class="nui-textbox"/>
		            	</div>
		                <div field="type" width="100" renderer="getCsContracttype" headerAlign="center" align="left">合同业务分类
		                	<input property="editor" class=nui-dictcombobox  dictTypeId="CS_CONTRACT_TYPE" onvaluechanged="selectContractType(e)"/>
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
		                	<input property="editor" class="nui-dictcombobox" dictTypeId="REVE_PRODTYPE" onvaluechanged="selectProdtype(e)"/>
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
        		<jsp:include page="/ame_common/detailFile4.jsp"/>
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
                    	<input class="mini-dictcombobox" name="cscontract.istrans" style="width:135px" id="istrans" dictTypeId="MIS_YN" />
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
                   <td style="width:140px;" align="right">服务开通标示：</td>
                    <td style="width:150px;">    
                        <input class="mini-dictcombobox" name="cscontract.servopenflag" dictTypeId="CS_SERVOPENFLAG"/>
                    </td>
                     <td style="width:140px;" align="right">服务开通情况：</td>
	                <td style="width:150px;">    
	                    <input class="mini-dictcombobox" name="cscontract.servstage" dictTypeId="CS_SERVSTAGE"/>
	                </td>
                    <td style="width:120px;" align="right">服务期限：</td>
	                <td style="width:150px;">    
	                    <input class="mini-dictcombobox" style="width:135px" name="cscontract.servterm" dictTypeId="CS_SERVTERM"/>
	                </td>
                </tr>
                <tr>                	
                    <td style="width:140px;" align="right">服务模块：</td>
                    <td style="width:150px;">    
                        <input class="mini-dictcombobox" name="cscontract.servmodule" dictTypeId="CS_SERVMODULE"/>
                    </td>
	                <td style="width:140px;" align="right">售后服务相关内容：</td>
                    <td style="width:380px;" colspan="3">    
                        <input name="cscontract.remakr" class="nui-textarea"  style="width: 440px;"/>
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
                <tr>
                	<td style="width:140px;" align="right">备注原因：</td>
                    <td colspan="5"><input name="cscontract.remark" id="remark1" class="nui-textarea" style="width:100%;"/></td>
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
	    </fieldset>
    </form>
	</div>
</div>
<div style="text-align: center;padding: 10px;border-width:1px 0px 0px 0px;" class="nui-toolbar">
	<a class="nui-button" onclick="onOk('1')" id="appButton" style="width: 80px;margin-right: 20px;">提交流程</a>  
	<a class="nui-button" onclick="onOk('2')" id="saveButton" style="width:80px;margin-right: 20px;">暂不签署</a>  
	<a class="nui-button" onclick="onCancel('cancel')" id="closeWin" style="width:60px;">关闭</a>
</div>  
</body>        
<script type="text/javascript">
    nui.parse();
    
    var form = new nui.Form("#form1");
	var opioionform = new nui.Form("opioionform");
	//合同订单编号
	var contorderno =""
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
	//合同业务分类
	var csContType_grid = nui.get("csContType_grid");
	
	var csContLicense_grid = nui.get("csContLicense_grid");//合同授权清单
	//产品税率
	var  productrate  = parseFloat(nui.getDictText('AME_SYSCONF','PRODUCTRATE'))
	//服务税率
	var  servicerate  = parseFloat(nui.getDictText('AME_SYSCONF','SERVICERATE'))
	//MA税率
	var  marate  = parseFloat(nui.getDictText('AME_SYSCONF','MARATE'))
	
	var paths = "<%= request.getContextPath() %>"; //默认路径，js文件不能直接取，定义全局变量
	
    //销售人员点开对应的产品子grid时的方法
    var detailGrid_Form = document.getElementById("detailGrid_Form");        
	var currentRow=null;    //确认比例(编辑前)
    var fcreverateBegin = 0;
    //确认金额(编辑前)
	var fcsumBegin = 0;	
	
    function addRow(gridid) {      
    	var contnum = nui.get("contnum").getValue();       
    	var contracttype = nui.get("contracttype").getValue();   
        if(gridid == "csReveForecast_grid"){
	    	var newRow = { name: "New Row",status: "0" ,contorderno: contorderno};
	        var grid = nui.get(gridid);
	        grid.addRow(newRow, 0);
        }else if(gridid == "csContBack_grid"){
        	//合同保函新增行：状态默认为履行中,类型为保函
        	var newRow = { name: "New Row",type:"1",status: "0" };
        	var grid = nui.get(gridid);
        	grid.addRow(newRow, 0);
        }else if(gridid == "csContLicense_grid"){
        	//合同产品授权新增行
        	newRow = { name: "New Row",contnum:contnum};
        	var grid = nui.get(gridid);
        	grid.addRow(newRow, 0);
        }else if(gridid == "csContDep_grid"){
        	//合同保证金新增行：状态默认为履行中,类型为保证金
        	var newRow = { name: "New Row",type:"2",status: "0" };
        	var grid = nui.get(gridid);
        	grid.addRow(newRow, 0);
        }else if(gridid == "csContType_grid"){//合同业务分类新增行：必须有合同编号才可以增加行
        	if( contnum != null && contnum!=""){
        		if(contracttype == "04" || contracttype == "30"){
		    		newRow = { name: "New Row",contnum:contnum,contorderno: contorderno};
		    	}else{
		    		newRow = { name: "New Row",contnum:contnum,contorderno: contnum };
		    	}
	        	var grid = nui.get(gridid);
	        	grid.addRow(newRow, 0);
        	}else{
        		nui.alert("请先填写合同编号后在进行该操作!");
        		return;
        	}
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
	
	<%--审核界面相关js 开始--%>
	//事业部领导拼接
  	var empllist = [];
	
	<%--审核界面相关js 结束--%>
	
	var stat = <%=request.getParameter("stat") %>;//流程还是非流程中
	var processInstID = <%=request.getParameter("processInstID") %>;
	if(stat !="1"){
		<% 
		long workItemID=0;
		if((Long)request.getAttribute("workItemID")!=null){
			workItemID = (Long)request.getAttribute("workItemID");
		}
		%>
		var workItemID = <%=workItemID %>;
	}
	var doaction;
	var csReveForecasts;
	var ameCsContTypes;
	var csContLicenses;

	init();
    function init() {
    	form.mask("数据加载中...");
    	doaction = "new";
    	var data =null;
    	if(stat == "1" ){
    		data={processInstID:processInstID};
    		$("#tips").hide();
    		$("#opioionform").hide();
    		nui.get("appButton").setText("保存");
			document.getElementById("saveButton").style.display = "none";
    	}else{
	    	 //流程提示信息
			promptInit({workItemID:workItemID});
			data={workItemID:workItemID}; 
			document.getElementById("saveButton").style.display = "";
    	}
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
                if(stat == "1" ){
					nui.get("stat").setValue(stat);
                }
                csReveForecasts=o.cscontract.csReveForecasts;
                ameCsContTypes=o.cscontract.ameCsContTypes;
                csContLicenses = o.cscontract.csContLicenses;
                sales_grid.setData(o.cscontract.cscontractsales);
                csGatherFc_grid.setData(o.cscontract.csGatherFcs);
                csReveForecast_grid.setData(csReveForecasts);
                csContBack_grid.setData(o.cscontract.ameCsContBacks);
                csContDep_grid.setData(o.cscontract.ameCsContDeps);
                csContType_grid.setData(ameCsContTypes);
                csContLicense_grid.setData(csContLicenses);
                //产品分成
				product_reve_grid.sortBy("reveid","asc");
				product_reve_grid.load({contractid: o.cscontract.contractid});
                editor1.html(o.cscontract.paycondition);
               	custname=o.cscontract.misCustinfo.custname;
                nui.get("issendmail").setValue("0");
               	nui.get("contreg").setValue(new Date());
				changeOcDate();
				//加载附件设置参数
        		nui.get("grid_3").load({"groupid":"AME_CS_CONTRACT","relationid": o.cscontract.contractid},function(e){
					 var files=[];
					 var data1 = e.data;
					 nui.get("grid_3").selects(data1);//默认全部选中
					 //加载合同保函附件
	        		nui.get("grid_1").load({"groupid":"AME_CS_CONT_BACK","relationid": o.cscontract.contractid},function(){
	        			//加载接通保证金附件
        				nui.get("grid_2").load({"groupid":"AME_CS_CONT_DEP","relationid": o.cscontract.contractid});
	        		});
				});
        		
        		if(o.cscontract == null || o.cscontract.saleshapid==null){
        		
				}else{
					 nui.get("saleshapid").setText(o.cscontract.csSaleshap.telcontent);
               		 nui.get("saleshapid").setValue(o.cscontract.saleshapid);
				}
				
				if(o.cscontract == null || o.cscontract.projectno == null ){
					
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
				
        		if(o.cscontract.misCustinfo){
                	nui.get("custid").setText(o.cscontract.misCustinfo.custname);
                	nui.get("custname").setValue(o.cscontract.misCustinfo.custname);
                }
                nui.get("userid").setText(o.cscontract.username);
				var contracttype = o.cscontract.contracttype;
            	//编辑的时候隐藏合同收款的最初预计确认年月
            	csGatherFc_grid.hideColumn(csGatherFc_grid.getColumn(5));
            	var tempType = "";
            	if(contracttype == "01" || contracttype == "04" || contracttype == "20"){//产品合同、混合合同
					tempType = "L";
					//document.getElementById("temp1").style.display = "";
					//document.getElementById("temp4").style.display = "";
					//document.getElementById("temp2").style.display = "none";
					//document.getElementById("temp3").style.display = "none";
					document.getElementById("starttime1").style.display = "none";
			        document.getElementById("starttime2").style.display = "none";
			        document.getElementById("endtime1").style.display = "none";
			        document.getElementById("endtime2").style.display = "none";
				}else if(contracttype == "08" || contracttype == "10"){//服务合同
					tempType = "S";
					//document.getElementById("temp1").style.display = "";
					//document.getElementById("temp4").style.display = "";
					//document.getElementById("temp2").style.display = "none";
					//document.getElementById("temp3").style.display = "none";
					document.getElementById("starttime1").style.display = "none";
			        document.getElementById("starttime2").style.display = "none";
			        document.getElementById("endtime1").style.display = "none";
			        document.getElementById("endtime2").style.display = "none";
				}else{//框架协议
					tempType = "F";
					//document.getElementById("temp1").style.display = "none";
					//document.getElementById("temp4").style.display = "none";
					//document.getElementById("temp2").style.display = "";
					//document.getElementById("temp3").style.display = "";
						document.getElementById("starttime1").style.display = "";
			        document.getElementById("starttime2").style.display = "";
			        document.getElementById("endtime1").style.display = "";
			        document.getElementById("endtime2").style.display = "";
				}
				setContNum(tempType,contracttype);//获取并设置合同编号
				if(stat !="1"){
    				$("#opioionform").show();
					//设置审核意见基本信息
					nui.get("processinstid").setValue(o.workitem.processInstID);
	               	nui.get("processinstname").setValue(o.workitem.processInstName);
	               	nui.get("activitydefid").setValue(o.workitem.activityDefID);
	               	nui.get("workitemname").setValue(o.workitem.workItemName);
					nui.get("workitemid").setValue(o.workitem.workItemID);
	               	nui.get("isshow").setValue("1");
	            	//查询审核意见
					var grid = nui.get("datagrid1");
					if(o.workitem.processInstID!=null && o.workitem.processInstID!=""){
						grid.load({processInstID:o.workitem.processInstID});
						grid.sortBy("time", "desc");
					}
				}
				changePtcondition();
			},
			error:function(){}
		});
	}
	//获取合同编号
	function setContNum(tempType,contracttype){
		var myDate = new Date();
		tempType = myDate.getFullYear() + "-" + tempType;
		nui.ajax({
            url: "com.primeton.mis.contract.contract.getContractNum.biz.ext",
			type: 'POST',
			data: {firstPart: tempType},
			async: false,	
			contentType: 'text/json',
            success: function (o) {
                nui.get("contnum").setValue(o.contractNum);
                nui.get("contnum_old").setValue(o.contractNum);
                //2018-11-28针对框架协议、OEM合同，生成的合同订单编号=合同编号+“-01”。其他类型的合同的订单编号=合同编号。
                if(contracttype == "04" || contracttype == "30"){
	                contorderno = o.contractNum+"-01";
                }else{
                	contorderno = o.contractNum;
                }
                
                for(var ii=0;ii<csReveForecasts.length;ii++){
                	var row = csReveForecast_grid.getRow(ii);
                	var rowData = {contorderno:contorderno};
					csReveForecast_grid.updateRow(row,rowData);
                }
                for(var j=0;j<ameCsContTypes.length;j++){
                	var row = csContType_grid.getRow(j);
                	//console.log(row);
                	var rowData = {contnum:o.contractNum,contorderno:contorderno};
					csContType_grid.updateRow(row,rowData);
                }
                
                for(var k=0;k<csContLicenses.length;k++){
                	var row = csContLicense_grid.getRow(k);
                	var rowData = {contnum:o.contractNum};
					csContLicense_grid.updateRow(row,rowData);
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
		var servjsmon1 = 0;//技术服务总额(订单)
		var prodwbmon1 = 0;//产品维保金额(订单)
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
			if(servjsmon){
				if(!isNaN(servjsmon)){
					servjsmon1 += parseFloat(servjsmon);
				}
			}
			if(prodwbmon){
				if(!isNaN(prodwbmon)){
					prodwbmon1 += parseFloat(prodwbmon);
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
		nui.get("prodwbmon1").setValue(prodwbmon1);
		nui.get("servjsmon1").setValue(servjsmon1);
		nui.get("prodmon").setValue(sumprodmon);
		nui.get("servmon").setValue(sumservmon);
		nui.get("contsum").setValue(sumcontsum);
		nui.get("servsubmon").setValue(sumservsubmon);
		nui.get("othmon").setValue(sumothmon);
		nui.get("contpolmon").setValue(sumcontpolmon);
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
		var prodnum =0;
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
		if(row.prodnum != null && !isNaN(row.prodnum)){
			prodnum = row.prodnum;
			if(isDot(prodnum)==true){
				alert("请输入整数！");
				var rowData = {prodnum: 0};
				product_grid.updateRow(row,rowData);
				return;
			}
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
	
	function isDot(num) {
	    var result = (num.toString()).indexOf(".");
	    if(result != -1) {
	       return true;
	    } else {
	       return false;
	    }
	}
    //根据合同类型获取合同存档编号
    nui.get('contracttype').on('valuechanged',function(e){
		var contracttype = nui.get('contracttype').getValue();
		var tempType = "";
		if(contracttype == "01" || contracttype == "04" || contracttype == "20"){//产品合同、混合合同
			tempType = "L";
			//document.getElementById("temp1").style.display = "";
			//document.getElementById("temp4").style.display = "";
			//document.getElementById("temp2").style.display = "none";
			//document.getElementById("temp3").style.display = "none";
			document.getElementById("starttime1").style.display = "none";
			document.getElementById("starttime2").style.display = "none";
			document.getElementById("endtime1").style.display = "none";
			document.getElementById("endtime2").style.display = "none";
		}else if(contracttype == "08" || contracttype == "10"){//服务合同
			tempType = "S";
			//document.getElementById("temp1").style.display = "";
			//document.getElementById("temp4").style.display = "";
			//document.getElementById("temp2").style.display = "none";
			//document.getElementById("temp3").style.display = "none";
			document.getElementById("starttime1").style.display = "none";
			document.getElementById("starttime2").style.display = "none";
			document.getElementById("endtime1").style.display = "none";
			document.getElementById("endtime2").style.display = "none";
		}else{//框架协议
			tempType = "F";
			//document.getElementById("temp1").style.display = "none";
			//document.getElementById("temp4").style.display = "none";
			//document.getElementById("temp2").style.display = "";
			//document.getElementById("temp3").style.display = "";
			document.getElementById("starttime1").style.display = "";
			document.getElementById("starttime2").style.display = "";
			document.getElementById("endtime1").style.display = "";
			document.getElementById("endtime2").style.display = "";
		}
		setContNum(tempType,contracttype);//获取并设置合同编号
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
    function onOk(type) {
    	var msg=null;
    	nui.get("saveStatus").setValue(type);
    	if(type == "1"){
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
		        	if(!csReveForecastRows[i].contorderno){
		        		nui.alert("订单编号不能为空!");
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
					        getContNum();
		        		}else{
		        			nui.get("appButton").enable();
							nui.get("saveButton").enable();
		        		}
		        	});
		        }else{
					getContNum();
		        }
		    }
	    }else{
	    	nui.confirm("确认执行暂不签署操作吗？", "确定？",
	        function (action) {            
	            if (action == "ok") {
	            	nui.get("saveButton").setEnabled(false);
	            	nui.get("appButton").setEnabled(false);
			    	nui.get("contnum").setValue("");
			    	nui.get("contnum").setRequired(false);
			    	nui.get("contreg").setRequired(false);
			    	nui.get("signdate").setRequired(false);
			    	nui.get("company").setRequired(false);
			    	for(var j=0;j<ameCsContTypes.length;j++){
	                	var row = csContType_grid.getRow(j);
	                	var rowData = {contnum:"",contorderno:""};
						csContType_grid.updateRow(row,rowData);
                	}
	                for(var k=0;k<csContLicenses.length;k++){
	                	var row = csContLicense_grid.getRow(k);
	                	var rowData = {contnum:""};
						csContLicense_grid.updateRow(row,rowData);
	                }
					document.getElementById("fileCatalog1").value="AME_CS_CONT_BACK";
					form4.submit();
				}else{
					return;
				}
			}); 
	    }
    }
    
    function getContNum(){
		var contnum_old = nui.get("contnum_old").getValue();
    	var contnum = nui.get("contnum").getValue();
    	if(contnum_old != contnum){
    		if(!confirm("合同存档编号被修改了，是否保存？")){
    			return;
    		}        		
        	var json = nui.encode({contnum: contnum});
            nui.ajax({
                url: "com.primeton.mis.contract.contract.checkContractNum.biz.ext",
				type: 'POST',
				data: json,	
				contentType: 'text/json',
                success: function (o) {
                	if(o.result != 0){
                		nui.alert("这个合同编号已经被使用了！");
                		return;
                	}else{
                		sureOK();
                	}
                }
            });
    	}else{
    		sureOK();
    	}
    }
    
    function changeContnum(e){
	    var contracttype = nui.get("contracttype").getValue();
	    if(contracttype == "04" || contracttype == "30"){
    		contorderno=e.value+"-01";
	    }else{
	    	contorderno=e.value;
	    };
		var contnum=e.value;
        var csReveForecastss=csReveForecast_grid.getData();
        var ameCsContTypess=csContType_grid.getData();
        var csContLicensess=csContLicense_grid.getData();
        
        for(var ii=0;ii<csReveForecastss.length;ii++){
        	var row = csReveForecast_grid.getRow(ii);
        	var rowData = {contorderno:contorderno};
			csReveForecast_grid.updateRow(row,rowData);
        }
        for(var j=0;j<ameCsContTypess.length;j++){
        	var row = csContType_grid.getRow(j);
        	var rowData = {contnum:contnum,contorderno:contorderno};
			csContType_grid.updateRow(row,rowData);
        }
        for(var k=0;k<csContLicensess.length;k++){
        	var row = csContLicense_grid.getRow(k);
        	var rowData = {contnum:contnum};
			csContLicense_grid.updateRow(row,rowData);
        }
    }
    function sureOK(){
    	 var newcontnum=nui.get("contnum").getValue();
    	 var json = nui.encode({contnum: newcontnum});
         nui.ajax({
            url: "com.primeton.mis.contract.contract.checkContractNum.biz.ext",
			type: 'POST',
			data: json,	
			contentType: 'text/json',
            success: function (o) {
            	if(o.result != 0){
            		nui.alert("这个合同编号已经被使用了！");
            		return;
            	}else{
					 nui.confirm("确认提交吗？", "确定？",
				        function (action) {            
				            if (action == "ok") {
				            	nui.get("appButton").setEnabled(false);
								nui.get("saveButton").setEnabled(false);
								document.getElementById("fileCatalog1").value="AME_CS_CONT_BACK";
								form4.submit();
							}else{
								return;
							}
						}); 
					}
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
    	//附件ID赋值
    	o.cscontract.fileids = nui.get("fileids").getValue();
    	//选择所要存到合同表的附件
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
			o.cscontract.checkFileids = attaches;
		}
    	//合同保函
		o.cscontract.csContBacks = nui.clone(csContBack_grid.getData());
		//合同保证金
		o.cscontract.csContDeps = nui.clone(csContDep_grid.getData());
        //收入预测记录
        o.cscontract.csReveForecasts = nui.clone(csReveForecast_grid.getData());
		//合同业务分类
		o.cscontract.csContTypes = csContType_grid.getChanges();
		
		//合同产品授权
        o.cscontract.csContLicenses = csContLicense_grid.getChanges();
        
		o.cscontract.csContTypeDatas = nui.clone(csContType_grid.getData());
		
        var isHaveService='2';//默认不包含定制和服务
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
        	if(o.cscontract.csReveForecasts[i].revetype.indexOf('1')>=0 || o.cscontract.csReveForecasts[i].revetype.indexOf('5')>=0){
        		isHaveService='1';
        	}
        }
        o.cscontract.isHaveService=isHaveService;
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
		//计算合同销售产品维保数据、技术服务
		var datas=sales_grid.getData();
		var servjsmon1 = 0;//技术服务总额(订单)
		var prodwbmon1 = 0;//产品维保金额(订单)
		for(var i=0;i<datas.length;i++){
			//技术服务金额
			var servjsmon = datas[i].servjsmon;
			//产品维保
			var prodwbmon = datas[i].prodwbmon;
			if(servjsmon){
				if(!isNaN(servjsmon)){
					servjsmon1 += parseFloat(servjsmon);
				}
			}
			if(prodwbmon){
				if(!isNaN(prodwbmon)){
					prodwbmon1 += parseFloat(prodwbmon);
				}
			}
		}
		nui.get("servjsmon1").setValue(servjsmon1);
		nui.get("prodwbmon1").setValue(prodwbmon1);
		
		//合同订单处理
		o.cscontract.csContOrders = [{contorderid: nui.get("contorderid").getValue(),
    		orderdate: nui.get("signdate").getValue(),
    		orderreg: nui.get("contreg").getValue(),
			ordermon: nui.get("contsum").getValue(),
			prodwbmon: nui.get("prodwbmon1").getValue(),
			servjsmon: nui.get("servjsmon1").getValue(),
			orderprodmon: nui.get("prodmon").getValue(),
			orderservmon: nui.get("servmon").getValue(),
			othmon: nui.get("othmon").getValue(),
			servsubmon: nui.get("servsubmon").getValue(),
			contorderno:contorderno}];
		//合同订单处理	
        if(row){
        	var datas=product_grid.getData();
        	row.saleProds=datas;
        }
        o.cscontract.sales = nui.clone(sales_grid.getData());
		
        var json = nui.encode({"cscontract":o.cscontract,"csGatherFcs":o.csGatherFcs,"misOpinion": data_opioion.misOpinion});
	    submit(json);
    }
    function submit(json){
    	form.loading("提交中，请稍候...");
        nui.ajax({
            url: "com.primeton.mis.contract.contractApproval.saveContractAppr.biz.ext",
            data: json,
            type: 'POST',
            cache: false,
            contentType: 'text/json',
            success: function (text) {
        		var returnJson = nui.decode(text);
        		var msg = null;
        		if(stat == "1"){
          			msg ="保存";
          		}else{
          			msg ="流程提交";
          		}
              	if(returnJson.result == "success"){
              		form.unmask();
					nui.alert(msg+"成功！","提示",function(e){
       					CloseWindow("ok");
					});
              	}else{
               		form.unmask();
					nui.get("appButton").enable();
					nui.get("saveButton").enable();
                   	nui.alert(msg+"失败！请联系信息技术部！");
              	}
            },
            error: function (jqXHR, textStatus, errorThrown) {
                alert(jqXHR.responseText);
                CloseWindow();
            }
        });
    }

  	
  	function changeOcDate(){
  		var contreg = nui.get("contreg").getValue();
  		var year = contreg.substring(0,4);
  		var month = contreg.substring(5,7);
  		var ocstartdate = year + "-" + month + "-01";
  		nui.get("ocstartdate").setValue(ocstartdate);
  	}
  	
	function drawCsReveForecastSum(e){
		if (e.field == "fcsum" || e.field == "contsum" || e.field == "tax"|| e.field == "contsum2"|| e.field == "pratiomon" 
            || e.field == "backdepmon" || e.field == "returnmon" 
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
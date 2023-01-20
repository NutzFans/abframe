<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <title>合同维护</title>
    <script src="<%= request.getContextPath() %>/common/nui/nui.js" type="text/javascript"></script>
	<%-- <script type="text/javascript" src="<%=request.getContextPath() %>/common/components/swffileupload/swfupload/swffileupload.js"></script> --%>
	<link rel="stylesheet" href="<%=request.getContextPath()%>/common/nui/resource/kindeditor/themes/default/default.css" />
	<script charset="utf-8" src="<%=request.getContextPath()%>/common/nui/resource/kindeditor/kindeditor-all-min.js"></script>
	<script charset="utf-8" src="<%=request.getContextPath()%>/common/nui/resource/kindeditor/lang/zh-CN.js"></script>
	<script charset="utf-8" src="<%=request.getContextPath() %>/common/nui/resource/kindeditor/plugins/code/prettify.js"></script>
    <style type="text/css">
    	html, body{font-size:12px;padding:0;margin:0;border:0;height:100%;overflow:hidden;width:100%;}
    </style>
</head>
<body>
<div class="nui-fit">
	<!-- 
		针对OEM合同、框架合同，需要新增订单
		1、增加合同时允许选择对应的项目（选择后项目外部状态变更为：项目实施阶段
		2、合同收入预测提供表格（子表）方式增加
		3、合同订单处理提供表格(子表）方式增加
	 -->
    <div id="form1" method="post" >
        <%--<input name="cscontract.contractid" id="conId" class="nui-hidden" />--%>
         <input name="cscontract.fileids" id="fileids" class="nui-hidden"/>
        <input name="cscontract.fileids1" id="fileids1" class="nui-hidden" />
        <input name="cscontract.fileids2" id="fileids2" class="nui-hidden" />
        <input id="contnum_old" class="nui-hidden" />
        <input class="nui-hidden" name="cscontract.salename" id="salename"/>
        <input class="nui-hidden" name="cscontract.org" id="org"/>
        <input class="nui-hidden" id="t_rownum" value="1"/>
        <input class="nui-hidden" name="cscontract.projectNo" id="projectno" />
        <input class="nui-hidden" name="cscontract.contorderid" id="contorderid" />
        <input class="nui-hidden" name="cscontract.ocstartdate" id="ocstartdate" />
        <input class="nui-hidden" id="servjsmon1" name="servjsmon1"/>
        <input class="nui-hidden" id="prodwbmon1" name="prodwbmon1"/>
        <fieldset style="border:solid 1px #aaa;padding:3px;width: 100%">
            <legend>合同基本信息</legend>
            <div style="padding:5px;">
            <table style="table-layout:fixed;" id="table_file">
                <tr>
                    <td style="width:350px;" align="right">合同类型：</td>
                    <td style="width:150px;">    
                        <input class="nui-dictcombobox" name="cscontract.contracttype" onvaluechanged="getContractNum()" id="contracttype" dictTypeId="MIS_CONTRACTTYPE" required="true"/>
                    </td>
                    <td style="width:100px;" align="right">合同存档编号：</td>
                    <td style="width:150px;">    
                        <input name="cscontract.contnum" id="contnum" class="nui-textbox" required="true"/>
                    </td>
	                <td style="width:120px;" align="right">登记日期：</td>
	                <td style="width:150px;">
	                    <input name="cscontract.contreg" id="contreg" class="nui-datepicker" required="true" allowInput="false" onValuechanged="changeOcDate"/>
	                </td>
	                <td style="width:120px;" align="right">合同签署日期：</td>
	                <td style="width:150px;">    
	                    <input name="cscontract.signdate" id="signdate" class="nui-datepicker" required="true" emptyText="请选择日期"/>
	                </td>
                </tr>
                <tr>
                    <td align="right">合同名称(项目)：</td>
                    <td style="width:420px;" colspan="3">    
                        <input name="cscontract.projectname" style="width:392px" class="nui-textbox"/>
                    </td>
                    <td align="right">签署单位：</td>
                    <td  colspan="3">    
                        <input class="nui-buttonedit" style="width: 394px;" name="cscontract.misCustinfo.custid" id="custid" value="" text="" onbuttonclick="onButtonEdit" showClose="true" oncloseclick="onCloseClick" required="true" allowInput="false"/>
                    </td>
                </tr>
                <tr>
                    <td style="width:120px;" align="right">合同号：</td>
                    <td style="width:150px;">    
                        <input name="cscontract.contid" class="nui-textbox" required="true"/>
                    </td>
                    <td style="width:120px;" align="right">客户类型：</td>
                    <td style="width:150px;">    
                        <input name="cscontract.signtarget" class="mini-dictcombobox" onvaluechanged="changesigntarget(e)" dictTypeId="CS_SIGNTARGET" multiSelect="true"/>
                    </td>
                	<td style="width:120px;" align="right">最终用户：</td>
                    <td  colspan="3">    
                        <input class="nui-buttonedit"  style="width: 394px;" name="cscontract.userid" id="userid" value="" text="" onbuttonclick="onButtonEdit" showClose="true" oncloseclick="onCloseClick" required="true" allowInput="false"/>
                    </td>
                </tr>
                <tr>
                    <td style="width:120px;" align="right">所属集团客户：</td>
                    <td colspan="3">    
                        <input  class="nui-textbox"  style="width: 392px;" readonly="readonly" id="groupno"/>
                    </td>
                     <td style="width:120px;" align="right">结转类型：</td>
                    <td style="width:150px;">    
                        <input  class="mini-dictcombobox"  value='1' name="cscontract.carrytype"   id="carrytype" dictTypeId="CONTRACT_CARRY_TYPE"/>
                    </td>
                    <td style="width:120px;" align="right">是否批量预估收入：</td>
                    <td style="width:150px;">    
                        <input  class="mini-dictcombobox" name="cscontract.isfinreve"  value='0'  id="isfinreve" dictTypeId="MIS_YN"/>
                    </td>
                </tr>
                <tr>
                    <td align="right">服务数量类型：</td>
                    <td style="width:150px;">    
                        <input class="mini-dictcombobox" name="cscontract.servnumtype" dictTypeId="SERV_NUM_TYPE"/>
                    </td>
                    <td align="right">服务数量：</td>
                    <td style="width:150px;">    
                        <input class="nui-textbox" name="cscontract.servnum" vtype="float"/>
                    </td>
                    <td align="right">服务单价：</td>
                    <td style="width:150px;">    
                        <input class="nui-textbox" name="cscontract.servprice" vtype="float"/>
                    </td>
                     <td style="width:120px;" align="right">是否有排他合作：</td>
                    <td style="width:150px;">   
                        <input class="mini-dictcombobox" name="cscontract.ispt" id="ispt" dictTypeId="MIS_YN" onvaluechanged="changePtcondition" />
                    </td>
                    
                </tr>
                <tr class="temp2">
                    <td align="right">协议有效期开始：</td>
                    <td style="width:150px;">    
                        <input name="cscontract.xystart" class="nui-datepicker" emptyText="请选择日期"/>
                    </td>
                    <td align="right">协议有效期结束：</td>
                    <td style="width:150px;">    
                        <input name="cscontract.xyend" class="nui-datepicker" emptyText="请选择日期"/>
                    </td>
                    <td class="temp1" style="width:120px;" align="right">行业：</td>
                    <td class="temp1" style="width:150px;">    
                        <input class="mini-dictcombobox" name="cscontract.industry" dictTypeId="MIS_INDUSTRY_SUBDIVISION" multiSelect="true"/>
                    </td>
                    <td></td>                   
                </tr>
                <tr class="temp2 tempelse" style="display: none">
                    <td align="right">排他合作的条件：</td>
                    <td colspan="7">    
                        <input name="cscontract.ptcondition" id="ptcondition" class="nui-textarea" width="98%"/>
                    </td>
                </tr>
                <tr>                	
                    <td align="right">赠送服务数量类型：</td>
                    <td style="width:150px;">    
                        <input class="mini-dictcombobox" name="cscontract.zsservtype" dictTypeId="SERV_NUM_TYPE"/>
                    </td>
                    <td align="right">赠送服务数量：</td>
                    <td style="width:150px;">    
                        <input class="nui-textbox" name="cscontract.zsservnum" vtype="float"/>
                    </td>
                    <td style="width:120px;" align="right">服务开始日期：</td>
                    <td style="width:150px;">    
                        <input name="cscontract.servstart" class="nui-datepicker" emptyText="请选择日期"/>
                    </td>
                    <td style="width:120px;" align="right">服务结束日期：</td>
                    <td style="width:150px;">    
                        <input name="cscontract.servend" class="nui-datepicker" emptyText="请选择日期"/>
                    </td>
                </tr>
                <tr>
                    <td align="right">合同执行总金额：</td>
                    <td style="width:150px;">    
                        <input name="cscontract.contsum" id="contsum" class="nui-textbox" allowInput="false"/>
                    </td>
                    <td align="right">产品执行金额：</td>
                    <td style="width:150px;">    
                        <input name="cscontract.prodmon" id="prodmon" class="nui-textbox" allowInput="false"/>
                    </td>
                    <td align="right">服务执行金额：</td>
                    <td style="width:150px;">    
                        <input class="nui-textbox" name="cscontract.servmon"  id="servmon" allowInput="false"/>
                    </td>
                    <td></td>
                    <td></td>
                </tr>
                <tr>
                	<td align="right">采购1：</td>
                    <td style="width:150px;">    
                        <input name="cscontract.servsubmon" id="servsubmon" class="nui-textbox" allowInput="false"/>
                    </td>
                    <td align="right">采购2：</td>
                    <td style="width:150px;">    
                        <input class="nui-textbox" name="cscontract.othmon"  id="othmon" allowInput="false"/>
                    </td>
                    <td style="width:120px;" align="right">原合同总金额：</td>
                    <td style="width:150px;">    
                        <input name="cscontract.contsumAct" class="nui-textbox"/>
                    </td>
                    <td style="width:120px;" align="right">原产品金额：</td>
                    <td style="width:150px;">    
                        <input name="cscontract.prodmonAct" class="nui-textbox"/>
                    </td>
                </tr>
                <tr>
                	<td align="right">原服务金额：</td>
                    <td style="width:150px;">    
                        <input name="cscontract.servmonAct" class="nui-textbox"/>
                    </td>
                    <td align="right">合同净额：</td>
                    <td style="width:150px;">    
                        <input name="cscontract.contpolmon" id="contpolmon" class="nui-textbox" allowInput="false"/>
                    </td>
                    <td style="width:120px;" align="right">是否400转化合同：</td>
                    <td style="width:150px;">
                    	<input class="mini-dictcombobox" name="cscontract.istrans" id="istrans" dictTypeId="MIS_YN" />
                    </td>
                    <td style="width:120px;" align="right">项目：</td>
                    <td style="width:150px;"><input name="cscontract.projectcontnum" id="projectcontnum" onbuttonclick="selectProject" class="nui-buttonedit" allowInput="false"/></td>
                </tr>
                <tr>   
                    <td align="right">产品验收日期：</td>
                    <td style="width:150px;">    
                        <input name="cscontract.cpazrq" class="nui-datepicker" emptyText="请选择日期"/>
                    </td>
                    <td align="right">初验日期：</td>
                    <td style="width:150px;">    
                        <input name="cscontract.cyrq" class="nui-datepicker" emptyText="请选择日期"/>
                    </td>
                    <td style="width:120px;" align="right">终验日期：</td>
                    <td style="width:150px;">    
                        <input name="cscontract.zyrq" class="nui-datepicker" emptyText="请选择日期"/>
                    </td>
                    <td style="width:120px;" align="right">是否发送邮件：</td>
                    <td style="width:150px;">
                    	<input class="mini-dictcombobox" name="cscontract.issendmail" id="issendmail" dictTypeId="MIS_YN" value="0"/>
                    </td>
                </tr>
                <tr>
                    <td align="right">合同收入类型：</td>
                    <td style="width:150px;" >    
                        <input class="mini-dictcombobox" name="cscontract.incometype" id="incometype" multiSelect="true" dictTypeId="MIS_HTINCOMETYPE"/>
                    </td>
                    <td align="right">状态：</td>
                    <td style="width:150px;" >    
                        <input class="mini-dictcombobox" name="cscontract.status" id="status" dictTypeId="CS_CONTRACTTYPE" />
                    </td>
                    <td style="width:120px;" align="right">是否禁止分包外包：</td>
                    <td style="width:150px;" >    
                        <input class="mini-dictcombobox" name="cscontract.isforbid"  dictTypeId="MIS_YN" />
                    </td>
                    <td style="width:120px;" align="right">是否高风险：</td>
                    <td style="width:150px;" >    
                        <input class="mini-dictcombobox" name="cscontract.ishighrisk"  dictTypeId="MIS_YN" />
                    </td>
                </tr>
                <tr>
                	<td align="right">所属公司：</td>
                    <td style="width:150px;" >    
                        <input class="mini-dictcombobox" name="cscontract.company"  dictTypeId="company" required="true" />
                    </td>
                	<td align="right">销售线索：</td>
                	<td style="width:420px;" colspan="3">
                		<input class="nui-buttonedit" style="width: 400px" name="cscontract.saleshapid" 
                			id="saleshapid" value="" text="" onbuttonclick="onButtonEdit" showClose="true" 
                			oncloseclick="onCloseClick" required="false" allowInput="false"/>
                	</td>
                	<!-- <td colspan="2"></td> -->
                	<td style="width:120px;" align="right">是否允许对外宣传：</td>
                    <td style="width:150px;">
                    	<input class="mini-dictcombobox" name="cscontract.publicity" id="publicity" dictTypeId="MIS_YN" value="0"/>
                    </td> 
                </tr>
                <tr>
                	<td align="right">合同备注说明：</td>
                    <td style="width:960px;" colspan="7">    
                        <input name="cscontract.paycondition" id="paycondition" class="nui-hidden"/>
				   		<textarea id="ke" name="content1" style="width:930px;height:200px;visibility:hidden;"></textarea>
                    </td> 
                </tr>
                <tr>
                	<td></td>
			   		<td colspan="5">
			   		<span class="word_surplus"></span>
			   		</td>
			   	</tr>
               <!--  <tr>
                	<td style="width:140px;" align="right">已上传的文件：</td>
                	<td style="width:420px;" id="uploadedFile" colspan="3"></td>
                	<td style="width:110px;" align="right">合同文件上传：</td>
                	<td style="width:420px;" colspan="3">
                		<div id="upload_div"></div>
	       	  		</td>
                </tr> -->
            </table>
        </div>
        </fieldset>
         <fieldset  id="field6" style="border:solid 1px #aaa;padding:3px;width: 100%;">
        	<legend>合同附件</legend>
        	<jsp:include page="/ame_common/addFiles.jsp"/>
        </fieldset>
        <fieldset style="width:1360px;border:solid 1px #aaa;padding:3px;">
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
	        	<div id="sales_grid" class="nui-datagrid" style="width:1350px;height:auto;" allowResize="true" oncellendedit="doCal"
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
			            <div field="contpolmon" dataType="currency" width="auto" headerAlign="center" align="right" >合同净额
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
			                <div field="buyprod" width="auto" align="left" headerAlign="center">说明
			                	<input property="editor" class="nui-textarea" inputstyle="text-align: left;" style="width:100px;" minWidth="100" minHeight="50"/>
			                </div>
			            </div>
			        </div>    
			    </div>
            </div>
        </fieldset>
        
        
        <!-- 合同收款 -->
        <fieldset style="border:solid 1px #aaa;padding:3px;width: 1140px;">
            <legend>合同收款记录</legend>
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
            <div id="csGatherFc_grid" class="nui-datagrid" style="width:100%;height:auto;" dataField="csGatherFcs" ondrawcell="changeColor"
	            showPager="false" allowCellEdit="true" allowCellSelect="true" multiSelect="true" editNextOnEnterKey="true"
	            url="com.primeton.mis.contract.contract.getCsGatherFc.biz.ext" oncellendedit="doCsGatherFcEnd" oncellbeginedit="doCsGatherFcBegin" 
	            showSummaryRow="true" ondrawsummarycell="drawSum">			            
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
	                <div field="memo" width="auto" headerAlign="center" align="left">说明
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
        <fieldset style="border:solid 1px #aaa;padding:3px;width: 1140px;">
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
	            showSummaryRow="true" ondrawsummarycell="drawSum" allowCellWrap="true">			            
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
	     	<jsp:include page="/ame_common/addFiles1.jsp"/>
        </fieldset>
        <!--合同保证金  -->
        <fieldset style="border:solid 1px #aaa;padding:3px;width: 1140px;">
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
	            showSummaryRow="true" ondrawsummarycell="drawSum"  allowCellWrap="true">			            
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
	                <div field="predredate" width="80" headerAlign="center" renderer="onDealDate" dateFormat="yyyy-MM-dd" align="left">保证金预计退回日期
	                	<input property="editor" class="nui-datepicker" inputStyle="text-align: left"/>
	                </div>
	                <div field="practredate" width="80" headerAlign="center" renderer="onDealDate" dateFormat="yyyy-MM-dd" align="left">保证金实际退回日期
	                	<input property="editor" class="nui-datepicker" inputStyle="text-align: left"/>
	                </div>
	                <div field="remark" width="100" headerAlign="center" align="left">备注
	                	<input property="editor" class="nui-textarea" style="width: 200px" minWidth="200" minHeight="50" />
	                </div>
	            </div>
	        </div>
	     	<jsp:include page="/ame_common/addFiles2.jsp"/>
        </fieldset>
        
        <fieldset id="csContOrder_fieldset" style="border:solid 1px #aaa;padding:3px;width: 1173px;">
            <legend>合同订单处理</legend>
	    	<div style="width:140px;">
		        <div class="nui-toolbar" style="border-bottom:0;padding:0px;">
		            <table style="width:100%;">
		                <tr>
		                    <td style="width:100%;">
		                        <a class="nui-button" iconCls="icon-add" onclick="addRow('csContOrder_grid')" plain="true">增加</a>
		                        <a class="nui-button" iconCls="icon-remove" onclick="removeRow('csContOrder_grid')" plain="true">删除</a>
		                    </td>
		                </tr>
		            </table>           
		        </div>
		    </div>
            <div id="csContOrder_grid" class="nui-datagrid" style="width:100%;height:auto;" dataField="csContOrders"
	            showPager="false" allowCellEdit="true" allowCellSelect="true" multiSelect="true" editNextOnEnterKey="true"
	            url="com.primeton.mis.contract.contract.getCsContOrder.biz.ext" oncellendedit="doSumfee">			            
	            <div property="columns">
	            	<div type="checkcolumn"></div>
	                <!-- 订单编号 -->
	                <div field="contorderno" width="100" headerAlign="center" align="center">订单编号
	                	<input property="editor" class="nui-textbox" />
	                </div>
	                <div field="orderreg" width="100" headerAlign="center" renderer="onDealDate" dateFormate="yyyy-MM-dd" align="left">订单登记日期
	                	<input property="editor" class="nui-datepicker"/>
	                </div>
	                <div field="orderdate" width="100" headerAlign="center" renderer="onDealDate" dateFormate="yyyy-MM-dd" align="left">订单签订日期
	                	<input property="editor" class="nui-datepicker"/>
	                </div>
	                <div field="ordermon" dataType="currency" width="150" headerAlign="center" align="right">合同订单金额
	                	<input property="editor" class="nui-textbox" vtype="float" inputStyle="text-align: right;" readOnly="readOnly"/>
	                </div>
	                <div field="orderprodmon" dataType="currency" width="120" headerAlign="center" align="right">订单产品金额
	                	<input property="editor" class="nui-textbox" vtype="float" inputStyle="text-align: right;"/>
	                </div>
	                <div field="prodwbmon" dataType="currency" width="120" headerAlign="center" align="right">产品维保金额
	                	<input property="editor" class="nui-textbox" vtype="float" inputStyle="text-align: right;"/>
	                </div>
	                <div field="servjsmon" dataType="currency" width="120" headerAlign="center" align="right">技术服务金额
	                	<input property="editor" class="nui-textbox" vtype="float" inputStyle="text-align: right;"/>
	                </div>
	                <div field="orderservmon" dataType="currency" width="120" headerAlign="center" align="right">订单服务金额
	                	<input property="editor" class="nui-textbox" vtype="float" inputStyle="text-align: right;" readOnly="readOnly"/>
	                </div>
	                <!-- 分包金额 -->
	                <div field="servsubmon" dataType="currency" width="120" headerAlign="center" align="right">订单采购1
	                	<input property="editor" class="nui-textbox" vtype="float" inputStyle="text-align: right;"/>
	                </div>
	                <!-- 分成金额 -->
	                <div field="othmon" dataType="currency" width="120" headerAlign="center" align="right">订单采购2
	                	<input property="editor" class="nui-textbox" vtype="float" inputStyle="text-align: right;"/>
	                </div>
	                <div field="memo" width="auto" headerAlign="center" align="left">备注说明
	                	<input property="editor" class="nui-textarea" style="width: 200px" minWidth="200" minHeight="50" />
	                </div>
	            </div>
	        </div>
        </fieldset>
        
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
	            showPager="false" allowCellEdit="true" oncellmousedown="checkCellEdit" allowCellSelect="true" multiSelect="true" editNextOnEnterKey="true"
	            oncellendedit="doContsum"  showSummaryRow="true" ondrawsummarycell="drawSum">			            
	            <div property="columns">
	            	<div type="checkcolumn"></div>
	                <div field="contnum" width="100" headerAlign="center" align="left">合同编号</div>
	                <div field="contorderno" width="100" headerAlign="center" align="left">合同订单编号
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
        
        <fieldset style="border:solid 1px #aaa;padding:3px;width: 1500px;">
            <legend>合同收入确认预估</legend>
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
            <div id="csReveForecast_grid" class="nui-datagrid" style="width:100%;height:auto;" dataField="csReveForecasts" ondrawcell="changeColor"
	            showPager="false" allowCellEdit="true" allowCellSelect="true" multiSelect="true" editNextOnEnterKey="true"
	            url="com.primeton.mis.contract.contract.getCsReveForecast.biz.ext"
	            oncellendedit="doCsReveForecastEnd" oncellbeginedit="doCsReveForecastBegin" onshowrowdetail="onShowRowDetail1"
	            showSummaryRow="true" ondrawsummarycell="drawSum">			            
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
	                <div field="newyearmonth" width="90" headerAlign="center" dateFormat="yyyy-MM" align="left">最新预计确认年月
	                	<input property="editor" class="nui-monthpicker" inputStyle="text-align: left" format="yyyy-MM"/>
	                </div>
	                <!-- 最新预计确认旬度 -->
	                <div field="newmonthperiod" width="90" renderer="onGenderMonthperiod" headerAlign="center" align="left">最新预计确认旬度
	                	<input property="editor" class="nui-dictcombobox" dictTypeId="AME_MONTHPERIOD"/>
	                </div>
	                <div field="productsum" width="80" dataType="currency" headerAlign="center" align="right" summaryType="sum">预计产品额
	                	<input property="editor" class="nui-textbox" vtype="float" inputStyle="text-align: right" />
	                </div>
	                <div field="servicesum" width="80" dataType="currency" headerAlign="center" align="right" summaryType="sum">预计服务额
	                	<input property="editor" class="nui-textbox" vtype="float" inputStyle="text-align: right"/>
	                </div>
	                <div field="masum" width="80" dataType="currency" headerAlign="center" align="right" summaryType="sum">预计MA额
	                	<input property="editor" class="nui-textbox" vtype="float" inputStyle="text-align: right"/>
	                </div>
	                <div field="fcsum" width="100" dataType="currency" headerAlign="center" align="right" summaryType="sum">预计确认金额
	                	<!-- <input property="editor" class="nui-textbox" vtype="float" inputStyle="text-align: right"/> -->
	                </div>
	                <div field="fcreverate" width="80" headerAlign="center" align="right" numberFormat="p1">预计确认比例
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
        </fieldset>
        
        <fieldset style="border:solid 1px #aaa;padding:3px;width: 1500px;">
            <legend>产品参与分成记录</legend>
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
            <div id="product_reve_grid" class="nui-datagrid" style="width:70%;height:auto;" oncellendedit="changeProdReve" showSummaryRow="true" ondrawsummarycell="drawSum"
	            url="com.primeton.mis.contract.productReve.queryProductReve.biz.ext" showPager="false" allowCellEdit="true" allowCellSelect="true" multiSelect="true" editNextOnEnterKey="true">			            
	            <div property="columns">
	            	<div type="checkcolumn"></div>
	                <div field="contnum" width="100" headerAlign="center" >合同编号</div>
	                <div field="reveid" width="100" headerAlign="center" >收入次数</div>
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
        </fieldset>
        
        <fieldset style="border:solid 1px #aaa;padding:3px;">
            <legend>合同验收情况</legend>
            <div style="padding:5px;">
	        <table>
	            <tr>
                    <td style="width:120px;" align="right">发货日期：</td>
                    <td style="width:150px;">    
                        <input name="cscontract.goodsenddate" class="nui-datepicker" emptyText="请选择日期" style="width:100px;"/>
                    </td>
                    <td style="width:120px;" align="right">项目计划初验日期：</td>
                    <td style="width:150px;">    
                        <input name="cscontract.jhcyrq" class="nui-datepicker" emptyText="请选择日期" style="width:100px;"/>
                    </td>
                    <td style="width:120px;" align="right">项目计划终验日期：</td>
                    <td style="width:150px;">    
                        <input name="cscontract.jhzyrq" class="nui-datepicker" emptyText="请选择日期" style="width:100px;"/>
                    </td>
                </tr>
                <tr>
                    <td style="width:120px;" align="right">发货备注：</td>
                    <td style="width:800px;" colspan="5">
                        <input name="cscontract.othmonmemo" class="nui-textarea" style="width:382px;" />
                    </td>
                </tr>
        	</table>
            </div>
        </fieldset>
        
        <fieldset style="border:solid 1px #aaa;padding:3px;">
            <legend>合同服务信息</legend>
            <div style="padding:5px;">
        	<table>
	            <tr>
                    <td style="width:140px;" align="right">服务开通标示：</td>
                    <td style="width:130px;">    
                        <input class="mini-dictcombobox" name="cscontract.servopenflag" dictTypeId="CS_SERVOPENFLAG"/>
                    </td>
	                <td style="width:120px;" align="right">服务期限：</td>
	                <td style="width:130px;">    
	                    <input class="mini-dictcombobox" name="cscontract.servterm" dictTypeId="CS_SERVTERM"/>
	                </td>
                    <td style="width:140px;" align="right">服务模块：</td>
                    <td style="width:130px;">    
                        <input class="mini-dictcombobox" name="cscontract.servmodule" dictTypeId="CS_SERVMODULE"/>
                    </td>
	                <td style="width:120px;" align="right">服务开通情况：</td>
	                <td style="width:130px;">    
	                    <input class="mini-dictcombobox" name="cscontract.servstage" dictTypeId="CS_SERVSTAGE"/>
	                </td>
                </tr>
                <tr>
                    <td style="width:140px;" align="right">MA服务开始日期：</td>
                    <td style="width:130px;">    
                        <input name="cscontract.servstartdate" id="servstartdate" class="nui-datepicker" allowInput="false"/>
                    </td>
	                <td style="width:120px;" align="right">MA服务结束日期：</td>
	                <td style="width:130px;">    
	                    <input name="cscontract.servenddate" id="servenddate" class="nui-datepicker" allowInput="false"/>
	                </td>
                    <td style="width:140px;" align="right"></td>
                    <td style="width:130px;"></td>
	                <td style="width:120px;" align="right"></td>
	                <td style="width:130px;"></td>
	            </tr>
	            <tr>
                    <td style="width:140px;" align="right">售后服务相关内容：</td>
                    <td style="width:380px;" colspan="3">    
                        <input name="cscontract.remakr" class="nui-textarea" style="width:382px;" />
                    </td>
	                <td style="width:140px;" align="right">服务开通跟踪情况：</td>
	                <td style="width:380px;" colspan="3">    
	                    <input name="cscontract.servopentail" class="nui-textarea" style="width:382px;" />
	                </td>
                </tr>   
        	</table>
            </div>
        </fieldset>
        
    </div>
</div>

<div style="text-align:center;padding:10px;border-width:1px 0px 0px 0px;" class="nui-toolbar">               
    <a class="nui-button" id="okbutton" onclick="onOk" style="width:60px;margin-right:20px;">保存</a>       
    <a class="nui-button" onclick="onCancel" style="width:60px;">关闭</a>
</div>        
</body>
<script type="text/javascript">
    nui.parse();
    //var updateURL = "com.primeton.mis.contract.contract.updateContract.biz.ext";
	var saveURL = "com.primeton.mis.contract.contract.addContract.biz.ext";
    var form = new nui.Form("#form1");
   /*  var sf = new SWFFileUpload(
    	nui.decode({
			name:'cscontract.fileids',
			renderTo:'#upload_div',
			value:'',
			cancelBtnText:'取消上传',
			maxFileCount:3,
			minFileCount:0,
			width:'',
			height:'',
			hasCancel:false,
			hiddenType:'nui',
			autoUpload:false,
			uploadUrl:'com.primeton.mis.contract.contractFileUpload.flow'
		})
	); */
	
   /*  function startUpload(succ){
		sf.startUpload(function(){
			if(succ){
				succ();
			}
		},function(){
			nui.alert('文件上传失败！');
		});
	} */
    //销售人员对应的grid的增加、删除方法
    //销售人员对应的产品的grid的增加、删除方法
	var sales_grid = nui.get("sales_grid");
	var product_grid = nui.get("product_grid");
	var csReveForecast_grid = nui.get("csReveForecast_grid");//合同收入预测
	var csContOrder_grid = nui.get("csContOrder_grid");//合同订单处理
	var csGatherFc_grid = nui.get("csGatherFc_grid");//合同收款
	var product_reve_grid = nui.get("product_reve_grid");//产品分成
	var csContBack_grid = nui.get("csContBack_grid");//合同保函
	var csContDep_grid = nui.get("csContDep_grid");//合同保证金
	var csContType_grid = nui.get("csContType_grid");//合同业务分类
	
	var  productrate  = parseFloat(nui.getDictText('AME_SYSCONF','PRODUCTRATE'));//产品税率
	var  servicerate  = parseFloat(nui.getDictText('AME_SYSCONF','SERVICERATE'));//服务税率
	var  marate  = parseFloat(nui.getDictText('AME_SYSCONF','MARATE'));//MA税率
	
	//是否有排他合作
	function changePtcondition(){
		var ispt = nui.get("ispt").getValue();
		if(ispt=='1'){
			$(".tempelse").css({
				"display":""
			})
		}else{
			$(".tempelse").hide();
		}		
	}
	
	//收入产品类型
	function selectProdtype(e){
		var grid = nui.get("product_reve_grid");
		var row = grid.getSelected();
		var rowData;
		if(e.value=="1"){
			rowData = {"productrate":productrate};
		}else if(e.value=="2"){
			rowData = {"productrate":servicerate};
		}else if(e.value=="3"){
			rowData = {"productrate":marate};
		}
		product_reve_grid.updateRow(row,rowData);
	}
	
	//增加行
    function addRow(gridid) {
    	var grid = nui.get(gridid);
    	var contnum = nui.get("contnum").getValue();
    	var contracttype = nui.get("contracttype").getValue();     
    	var newRow;      
        if(gridid == "csReveForecast_grid"){//合同收入预估增加行 必须有合同标号才给增加行
        	if( contnum != null && contnum!=""){
		    	newRow = { name: "New Row",status: "0",contorderno: contnum };
        	}else{
        		nui.alert("请先填写合同编号后在进行该操作!");
        		return;
        	}
        }else if(gridid == "csContBack_grid"){//合同保函新增行：状态默认为履行中,类型为保函
        	newRow = { name: "New Row",type:"1",status: "0" };
        }else if(gridid == "csContDep_grid"){//合同保证金新增行：状态默认为履行中,类型为保证金
        	newRow = { name: "New Row",type:"2",status: "0" };
        }else if(gridid == "csGatherFc_grid"){//合同收款新增行：状态默认为未收款
        	newRow = { name: "New Row",status: "0" };
        }else if(gridid == "csContType_grid"){//合同业务分类新增行：必须有合同编号才可以增加行
        	if( contnum != null && contnum!=""){
        		if(contracttype == "04" || contracttype == "30"){
		    		newRow = { name: "New Row",contnum:contnum};
		    	}else{
		    		newRow = { name: "New Row",contnum:contnum,contorderno: contnum };
		    	}
        	}else{
        		nui.alert("请先填写合同编号后在进行该操作!");
        		return;
        	}
        }else if(gridid=='product_reve_grid'){
        	var saless = sales_grid.getData();//合同销售
			var datas=product_grid.getData();//销售产品
			var csReveForecasts = csReveForecast_grid.getData();//收入预估确认
	        var csReve = csReveForecast_grid.getSelecteds();//选中的收入记录
			if(csReveForecasts==null||csReveForecasts==""){
				nui.alert("请先填写收入确认预估，然后在添加产品分成记录！");
				return;
			}else{
				for(var u=0;u<csReveForecasts.length;u++){
					var reveno = csReveForecasts[u].reveno;
					if(reveno==null||reveno==""){
						nui.alert("收入确认预估信息填写不完整，请完善信息后再进行添加产品分成记录！");
						return;
					}
				}
			}
			if(csReve == null || csReve.length<=0){
				nui.alert("请先选中对应的收入记录,然后在添加产品分成记录！");
    			return;
			}
			/* 2019-06-05 郑理说技术服务合同会增加产品分成，取消判断产品的控制 
			if(saless==null||saless==""){
				nui.alert("请先填写销售产品信息,然后在添加产品分成记录！");
    			return;
			}else{
				for(var g=0;g<saless.length;g++){
					var products = saless[g].saleProds;
					if(products==null||products==""){
		    			nui.alert("请先填写销售产品信息,然后在添加产品分成记录！");
		    			return;
		    		}
				}
			} */
			var urL="com.primeton.mis.contract.contract.getPratio.biz.ext";//获取产品分成和税率
			nui.ajax({
	            url: urL,
	            type: 'POST',
	            cache: false,
	            async:false,
	            contentType: 'text/json',
	            success: function (text) {
	            	var pratio = text.parameters;
	            	for(var p=0;p<csReve.length;p++){
	            		var reveno = csReve[p].reveno;
	            		newRow = { name: "New Row","reveid":reveno,"contnum":contnum,"productrate":productrate,"pratio":pratio};
			        	grid.addRow(newRow, 0);
	            		/* for(var i = 0; i < saless.length; i++){
			        		var products = saless[i].saleProds;
			        		if(i==0){
			        			for(var l=0; l < datas.length; l++){
					        		newRow = { name: "New Row","reveid":reveno,"contnum":contnum,"productrate":productrate,"pratio":pratio};
			        				grid.addRow(newRow, 0);
			        			}
			        		}else{
			        			for(var k=0;k<products.length;k++){
					        		newRow = { name: "New Row","reveid":reveno,"contnum":contnum,"productrate":productrate,"pratio":pratio};
				        			grid.addRow(newRow, 0);
				        		}
			        		}
			        	} */
	            	}
	            },
	            error: function (jqXHR, textStatus, errorThrown) {
	                alert(jqXHR.responseText);
	                CloseWindow();
	            }
	        });
        }else{
        	var newRow = { name: "" };
        }
        if(gridid != 'product_reve_grid'){
	        grid.addRow(newRow, 0);
        }
    }
    
    //删除行
    function removeRow(gridid) {
        var grid = nui.get(gridid);
        var rows = grid.getSelecteds();
        if (rows.length > 0) {
	        if(gridid == 'csReveForecast_grid'){
	        	var productReves = product_reve_grid.getData();
	        	if(productReves!=null&&productReves!=''){
	    			for(var i=0;i<rows.length;i++){
		        		var reveno = rows[i].reveno;
		        		grid.removeRow(rows[i], false);
		        		for(var k=0;k<productReves.length;k++){
		        			var reveid = productReves[k].reveid;
		        			if(reveid == reveno){
		        				product_reve_grid.removeRow (productReves[k], false);
		        			}
		        		}
		        	}
	        	}
	        }
            grid.removeRows(rows, false);
        }
        doCal();
    }
    
    //销售人员点开对应的产品子grid时的方法
	var currentRow=null;
	function onShowRowDetail(e) {
    	var detailGrid_Form = document.getElementById("detailGrid_Form");
        var grid = e.sender;
        var row = e.record;            
        if(currentRow){//如果有当前行
        	var datas = product_grid.getData();
        	currentRow.saleProds = datas;
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
	
	//“签署单位”、“最终用户”、“接收人所在单位”清除时的方法
    function onCloseClick(e) {
        var obj = e.sender;
        obj.setText("");
        obj.setValue("");
    }
    
    //“签署单位”、“最终用户”、“接收人所在单位”点击选择时的方法
    function onButtonEdit(e) {
        var btnEdit = this;	
        var lookupUrl="";
        if ( btnEdit.name=="cscontract.misCustinfo.custid" || btnEdit.name=="cscontract.userid" || btnEdit.name=="cscontract.receivercompid"){
        	lookupUrl = "/contract/contract/MisCustinfo_lookup.jsp";
        }else if(btnEdit.name == "cscontract.saleshapid"){
        	var salesData = sales_grid.getData();
        	var salesnames = "";
        	for(var i = 0;i < salesData.length;i ++){
        		if(salesnames != ""){
        			salesnames = salesnames + "," + salesData[i].salename;
        		}else{
        			salesnames = salesData[i].salename;
        		}
        	}
        	if(salesnames != ""){
		        lookupUrl = "/contract/contract/CsSaleShap_lookup.jsp?salesnames=" + salesnames;
        	}else{
        		nui.alert("销售人员不能为空！");
        		return false;
        	}
        }
        if (lookupUrl==""){
        	return false;
        } 
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
							if(btnEdit.name=="cscontract.misCustinfo.custid"){
								nui.get("groupno").setValue(data.groupname);
							}
			                btnEdit.setValue(data.id);
			                btnEdit.setText(data.text);
						}
					}
				}
			});
        }
        
	}
	function changesigntarget(e){
		var signtarget = e.value;
		if(signtarget.indexOf('2') >= 0){
			nui.get("userid").setValue(nui.get("custid").getValue());
			nui.get("userid").setText(nui.get("custid").getText());
		}else{
			nui.get("userid").setValue('');
			nui.get("userid").setText('');
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
                    }
                }
			}
        });
	}
	
	//选择技术负责人
	function onButtonEdit2(e){
		var btnEdit = this;
		nui.open({
            url:"<%=request.getContextPath()%>/contract/contract/SelectTechDirector.jsp",
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
                    	btnEdit.setValue(data.empname);
                    	var rowData = {techdirector: data.userid, techdirectorname: data.empname, techorg: data.orgid, techorgname: data.orgname};
                    	sales_grid.updateRow(row,rowData);
                    }
                }
			}
        });
	}
	
	//只能选择产品
	function beforenodeselect(e){
        if (e.isLeaf == false) {
        	e.cancel = true;
        }
	}
	
	//选择项目
	function selectProject(){
		var btnEdit = this;
   		nui.open({
            url:'<%=request.getContextPath()%>/ame_common/SelectProject.jsp',
            title: "选择项目",
            width: 850,
            height: 420,
            ondestroy: function (action) {
                if (action == "ok") {
                    var iframe = this.getIFrameEl();
                    var data = iframe.contentWindow.GetData();
                    data = nui.clone(data);
                    if (data) {
                        btnEdit.setValue(data.contnum);
                        btnEdit.setText(data.projectno);
                        nui.get("projectno").setValue(data.projectno);
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
				nui.alert("请输入实数！");
				var rowData = {servjsmon: 0};
				sales_grid.updateRow(row,rowData);
				return;
			}		
			if(row.servsubmon != null && isNaN(row.servsubmon)){
				nui.alert("请输入实数！");
				var rowData = {servsubmon: 0};
				sales_grid.updateRow(row,rowData);
				return;
			}
			if(row.othmon != null && isNaN(row.othmon)){
				nui.alert("请输入实数！");
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
			//技术服务总额
			var servjsmon = datas[i].servjsmon;
			//产品维保金额
			var prodwbmon = datas[i].prodwbmon;
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
	
	function changeProdReve(e){
		var row = product_reve_grid.getSelected();
		var pratio = row.pratio;
		if(row){
			if(row.contsum != null && isNaN(row.contsum)){
				nui.alert("请输入实数！");
				var rowData = {contsum: 0};
				product_reve_grid.updateRow(row,rowData);
				return;
			}
			if(row.tax != null && isNaN(row.tax)){
				nui.alert("请输入实数！");
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
			nui.alert("请输入实数！");
			var rowData = {prodmon: 0};
			product_grid.updateRow(row,rowData);
			return;
		}		
		if(row.prodsubmon != null && isNaN(row.prodsubmon)){
			nui.alert("请输入实数！");
			var rowData = {prodsubmon: 0};
			product_grid.updateRow(row,rowData);
			return;
		}
		if(row.othmon != null && isNaN(row.othmon)){
			nui.alert("请输入实数！");
			var rowData = {othmon: 0};
			product_grid.updateRow(row,rowData);
			return;
		}
		if(row.prodwbmon != null && isNaN(row.prodwbmon)){
			nui.alert("请输入实数！");
			var rowData = {prodwbmon: 0};
			product_grid.updateRow(row,rowData);
			return;
		}
		if(row.prodwbsubmon != null && isNaN(row.prodwbsubmon)){
			nui.alert("请输入实数！");
			var rowData = {prodwbsubmon: 0};
			product_grid.updateRow(row,rowData);
			return;
		}
		if(row.prodwbothmon != null && isNaN(row.prodwbothmon)){
			nui.alert("请输入实数！");
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
		doCal();//计算合同额
	}
	//点击保存时调用的方法
	function SaveData() {
        var o = form.getData();
        //新合同编号
        var newcontnum = nui.get("contnum").getValue();
     	var json = nui.encode({contnum: newcontnum});
        nui.ajax({
            url: "com.primeton.mis.contract.contract.checkContractNum.biz.ext",
			type: 'POST',
			data: json,	
			contentType: 'text/json',
            success: function (o) {
            	if(o.result != 0){
            		nui.alert("这个合同编号已经被使用了！");
            		nui.get("okbutton").enable();
            		return;
            	}else{
            		//老合同编号
			        var oldcontnum = nui.get("projectcontnum").getValue();
			        //是否进行保存操作标识
			        if(oldcontnum){
			        	if(oldcontnum != newcontnum){
			        		var title = "选择的项目合同编号为:" + oldcontnum + ",与您编辑的合同编号:" + newcontnum + "不同!";
							nui.confirm(title,"是否替换合同编号?",function(action){
								if(action == "ok"){	//选择是,进行保存
									SaveData3();
								}else{
									nui.get("okbutton").enable();
									return;
								}
							});        		
			        	}else{
			        		SaveData3();
			        	}
			        }else{
			        	SaveData3();
			        }	
            	}
            }
    	});
    }
    
    function SaveData3(){
    	var o = form.getData();
    	var row = sales_grid.getSelected();
    	//合同保函
		o.cscontract.csContBacks = nui.clone(csContBack_grid.getData());
		//合同保证金
		o.cscontract.csContDeps = nui.clone(csContDep_grid.getData());
		//合同业务分类
		o.cscontract.csContTypes = nui.clone(csContType_grid.getData());
		
        //收入预测记录
        o.cscontract.csReveForecasts = nui.clone(csReveForecast_grid.getData());
        o.cscontract.csReveForecastsAdded = nui.clone(csReveForecast_grid.getChanges("added",true));
        o.cscontract.csReveForecastsRemoved = nui.clone(csReveForecast_grid.getChanges("removed",true));
        o.cscontract.csReveForecastsModified = nui.clone(csReveForecast_grid.getChanges("modified",false));
        var productReves = product_reve_grid.getData();
        o.cscontract.productReves = nui.clone(productReves);
        var isXM;
        var isRL;
        var stat;
        for(var i = 0;i < o.cscontract.csReveForecasts.length;i ++){
	        //收入确认次数不能为空
        	if(!o.cscontract.csReveForecasts[i].reveno){
        		nui.alert("收入确认次数不能为空!");
        		nui.get("okbutton").enable();
        		return;
        	}  
        	if(!o.cscontract.csReveForecasts[i].revetype){
        		nui.alert("收入类型不能为空!");
        		nui.get("okbutton").enable();
        		return;
        	}
        	
        	if(!o.cscontract.csReveForecasts[i].saleseva){
        		nui.alert("销售评估不能为空!");
        		nui.get("okbutton").enable();
        		return;
        	}
    		//最初预计确认年月不能为空 
        	if(!o.cscontract.csReveForecasts[i].yearmonth){
        		nui.alert("合同收入确认预估的预计确认年月不能为空!");
        		nui.get("okbutton").enable();
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
        	var revetype1 = o.cscontract.csReveForecasts[i].revetype;
        	var types = revetype1.split(",");
        	for(var p=0;p<types.length;p++){
        		if(types[p]=='1'){
        			isXM='1';
        		}else if(types[p]=='5'){
        			isRL='1';
        		}
        	}
        }
        if(isRL=='1'||isXM=='1'){
        	stat='1';
        }
        o.cscontract.stat = stat;
        //收入确认新增对象数据处理
        for(var i = 0;i < o.cscontract.csReveForecastsAdded.length;i ++){
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
        		nui.get("okbutton").enable();
        		return;
        	}
			//新增
        	if(!o.csGatherFcs[i].yearmonth){
        		nui.alert("合同收款记录的预计收款年月不能为空!");
        		nui.get("okbutton").enable();
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
        //合同订单处理
        var contracttype = nui.get("contracttype").getValue();
    	var contsum = nui.get("contsum").getValue();
    	var countRows = 0;
        if(contracttype == "04" || contracttype == "30"){
        	var csContOrderRows = csContOrder_grid.getData();
        	//合同执行总金额
        	if(csContOrderRows){
	        	for(var i = 0;i < csContOrderRows.length;i ++){
	        		csContOrderRows[i].ordermon = parseFloat(csContOrderRows[i].ordermon);
    	    		countRows += csContOrderRows[i].ordermon;
        		}
        	}
    	}else{
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
			contorderno: nui.get("contnum").getValue()}];
    	}
    	if(contracttype == "04" || contracttype == "30"){
    		countRows = parseFloat(countRows).toFixed(2);
        	contsum = parseFloat(contsum).toFixed(2);
        	if(countRows != contsum){
        		nui.alert("合同订单处理中的合同订单金额总和为：" + countRows +"与合同执行总金额：" + contsum + "不相等！");
        		nui.get("okbutton").enable();
        		return;
        	}
	    	o.cscontract.csContOrders = csContOrderRows;
	    }
        if(row){
        	var datas=product_grid.getData();
        	row.saleProds=datas;
        }
        o.cscontract.sales = nui.clone(sales_grid.getData());
        if(!form.validate()){
        	nui.alert("信息录入不完整！");
        	nui.get("okbutton").enable();
        	return;
        }
		//如果合同收入汇总金额与合同总金额不相等，提示
		var checkSumMoney = 0;
        for(var i = 0;i < o.cscontract.csReveForecastsAdded.length;i ++){
        	checkSumMoney += o.cscontract.csReveForecastsAdded[i].fcsum;
        }
        var checkContsum = nui.get("contsum").getValue();
        checkContsum = parseFloat(checkContsum).toFixed(2);
        checkSumMoney = parseFloat(checkSumMoney).toFixed(2);
        var text = "";
        if(checkSumMoney != checkContsum){
        	text = "合同执行总金额："+checkContsum+"，与合同收入确认预估汇总金额："+checkSumMoney+"不相等，确定要保存吗？";
        }else{
        	text = "确定要保存吗？";
        }
        nui.confirm(text,"系统提示",function(a){
    		if(a == "ok"){
    			var json = nui.encode(o);
		        form.loading("数据保存中...");
		        nui.ajax({
		            url: saveURL,
		            data: json,
		            type: 'POST',
		            cache: false,
		            contentType: 'text/json',
		            success: function (text) {
		            	form.unmask();
		            	if(text.exception == null){
		            		nui.alert("保存成功",null,function(){
		            			CloseWindow("save");
		            		});
		            	}else{
		            		nui.alert("保存失败");
		            		nui.get("okbutton").enable();
		            	}
		            },
		            error: function (jqXHR, textStatus, errorThrown) {
		                nui.alert(jqXHR.responseText);
		                CloseWindow();
		            }
		        });
    		}else{
    			nui.get("okbutton").enable();
    		}
    	});
    }
    //根据合同类型获取合同存档编号
    function getContractNum(e){
		var contracttype = nui.get('contracttype').getValue();
    	//针对OEM合同、框架合同，需要新增订单
    	if(contracttype == "04" || contracttype == "30"){
	    	csReveForecast_grid.showColumn(csReveForecast_grid.getColumn(16));
	    	document.getElementById("csContOrder_fieldset").style.display="";
    	}else{
	    	csReveForecast_grid.hideColumn(csReveForecast_grid.getColumn(16));
    		document.getElementById("csContOrder_fieldset").style.display="none";
    	}
		var tempType = "";
		
		if(contracttype == "01" || contracttype == "04" || contracttype == "20"
			||contracttype == "08" || contracttype == "10"){//产品合同、混合合同//服务合同
			if(contracttype == "01" || contracttype == "04" || contracttype == "20"){
				tempType = "L";
			}else{
				tempType = "S";
			}
			$(".temp2").hide();
		}else{//框架协议
			tempType = "F";
			$(".temp2").css({
				"display":""
			})
		}
		var myDate = new Date();
		tempType = myDate.getFullYear() + "-" + tempType;
		form.loading("合同存档编号生成中...");
		nui.ajax({
            url: "com.primeton.mis.contract.contract.getContractNum.biz.ext",
			type: 'POST',
			data: {firstPart: tempType},	
			contentType: 'text/json',
            success: function (o) {
            	form.unmask();
            	var contnum = o.contractNum;
                nui.get("contnum").setValue(o.contractNum);
                nui.get("contnum_old").setValue(o.contractNum);
               	var csContTypes = csContType_grid.getData();
            	if(csContTypes.length>0){
            		for(var i=0;i<csContTypes.length;i++){
	                	var row = csContType_grid.getRow(i);
	                	if(contracttype=="04" || contracttype=="30"){
		                	var rowData = {contnum:o.contractNum,contorderno:""};
	                	}else{
		                	var rowData = {contnum:o.contractNum,contorderno:o.contractNum};
	                	}
						csContType_grid.updateRow(row,rowData);
            		}
            	}
            }
        });
	}
	
	init();
	//此处的contappid 由原待签署合同跳转，原待签署合同是否有用？
	function init(){
		var contappid = "<%=request.getParameter("contappid") %>";
		if(contappid != "null" && contappid != ""){
			var json = nui.encode({contappid:contappid});
			 nui.ajax({
                url: "com.primeton.mis.contract.decontract.addCs.biz.ext",
				type: 'POST',
				data: json,	
				contentType: 'text/json',
                success: function (o) {
                    form.setData(o);
                    form.setChanged(false);
					nui.get("contreg").setValue(new Date());
					changeOcDate();
                    if(o.cscontract.misCustinfo){
                    	nui.get("custid").setText(o.cscontract.misCustinfo.custname);
                    }
                   sales_grid.setData(o.data); 	     		
                }
            });
        }
    }
	
	//页面进入时调用的方法
    function SetData(data) {
		nui.get("contreg").setValue(new Date());
		changeOcDate();
		sales_grid.hideColumn("oldsalename");
		//隐藏订单处理
		document.getElementById("csContOrder_fieldset").style.display="none";
		//新增的时候隐藏最新预计确认年月和最新预计确认旬度
		csReveForecast_grid.hideColumn(csReveForecast_grid.getColumn(8));
    	csReveForecast_grid.hideColumn(csReveForecast_grid.getColumn(9));
    	//新增的时候合同状态默认为1履行中
    	nui.get("status").setValue("1");
    	//新增的时候合同收款隐藏最新确认年月
    	csGatherFc_grid.hideColumn(csGatherFc_grid.getColumn(5));
	}
	
	/* function doDelete(fileID){
		nui.confirm("确定删除该附件？", "确定？",
            function (action) {
                if (action == "ok") {
					var json = nui.encode({fileid: fileID});
                    nui.ajax({
		                url: "com.primeton.mis.contract.contract.deleteFile.biz.ext",
						type: 'POST',
						data: json,	
						contentType: 'text/json',
		                success: function (o) {
		                    var tempSrc = "";
		                    for(var i=0;i<o.files.length;i++){
		                    	tempSrc += "<a href='com.primeton.components.web.fileupload.getfile.flow?fileId=" + o.files[i].fileId + "'>" + o.files[i].fileName + "</a>&nbsp;&nbsp;&nbsp;&nbsp;<a class='mini-button' iconCls='icon-remove' onclick='doDelete(" + o.files[i].fileId + ")'></a>,";
		                    }
		                   	document.getElementById("uploadedFile").innerHTML = tempSrc;
		                   	nui.parse(); 				
		                }
		            });
                }
            }
        );
	} */
	
    function GetData() {
        var o = form.getData();
        return o;
    }
    
    function CloseWindow(action) {
        if (action == "cancel" && form.isChanged()) {
            if (confirm("数据被修改了，是否先保存？")) {
                return false;
            }
        }
        if (window.CloseOwnerWindow) return window.CloseOwnerWindow(action);
        else window.close();            
    }
    
      function onOk(e) {
    	var contracttype = nui.get("contracttype").getValue();
    	if(!form.validate()){
    		nui.alert("信息录入不完整！");
        	return;
        }else if(nui.get("salename").getValue() == ""){
        	nui.alert("请至少添加一个销售！","销售未添加");
        	return;
        }else if(contracttype == "30" && nui.get("ispt").getValue() == ""){
        	nui.alert("合同类型为框架协议时，是否有排他合作必填！","是否有排他合作必填");
        	return;
        }else if(contracttype == "30" && nui.get("ispt").getValue() == "1" && nui.get("ptcondition").getValue() == ""){
        	nui.alert("合同类型为框架协议且有排他合作时，排他合作的条件必填！","排他合作条件必填");
        	return;
        }else if(contracttype == "08" && (nui.get("servstartdate").getValue() == "" || nui.get("servenddate").getValue() == "")){
        	nui.alert("合同类型为产品维保合同时，MA服务开始日期、MA服务结束日期必选！","MA服务日期必填");
        	return;
        }else{
        	var contsum = (nui.get("contsum").getValue() == null || nui.get("contsum").getValue() == "") ? 0:nui.get("contsum").getValue();
        	var types = csContType_grid.getData();
        	var orders = csContOrder_grid.getData();
        	var typesummon=0;
        	var ordersummon=0;
        	if(types.length > 0){
	        	if(contracttype =="04" || contracttype =="30" ){
	        		if(orders.length > 0){
	        			for(var i=0;i<orders.length;i++){
	        				var typemon=0;
							ordersummon += parseFloat(orders[i].ordermon);
							for(var j=0;j<types.length;j++){
								if(orders[i].contorderno==types[j].contorderno){
									typemon +=parseFloat(types[j].summon);
								}
							}
							if(parseFloat(orders[i].ordermon).toFixed(2) != parseFloat(typemon).toFixed(2)){
								nui.alert("合同订单编号："+orders[i].contorderno+"的合同订单金额不等于合同业务分类数据之和，请确认！");
		        				return;
							}
	        			}
	        			if(parseFloat(contsum).toFixed(2) != parseFloat(ordersummon).toFixed(2)){
		        			nui.alert("合同执行总金额不等于合同订单金额之和，请确认！");
		        			return;
	        			}
	        		}else{
		        		nui.alert("请填写合同订单信息！");
		    			return;
	        		}
	        	}else{
	        		for(var i=0;i<types.length;i++){
	        			typesummon +=parseFloat(types[i].summon);
	        		}
	        		if(parseFloat(contsum).toFixed(2) != parseFloat(typesummon).toFixed(2)){
	        			nui.alert("合同执行总金额不等于合同相关业务分类数据之和，请确认！");
	        			return;
	        		}
	        	}
        	}else{
        		nui.alert("请填写合同业务分类信息！");
    			return;
        	}
        	var text = editor1.html();
			nui.get("paycondition").setValue(text);
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
        	var rows = csReveForecast_grid.getData();//预估金额要和执行合同金额相等
			if(rows){//预估金额总和
				var sumPrice = 0;
				for(var i = 0;i < rows.length;i ++){//合同执行总金额
					if(!rows[i].fcsum){//新增行fcsum为空需赋值为0
						rows[i].fcsum = 0;
					}
					rows[i].fcsum = parseFloat(rows[i].fcsum);
					sumPrice = sumPrice + rows[i].fcsum;
				}
				sumPrice = parseFloat(sumPrice).toFixed(2);
				var contsumPrice = nui.get("contsum").getValue();
				contsumPrice = parseFloat(contsumPrice).toFixed(2);
			}
			
			var csReveForecastRows = csReveForecast_grid.getData();
			for(var i = 0;i < csReveForecastRows.length;i ++){
		        //收入确认次数不能为空
	        	if(!csReveForecastRows[i].reveno){
	        		nui.alert("收入确认次数不能为空!");
	        		nui.get("okbutton").enable();
	        		return;
	        	}  
	        	if(!csReveForecastRows[i].revetype){
	        		nui.alert("收入类型不能为空!");
	        		nui.get("okbutton").enable();
	        		return;
	        	}
	        	if(!csReveForecastRows[i].saleseva){
	        		nui.alert("销售评估不能为空!");
	        		nui.get("okbutton").enable();
	        		return;
	        	}
			}
			
			var filePaths = document.getElementsByName("uploadfile1").length;
	    	for(var j=0;j<filePaths;j++){
	    		var a=document.getElementsByName("remarkList1")[j].value;
	    		if(a==null||a==""){
	    			nui.alert("新增附件不可以为空");
	    			return false;
	    		}
	    	}
	    	var filePaths1 = document.getElementsByName("uploadfile2").length;
	    	for(var j=0;j<filePaths1;j++){
	    		var a=document.getElementsByName("remarkList2")[j].value;
	    		if(a==null||a==""){
	    			nui.alert("新增附件不可以为空");
	    			return false;
	    		}
	    	}
			
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
							nui.get("okbutton").disable();
	                		document.getElementById("fileCatalog1").value="CS_CONT_BACK";
							form4.submit();
	                	}
	                }
	            });
        	}else{
        		nui.get("okbutton").disable();
        		document.getElementById("fileCatalog1").value="CS_CONT_BACK";
				form4.submit();
        	}
	    }
    } 
    
    
    
  
    
    function SaveData1(){
    	document.getElementById("fileCatalog2").value="CS_CONT_DEP";
		form6.submit();
    }
    
    function SaveData2(){
    	document.getElementById("fileCatalog").value="CsContract";
		form2.submit();
    }
    
    function checkCellEdit(e){
    	var contracttype = nui.get("contracttype").getValue(); 
    	var selectRow = csContType_grid.getSelected();
    	if(contracttype !="04" && contracttype !="30"){
    		if(e.field == "contorderno"){
				csContType_grid.setAllowCellEdit(false);
	    	}else{
	    		csContType_grid.setAllowCellEdit(true);
	    	}
    	}
    }
    function doContsum(e){
    	var row = csContType_grid.getRow(e.rowIndex);
    	if(row){
    		if(row.summon != null && isNaN(row.summon)){
				nui.alert("请输入实数！");
				var rowData = {summon: 0};
				csContType_grid.updateRow(row,rowData);
				return;
			}
    		if(row.taxrate != null && isNaN(row.taxrate)){
				nui.alert("请输入实数！");
				var rowData = {taxrate: 0};
				csContType_grid.updateRow(row,rowData);
				return;
			}
			var summon = 0;
			var taxrate = 0;
			var summon2 = 0;
			if(row.summon){
				summon = row.summon;
			}
			if(row.taxrate){
				taxrate = row.taxrate;
			}
			summon2 = (parseFloat(summon)/(1+parseFloat(taxrate))).toFixed(2);
			var rowData = {summon2: summon2};
			csContType_grid.updateRow(row,rowData);
    	}
    }
    
    function doSumfee(e){//编辑合同订单csContOrder_grid，计算金额updateRow
		var row = csContOrder_grid.getRow(e.rowIndex);
		if(row){
			if(row.orderprodmon != null && isNaN(row.orderprodmon)){
				nui.alert("请输入实数！");
				var rowData = {orderprodmon: 0};
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
			if(row.servjsmon != null && isNaN(row.servjsmon)){
				nui.alert("请输入实数！");
				var rowData = {servjsmon: 0};
				csContOrder_grid.updateRow(row,rowData);
				return;
			}
			if(row.prodwbmon != null && isNaN(row.prodwbmon)){
				nui.alert("请输入实数！");
				var rowData = {prodwbmon: 0};
				csContOrder_grid.updateRow(row,rowData);
				return;
			}
			var ordermon = 0;
			var orderprodmon = 0;
			var servjsmon = 0;
			var prodwbmon = 0;
			if(row.ordermon){
				ordermon = row.ordermon;
			}
			if(row.orderprodmon){
				orderprodmon = row.orderprodmon;
			}
			if(row.servjsmon){
				servjsmon = row.servjsmon;
			}
			if(row.prodwbmon){
				prodwbmon = row.prodwbmon;
			}
			var orderservmon = (parseFloat(servjsmon) + parseFloat(prodwbmon)).toFixed(2);
			var sumordermon = (parseFloat(orderprodmon) + parseFloat(orderservmon)).toFixed(2);
			var rowData = {ordermon: sumordermon, orderprodmon: orderprodmon, orderservmon: orderservmon};
			csContOrder_grid.updateRow(row,rowData);
		}
    }
    
    var fcreverateBegin = 0;//确认比例(编辑前)
	var fcsumBegin = 0;//确认金额(编辑前)
    function doCsReveForecastBegin(e){//收入预估 计算比例金额(编辑前)
    	var row = csReveForecast_grid.getRow(e.rowIndex);
    	if(row.fcreverate){
        	fcreverateBegin = row.fcreverate;
        }
        if(row.fcsum){
        	fcsumBegin = row.fcsum;
        }
    }
    
    function doCsReveForecastEnd(e){//收入预估 计算比例金额(编辑后)
    	var contsum = nui.get("contsum").getValue();
    	var row = csReveForecast_grid.getRow(e.rowIndex);
    	var reveno = row.reveno;
    	var csReveForecasts = csReveForecast_grid.getData();
    	var k=0;
    	for(var i=0;i<csReveForecasts.length;i++){
    		var reveno1 = csReveForecasts[i].reveno;
			if(reveno1==reveno){
				k++;
				if(k>1){
					nui.alert("收入次数不能重复！");
	    			var Data1 = {reveno: ""};
					csReveForecast_grid.updateRow(row,Data1);
					return;
				}
    		}
    	}
    	var fcreverate = 0;//确认比例
    	var fcsum = 0;//确认金额
    	var productsum = 0;//预计金额产品额
    	var servicesum = 0;//预计金额服务额
    	var masum = 0;//预计金额MA额
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
        if(contsum && contsum !=0){
	        fcreverate = fcsum/contsum;
        }else{
        	fcreverate = 0;
        }
        fcsum = parseFloat(fcsum).toFixed(2);
        fcreverate = parseFloat(fcreverate).toFixed(3);
        var rowData = {productsum: productsum,servicesum: servicesum,masum: masum,fcreverate: fcreverate,fcsum: fcsum};
		csReveForecast_grid.updateRow(row,rowData);
    }
        
    function onCancel(e) {
        CloseWindow("cancel");
    }
    
    //附件
    function onFileRenderer(e) {
        var tempSrc = "";
    	//长度为1，不换行
    	if(e.record.files!=undefined){
	    	if(e.record.files.length == 1){
	        	tempSrc += "<a href='com.primeton.components.web.fileupload.getfile.flow?fileId=" + e.record.files[0].fileId + "'>" + e.record.files[0].fileName + "</a>";
	    	}else{
		        for(var i=0;i<e.record.files.length;i++){
		        	//长度大于1小于长度length换行
		        	if(i< e.record.files.length-1){
		        		tempSrc += "<a href='com.primeton.components.web.fileupload.getfile.flow?fileId=" + e.record.files[i].fileId + "'>" + e.record.files[i].fileName + "</a><br/>";
		        	}
		        	//最后一个不换行
	        		if(i == e.record.files.length-1){
		        		tempSrc += "<a href='com.primeton.components.web.fileupload.getfile.flow?fileId=" + e.record.files[i].fileId + "'>" + e.record.files[i].fileName + "</a>";
		        	}
		        }
	    	}
    	}
       	return tempSrc;
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
			var productsum = 0;//预计产品额
			var servicesum = 0;//预计服务额
			var fcsum = 0;//预计确认金额
			var fcreverate = 0;//预计确认比例
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
     
	//收款表格可编辑颜色控制  //合同收入预估grid加载时设置样式
    function changeColor(e){
    	//状态为已收款的，设置行样式
    	if(e.record.status == "2" || e.record.status =="3"){
        	e.cellStyle = "background-color: #33FFFF";
    	}
    }
	
	//已收款汇总行    保函保、证金汇总行    收入确认汇总行   产品分成汇总
	function drawSum(e){
		if (e.field == "fcsum" || e.field == "backdepmon" || e.field == "returnmon" 
			|| e.field == "productsum"|| e.field == "servicesum"|| e.field == "masum" 
			||e.field == "contsum" || e.field == "tax"|| e.field == "contsum2"|| e.field == "pratiomon" 
			|| e.field == "summon"|| e.field == "summon2") {
            e.cellHtml = "<div align='right'><b>" + e.cellHtml + "</b></div>";
        }
	}
	
	//MA合同收入记录拆分
	function maSplit(){
		var oldReve = csReveForecast_grid.getData();//已存在的收入数据
		var oldReveLength = oldReve.length;//已存在的收入数据记录条数
		var contracttype = nui.get("contracttype").getValue();//合同类型
		var contsum = nui.get("contsum").getValue();//合同金额
		var masum = 0;//产品维保金额
		var deptGridRows = sales_grid.data;
		for(var i = 0;i < deptGridRows.length;i ++){
			masum += parseFloat(deptGridRows[i].prodwbmon);
		}
		masum = parseFloat(masum);
        var signdate = nui.get("signdate").getValue();//合同签订日期
        var servstartdate = nui.get("servstartdate").getValue();//MA服务开始日期
        var servenddate = nui.get("servenddate").getValue();//MA服务结束日期
        if(!contracttype){
        	nui.alert("合同类型不能为空！");
        	return;
        }
        if(!contsum){
        	nui.alert("合同执行金额不能为空！");
        	return;
        }
        if(!signdate){
        	nui.alert("合同签订日期不能为空！");
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
					 	var grid = nui.get("csReveForecast_grid");
				    	nui.get("servstartdate").setValue(reveObject.startDate);//设置MA开始日期
				    	nui.get("servenddate").setValue(reveObject.endDate);//设置MA结束日期
						
				        for(var i = 0;i < reveObject.data.length;i ++){
				        	if(contracttype == "04" || contracttype == "30"){//设置合同收入确认记录
				        		reveObject.data[i].contorderno = nui.get("contnum").getValue();
			        		}
					        grid.addRow(reveObject.data[i], i);
				        }
					}
				}
			}
		});
     }
  	
  	//登记日期变更
  	function changeOcDate(){
  		var contreg = nui.get("contreg").getValue();
  		var year = contreg.substring(0,4);
  		var month = contreg.substring(5,7);
  		var ocstartdate = year + "-" + month + "-01";
  		nui.get("ocstartdate").setValue(ocstartdate);
  	}
  	
  	var editor1 = null;
	KindEditor.ready(function(K) {
		editor1 = K.create('textarea[name="content1"]', {
			cssPath : '<%=request.getContextPath()%>/common/nui/resource/kindeditor/plugins/code/prettify.css',
			uploadJson : '<%=request.getContextPath()%>/common/nui/resource/kindeditor/jsp/upload_json.jsp',
			fileManagerJson : '<%=request.getContextPath()%>/common/nui/resource/kindeditor/jsp/file_manager_json.jsp',
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
			} 
		});
		prettyPrint();
	});
  	//根据合同业务分类数据计算税率
	function selectContractType(e){
		var row = csContType_grid.getSelected();
		var json = nui.encode({"dictid":e.value,"dicttypeid":"CS_CONTRACT_TYPE"});
    	nui.ajax({
            url: "org.gocom.abframe.tools.newDict.queryDictEntry.biz.ext",
            data: json,
            type: 'POST',
            cache: false,
            contentType: 'text/json',
            success: function (text) {
        		var returnJson = nui.decode(text);
        		if(returnJson){
            		var entry = returnJson.EosDictEntry;
            		var filter1 = entry.filter1;
        		}
        		var rowData = {"taxrate":filter1};
        		csContType_grid.updateRow(row,rowData);
            },
            error: function (jqXHR, textStatus, errorThrown) {
                nui.alert(jqXHR.responseText);
            }
        });
	}
  	//日期处理
	function onDealDate(e){
		if(e.value){
			return e.value.substring(0,10);
		}
	}
  	
  	function onGenderRenderer(e) {
        return nui.getDictText('CONT_ORG',e.value);
    }
    
	function onGender1Renderer(e) {
        return nui.getDictText('SERV_NUM_TYPE',e.value);
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
    //是否需要销售评估
    function onGenderSaleseva(e){
    	return nui.getDictText('MIS_YN',e.value);
    } 
    //合同保函保证金状态
    function onCsBackDepStatus(e){
    	return nui.getDictText('CS_BACK_DEP',e.value);
    }
    //收入产品类型
    function getReveProdtype(e){
		return nui.getDictText('REVE_PRODTYPE',e.value);
	}
	//合同业务分类
    function getCsContracttype(e){
		return nui.getDictText('CS_CONTRACT_TYPE',e.value);
	}
	
</script>
</html>
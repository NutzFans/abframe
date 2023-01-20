<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<!-- 
  - Author(s): LJ
  - Date: 2013-03-03 11:07:52
  - Description:
-->
<head>
    <title>合同编辑</title>
	<script src="<%= request.getContextPath() %>/common/nui/nui.js" type="text/javascript"></script>
<%-- 	<script type="text/javascript" src="<%=request.getContextPath() %>/common/components/swffileupload/swfupload/swffileupload.js"></script> --%>
	<link rel="stylesheet" href="<%=request.getContextPath()%>/common/nui/resource/kindeditor/themes/default/default.css" />
	<script charset="utf-8" src="<%=request.getContextPath()%>/common/nui/resource/kindeditor/kindeditor-all-min.js"></script>
	<script charset="utf-8" src="<%=request.getContextPath()%>/common/nui/resource/kindeditor/lang/zh-CN.js"></script>
	<script charset="utf-8" src="<%=request.getContextPath() %>/common/nui/resource/kindeditor/plugins/code/prettify.js"></script>
    <style type="text/css">
	    .myIndex{
	        background:#FFFF00;
	    }
	    html, body{font-size:12px;padding:0;margin:0;border:0;height:100%;overflow:hidden;width:100%;}
    </style>
</head>
<body>

	<div id="body_tab" class="nui-tabs" activeIndex="0" style="width: 100%;height:100%;padding: 0">
		<div title="合同信息">
			<div class="nui-fit">
			<div id="form1" method="post" >
				<!-- 
					针对OEM合同、框架合同，需要新增订单
					1、增加合同时允许选择对应的项目（选择后项目外部状态变更为：项目实施阶段
					2、合同收入预测提供表格（子表）方式增加
					3、合同订单处理提供表格(子表）方式增加
				 -->
		        <input name="cscontract.contractid" id="conId" class="nui-hidden" />
		         <input name="cscontract.fileids" id="fileids" class="nui-hidden" />
		        <input name="cscontract.fileids1" id="fileids1" class="nui-hidden" />
		        <input name="cscontract.fileids2" id="fileids2" class="nui-hidden" />
		        <input id="contnum_old" class="nui-hidden" />
	        	<!-- 添加销售时，网这个这字段里append值，判断智力是否有值，就可以判断是否有销售 -->
		        <input class="nui-hidden" name="cscontract.salename" id="salename"/>
		        <input class="nui-hidden" name="cscontract.org" id="org"/>
		        <input class="nui-hidden" id="t_rownum" value="1"/>
		        <input class="nui-hidden" id="servjsmon1" />
		        <input class="nui-hidden" id="prodwbmon1" />
		        <input class="nui-hidden" name="cscontract.contorderid" id="contorderid" />
		        <input class="nui-hidden" name="cscontract.custname" id="custname" />
				<fieldset style="border:solid 1px #aaa;padding:3px;">
				<legend>合同基本信息</legend>
				<div >
		            <table style="table-layout:fixed;" id="table_file">
		                <tr>
		                    <td style="width:380px;" align="right">合同类型：</td>
		                    <td style="width:150px;">    
		                        <input class="mini-dictcombobox" name="cscontract.contracttype" id="contracttype" dictTypeId="MIS_CONTRACTTYPE" readonly="readonly" required="true"/>
		                    </td>
		                    <td style="width:100px;" align="right">合同存档编号：</td>
		                    <td style="width:150px;">    
		                        <input name="cscontract.contnum" id="contnum" class="nui-textbox" allowInput="false" required="true"/>
		                    </td>
			                <td style="width:120px;" align="right">登记日期：</td>
			                <td style="width:150px;">
			                    <input name="cscontract.contreg" id="contreg" class="nui-datepicker" required="true" allowInput="false"/>
			                </td>
			                <td style="width:120px;" align="right">合同签署日期：</td>
			                <td style="width:150px;">    
			                    <input name="cscontract.signdate" id="signdate" class="nui-datepicker" required="true" emptyText="请选择日期" allowInput="false"/>
			                </td>
		                </tr>
		                <tr>
		                    <td align="right">签署单位：</td>
		                    <td colspan="3">    
		                        <input class="nui-buttonedit" style="width:375px" name="cscontract.misCustinfo.custid" id="custid" value="" text="" onbuttonclick="onButtonEdit" showClose="true" oncloseclick="onCloseClick" required="true" allowInput="false"/>
		                    </td>
		                    <td style="width:120px;" align="right">所属集团客户：</td>
		                    <td colspan="3">    
		                        <input  class="nui-textbox"  style="width: 398px;" readonly="readonly" id="groupno"/>
		                    </td>
		                </tr>
		                <tr>
		                	<td style="width:120px;" align="right">最终用户：</td>
		                    <td colspan="3">
		                        <input class="nui-buttonedit" style="width:375px" name="cscontract.userid" id="userid" value="" text="" onbuttonclick="onButtonEdit" showClose="true" oncloseclick="onCloseClick" required="true" allowInput="false"/>
		                    </td>
		                </tr>
		                <tr>
		                    <td align="right">合同名称(项目)：</td>
		                    <td style="width:420px;" colspan="3">    
		                        <input name="cscontract.projectname" style="width:375px" class="nui-textbox"/>
		                    </td>
		                    <td style="width:120px;" align="right">合同号：</td>
		                    <td style="width:150px;">    
		                        <input name="cscontract.contid" class="nui-textbox" required="true"/>
		                    </td>
		                    <td style="width:120px;" align="right">客户类型：</td>
		                    <td style="width:150px;">    
		                        <input name="cscontract.signtarget" class="mini-dictcombobox" dictTypeId="CS_SIGNTARGET" multiSelect="true"/>
		                    </td>
		                </tr>
		                <tr style="display:">
		                    <td align="right">服务数量类型：</td>
		                    <td style="width:150px;">    
		                        <input class="mini-dictcombobox" name="cscontract.servnumtype" id="servnumtype" dictTypeId="SERV_NUM_TYPE"/>
		                    </td>
		                    <td align="right">服务数量：</td>
		                    <td style="width:150px;">    
		                        <input class="nui-textbox" name="cscontract.servnum" id="servnum" vtype="float"/>
		                    </td>
		                    <td align="right">服务单价：</td>
		                    <td style="width:150px;">    
		                        <input class="nui-textbox" name="cscontract.servprice" vtype="float"/>
		                    </td>
		                    <td class="temp1" style="width:120px;" align="right">行业：</td>
		                    <td class="temp1" style="width:150px;">    
		                        <input class="mini-dictcombobox" name="cscontract.industry" dictTypeId="MIS_INDUSTRY_SUBDIVISION" multiSelect="true"/>
		                    </td>
		                </tr>
		                <tr class="temp2">
		                    <td style="width:140px;" align="right">协议有效期开始：</td>
		                    <td style="width:150px;">    
		                        <input name="cscontract.xystart" class="nui-datepicker" emptyText="请选择日期"/>
		                    </td>
		                    <td style="width:120px;" align="right">协议有效期结束：</td>
		                    <td style="width:150px;">    
		                        <input name="cscontract.xyend" class="nui-datepicker" emptyText="请选择日期"/>
		                    </td>
		                    <td style="width:120px;" align="right">是否有排他合作：</td>
		                    <td style="width:150px;">   
		                        <input class="mini-dictcombobox" name="cscontract.ispt" id="ispt" dictTypeId="MIS_YN"/>
		                    </td>
		                    <td></td>
		                    <td></td>                   
		                </tr>
		                <tr class="temp2" style="display:none">
		                    <td align="right">排他合作的条件：</td>
		                    <td  colspan="7">    
		                        <input name="cscontract.ptcondition" id="ptcondition" class="nui-textarea" style="width:98%;" />
		                    </td>
		                </tr>
		                <tr>                	
		                    <td align="right">赠送服务数量类型：</td>
		                    <td style="width:150px;">    
		                        <input class="mini-dictcombobox" name="cscontract.zsservtype" id="zsservtype" dictTypeId="SERV_NUM_TYPE"/>
		                    </td>
		                    <td align="right">赠送服务数量：</td>
		                    <td style="width:150px;">    
		                        <input class="nui-textbox" name="cscontract.zsservnum" id="zsservnum" vtype="float"/>
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
		                    <td align="right">执行总金额：</td>
		                    <td style="width:150px;">    
		                        <input name="cscontract.contsum" id="contsum" class="nui-textbox" allowInput="false"/>
		                    </td>
		                    <td style="width:120px;" align="right">产品执行金额：</td>
		                    <td style="width:150px;">    
		                        <input name="cscontract.prodmon" id="prodmon" class="nui-textbox" allowInput="false"/>
		                    </td>
		                    <td style="width:120px;" align="right">服务执行金额：</td>
		                    <td style="width:150px;">    
		                        <input class="nui-textbox" name="cscontract.servmon"  id="servmon" allowInput="false"/>
		                    </td>
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
		                    <td style="width:120px;" align="right">所属公司：</td>
		                    <td style="width:150px;" >    
		                        <input class="mini-dictcombobox" name="cscontract.company"  dictTypeId="company" required="true" />
		                    </td>
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
		                    <td style="width:120px;" align="right">销售模式：</td>
		                    <td style="width:150px;">
		                        <input class="mini-dictcombobox" name="cscontract.salemode" id="salemode" dictTypeId="MIS_SALEMODE" showNullItem="true"/>
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
		                    <td style="width:150px;">
		                    	<input class="mini-dictcombobox" name="cscontract.isforbid" id="isforbid" dictTypeId="MIS_YN" />
		                    </td>
		                	<td style="width:120px;" align="right">是否高风险：</td>
		                    <td style="width:150px;">
		                    	<input class="mini-dictcombobox" name="cscontract.ishighrisk" id="ishighrisk" dictTypeId="MIS_YN" />
		                    </td>
		                </tr>
		                <tr>
		                	<td align="right">是否发送邮件：</td>
		                    <td style="width:150px;"  >
		                    	<input class="mini-dictcombobox" name="cscontract.issendmail" id="issendmail" readonly="readonly" dictTypeId="MIS_YN" value="0"/>
		                    </td>
		                    <td align="right">是否允许对外宣传：</td>
		                    <td style="width:150px;">
		                    	<input class="mini-dictcombobox" name="cscontract.publicity" id="publicity" dictTypeId="MIS_YN" />
		                    </td> 
		                      <td  align="right">结转类型：</td>
		                     <td style="width:150px;">
		                    	<input class="mini-dictcombobox" name="cscontract.carrytype" id="carrytype" dictTypeId="CONTRACT_CARRY_TYPE" />
		                    </td>
		                     <td align="right">是否批量预估收入：</td>
		                    <td style="width:150px;">
		                    	<input class="mini-dictcombobox" name="cscontract.isfinreve" id="isfinreve" dictTypeId="MIS_YN" />
		                    </td>  
		                    </tr>
		                    <tr>
			                	<td align="right">应收账款逾期/坏账备注：</td>
			                    <td style="width:960px;" colspan="7">    
			                        <input name="cscontract.bdmemo" id="bdmemo" class="nui-textarea" maxLength="500" style="width: 930px;height:100px;"/>
			                    </td> 
		                	</tr>
			                <tr>
			                	<td align="right">合同备注说明：</td>
			                    <td style="width:960px;" colspan="7">    
			                        <input name="cscontract.paycondition" id="paycondition" class="nui-hidden"/>
						   			<textarea id="ke" name="content1" style="width:930px;height:200px;visibility:hidden;"></textarea>
			                    </td> 
		                	</tr>
		             <!--   <tr> 
		                <td style="width:140px;" align="right">已上传的文件：</td>
		                <td style="width:420px;" id="uploadedFile" colspan="3"></td>
		                	<td style="width:120px;" align="right">合同文件上传：</td>
		                	<td style="width:420px;" colspan="3"> 
		         	   
		                	<div id="upload_div"></div>  
		        		</tr>    -->
		            </table>
		        </div> 
			</fieldset>
	        <jsp:include page="/ame_common/inputFile.jsp"/>
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
		    	<a class="nui-button" onclick="onOk()" id="okbutton" style="width:100px;">保存合同信息</a>
		    	<a class="nui-button" onclick="onCancel" style="width:60px;">关闭</a>
			</div> 
		</div>
		<div title="合同销售人员">
			<div class="nui-fit">
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
			</div>
			<div style="text-align:center;padding:10px;border-width:1px 0px 0px 0px;" class="nui-toolbar">
		    	<a class="nui-button" onclick="onOk()" id="okbutton" style="width:100px;">保存销售记录</a>
		    	<a class="nui-button" onclick="onCancel" style="width:60px;">关闭</a>
			</div> 
		</div>
		<div title="合同收款记录">
			<div class="nui-fit">
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
			            url="com.primeton.mis.contract.contract.getCsGatherFc.biz.ext" oncellendedit="doCsGatherFcEnd"  
			            showSummaryRow="true" ondrawsummarycell="drawSum" allowCellWrap="true">			            
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
			            url="com.primeton.mis.contract.contract.getCsContBackDep.biz.ext" dataField="csContBackDeps"
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
							<div renderer="deleteContractFile" width="20" headerAlign="center" align="center">操作</div>
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
			            url="com.primeton.mis.contract.contract.getCsContBackDep.biz.ext" dataField="csContBackDeps"
			            showSummaryRow="true" ondrawsummarycell="drawSum" allowCellWrap="true">			            
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
			        <div id="grid_1" class="nui-datagrid" style="width:100%;height:auto;" showPager="false" sortMode="client" url="com.primeton.eos.ame_common.file.getFiles.biz.ext" dataField="files" allowCellEdit="true" allowCellSelect="true" multiSelect="true" editNextOnEnterKey="true">
						<div property="columns">
							<div type="indexcolumn" headerAlign="center" width="15" >编号</div>
							<div field="fileName"width="50" headerAlign="center" align="center" renderer="getfiledetail">附件名称</div>
							<div field="fileType" width="50" align="center" headerAlign="center" >附件类型</div>
							<div field="operatorname" width="50"headerAlign="center" align="center">操作员名称</div>
							<div field="fileTime" width="50" headerAlign="center" align="center" dateFormat="yyyy-MM-dd HH:mm:ss">附件上传时间</div>
							<div renderer="deleteContractFile" width="20" headerAlign="center" align="center">操作</div>
						</div>
					</div>
			     	<jsp:include page="/ame_common/addFiles2.jsp"/>
		        </fieldset>	
			</div>
			<div style="text-align:center;padding:10px;border-width:1px 0px 0px 0px;"  class="nui-toolbar">
		    	<a class="nui-button" onclick="onOk()" id="okbutton" style="width:100px;">保存收款记录</a>
		    	<a class="nui-button" onclick="onCancel" style="width:60px;">关闭</a>
			</div> 
		</div>
		<div title="合同收入确认记录">
			<div class="nui-fit">
				<fieldset style="border:solid 1px #aaa;padding:3px;width: 1820px;">
		            <legend>合同收入确认记录</legend>
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
		            	showPager="false" allowCellEdit="true" allowCellSelect="true" multiSelect="true" editNextOnEnterKey="false" 
			            url="com.primeton.mis.contract.contract.getCsReveForecast.biz.ext" onrowclick="doUpdateForecast" 
			            oncellendedit="doCsReveForecastEnd" oncellbeginedit="doCsReveForecastBegin" 
			            showSummaryRow="true" ondrawsummarycell="drawSum" allowCellWrap="true">			            
			            <div property="columns">
			            	<div type="checkcolumn"></div>
			                <div field="reveno" width="50" headerAlign="center" align="center">收入次数
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
			                <div field="yearmonth" width="90" headerAlign="center" dateFormat="yyyy-MM" align="left">最初预计确认年月
			                	<input property="editor" class="nui-monthpicker" inputStyle="text-align: left"/>
			                </div>
			                <!-- 最初预计确认旬度 -->
			                <div field="monthperiod" width="90" renderer="onGenderMonthperiod" headerAlign="center" align="left">最初预计确认旬度
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
			                	<input property="editor" class="nui-textbox" vtype="float" inputStyle="text-align: right"/>
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
			                	<!-- <input property="editor" vtype="float" class="nui-textbox"/> -->
			                </div>
			                <div field="status" width="80" renderer="onGenderStatus" headerAlign="center" align="left">状态
			                	<input property="editor" class="nui-dictcombobox" dictTypeId="AME_REVESTATUS"/>
			                </div>
			                <!-- 订单编号 -->
			                <div field="contorderno" width="110" headerAlign="center" align="center">订单编号
			                	<input property="editor" class="nui-textbox"/>
			                </div>
			                <div field="saleseva" width="70" headerAlign="center" renderer="onGenderSaleseva" align="center">销售评估
			                	<input property="editor" class="nui-dictcombobox" dictTypeId="MIS_YN" />
			                </div>
			                <!-- 本次结算开始年月 -->
			                <div field="setstart" width="90" headerAlign="center" dateFormat="yyyy-MM" align="left">本次结算开始年月
			                	<input property="editor" class="nui-monthpicker" inputStyle="text-align: left" format="yyyy-MM"/>
			                </div>
			                <!-- 本次结算结束年月 -->
			                <div field="setend" width="90" headerAlign="center" dateFormat="yyyy-MM" align="left">本次结算结束年月
			                	<input property="editor" class="nui-monthpicker" inputStyle="text-align: left" format="yyyy-MM"/>
			                </div>
			            </div>
			        </div>
		        </fieldset>
		        
		        <fieldset style="border:solid 1px #aaa;padding:3px;width: 1820px;">
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
		            <div id="product_reve_grid" class="nui-datagrid" style="width:58%;height:auto;" oncellendedit="changeProdReve" dataField="productReves" ondrawsummarycell="drawSum" showSummaryRow="true" 
			            url="com.primeton.mis.contract.productReve.queryProductReve.biz.ext" showPager="false" allowCellEdit="true" allowCellSelect="true" multiSelect="true" editNextOnEnterKey="true">			            
			            <div property="columns">
			            	<div type="checkcolumn"></div>
			                <div field="contnum" width="80" headerAlign="center" align="center">合同编号</div>
			                <div field="reveno" width="60" headerAlign="center" align="center">收入次数</div>
			                <div field="prodname" displayField="prodtypename" width="180" headerAlign="center" >产品名称
			                    <input property="editor"  url="com.primeton.eos.ame_product.QuoProdType.getQuoProdTypeTree.biz.ext" style="width:200px;" class="nui-treeselect" 
			                    textField="prodtypename" valueField="prodtypeid" parentField="parenttypeid" dataField="quoProdtypes" showTreeIcon="true" valueFromSelect="true"
								showNullItem="true" multiSelect="false" expandOnLoad="true" showFolderCheckBox="true" onbeforenodeselect="beforenodeselect" allowInput="true"/>
			                </div>
			                <div field="prodrevetype"  width="80" align="center"headerAlign="center" renderer="getReveProdtype">收入产品类型
			                	<input property="editor" class="nui-dictcombobox" dictTypeId="REVE_PRODTYPE" onvaluechanged="selectProdtype(e)"/>
			                </div>
			                <div field="contsum" dataType="currency" width="70" align="right" headerAlign="center" summaryType="sum">参与分成合同额
			                	<input property="editor" class="nui-textbox" vtype="float" inputStyle="text-align: right" />
			                </div>
			                <div field="tax" dataType="currency" width="70" align="right" headerAlign="center" summaryType="sum">税金
			                	<input property="editor" class="nui-textbox" vtype="float" inputStyle="text-align: right" allowInput="false"/>
			                </div>
			                <div field="productrate" dataType="currency" width="80" align="right" headerAlign="center">产品税率
			                	<input property="editor" class="nui-textbox" vtype="float" inputStyle="text-align: right" />
			                </div>
			                <div field="contsum2" dataType="currency" width="70" align="right" headerAlign="center" summaryType="sum">不含税合同额
			                </div>
			                <div field="pratio" dataType="currency" width="70" align="right" headerAlign="center">分成比例
			                	<input property="editor" class="nui-textbox" vtype="float" inputstyle="text-align: right;"/>
			                </div>
			                <div field="pratiomon" dataType="currency" width="70" align="right" headerAlign="center" summaryType="sum">分成金额
			                	<input property="editor" class="nui-textbox" vtype="float" inputstyle="text-align: right;"/>
			                </div>
			            </div>
			        </div>
		        </fieldset>
			</div>
			<div style="text-align:center;padding:10px;border-width:1px 0px 0px 0px;" class="nui-toolbar">
		    	<a class="nui-button" onclick="onOk()" id="okbutton" style="width:130px;">保存预估与分成记录</a>
		    	<a class="nui-button" onclick="onCancel" style="width:60px;">关闭</a>
			</div> 
		</div>
		<div title="合同订单处理" id="tab_csContOrder" name="tab_csContOrder">
			<div class="nui-fit">
				<fieldset id="csContOrder_fieldset" style="border:solid 1px #aaa;padding:3px;width: 1173px;">
		            <legend>合同订单处理</legend>
			    	<div style="width:70px;">
				        <div class="nui-toolbar" style="border-bottom:0;padding:0px;">
				            <table style="width:100%;">
				                <tr>
				                    <td style="width:100%;">
				                        <a class="nui-button" iconCls="icon-add" onclick="addRow('csContOrder_grid')" plain="true">增加</a>
				                    </td>
				                </tr>
				            </table>           
				        </div>
				    </div>
		            <div id="csContOrder_grid" class="nui-datagrid" style="width:100%;height:auto;" dataField="csContOrders"
			            showPager="false" allowCellEdit="true" allowCellSelect="true" multiSelect="true" editNextOnEnterKey="true"
			            url="com.primeton.mis.contract.contract.getCsContOrder.biz.ext" oncellendedit="doSumfee" oncellbeginedit="editOrder">			            
			            <div property="columns">
			            	<div type="checkcolumn"></div>
			            	<!-- 订单编号 -->
			                <div field="contorderno" width="100" headerAlign="center" align="center">订单编号
			                	<input property="editor" class="nui-textbox" id="contorderno"/>
			                </div>
			                <div field="orderreg" width="100" headerAlign="center" align="left" dateFormate="yyyy-MM-dd" renderer="onDealDate"  >订单登记日期
			                	<input property="editor" class="nui-datepicker"/>
			                </div>
			                <div field="orderdate" width="100" headerAlign="center" dateFormate="yyyy-MM-dd" align="left" renderer="onDealDate">订单签订日期
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
			                </div>
			                <!-- 分包金额 -->
			                <div field="servsubmon" dataType="currency" width="120" headerAlign="center" align="right">订单采购1
			                	<input property="editor" class="nui-textbox" vtype="float" inputStyle="text-align: right;"/>
			                </div>
			                <!-- 分成金额 -->
			                <div field="othmon" dataType="currency" width="120" headerAlign="center" align="right">订单采购2
			                	<input property="editor" class="nui-textbox" vtype="float" inputStyle="text-align: right;"/>
			                </div>
			                <div field="memo" width="150" headerAlign="center" align="left">备注说明
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
		            <div id="csContType_grid" class="nui-datagrid" style="width:100%;height:auto;" dataField="contTypes" 
		            	showPager="false" allowCellEdit="true" allowCellSelect="true" multiSelect="true" 
		            	editNextOnEnterKey="true"  url="com.primeton.mis.contract.contract.getContType.biz.ext" 
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
			</div>
			<div style="text-align:center;padding:10px;border-width:1px 0px 0px 0px;" class="nui-toolbar">
		    	<a class="nui-button" onclick="onOk()" id="okbutton" style="width:80px;">保存订单</a>
		    	<a class="nui-button" onclick="onCancel" style="width:60px;">关闭</a>
			</div> 
		</div>
		<div title="产品与服务">
			<div class="nui-fit">
			<form id="ipoform" method="post" >
		        <input name="cscontract.contractid" id="conId" class="nui-hidden" />
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
		            	editNextOnEnterKey="true"  url="com.primeton.mis.contract.contract.getContLicense.biz.ext" 
		            	oncellendedit="doContLicsum"  showSummaryRow="true" ondrawsummarycell="drawSum">			            
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
				<fieldset style="border:solid 1px #aaa;padding:3px;">
					<legend>IPO合同修改关键信息</legend>
					<div style="padding:5px;">
			            <table style="table-layout:fixed;" id="table_file">
			                <tr><!-- 3、如果收入类型仅为MA（注意：不是包含MA），仅显示合同存档编号、收入类型、合同签定日期、MA服务开始日期和MA服务结束日期，其他的全部隐藏 -->
			                    <td style="width:110px;" align="right" id="ipo_contnum">合同存档编号：</td>
			                    <td style="width:150px;" id="ipo_contnum1">
			                        <input class="nui-textbox" name="cscontract.contnum" id="contnum" readonly="readonly"/>
			                    </td>
			                    <td style="width:110px;" align="right" id="ipo_incometype">收入类型：</td>
			                    <td style="width:150px;" id="ipo_incometype1">
			                        <input class="mini-dictcombobox" name="cscontract.incometype" id="incometype_ipo" dictTypeId="MIS_HTINCOMETYPE" multiSelect="true" readonly="readonly"/>
			                    </td>
			                    <td style="width:110px;" align="right" id="ipo_signdate">合同签署日期：</td>
			                    <td style="width:150px;" id="ipo_signdate1">
			                        <input class="nui-datepicker" name="cscontract.signdate" id="signdate_ipo"/>
			                    </td>
			                    <td style="width:110px;" align="right" id="ipo_salemode">销售模式：</td>
			                    <td style="width:150px;" id="ipo_salemode1">
			                        <input class="mini-dictcombobox" name="cscontract.salemode" id="salemode_ipo" dictTypeId="MIS_SALEMODE" showNullItem="true"/>
			                    </td>
			                </tr>
			                <tr>
			                	<td style="width:110px;" align="right" id="ipo_servnumtype">服务数量类型：</td>
			                    <td style="width:150px;" id="ipo_servnumtype1">
			                        <input class="mini-dictcombobox" name="cscontract.servnumtype" id="servnumtype_ipo" dictTypeId="SERV_NUM_TYPE" />
			                    </td>
			                    <td style="width:110px;" align="right" id="ipo_servnum">服务数量：</td>
			                    <td style="width:150px;" id="ipo_servnum1">
			                    	<input name="cscontract.servnum" id="servnum_ipo" class="nui-spinner" changeOnMousewheel="false" format="n2" showbutton="false" minValue="-100000000" maxValue="100000000"/>
			                    </td>
				                <td style="width:110px;" align="right" id="ipo_zsservtype">赠送服务数量类型：</td>
			                    <td style="width:150px;" id="ipo_zsservtype1">    
			                        <input class="mini-dictcombobox" name="cscontract.zsservtype" id="zsservtype_ipo" dictTypeId="SERV_NUM_TYPE"/>
			                    </td>
			                    <td style="width:110px;" align="right" id="ipo_zsservnum">赠送服务数量：</td>
			                    <td style="width:150px;" id="ipo_zsservnum1">    
			                        <input class="nui-textbox" name="cscontract.zsservnum" id="zsservnum_ipo" vtype="float"/>
			                    </td>
			                </tr>
			                <tr>
			                    <td style="width:110px;" align="right" id="ipo_projstartdate">项目开始日期：</td>
			                    <td style="width:150px;" id="ipo_projstartdate1">
			                        <input class="nui-datepicker" name="cscontract.projstartdate" id="projstartdate_ipo"/>
			                    </td>
			                    <td style="width:110px;" align="right" id="ipo_projenddate">项目结束日期：</td>
			                    <td style="width:150px;" id="ipo_projenddate1">
			                        <input class="nui-datepicker" name="cscontract.projenddate" id="projenddate_ipo"/>
			                    </td>
			                    <td style="width:110px;" align="right" id="ipo_servstartdate">MA服务开始日期：</td>
			                    <td style="width:150px;" id="ipo_servstartdate1">
			                        <input class="nui-datepicker" name="cscontract.servstartdate" id="servstartdate_ipo"/>
			                    </td>
			                    <td style="width:110px;" align="right" id="ipo_servenddate">MA服务结束日期：</td>
			                    <td style="width:150px;" id="ipo_servenddate1">
			                        <input class="nui-datepicker" name="cscontract.servenddate" id="servenddate_ipo" />
			                    </td>
			                </tr>
			            </table>
			        </div>
				</fieldset>
		        </form>
				<fieldset style="width:1360px;border:solid 1px #aaa;padding:3px;">
		            <legend>合同销售人员</legend>
		            <div style="padding:5px;">
			        	<div id="ipo_sales_grid" class="nui-datagrid" style="width:1350px;height:auto;" allowResize="true" 
					        url="com.primeton.mis.contract.contract.querySalesByContractid.biz.ext" 
					        onshowrowdetail="onShowIPORowDetail" showPager="false" allowCellEdit="true" allowCellSelect="true" multiSelect="true" editNextOnEnterKey="true">			        
					        <div property="columns">            
					            <div type="expandcolumn">#</div>
					            <div field="oldsalename" width="75" headerAlign="center">原销售姓名</div>
					            <div field="saleid" width="45" headerAlign="center" >销售ID</div>
					            <div field="salename" width="55" headerAlign="center" >销售姓名</div>
					            <div field="orgid" width="0" headerAlign="center" >销售所在部门ID</div>
					            <div field="orgname" width="80" headerAlign="center">销售所在部门</div>
					            <div field="org" width="95" headerAlign="center" renderer="onGenderRenderer">销售所属事业部</div>
					            <div field="techdirector" width="0" headerAlign="center" >技术负责人ID</div>
					            <div field="techdirectorname" width="70" headerAlign="center" >技术负责人</div>
					            <div field="techorg" width="0" headerAlign="center" >技术负责部门ID</div>
					            <div field="techorgname" width="90" headerAlign="center" >技术负责部门</div>
					            <div field="contsum" dataType="currency" width="100" headerAlign="center" align="right" >合同总金额</div>
					            <div field="prodmon" dataType="currency" width="80" headerAlign="center" align="right" >产品金额</div>
					            <div field="prodwbmon" dataType="currency" width="80" headerAlign="center" align="right" >产品维保金额</div>
					            <div field="servjsmon" dataType="currency" width="80" headerAlign="center" align="right" >技术服务金额</div>
					            <div field="servmon" dataType="currency" width="90" headerAlign="center" align="right" >服务总金额</div>
					            <div field="servsubmon" dataType="currency" width="80" headerAlign="center" align="right" >服务采购1</div>
					            <div field="othmon" dataType="currency" width="80" headerAlign="center" align="right" >服务采购2</div>
					            <div field="netservmon" dataType="currency" width="80" headerAlign="center" align="right" >服务净额</div>
					            <div field="contpolmon" dataType="currency" width="80" headerAlign="center" align="right" >合同净额</div>
					        </div>
					    </div>
					    <div id="ipo_detailGrid_Form" style="display:none;">
					        <div id="ipo_product_grid" class="nui-datagrid" style="width:100%;height:auto;" oncellendedit="doIPOproduct"
					            url="com.primeton.mis.contract.contract.queryProdsBySaleid.biz.ext" showPager="false" allowCellEdit="true" allowCellSelect="true" multiSelect="true" editNextOnEnterKey="true">			            
					            <div property="columns">
					                <div field="prodname" displayField="prodtypename" width="210" headerAlign="center">产品名称</div>
					                <div field="price" dataType="currency" width="100" align="right" headerAlign="center" cellCls="myIndex">产品单价
					                	<input property="editor" class="nui-textbox" vtype="float" inputstyle="text-align: right;"/>
					                </div>
					                <div field="prodnumtype" width="100" align="center" headerAlign="center" renderer="dictProdUnit" cellCls="myIndex">产品数量单位
					                	<input property="editor" class="nui-dictCombobox" dictTypeId="CS_PROD_UNIT" showNullItem="true"/>
					                </div>
					                <div field="prodnum" width="100" align="right" headerAlign="center" cellCls="myIndex">产品数量
					                	<input property="editor" class="nui-spinner" changeOnMousewheel="false"  inputstyle="text-align: right;" format="n2" showbutton="false" minValue="-100000000" maxValue="100000000"/>
					                </div>
					                <div field="prodmon" dataType="currency" width="100" align="right" headerAlign="center">产品金额</div>
					                <div field="prodsubmon" dataType="currency" width="90" align="right" headerAlign="center">产品采购1</div>
					                <div field="othmon" dataType="currency" width="90" align="right" headerAlign="center">产品采购2</div>
					                <div field="netprodmon" dataType="currency" width="90" align="right" headerAlign="center">产品净额</div>
					                <div field="prodwbmon" dataType="currency" width="90" align="right" headerAlign="center">产品维保金额</div>
					                <div field="prodwbsubmon" dataType="currency" width="90" align="right" headerAlign="center">产品维保分包费</div>
					                <div field="prodwbothmon" dataType="currency" width="90" align="right" headerAlign="center">产品维保服务费</div>
					                <div field="prodwbnetmon" dataType="currency" width="90" align="right" headerAlign="center">产品维保净额</div>
					                <div field="buyprod" width="80" align="left" headerAlign="center">说明</div>
					            </div>
					        </div>    
					    </div>
		            </div>
		        </fieldset>
        </div>
			<div style="text-align:center;padding:10px;border-width:1px 0px 0px 0px;" class="nui-toolbar">
		    	<a class="nui-button" onclick="onOk()" id="okbutton" style="width:120px;">保存产品与服务</a>
		    	<a class="nui-button" onclick="onCancel" style="width:60px;">关闭</a>
			</div> 
		</div>
	</div>
</body>
<script type="text/javascript">
    nui.parse();
    var updateURL = "com.primeton.mis.contract.contract.updateContract1.biz.ext";
    var form = new nui.Form("#form1");
    var ipoform = new nui.Form("#ipoform");
    var body_tab  = nui.get("body_tab");
	//上传文件
	/* var sf = new SWFFileUpload({
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
	}); */
  /*   function startUpload(succ){
		sf.startUpload(function(e){
			if(succ){
				succ();
			}
		},function(){
			nui.alert('文件上传失败！');
		});
	} */
	
    
	var sales_grid = nui.get("sales_grid");//销售人员对应的grid的增加、删除方法
	var ipo_sales_grid = nui.get("ipo_sales_grid");//ipo销售人员对应的grid的增加、删除方法
	var product_grid = nui.get("product_grid");//销售人员对应产品的grid的增加、删除方法
	var ipo_product_grid = nui.get("ipo_product_grid");//ipo销售人员对应产品的grid的增加、删除方法
	var csReveForecast_grid = nui.get("csReveForecast_grid");//合同收入预测
	var csContOrder_grid = nui.get("csContOrder_grid");//合同订单处理
	var csGatherFc_grid = nui.get("csGatherFc_grid");//合同收款
	var product_reve_grid = nui.get("product_reve_grid");//产品分成
	var csContBack_grid = nui.get("csContBack_grid");//合同保函
	var csContDep_grid = nui.get("csContDep_grid");//合同保证金
	var csContType_grid = nui.get("csContType_grid");//合同业务分类
	var csContLicense_grid = nui.get("csContLicense_grid");//合同授权清单
	var  productrate  = parseFloat(nui.getDictText('AME_SYSCONF','PRODUCTRATE'));//产品税率
	var  servicerate  = parseFloat(nui.getDictText('AME_SYSCONF','SERVICERATE'));//服务税率
	var  marate  = parseFloat(nui.getDictText('AME_SYSCONF','MARATE'))//MA税率
	
	//页面进入时调用的方法
	var doaction;
    function SetData(data){
        //跨页面传递的数据对象，克隆后才可以安全使用
        data = nui.clone(data);
        nui.ajax({
            url: "com.primeton.mis.contract.contract.getContract.biz.ext",
			type: 'POST',
			data: {contractid:data.contractid},	
			contentType: 'text/json',
            success: function (o) {
                form.setData(o);
                editor1.html(o.cscontract.paycondition);
                //form.setChanged(false);
                if(o.cscontract.misCustinfo){//是否存在客户信息，赋值签署单位
                	nui.get("custid").setText(o.cscontract.misCustinfo.custname);
                	nui.get("custname").setValue(o.cscontract.misCustinfo.custname);
                	if(o.cscontract.misCustinfo.groupname){
                		nui.get("groupno").setValue(o.cscontract.misCustinfo.groupname);
                	}
                }
                //加载附件设置参数
        		nui.get("grid_0").load({"groupid":"CS_CONTRACT","relationid": o.cscontract.contractid});
        		nui.get("grid_3").load({"groupid":"CS_CONT_BACK","relationid": o.cscontract.contractid});
        		nui.get("grid_1").load({"groupid":"CS_CONT_DEP","relationid": o.cscontract.contractid});
                //如果不是OEM和框架合同就需要设置合同订单主键
                if(o.cscontract.contracttype != "04" && o.cscontract.contracttype !="30"){
                    nui.get("contorderid").setValue(o.cscontract.csContOrder.contorderid);
                }
                nui.get("userid").setText(o.cscontract.username);//最终用户
                nui.get("contnum_old").setValue(o.cscontract.contnum);
                //var tempSrc = "";
               // for(var i=0;i<o.cscontract.files.length;i++){//合同附件
                //	tempSrc += "<a href='com.primeton.components.web.fileupload.getfile.flow?fileId=" + o.cscontract.files[i].fileId + "'>" + o.cscontract.files[i].fileName + "</a>&nbsp;&nbsp;&nbsp;&nbsp;<a class='mini-button' iconCls='icon-remove' onclick='doDelete(" + o.cscontract.files[i].fileId + ")'></a>,";
                //}
              // 	document.getElementById("uploadedFile").innerHTML = tempSrc;
               	nui.parse();//重新初始化样式
				var contracttype = o.cscontract.contracttype;
				//编辑的时候隐藏最初预计确认年月和最初预计确认旬度
            	csReveForecast_grid.hideColumn(csReveForecast_grid.getColumn(6));
            	csReveForecast_grid.hideColumn(csReveForecast_grid.getColumn(7));
            	//编辑的时候隐藏合同收款的最初预计确认年月
            	csGatherFc_grid.hideColumn(csGatherFc_grid.getColumn(4));
		    	
				if(contracttype == "01" || contracttype == "04" || contracttype == "20"
					||contracttype == "08" || contracttype == "10"){//产品合同、混合合同//服务合同
					$(".temp2").hide();
				}else{//框架协议
					$(".temp2").css({
						"display":""
					})
				}
				sales_grid.load({ contractid: data.contractid },function(){
					ipo_sales_grid.load({ contractid: data.contractid },function(){
						//合同收入预测
						csReveForecast_grid.sortBy("reveno","asc");
						csReveForecast_grid.load({csReveForecast: {contnum: o.cscontract.contnum}},function(){
							//产品分成
							product_reve_grid.sortBy("reveid","asc");
							product_reve_grid.load({contnum: o.cscontract.contnum},function(){
								//合同收款
								csGatherFc_grid.sortBy("gatherno","asc");
								csGatherFc_grid.load({csGatherFc: {contnum: o.cscontract.contnum}},function(){
									//合同保函
									csContBack_grid.load({contractid: o.cscontract.contractid,type:"1"},function(){
										//合同保证金
										csContDep_grid.load({contractid: o.cscontract.contractid,type:"2"},function(){
											//合同产品授权
											csContLicense_grid.sortBy("contlicid","asc");
											csContLicense_grid.load({contnum: o.cscontract.contnum},function(){
												//合同订单处理
												csContOrder_grid.load({contractid:o.cscontract.contractid},function(){
													csContType_grid.load({contnum: o.cscontract.contnum});
												});
											});
										});
									});
								});
							});
						});
					});
				});
				
				
		    	body_tab.setActiveIndex(0);
				//ipo的tab页面调用
				ipoform.setData(o);
				var incometype = o.cscontract.incometype;
				if(incometype){
					//如果收入类型仅为MA（注意：不是包含MA'04'），仅显示合同存档编号、收入类型、合同签定日期、MA服务开始日期和MA服务结束日期，其他的全部隐藏
					if(incometype == "04"){
						$("#ipo_salemode").hide();
						$("#ipo_servnumtype").hide();
						$("#ipo_servnum").hide();
						$("#ipo_zsservtype").hide();
						$("#ipo_zsservnum").hide();
						$("#ipo_projstartdate").hide();
						$("#ipo_projenddate").hide();
						
						$("#ipo_salemode1").hide();
						$("#ipo_servnumtype1").hide();
						$("#ipo_servnum1").hide();
						$("#ipo_zsservtype1").hide();
						$("#ipo_zsservnum1").hide();
						$("#ipo_projstartdate1").hide();
						$("#ipo_projenddate1").hide();
					}
				    //34、如果收入类型仅为人月\人天合同（注意：不是包含），项目开始日期、项目结束日期、MA服务开始日期、MA服务结束日期隐藏 
				   if(incometype=="05"){
				   		$("#ipo_projstartdate").hide();
				   		$("#ipo_projenddate").hide();
				   		$("#ipo_servstartdate").hide();
				   		$("#ipo_servenddate").hide();
				   		
				   		$("#ipo_projstartdate1").hide();
				   		$("#ipo_projenddate1").hide();
				   		$("#ipo_servstartdate1").hide();
				   		$("#ipo_servenddate1").hide();
				   }
					//收入类型包含定制项目(06)的带出项目开始日期
					if(incometype.indexOf("06")!=-1){
						//项目开始日期(采购结转对应的最小日期)、项目结束日期(定制项目第一次确认收入日期)
						var json = {contnum:o.cscontract.contnum,contractid:o.cscontract.contractid};
						nui.ajax({
			                url: "com.primeton.mis.contract.contract.getContProjStartAndEndDate.biz.ext",
							type: 'POST',
							data: json,	
							contentType: 'text/json',
			                success: function (o) {
			                	var o=nui.decode(o);
			                	if(o.projStartDate.projStartDate!=null){
				                	nui.get("projstartdate_ipo").setValue(o.projStartDate.projStartDate);
			                	}
			                	if(o.projEndDate!=null){
				                	nui.get("projenddate_ipo").setValue(o.projEndDate.projEndDate);
			                	}
			                }
			            });
					}
				}
            }
        });
	}
	
	//选择产品时不允许选择非产品项
	function beforenodeselect(e){
        if (e.isLeaf == false) {
        	e.cancel = true;
        }
	}
	
	//附件下载
    function getfiledetail(e){
        var uid = e.record._uid;
        var groupId = e.record.groupId;
    	return "<a href='javascript:void(0)' type='"+groupId+"' uid='"+uid+"' onclick='checkfiledetail(this);' title='点击查看'>" + e.value + "</a>";
    }
    
     //查看附件详情
    function checkfiledetail(obj){
    	var groupId = $(obj).attr("type");
    	var uid = $(obj).attr("uid");
    	if(groupId == "CS_CONT_BACK"){
    		var grid = nui.get("grid_3");
    	}else{
    		var grid = nui.get("grid_1");
    	}
    	var selectRow = grid.getSelected();
    	var url="com.primeton.components.web.fileupload.getfile.flow?fileId="+selectRow.fileId;
		window.open(url, '_self');
    } 
    
	//合同保函保证金附件删除
    function deleteContractFile(e){
        var uid =  e.record._uid;
        var groupId =  e.record.groupId;
    	return "<a href='javascript:void(0)' type='"+groupId+"' uid='"+uid+"' onclick='deleteContBackDepFile(this)'>删除</a>";
    }
    
    //附件删除
    function deleteContBackDepFile(obj){
    	var groupId = $(obj).attr("type");
    	var uid = $(obj).attr("uid");
    	if(groupId == "CS_CONT_BACK"){
    		var grid = nui.get("grid_3");
    	}else{
    		var grid = nui.get("grid_1");
    	}
    	var row = grid.getRowByUID(uid);  //获取所有选中的行对象
        var data = {files:row};
	    var json = nui.encode(data); 
    	if (confirm("确定删除此附件信息？")) {
            grid.loading("操作中，请稍后......");
            nui.ajax({
                url: "com.primeton.eos.ame_common.file.deletefiles.biz.ext",
                type: "post",
                data: json, 
                cache: false,
                contentType: 'text/json',
                success: function (text) {
                	grid.reload();
                },
                error: function () {
                }
           });
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
	
	//收入产品类型改变时触发时间
	function selectProdtype(e){
		var grid = nui.get("product_reve_grid");
		var row = grid.getSelected();
		var rowData = {};
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
    	var newRow ={};        
        if(gridid == "csReveForecast_grid"){
	        if(contracttype == "04" || contracttype == "30"){//OEM合同、框架协议
		    	newRow = { name: "New Row",status: "0",contorderno:contnum };
	    	}else{
		    	newRow = { name: "New Row",status: "0", };
	    	}
        }else if(gridid == "csContBack_grid"){
        	//合同保函新增行：状态默认为履行中,类型为保函
        	newRow = { name: "New Row",type:"1",status: "0" };
        }else if(gridid == "csContDep_grid"){
        	//合同保证金新增行：状态默认为履行中,类型为保证金
        	newRow = { name: "New Row",type:"2",status: "0" };
        }else if(gridid == "csGatherFc_grid"){
        	//合同收款新增行：状态默认为未收款
        	newRow = { name: "New Row",status: "0" };
        }else if(gridid == "csContLicense_grid"){
        	//合同产品授权新增行
        	newRow = { name: "New Row",contnum:contnum};
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
        }else if(gridid == "product_reve_grid"){
			var datas=product_grid.getData();
			var csReveForecasts = csReveForecast_grid.getData();
	        var csReve = csReveForecast_grid.getSelecteds();
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
			var json = nui.encode({});
			var urL="com.primeton.mis.contract.contract.getPratio.biz.ext";
			nui.ajax({
	            url: urL,
	            data: json,
	            type: 'POST',
	            cache: false,
	            contentType: 'text/json',
	            async:false,
	            success: function (text) {
	            	var pratio = text.parameters;
	            	for(var p=0;p<csReve.length;p++){
	            		var reveno = csReve[p].reveno;
	            		newRow = { name: "New Row","reveno":reveno,"contnum":contnum,"productrate":productrate,"pratio":pratio};
	            		grid.addRow(newRow, 0);
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
        if(gridid != "product_reve_grid"){
	        grid.addRow(newRow, 0);
        }
    }
    
    function removeRow(gridid) {
        var grid = nui.get(gridid);
        var rows = grid.getSelecteds();
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
        if (rows.length > 0) {
        	//收入预测确认记录状态为已确认和收入确认流程中不能删除
	    	if(gridid == "csReveForecast_grid"){
	    		for(var i = 0;i < rows.length;i ++){
	    			if(rows[i].name != "New Row"){
		    			if(rows[i].status == "2" || rows[i].status == "3"){
		    				nui.alert("状态为已确认和收入确认流程中不能删除");
		    				return;
		    			}else{
		    				grid.removeRows(rows, false);
        					doCal();
		    			}
	    			}else{
	    				grid.removeRows(rows, false);
	        			doCal();
	    			}
	    		}
	    	}
	    	grid.removeRows(rows, false);
	        doCal();
	    	if(gridid == "product_grid"){
				var row = sales_grid.getSelected();
		        var datas=product_grid.getData();
		        console.log(datas);
				sales_grid.updateRow(row,{saleProds:datas});
	    	}
        }else{
        	nui.alert("请选中一条记录！");
        }
    }
    //销售人员点开对应的产品子grid时的方法
    var detailGrid_Form = document.getElementById("detailGrid_Form");        
	var currentRow=null;
	function onShowRowDetail(e) {
        var grid = e.sender;
        var row = e.record;            
    	var datas=product_grid.getData();
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
	
	
    //ipo销售人员点开对应的产品子grid时的方法
    var ipo_detailGrid_Form = document.getElementById("ipo_detailGrid_Form");        
	var ipocurrentRow=null;
	function onShowIPORowDetail(e) {
        var grid = e.sender;
        var row = e.record;            
    	var datas=ipo_product_grid.getData();
        if(ipocurrentRow){//如果有当前行
        	var datas=ipo_product_grid.getData();
        	ipocurrentRow.saleProds=datas;
        }
		ipocurrentRow=row;		
        var td = grid.getRowDetailCellEl(row);
        td.appendChild(ipo_detailGrid_Form);            
        var saleProds = row.saleProds;
        if(saleProds){
            saleProds = nui.decode(saleProds);
            ipo_product_grid.setData(saleProds);
        }else{
			ipo_product_grid.setData({});
			row.saleProds = {};
		}
		$('#ipo_detailGrid_Form').show();
	}
	
    //确认年月格式
    function onGenderYearMonth(e){
    	return e.value;
    	/* var month = e.value.substr(5,6);
    	if(e.value.substr(5,6) < 10){
    		month = 0 + "" + e.value.substr(5,6);
    	}
    	return e.value.substr(0,4)+"-"+month; */
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
        if ( btnEdit.name=="cscontract.misCustinfo.custid" || btnEdit.name=="cscontract.userid" || btnEdit.name=="cscontract.receivercompid")
        lookupUrl = "/contract/contract/MisCustinfo_lookup.jsp";
        if (lookupUrl=="") return;
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
	
	//产品分成修改时触发
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
			if(row.tax){
				tax = row.tax;
			}
			if(row.productrate){
				productrate1 = parseFloat(row.productrate);
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
	
	//计算合同总金额、合同净额(编辑结束时发生、销售合同列表removeRow触发、计算产品时触发)
	function doCal(e){
		//同样有隐患(非外包结算流程类似，许青倩)
		var row = sales_grid.getSelected();
		if(row){ //removeRow触发时判断编辑的是不是合同销售人员列表
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
		var servjsmon1 = 0;//技术服务总金额
		var prodwbmon1 = 0;//产品维保总金额
		var sumsalename = "";
		var sumorg = "";
		for(var i=0;i<datas.length;i++){//如果合同销售列表有data就重新计算合同的金额 
			//销售的产品金额总和
			var prodmon = datas[i].prodmon;
			//销售的服务金额
			var servmon = datas[i].servmon;
			//销售的合同总金额
			var contsum = datas[i].contsum;
			//单个销售的合同净额
			var contpolmon = datas[i].contpolmon;
			//销售对应的产品
			var saleProdss = datas[i].saleProds;
			//技术服务金额
			var servjsmon = datas[i].servjsmon;
			//产品维保金额
			var prodwbmon = datas[i].prodwbmon;
			//服务采购1
			var a1 = datas[i].servsubmon;
			////服务采购2
			var a2 = datas[i].othmon;
			var salename = datas[i].salename;
			var org = datas[i].org;
			if(saleProdss){
				for(var k =0;k<saleProdss.length;k++){
					//产品采购1
					var b1 = saleProdss[k].prodsubmon;
					//产品采购2
					var b2 = saleProdss[k].othmon;
					if(b1){
						sumservsubmon += parseFloat(b1);
					}
					if(b2){
						sumothmon += parseFloat(b2);
					}
				}
			}
			if(a1){
				sumservsubmon += parseFloat(a1);
			}
			if(a2){
				sumothmon += parseFloat(a2);
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
		nui.get("servjsmon1").setValue(servjsmon1);
		nui.get("prodwbmon1").setValue(prodwbmon1);
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
		var row = product_grid.getSelected();
		//计算产品净额
		var prodmon = 0;
		var prodsubmon = 0;
		var othmon = 0;
		var prodwbmon = 0;
		var prodwbsubmon = 0;
		var prodwbothmon = 0;
		var prodnum =0;
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
		if(row.prodnum != null && !isNaN(row.prodnum)){
			prodnum = row.prodnum;
			if(isDot(prodnum)==true){
				nui.alert("请输入整数！");
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
		//get父datagrid不能获取到子datagrid的值，需要重新赋值（之前有值是因为，初始化页面放进去的）
		var datas=product_grid.getData();
		sales_grid.updateRow(row,{saleProds:datas});
	}
	
	//判断是否含有 “.”
	function isDot(num) {
	    var result = (num.toString()).indexOf(".");
	    if(result != -1) {
	       return true;
	    } else {
	       return false;
	    }
	}

    
    
    
   
    //校验数据
	function onOk(){
		var text = editor1.html();
		nui.get("paycondition").setValue(text);
    	var tab = body_tab.getActiveTab();
    	var msg=null;
		if(tab.title == "合同信息"){//合同基本信息
    		if(!form.validate()){
	    		nui.alert("信息录入不完整！");
	        	return;
	        }
	        var filePaths = document.getElementsByName("uploadfile").length;
	    	for(var j = 0;j < filePaths;j++){
	    		var a = document.getElementsByName("remarkList")[j].value;
	    		if(a == null || a == ""){
	    			nui.alert("新增附件不可以为空");
	    			return false;
	    		}
	    	}
	        if(nui.get("contracttype").getValue() == "30" && nui.get("ispt").getValue() == ""){
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
	        	//修改合同信息 ，预估金额要和执行合同金额相等
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
					if(sumPrice != contsumPrice){
						//保存合同时只提示校验金额信息。
						alert("收入预估的预计确认金额总和：" + sumPrice + "与执行合同金额：" + contsumPrice + "不相等！");
					}
				}
				
				//合同订单校验处理
		        var contracttype = nui.get("contracttype").getValue();
		    	var contsum = nui.get("contsum").getValue();
		    	var countRows = 0;
		        if(contracttype == "04" || contracttype == "30"){
		        	//取得所有的数据，验证订单总金额是否等于合同总金额
		        	var csContOrderRowsAll = csContOrder_grid.getData();
		        	//合同执行总金额
		        	if(csContOrderRowsAll){
			        	for(var i = 0;i < csContOrderRowsAll.length;i ++){
			        		csContOrderRowsAll[i].ordermon = parseFloat(csContOrderRowsAll[i].ordermon);
		    	    		countRows += csContOrderRowsAll[i].ordermon;
		        		}
		        	}
		    		countRows = parseFloat(countRows).toFixed(2);
		        	contsum = parseFloat(contsum).toFixed(2);
		        	if(countRows != contsum){
		        		nui.alert("合同订单金额总和为：" + countRows +"与合同执行总金额：" + contsum + "不相等！");
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
		                		if(confirm("确认保存？")){
									nui.get("okbutton").disable();
							document.getElementById("fileCatalog").value="CsContract"; 
									form2.submit(); 
								
					    		}
		                	}
		                }
		            });
	        	}else{
	        		if(confirm("确认保存？")){
		        		nui.get("okbutton").disable();
				    	document.getElementById("fileCatalog").value="CsContract"; 
					        form2.submit(); 
						
	        		}
	        	}
	        }
    	}else if(tab.title == "合同销售人员"){//合同销售
    		var changedatas = sales_grid.getChanges();
    		if(changedatas.length<1){
    			nui.alert("没有修改的列！");
    			return;
    		}
    		if(nui.get("salename").getValue() == ""){
	        	nui.alert("请至少添加一个销售！","销售未添加");
	        	return;
	        }
	        var datas = sales_grid.getData();
        	var isHaveOrg = true;
        	var totalmon = 0;
        	for(var i=0;i<datas.length;i++){
				var org = datas[i].org;
				var mon = datas[i].contsum;
				totalmon += parseFloat(mon);
				if(org ==null || org == ""){
					isHaveOrg = false;
				}
        	}
        	if(isHaveOrg == false){
        		nui.alert("销售所属事业部必选！","销售所属事业部");
        		return;
        	}
        	//因为修改销售，会修改合同，所以在销售保存的页面加合同金额的校验，同事后台会重新保存这四个字段，刷新合同基本信息页面
        	var contsum = (nui.get("contsum").getValue() == null || nui.get("contsum").getValue() == "") ? 0:nui.get("contsum").getValue();
        	if(parseFloat(contsum).toFixed(2) != parseFloat(totalmon).toFixed(2)){
        		nui.alert("合同执行总金额不等于销售的合同总金额之和，请确认！");
        		return;
        	}
        	msg = checkConttype();//验证合同总金额是否等于合同业务分类数据之和
        	if(msg){
        	 	nui.alert(msg);
        	 	return;
        	}
        	if(confirm("确认保存？")){
	    		nui.get("okbutton").disable();
	    		SaveData();
    		}
	        	
    	}  else if(tab.title == "合同收款记录"){//收款
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
    		document.getElementById("fileCatalog1").value="CS_CONT_BACK";
			form4.submit();
    	
    	}else if(tab.title == "合同收入确认记录"){//收入确认
    		//收入预测记录
	        var csReveForecasts = csReveForecast_grid.getChanges();
	        var prodReves = product_reve_grid.getChanges();
	        if(csReveForecasts.length<=0&&prodReves.length<=0){
	        	nui.alert("没有修改的收入数据！");
	        	return;
	        }
    		for(var i = 0;i < csReveForecasts.length;i ++){
		        //收入确认次数不能为空
	        	if(!csReveForecasts[i].reveno){
	        		nui.alert("收入确认次数不能为空!");
	        		nui.get("okbutton").enable();
	        		return;
	        	}  
	        	if(!csReveForecasts[i].revetype){
	        		nui.alert("收入类型不能为空!");
	        		nui.get("okbutton").enable();
	        		return;
	        	}
	        	if(!csReveForecasts[i].contorderno){
	        		nui.alert("订单编号不能为空!");
	        		nui.get("okbutton").enable();
	        		return;
	        	}
        		//最新预计确认年月不能为空
	        	if(!csReveForecasts[i].newyearmonth){
	        		nui.alert("合同收入确认预估的预计确认年月不能为空!");
	        		nui.get("okbutton").enable();
	        		return;
	        	}
	        	//销售评估不能为空
	        	if(!csReveForecasts[i].saleseva){
	        		nui.alert("合同收入确认预估的销售评估不能为空!");
	        		nui.get("okbutton").enable();
	        		return;
	        	}
	        }
	        if(csReveForecasts==null){
	        	csReveForecasts=[{"prodReves":prodReves}];
	        }
	        if(confirm("确认保存？")){
	    		nui.get("okbutton").disable();
	    		SaveData();
    		}
    	}else if(tab.title == "合同订单处理"){//订单
        	var csContOrderRowsAll = csContOrder_grid.getChanges();
        	var csContTypeRowsAll = csContType_grid.getChanges();
    		if(csContOrderRowsAll.length<1 && csContTypeRowsAll.length<1){
        		nui.alert("没有修改的订单和业务分类，不能保存！");
        		return;
        	}
    		//合同订单校验处理
	        var contracttype = nui.get("contracttype").getValue();
	    	var contsum = nui.get("contsum").getValue();
	    	var servjsmon1 = 0;
	    	var prodwbmon1 = 0;
	    	var countRows = 0;
	    	var servjsmon11 = 0;
	    	var prodwbmon11 = 0;
        	//取得所有的数据，验证订单总金额是否等于合同总金额
        	var salesRowsAll = sales_grid.getData();
        	var csContOrderRowsAll = csContOrder_grid.getData();
        	//合同执行总金额
        	if(csContOrderRowsAll){
	        	for(var i = 0;i < csContOrderRowsAll.length;i ++){
	        		csContOrderRowsAll[i].ordermon = parseFloat(csContOrderRowsAll[i].ordermon);
	        		csContOrderRowsAll[i].servjsmon = parseFloat(csContOrderRowsAll[i].servjsmon);
	        		csContOrderRowsAll[i].prodwbmon = parseFloat(csContOrderRowsAll[i].prodwbmon);
    	    		countRows += csContOrderRowsAll[i].ordermon;
    	    		servjsmon11 += csContOrderRowsAll[i].servjsmon;
    	    		prodwbmon11 += csContOrderRowsAll[i].prodwbmon;
        		}
        	}
        	if(salesRowsAll){
	        	for(var i = 0;i < salesRowsAll.length;i ++){
	        		if(salesRowsAll[i].servjsmon!=null&&salesRowsAll[i].servjsmon!=""){
	        			salesRowsAll[i].servjsmon = parseFloat(salesRowsAll[i].servjsmon);
	        			servjsmon1 += salesRowsAll[i].servjsmon;
	        		}else{
	        			servjsmon1 += 0;
	        		}
	        		if(salesRowsAll[i].prodwbmon!=null&&salesRowsAll[i].prodwbmon!=""){
	        			salesRowsAll[i].prodwbmon = parseFloat(salesRowsAll[i].prodwbmon);
	        			prodwbmon1 += salesRowsAll[i].prodwbmon;
	        		}else{
	        			prodwbmon1 += 0;
	        		}
        		}
        	}
        	
        	servjsmon1 = parseFloat(servjsmon1).toFixed(2);
        	prodwbmon1 = parseFloat(prodwbmon1).toFixed(2);
        	servjsmon11 = parseFloat(servjsmon11).toFixed(2);
        	prodwbmon11 = parseFloat(prodwbmon11).toFixed(2);
    		countRows = parseFloat(countRows).toFixed(2);
        	contsum = parseFloat(contsum).toFixed(2);
        	if(prodwbmon11=="NaN"){
        		prodwbmon11 = parseFloat(0).toFixed(2);
        	}
        	if(servjsmon11=="NaN"){
        		servjsmon11 = parseFloat(0).toFixed(2);
        	}
        	if(countRows != contsum){
        		nui.alert("合同订单金额总和为：" + countRows +"与合同执行总金额：" + contsum + "不相等！");
        		nui.get("okbutton").enable();
        		return;
        	}
	    	msg = checkConttype();//验证合同总金额是否等于合同业务分类数据之和
	    	if(msg){
	    		nui.alert(msg);
	    		return;
	    	}
        	
        	if(servjsmon11 != servjsmon1){
        		if(confirm("订单中技术服务总金额:"+ servjsmon11 + "与合同的技术服务总金额:"+ servjsmon1 +"不相等！是否确认保存？")){
		    		nui.get("okbutton").disable();
		    		SaveData();
	    		}
        	}else if(prodwbmon11 != prodwbmon1){
        		if(confirm("订单中产品维保总金额:"+ prodwbmon11 +"与合同的产品维保总金额:"+ prodwbmon1 +"不相等！是否确认保存？")){
		    		nui.get("okbutton").disable();
		    		SaveData();
	    		}
        	}else{
        		if(confirm("确认保存？")){
		    		nui.get("okbutton").disable();
		    		SaveData();
	    		}
        	}
    	}else if(tab.title == "产品与服务"){ //ipo上市tab页面
    		if(confirm("确认保存？")){
	    		SaveData();
    		}
    	}
    }
    
    //验证合同分类与合同订单数据
    function checkConttype(){
    	var msg=null;
    	var contracttype = nui.get("contracttype").getValue();
        var contsum = (nui.get("contsum").getValue() == null || nui.get("contsum").getValue() == "") ? 0:nui.get("contsum").getValue();
    	var types = csContType_grid.getData();
    	var orders = csContOrder_grid.getData();
    	var typesummon=0;
    	var ordersummon=0;
    	if(types.length > 0){
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
						msg ="合同订单编号："+orders[i].contorderno+"的合同订单金额不等于合同业务分类数据之和，请确认！";
					}
    			}
    			if(parseFloat(contsum).toFixed(2) != parseFloat(ordersummon).toFixed(2)){
        			msg = "合同执行总金额不等于合同订单金额之和，请确认！";
    			}
    		}else{
        		msg = "请填写合同订单信息！";
    		}
    	}else{
    		msg = "请填写合同业务分类信息！";
    	}
    	return msg;
    }
    function SaveData1(){
    	document.getElementById("fileCatalog2").value="CS_CONT_DEP";
		form6.submit();
    }
    function SaveData2(){
    	var csGatherFcs = nui.clone(csGatherFc_grid.getChanges());
		//合同保函
		var csContBacks = nui.clone(csContBack_grid.getChanges());
		//合同保证金
		var csContDeps = nui.clone(csContDep_grid.getChanges());
		var  fileids1 =nui.get("fileids1").getValue();
		var  fileids2 =nui.get("fileids2").getValue();
		if(csGatherFcs.length<=0 && csContBacks.length <=0 && csContDeps.length<=0 && fileids1=="null" && fileids2=="null"){
			nui.alert("没有修改的数据！");
			return;
		}else{
			for(var i = 0; i < csGatherFcs.length; i ++){
	    		if(!csGatherFcs[i].newyearmonth){
	        		nui.alert("合同收款记录的预计收款年月不能为空!");
	        		nui.get("okbutton").enable();
	        		return;
	        	}
			}
			if(confirm("确认保存？")){
	    		nui.get("okbutton").disable();
	    		SaveData();
			}
		}
    }
    
    /*
      *声明，修改后的页面，都用getchanges，避免删除数据导致没有修改的数据出现问题--王林琼17/1/12
    */
    function SaveData(){
    	var tab = body_tab.getActiveTab();
		var o = form.getData();
		var productreves =product_reve_grid.getData();
    	if(tab.title == "合同信息"){//合同基本信息
	        var stat='2';
			var csReveForecasts = csReveForecast_grid.getData();
			for(var i=0;i<csReveForecasts.length;i++){
				var status = csReveForecasts[i].status;
				if(status=='0'){//待确认
					var revetypes = csReveForecasts[i].revetype;
					var types = revetypes.split(",");
		        	for(var p=0;p<types.length;p++){
		        		if(types[p]=='1'||types[p]=='5'){
		        			//待确认的收入中有人力或定制的收入类型
		        			stat='0';
		        		}
		        	}
				}
			}
			o.cscontract.stat=stat;
    		o.cscontract.type=1;
    	}else if(tab.title == "合同销售人员"){//合同销售页面，保存
	    	o.cscontract.type=2;
	        o.cscontract.sales = sales_grid.getData();
	        o.cscontract.csContTypes = csContType_grid.getChanges();
    	}else if(tab.title == "合同收款记录"){//合同收款记录，保存
	    	o.cscontract.type=3;
    		//合同收款
			o.cscontract.csGatherFcs = csGatherFc_grid.getChanges();//克隆的结果没有changes的状态信息
			//合同保函
			o.cscontract.csContBacks = csContBack_grid.getData();
			//合同保函
			o.cscontract.csContDeps = csContDep_grid.getData();
			//收款修改记录
			for(var i = 0; i < o.cscontract.csGatherFcs.length; i ++){
        		if(o.cscontract.csGatherFcs[i].newyearmonth){
	        		var newyear = "";
	        		var newmonth = "";
	        		if(typeof(o.cscontract.csGatherFcs[i].newyearmonth) == "string" && o.cscontract.csGatherFcs[i].newyearmonth.length == 7){
		        		newyear = o.cscontract.csGatherFcs[i].newyearmonth.substr(0,4);
		        		newmonth = o.cscontract.csGatherFcs[i].newyearmonth.substr(5,2);
		        	}else if(typeof(o.cscontract.csGatherFcs[i].newyearmonth) == "string" && o.cscontract.csGatherFcs[i].newyearmonth.length == 6){
		        		newyear = o.cscontract.csGatherFcs[i].newyearmonth.substr(0,4);
		        		newmonth = o.cscontract.csGatherFcs[i].newyearmonth.substr(4,2);
		        	}else{
	        			newyear = o.cscontract.csGatherFcs[i].newyearmonth.getFullYear();
	        			newmonth = o.cscontract.csGatherFcs[i].newyearmonth.getMonth() + 1;
	        			if(newmonth < 10){
	        				newmonth = "0" + newmonth;
	        			}else{
	        				newmonth = "" + newmonth;
	        			}
	        		}
	        		o.cscontract.csGatherFcs[i].newyearmonth = newyear + "" +  newmonth;
	        	}
			}
    	}else if(tab.title == "合同收入确认记录"){//收入确认
	    	o.cscontract.type=4;
	        //收入预测记录
			var thisrow = csReveForecast_grid.getSelected();
	        o.cscontract.csReveForecasts = csReveForecast_grid.getData();
	        o.cscontract.productReves = productreves;
    		for(var i = 0;i < o.cscontract.csReveForecasts.length;i ++){
        		var firstyear = "";
        		var firstmonth = "";
        		if(typeof(o.cscontract.csReveForecasts[i].newyearmonth) == "string" && o.cscontract.csReveForecasts[i].newyearmonth.length == 7){
        			firstyear = o.cscontract.csReveForecasts[i].newyearmonth.substr(0,4);
        			firstmonth = o.cscontract.csReveForecasts[i].newyearmonth.substr(5,2);
        		}else if(typeof(o.cscontract.csReveForecasts[i].newyearmonth) == "string" && o.cscontract.csReveForecasts[i].newyearmonth.length == 6){
        			firstyear = o.cscontract.csReveForecasts[i].newyearmonth.substr(0,4);
        			firstmonth = o.cscontract.csReveForecasts[i].newyearmonth.substr(4,2);
        		}else{
        			firstyear = o.cscontract.csReveForecasts[i].newyearmonth.getFullYear();
        			firstmonth = o.cscontract.csReveForecasts[i].newyearmonth.getMonth() + 1;
        			if(firstmonth < 10){
        				firstmonth = "0" + firstmonth;
        			}else{
        				firstmonth = "" + firstmonth;
        			}
        		}
        		o.cscontract.csReveForecasts[i].newyearmonth = firstyear + "" +  firstmonth;
        		//本次结算开始日期
        		if(o.cscontract.csReveForecasts[i].setstart){
        			var setstartyear = "";
	        		var setstartmonth = "";
	        		if(typeof(o.cscontract.csReveForecasts[i].setstart) == "string" && o.cscontract.csReveForecasts[i].setstart.length == 7){
	        			setstartyear = o.cscontract.csReveForecasts[i].setstart.substr(0,4);
	        			setstartmonth = o.cscontract.csReveForecasts[i].setstart.substr(5,2);
	        		}else if(typeof(o.cscontract.csReveForecasts[i].setstart) == "string" && o.cscontract.csReveForecasts[i].setstart.length == 6){
	        			setstartyear = o.cscontract.csReveForecasts[i].setstart.substr(0,4);
	        			setstartmonth = o.cscontract.csReveForecasts[i].setstart.substr(4,2);
	        		}else{
	        			setstartyear = o.cscontract.csReveForecasts[i].setstart.getFullYear();
	        			setstartmonth = o.cscontract.csReveForecasts[i].setstart.getMonth() + 1;
	        			if(setstartmonth < 10){
	        				setstartmonth = "0" + setstartmonth;
	        			}else{
	        				setstartmonth = "" + setstartmonth;
	        			}
	        		}
	        		o.cscontract.csReveForecasts[i].setstart = setstartyear + "" +  setstartmonth;
        		}
        		//本次结算结束日期
        		if(o.cscontract.csReveForecasts[i].setend){
        			var setendyear = "";
	        		var setendmonth = "";
	        		if(typeof(o.cscontract.csReveForecasts[i].setend) == "string" && o.cscontract.csReveForecasts[i].setend.length == 7){
	        			setendyear = o.cscontract.csReveForecasts[i].setend.substr(0,4);
	        			setendmonth = o.cscontract.csReveForecasts[i].setend.substr(5,2);
	        		}else if(typeof(o.cscontract.csReveForecasts[i].setend) == "string" && o.cscontract.csReveForecasts[i].setend.length == 6){
	        			setendyear = o.cscontract.csReveForecasts[i].setend.substr(0,4);
	        			setendmonth = o.cscontract.csReveForecasts[i].setend.substr(4,2);
	        		}else{
	        			setendyear = o.cscontract.csReveForecasts[i].setend.getFullYear();
	        			setendmonth = o.cscontract.csReveForecasts[i].setend.getMonth() + 1;
	        			if(setendmonth < 10){
	        				setendmonth = "0" + setendmonth;
	        			}else{
	        				setendmonth = "" + setendmonth;
	        			}
	        		}
	        		o.cscontract.csReveForecasts[i].setend = setendyear + "" +  setendmonth;
        		}
	        }
    	}else if(tab.title == "合同订单处理"){//合同订单
	    	o.cscontract.type=5;
        	//往后台传的数据changes
        	var csContOrderRows = csContOrder_grid.getChanges();
        	if(csContOrderRows){
        		for(var i=0;i<csContOrderRows.length;i++){
        			var prodwbmon = csContOrderRows[i].prodwbmon
        			if(isNaN(prodwbmon)){
        				csContOrderRows[i].prodwbmon=0;
        			}
        			var servjsmon = csContOrderRows[i].servjsmon
        			if(isNaN(servjsmon)){
        				csContOrderRows[i].servjsmon=0;
        			}
        		}
        	}
	    	o.cscontract.csContOrders = csContOrderRows;
	        o.cscontract.csContTypes = csContType_grid.getChanges();
    	}else if(tab.title == "产品与服务"){ //ipo上市tab页面
    		var ipoform = new nui.Form("#ipoform");
    		var o = ipoform.getData();
	    	o.cscontract.type=6;
        	//往后台传的数据changes
        	o.cscontract.sales = ipo_sales_grid.getData();
	        o.cscontract.csContLicenses = csContLicense_grid.getChanges();
    	}
    	//计算合同分成记录总金额
        var prodReveMon =0.00;
        if(productreves != null && productreves.length>0){
	        for(var j = 0;j < productreves.length;j++){
	        	prodReveMon = parseFloat(prodReveMon)+parseFloat(productreves[j].contsum);
	        }
        }
        o.cscontract.prodReveMon = prodReveMon;
        var json = nui.encode(o);
        form.loading("数据保存中...");
        nui.ajax({
            url: updateURL,
            data: json,
            type: 'POST',
            cache: false,
            contentType: 'text/json',
            success: function (text) {
            	form.unmask();
            	if(text.exception == '1'){
            		nui.alert("保存成功！");
        			if(tab.title == "合同销售人员"){
				    	sales_grid.reload();
			    	}else if(tab.title == "合同收款记录"){
			    		csGatherFc_grid.reload();
			    	}else if(tab.title == "合同收入确认记录"){
			    		csReveForecast_grid.reload();
			    	}else if(tab.title == "合同订单处理"){
			    		csContOrder_grid.reload();
			    	}else if(tab.title == "产品与服务"){
			    		//1、同步修改到后台基本信息页面。
			    		if(nui.get("signdate_ipo").getValue()!=""){
				    		nui.get("signdate").setValue(nui.get("signdate_ipo").getValue());
			    		}
			    		if(nui.get("servnumtype_ipo").getValue()!=""){
				    		nui.get("servnumtype").setValue(nui.get("servnumtype_ipo").getValue());
			    		}
			    		if(nui.get("servnum_ipo").getValue()!=null){
				    		nui.get("servnum").setValue(nui.get("servnum_ipo").getValue());
			    		}
			    		if(nui.get("incometype_ipo").getValue()!=""){	
				    		nui.get("incometype").setValue(nui.get("incometype_ipo").getValue());
			    		}
			    		if(nui.get("salemode_ipo").getValue()!=""){
				    		nui.get("salemode").setValue(nui.get("salemode_ipo").getValue());
			    		}
			    		if(nui.get("servstartdate_ipo").getValue()!=""){
				    		nui.get("servstartdate").setValue(nui.get("servstartdate_ipo").getValue());
			    		}
			    		if(nui.get("servenddate_ipo").getValue()!=""){
				    		nui.get("servenddate").setValue(nui.get("servenddate_ipo").getValue());
			    		}
			    		if(nui.get("zsservtype_ipo").getValue()!=""){
				    		nui.get("zsservtype").setValue(nui.get("zsservtype_ipo").getValue());
			    		}
			    		if(nui.get("zsservnum_ipo").getValue()!=""){
				    		nui.get("zsservnum").setValue(nui.get("zsservnum_ipo").getValue());
			    		}
			    		//2、reload
			    		ipo_sales_grid.reload();
			    		csContLicense_grid.reload();
			    	}
            	}else{
            		nui.alert("保存失败！");
            		nui.get("okbutton").enable();
            	}
            },
            error: function (jqXHR, textStatus, errorThrown) {
                nui.alert(jqXHR.responseText);
            }
        });
    }
    //SaveData()结束
    
	init();
	//新增/修改待签署合同decotract页面保存后打开页面
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
                    if(o.cscontract.misCustinfo){
                    	nui.get("custid").setText(o.cscontract.misCustinfo.custname);
                    	nui.get("custname").setValue(o.cscontract.misCustinfo.custname);
                    }
                   sales_grid.setData(o.data); 	     		
                }
            });
        }
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
		                //   	document.getElementById("uploadedFile").innerHTML = tempSrc;
		                   	nui.parse(); 				
		                }
		            });
                }
            }
        );
	} */
	
    function CloseWindow(action) {
        if (action == "cancel" ) {
            if (!confirm("是否关闭？")) {
                return false;
            }
        }
        if (window.CloseOwnerWindow) return window.CloseOwnerWindow(action);
        else window.close();            
    }
    
    //订单编辑前发生
    function editOrder(e){
    	var row = csContOrder_grid.getRow(e.rowIndex);
    	var contorderid=row.contorderid;
    	if(contorderid&&contorderid!="null"){
			nui.get("contorderno").setReadOnly(true);
		}else{
			nui.get("contorderno").setReadOnly(false);
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
    
    //编辑合同授权清单
    function doContLicsum(e){
    	var row = csContLicense_grid.getRow(e.rowIndex);
    	if(row){
    		if(row.total != null && isNaN(row.total)){
				nui.alert("请输入实数！");
				var rowData = {total: 0};
				csContLicense_grid.updateRow(row,rowData);
				return;
			}
    		if(row.grantnum != null && isNaN(row.grantnum)){
				nui.alert("请输入实数！");
				var rowData = {grantnum: 0};
				csContLicense_grid.updateRow(row,rowData);
				return;
			}
			var total = 0;
			var grantnum = 0;
			var lastnum = 0;
			if(row.total){
				total = row.total;
			}
			if(row.grantnum){
				grantnum = row.grantnum;
			}
			lastnum = parseFloat(total)-parseFloat(grantnum);
			var rowData = {lastnum: lastnum};
			csContLicense_grid.updateRow(row,rowData);
    	}
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
			if(row.orderservmon){
				orderservmon = row.orderservmon;
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
    
    function doUpdateForecast(e){//已确认和流程中的收入预估不能修改
    	if(e.record.status == 2 || e.record.status == 3){	//2、收入确认流程中,3、已确认
    		if(e.record.name != "New Row"){
				csReveForecast_grid.setAllowCellEdit(false);
    		}
		}else{
			csReveForecast_grid.setAllowCellEdit(true);//除了收入确认流程中和已确认的  放开可编辑
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
    //收入预估 计算比例金额(编辑后)
    function doCsReveForecastEnd(e){
    	var row = csReveForecast_grid.getRow(e.rowIndex);
    	var reveno = row.reveno;
    	var a=0;
    	if(e.field=="reveno"){
	    	var csReveForecasts = csReveForecast_grid.getData();
	    	for(var i=0;i<csReveForecasts.length;i++){
	    		var reveno1 = csReveForecasts[i].reveno;
				if(reveno1==reveno){
					a++;
					if(a>1){
						nui.alert("收入次数不能重复！");
		    			var Data1 = {reveno: ""};
						csReveForecast_grid.updateRow(row,Data1);
						return;	
					}
	    		}
	    	}
    	}
    	if(e.field=="fcreverate"||e.field=="fcsum"||e.field=="productsum"||e.field=="servicesum"||e.field=="masum"){
	    	var contsum = nui.get("contsum").getValue();
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
    }
        
    function onCancel(e) {
        CloseWindow("cancel");
    }
    
	//合同收款列表-单元格编辑后updateRow
	function doCsGatherFcEnd(e){
     	//productsum servicesum fcsum fcreverate
     	if(e.field=="productsum"||e.field=="servicesum"||e.field=="fcsum"){
     		var contsum = nui.get("contsum").getValue();
     		var row = csGatherFc_grid.getRow(e.rowIndex);
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
     
    //收款表格可编辑颜色控制  //收入确认表格可编辑颜色控制
    function changeColor(e){
    	//状态为已收款的，设置行样式
    	if(e.record.status == "2" || e.record.status =="3"){
        	e.cellStyle = "background-color: #33FFFF";
    	}
    }
	
	//收款汇总行 保函汇总记录 收入确认汇总行 产品分成汇总
	function drawSum(e){
		if (e.field == "fcsum" || e.field == "backdepmon" || e.field == "returnmon" 
			|| e.field == "productsum"|| e.field == "servicesum"|| e.field == "masum" 
			||e.field == "contsum" || e.field == "tax"|| e.field == "contsum2"|| e.field == "pratiomon"
			|| e.field == "summon"|| e.field == "summon2" 
			|| e.field == "total"  || e.field == "grantnum"  || e.field == "lastnum" ) {
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
				    	nui.get("servstartdate").setValue(reveObject.startDate);//设置MA开始日期
				    	nui.get("servenddate").setValue(reveObject.endDate);//设置MA结束日期
				    	var grid = nui.get("csReveForecast_grid");//设置合同收入确认记录
				        for(var i = 0;i < reveObject.data.length;i ++){
				        	if(contracttype == "04" || contracttype == "30"){
				        		var contnum = nui.get("contnum").getVaule();//合同编号
				        		reveObject.data[i].contorderno = contnum;
				        	}
					        grid.addRow(reveObject.data[i], i);
				        }
					}
				}
			}
		});
     }
     
	function doIPOproduct(e){/*ipo上市需要维护的字段js代码*/
		var row = ipo_sales_grid.getSelected();
		var datas=ipo_product_grid.getData();//get父datagrid不能获取到子datagrid的值，需要重新赋值（之前有值是因为，初始化页面放进去的）
		ipo_sales_grid.updateRow(row,{saleProds:datas});
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
  	function getReveProdtype(e){
		return nui.getDictText('REVE_PRODTYPE',e.value);
	}
	function onGenderRenderer(e) {
        return nui.getDictText('CONT_ORG',e.value);
    }
	function onGender1Renderer(e) {
        return nui.getDictText('SERV_NUM_TYPE',e.value);
    }
	function dictProdUnit(e) {
        return nui.getDictText('CS_PROD_UNIT',e.value);
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
    //是否需要销售评估
    function onGenderSaleseva(e){
    	return nui.getDictText('MIS_YN',e.value);
    }
    //合同保函保证金状态
    function onCsBackDepStatus(e){
    	return nui.getDictText('CS_BACK_DEP',e.value);
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
	//合同业务分类
    function getCsContracttype(e){
		return nui.getDictText('CS_CONTRACT_TYPE',e.value);
	}
	//合同产品授权单位
    function getCsContLicType(e){
		return nui.getDictText('CS_CONT_LIC_UNIT',e.value);
	}
</script>
</html>
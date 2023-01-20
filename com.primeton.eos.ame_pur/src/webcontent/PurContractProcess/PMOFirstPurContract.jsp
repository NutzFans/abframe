<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@page import="com.eos.data.datacontext.UserObject"%>
<html>
<!-- 
  - Author(s): wlq
  - Date: 2016-06-02 18:18:37
  - Description:
-->
<head>
	<title>PMO初审</title>
	<script src="<%= request.getContextPath() %>/common/nui/nui.js" type="text/javascript"></script>
	<style type="text/css">
	    body{
	        margin:0;padding:0;border:0;width:100%;height:100%;overflow:hidden;
	    }
    </style>
</head>
<body>
<div class="nui-fit">
	<!-- 提示信息展示 -->
	<jsp:include page="/ame_common/ameFlowOperTips/ameFlowOperTipsInfo.jsp"/>
	<fieldset id="field1" style="border:solid 1px #aaa;padding:3px;">
		<legend>采购合同基本信息</legend>
		<form id="form1" method="post">
			<input name="purContract.purcontid" id="purcontid" class="nui-hidden" />
			<input name="purContract.purOrderYesOrNo" id="purOrderYesOrNo" class="nui-hidden"/>
			<input name="purContract.fileids" id="fileids1" class="nui-hidden"/><!-- fileids合同附件 -->
			<div style="padding:5px;">
				<table style="table-layout:fixed;" id="table_file">
					<tr>
						<td align="right" style="width:130px;">供应商：</td>
						<td style="width:190px;"><input name="purContract.purSupplier.custid" id="custname" class="nui-buttonedit" required="true" style="width:200px" emptyText="请选择供应商" onbuttonclick="selectSupplier" allowInput="false" /></td>
						<td align="right" style="width:100px">合同类型：</td>
						<td style="width:140px;"><input name="purContract.purtype" id="purtype"  class="nui-dictcombobox" dictTypeId="AME_CONTYPE" required="true" style="width:100px" showNullItem="true" nullItemText=""/></td>
						<td align="right" style="width:100px">合同金额：</td>
						<td style="width:180px;"><input name="purContract.contmoney" id="contmoney" class="nui-textbox" style="width:100px" vtype="float"/>&nbsp;(元)</td>
					</tr>
					<tr>
						<td align="right" style="width:130px">有效开始日期：</td>
						<td><input name="purContract.startdate" id="startdate" class="nui-datepicker" vtype="date:yyyy-MM-dd" style="width:100px" onblur="startTime"/></td>
						<td align="right" style="width:100px">有效截止日期：</td>
						<td><input name="purContract.enddate" id="enddate" class="nui-datepicker" vtype="date:yyyy-MM-dd" style="width:100px" onblur="endTime"/></td>
						<td align="right" style="width:100px">我方申请人：</td>
						<td><input name="purContract.ouroper" id="ouroper" class="nui-textbox" vtype="rangeChar:2,30" style="width:100px" /></td>
					</tr>
					<tr>
						<td align="right" style="width:130px">财务对应合同编码：</td>
						<td style="width:140px"><input name="purContract.outcontnum" id="outcontnum" onbuttonclick="selectCont" class="nui-buttonedit" style="width:90px"/><input type='button' align='center' value='查看' style="width:40px" onclick='javascript:lookCsContract()'/></td>
						<td align="right" style="width:100px">成本类型：</td>
						<td><input name="purContract.costtype" id="costtype" class="nui-dictcombobox" dictTypeId="AME_CONTCOSTTYPE" style="width:100px" showNullItem="true"/></td>
						<td align="right" style="width:100px">合同名称：</td>
						<td><input name="purContract.purcontname" id="purcontname" class="nui-textbox" style="width:285px"/></td>
					</tr>
					<tr>
						<td align="right" style="width:130px">供应商联系人：</td>
						<td><input name="purContract.liankman" id="liankman" class="nui-textbox" vtype="rangeChar:2,30" style="width:100px"/></td>
						<td align="right" style="width:100px">联系电话：</td>
						<td><input name="purContract.linktel" id="linktel" class="nui-textbox" vtype="rangeLength:8,30" style="width:150px"/></td>
						<td align="right" style="width:100px">电子邮件：</td>
						<td><input name="purContract.linkemail" id="linkemail" class="nui-textbox" vtype="email" style="width:200px"/></td>
					</tr>
					<tr>
						<td align="right" style="width:130px">采购合同代码：</td>
						<td><input name="purContract.purcontnum" id="purcontnum" class="nui-textbox" style="width:180px"/></td>
					</tr>
					<tr>
						<td align="right" style="width:130px">合同关键内容信息：</td>
						<td colspan="5"><input name="purContract.contKeyinfo" id="contKeyinfo" class="nui-textarea" height="100px" style="width:100%"/></td>
					</tr>
					<tr>
						<td align="right" style="width:130px">说明：</td>
						<td colspan="5"><input name="purContract.comment" id="comment" class="nui-textarea" vtype="rangeChar:0,2000" style="width:100%"/></td>
					</tr>
				</table>
			</div>
		</form>
		<jsp:include page="/ame_common/detailAndDelFile.jsp"/>
		<jsp:include page="/ame_common/addFiles1.jsp"/>
		<fieldset style="border:solid 1px #aaa;padding:3px;">
		    <legend>采购合同对应项目列表</legend>
		    <div style="width:100%;">
		        <div class="nui-toolbar" style="border-bottom:0;padding:0px;">
		            <table style="width:100%;">
		            	<tr>
		                    <td style="width:20%;">
		                        <a class="nui-button" id="addBtn" iconCls="icon-add" onclick="add()">增加</a>
		                        <a class="nui-button" id="deltbtn" iconCls="icon-remove"  onclick="remove()">删除</a>
		                    </td>
		                </tr>
	                 </table>
		        </div>
		    </div>
			<div id="grid_purProjCont" class="nui-datagrid" style="width:100%;height:auto;" allowResize="true" dataField="purProjConts" 
			 url="com.primeton.eos.ame_pur.PurContract.queryPurProjContByPurcontid.biz.ext" allowCellSelect="true"  allowCellEdit="true" showPager="false" multiSelect="true" showSummaryRow="true" ondrawsummarycell="drawPurProjContSum">
				<div property="columns">
					<div type="indexcolumn" headerAlign="center" width="35" >编号</div>
					<div type="projectid" visible="false"></div>
					<div field="projectno" displayField="projectName" width="150" headerAlign="center">
						项目
		                <input property="editor" class="nui-buttonedit" onbuttonclick="selectProject" style="width:100%;"allowInput="false"/>
		            </div>
					<div field="projectno" width="100" align="center" headerAlign="center" >项目编号</div>
					<div field="contnum" width="100" align="center" headerAlign="center" >销售合同编号</div>
					<div field="custjc" width="100" align="center" headerAlign="center" >所属客户</div>
					<div field="orgname" width="75" align="center" headerAlign="center">受益销售</div>	
					<div field="purmoney"  width="100" headerAlign="center" align="right" summaryType="sum" numberFormat="n2">
						采购金额
						<input property="editor" class="nui-spinner" format="n2" allowLimitValue="false" changeOnMousewheel="false" increment="0" showButton="false"  style="width:100%;" inputStyle="text-align:right;" allowInput="true" />
		            </div>
					<div field="comment"  width="200" headerAlign="center" align="center">
						备注说明
						<input property="editor" class="nui-textbox" style="width:100%;"/>
		            </div>
				</div>
			</div>
		</fieldset>
		<fieldset style="border:solid 1px #aaa;padding:3px;">
			<legend>采购付款计划列表</legend>
			<div id="paymentPlanGrid" class="nui-datagrid" style="width:100%;height:auto;" allowResize="false" dataField="plans" showSummaryRow="true"
		 	url="com.primeton.eos.ame_pur.purPaymentPlan.paymentPlanQueryByContract.biz.ext"  allowCellEdit="false" showPager="false" multiSelect="true" ondrawsummarycell="drawPaymentPlanSum">
				<div property="columns">
					<div type="indexcolumn" headerAlign="center" width="35" >编号</div>
					<div field="payCount" width="80" align="center" headerAlign="center" >付款次数</div>	
					<div field="expectedAmount" width="100" align="center"  headerAlign="center" currencyUnit="￥" dataType="currency" numberFormat="n2" summaryType="sum">付款金额</div>
					<div field="percentage" width="80" align="center"  headerAlign="center" summaryType="sum" renderer="percentageRenderer">付款比例</div>
					<div field="expectedDate" width="100" align="center"  headerAlign="center" dataType="date" dateFormat="yyyy-MM" renderer="onDealDate">预计付款年月</div>
		            <div field="evidence" width="140" align="center" headerAlign="center" >付款依据</div>
					<div field="nodeRemark" width="280" align="center"  headerAlign="center" >付款节点备注</div>
				</div>
			</div>
		</fieldset>
	</fieldset>
	<fieldset id="field3" style="border:solid 1px #aaa;padding:3px;">
		<legend>采购订单基本信息</legend>
		<form id="purOrder" method="post">
			<input name="purOrder.purorderid" id="purorderid" class="nui-hidden" />	
			<input name="purOrder.fileids" id="fileids2" class="nui-hidden" />	
        	<table style="table-layout:fixed;" id="table_purOrder">
				<tbody>
					<tr>
						<td align="right" style="width:120px">服务客户：</td>
						<td style="width:200px"><input name="purOrder.userid" id="userid" class="nui-buttonedit" onbuttonclick="selectCustmer"  allowInput="false" style="width:200px" /></td>
						<td align="right" style="width:120px">项目名称：</td>
						<td style="width:200px"><input name="purOrder.projectno" id="projectno" class="nui-combobox" valueField="projectno" textField="projectName" allowInput="false"  style="width:200px" showNullItem="true" nullItemText=""/></td>
						<td align="right" style="width:120px">协议签订人员：</td>
						<td style="width:100px"><input name="purOrder.signuserid" id="signuserid" class="nui-buttonedit" onbuttonclick="selectOmEmployee"  allowInput="false" vtype="rangeChar:2,30" style="width:100px" /></td>
					</tr>
					<tr>
						<td align="right" style="width:120px">采购订单编号：</td>
						<td colspan="5"><input name="purOrder.purordernum" id="purordernum" class="nui-textbox" required="false" vtype="rangeChar:0,30" style="width:200px"/></td>
					</tr>
					<tr>
						<td align="right" style="width:120px">结算周期说明：</td>
						<td colspan="5"><input name="purOrder.calcycle" id="calcycle" class="nui-textbox" allowInput="true" vtype="rangeChar:0,1000" style="width:100%"/></td>
					</tr>
					<tr>
						<td align="right" style="width:120px">协议内容说明：</td>
						<td colspan="5"><input name="purOrder.contmemo" id="contmemo" class="nui-textarea" allowInput="true" vtype="rangeChar:0,2000" style="width:100%"/></td>
					</tr>
					<tr>
<!-- 								<td align="right" style="width:120px">相关人员：</td> -->
						<td colspan="5"><input name="purOutPerson.outpername" id="outpername" class="nui-hidden" allowInput="false" style="width:100%"/></td>
						<td colspan="5"><input name="purOutPerson.outperno" id="outperno" class="nui-hidden" style="width:100%"/></td>
					</tr>
				</tbody>
			</table>
		</form>
		<div id="grid_purOrderFile" class="nui-datagrid" style="width:100%;height:auto;" showPager="false" sortMode="client" url="com.primeton.eos.ame_common.file.getFiles.biz.ext" dataField="files" allowCellEdit="true" allowCellSelect="true" multiSelect="true" editNextOnEnterKey="true">
			<div property="columns">
				<div type="indexcolumn" headerAlign="center" width="40" >编号</div>
				<div field="fileName"width="200" headerAlign="center" align="center" renderer="getdetail1">附件名称</div>
				<div field="fileType" width="120" renderer="dictKbasetype" align="center" headerAlign="center" >附件类型</div>
				<div field="operatorname" width="80"headerAlign="center" align="center">操作员名称</div>
				<div field="fileTime" width="120" headerAlign="center" align="center" dateFormat="yyyy-MM-dd HH:mm:ss">附件上传时间</div>
				<div renderer="deleteOrderFile" width="60" headerAlign="center" align="center">操作</div>
			</div>
		</div>
		<jsp:include page="/ame_common/addFiles2.jsp"/>
	</fieldset>
	<fieldset id="field_order" style="border:solid 1px #aaa;padding:3px;">
		<legend>外包人员基本信息</legend>
        <div style="width:100%;">
	        <div class="mini-toolbar" style="border-bottom:0;padding:0px;">
	            <table style="width:100%;">
	                <tr>
	                    <td style="width:100%;">
	                        <a class="mini-button" iconCls="icon-add" onclick="addpurOutPer()">增加</a>
	                        <a class="mini-button" iconCls="icon-save" onclick="savepurOutPer()">保存</a>            
	                    </td>
	                </tr>
	            </table>           
	        </div>
	    </div>
		<div id="grid_purOutPer" class="nui-datagrid" dataField="purOutpersons" style="width:100%;height:auto;" 
	    	url="com.primeton.eos.ame_pur.purContractProcess.queryPurOutPersonBySupplier.biz.ext" multiSelect="true" 
	    	showFooter="false" showPager="false" allowCellEdit="true" allowCellSelect="true" 
	    	allowSortColumn="false" onselectionchanged="selectPersonchanged"  onlyCheckSelection="true" ><!-- oncellendedit="addPurOrderOutper" -->
			<div property="columns">
				<div type="checkcolumn" width="30"></div>
				<div field="purorderid" width="0" align="center" headerAlign="center">订单编号</div>
				<div field="outperno" width="0" align="center" headerAlign="center" allowSort="true">人员编号</div>
				<div field="outpername"width="90" align="center" headerAlign="center">姓名</div>	
				<div field="workunit" width="80" align="center" headerAlign="center" allowSort="true" renderer="dictOutperType">
					工作量计量单位
					<input property="editor" class="nui-dictcombobox" dictTypeId="SERV_NUM_TYPE" style="width:100%;"/>
				</div>
				<div field="price" width="80" dataType="currency" align="center" headerAlign="center" allowSort="true">
					单价
					<input property="editor" class="nui-spinner" format="n2" allowLimitValue="false" changeOnMousewheel="false" increment="0" showButton="false"  style="width:100px;background:#9ACD32;" inputStyle="text-align:right;" allowInput="true" />
				</div>
				<div field="startdate" width="80" align="center" renderer="onDealDate1" headerAlign="center" allowSort="true">
					服务开始日期
					<input property="editor" class="nui-datepicker" format="yyyy-MM-dd" style="width:100%;" />
				</div>
				<div field="expenddate" width="100" align="center" renderer="onDealDate1" headerAlign="center" allowSort="true">
					预计服务截止日期
					<input property="editor" class="nui-datepicker" format="yyyy-MM-dd" style="width:100%;" />
				</div>
				<div field="projectno" displayField="projectName" width="120" headerAlign="left">
					项目
	                <input property="editor" class="nui-buttonedit" onbuttonclick="selectProject" style="width:100%;" allowInput="false"/>
	            </div>
				<div field="manager" displayField="managername" width="80" align="center" headerAlign="center">
					汇报人
					<input property="editor" class="nui-buttonedit" style="width:100%;" onbuttonclick="selectManager" allowInput="false"/>
				</div>
				<div field="pcprotype"  width="90" renderer="dictstatus" align="center" headerAlign="center">
					电脑提供方式
					<input property="editor" class="nui-dictcombobox" dictTypeId="AME_PCPROTYPE" style="width:100%;" showNullItem="true" nullItemText=""/>
				</div>
				<div field="comment" width="130" align="center" headerAlign="center">
					说明
					<input property="editor" class="nui-textbox" style="width:100%;" />
				</div>
			</div>
		</div>
	</fieldset>
	<jsp:include page="/ame_common/misOpinion.jsp"/>
	<jsp:include page="/ame_common/addFiles.jsp"/>
</div>
<div style="text-align:center;padding:10px;" class="nui-toolbar">
	<a class="nui-button" onclick="onOk" id="submitPurCont"  style="width:60px;margin-right:20px;">提交</a>
	<a class="nui-button" onclick="onCancel('cancel')" style="width:60px;">关闭</a>
</div>
</body>
<script type="text/javascript">
	nui.parse();
  	var form = new nui.Form("form1");
  	var purOrder = new nui.Form("purOrder");
  	var opioionform = new nui.Form("opioionform");
  	var grid_purOutPer = nui.get("grid_purOutPer");//人员信息列表
  	//采购合同与项目关系
    var grid_purProjCont = nui.get("grid_purProjCont");
	<% 
		long workItemID=(Long)request.getAttribute("workItemID");
	%>	
	
	loadData();//初始化数据
	function loadData(){
		document.getElementById("choosehide").style.display="none";
		var data={workItemID:<%=workItemID %>};
		var json=nui.encode(data);
		nui.ajax({
			url:"com.primeton.eos.ame_pur.purContractProcess.queryContractWorkItem.biz.ext",
			type:"post",
			data:json,
			contentType:"text/json",
			success:function (o){
				form.setData(o);
				nui.get("outcontnum").setValue(o.purContract.outcontnum);
				nui.get("outcontnum").setText(o.purContract.outcontnum);
				purOrder.setData(o);
				var grid_0 = nui.get("grid_0");
				grid_0.load({"groupid":"purContract","relationid":o.purContract.purcontid});
				grid_0.sortBy("fileTime","desc");
				nui.get("purOrderYesOrNo").setValue(o.purContract.YesOrNo);
				if(o.purContract.YesOrNo==0){
					document.getElementById("field3").style.display="none";
					document.getElementById("field_order").style.display="none";
				}else if(o.purContract.YesOrNo==1){
					//外包人员信息
					var custid = nui.get("custname").getValue();
	            	var purorderid = nui.get("purorderid").getValue();
	            	var projectno = o.purOrder.projectno;
	            	var projectName = o.purOrder.projectName;
                	var json2 = nui.decode({purSupplier:{purorderid:purorderid,custid:custid,projectName:projectName,projectno:projectno}});
                	grid_purOutPer.sortBy("outperno","desc");
                	grid_purOutPer.load(json2,function (){
                		grid_purOutPer.selectAll(false);
                		var rows = grid_purOutPer.getSelecteds();
                		for(var i = 0;i < rows.length;i++){
                			if(!rows[i].purorderid){
                				grid_purOutPer.deselect(rows[i]);
                			}
                		}
                	});
					var grid_purOrderFile = nui.get("grid_purOrderFile");
					grid_purOrderFile.load({"groupid":"purOrder","relationid":o.purOrder.purorderid});
					grid_purOrderFile.sortBy("fileTime","desc");
				}
				nui.get("custname").setText(o.purContract.purSupplier.custname);
				nui.get("userid").setText(o.purOrder.custname);
                nui.get("projectno").setText(o.purOrder.projectName);	
                nui.get("signuserid").setText(o.purOrder.empname);
				//设置审核意见基本信息
				nui.get("processinstid").setValue(o.workitem.processInstID);
               	nui.get("processinstname").setValue(o.workitem.processInstName);
               	nui.get("activitydefid").setValue(o.workitem.activityDefID);
               	nui.get("workitemname").setValue(o.workitem.workItemName);
				nui.get("workitemid").setValue(<%=workItemID %>);
               	nui.get("isshow").setValue("1");
            	nui.get("backTo").setData(o.purContract.backList);
            	//初始化处理意见
				initMisOpinion({auditstatus:"1"});
            	//查询审核意见
            	var processinstid = nui.get("processinstid").getValue();
				var grid = nui.get("datagrid1");
				grid.load({processInstID:processinstid});
				grid.sortBy("time", "desc");
            	//流程提示信息
    			promptInit({workItemID:<%=workItemID %>});	
    			//项目合同关系列表查询
                grid_purProjCont.load({purcontid:o.purContract.purcontid});
                //采购付款计划查询
                nui.get("paymentPlanGrid").load({purcontid:o.purContract.purcontid});
			},
			error:function(){}
		});
	}
    	
  	//标准方法接口定义
    function CloseWindow(action) {            
        if (window.CloseOwnerWindow) return window.CloseOwnerWindow(action);
        else window.close();            
    }
    //验证表单成功后调用savedata方法操作数据库
	function onOk(){
		//PMO信息入库一定带订单，之前判断的是否携带订单数据不用在进行判断
		var purOrderYesOrNo = nui.get("purOrderYesOrNo").getValue();
		if(purOrderYesOrNo==1){
			if(!(form.validate() && purOrder.validate() && opioionform.validate())){
				nui.alert("表单信息填写不完整或长度超出限制，请确认必输项是否填写！！");
				return;
			}
		}else{
			if(!form.validate() && opioionform.validate()){
				nui.alert("表单信息填写不完整或长度超出限制，请确认必输项是否填写！！");
				return;
			}
		}
		if(purOrderYesOrNo==1){
			var outpername = nui.get("outpername").getValue();
			//如果退回，外包人员不保存
			if(nui.get("auditstatus").getValue()==0){
				SaveData();
				return;
			}
				if(outpername==""||outpername==null){
					nui.alert("请选择外包人员！");
				}else{
					var rows = grid_purOutPer.getSelecteds();
			    	for(var i = 0;i < rows.length;i ++){
						if(!rows[i].workunit){
							nui.alert("外包人员:" + rows[i].outpername + "的工作量计量单位不能为空");
							return;
						}
						if(!rows[i].startdate){
							nui.alert("外包人员:" + rows[i].outpername + "的服务开始日期不能为空");
							return;
						}
						if(!rows[i].expenddate){
							nui.alert("外包人员:" + rows[i].outpername + "的预计服务结束日期不能为空");
							return;
						}
						if(rows[i].startdate){
			        		if(rows[i].expenddate){
				        		if(rows[i].startdate > rows[i].expenddate){
				        			nui.alert("外包人员:" + rows[i].outpername + "的服务开始日期:" + rows[i].startdate.substring(0,10) + "不能大于预计服务结束日期:" + rows[i].expenddate.substring(0,10));
				        			return;
				        		}
			        		}
			        	}
					}
					/*
						误操作，勾选点击保存某个人员，此时这个人员跟这个订单关联之后，
						若发现录入人员错误（比如人员名字重复导致）不选择这个人员，进入下个环节（此时删除这个人员跟这个订单的关联），
						问题：此时这个人员没有关联的订单
					*/
					if(confirm("外包人员为："+outpername +",确认提交？")){
						nui.get("submitPurCont").disable();
						saveAndDelPer();
					}
				}
		}else{
			//不带订单情况
            if(confirm("确定提交?")){
				nui.get("submitPurCont").disable();
				document.getElementById("fileCatalog2").value="purOrder";
				form4.submit(); //SaveData1 >> SaveData
			}
		}
	}
	    
    function SaveData2(){//附件
    	document.getElementById("fileCatalog1").value="purContract";
        form4.submit();
	}
	
	function SaveData1(){//附件
    	document.getElementById("fileCatalog").value="MisOpinion";
        form2.submit();
	}
	    
	function SaveData() {//提交流程
        var o = form.getData();
        var data3 = purOrder.getData();
        var data5 = opioionform.getData();
        var data_purProjCont = grid_purProjCont.getChanges();
        var json = nui.encode({purContract:o.purContract,purOrder:data3.purOrder,misOpinion:data5.misOpinion,purProjConts:data_purProjCont});
        nui.ajax({
            url: "com.primeton.eos.ame_pur.purContractProcess.modifyContractApply.biz.ext",
            data: json,
            type: 'POST',
            cache: false,
            contentType: 'text/json',
            success: function (text) {
            	var returnJson = nui.decode(text);
            	if(returnJson.exception == null){
	                CloseWindow("ok");
				}else{
					nui.alert("提交失败，请联系信息技术部人员！");
					nui.get("submitPurCont").enable();
				}
            },
            error: function (jqXHR, textStatus, errorThrown) {
            	alert(jqXHR.responseText);
            }
        });
    }
    
    function onCancel(e) {
        CloseWindow("cancel");
    }
        
    /** 提交时保存已选外包人员剔除误操作但已保存的人员信息*/
	function saveAndDelPer(){
		var allPerson = grid_purOutPer.getData();
		var rows = grid_purOutPer.getSelecteds();
		var userid = nui.get("userid").getValue();
		var signuserid = nui.get("signuserid").getValue();
		if(rows.length> 0){
			var rowdata = {purOrderOutpersons:rows};
			var purorderid = nui.get("purorderid").getValue();
	        var json1 = {allpurOrderOutpersons:allPerson,purOrderOutpersons:rowdata.purOrderOutpersons,userid:userid,signuserid:signuserid,purorderid:purorderid};
	        var json = nui.encode(json1);
			nui.ajax({
	            url: "com.primeton.eos.ame_pur.purContractProcess.delAndSavePurOrderOutper.biz.ext",
	            data: json,
	            type: 'POST',
	            cache: false,
	            contentType: 'text/json',
	            success: function (text) {
	            	if(text.exception != null){
	            		nui.alert("修改外包人员基本信息失败！","系统提示",function(){
		            		nui.get("submitPurCont").enable();
	            		});
		            	return;
	            	}else{
	                	document.getElementById("fileCatalog2").value="purContract";
						form6.submit();
	            	}
	            },
	            error: function (jqXHR, textStatus, errorThrown) {
	                alert(jqXHR.responseText);
	                CloseWindow();
	            }
	        });
		}else{
			nui.alert("请至少选中一条记录！");
			return;
		}
	}
        
     //选择供应商
    function selectSupplier(){
    	var btnEdit = this;
        nui.open({
            url:"<%=request.getContextPath() %>/ame_pur/PurSupplier/SelectSupplier.jsp",
            title: "选择供应商",
            width: 650,
            height: 380,
            ondestroy: function (action) {
                if (action == "ok") {
                    var iframe = this.getIFrameEl();
                    var data = iframe.contentWindow.GetData();
                    data = nui.clone(data);
                    if (data) {
                        btnEdit.setValue(data.custid);
                        btnEdit.setText(data.custname);
                    } 
                }
            }
        });
    }
    
	//选择服务客户弹窗
    function selectCustmer(){
    	var btnEdit = this;
        nui.open({
            url:"<%=request.getContextPath() %>/contract/contract/MisCustinfo_lookup.jsp",
            title: "选择服务客户",
            width: 650,
            height: 380,
            ondestroy: function (action) {
                if (action == "ok") {
                    var iframe = this.getIFrameEl();
                    var data = iframe.contentWindow.GetData();
                    data = nui.clone(data);    //必须
                    if (data) {
                        btnEdit.setValue(data.id);
                        btnEdit.setText(data.text);
				        var json = nui.encode({rdProject: {custid: data.id}}); //服务客户userid
				    	nui.ajax({
				    		url: "com.primeton.eos.ame_pur.purContractProcess.queryProjByOrder.biz.ext",
				            data: json,
				            type: 'POST',
				            cache: false,
				            showModal: false,
				            contentType: 'text/json',
				            success: function (o) {
				            	o = nui.clone(o);
				            	if(o.rdProjects==null || o.rdProjects==""){
				                	nui.get("projectno").setData();
				                	nui.get("projectno").setValue();
				                }else{
				                	//项目
				                	nui.get("projectno").setData(o.rdProjects);
				                	nui.get("projectno").setValue(o.rdProjects[0].projectno);
				                	nui.get("projectno").setText(o.rdProjects[0].projectName);
				                }
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
    
	//处理开始日期和合同名称
    function startTime(){
    	var start = nui.get("startdate").getValue();
    	var end = nui.get("enddate").getValue();
    	var purtype = nui.get("purtype").getValue();
    	if(end){
    		startDate = start.substring(0,4) + start.substring(5,7) + start.substring(8,10);
		    endDate   = end.substring(0,4) + end.substring(5,7) + end.substring(8,10);
	    	//有效开始日期不能大于有效截至日期。
			if(endDate < startDate){
				nui.alert("有效开始日期不能大于有效截至日期！"); //有效开始日期不能大于有效截至日期！
				return false;
			}
			if(purtype=="0"){
	    		var name ="人力资源服务框架协议(" + start.substring(0,4) + "." + start.substring(5,7) + "." + start.substring(8,10) + "-" + end.substring(0,4) + "." + end.substring(5,7) + "." + end.substring(8,10) + ")";
	    		nui.get("purcontname").setValue(name);
			}
    	}
    }
    
    //处理结束日期和合同名称
    function endTime(){
    	var start = nui.get("startdate").getValue();
    	var end = nui.get("enddate").getValue();
    	var purtype = nui.get("purtype").getValue();
    	if(start){
    		startDate = start.substring(0,4) + start.substring(5,7) + start.substring(8,10);
		    endDate   = end.substring(0,4) + end.substring(5,7) + end.substring(8,10);
	    	//有效开始日期不能大于有效截至日期。
			if(endDate < startDate){
				nui.alert("有效开始日期不能大于有效截至日期！"); //有效开始日期不能大于有效截至日期！
				return false;
			}
			if(purtype=="0"){
				var name ="人力资源服务框架协议(" + start.substring(0,4) + "." + start.substring(5,7) + "." + start.substring(8,10) + "-" + end.substring(0,4) + "." + end.substring(5,7) + "." + end.substring(8,10) + ")";
    			nui.get("purcontname").setValue(name);
    		}
    	}
    }
	    
    //选择协议签订人员弹窗
    function selectOmEmployee(){
    	var btnEdit = this;
        nui.open({
            url:"<%=request.getContextPath() %>/machine/SelectEmployee.jsp",
            title: "选择项目",
            width: 650,
            height: 380,
            ondestroy: function (action) {
                if (action == "ok") {
                    var iframe = this.getIFrameEl();
                    var data = iframe.contentWindow.GetData();
                    data = nui.clone(data);    //必须
                    if (data) {
                        btnEdit.setValue(data.userid);
                        btnEdit.setText(data.empname);
                    }
                }
            }
        });
    }
    
    //选择订单人员
	function selectPersonchanged(){
		var rows = grid_purOutPer.getSelecteds();
		//会签审批人lookup2
		var outpername = "";
        var outperno = "";
        for(var i=0;i<rows.length;i++){
        	outpername += rows[i].outpername+",";
        	outperno += rows[i].outperno+",";
        }
        outpername = outpername.substring(0,outpername.length-1);
        outperno = outperno.substring(0,outperno.length-1);
        nui.get("outperno").setValue(outperno);
        nui.get("outpername").setValue(outpername);
	}
		
		
	/** 新增外包人员*/
	function addpurOutPer() {
		if(grid_purOutPer.getChanges()!=""){
			if(!confirm("放弃已修改但未保存人员信息？")){
	            return;
	        }
        }
        nui.open({
            url: "<%=request.getContextPath() %>/ame_pur/outperson/PurOutpersonInput.jsp",
            title: "新增外包人员", 
            width: 1050, 
            height: 450,
            onload: function () {
                var iframe = this.getIFrameEl();
                var custid = nui.get("custname").getValue();
                var custname = nui.get("custname").getText();
                var data = { custid:custid,custname:custname};
                iframe.contentWindow.PMOaddPer(data);
            },
            ondestroy: function (action) {
            	if(action =="ok"){
                    var custid = nui.get("custname").getValue();
	            	var purorderid = nui.get("purorderid").getValue();
	            	var projectno = nui.get("projectno").getValue();
	            	var projectName = nui.get("projectno").getText();
                	var json2 = nui.decode({purSupplier:{purorderid:purorderid,custid:custid,projectno:projectno,projectName:projectName}});
                	grid_purOutPer.sortBy("outperno","desc");
                	grid_purOutPer.load(json2,function (){
                		grid_purOutPer.selectAll(false);
                		var rows = grid_purOutPer.getSelecteds();
                		for(var i = 0;i < rows.length;i++){
                			if(!rows[i].purorderid){
                				grid_purOutPer.deselect(rows[i]);
                			}
                		}
                	});
            	}
            }
        });
    }
    
    /** 保存已选外包人员*/
	function savepurOutPer(){
		var rows = grid_purOutPer.getSelecteds();
		if(rows.length==0){
			nui.alert("请选中一条记录！");
			return;
		}
    	for(var i = 0;i < rows.length;i ++){
			if(!rows[i].price){
				nui.alert("外包人员:" + rows[i].outpername + "的人月单价不能为空");
				return;
			}
			if(!rows[i].price){
				nui.alert("外包人员:" + rows[i].outpername + "的人月单价不能为空");
				return;
			}
			if(!rows[i].startdate){
				nui.alert("外包人员:" + rows[i].outpername + "的服务开始日期不能为空");
				return;
			}
			if(!rows[i].expenddate){
				nui.alert("外包人员:" + rows[i].outpername + "的预计服务结束日期不能为空");
				return;
			}
			if(rows[i].startdate){
        		if(rows[i].expenddate){
	        		if(rows[i].startdate > rows[i].expenddate){
	        			nui.nui.alert("外包人员:" + rows[i].outpername + "的服务开始日期:" + rows[i].startdate.substring(0,10) + "不能大于预计服务结束日期:" + rows[i].expenddate.substring(0,10));
	        			return;
	        		}
        		}
        	}
		}
		var userid = nui.get("userid").getValue();
		var projectno = nui.get("projectno").getValue();
		var signuserid = nui.get("signuserid").getValue();
		if(rows.length> 0){
				var rowdata = {purOrderOutpersons:rows};
				var purorderid = nui.get("purorderid").getValue();
		        var json1 = {purOrderOutpersons:rowdata.purOrderOutpersons,userid:userid,projectno:projectno,signuserid:signuserid,purorderid:purorderid};
		        var json = nui.encode(json1);
				nui.ajax({
		            url: "com.primeton.eos.ame_pur.purContractProcess.savePurOrderOutper.biz.ext",
		            data: json,
		            type: 'POST',
		            cache: false,
		            contentType: 'text/json',
		            success: function (text) {
		            	nui.alert("保存成功！");
		            	var custid = nui.get("custname").getValue();
		            	var purorderid = nui.get("purorderid").getValue();
	                	var projectno = o.purOrder.projectno;
		            	var projectName = o.purOrder.projectName;
	                	var json2 = nui.decode({purSupplier:{purorderid:purorderid,custid:custid,projectName:projectName,projectno:projectno}});
	                	grid_purOutPer.sortBy("outperno","desc");
	                	grid_purOutPer.load(json2,function (){
	                		grid_purOutPer.selectAll(false);
	                		var rows = grid_purOutPer.getSelecteds();
	                		for(var i = 0;i < rows.length;i++){
	                			if(!rows[i].purorderid){
	                				grid_purOutPer.deselect(rows[i]);
	                			}
	                		}
	                	});
		            },
		            error: function (jqXHR, textStatus, errorThrown) {
		                alert(jqXHR.responseText);
		                CloseWindow();
		            }
		        });
		}else{
			nui.alert("请至少选中一条记录！");
			return;
		}
	}
		
		
    //设置日期格式
	function onDealDate1(e){
		if(e.value){
			return e.value.substring(0,10);
		}
	}
	
		
	function deleteOrderFile(e){//删除附件
        var record = e.record;
        var uid = record._uid;
    	return "<a href='javascript:void(0)' onclick='deleteOrderFile1(" + uid + ")'>删除 </a>";
    }
    
    function deleteOrderFile1(uid){//删除附件
    	var grid = nui.get("grid_purOrderFile");
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
    
     //选择项目
    function selectProject(){
    	var btnEdit = this;
    	nui.open({
            url:"<%=request.getContextPath() %>/ame_common/SelectProject.jsp",
            title: "选择项目",
            width: 850,
            height: 420,
            allowResize: false,
            ondestroy: function (action) {
                if (action == "ok") {
                    var iframe = this.getIFrameEl();
                    var data = iframe.contentWindow.GetData();
                    data = nui.clone(data);    //必须
                    if (data) {
                        btnEdit.setValue(data.projectno);
                        btnEdit.setText(data.projectName);
                    }
                }
            }
        });
    }
	        
    //选择销售合同弹窗
    function selectCont(){
    	var btnEdit = this;
    	nui.open({
            url:"<%=request.getContextPath() %>/ame_common/contract_lookup.jsp",
            title: "选择销售合同",
            width: 1000,
            height: 520,
            allowResize: false,
            ondestroy: function (action) {
                if (action == "ok") {
                    var iframe = this.getIFrameEl();
                    var data = iframe.contentWindow.GetData();
                    data = nui.clone(data);    //必须
                    if (data) {
                        btnEdit.setValue(data.text);
                        btnEdit.setText(data.text);
                    }
                }
            }
        });
    }
    
	function lookCsContract(){
		//为了公用 页面只能传过去contractid
		var outcontnum = nui.get("outcontnum").getValue();
		nui.ajax({
			url:"com.primeton.eos.ame_income.csReveForeProcess.queryContByContnum.biz.ext",
			data: {contnum:outcontnum},
			type:"post",
			contentType:"text/json",
			success:function(data){
				var contractid = data.csContract.contractid;
				if(contractid){
					var executeUrl = "<%=request.getContextPath() %>/contract/contract/contractView.jsp?contractid="+contractid;
					window.open(executeUrl, "合同查看", "fullscreen=1");
				}
			}
		});
  	}
  	
  	//选择项目
    function selectProject(){
    	var btnEdit = this;
    	nui.open({
            url:"<%=request.getContextPath() %>/ame_common/SelectProject.jsp",
            title: "选择项目",
            width: 850,
            height: 420,
            allowResize: false,
            ondestroy: function (action) {
                if (action == "ok") {
                    var iframe = this.getIFrameEl();
                    var data = iframe.contentWindow.GetData();
                    data = nui.clone(data);    //必须
                    if (data) {
                    	btnEdit.setValue(data.projectno);
                        btnEdit.setText(data.projectName);
                    	var row = grid_purProjCont.getSelected();
                        var rowData = { "projectId":data.projectId,
                        				"projectno":data.projectno,
                        				"projectName":data.projectName,
                        				"custjc":data.custjc,
                        				"orgname":data.orgname,
                        				"contnum":data.contnum};
					   	grid_purProjCont.updateRow(row,rowData);
                    }
                }
            }
        });
    }
    
    //选择销售合同弹窗
    function selectCont(){
    	var btnEdit = this;
    	nui.open({
            url:"<%=request.getContextPath() %>/ame_common/contract_lookup.jsp",
            title: "选择销售合同",
            width: 1000,
            height: 520,
            allowResize: false,
            ondestroy: function (action) {
                if (action == "ok") {
                    var iframe = this.getIFrameEl();
                    var data = iframe.contentWindow.GetData();
                    data = nui.clone(data);    //必须
                    if (data) {
                        btnEdit.setValue(data.text);
                        btnEdit.setText(data.text);
                    }
                }
            }
        });
    }
     
	//新增行  
    function add() {
        var data = grid_purProjCont.getData();
        grid_purProjCont.addRow({name: "New Row"},data.length+1);
    }
    
    //删除行
    function remove() {
	    var rows = grid_purProjCont.getSelecteds();
	    if(rows.length<1){
	    	nui.alert("请至少选中一条记录！");
	    	return;
	    }
    	grid_purProjCont.removeRows(rows, true);
    }
    
    //千分位
    function drawPurProjContSum(e){
		if (e.field == "purmoney"||e.field == "wzfje") {
            e.cellHtml = "<div align='right'><b>" + nui.formatNumber(e.cellHtml,'n') + "</b></div>";
        }
	}
	
	//选择汇报人
    function selectManager(){
    	var btnEdit = this;
    	nui.open({
            url:"<%=request.getContextPath() %>/machine/SelectEmployee.jsp",
            title: "选择项目",
            width: 850,
            height: 420,
            allowResize: false,
            ondestroy: function (action) {
                if (action == "ok") {
                    var iframe = this.getIFrameEl();
                    var data = iframe.contentWindow.GetData();
                    data = nui.clone(data);    //必须
                    if (data) {
                    	btnEdit.setValue(data.userid);
                        btnEdit.setText(data.empname);
                    }
                }
            }
        });
    }
    
    //附件下载
    function getdetail1(e){
    	return "<a href='javascript:void(0)' onclick='checkDetail1();' title='点击查看'>" + e.value + "</a>";
    }
    
    function checkDetail1(){
    	var grid = nui.get("grid_purOrderFile");
    	var selectRow = grid.getSelected();
    	var url="com.primeton.components.web.fileupload.getfile.flow?fileId="+selectRow.fileId;
		window.open(url, '_self');
    }
    
    function dictstatus(e) {//设置业务字典值
		return nui.getDictText('AME_PCPROTYPE',e.value);
	}
	
	//人员订单关系表，计算单位
	function dictOutperType(e){
		return nui.getDictText('SERV_NUM_TYPE',e.value);//设置业务字典值
	}
	var paymentPlanSum = 0;
	function drawPaymentPlanSum(e){
		if (e.field == "expectedAmount") {
			var html = nui.formatNumber(e.value,"n");
            e.cellHtml = "<div align='right'><b>" + html + "</b></div>";
            paymentPlanSum = (Math.round(e.value*100)/100);  
        } 
        if (e.field == "percentage") {
        	var contmoney = nui.get("contmoney").getValue();
       	 	var html = "";
        	if(contmoney && contmoney > 0) {
        		var p = (Math.round(paymentPlanSum * 10000 / contmoney ) / 100.00);
        		html = nui.formatNumber(p,"n");
        	} else {
        		html = "0.00";
        	}
        	e.cellHtml = "<div align='right'><b>" + html + "%</b></div>";
        }
	}
	function percentageRenderer(e) {
		if(e.value == null) {
			return "";
		}
		return e.value + "%";
	}
	function onDealDate(e){
		if(e.field == "expectedDate"){
			var date = e.value;
			if(date){
				return e.cellHtml.substring(0,7);
			}
		}
	}
</script>
</html>
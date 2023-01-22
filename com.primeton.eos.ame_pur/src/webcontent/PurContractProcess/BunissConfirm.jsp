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
	<title>商务确认</title>
	<meta http-equiv="content-type" content="text/html; charset=UTF-8" />
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
				<input name="purContract.isDirectToSupplier" id="isDirectToSupplier" class="nui-hidden"/>
				<div style="padding:5px;">
					<table style="table-layout:fixed;" id="table_file">
						<tr>
							<td align="right" style="width:120px;">供应商：</td>
							<td style="width:190px;"><input name="purContract.purSupplier.custid" id="custname" class="nui-buttonedit" required="true" style="width:200px" emptyText="请选择供应商" onbuttonclick="selectSupplier" allowInput="false" /></td>
							<td align="right" style="width:100px">合同类型：</td>
							<td style="width:140px;"><input name="purContract.purtype" id="purtype"  class="nui-dictcombobox" dictTypeId="AME_CONTYPE" required="true" style="width:100px" showNullItem="true" nullItemText=""/></td>
							<td align="right" style="width:100px">合同金额：</td>
							<td style="width:180px;"><input name="purContract.contmoney" id="contmoney" class="nui-textbox" style="width:100px" vtype="float"/>&nbsp;(元)</td>
						</tr>
						<tr>
							<td align="right" style="width:120px">有效开始日期：</td>
							<td><input name="purContract.startdate" id="startdate" class="nui-datepicker" vtype="date:yyyy-MM-dd" style="width:100px" onblur="startTime"/></td>
							<td align="right" style="width:100px">有效截止日期：</td>
							<td><input name="purContract.enddate" id="enddate" class="nui-datepicker" vtype="date:yyyy-MM-dd" style="width:100px" onblur="endTime"/></td>
							<td align="right" style="width:100px">我方申请人：</td>
							<td><input name="purContract.ouroper" id="ouroper" class="nui-textbox" vtype="rangeChar:2,30" style="width:100px" /></td>
						</tr>
						<tr>
							<td align="right" style="width:120px">财务对应合同编码：</td>
							<td style="width:140px"><input name="purContract.outcontnum" id="outcontnum" onbuttonclick="selectCont" class="nui-buttonedit" style="width:90px"/><input type='button' align='center' value='查看'style="width:40px" onclick='javascript:lookCsContract()'/></td>
							<td align="right" style="width:100px">成本类型：</td>
							<td><input name="purContract.costtype" id="costtype" class="nui-dictcombobox" dictTypeId="AME_CONTCOSTTYPE" style="width:100px" showNullItem="true"/></td>
							<td align="right" style="width:100px">合同名称：</td>
							<td><input name="purContract.purcontname" id="purcontname" class="nui-textbox" style="width:285px"/></td>
						</tr>
						<tr>
							<td align="right" style="width:120px">供应商联系人：</td>
							<td><input name="purContract.liankman" id="liankman" class="nui-textbox" vtype="rangeChar:2,30" style="width:100px"/></td>
							<td align="right" style="width:100px">联系电话：</td>
							<td><input name="purContract.linktel" id="linktel" class="nui-textbox" vtype="rangeLength:8,30" style="width:150px"/></td>
							<td align="right" style="width:100px">电子邮件：</td>
							<td><input name="purContract.linkemail" id="linkemail" class="nui-textbox" vtype="email" style="width:200px"/></td>
						</tr>
						<tr>
							<td align="right" style="width:120px">采购合同代码：</td>
							<td><input name="purContract.purcontnum" id="purcontnum" class="nui-textbox" style="width:180px"/></td>
						</tr>
						<tr>
							<td align="right" style="width:120px">合同关键内容信息：</td>
							<td colspan="5"><input name="purContract.contKeyinfo" id="contKeyinfo" class="nui-textarea" height="100px" style="width:100%"/></td>
						</tr>
						<tr>
							<td align="right" style="width:120px">说明：</td>
							<td colspan="5"><input name="purContract.comment" id="comment" class="nui-textarea" vtype="rangeChar:0,2000" style="width:100%"/></td>
						</tr>
					</table>
				</div>
			</form>
			<jsp:include page="/ame_common/detailFile.jsp"/>
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
						<div type="purprojcontid" visible="false"></div>
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
			<form id="form3" method="post">
				<input name="purOrder.purorderid" id="purorderid" class="nui-hidden" />	
            	<table style="table-layout:fixed;" id="table_purOrder">
					<tbody>
						<tr>
							<td align="right" style="width:120px">服务客户：</td>
							<td style="width:200px"><input name="purOrder.userid" id="userid" class="nui-buttonedit" onbuttonclick="selectCustmer"  allowInput="false" style="width:200px" /></td>
							<td align="right" style="width:120px">项目名称：</td>
							<td style="width:200px"><input name="purOrder.projectno" id="projectno" class="nui-combobox"   allowInput="false" style="width:200px" /></td>
							<td align="right" style="width:120px">协议签订人员：</td>
							<td style="width:120px"><input name="purOrder.signuserid" id="signuserid" class="nui-buttonedit" onbuttonclick="selectOmEmployee"  allowInput="false" style="width:100px" /></td>
						</tr>
						<tr>
							<td align="right" style="width:120px">采购订单编号：</td>
							<td><input name="purOrder.purordernum" id="purordernum" class="nui-textbox" required="false"  style="width:200px"/></td>
						</tr>
						<tr>
							<td align="right" style="width:120px">结算周期说明：</td>
							<td colspan="5"><input name="purOrder.calcycle" id="calcycle" class="nui-textbox" vtype="rangeChar:0,1000" style="width:100%"/></td>
						</tr>
						<tr>
							<td align="right" style="width:120px">协议内容说明：</td>
							<td colspan="5"><input name="purOrder.contmemo" id="contmemo" class="nui-textarea" vtype="rangeChar:0,2000" allowInput="true" style="width:100%"/></td>
						</tr>
					</tbody>
				</table>
				<div id="grid_1" class="nui-datagrid" style="width:100%;height:auto;" showPager="false" sortMode="client" url="com.primeton.eos.ame_common.file.getFiles.biz.ext" dataField="files" allowCellEdit="true" allowCellSelect="true" multiSelect="true" editNextOnEnterKey="true">
					<div property="columns">
						<div type="indexcolumn" headerAlign="center" width="40" >编号</div>
						<div field="fileName"width="200" headerAlign="center" align="center" renderer="getdetail">附件名称</div>
						<div field="fileType" width="120" renderer="dictKbasetype" align="center" headerAlign="center" >附件类型</div>
						<div field="operatorname" width="80"headerAlign="center" align="center">操作员名称</div>
						<div field="fileTime" width="120" headerAlign="center" align="center" dateFormat="yyyy-MM-dd HH:mm:ss">附件上传时间</div>
					</div>
				</div>
			</form>
		</fieldset>
		<fieldset id="field6" style="border:solid 1px #aaa;padding:3px;">
			<legend>送递信息</legend>
			<form id="form5" method="post">
			<input name="amePostservice[0].post" id="post" class="nui-hidden" value="1"/>
			<input name="amePostservice[0].postid" id="postid" class="nui-hidden" />	
			<input id="receivernameTemp" class="nui-hidden" />	
				<table>
					<tr>
							<td align="right" style="width:150px">送递对象：</td>
							<td style="width:200px"><input type="radio" value="0"  name="isDirectToSupplier" id="isDirectToSupplier" onclick="getRadio()" checked="checked"/>发起人
								<input type="radio" value="1"  name="isDirectToSupplier" id="isDirectToSupplier" onclick="getRadio()"/>供应商</td>
							<td align="right" style="width:150px">送递人：</td>
							<td><input name="amePostservice[0].postorname" id="postorname" class="nui-textbox" required="false" vtype="rangeChar:2,30" style="width:100px"/></td>
						</tr>
						<tr>
							<td align="right" style="width:150px">送递方式：</td>
							<td><input name="amePostservice[0].postway" id="postway" class="nui-dictcombobox" dictTypeId="AME_POSTWAY" style="width:100px" showNullItem="true" nullItemText=""/></td>
							<td align="right" style="width:150px">送递日期：</td>
							<td><input name="amePostservice[0].postdate" id="postdate" class="nui-datepicker" vtype="date:yyyy-MM-dd" required="false"  style="width:100px"/></td>
						</tr>
						<tr>
							<td align="right" style="width:150px">快递公司寄单号：</td>
							<td><input name="amePostservice[0].postno" id="postno" class="nui-textbox" required="false"  style="width:200px"/></td>
							<td align="right" style="width:150px">收件人：</td>
							<td><input name="amePostservice[0].receivername" id="receivername" vtype="rangeChar:2,30" class="nui-textbox" required="false"  style="width:100px"/></td>
						</tr>
						<tr>
							<td align="right" style="width:150px">联系电话：</td>
							<td><input name="amePostservice[0].receiverlinktel" id="receiverlinktel" class="nui-textbox" required="false"  style="width:200px"/></td>
						</tr>
						<tr>
							<td align="right" style="width:150px">邮寄地址：</td>
							<td colspan="3"><input name="amePostservice[0].postaddress" id="postaddress" class="nui-textbox" vtype="rangeChar:0,100" required="false" style="width:100%"/></td>
						</tr>
						<tr>
							<td align="right" style="width:150px">邮寄内容：</td>
							<td colspan="3"><input name="amePostservice[0].postcontent" id="postcontent" class="nui-textbox" vtype="rangeChar:0,100" required="false"  style="width:100%"/></td>
						</tr>
				</table>
			</form>
		</fieldset>
		<jsp:include page="/ame_common/misOpinion.jsp"/>
	</div>
	<div style="text-align:center;padding:10px;" class="nui-toolbar">
		<a class="nui-button" onclick="onOk" id="submitPurCont"  style="width:60px;margin-right:20px;">提交</a>
		<a class="nui-button" onclick="onCancel('cancel')" style="width:60px;">关闭</a>
	</div>
</body>
<script type="text/javascript">
	nui.parse();
  	var form = new nui.Form("form1");
  	var form3 = new nui.Form("form3");
  	var form5 = new nui.Form("form5");
  	var opioionform = new nui.Form("opioionform");
  	//采购合同与项目关系
    var grid_purProjCont = nui.get("grid_purProjCont");
	<% 
	long workItemID=(Long)request.getAttribute("workItemID");
	%>	
	loadData();
	function loadData(){
		document.getElementById("salesEdit").style.display="none";
		document.getElementById("choosehide").style.display="none";
		nui.get("auditopinion").setValue("");
		var data={workItemID:<%=workItemID %> ,getOutpersonAndPost:"0"};
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
				form3.setData(o);
				form5.setData(o);
				<%
			   		UserObject user = (UserObject) session.getAttribute("userObject");
			   		String username = user.getUserName();
			   		String userno = user.getUserId();
			   		
			    %>
			    nui.get("postorname").setValue("<%=username %>");
			    nui.get("postdate").setValue(new Date());
				var grid_0 = nui.get("grid_0");
				grid_0.load({"groupid":"purContract","relationid":o.purContract.purcontid});
				grid_0.sortBy("fileTime","desc");
				nui.get("purOrderYesOrNo").setValue(o.purContract.YesOrNo);
				if(o.purContract.YesOrNo==0){
					document.getElementById("field3").style.display="none";
					//设置邮寄内容
					if(o.purContract.purtype=="0"){
						nui.get("postcontent").setValue("人力服务框架协议打印盖章件");
					}else{
						nui.get("postcontent").setValue("采购合同打印盖章件");
					}
				}else if(o.purContract.YesOrNo==1){
					if(o.purContract.purtype=="0"){
						nui.get("postcontent").setValue("人力服务框架协议和工作协议书打印盖章件");
					}else{
						nui.get("postcontent").setValue("采购合同和工作协议书打印盖章件");
					}
					var grid_1 = nui.get("grid_1");
					grid_1.load({"groupid":"purOrder","relationid":o.purOrder.purorderid});
					grid_1.sortBy("fileTime","desc");
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
               	nui.get("post").setValue("1");
               	nui.get("receivernameTemp").setValue(o.purContract.creator);//临时存储
               	nui.get("receivername").setValue(o.purContract.creator);//默认
            	nui.get("purtype").setText(nui.getDictText('AME_CONTYPE',o.purContract.purtype));
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
	//处理送递环节
    function getRadio(evt){
	    var evt=evt || window.event;   
	    var e =evt.srcElement || evt.target;
	     if(e.value=="0"){
	         var receivernameTemp = nui.get("receivernameTemp").getValue();
			nui.get("receivername").setValue(receivernameTemp);
	     }
	     else if(e.value=="1"){
	         nui.get("receivername").setValue(nui.get("liankman").getValue());
	     }
	}
  	//标准方法接口定义
    function CloseWindow(action) {            
        if (window.CloseOwnerWindow) return window.CloseOwnerWindow(action);
        else window.close();            
    }
    
	function onOk(){
		var purOrderYesOrNo = nui.get("purOrderYesOrNo").getValue();
		if(purOrderYesOrNo==1){
			if(!(form.validate() && form3.validate() && form5.validate())){
				nui.alert("表单信息填写不完整或长度超出限制，请确认必输项是否填写！！");
				return;
			}
		}else{
			if(!form.validate() && form5.validate()){
				nui.alert("表单信息填写不完整或长度超出限制，请确认必输项是否填写！！");
				return;
			}
		}
		//付款计划的预计付款金额汇总要等于合同金额
    	if(nui.get("paymentPlanGrid").getData().length > 0) {
			var contmoney = nui.get("contmoney").getValue();
			if(contmoney === "" || paymentPlanSum != contmoney){
				alert("采购付款计划的付款金额汇总要等于合同金额！");
				return;
			}
    	}
		//拿到isDirectToSupplier
		var temp = document.getElementsByName("isDirectToSupplier");
		var isDirectToSupplier=""; 
		for(var i=0;i<temp.length;i++)  {  
		    if(temp[i].checked)      
		    isDirectToSupplier = temp[i].value;
		}
		nui.get("isDirectToSupplier").setValue(isDirectToSupplier);
		if(confirm("确认提交？")){
			nui.get("submitPurCont").disable();
			SaveData();
		}
	}
    
	function SaveData() {
        var o = form.getData();
        var data3 = form3.getData();
        var data5 = form5.getData();
        var opinion = opioionform.getData();
        var data_purProjCont = grid_purProjCont.getChanges();
        var json = nui.encode({purContract:o.purContract,purOrder:data3.purOrder,misOpinion:opinion.misOpinion,amePostservice:data5.amePostservice[0],purProjConts:data_purProjCont});
        nui.ajax({
            url: "com.primeton.eos.ame_pur.purContractProcess.modifyContractApply.biz.ext",
            data: json,
            type: 'POST',
            cache: false,
            contentType: 'text/json',
            success: function (text) {
                CloseWindow("ok");
            },
            error: function (jqXHR, textStatus, errorThrown) {
            	alert(jqXHR.responseText);
                CloseWindow();
            }
        });
    }
    function onCancel(e) {
        CloseWindow("cancel");
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
    function add() {
        var data = grid_purProjCont.getData();
        grid_purProjCont.addRow({name: "New Row"},data.length+1);
    }
    function remove() {
	    var rows = grid_purProjCont.getSelecteds();
	    if(rows.length<1){
	    	nui.alert("请至少选中一条记录！");
	    	return;
	    }
	    
    	grid_purProjCont.removeRows(rows, true);
    }
    function drawPurProjContSum(e){
		if (e.field == "purmoney"||e.field == "wzfje") {
            e.cellHtml = "<div align='right'><b>" + nui.formatNumber(e.cellHtml,'n') + "</b></div>";
        }
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
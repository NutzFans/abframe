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
	<div id="custname">&nbsp;</div>
		<fieldset id="field1" style="border:solid 1px #aaa;padding:3px;">
			<legend>采购合同基本信息</legend>
			<div style="padding:5px;">
				<table style="table-layout:fixed;" id="table_file" >
					<tr>
						<td align="right" style="width:130px">合同名称：</td>
						<td id="purcontname" style="width:305px"></td>
						<td align="right" style="width:120px">我方申请人：</td>
						<td id="ouroper" style="width:100px"></td>
						<td align="right" style="width:120px">签订日期：</td>
						<td style="width:120px;" id="signdate"></td>
					</tr>
					<tr>
						<td align="right" style="width:130px">有效开始日期：</td>
						<td id="startdate" style="width:100px"></td>
						<td align="right" style="width:120px">有效截止日期：</td>
						<td style="width:120px;" id="enddate" ></td>
						<td align="right" style="width:120px">合同编号：</td>
						<td id="purcontnum" style="width:200px"></td>
					</tr>
					<tr>
						<td align="right" style="width:130px">财务对应合同编码：</td>
						<td id="outcontnum" style="width:120px;" ></td>
						<td align="right" style="width:120px">成本类型：</td>
						<td id="costtype" style="width:200px"></td>
					</tr>
					<tr>
						<td align="right" style="width:130px">合同关键内容信息：</td>
						<td colspan="5" id="contKeyinfo"></td>
					</tr>
					<tr>
						<td align="right" style="width:130px">说明：</td>
						<td colspan="5" id="comment"></td>
					</tr>
				</table>
			</div>
			<jsp:include page="/ame_common/detailFile.jsp"/>
		</fieldset>
		<fieldset id="field3" style="border:solid 1px #aaa;padding:3px;">
			<legend>采购订单基本信息</legend>
			<form id="purOrder" method="post">
				<input name="purOrder.purorderid" id="purorderid" class="nui-hidden" />	
				<input name="purOrder.fileids" id="fileids1" class="nui-hidden" />	
            	<table style="table-layout:fixed;" id="table_purOrder">
					<tbody>
						<tr>
							<td align="right" style="width:120px">服务客户：</td>
							<td style="width:200px"><input name="purOrder.userid" id="userid" class="nui-buttonedit" onbuttonclick="selectCustmer"  allowInput="false" style="width:200px" /></td>
							<td align="right" style="width:120px">项目名称：</td>
							<td style="width:200px"><input name="purOrder.projectno" id="projectno" class="nui-combobox" valueField="projectno" textField="projectName" allowInput="false"  style="width:200px" showNullItem="true" nullItemText=""/></td>
							<td align="right" style="width:120px">协议签订人员：</td>
							<td style="width:110px"><input name="purOrder.signuserid" id="signuserid" class="nui-buttonedit" onbuttonclick="selectOmEmployee"  allowInput="false" vtype="rangeChar:2,30" style="width:100px" /></td>
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
							<td colspan="5"><input name="purOutPerson.outpername" id="outpername" class="nui-hidden" allowInput="false" style="width:100%"/></td>
							<td colspan="5"><input name="purOutPerson.outperno" id="outperno" class="nui-hidden" style="width:100%"/></td>
						</tr>
					</tbody>
				</table>
			</form>
			<div id="grid_1" class="nui-datagrid" style="width:100%;height:auto;" showPager="false" sortMode="client" url="com.primeton.eos.ame_common.file.getFiles.biz.ext" dataField="files" allowCellEdit="true" allowCellSelect="true" multiSelect="true" editNextOnEnterKey="true">
				<div property="columns">
					<div type="indexcolumn" headerAlign="center" width="15" >编号</div>
					<div field="fileName"width="50" headerAlign="center" align="center" renderer="getdetail1">附件名称</div>
					<div field="fileType" width="50" renderer="dictKbasetype" align="center" headerAlign="center" >附件类型</div>
					<div field="operatorname" width="50"headerAlign="center" align="center">操作员名称</div>
					<div field="fileTime" width="50" headerAlign="center" align="center" dateFormat="yyyy-MM-dd HH:mm:ss">附件上传时间</div>
					<div renderer="deleteOrderFile" width="60" headerAlign="center" align="center">操作</div>
				</div>
			</div>
			<jsp:include page="/ame_common/addFiles1.jsp"/>
			<fieldset id="field4" style="border:solid 1px #aaa;padding:3px;">
				<legend>外包人员基本信息</legend>
		        <div style="width:100%;">
			        <div class="mini-toolbar" style="border-bottom:0;padding:0px;">
			            <table style="width:100%;">
			                <tr>
			                    <td style="width:100%;">
			                        <a class="mini-button" iconCls="icon-add" onclick="add()">增加</a>
			                        <!-- 注意 这个保存按钮跟点击提交按钮调用方法不一样-->
			                        <a class="mini-button" iconCls="icon-save" onclick="save()">保存</a>            
			                    </td>
			                </tr>
			            </table>           
			        </div>
			    </div>
				<div id="datagrid" class="nui-datagrid" dataField="purOutpersons" style="width:100%;height:auto;" 
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
						<div field="price" width="80" dataType="currency" align="center" headerAlign="center">
							单价
							<input property="editor" class="nui-spinner" format="n2" allowLimitValue="false" changeOnMousewheel="false" increment="0" showButton="false"  style="width:100px;background:#9ACD32;" inputStyle="text-align:right;" allowInput="true" />
						</div>
						<div field="startdate" width="80" align="center" renderer="onDealDate" headerAlign="center">
							服务开始日期
							<input property="editor" class="nui-datepicker" format="yyyy-MM-dd" style="width:100%;" />
						</div>
						<div field="expenddate" width="100" align="center" renderer="onDealDate" headerAlign="center">
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
		</fieldset>
		<jsp:include page="/ame_common/misOpinion.jsp"/>
		<jsp:include page="/ame_common/addFiles.jsp"/>
	</div>
	<div style="text-align:center;padding:10px;" class="nui-toolbar">
		<a class="nui-button" onclick="onOk" id="submitPurOrder"  style="width:60px;margin-right:20px;">提交</a>
		<a class="nui-button" onclick="onCancel('cancel')" style="width:60px;">关闭</a>
	</div>
</body>
<script type="text/javascript">
	nui.parse();
  	var form3 = new nui.Form("purOrder");
  	var opioionform = new nui.Form("opioionform");
  	var datagrid = nui.get("datagrid");
	<% 
	long workItemID=(Long)request.getAttribute("workItemID");
	%>	
	var custid ;
	var custname;
	var outcontnum;
	loadData();
	function loadData(){
		var data={workItemID:<%=workItemID %>};
		var json=nui.encode(data);
		nui.ajax({
			url:"com.primeton.eos.ame_pur.purOrderProcess.queryPurOrderWorkItem.biz.ext",
			type:"post",
			data:json,
			contentType:"text/json",
			success:function (o){
				form3.setData(o);
				nui.get("userid").setText(o.purOrder.custname);
                nui.get("projectno").setText(o.purOrder.projectName);	
                nui.get("signuserid").setText(o.purOrder.empname);
				document.getElementById("custname").innerText="供应商：" + o.purContract.purSupplier.custname;
				document.getElementById("purcontnum").innerHTML = o.purContract.purcontnum == null ?"":o.purContract.purcontnum;
                document.getElementById("purcontname").innerHTML = o.purContract.purcontname == null ?"":o.purContract.purcontname;
                document.getElementById("ouroper").innerHTML = o.purContract.ouroper == null ?"":o.purContract.ouroper;
                document.getElementById("signdate").innerHTML = o.purContract.signdate == null ?"":o.purContract.signdate;
                document.getElementById("startdate").innerHTML = o.purContract.startdate == null ?"":o.purContract.startdate;
                document.getElementById("enddate").innerHTML = o.purContract.enddate == null ?"":o.purContract.enddate;
                document.getElementById("contKeyinfo").innerHTML = o.purContract.contKeyinfo == null ?"":o.purContract.contKeyinfo;
                document.getElementById("comment").innerHTML = o.purContract.comment == null ?"":o.purContract.comment;
                
                outcontnum =o.purContract.outcontnum;
                document.getElementById("outcontnum").innerHTML = o.purContract.outcontnum == null ?"":"<a href='javascript:void(0)' onclick='javascript:lookCsContract()' title='点击查看合同信息'>" + o.purContract.outcontnum + "</a>";
                document.getElementById("costtype").innerHTML =  nui.getDictText('AME_CONTCOSTTYPE',o.purContract.costtype);
                //合同附件查询
				var grid_0 = nui.get("grid_0");
				grid_0.load({"groupid":"purContract","relationid":o.purContract.purcontid});
				grid_0.sortBy("fileTime","desc");
				//订单附件查询
				var grid_1 = nui.get("grid_1");
				grid_1.load({"groupid":"purOrder","relationid":o.purOrder.purorderid});
				grid_1.sortBy("fileTime","desc");
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
				//外包人员信息
				custid = o.purContract.purSupplier.custid;
				custname = o.purContract.purSupplier.custname;
            	var purorderid = o.purOrder.purorderid;
            	var projectno = o.purOrder.projectno;
            	var projectName = o.purOrder.projectName;
            	var json2 = nui.decode({purSupplier:{purorderid:purorderid,custid:custid,projectName:projectName,projectno:projectno}});
            	datagrid.sortBy("outperno","desc");
            	datagrid.load(json2,function (){
            		datagrid.selectAll(false);
            		var rows = datagrid.getSelecteds();
            		for(var i = 0;i < rows.length;i++){
            			if(!rows[i].purorderid){
            				datagrid.deselect(rows[i]);
            			}
            		}
            	});
            	//流程提示信息
        		promptInit({workItemID:<%=workItemID %>});
			},
			error:function(){}
		});
	}
	
    function dictstatus(e) {
		return nui.getDictText('AME_PCPROTYPE',e.value);//设置业务字典值
	}
  	//标准方法接口定义
    function CloseWindow(action) {            
        if (window.CloseOwnerWindow) return window.CloseOwnerWindow(action);
        else window.close();            
    }
    
	function onOk(){
		//流程终止不需要校验，直接调用逻辑流处理
		if(nui.get("auditstatus").getValue()==2){
			if(confirm("确认终止？")){
				nui.get("submitPurOrder").disable();
				SaveData();
				return;
			}
		}
		//如果退回，外包人员不保存
		if(nui.get("auditstatus").getValue()==0){
			if(confirm("确认退回？")){
				nui.get("submitPurOrder").disable();
				SaveData();
				return;
			}
		}
		if(!form3.validate()){
			nui.alert("表单信息填写不完整或长度超出限制，请确认必输项是否填写！！");
			return;
		}
		var outpername = nui.get("outpername").getValue();
		if(outpername==""||outpername==null){
			nui.alert("请选择外包人员！");
		}else{
			var rows = datagrid.getSelecteds();
	    	for(var i = 0;i < rows.length;i ++){
	    		if(!rows[i].workunit){
					nui.alert("外包人员:" + rows[i].outpername + "的工作量计量单位不能为空");
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
			if(confirm("外包人员为："+outpername +",确认提交？")){
				nui.get("submitPurOrder").disable();
	            saveAndDelPer();
			}
		}
	}
    
	function SaveData1(){
    	document.getElementById("fileCatalog").value="MisOpinion";
        form2.submit();
	}
	
	function SaveData() {
	        var data3 = form3.getData();
	        var data5 = opioionform.getData();
    		//外包人员信息
			var rows = datagrid.getSelecteds();
	        var json1 = {purOrder:data3.purOrder,misOpinion:data5.misOpinion};
	        var json = nui.encode(json1);
	        nui.ajax({
	            url: "com.primeton.eos.ame_pur.purOrderProcess.modifyPurOrderApply.biz.ext",
	            data: json,
	            type: 'POST',
	            cache: false,
	            contentType: 'text/json',
	            success: function (text) {
	                CloseWindow("ok");
	            },
	            error: function (jqXHR, textStatus, errorThrown) {
	            	nui.alert("任务处理失败，请联系信息技术部人员！");
	                nui.alert(jqXHR.responseText);
	                CloseWindow();
	            }
	        });
    } 
    
    function onCancel(e) {
        CloseWindow("cancel");
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
				                nui.alert(jqXHR.responseText);
				                CloseWindow();
				            }
				    	});
                    }
                }
            }
        });
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
		var rows = datagrid.getSelecteds();
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
	function add() {
		if(datagrid.getChanges()!=""){
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
                var data = { custid:custid,custname:custname};//全局变量
                iframe.contentWindow.PMOaddPer(data);
            },
            ondestroy: function (action) {
            	if(action =="ok"){
	            	var purorderid = nui.get("purorderid").getValue();
	            	var projectno = nui.get("projectno").getValue();
	            	var projectName = nui.get("projectno").getText();
                	var json2 = nui.decode({purSupplier:{purorderid:purorderid,custid:custid,projectno:projectno,projectName:projectName}});
                	datagrid.sortBy("outperno","desc");
                	datagrid.load(json2,function (){
                		datagrid.selectAll(false);
                		var rows = datagrid.getSelecteds();
                		for(var i = 0;i < rows.length;i++){
                			if(!rows[i].purorderid){
                				datagrid.deselect(rows[i]);
                			}
                		}
                	});
            	}
            }
        });
    }
    
        /** 保存按钮已选外包人员*/
	function save(){
		var rows = datagrid.getSelecteds();
		if(rows.length==0){
			nui.alert("请选中一条记录！");
			return;
		}
    	for(var i = 0;i < rows.length;i ++){
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
		//订单编号 人员编号 姓名 人月单价 服务开始日期 预计服务截止日期 汇报人 电脑提供方式 说明R
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
	            	var purorderid = nui.get("purorderid").getValue();
                	var json2 = nui.decode({purSupplier:{purorderid:purorderid,custid:custid}});
                	datagrid.sortBy("outperno","desc");
                	datagrid.load(json2,function (){
                		datagrid.selectAll(false);
                		var rows = datagrid.getSelecteds();
                		for(var i = 0;i < rows.length;i++){
                			if(!rows[i].purorderid){
                				datagrid.deselect(rows[i]);
                			}
                		}
                	});
	            },
	            error: function (jqXHR, textStatus, errorThrown) {
	                nui.alert(jqXHR.responseText);
	                CloseWindow();
	            }
	        });
		}else{
			nui.alert("请至少选中一条记录！");
			return;
		}
	}
		
        /** 提交时保存已选外包人员剔除*/
	function saveAndDelPer(){
		var allPerson = datagrid.getData();
		var rows = datagrid.getSelecteds();
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
	            	if(text.exception!=null){
		            	return;
	            	}else{
	                	document.getElementById("fileCatalog1").value="purOrder";
						form4.submit();
	            	}
	            },
	            error: function (jqXHR, textStatus, errorThrown) {
	                nui.alert(jqXHR.responseText);
	                CloseWindow();
	            }
	        });
		}else{
			nui.alert("请至少选中一条记录！");
			return;
		}
	}
		
    //设置日期格式
	function onDealDate(e){
		if(e.value){
			return e.value.substring(0,10);
		}
	}
	
	//附件下载
    function getdetail1(e){
    	return "<a href='javascript:void(0)' onclick='checkDetail1();' title='点击查看'>" + e.value + "</a>";
    }
    
    function checkDetail1(){
    	var grid = nui.get("grid_1");
    	var selectRow = grid.getSelected();
    	var url="com.primeton.components.web.fileupload.getfile.flow?fileId="+selectRow.fileId;
		window.open(url, '_self');
    }
    
    //人员订单关系表，计算单位
	function dictOutperType(e){
		return nui.getDictText('SERV_NUM_TYPE',e.value);//设置业务字典值
	}
	
	function deleteOrderFile(e){
        var record = e.record;
        var uid = record._uid;
    	return "<a href='javascript:void(0)' onclick='deleteOrderFile1(" + uid + ")'>删除 </a>";
    }
    
    function deleteOrderFile1(uid){
    	var grid = nui.get("grid_1");
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
    
    function lookCsContract(){
		//为了公用 页面只能传过去contractid
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
  	
  	//选择汇报人
    function selectManager(){
    	var btnEdit = this;
    	nui.open({
            url:"<%=request.getContextPath() %>/machine/SelectEmployee.jsp",
            title: "选择人员",
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
</script>
</html>
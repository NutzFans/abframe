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
	<title>商务复核</title>
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
			<legend>采购订单</legend>
			<form id="form3" method="post">
				<input name="purOrder.purorderid" id="purorderid" class="nui-hidden" />
				<input name="purOrder.fileids" id="fileids1" class="nui-hidden" />
				<input name="purOrder.setleaders" id="setleaders" class="nui-hidden" />
            	<table style="table-layout:fixed;" id="table_purOrder">
					<tbody>
						<tr>
							<td align="right" style="width:120px">服务客户：</td>
							<td style="width:200px"><input name="purOrder.userid" id="userid" class="nui-buttonedit" onbuttonclick="selectCustmer"  allowInput="false" style="width:200px" /></td>
							<td align="right" style="width:120px">项目名称：</td>
							<td style="width:200px"><input name="purOrder.projectno" id="projectno" class="nui-combobox" textField="projectName" valueField="projectno" onclick="selectProject" onbuttonclick="selectProject"  allowInput="false" style="width:200px" showNullItem="true" nullItemText=""/></td>
							<td align="right" style="width:120px">协议签订人员：</td>
							<td style="width:120px"><input name="purOrder.signuserid" id="signuserid" class="nui-buttonedit" onbuttonclick="selectOmEmployee"  allowInput="false" style="width:100px" /></td>
						</tr>
						<tr>
							<td align="right" style="width:120px">采购订单编号：</td>
							<td colspan="5"><input name="purOrder.purordernum" id="purordernum" class="nui-textbox" style="width:200px"/></td>
						</tr>
						<tr>
							<td align="right" style="width:120px">结算周期说明：</td>
							<td colspan="5"><input name="purOrder.calcycle" id="calcycle" class="nui-textarea" vtype="rangeChar:0,1000" style="width:100%"/></td>
						</tr>
						<tr>
							<td align="right" style="width:120px">协议内容说明：</td>
							<td colspan="5"><input name="purOrder.contmemo" id="contmemo" class="nui-textarea" vtype="rangeChar:0,2000" allowInput="true" style="width:100%"/></td>
						</tr>
					</tbody>
				</table>
				<div id="grid_1" class="nui-datagrid" style="width:100%;height:auto;" showPager="false" sortMode="client" url="com.primeton.eos.ame_common.file.getFiles.biz.ext" dataField="files" allowCellEdit="true" allowCellSelect="true" multiSelect="true" editNextOnEnterKey="true">
					<div property="columns">
						<div type="indexcolumn" headerAlign="center" width="15" >编号</div>
						<div field="fileName"width="50" headerAlign="center" align="center" renderer="getdetail1">附件名称</div>
						<div field="fileType" width="50" renderer="dictKbasetype" align="center" headerAlign="center" >附件类型</div>
						<div field="operatorname" width="50" headerAlign="center" align="center">操作员名称</div>
						<div field="fileTime" width="50" headerAlign="center" align="center" dateFormat="yyyy-MM-dd HH:mm:ss">附件上传时间</div>
						<div renderer="deleteOrderFile" width="60" headerAlign="center" align="center">操作</div>
					</div>
				</div>
			</form>
			<jsp:include page="/ame_common/addFiles1.jsp"/>
		</fieldset>
		<fieldset style="border:solid 1px #aaa;padding:3px;" id="field_order">
            <legend>协议书人员信息</legend>
				<div id="grid_outper" class="nui-datagrid" style="width:100%;height:auto;" allowResize="true" dataField="purOrderOutpers" 
			    	url="com.primeton.eos.ame_pur.purContractProcess.queryOutperByOrder.biz.ext" 
			    	idField="appid" multiSelect="true" allowAlternating="true" showPager="false">
					<div property="columns">
						<div field="purOutperson.outperno" align="center" headerAlign="center" allowSort="true" visible="false">人员编号</div>
						<div field="purOutperson.outpername" width="50" align="center" headerAlign="center">姓名</div>	
						<div field="purOutperson.degree" width="60" align="center" headerAlign="center" renderer="dictDegreeType">学历</div>
						<div field="purOutperson.gradudate" width="90" align="center" headerAlign="center">毕业时间</div>
						<div field="price" width="80" align="center" dataType="currency" headerAlign="center" allowSort="true">单价</div>	
						<div field="workunit" width="60" align="center" headerAlign="center" allowSort="true" renderer="dictOutperType">计量单位</div>
						<div field="startdate" width="85" align="center" headerAlign="center" allowSort="true">服务开始日期</div>	
						<div field="expenddate" width="90" align="center" headerAlign="center" allowSort="true">预计服务结束日期</div>
						<div field="projectName" width="90" align="center" headerAlign="center">项目</div>	
						<div field="managername" width="70" align="center" headerAlign="center">汇报人</div>
						<div field="pcprotype" width="80" align="center" headerAlign="center" renderer="onFileRendererway">电脑提供方式</div>	
						<div field="purOutperson.linktel" width="90" align="center" headerAlign="center">联系电话</div>	
						<div field="comment" width="90" align="center" headerAlign="center">说明</div>	
					</div>
				</div>
		</fieldset>
		<form id="opioionform" method="post">
			<input name="misOpinion.auditstatus" value="1" class="nui-hidden" />
		    <input name="misOpinion.auditopinion" value="修改合同审批信息" class="nui-hidden" />
		    <input name="misOpinion.processinstid" id="processinstid" class="nui-hidden" />
		    <input name="misOpinion.processinstname" id="processinstname" class="nui-hidden" />
		    <input name="misOpinion.activitydefid" id="activitydefid" class="nui-hidden" />
		    <input name="misOpinion.workitemid" id="workitemid" class="nui-hidden" />
		    <input name="misOpinion.workitemname" id="workitemname" class="nui-hidden" />
		    <input name="misOpinion.isshow" id="isshow" class="nui-hidden" />
			<input name="misOpinion.fileids" id="fileids"  class="nui-hidden"/>
			<fieldset style="border:solid 1px #aaa;padding:3px;">
		        <legend>审批意见列表</legend>
		        	<div id="datagrid1" class="nui-datagrid" style="width:100%;height:auto;" dataField="misOpinions"
					    url="com.primeton.eos.ame_pur.purContractProcess.queryAuditOpinions.biz.ext"  idField="id" allowResize="true"
					    allowAlternating="true" multiSelect="true" showPager="false" allowCellWrap="true" >
					    <div property="columns">
					        <div field="operatorname" width="50" headerAlign="center" align="center">审批人</div>
					        <div field="workitemname" width="80" align="center" headerAlign="center" >审批环节</div>
					        <div field="auditstatus" renderer="onCheckRenderer" width="80" align="center" headerAlign="center" >审批结果</div>
					        <div field="auditopinion" width="160" headerAlign="center">审批意见</div>
					        <div field="time" width="90" headerAlign="center" allowSort="true" align="center" dateFormat="yyyy-MM-dd HH:mm:ss">审批时间</div>
					        <div field="orgname" width="100" align="center" headerAlign="center">审批人所在机构</div>
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
		                </tr>
		                <tr id="choosehide">
		                    <td  style="width:150px;" align="right">回退到：</td> 
		                    <td style="width:140px;">
		                    	<input name="misOpinion.backTo" id="backTo" class="nui-combobox" valueField="id" textField="name" style="width:200px" required="true" showNullItem="true" nullItemText=""/>
		                    </td>
		                </tr>
		                <tr>
		                    <td style="width:150px;" align="right">审核意见：</td>
		                    <td colspan="3">
		                        <input name="misOpinion.auditopinion" id="auditopinion" class="nui-textarea" required="false" style="width:600px;height:60px;"/>
		                    </td>
		                </tr>
			            <tr>
		                    <td style="width:150px;" align="right">会签审批人：</td>
		                    <td colspan="3">   
			                    <input id="checkerid" name="misOpinion.checkerid" class="nui-buttonedit" onbuttonclick="showEmployee" style="width:600px;"  allowInput="false"/>		                     
		                    </td>
		                </tr>
		            </table>
		        </div>
		    </fieldset>
	    </form>
		<jsp:include page="/ame_common/addFiles.jsp"/>
	</div>
	<div style="text-align:center;padding:10px;" class="nui-toolbar">
		<a class="nui-button" onclick="onOk" id="submitPurOrder" style="width:60px;margin-right:20px;">提交</a>
		<a class="nui-button" onclick="onCancel('cancel')" style="width:60px;">关闭</a>
	</div>
</body>
<script type="text/javascript">
	nui.parse();
  	var form3 = new nui.Form("form3");
  	var opioionform = new nui.Form("opioionform");
	<% 
	long workItemID=(Long)request.getAttribute("workItemID");
	%>	
	var outcontnum;
	loadData();
	document.getElementById("choosehide").style.display="none";
	function loadData(){
		var data={workItemID:<%=workItemID %>,getLeaders:"1"};
		var json=nui.encode(data);
		nui.ajax({
			url:"com.primeton.eos.ame_pur.purOrderProcess.queryPurOrderWorkItem.biz.ext",
			type:"post",
			data:json,
			contentType:"text/json",
			success:function (o){
				form3.setData(o);
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
				nui.get("userid").setText(o.purOrder.custname);
                nui.get("projectno").setText(o.purOrder.projectName);	
                nui.get("signuserid").setText(o.purOrder.empname);
                //外包人员
	 		  	var grid_outper = nui.get("grid_outper");
				grid_outper.load({purOrder:{purorderid:o.purOrder.purorderid}});
				grid_outper.sortBy("purOutperson.outperno", "desc");
				//设置审核意见基本信息
            	nui.get("processinstid").setValue(o.workitem.processInstID);
               	nui.get("processinstname").setValue(o.workitem.processInstName);
               	nui.get("activitydefid").setValue(o.workitem.activityDefID);
               	nui.get("workitemname").setValue(o.workitem.workItemName);
				nui.get("workitemid").setValue(<%=workItemID %>);
               	nui.get("isshow").setValue("1");
               	nui.get("setleaders").setValue("1");
// 	            	nui.get("purtype").setText(nui.getDictText('AME_CONTYPE',o.purContract.purtype));
            	nui.get("backTo").setData(o.purContract.backList);
            	//初始化审核意见字典
            	var dataStatus=[{"dictID": 1,"dictName": "通过"},{"dictID": 0,"dictName": "退回"},{"dictID": 2,"dictName": "终止流程"}];
				nui.get("auditstatus").setData(dataStatus);
				nui.get("auditstatus").setValue(1);
            	//查询审核意见
            	var processinstid = nui.get("processinstid").getValue();
				var grid = nui.get("datagrid1");
				grid.load({processInstID:processinstid});
				grid.sortBy("time", "desc");
				
				//会签审批人lookup2
				var name = "";
                var id = "";
                for(var i=0;i<o.leaders2.length;i++){
                	name += o.leaders2[i].name+",";
                	id += o.leaders2[i].id+",";
                }
                name = name.substring(0,name.length-1);
                id = id.substring(0,id.length-1);
                nui.get("checkerid").setValue(id);
                nui.get("checkerid").setText(name);
                //流程提示信息
        		promptInit({workItemID:<%=workItemID %>});
			},
			error:function(){}
		});
	}
	//审核结果触发
    nui.get("auditopinion").setValue("同意。");
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
	
	function dictOutperType(e){
		return nui.getDictText('SERV_NUM_TYPE',e.value);//设置业务字典值
	}
	
	function onFileRendererway(e){
		return nui.getDictText('AME_PCPROTYPE',e.value);
	}
	
	//审批结果
    function onCheckRenderer(e) {
		return nui.getDictText('MIS_AUDITSTATUS',e.value);//设置业务字典值
	}
	
	//合同审批意见附件信息
  	function onFileRenderer(e) {
        var tempSrc = "";
        for(var i=0;i<e.record.files.length;i++){
        	tempSrc += "<a href='com.primeton.components.web.fileupload.getfile.flow?fileId=" + e.record.files[i].fileId + "'>" + e.record.files[i].fileName + "</a>,&nbsp;&nbsp;&nbsp;&nbsp;";
        }
       	return tempSrc;
  	}
  	
  	function dictOutperType(e){
		return nui.getDictText('SERV_NUM_TYPE',e.value);//设置业务字典值
	}
	
    function dictDegreeType(e){
		return nui.getDictText('DEGREE',e.value);//设置业务字典值
	}
	
  	//标准方法接口定义
    function CloseWindow(action) {            
        if (window.CloseOwnerWindow) return window.CloseOwnerWindow(action);
        else window.close();            
    }
    
    function onOk() {
		if(!(form3.validate() && opioionform.validate())){
			nui.alert("表单信息填写不完整或长度超出限制，请确认必输项是否填写！！");
			return;
		}
    	var filePaths1 = document.getElementsByName("uploadfile1").length;
    	for(var j=0;j<filePaths1;j++){
    		var a=document.getElementsByName("remarkList1")[j].value;
    		if(a==null||a==""){
    			nui.alert("工作协议书新增附件不可以为空！");
    			return false;
    		}
    	}
    	var filePaths = document.getElementsByName("uploadfile").length;
    	for(var j=0;j<filePaths;j++){
    		var a=document.getElementsByName("remarkList")[j].value;
    		if(a==null||a==""){
    			nui.alert("审批意见新增附件不可以为空！");
    			return false;
    		}
    	}
    	if(confirm("确认提交？")){
			nui.get("submitPurOrder").disable();
			document.getElementById("fileCatalog1").value="purOrder";
			form4.submit();
    	}
    }
	
	function SaveData1(){
    	document.getElementById("fileCatalog").value="MisOpinion";
        form2.submit();
	}
    
	function SaveData() {
        var data3=form3.getData();
        var data5=opioionform.getData();
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
                nui.alert(jqXHR.responseText);
                CloseWindow();
            }
        });
    }
    
    function onCancel(e) {
        CloseWindow("cancel");
    }
	//选择供应商弹窗
    function showSupplier(e) {
        var btnEdit = this;
        nui.open({
			url:"<%=request.getContextPath() %>/ame_pur/PurSupplier/SelectSupplier.jsp",
			title: "选择列表",
			width: 600,
			height: 400,
			ondestroy: function (action) {
				if (action == "ok") {
					var iframe = this.getIFrameEl();
					var data = iframe.contentWindow.GetData();
					data = nui.clone(data);    //必须
					if (data) {
		                btnEdit.setValue(data.custid);
		                btnEdit.setText(data.custname);       		                
					}
				}
				nui.get("custname").validate();
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
                    }
                }
            }
        });
    }
    
    //获取项目下拉列表
    function selectProject(){
    	var custid = nui.get("userid").getValue();
    	if(custid==null||custid==""){
    		nui.alert("请先选择客户！");
    		return;
    	}
    	var json = nui.encode({rdProject: {custid: custid}}); //服务客户userid
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
    
    //修改会签审批人
    function showEmployee(e) {
        var btnEdit = this;
        nui.open({
			url:"<%=request.getContextPath() %>/ame_common/tree/lazytree.jsp",
			title: "选择列表",
			width: 600,
			height: 400,
			onload: function () {
                var iframe = this.getIFrameEl();
                var empname=nui.get("checkerid").getText();
                var userid=nui.get("checkerid").getValue();
                if(userid){
                	var data = {empname:empname,userid:userid};
                }else{
                	var data={};
                }
                iframe.contentWindow.SetData(data);
            },
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
    	var grid = nui.get("grid_1");
    	var selectRow = grid.getSelected();
    	var url="com.primeton.components.web.fileupload.getfile.flow?fileId="+selectRow.fileId;
		window.open(url, '_self');
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
</script>
</html>
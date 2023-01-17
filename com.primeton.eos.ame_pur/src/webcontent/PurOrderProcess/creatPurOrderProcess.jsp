<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@page import="com.eos.data.datacontext.UserObject"%>
<html>
<!-- 
  - Author(s): wanglinqiong
  - Date: 2016-05-12 16:17:56
  - Description:
-->
<head>
<title>发起采购订单流程</title>
<meta http-equiv="content-type" content="text/html; charset=UTF-8" />
<script src="<%= request.getContextPath() %>/common/nui/nui.js" type="text/javascript"></script>
	<style type="text/css">
	    body{
	        margin:0;padding:0;border:0;width:100%;height:100%;overflow:hidden;
	    }
	    .asLabel{border:0;background-color:#F5F5F5;cursor:default;}
    </style>
</head>
<body>
<div class="nui-fit">
	<div class="mini-panel" title="发起采购工作协议书审批流程" style="width: auto">
	<!-- 提示信息展示 -->
	<jsp:include page="/ame_common/ameFlowOperTips/ameFlowOperTipsInfo.jsp"/>
		<fieldset id="field3" style="border:solid 1px #aaa;padding:3px;">
			<legend>请选择供应商</legend>
				<div style="padding:5px;">
					选择供应商：<input name="purContract.purSupplier.custid" id="custid" class="nui-buttonedit" required="true" style="width:280px" emptyText="请选择供应商" onbuttonclick="selectSupplier" allowInput="false" />
					选择合同：<input name="purContract.purcontname" id="purContract.purcontname" onvaluechanged="changePurcont" class="nui-combobox" valueField="purcontid" textField="purcontname" allowInput="false"  style="width:300px" />
				</div>
		</fieldset>
		<fieldset id="field1" style="border:solid 1px #aaa;padding:3px;">
			<legend>采购合同基本信息</legend>
				<div style="padding:5px;">
					<table style="table-layout:fixed;" id="table_file" >
						<tr>
							<td align="right" style="width:120px">合同编号：</td>
							<td id="purcontnum" style="width:200px" class="asLabel"></td>
							<td align="right" style="width:120px">我方申请人：</td>
							<td id="ouroper" style="width:100px" class="asLabel"></td>
							<td align="right" style="width:120px">签订日期：</td>
							<td style="width:120px;" id="signdate" class="asLabel"></td>
						</tr>
						<tr>
							<td align="right" style="width:120px">有效开始日期：</td>
							<td id="startdate" style="width:100px" class="asLabel"></td>
							<td align="right" style="width:120px">有效截止日期：</td>
							<td style="width:120px;" id="enddate" class="asLabel"></td>
							<td align="right" style="width:120px">成本类型：</td>
							<td id="costtype" style="width:200px" class="asLabel"></td>
						</tr>
						<tr>
							<td align="right" style="width:120px">财务对应合同编码：</td>
							<td id="outcontnum" style="width:120px;" class="asLabel"></td>
						</tr>
						<tr>
							<td align="right" style="width:120px">合同关键内容信息：</td>
							<td colspan="5" id="contKeyinfo" class="asLabel"></td>
						</tr>
						<tr>
							<td align="right" style="width:120px">说明：</td>
							<td colspan="5" id="comment" class="asLabel"></td>
						</tr>
					</table>
				</div>
			<jsp:include page="/ame_common/detailFile.jsp"/>
		</fieldset>
		<fieldset id="field3" style="border:solid 1px #aaa;padding:3px;">
			<legend>采购订单基本信息</legend>
			<form id="form3" method="post">
				<input name="purOrder.fileids" id="fileids"  class="nui-hidden"/>
				<input name="purOrder.purstatus" id="purstatus" class="nui-hidden" />
				<div style="padding:5px;">
					<table style="table-layout:fixed;" id="table_purOrder">
						<tr>
							<td align="right" style="width:120px">服务客户：</td>
							<td style="width:200px"><input name="purOrder.userid" id="userid" class="nui-buttonedit" onbuttonclick="selectCustmer" required="true" allowInput="false" style="width:200px" /></td>
							<td align="right" style="width:120px">项目名称：</td>
							<td style="width:200px"><input name="purOrder.projectno" id="projectno" class="nui-combobox" valueField="projectno" textField="projectName" allowInput="false" showNullItem="true" nullItemText="" style="width:200px" /></td>
							<td align="right" style="width:120px">协议签订人员：</td>
							<td style="width:120px"><input name="purOrder.signuserid" id="signuserid" class="nui-buttonedit" onbuttonclick="selectOmEmployee"  allowInput="false" vtype="rangeChar:2,30" style="width:100px" /></td>
						</tr>
						<tr>
							<td align="right" style="width:120px">结算周期说明：</td>
							<td colspan="5"><input name="purOrder.calcycle" id="calcycle" class="nui-textarea" allowInput="true" vtype="rangeChar:0,1000" style="width:100%"/></td>
						</tr>
						<tr>
							<td align="right" style="width:120px">协议内容说明：</td>
							<td colspan="5"><input name="purOrder.contmemo" id="contmemo" class="nui-textarea" allowInput="true" vtype="rangeChar:0,2000" style="width:100%"/></td>
						</tr>
					</table>
				</div>
			</form>
			<span>工作协议书附件包含：工作协议书电子表格，协议书涉及人员简历、身份证、毕业证、学位证等复印件信息。</span>
			<jsp:include page="/ame_common/addFiles.jsp"/>
		</fieldset>
		<form id="opioionform" method="post">
	        <div style="padding:5px;" id="opinionHide">
	            <table style="table-layout:fixed;">
	            	<tr id="salesEdit">
	                    <td style="width:150px;" align="right">审核结果：</td>
	                    <td style="width:250px;">  
							<input name="misOpinion.auditstatus" id="auditstatus" class="mini-dictradiogroup" value="1" style="width:250px;" required="true" dictTypeId="MIS_AUDITSTATUS"  onvaluechanged="show()" />
	                    </td>
	                </tr>
	                <tr>
	                    <td style="width:150px;height:auto;" align="right">任务处理说明：</td>
	                    <td colspan="3">
	                        <input name="misOpinion.auditopinion" id="auditopinion" class="nui-textarea" required="false" style="width:600px;height:60px;"/>
	                    </td>
	                </tr>
	            </table>
	        </div>
    	</form>
	</div>
</div>
	<div style="text-align:center;padding:10px;" class="nui-toolbar">
		<a class="nui-button" onclick="onOk('1')" id="savePurorder" style="width:80px;margin-right:20px;">发起流程</a>
		<a class="nui-button" onclick="onOk('0')" id="creatPurorder" style="width:80px;margin-right:20px;">暂时保存</a>
	</div>
</body>
<script type="text/javascript">
    nui.parse();
  	var form3 = new nui.Form("form3");
  	var opioionform = new nui.Form("opioionform");
  	<%
   		UserObject user = (UserObject) session.getAttribute("userObject");
   		String username = user.getUserName();
   		String userno = user.getUserId();
    %>
  	init();//初始化
  	var outcontnum="";
  	function init(){
		nui.get("signuserid").setValue('<%=userno %>');
		nui.get("signuserid").setText('<%=username %>');
		//初始化审核意见
    	document.getElementById("salesEdit").style.display="none";
		nui.get("auditstatus").setValue(3);//1：通过,0：退回，2：终止流程，3:发起
        promptInit({"workItemID":0,"processDefName":"com.primeton.eos.ame_pur.ame_purOrder","activityDefID":"manualActivity"});
  	}
    function onOk(e) {
		if(!form3.validate()){
			nui.alert("表单信息填写不完整或长度超出限制，请确认必输项是否填写！！");
			return;
		}
    	var filePaths = document.getElementsByName("uploadfile").length;
    	for(var j=0;j<filePaths;j++){
    		var a=document.getElementsByName("remarkList")[j].value;
    		if(a==null||a==""){
    			nui.alert("工作协议书新增附件不可以为空！");
    			return false;
    		}
    	}
		nui.get("purstatus").setValue(e);
    	if(e==1){
        	if(!confirm("确认保存并发起流程？")){
        		return;
        	}
    	}else if(e==0){
        	if(!confirm("确认保存信息？")){
        		return;
        	}
        }
		nui.get("creatPurorder").disable();
		nui.get("savePurorder").disable();
		document.getElementById("fileCatalog").value="purOrder";
    	form2.submit();
    } 
    
    function SaveData() {
    	if(!form3.validate()){
			nui.alert("表单信息填写不完整或长度超出限制，请确认必输项是否填写！！");
			return;
		}
		mini.mask({
	        el: document.body,
	        cls: 'mini-mask-loading',
	        html: '发起中...'
	    }); 
    	var purcontid = nui.get("purContract.purcontname").getValue();
    	var custname = nui.get("custid").getText();
    	var data3 = form3.getData();
    	var data_opioion = opioionform.getData();
        var json1 = {purOrder:data3.purOrder,purcontid:purcontid,custname:custname,misOpinion:data_opioion.misOpinion};
        var json = nui.encode(json1);
        nui.ajax({
            url: "com.primeton.eos.ame_pur.purOrderProcess.creatPurOrderProcess.biz.ext",
            data: json,
            type: 'POST',
            cache: false,
            contentType: 'text/json',
            success: function (text) {
            	nui.unmask();
               	var returnJson = nui.decode(text);
               	var e = nui.get("purstatus").getValue();
    				if(e==1){
	                   	nui.alert("发起流程成功！");
	                   	window.location="<%=request.getContextPath() %>/bps/wfclient/task/taskList.jsp?taskType=finishedSelf";
    				}else if(e==0){
    					nui.alert("保存成功！");
	                   	window.location="<%=request.getContextPath() %>/bps/wfclient/task/taskList.jsp?taskType=self";
    				}    
            },
            error: function (jqXHR, textStatus, errorThrown) {
                nui.alert(jqXHR.responseText);
                CloseWindow();
            }
        });
	}
		 
    //标准方法接口定义
    function CloseWindow(action) {           
        if (action == "close" && form.isChanged()) {
            if (confirm("数据被修改了，是否先保存？")) {
                return false;
            }
        }
        if (window.CloseOwnerWindow) return window.CloseOwnerWindow(action);
        else window.close();            
    }
    
    //日期格式化
    var formatDate = function (date) {
	    var y = date.getFullYear();
	    var m = date.getMonth() + 1;
	    m = m < 10 ? '0' + m : m;
	    var d = date.getDate();
	    d = d < 10 ? ('0' + d) : d;
	    return y + '-' + m + '-' + d;
	};
	
     //选择供应商弹窗
    function selectSupplier(e) {
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
		                //选择供应商带出供应商最近签署的合同信息
		                var json = nui.encode({purSupplier:{custid: data.custid}});
		                nui.ajax({
			                url: "com.primeton.eos.ame_pur.purOrderProcess.getContByPurSupplier.biz.ext",
			                data: json,
			                type: 'POST',
			                cache: false,
			                contentType: 'text/json',
			                success: function (o) {
			                	var o = nui.decode(o);
			                	if(o.purContract.length==0){
			                		nui.alert("该供应商还没有签署有效的合同！");
			                		return;
			                	}
			                	nui.get("purContract.purcontname").setData(o.purContract);
			                	nui.get("purContract.purcontname").setValue(o.purContract[0].purcontid);
			                	nui.get("purContract.purcontname").setText(o.purContract[0].purcontname);
			                	if(!(o.purContract[0].signdate==""||o.purContract[0].signdate==null)){
				                	var signdate = formatDate(o.purContract[0].signdate);
			                	}
			                	if(!(o.purContract[0].startdate==""||o.purContract[0].startdate==null)){
			                		var startdate = formatDate(o.purContract[0].startdate);
			                	}
			                	if(!(o.purContract[0].enddate==""||o.purContract[0].enddate==null)){
				                	var enddate = formatDate(o.purContract[0].enddate);
			                	}
 					            //nui.get("purcontid").setValue(o.purContract[0].purcontid);
 					            //document.getElementById("purcontname").html(o.purContract[0].purcontname == null ?"":o.purContract[0].purcontname;
				                $("#purcontnum").html(o.purContract[0].purcontnum == null ?"":o.purContract[0].purcontnum);
			                 	$("#ouroper").html(o.purContract[0].ouroper == null ?"":o.purContract[0].ouroper);
				                $("#signdate").html(o.purContract[0].signdate == null ?"":signdate);
				                $("#startdate").html(o.purContract[0].startdate == null ?"":startdate);
				                $("#enddate").html(o.purContract[0].enddate == null ?"":enddate);
				                $("#contKeyinfo").html(o.purContract[0].cont_keyinfo == null ?"":o.purContract[0].cont_keyinfo);
				                $("#comment").html(o.purContract[0].comment == null ?"":o.purContract[0].comment);
				                outcontnum =o.purContract[0].outcontnum;
                				$("#outcontnum").html(o.purContract[0].outcontnum == null ?"":"<a href='javascript:void(0)' onclick='javascript:lookCsContract()' title='点击查看合同信息'>" + o.purContract[0].outcontnum + "</a>");
				                $("#costtype").html(nui.getDictText('AME_CONTCOSTTYPE',o.purContract[0].costtype)); 
				                
                   				//合同附件
                   				var grid_0 = nui.get("grid_0");
								grid_0.load({"groupid":"purContract","relationid":o.purContract[0].purcontid});
								grid_0.sortBy("fileTime","desc");
								
								btnEdit.setValue(data.custid);
				                btnEdit.setText(data.custname);
								nui.get("custid").validate();
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
	//选择服务客户弹窗
    function selectCustmer(){
    	var custid = nui.get("custid").getValue();
    	if(custid==null||custid==""){
    		nui.alert("请先选择供应商！");
    		return;
    	}
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
                        nui.get("userid").validate();
                        //带出项目名称
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
				                	nui.get("projectno").setValue(o.rdProjects[1].projectno);//shownulllitem
				                	nui.get("projectno").setText(o.rdProjects[1].projectName);//shownulllitem
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
		
    //选择人员弹窗
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
    
    //改变合同
    function changePurcont(){
    	var purcontid = nui.get("purContract.purcontname").getValue();
    	var json = {purContract:{purcontid:purcontid}};
    	nui.ajax({
    		url: "com.primeton.eos.ame_pur.purOrderProcess.getContByPurcontid.biz.ext",
            data: json,
            type: 'POST',
            cache: false,
            showModal: false,
            contentType: 'text/json',
            success: function (o) {
            	o = nui.clone(o);
            	$("#purcontnum").html(o.purContract.purcontnum == null ?"":o.purContract.purcontnum);
                $("#ouroper").html(o.purContract.ouroper == null ?"":o.purContract.ouroper);
                $("#signdate").html(o.purContract.signdate == null ?"":o.purContract.signdate);
                $("#startdate").html(o.purContract.startdate == null ?"":o.purContract.startdate);
                $("#enddate").html(o.purContract.enddate == null ?"":o.purContract.enddate);
                $("#contKeyinfo").html(o.purContract.cont_keyinfo == null ?"":o.purContract.cont_keyinfo);
                $("#comment").html(o.purContract.comment == null ?"":o.purContract.comment);
                outcontnum =o.purContract.outcontnum;
				$("#outcontnum").html(o.purContract.outcontnum == null ?"":"<a href='javascript:void(0)' onclick='javascript:lookCsContract()' title='点击查看合同信息'>" + o.purContract.outcontnum + "</a>");
                $("#costtype").html(nui.getDictText('AME_CONTCOSTTYPE',o.purContract.costtype)); //合同附件
   				var grid_0 = nui.get("grid_0");
				grid_0.load({"groupid":"purContract","relationid":o.purContract.purcontid});
				grid_0.sortBy("fileTime","desc");
            },
            error: function (jqXHR, textStatus, errorThrown) {
                nui.alert(jqXHR.responseText);
                CloseWindow();
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
</script>
</html>

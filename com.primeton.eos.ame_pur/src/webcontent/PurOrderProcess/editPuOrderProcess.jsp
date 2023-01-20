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
	<title>修改采购订单</title>
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
	<!-- 提示信息展示 -->
	<jsp:include page="/ame_common/ameFlowOperTips/ameFlowOperTipsInfo.jsp"/>
		选择供应商：<input name="purContract.purSupplier.custid" id="custid" class="nui-buttonedit asLabel" required="true" style="width:280px" emptyText="请选择供应商" onbuttonclick="selectSupplier" allowInput="false" />
		选择合同：<input name="purContract.purcontname" id="purContract.purcontname" onvaluechanged="changePurcont" class="nui-combobox" valueField="purcontid" textField="purcontname" allowInput="false"  style="width:300px" />
		<fieldset id="field1" style="border:solid 1px #aaa;padding:3px;">
			<legend>采购合同基本信息</legend>
			<form id="form1" method="post">
				<table style="table-layout:fixed;" id="table_file" >
					<tr>
						<td align="right" style="width:130px">合同编号：</td>
						<td id="purcontnum" style="width:200px" class="asLabel"></td>
						<td align="right" style="width:120px">我方申请人：</td>
						<td id="ouroper" style="width:100px" class="asLabel"></td>
						<td align="right" style="width:120px">签订日期：</td>
						<td style="width:120px;" id="signdate" class="asLabel"></td>
					</tr>
					<tr>
						<td align="right" style="width:130px">有效开始日期：</td>
						<td id="startdate" style="width:100px" class="asLabel"></td>
						<td align="right" style="width:120px">有效截止日期：</td>
						<td style="width:120px;" id="enddate" class="asLabel"></td>
						<td align="right" style="width:120px">成本类型：</td>
						<td id="costtype" style="width:200px" class="asLabel"></td>
					</tr>
					<tr>
						<td align="right" style="width:130px">财务对应合同编码：</td>
						<td id="outcontnum" style="width:120px;" class="asLabel"></td>
					</tr>
					<tr>
						<td align="right" style="width:130px">合同关键内容信息：</td>
						<td colspan="5" id="contKeyinfo" class="asLabel"></td>
					</tr>
					<tr>
						<td align="right" style="width:120px">说明：</td>
						<td colspan="5" id="comment" class="asLabel"></td>
					</tr>
				</table>
			</form>
			<jsp:include page="/ame_common/detailFile.jsp"/>
		</fieldset>
		<fieldset id="field3" style="border:solid 1px #aaa;padding:3px;">
			<legend>修改采购订单</legend>
			<form id="form3" method="post">
				<input name="purOrder.purorderid" id="purorderid" class="nui-hidden" />	
				<input name="purOrder.purContract.purcontid" id="purcontid" class="nui-hidden" />
				<input name="purOrder.fileids" id="fileids1" class="nui-hidden" />	
            	<table style="table-layout:fixed;" id="table_purOrder">
					<tbody>
						<tr>
							<td align="right" style="width:120px">服务客户：</td>
							<td style="width:200px"><input name="purOrder.userid" id="userid" class="nui-buttonedit" onbuttonclick="selectCustmer"  allowInput="false" style="width:200px" /></td>
							<td align="right" style="width:120px">项目名称：</td>
							<td style="width:200px"><input name="purOrder.projectno" id="projectno" class="nui-combobox" valueField="projectno" textField="projectName" allowInput="false"  style="width:200px" showNullItem="true" nullItemText=""/></td>
							<td align="right" style="width:120px">协议签订人员：</td>
							<td style="width:120px"><input name="purOrder.signuserid" id="signuserid" class="nui-buttonedit" onbuttonclick="selectOmEmployee"  allowInput="false" style="width:100px" /></td>
						</tr>
						<tr>
							<td align="right" style="width:120px">结算周期说明：</td>
							<td colspan="5"><input name="purOrder.calcycle" id="calcycle" class="nui-textarea" vtype="rangeChar:0,1000" style="width:100%"/></td>
						</tr>
						<tr>
							<td align="right" style="width:120px">协议内容说明：</td>
							<td colspan="5"><input name="purOrder.contmemo" id="contmemo" class="nui-textarea" vtype="rangeChar:0,2000" style="width:100%"/></td>
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
					<div renderer="deleteOrderFile" width="20" headerAlign="center" align="center">操作</div>
				</div>
			</div>
			<span>工作协议书附件包含：工作协议书电子表格，协议书涉及人员简历、身份证、毕业证、学位证等复印件信息。</span>
			<jsp:include page="/ame_common/addFiles1.jsp"/>
		</fieldset>
		<jsp:include page="/ame_common/misOpinion.jsp"/>
</div>
<div style="text-align:center;padding:10px;" class="nui-toolbar">
	<a class="nui-button" onclick="onOk(1)" id="submitPurOrder" style="width:60px;margin-right:20px;">提交</a>
	<a class="nui-button" onclick="onOk(0)" id="breakPurOrder"style="width:80px;margin-right:20px;">中止流程</a>
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
	function loadData(){
		//document.getElementById("opinionHide").style.display="none";
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
                //合同基本信息
                nui.get("custid").setText(o.purContract.purSupplier.custname);
                nui.get("purContract.purcontname").setValue(o.purContract.purcontid);
                nui.get("purContract.purcontname").setText(o.purContract.purcontname);
                nui.get("purcontid").setValue(o.purContract.purcontid);
                
                var json = nui.encode({purSupplier:{custid: o.purContract.purSupplier.custid}});
                nui.ajax({
	                url: "com.primeton.eos.ame_pur.purOrderProcess.getContByPurSupplier.biz.ext",
	                data: json,
	                type: 'POST',
	                cache: false,
	                contentType: 'text/json',
	                success: function (o) {
	                	var o = nui.decode(o);
	                	nui.get("purContract.purcontname").setData(o.purContract);
	                },
	                error: function (jqXHR, textStatus, errorThrown) {
	                    nui.alert(jqXHR.responseText);
	                }
	            });
                
				document.getElementById("purcontnum").innerHTML = o.purContract.purcontnum == null ?"":o.purContract.purcontnum;
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
            	nui.get("auditstatus").setValue("4");
               	document.getElementById("salesEdit").style.display="none";
               	nui.get("auditopinion").setValue("");
            	//查询审核意见
            	var processinstid = nui.get("processinstid").getValue();
				var grid = nui.get("datagrid1");
				grid.load({processInstID:processinstid});
				grid.sortBy("time", "desc");
				//流程提示信息
        		promptInit({workItemID:<%=workItemID %>});
			},
			error:function(){}
		});
		document.getElementById("salesEdit").style.display="none";
		document.getElementById("choosehide").style.display="none";
		nui.get("auditopinion").setValue("");
	}
	
	function onCheckRenderer(e) {
		return nui.getDictText('MIS_AUDITSTATUS',e.value);//设置业务字典值
	}
	    
  	//标准方法接口定义
    function CloseWindow(action) {            
        if (window.CloseOwnerWindow) return window.CloseOwnerWindow(action);
        else window.close();            
    }
        
    function onOk(e) {
    	if(e==0){
        	if(confirm("中止流程？")){//中止流程，直接调用saveData方法
        		nui.get("auditstatus").setValue(2);
        		nui.get("submitPurOrder").disable();
        		nui.get("breakPurOrder").disable();
    			SaveData();
    			return;
        	}
    	}
		if(!form3.validate()){
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
    	if(confirm("确认提交？")){
			nui.get("submitPurOrder").disable();
			document.getElementById("fileCatalog1").value="purOrder";
			form4.submit();
    	}
    } 
	    
    function SaveData1(){
    	SaveData();
	}
		
	function SaveData() {
        var data3=form3.getData();
        var data5 = opioionform.getData();
        var json3 = {purOrder:data3.purOrder,misOpinion:data5.misOpinion}; 
        var json = nui.encode(json3);
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
    
    //订单附件删除
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
    
	function showNone(){
		document.getElementById("choosehide").style.display="none";
	}
	
	function chooselink(){
		document.getElementById("choosehide").style.display="";
	}
	
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
				                document.getElementById("purcontnum").innerHTML = o.purContract[0].purcontnum == null ?"":o.purContract[0].purcontnum;
				                document.getElementById("ouroper").innerHTML = o.purContract[0].ouroper == null ?"":o.purContract[0].ouroper;
				                document.getElementById("signdate").innerHTML = o.purContract[0].signdate == null ?"":signdate;
				                document.getElementById("startdate").innerHTML = o.purContract[0].startdate == null ?"":startdate;
				                document.getElementById("enddate").innerHTML = o.purContract[0].enddate == null ?"":enddate;
				                document.getElementById("contKeyinfo").innerHTML = o.purContract[0].cont_keyinfo == null ?"":o.purContract[0].cont_keyinfo;
				                document.getElementById("comment").innerHTML = o.purContract[0].comment == null ?"":o.purContract[0].comment;
				                outcontnum =o.purContract[0].outcontnum;
                				document.getElementById("outcontnum").innerHTML = o.purContract.outcontnum == null ?"":"<a href='javascript:void(0)' onclick='javascript:lookCsContract()' title='点击查看合同信息'>" + o.purContract[0].outcontnum + "</a>";
				                document.getElementById("costtype").innerHTML =  nui.getDictText('AME_CONTCOSTTYPE',o.purContract[0].costtype); 
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
            	//跟着订单的合同id
            	nui.get("purcontid").setValue(o.purContract.purcontid);
            	document.getElementById("purcontnum").innerHTML = o.purContract.purcontnum == null ?"":o.purContract.purcontnum;
                document.getElementById("ouroper").innerHTML = o.purContract.ouroper == null ?"":o.purContract.ouroper;
                document.getElementById("signdate").innerHTML = o.purContract.signdate == null ?"":o.purContract.signdate;
                document.getElementById("startdate").innerHTML = o.purContract.startdate == null ?"":o.purContract.startdate;
                document.getElementById("enddate").innerHTML = o.purContract.enddate == null ?"":o.purContract.enddate;
                document.getElementById("contKeyinfo").innerHTML = o.purContract.cont_keyinfo == null ?"":o.purContract.cont_keyinfo;
                document.getElementById("comment").innerHTML = o.purContract.comment == null ?"":o.purContract.comment;
                outcontnum =o.purContract.outcontnum;
                document.getElementById("outcontnum").innerHTML = o.purContract.outcontnum == null ?"":"<a href='javascript:void(0)' onclick='javascript:lookCsContract()' title='点击查看合同信息'>" + o.purContract.outcontnum + "</a>";
                document.getElementById("costtype").innerHTML =  nui.getDictText('AME_CONTCOSTTYPE',o.purContract.costtype); 
            },
            error: function (jqXHR, textStatus, errorThrown) {
                nui.alert(jqXHR.responseText);
                CloseWindow();
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
    
    var formatDate = function (date) {
	    var y = date.getFullYear();
	    var m = date.getMonth() + 1;
	    m = m < 10 ? '0' + m : m;
	    var d = date.getDate();
	    d = d < 10 ? ('0' + d) : d;
	    return y + '-' + m + '-' + d;
	};
	
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
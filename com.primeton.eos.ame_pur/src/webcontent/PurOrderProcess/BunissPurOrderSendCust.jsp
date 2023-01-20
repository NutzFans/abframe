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
	<title>商务文件送达供应商</title>
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
			<form id="form3" method="post">
				<input name="purOrder.purorderid" id="purorderid" class="nui-hidden" />	
            	<table style="table-layout:fixed;" id="table_purOrder">
					<tbody>
						<tr>
							<td align="right" style="width:120px">服务客户：</td>
							<td style="width:200px"><input name="purOrder.userid" id="userid" class="nui-buttonedit" onbuttonclick="selectCustmer"  allowInput="false" style="width:200px" /></td>
							<td align="right" style="width:120px">项目名称：</td>
							<td style="width:200px"><input name="purOrder.projectno" id="projectno" class="nui-combobox" onbuttonclick="selectProject"  allowInput="false" style="width:200px" showNullItem="true" nullItemText=""/></td>
							<td align="right" style="width:120px">协议签订人员：</td>
							<td style="width:120px"><input name="purOrder.signuserid" id="signuserid" class="nui-buttonedit" onbuttonclick="selectOmEmployee"  allowInput="false" style="width:100px" /></td>
						</tr>
						<tr>
							<td align="right" style="width:120px">采购订单编号：</td>
							<td colspan="5"><input name="purOrder.purordernum" id="purordernum" class="nui-textbox" required="false"  style="width:200px"/></td>
						</tr>
						<tr>
							<td align="right" style="width:120px">结算周期说明：</td>
							<td colspan="5"><input name="purOrder.calcycle" id="calcycle" class="nui-textbox"  vtype="rangeChar:0,1000" style="width:100%"/></td>
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
						<div field="operatorname" width="50"headerAlign="center" align="center">操作员名称</div>
						<div field="fileTime" width="50" headerAlign="center" align="center" dateFormat="yyyy-MM-dd HH:mm:ss">附件上传时间</div>
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
						<td align="right" style="width:150px">送递人：</td>
						<td><input name="amePostservice[0].postorname" id="postorname" class="nui-textbox" required="false" vtype="rangeChar:2,30" style="width:100px"/></td>
						<td align="right" style="width:150px">送递方式：</td>
						<td><input name="amePostservice[0].postway" id="postway" class="nui-dictcombobox" dictTypeId="AME_POSTWAY" style="width:100px" showNullItem="true" nullItemText=""/></td>
					</tr>
					<tr>
						<td align="right" style="width:150px">送递日期：</td>
						<td><input name="amePostservice[0].postdate" id="postdate" class="nui-datepicker" vtype="date:yyyy-MM-dd" required="false"  style="width:100px"/></td>
						<td align="right" style="width:150px">快递公司寄单号：</td>
						<td><input name="amePostservice[0].postno" id="postno" class="nui-textbox" required="false"  style="width:200px"/></td>
					</tr>
					<tr>
						<td align="right" style="width:150px">收件人：</td>
						<td><input name="amePostservice[0].receivername" id="receivername" vtype="rangeChar:2,30" class="nui-textbox" required="false"  style="width:100px"/></td>
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
		<a class="nui-button" onclick="onOk" id="submitPurOrder"  style="width:60px;margin-right:20px;">提交</a>
		<a class="nui-button" onclick="onCancel('cancel')" style="width:60px;">关闭</a>
	</div>
</body>
<script type="text/javascript">
	nui.parse();
  	var form3 = new nui.Form("form3");
  	var form5 = new nui.Form("form5");
  	var opioionform = new nui.Form("opioionform");
	<% 
	long workItemID=(Long)request.getAttribute("workItemID");
	%>	
	var outcontnum;
	loadData();
	var linkman;
	var creator;
	function loadData(){
		//document.getElementById("opinionHide").style.display="none";
		document.getElementById("salesEdit").style.display="none";
		document.getElementById("choosehide").style.display="none";
		nui.get("auditopinion").setValue("");			
		var data={workItemID:<%=workItemID %> ,getOutpersonAndPost:"1"};
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
			    //合同附件
				var grid_0 = nui.get("grid_0");
				grid_0.load({"groupid":"purContract","relationid":o.purContract.purcontid});
				grid_0.sortBy("fileTime","desc");
				//订单信息
				nui.get("userid").setText(o.purOrder.custname);
                nui.get("projectno").setText(o.purOrder.projectName);	
                nui.get("signuserid").setText(o.purOrder.empname);
				//订单附件
				var grid_1 = nui.get("grid_1");
				grid_1.load({"groupid":"purOrder","relationid":o.purOrder.purorderid});
				grid_1.sortBy("fileTime","desc");
				//设置邮寄内容
				linkman =o.purContract.purSupplier.linkman;
				creator = o.purContract.creator;
				form5.setData(o);
				//邮寄信息更改
				nui.get("receivername").setValue(o.purContract.purSupplier.linkman);//linkman
               	nui.get("postorname").setValue(o.amePostservice[0].receivername);//默认
			    nui.get("postdate").setValue(new Date());
				<%-- <%
				   		UserObject user = (UserObject) session.getAttribute("userObject");
				   		String username = user.getUserName();
				   		String userno = user.getUserId();
			    	%>
			    nui.get("postorname").setValue("<%=username %>");
				nui.get("postcontent").setValue("工作协议书打印盖章件"); --%>
				//设置审核意见基本信息
				nui.get("processinstid").setValue(o.workitem.processInstID);
               	nui.get("processinstname").setValue(o.workitem.processInstName);
               	nui.get("activitydefid").setValue(o.workitem.activityDefID);
               	nui.get("workitemname").setValue(o.workitem.workItemName);
				nui.get("workitemid").setValue(<%=workItemID %>);
               	nui.get("isshow").setValue("1");
               	nui.get("post").setValue("2");
               	nui.get("backTo").setData(o.purContract.backList);
               	//初始化处理意见
				initMisOpinion({auditstatus:"1"});
            	//查询审核意见及审核附件
            	var processinstid = nui.get("processinstid").getValue();
				var grid = nui.get("datagrid1");
				grid.load({processInstID:processinstid});
				grid.sortBy("time", "desc");
				//流程提示信息
    			promptInit({workItemID:<%=workItemID %>});
			},
			error:function(){}
		});
	}
	
	//处理送递环节
    function getRadio(evt){
	    var evt=evt || window.event;   
	    var e =evt.srcElement || evt.target;
	     if(e.value=="0"){
			nui.get("receivername").setValue(creator);
	     }
	     else if(e.value=="1"){
	         nui.get("receivername").setValue(linkman);
	     }
	}
	
  	//标准方法接口定义
    function CloseWindow(action) {            
        if (window.CloseOwnerWindow) return window.CloseOwnerWindow(action);
        else window.close();            
    }
    
	function onOk(){
		if(!(form3.validate() && form5.validate())){
			nui.alert("表单信息填写不完整或长度超出限制，请确认必输项是否填写！！");
			return;
		}
		if(confirm("确认提交？")){
			nui.get("submitPurOrder").disable();
            SaveData();
		}
	}
    
	function SaveData() {
        var data3 = form3.getData();
        var data5 = form5.getData();
        var opinion = opioionform.getData();
        var json1 = {purOrder:data3.purOrder,misOpinion:opinion.misOpinion,amePostservice:data5.amePostservice[0]};
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
				                nui.alert(jqXHR.responseText);
				                CloseWindow();
				            }
				    	});
                    }
                }
            }
        });
    }
        
	//处理日期和合同名称
    function startTime(){
    	var start = nui.get("startdate").getValue();
    	var end = nui.get("enddate").getValue();
    	if(end){
    		startDate = start.substring(0,4) + start.substring(5,7) + start.substring(8,10);
		    endDate   = end.substring(0,4) + end.substring(5,7) + end.substring(8,10);
	    	//有效开始日期不能大于有效截至日期。
			if(endDate < startDate){
				nui.alert("有效开始日期不能大于有效截至日期！"); //有效开始日期不能大于有效截至日期！
				return false;
			}
    		var name ="人力资源服务框架协议(" + start.substring(0,4) + "." + start.substring(5,7) + "." + start.substring(8,10) + "-" + end.substring(0,4) + "." + end.substring(5,7) + "." + end.substring(8,10) + ")";
    		nui.get("purcontname").setValue(name);
    	}
    }
    
    //处理日期和合同名称
    function endTime(){
    	var start = nui.get("startdate").getValue();
    	var end = nui.get("enddate").getValue();
    	if(start){
    		startDate = start.substring(0,4) + start.substring(5,7) + start.substring(8,10);
		    endDate   = end.substring(0,4) + end.substring(5,7) + end.substring(8,10);
	    	//有效开始日期不能大于有效截至日期。
			if(endDate < startDate){
				nui.alert("有效开始日期不能大于有效截至日期！"); //有效开始日期不能大于有效截至日期！
				return false;
			}
			var name ="人力资源服务框架协议(" + start.substring(0,4) + "." + start.substring(5,7) + "." + start.substring(8,10) + "-" + end.substring(0,4) + "." + end.substring(5,7) + "." + end.substring(8,10) + ")";
    		nui.get("purcontname").setValue(name);
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
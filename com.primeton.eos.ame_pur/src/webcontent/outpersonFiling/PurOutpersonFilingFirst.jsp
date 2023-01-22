<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@page import="com.eos.data.datacontext.UserObject"%>
<%
	String contextPath=request.getContextPath();
	UserObject user = (UserObject) session.getAttribute("userObject");
   	String username = user.getUserName();
   	String userno = user.getUserId();
 %>
<html>
<!-- 
  - Author(s): zyl
  - Date: 2017-01-12 10:56:54
  - Description:
-->
<head>
	<title>新增外包人员报备申请</title>
	<meta http-equiv="content-type" content="text/html; charset=UTF-8" />
	<script src="<%= request.getContextPath() %>/common/nui/nui.js" type="text/javascript"></script>
	<script src="../common/nui/nui.js" type="text/javascript"></script>
	<style type="text/css">
	    body{
	        margin:0;padding:0;border:0;width:100%;height:100%;overflow:hidden;
	    }
    </style>
</head>
<body>
	<!-- 
	1、点击“新增外包人员报备申请”
	2、弹出页面录入新增外包人员信息：基本信息及附件，项目对应关系
	3、提交流程
	 -->
	<div class="nui-fit">
		<!-- 提示信息展示 -->
		<jsp:include page="/ame_common/ameFlowOperTips/ameFlowOperTipsInfo.jsp"/>
		<form id="form1" method="post">
			<fieldset id="field1" style="border:solid 1px #aaa;padding:3px;">
				<legend>外包人员基本信息</legend>
				<input id="suppliersname" class="nui-hidden"/>
				<input name="purOutperson.outperno" id="outperno" class="nui-hidden"/>
				<input name="purOutperson.fileids" id="fileids" class="nui-hidden"/>
				<input name="purOutperson.save" id="save" class="nui-hidden" />
				<div style="padding:5px;">
					<table style="table-layout:fixed;" id="table_file">
						<tr>
							<td align="right" style="width:100px;"></td>
							<td style="width:110px"></td>
							<td align="right" style="width:100px;"></td>
							<td style="width:170px"></td>
							<td align="right" style="width:100px;"></td>
							<td style="width:100px"></td>
							<td align="right" style="width:100px;"></td>
							<td style="width:100px"></td>
						</tr>
						<tr>
							<td align="right" width="100px">姓名：</td>
							<td><input name="purOutperson.outpername" id="outpername" onblur="checkName" class="nui-textbox" 
									required="true" style="width:110px" emptyText="请输入姓名" />
							</td>
							<td align="right" style="width:100px;">身份证号码：</td>
							<td><input name="purOutperson.outpercartno" id="outpercartno" onblur="checkCartno" class="nui-textbox" 
									vtype="rangeLength:18" required="true" style="width:170px" />
							</td>
							
							<td align="right" style="width:100px;">供应商：</td>
							<td colspan="3"><input name="purOutperson.custid" id="custid" required="true" emptyText="请选择供应商,若选不到，请与商务部门同事联系"
								class="nui-buttonedit" onbuttonclick="selectSupplier" style="width:340px" allowInput="false"/>
							</td>
						</tr>
						<tr>
							<td align="right" style="width:100px;">联系电话：</td>
							<td><input name="purOutperson.linktel" id="linktel" onblur="checkTelno" class="nui-textbox" required="true" style="width:130px" />
							</td>
							<td align="right" style="width:100px;">毕业时间：</td>
							<td><input name="purOutperson.gradudate" id="gradudate" class="nui-datepicker" style="width:100px" />
							</td>
							<td align="right" style="width:100px;">性别：</td>
							<td><input name="purOutperson.gender" showNullItem="true" id="gender" 
									class="nui-dictcombobox" required="false" style="width:100px" dictTypeId="ABF_GENDER" />
							</td>
							<td align="right" style="width:100px;">学历：</td>
							<td><input name="purOutperson.degree" id="degree" showNullItem="true" class="nui-dictcombobox" 
								dictTypeId="DEGREE" style="width:100px" required="false" />
							</td>
						</tr>
						<tr>
							<td align="right" style="width:100px;">联系邮箱：</td>
							<td colspan="3"><input name="purOutperson.linkemail" id="linkemail" class="nui-textbox" 
								emailErrorText="请输入正确的邮件格式" vtype="email" style="width:318px" />
							</td>
							<td align="right" style="width:100px;">备注：</td>
							<td colspan="3"><input name="purOutperson.memo" id="memo" class="nui-textarea" 
								style="width:340px;height: 22px;"/>
							</td>
						</tr>
					</table>
				</div>
			</fieldset>
			<fieldset id="field2" style="border:solid 1px #aaa;padding:3px;">
				<legend>项目列表</legend>
				<div style="width:100%;">
			        <div class="nui-toolbar" style="border-bottom:0;padding:0px;">
			            <table style="width:100%;">
			                <tr>
			                    <td style="width:100%;">
			                    	<a class="nui-button" iconCls="icon-add" onclick="addRow('purProjOutper_grid')">增加</a>
			                    	<a class="nui-button" iconCls="icon-remove" onclick="removeRow('purProjOutper_grid')">删除</a>
			                    </td>
			                </tr>
			            </table>           
			        </div>
			    </div>
				<div id="purProjOutper_grid" class="nui-datagrid" style="width:100%;height:auto;" dataField="purProjOutper" 
					 showPager="false" allowCellEdit="true" allowCellSelect="true" multiSelect="true" editNextOnEnterKey="true"
					 url="com.primeton.eos.ame_pur.outperson.queryPurOutpersonMainTain.biz.ext" showFooter="false">
					<div property="columns">
						<div type="checkcolumn"></div>
						<div field="projoutid" align="center" headerAlign="center" visible="false">编号</div>
						<div field="custid" align="center" headerAlign="center" visible="false">服务客户编号</div>
						<div field="projectno" width="auto" align="left" headerAlign="center" displayField="projectname">服务项目
							<input property="editor" class="nui-buttonedit" emptyText="请选择服务项目" 
								onbuttonclick="selectProjectList" allowInput="false"/>
						</div>
						<div field="custname" width="auto" align="left" headerAlign="center">服务客户
							<input property="editor" class="nui-textbox" readonly="readonly"/>
						</div>
						<div field="startdate" width="97" align="center" renderer="onDealDate" dateFormat="yyyy-MM-dd" headerAlign="center">服务开始日期
							<input property="editor" class="nui-datepicker" style="width: 100%;" />
						</div>
						<div field="expenddate" width="97" align="center" renderer="onDealDate" dateFormat="yyyy-MM-dd" headerAlign="center">预计结束日期
							<input property="editor" class="nui-datepicker" style="width: 100%;" />
						</div>
						<div field="currentstatus" width="90" align="center" headerAlign="center" renderer="dictGetStatus">服务状态
							<input property="editor" class="nui-dictcombobox" dictTypeId="AME_OUTPERSTATUS" readOnly="readonly"/>
						</div>
						<div field="inputratio" width="55" align="center" headerAlign="center">投入比重
							<input property="editor" id="inputratio" class="nui-spinner" minValue="0" maxValue="1" 
							changeOnMousewheel="false" showButton="false" inputStyle="text-align: right" 
								style="width: 100%" required="true"/>
						</div>
						<div field="workunit" width="70" align="center" headerAlign="center" renderer="dictOutperType">工作量单位
							<input property="editor" class="nui-dictcombobox" dictTypeId="SERV_NUM_TYPE"/>
						</div>
						<div field="price" width="80" align="right" headerAlign="center">服务价格(元)
							<input property="editor" class="nui-spinner" allowLimitValue="false" 
							changeOnMousewheel="false" showButton="false" inputStyle="text-align: right" 
								style="width: 100%" required="true"/>
						</div>
						<div field="manager" width="80" align="center" headerAlign="center" name="manager" displayField="managername">汇报对象
							<input property="editor" class="nui-buttonedit" onbuttonclick="selectOrgname" 
								allowInput="false"/>
						</div>
					</div>
				</div>
			</fieldset>
		</form>
		<fieldset id="field3" style="border:solid 1px #aaa;padding:3px;">
			<legend>外包人员附件</legend>
			<jsp:include page="/ame_common/addFiles.jsp"/>
			<span style="font-weight: bold;color: red">&nbsp;外包人员附件说明：面试评价表、人员的简历、身份证、毕业证、学位证复印件（或照片）等资料请以独立的附件上传</span>
			<div><a href="/default/abframe/import-template/ameinterview.xlsx">点击下载面试评价表模板</a></div>
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
	<div style="text-align:center;padding:10px;height: 24px;" class="nui-toolbar">
		<a class="nui-button" onclick="onOk('app')" style="width:138px;margin-right:20px;" id="appButton">发起外包人员报备申请</a>
		<a class="nui-button" onclick="onOk('save')" iconCls="icon-save" style="width:95px;margin-right:20px;" id="saveButton">暂时保存</a>
	</div>
	
	<script type="text/javascript">
		nui.parse();
		var form = new nui.Form("form1");
		form.setChanged(true);
		var opioionform = new nui.Form("#opioionform");
		//外包人员归属项目
	  	var purProjOutper_grid = nui.get("purProjOutper_grid");
	  	//同号身份证
	  	var cardnoBoolean = false;
	  	//同号电话号码
	  	var telnoBoolean = false;
	  	
		function SetData(data){
			//新增外包人员报备申请
			data = nui.clone(data);
			if(data.action == "addPurOutpersonFiling"){
				promptInit({"workItemID":0,"processDefName":"com.primeton.eos.ame_pur.ame_purOutpersonFiling","activityDefID":"manualActivity"});
				//设置流程发起页面处理结果为 发起(3)
				nui.get("auditstatus").setValue(3);
				document.getElementById("salesEdit").style.display="none";
				nui.get("auditopinion").setValue("");
			}
		}
		
		//外包人员归属项目列表-选择项目,级联得到服务客户
        function selectProjectList(){
        	var btnEdit = this;
        	nui.open({
                url:"<%=request.getContextPath() %>/ame_common/SelectProject.jsp?preSettle=purFiling",
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
                            //连带出项目服务客户
                            var row = purProjOutper_grid.getSelected();
                            var rowData = {custid:data.custid,custname:data.custname};
                            purProjOutper_grid.updateRow(row,rowData); 
                        }
                    }
                }
            });
        }
        
        /**
         * 选择汇报对象
         */
        function selectOrgname(){
	    	var btnEdit = this;
        	nui.open({
                url:"<%=request.getContextPath() %>/machine/SelectEmployee.jsp",
                title: "选择汇报对象",
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
                            //连带出项目服务客户
                            var row = purProjOutper_grid.getSelected();
                            var rowData = {manager: data.userid,managername: data.empname};
                            purProjOutper_grid.updateRow(row,rowData); 
                        }
                    }
                }
            });
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
                        data = nui.clone(data);    //必须
                        if (data) {
                            btnEdit.setValue(data.custid);
                            btnEdit.setText(data.custname);
                            nui.get("suppliersname").setValue(data.suppliersname);
                        }
                    }
                }
            });
        }
        
        //验证姓名是否已经存在
		function checkName(){
			if(form.isChanged()){
				var outpername = nui.get("outpername").getValue();
				if(outpername){
					var json = nui.encode({outpername: outpername});
		            nui.ajax({
		                url:"com.primeton.eos.ame_pur.outperson.checkOutName.biz.ext",
		                type:'POST',
		                data:json,
		                cache: false,
		                contentType:'text/json',
		                success:function(text){
		                    var returnJson = nui.decode(text);
		                    if(returnJson.result == "1"){
		                    	nui.alert("已存在该姓名的外包人员，请确认不是重复报备。","提示");
		                    }else{
		                    	//alert("姓名不存在");
		                    }
		                }
		            }); 
	            }
            }
		}
		
		//验证身份证号码是否已经存在-如果已经存在，不允许发起流程
		function checkCartno(){
			if(form.isChanged()){
				nui.get("outpercartno").setValue(qukongge(nui.get("outpercartno").getValue()));
				var outpercartno = nui.get("outpercartno").getValue();
				if(outpercartno){
					var json = nui.encode({purOutperson: {outpercartno: outpercartno}});
		            nui.ajax({
		                url:"com.primeton.eos.ame_pur.outperson.checkOutNo.biz.ext",
		                type:'POST',
		                data:json,
		                cache: false,
		                contentType:'text/json',
		                success:function(text){
		                    var returnJson = nui.decode(text);
		                    if(returnJson.result == "1"){
		                    	nui.alert("已存在该身份证号码的外包人员，请确认不是重复报备。","提示");
		                    	cardnoBoolean = true;
		                    }else{
		                    	cardnoBoolean = false;
		                    	//alert("姓名不存在");
		                    }
		                }
		            }); 
	            }
            }
		}
		
		//验证身份证号码是否已经存在-如果已经存在，不允许发起流程
		function checkTelno(){
			if(form.isChanged()){
				nui.get("linktel").setValue(qukongge(nui.get("linktel").getValue()));
				var linktel = nui.get("linktel").getValue();
				if(linktel){
					var json = nui.encode({purOutperson: {linktel: linktel}});
		            nui.ajax({
		                url:"com.primeton.eos.ame_pur.outperson.checkOutNo.biz.ext",
		                type:'POST',
		                data:json,
		                cache: false,
		                contentType:'text/json',
		                success:function(text){
		                    var returnJson = nui.decode(text);
		                    if(returnJson.result == "1"){
		                    	nui.alert("已存在该电话号码的外包人员，请确认不是重复报备。","提示");
		                    	telnoBoolean = true;
		                    }else{
		                    	telnoBoolean = false;
		                    	//alert("姓名不存在");
		                    }
		                }
		            }); 
	            }
            }
		}
        
        //设置业务字典值-人员状态
		function dictGetStatus(e){
			return nui.getDictText('AME_OUTPERSTATUS',e.value);
		}
		//设置业务字典值-计量单位
		function dictOutperType(e){
			return nui.getDictText('SERV_NUM_TYPE',e.value);
		}
		
		//设置日期格式
		function onDealDate(e){
			if(e.value){
				return e.value.substring(0,10);
			}
		}
        
        //添加外包人员归属项目行
    	function addRow() {
            //点击添加行,后台查询出该外包人员签订的数据信息
			var newRow = { name: "New Row",
				currentstatus: 4,
				inputratio: 1,
				manager: "<%=userno %>",
				managername: "<%=username %>"
			};
    		purProjOutper_grid.addRow(newRow, 0);
    	}
    	
    	//删除外包人员归属项目行
    	function removeRow(gridid) {
	        var grid = nui.get(gridid);
	        var rows = grid.getSelecteds();
	        var data = {purProjOutpers:rows};
		    var json = nui.encode(data);
	        if (rows.length > 0) {
	            //grid.removeRows(rows, true);
	            nui.confirm("确定删除选中记录？", "确定？",
	            	function (action) {
	            		if (action == "ok") {
	            			nui.ajax({
				            	url: "com.primeton.eos.ame_pur.outperson.deletePurOutpersonMainTain.biz.ext",
				            	data: json,
				            	type: 'POST',
				            	cache: false,
				            	contentType: 'text/json',
				            	success: function (text) {
				            		if (text.execption == null) {
				            			nui.alert("删除成功！");
				            			grid.reload();
				            		} else {
				            			nui.alert("删除失败");
				            		}
				            	},
				            	error: function () {
				                }
				            });
	            		}
	            	}
	            );    
	        }
	    }
    	
    	function onOk(e){
    		/* if(cardnoBoolean){
    			nui.alert("此身份证号码已存在，不能录入已存在的身份证号码。","提示");
    			return;
    		}
    		if(telnoBoolean){
    			nui.alert("此电话号码已存在，不能录入已存在的电话号码。","提示");
    			return;
    		} */
			var filePaths = document.getElementsByName("uploadfile").length;
        	for(var j = 0;j < filePaths;j++){
        		var a = document.getElementsByName("remarkList")[j].value;
        		if(a == null || a == ""){
        			nui.alert("新增附件不可以为空");
        			return false;
        		}
        	}
        	/* var custid = nui.get("custid").getValue();
        	if(custid ==null || custid==""){
        		nui.alert("如报备人员属于新供应商，无法在已有供应商名单中选取的，请与商务部门同事联系");
        		return false;
        	} */
        	if(form.validate()){
        		nui.get("save").setValue(e);
	    		document.getElementById("fileCatalog").value="purOutPerson";
	    		form2.submit();
	    	}else{
	    		return;
	    	}
        	
	    }
	    
	    //发起结算申请
		function SaveData(){
			var save = nui.get("save").getValue();
			//项目人员关系
			var rows = purProjOutper_grid.getData();
			if(rows.length == 0 ){
				nui.alert("外包人员对应的项目信息不能为空！");
				return;
			}
			for(var i = 0;i < rows.length;i ++){
				if(!rows[i].projectno){
					nui.alert("服务项目不能为空！");
					return;
				}
				if(!rows[i].startdate){
					nui.alert("服务开始日期不能为空！");
					return;
				}
				if(!rows[i].expenddate){
					nui.alert("预计结束日期不能为空！");
					return;
				}
				if(!rows[i].workunit){
					nui.alert("工作量单位不能为空！");
					return;
	            }
	            if(!rows[i].price){
					nui.alert("服务价格不能为空！");
					return;
				}
	            if(!rows[i].manager){
					nui.alert("汇报对象不能为空！");
					return;
				}
        		if(rows[i].startdate > rows[i].expenddate){
        			nui.alert("服务项目【" + rows[i].outpername + "】的服务开始日期：" + rows[i].startdate.substring(0,10) + 
        				"不能大于预计结束日期：" + rows[i].expenddate.substring(0,10) + "！");
        			return;
        		}
			}
			nui.get("appButton").setEnabled(false);
        	nui.get("saveButton").setEnabled(false);
        	var data = form.getData();
			//审核信息
			var opioionformData = opioionform.getData();
			data.misOpinion = opioionformData.misOpinion;
			//附件ID赋值
			data.purOutperson.fileids = nui.get("fileids").getValue();
			//供应商简称
			data.suppliersname = nui.get("suppliersname").getValue();
			//流程关注
			//data.purOutperson.guanzhu = nui.get("guanZhuButton").getValue();
			data.save = save;
			data.purProjOutpers = rows;
    		var json = nui.decode(data);
			if(form.validate()){
				if(save == "save"){
					nui.confirm("确认暂时保存？", "确定？",
			            function (action) {            
			                if (action == "ok") {
					    		form.loading("暂时保存处理中,请稍后...");
					    		nui.ajax({
					    			url:"com.primeton.eos.ame_pur.outpersonFiling.makePurOutpersonFilingFirst.biz.ext",
					    			data:json,
					    			type:"post",
					    			contentType:"text/json",
					    			success:function(action){
					    				form.unmask();
					    				action = nui.clone(action);
					    				var actionJson = nui.decode(action);
					    				if(action.exception == null){
								        	nui.alert("保存成功","系统提示",function(){
								        		CloseWindow("ok");
								        		<%-- window.location="<%=request.getContextPath() %>/bps/wfclient/task/taskList.jsp?taskType=self"; --%>
								        	});
					    				}else{
					    					nui.alert("保存失败，请联系信息技术部人员！","系统提示", function(action){
					    						nui.get("appButton").setEnabled(true);
			                					nui.get("saveButton").setEnabled(true);
					    					});
					    				}
					    			},
					    			error:function(jqXHR, textStatus, errorThrown){
					    				nui.alert("error:" + jqXHR.responseText);
					    			}
					    		});
			                } else {
			                	nui.get("appButton").setEnabled(true);
            					nui.get("saveButton").setEnabled(true);
			                    return;
			                }
			            }
			        );
				}else{
					nui.confirm("确认发起流程？", "确定？",
			            function (action) {            
			                if (action == "ok") {
					    		form.loading("流程处理中,请稍后...");
					    		nui.ajax({
					    			url:"com.primeton.eos.ame_pur.outpersonFiling.makePurOutpersonFilingFirst.biz.ext",
					    			data:json,
					    			type:"post",
					    			contentType:"text/json",
					    			success:function(action){
					    				form.unmask();
					    				action = nui.clone(action);
					    				var actionJson = nui.decode(action);
					    				if(action.exception == null){
								        	nui.alert("外包人员报备申请流程发起成功","系统提示",function(){
								        		CloseWindow("ok");
								        		<%-- window.location="<%=request.getContextPath() %>/bps/wfclient/task/taskList.jsp?taskType=finishedSelf"; --%>
								        	});
					    				}else{
					    					nui.alert("外包人员报备申请流程发起失败，请联系信息技术部人员！","系统提示", function(action){
						    					nui.get("appButton").setEnabled(true);
				                				nui.get("saveButton").setEnabled(true);
					    					});
					    				}
					    			},
					    			error:function(jqXHR, textStatus, errorThrown){
					    				nui.alert("error:" + jqXHR.responseText);
					    			}
					    		});
			                } else {
			                	nui.get("appButton").setEnabled(true);
            					nui.get("saveButton").setEnabled(true);
			                    return;
			                }
			            }
			        );
				}
	    	}else{
	    		nui.get("appButton").setEnabled(true);
		    	nui.get("saveButton").setEnabled(true);
	    		return;
	    	}
		}
		
		//标准方法接口定义
        function CloseWindow(action) {
            if (action == "close" && form.isChanged()) {
                if (confirm("数据被修改了，是否先保存？")) {
                    return false;
                }
            }
            if (window.CloseOwnerWindow) {
	            return window.CloseOwnerWindow(action);
            }else{
	            window.close();            
            } 
        }
        
	    /**
	     * 字符串去空格
	     */
	    function qukongge(str){
	    	return str.replace(/^\s+|\s+$/g,'');
	    }
	</script>
</body>
</html>
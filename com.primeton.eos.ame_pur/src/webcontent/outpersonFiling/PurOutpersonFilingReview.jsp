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
  - Date: 2017-01-12 10:57:27
  - Description:
-->
<head>
	<title>新增外包人员报备审核</title>
	<meta http-equiv="content-type" content="text/html; charset=UTF-8" />
	<script src="<%= request.getContextPath() %>/common/nui/nui.js" type="text/javascript"></script>
	<script src="../common/nui/nui.js" type="text/javascript"></script>
	<style type="text/css">
	    body{
	        margin:0;padding:0;border:0;width:100%;height:100%;overflow:hidden;
	    }
    </style>
    <!-- 标签文本化 -->
    <script src="../../scripts/boot.js" type="text/javascript"></script>
    <style type="text/css">
	    .asLabel .mini-textbox-border,
	    .asLabel .mini-textbox-input,
	    .asLabel .mini-buttonedit-border,
	    .asLabel .mini-buttonedit-input,
	    .asLabel .mini-textboxlist-border
	    {
	       border: 0;background: none;cursor:default;
	    }
	    .asLabel .mini-buttonedit-button
	    {
	        display: none;
	    }
    </style>
</head>
<body>
	<!-- 
	1、显示外包人员信息及附件(可更新)
	2、建立外包人员Ame+系统账号
	3、账号同步企业号
	4、微信提醒发起人和项目负责人，外包人员报备成功，指导其绑定企业号并要求每日打卡，同时尽早签订工作协议书
	5、短信提醒外包人员绑定企业号 
	 -->
	<%long workItemID = (Long)request.getAttribute("workItemID"); %>
	<div class="nui-fit">
		<!-- 提示信息展示 -->
		<jsp:include page="/ame_common/ameFlowOperTips/ameFlowOperTipsInfo.jsp"/>
		<form id="form1" method="post">
			<fieldset id="field1" style="border:solid 1px #aaa;padding:3px;">
				<legend>外包人员基本信息</legend>
				<input name="purOutperson.outperno" id="outperno" class="nui-hidden"/>
				<input name="purOutperson.fileids" id="fileids1" class="nui-hidden"/>
				<input name="purOutperson.save" id="save" class="nui-hidden" />
				<div style="padding:5px;">
					<table style="table-layout:fixed;" id="table_file">
						<tr>
							<td align="right" width="100px">姓名：</td>
							<td><input name="purOutperson.outpername" id="outpername" class="nui-textbox" 
									required="true" style="width:110px" emptyText="请输入姓名" />
							</td>
							<td align="right" style="width:100px;">身份证号码：</td>
							<td><input name="purOutperson.outpercartno" id="outpercartno" class="nui-textbox" 
									vtype="rangeLength:18" required="true" style="width:170px" />
							</td>
							<td align="right" style="width:100px;">供应商：</td>
							<td colspan="3"><input name="purOutperson.custid" id="custid" required="true" emptyText="请选择供应商"
								class="nui-buttonedit" onbuttonclick="selectSupplier" style="width:340px" allowInput="false" />
							</td>
						</tr>
						<tr>
							<td align="right" style="width:100px;">联系电话：</td>
							<td><input name="purOutperson.linktel" id="linktel" class="nui-textbox" required="true" style="width:130px" />
							</td>
							<td align="right" style="width:100px;">毕业时间：</td>
							<td><input name="purOutperson.gradudate" id="gradudate" class="nui-datepicker" style="width:100px" />
							</td>
							<td align="right" style="width:100px;">性别：</td>
							<td><input name="purOutperson.gender" showNullItem="true" id="gender" class="nui-dictcombobox" 
							required="false" style="width:50px" dictTypeId="ABF_GENDER" />
							</td>
							<td align="right" style="width:100px;">学历：</td>
							<td><input name="purOutperson.degree" id="degree" showNullItem="true" class="nui-dictcombobox" 
								dictTypeId="DEGREE" style="width:70px" required="false" />
							</td>
						</tr>
						<tr>
							<td align="right" style="width:100px;">联系邮箱：</td>
							<td colspan="3"><input name="purOutperson.linkemail" id="linkemail" class="nui-textbox" 
								emailErrorText="请输入正确的邮件格式" vtype="email" style="width:308px" />
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
							<input property="editor" class="nui-datepicker" />
						</div>
						<div field="expenddate" width="97" align="center" renderer="onDealDate" dateFormat="yyyy-MM-dd" headerAlign="center">预计结束日期
							<input property="editor" class="nui-datepicker" />
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
						<div field="manager" width="80" align="center" headerAlign="center" displayField="managername">汇报对象
							<input property="editor" class="nui-buttonedit" onbuttonclick="selectOrgname" 
								allowInput="false"/>
						</div>
					</div>
				</div>
			</fieldset>
		</form>
		<fieldset id="field3" style="border:solid 1px #aaa;padding:3px;">
			<legend>外包人员附件</legend>
			<div id="grid_0" class="nui-datagrid" style="width:100%;height:auto;" showPager="false" sortMode="client" 
				url="com.primeton.eos.ame_common.file.getFiles.biz.ext" dataField="files" allowCellEdit="true" allowCellSelect="true" 
				multiSelect="true" editNextOnEnterKey="true">
				<div property="columns">
					<div type="indexcolumn" headerAlign="center" width="35" >编号</div>
					<div field="fileName"width="400" headerAlign="center" align="center" renderer="getdetail1">附件名称</div>
					<div field="fileType" width="140" renderer="dictKbasetype" align="center" headerAlign="center" >附件类型</div>
					<div field="operatorname" width="100"headerAlign="center" align="center">操作员名称</div>
					<div field="fileTime" width="150" headerAlign="center" align="center" dateFormat="yyyy-MM-dd HH:mm:ss">附件上传时间</div>
					<div renderer="deleteFile" width="auto" headerAlign="center" align="center">操作</div>
				</div>
			</div> 
			<jsp:include page="/ame_common/addFiles1.jsp"/>
		</fieldset>
		<jsp:include page="/ame_common/misOpinion.jsp"/>
	</div>
	<div style="text-align:center;padding:10px;" class="nui-toolbar">
		<a class="nui-button" onclick="onOk" style="width:60px;margin-right:20px;" id="sureButton">提交</a>
		<a class="nui-button" onclick="onCancel('cancel')" style="width:60px;" id="canelButton">关闭</a>
	</div>
	<script type="text/javascript">
		nui.parse();
		var form = new nui.Form("form1");
		var opioionform = new nui.Form("#opioionform");
		//外包人员归属项目
	  	var purProjOutper_grid = nui.get("purProjOutper_grid");
	  	var grid_0 = nui.get("grid_0");
	  	var activityDefID;
	  	init();
		function init(){
			var data={workItemID: <%=workItemID %>,getStep: "review"};
			var json=nui.encode(data);
			nui.ajax({
				url:"com.primeton.eos.ame_pur.outpersonFiling.getPurOutpersonFiling.biz.ext",
				type:"post",
				data:json,
				contentType:"text/json",
				success:function (o){
					o = nui.clone(o);
					form.setData(o);
					grid_0.load({"groupid":"purOutperson","relationid": o.purOutperson.outperno});
					nui.get("custid").setText(o.purOutperson.custname);
					
					//项目人员关系
					purProjOutper_grid.setData(o.purOutperson.purProjOutpers);
					//流程回退路径赋值 
		            nui.get("backTo").setData(o.purOutperson.backList);
		            
		            activityDefID = o.workItem.activityDefID;
		            //审核结果设置
					initMisOpinion({auditstatus: "1"});
					nui.get("processinstid").setValue(o.workItem.processInstID);
	               	nui.get("processinstname").setValue(o.workItem.processInstName);
	               	nui.get("activitydefid").setValue(o.workItem.activityDefID);
	               	nui.get("workitemname").setValue(o.workItem.workItemName);
					nui.get("workitemid").setValue(<%=workItemID %>);
		            //查询审核意见
		        	var processinstid = o.purOutperson.processinstid;
					var grid = nui.get("datagrid1");
					grid.load({processInstID: processinstid});
					grid.sortBy("time", "desc");
					//流程提示信息
					promptInit({workItemID:<%=workItemID %>});
				},
				error:function(){
				}
			});
		}
		
		//外包人员归属项目列表-选择项目,级联得到所属订单，合同
        function selectProjectList(){
        	var btnEdit = this;
        	nui.open({
                url:"<%=request.getContextPath() %>/ame_common/SelectProject.jsp?preSettle=bukongzhi",
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
                            var rowData = {custid: data.custid,custname: data.custname};
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
                        }
                    }
                }
            });
        }
		
		//添加外包人员归属项目行
    	function addRow() {
            //点击添加行,后台查询出该外包人员签订的数据信息
			var newRow = { name: "New Row",
				currentstatus: 4,
				inputratio: 1
			};
    		purProjOutper_grid.addRow(newRow, 0);
    	}
    	
    	//删除外包人员归属项目行
    	function removeRow(gridid) {
	        var grid = nui.get(gridid);
	        var rows = grid.getSelecteds();
	        var data = {purProjOutpers: rows};
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
				            		if (text.execption == null || text.execption == "") {
				            			nui.alert("删除成功！","操作提示",function(){
				            				grid.sortBy("startdate","desc");
				            				grid.load({"purOutperson": {"outperno": nui.get("outperno").getValue()}});
				            			});
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
		
		/**
		 * 附件操作
		 */
		function deleteFile(e){
            var record = e.record;
            var uid = record._uid;
        	return "<a href='javascript:void(0)' onclick='deleteFile1(" + uid + ")'>删除 </a>";
        }
        
        function deleteFile1(uid){
        	var grid = nui.get("grid_0");
        	var row = grid.getRowByUID(uid);  //获取所有选中的行对象
	        var data = {files:row};
		    var json = nui.encode(data); 
			nui.confirm("确定删除此附件信息？","操作提示",function(action){
				if(action == "ok"){
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
			});
        }
        
        //附件下载
        function getdetail1(e){
        	return "<a href='javascript:void(0)' onclick='checkDetail();' title='点击查看'>" + e.value + "</a>";
        }
        function checkDetail(){
        	var grid = nui.get("grid_0");
        	var selectRow = grid.getSelected();
        	var url="com.primeton.components.web.fileupload.getfile.flow?fileId="+selectRow.fileId;
			window.open(url, '_self');
        }
        
        function onOk(){
        	//审核结果0：退回，1：通过，2：终止流程
			var auditstatus = nui.get("auditstatus").getValue();
			var filePaths1 = document.getElementsByName("uploadfile").length;
        	for(var j = 0;j < filePaths1;j++){
        		var a = document.getElementsByName("remarkList")[j].value;
        		if(a == null || a == ""){
        			nui.alert("外包人员新增附件不可以为空");
        			return false;
        		}
        	}
        	var confirmTips = "";
			if(auditstatus == "1"){	//通过
				confirmTips = "确定提交流程吗？";
			}else if(auditstatus == "0"){	//退回
	        	confirmTips = "确定退回流程吗？";
	        	if(nui.get("backTo").getValue() == null || nui.get("backTo").getValue() == ""){
	        		nui.alert("未选择退回到的工作项！");
	        		return;
	        	}
			}else if(auditstatus == "2"){	//终止
				confirmTips = "确定终止流程吗？";
			}
			if(auditstatus == "1"){
				if(!form.validate()){
					nui.alert("信息录入不完整。");
					return;
				}
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
			}
			nui.confirm(confirmTips, "操作提示",
	            function (action) {            
	                if (action == "ok") {
	                	nui.get("sureButton").setEnabled(false);
				    	document.getElementById("fileCatalog1").value="purOutPerson";
						form4.submit();
					}else{
						return;
					}
				}
			);
        }
        
    	function SaveData1(){
			var auditstatus = nui.get("auditstatus").getValue();
			if(auditstatus == "1"){		//不是终止流程
				if(!form.validate()){
					nui.alert("信息录入不完整。");
					return;
				}
			}
			purOutpersonFilingReview();
		}
		
		function purOutpersonFilingReview(){
			var data = form.getData();
			//审核信息
			var opioionformData = opioionform.getData();
			data.misOpinion = opioionformData.misOpinion;
			//工作项ID
    		data.workitemid = "<%=workItemID %>";
    		//退回位置
    		var backTo = nui.get("backTo").getValue();
    		data.purOutperson.backTo = backTo;
    		//项目人员关系
    		var rows = purProjOutper_grid.getChanges();
    		data.purProjOutpers = rows;
    		if(activityDefID =="manualActivity1"){
	    		var rowsAll = purProjOutper_grid.getData();
	    		data.allPurProjOutpers = rowsAll;
    		}
    		if(data.misOpinion.auditstatus == "1"){
    			//审核完成标识
    			if(activityDefID =="manualActivity1"){
	    			data.iden = "reviewDone";
    			}else{
    				data.iden = "reviewCheck";
    			}
    		}
			var json = nui.encode(data);
    		nui.ajax({
    			url:"com.primeton.eos.ame_pur.outpersonFiling.makePurOutpersonFilingReview.biz.ext",
    			data:json,
    			type:"post",
    			contentType:"text/json",
    			success:function(action){
    				if(action.exception == null){
    					if(action.resultStr == null){
				        	nui.alert("提交成功","系统提示",function(){
				        		CloseWindow("ok");
				        	});
    					}else{
    						if(activityDefID =="manualActivity1"){
    							nui.alert(action.resultStr,"系统提示",function(){
					        		CloseWindow("ok");
					        	});
    						}else{
    							nui.alert("提交成功","系统提示",function(){
					        		CloseWindow("ok");
					        	});
    						}
    					}
    				}else{
    					nui.alert("提交失败，请联系信息技术部人员！","系统提示", function(action){
    						nui.get("sureButton").setEnabled(true);
    					});
    				}
    			},
    			error:function(jqXHR, textStatus, errorThrown){
    				nui.alert("error:" + jqXHR.responseText);
    			}
    		});
		}
		
		function onCancel(){
			CloseWindow("ok");
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
	</script>
</body>
</html>
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
  - Author(s): 许青倩
  - Date: 2018-09-11 09:59:23
  - Description:
-->
<head>
	<title>外包人员报备信息</title>
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
	<%Long processInstID = Long.parseLong(request.getParameter("processInstID")); %>
	<div class="nui-fit">
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
							<td name="purOutperson.outpername" id="outpername" width="200px"></td>
							<td align="right" style="width:100px;">身份证号码：</td>
							<td name="purOutperson.outpercartno" id="outpercartno" width="200px"></td>
							<td align="right" style="width:100px;">供应商：</td>
							<td name="purOutperson.custid" id="custid" colspan="3" width="400px"></td>
						</tr>
						<tr>
							<td align="right" style="width:100px;">联系电话：</td>
							<td name="purOutperson.linktel" id="linktel" width="200px"></td>
							<td align="right" style="width:100px;">毕业时间：</td>
							<td name="purOutperson.gradudate" id="gradudate" width="200px"></td>
							<td align="right" style="width:100px;">性别：</td>
							<td name="purOutperson.gender" id="gender" width="200px"></td>
							<td align="right" style="width:100px;">学历：</td>
							<td name="purOutperson.degree" id="degree" width="200px"></td>
						</tr>
						<tr>
							<td align="right" style="width:100px;">联系邮箱：</td>
							<td name="purOutperson.linkemail" id="linkemail" colspan="3" width="600px"></td>
							<td align="right" style="width:100px;">备注：</td>
							<td name="purOutperson.memo" id="memo" colspan="3" width="600px"></td>
						</tr>
					</table>
				</div>
			</fieldset>
			<fieldset id="field2" style="border:solid 1px #aaa;padding:3px;">
				<legend>项目列表</legend>
				<div id="purProjOutper_grid" class="nui-datagrid" style="width:100%;height:auto;" dataField="purProjOutper" 
					 showPager="false" allowCellEdit="true" allowCellSelect="false" multiSelect="true" editNextOnEnterKey="true"
					 url="com.primeton.eos.ame_pur.outperson.queryPurOutpersonMainTain.biz.ext" showFooter="false">
					<div property="columns">
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
			<div id="grid_0" class="nui-datagrid" style="width:100%;height:auto;" showPager="false" sortMode="client" 
				url="com.primeton.eos.ame_common.file.getFiles.biz.ext" dataField="files" allowCellEdit="true" allowCellSelect="true" 
				multiSelect="true" editNextOnEnterKey="true">
				<div property="columns">
					<div type="indexcolumn" headerAlign="center" width="35" >编号</div>
					<div field="fileName"width="400" headerAlign="center" align="center" renderer="getdetail1">附件名称</div>
					<div field="fileType" width="140" renderer="dictKbasetype" align="center" headerAlign="center" >附件类型</div>
					<div field="operatorname" width="100"headerAlign="center" align="center">操作员名称</div>
					<div field="fileTime" width="150" headerAlign="center" align="center" dateFormat="yyyy-MM-dd HH:mm:ss">附件上传时间</div>
					<div renderer="deleteFile" width="0" headerAlign="center" align="center">操作</div>
				</div>
			</div> 
		</fieldset>
	</div>
	
	<script type="text/javascript">
		nui.parse();
		var form = new nui.Form("form1");
		form.setChanged(true);
		//var opioionform = new nui.Form("#opioionform");
		//外包人员归属项目
	  	var purProjOutper_grid = nui.get("purProjOutper_grid");
	  	//同号身份证
	  	var cardnoBoolean = false;
	  	//同号电话号码
	  	var telnoBoolean = false;
	  	var grid_0 = nui.get("grid_0");
	  	
		init();
		function init(){
			var data={processInstID: <%=processInstID %>};
			var json=nui.encode(data);
			nui.ajax({
				url:"com.primeton.eos.ame_pur.outpersonFiling.getPurOutpersonLook.biz.ext",
				type:"post",
				data:json,
				contentType:"text/json",
				success:function (o){
					o = nui.clone(o);
					document.getElementById("outpername").innerHTML= o.purOutperson.outpername == null ? "" : o.purOutperson.outpername;
                    document.getElementById("outpercartno").innerHTML= o.purOutperson.outpercartno == null ? "" : o.purOutperson.outpercartno;
                    document.getElementById("gender").innerHTML= o.purOutperson.gender == null ? "" : nui.getDictText("ABF_GENDER",o.purOutperson.gender);
                    document.getElementById("degree").innerHTML= o.purOutperson.degree == null ? "" : nui.getDictText("DEGREE",o.purOutperson.degree);
                    document.getElementById("gradudate").innerHTML= o.purOutperson.gradudate == null ? "" : o.purOutperson.gradudate;
                    document.getElementById("linktel").innerHTML= o.purOutperson.linktel == null ? "" : o.purOutperson.linktel;
                    document.getElementById("custid").innerHTML= o.purOutperson.custname == null ? "" : o.purOutperson.custname;
                    document.getElementById("linkemail").innerHTML= o.purOutperson.linkemail == null ? "" : o.purOutperson.linkemail;
                    document.getElementById("memo").innerHTML= o.purOutperson.memo == null ? "" : o.purOutperson.memo;
                    
					form.setData(o);
					grid_0.load({"groupid":"purOutperson","relationid": o.purOutperson.outperno});
					
					//项目人员关系
					purProjOutper_grid.setData(o.purOutperson.purProjOutpers);
				},
				error:function(){
				}
			});
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
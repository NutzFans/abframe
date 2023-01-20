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
<title>新增/编辑采购订单信息</title>
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
<fieldset id="field1" style="border:solid 1px #aaa;padding:3px;">
	<legend>采购订单基本信息</legend>
	<form id="form1" method="post">
		<input name="purOrder.fileids" id="fileids"  class="nui-hidden"/>
		<input name="purOrder.purorderid" id="purorderid" class="nui-hidden" />	
		<div style="padding:5px;">
			<table style="table-layout:fixed;" id="table_file">
				<tr>
					<td align="right" style="width:120px">供应商：</td>
					<td style="width:285px"><input id="custid" name="custid" class="nui-buttonedit" onbuttonclick="selectSupplier"  allowInput="false" style="width:280px"/></td>
					<td align="right" style="width:120px">采购合同名称：</td>
					<td style="width:315px"><input name="purOrder.purContract.purcontid" id="purContract.purcontid" class="nui-combobox"  valueField="purcontid" textField="purcontname" allowInput="false" style="width:310px"/></td>
				</tr>
				<tr>
					<td align="right" style="width:120px">采购订单编号：</td>
					<td><input name="purOrder.purordernum" id="purordernum" class="nui-textbox" style="width:180px" onblur="validePurorderid"/></td>
					<td align="right" style="width:120px">服务客户：</td>
					<td><input name="purOrder.userid" id="userid" class="nui-buttonedit" onbuttonclick="selectCustmer" allowInput="false" style="width:280px" /></td>
				</tr>
				<tr>
					<td align="right" style="width:120px">项目名称：</td>
					<td><input name="purOrder.projectno" id="projectno" class="nui-combobox" valueField="projectno" textField="projectName" allowInput="false" style="width:280px" onblur="chengeProject"/></td>
					<td align="right" style="width:120px">状态：</td>
					<td><input name="purOrder.purstatus" id="purstatus" class="nui-dictcombobox" dictTypeId="AME_ORDERSTATUS" style="width:100px" showNullItem="true" nullItemText=""/></td>
				</tr>
				<tr>
					<td align="right" style="width:120px">协议签订人员：</td>
					<td><input name="purOrder.signuserid" id="signuserid" class="nui-buttonedit" onbuttonclick="selectOmEmployee" allowInput="false" style="width:100px" /></td>
					<td align="right" style="width:120px">签订日期：</td>
					<td><input name="purOrder.signdate" id="signdate" class="nui-datepicker" style="width:100px"/></td>
				</tr>
				<tr>
					<td align="right" style="width:120px">结算周期说明：</td>
					<td colspan="3"><input name="purOrder.calcycle" id="calcycle" class="nui-textarea"  style="width:100%"/></td>
				</tr>
				<tr>
					<td align="right" style="width:120px">协议内容说明：</td>
					<td colspan="3"><input name="purOrder.contmemo" id="contmemo" class="nui-textarea" style="width:100%"/></td>
					</tr>
			</table>
		</div>
	</form>
	<jsp:include page="/ame_common/inputFile.jsp"/>
	</fieldset>
	<fieldset id="fieldoutper" style="border:solid 1px #aaa;padding:3px;">
		<legend>外包人员基本信息</legend>
		<div style="width:100%;">
	        <div class="mini-toolbar" style="border-bottom:0;padding:0px;">
	            <table style="width:100%;">
	                <tr>
	                    <td style="width:100%;">
	                        <a class="mini-button" iconCls="icon-add" onclick="add()">增加</a>
<!-- 	                        <a class="mini-button" iconCls="icon-save" onclick="save()">保存</a>             -->
	                    </td>
	                </tr>
	            </table>           
	        </div>
	    </div>
		<div id="datagrid" class="nui-datagrid" dataField="purOutpersons" style="width:100%;height:auto;" multiSelect="true" 
	    	url="com.primeton.eos.ame_pur.purContractProcess.queryPurOutPersonBySupplier.biz.ext" showFooter="false" showPager="false" allowCellEdit="true" allowCellSelect="true" showSummaryRow="true"
	    	allowSortColumn="false"  onlyCheckSelection="true" ><!-- oncellendedit="addPurOrderOutper" -->
			<div property="columns">
				<div type="checkcolumn" width="30"></div>
				<div field="purorderid" width="0" align="center" headerAlign="center">订单编号</div>
				<div field="outperno" width="0" align="center" headerAlign="center" allowSort="true">人员编号</div>
				<div field="outpername"width="70" align="center" headerAlign="center">姓名</div>	
				<div field="workunit" width="80" align="center" headerAlign="center" allowSort="true" renderer="dictOutperType">
					工作量计量单位
					<input property="editor" class="nui-dictcombobox" dictTypeId="SERV_NUM_TYPE" style="width:100%;"/>
				</div>
				<div field="price" width="80" dataType="currency" align="center" headerAlign="center" allowSort="true">
					单价
					<input property="editor" class="nui-textbox" style="width:100%;" vtype="float"/>
				</div>
				<div field="startdate" width="80" align="center" renderer="onDealDate" headerAlign="center" allowSort="true">
					服务开始日期
					<input property="editor" class="nui-datepicker" format="yyyy-MM-dd" style="width:100%;" />
				</div><!-- renderer="onDealDate" -->
				<div field="expenddate" width="100" align="center" renderer="onDealDate" headerAlign="center" allowSort="true">
					预计服务截止日期
					<input property="editor" class="nui-datepicker" format="yyyy-MM-dd" style="width:100%;" />
				</div>
				<div field="currentstatus" width="60" align="center" renderer="dictOutperStatus" headerAlign="center" allowSort="true">
					人员状态
					<input property="editor" class="nui-dictcombobox" dictTypeId="AME_OUTPERSTATUS" style="width:100%;" />
				</div>
				<div field="projectno" displayField="projectName" width="100" headerAlign="left">
					项目
	                <input property="editor" class="nui-buttonedit" onbuttonclick="selectProject" style="width:100%;"/>
	            </div>
				<div field="managername" width="80" align="center" headerAlign="center">
					汇报人
					<input property="editor" class="nui-textbox" style="width:100%;" />
				</div>
				<div field="pcprotype"  width="90" renderer="dictstatus" align="center" headerAlign="center">
					电脑提供方式
					<input property="editor" class="nui-dictcombobox" dictTypeId="AME_PCPROTYPE" style="width:100%;" showNullItem="true" nullItemText=""/>
				</div>
				<div field="comment" width="80" align="center" headerAlign="center">
					说明
					<input property="editor" class="nui-textbox" style="width:100%;" />
				</div>
			</div>
		</div>
	</fieldset>
</div>
<div style="text-align:center;padding:10px;" class="nui-toolbar">
	<a class="nui-button" onclick="onOk" id="savePurOrder" style="width:60px;margin-right:20px;">确定</a>
	<a class="nui-button" onclick="onCancel('cancel')" style="width:60px;">关闭</a>
</div>
</body>
<script type="text/javascript">
    nui.parse();
  	var form = new nui.Form("form1");
  	var datagrid = nui.get("datagrid");
    var updateURL = "com.primeton.eos.ame_pur.PurOrder.updatePurOrder.biz.ext";
	var addURL = "com.primeton.eos.ame_pur.PurOrder.addPurOrder.biz.ext";
	//新增查询供应商所有人员
    	
	//编辑查询订单人员
	var saveURL = "";   
	var addperdata="";  
    var purordernumValid = "";   
    function SetData(data){
    	var data = nui.clone(data);
    	addperdata = nui.clone(data);
    	if(data.action == "edit"){
    		var json = nui.encode({purOrder:data}); 
        	nui.ajax({
        		url: "com.primeton.eos.ame_pur.PurOrder.getPurOrderDetail.biz.ext",
                data: json,
                type: 'POST',
                cache: false,
                contentType: 'text/json',
                success: function (o) {
                	//加载附件设置参数
                	nui.get("grid_0").load({"groupid":"purOrder","relationid":o.purOrder.purorderid});
                    form.setData(o);
                    form.isChanged(false);
                    nui.get("custid").setValue(o.purOrder.purContract.purSupplier.custid);
                    nui.get("custid").setText(o.purOrder.purContract.purSupplier.custname);
                    nui.get("purContract.purcontid").setValue(o.purOrder.purContract.purcontid);
                    nui.get("purContract.purcontid").setText(o.purOrder.purContract.purcontname);
                    nui.get("userid").setText(o.purOrder.custname);
                    nui.get("projectno").setText(o.purOrder.projectName);	
                    nui.get("signuserid").setText(o.purOrder.empname);
                    purordernumValid = o.purOrder.purordernum;
                    
                    //外包人员信息
					var custid = o.purOrder.purContract.purSupplier.custid;
	            	var purorderid = o.purOrder.purorderid;
	            	var projectno = o.purOrder.projectno;
	            	var projectName = o.purOrder.projectName;
	            	var json2 = nui.decode({purSupplier:{purorderid:purorderid,custid:custid,projectName:projectName,projectno:projectno}});
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
                    alert(jqXHR.responseText);
                    CloseWindow();
                }
        	});
		}
	}
    	
    	
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
                        //带出供应商的合同信息
                        nui.ajax({
			        		url: "com.primeton.eos.ame_pur.PurOrder.getPurContractBySupplier.biz.ext",
			                data: {custid:data.custid},
			                type: 'POST',
			                cache: false,
			                contentType: 'text/json',
			                success: function (o) {
			                	if(o.purContracts==null || o.purContracts==""){
			                		alert("该供应商还没有签署合同！");
			                		return;
			                	}
			                	nui.get("purContract.purcontid").setData(o.purContracts);
			                	nui.get("purContract.purcontid").setValue(o.purContracts[0].purcontid);
			                	nui.get("purContract.purcontid").setText(o.purContracts[0].purcontname);
			                },
			                error: function (jqXHR, textStatus, errorThrown) {
			                    alert(jqXHR.responseText);
			                    CloseWindow();
			                }
			        	});
			        	//之前根据供应商load外包人员，现在是根据供应商和项目编号load人员（外包人员缺省带项目信息，可以更改）
			    		var projectno = nui.get("projectno").getValue();
			    		if(projectno){
			    			//展示外包人员信息
							var custid = nui.get("custid").getValue();
			            	var purorderid = nui.get("purorderid").getValue();
			            	var projectno = nui.get("projectno").getValue();
			            	var projectName = nui.get("projectno").getText();
		                	var json2 = nui.decode({purSupplier:{purorderid:purorderid,custid:custid,projectName:projectName,projectno:projectno}});
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
				                	alert("该服务客户没有对应的项目信息！");
				                	return;
				                }
			                	//项目
			                	nui.get("projectno").setData(o.rdProjects);
			                	nui.get("projectno").setValue(o.rdProjects[0].projectno);
			                	nui.get("projectno").setText(o.rdProjects[0].projectName);
			                	//之前根据供应商load外包人员，现在是根据供应商和项目编号load人员（外包人员缺省带项目信息，可以更改）
					    		var custid = nui.get("custid").getText();
					    		if(custid){
						    		//展示外包人员信息
									var custid = nui.get("custid").getValue();
					            	var purorderid = nui.get("purorderid").getValue();
					            	var projectno = nui.get("projectno").getValue();
					            	var projectName = nui.get("projectno").getText();
				                	var json2 = nui.decode({purSupplier:{purorderid:purorderid,custid:custid,projectName:projectName,projectno:projectno}});
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
    
    //选择人员弹窗
    function selectOmEmployee(){
    	var btnEdit = this;
        nui.open({
            url:"<%=request.getContextPath() %>/machine/SelectEmployee.jsp",
            title: "选择人员",
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
    	
	var flag = true;
    function validePurorderid(){
    	//订单编号唯一性验证
    	if(nui.get("purordernum").getValue() == purordernumValid){
    		flag = true;
    		return;
    	}
        var purordernum = nui.get("purordernum").getValue();
        var json = {purordernum: purordernum};
        nui.ajax({
            url: "com.primeton.eos.ame_pur.PurOrder.validteOrdernum.biz.ext",
            data: json,
            type: 'POST',
            cache: false,
            contentType: 'text/json',
            success: function (text) {
               	if(text.cont == 1){
               		alert("订单编号已被供应商：" + text.purOrder.purContract.purSupplier.suppliersname + "的" + text.purOrder.purContract.purcontname + "合同的的订单使用！");
               		flag = false;
               		return;
               	}else if(text.cont == 0){
               		flag = true;
               	}
            },
            error: function (jqXHR, textStatus, errorThrown) {
                alert(jqXHR.responseText);
                CloseWindow();
            }
        });
    }
    	
	function onOk(e) {
		if(!form.validate()){
	    	alert("表单信息填写不完整，请确认必输项是否填写！！");
	    	return;
	    }
    	var filePaths = document.getElementsByName("uploadfile").length;
    	for(var j=0;j<filePaths;j++){
    		var a=document.getElementsByName("remarkList")[j].value;
    		if(a==null||a==""){
    			alert("新增附件不可以为空");
    			return false;
    		}
    	}
    	var rows = datagrid.getSelecteds();
		if(rows.length==0){
			alert("请至少选中一个外包人员！");
			return;
		}
    	for(var i = 0;i < rows.length;i ++){
			if(!rows[i].price){
				alert("外包人员:" + rows[i].outpername + "的人月单价不能为空");
				return;
			}
			if(!rows[i].price){
				alert("外包人员:" + rows[i].outpername + "的人月单价不能为空");
				return;
			}
			if(!rows[i].startdate){
				alert("外包人员:" + rows[i].outpername + "的服务开始日期不能为空");
				return;
			}
			if(!rows[i].expenddate){
				alert("外包人员:" + rows[i].outpername + "的预计服务结束日期不能为空");
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
		if(flag){
        	if(confirm("确定提交？")){
        		nui.get("savePurOrder").disable();
				document.getElementById("fileCatalog").value="purOrder";
        		form2.submit();
			}
        }else{
        	alert("订单编号不可重复，请修改合同编号！");
        }
    	
    }
        
    function SaveData() {
        if(!form.validate()){
        	alert("表单信息填写不完整，请确认必输项是否填写！!");
        	return;
        }
    	var purorderid = nui.get("purorderid").getValue();
    	var saveURL = "";
    	var o = form.getData();
        var rows = datagrid.getSelecteds();
        var allPerson = datagrid.getData();
        var json = {allpurOrderOutpersons:allPerson,purOrderOutpersons:rows,purOrder:o.purOrder};
		if(purorderid){
			saveURL = updateURL;
			nui.ajax({
                url: saveURL,//updatePurOrder
                data: json,
                type: 'POST',
                cache: false,
                contentType: 'text/json',
                success: function (text) {
                   	var returnJson = nui.decode(text);
	               	if(returnJson.exception == null){
	               		CloseWindow("saveSuccess");
	              	}else{
	                	nui.alert("保存失败", "系统提示", function(action){
	                  		if(action == "ok" || action == "close"){
	                  			nui.get("savePurOrder").enable();
	                  		}
                		});
	              	}
                },
                error: function (jqXHR, textStatus, errorThrown) {
                    alert(jqXHR.responseText);
                    CloseWindow();
                }
            });
		} else {
			saveURL = addURL;
            nui.ajax({
                url: saveURL,//addPurOrder
                data: json,
                type: 'POST',
                cache: false,
                contentType: 'text/json',
                success: function (text) {
                   	var returnJson = nui.decode(text);
	              	if(returnJson.exception == null){
	              		alert("保存成功！");
		                CloseWindow("ok");
	              	}else{
	                	nui.alert("保存失败", "系统提示", function(action){
		                  	if(action == "ok" || action == "close"){
		                  		nui.get("savePurOrder").enable();
		                  	}
	                  	});
	                }     
                },
                error: function (jqXHR, textStatus, errorThrown) {
                    alert(jqXHR.responseText);
                    CloseWindow();
                }
            });
        }
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
        
    function onCancel(e) {
        CloseWindow("cancel");
    }
        
	//附件下载
    function getdetail(e){
    	return "<a href='javascript:void(0)' onclick='checkDetail();' title='点击查看'>" + e.value + "</a>";
    }
    
    function checkDetail(){
    	var grid = nui.get("grid_0");
    	var selectRow = grid.getSelected();
    	var url="com.primeton.components.web.fileupload.getfile.flow?fileId="+selectRow.fileId;
		window.open(url, '_self');
    }
        
    /** 新增外包人员*/
	function add() {
		if(nui.get("custid").getValue()=="" ||  nui.get("custid").getValue()== null){
			alert("请先选择供应商！");
			return;
		}
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
                var custid = nui.get("custid").getValue();
                var custname = nui.get("custid").getText();
                var data = { custid:custid,custname:custname};
                iframe.contentWindow.PMOaddPer(data);
            },
            ondestroy: function (action) {
            	 //外包人员信息
				var custid = nui.get("custid").getValue();
            	var purorderid = nui.get("purorderid").getValue();
            	var projectno = nui.get("projectno").getValue();
            	var projectName = nui.get("projectno").getText();
            	var json2 = nui.decode({purSupplier:{purorderid:purorderid,custid:custid,projectName:projectName,projectno:projectno}});
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
        });
    }
    
	//设置日期格式
	function onDealDate(e){
		if(e.value){
			return e.value.substring(0,10);
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
    
    function chengeProject(){
    	//之前根据供应商load外包人员，现在是根据供应商和项目编号load人员（外包人员缺省带项目信息，可以更改）
		var custid = nui.get("custid").getText();
		if(custid){
    		//展示外包人员信息
			var custid = nui.get("custid").getValue();
        	var purorderid = nui.get("purorderid").getValue();
        	var projectno = nui.get("projectno").getValue();
        	var projectName = nui.get("projectno").getText();
        	var json2 = nui.decode({purSupplier:{purorderid:purorderid,custid:custid,projectName:projectName,projectno:projectno}});
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
    
    //人员订单关系表，计算单位
	function dictOutperType(e){
		return nui.getDictText('SERV_NUM_TYPE',e.value);//设置业务字典值
	}
	//电脑提供方式
	function dictstatus(e) {
		return nui.getDictText('AME_PCPROTYPE',e.value);//设置业务字典值
	}
	function dictOutperStatus(e){
		return nui.getDictText('AME_OUTPERSTATUS',e.value);
	}
</script>
</html>

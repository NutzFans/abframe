<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<!-- 
  - Author(s): wanglinqiong
  - Date: 2016-05-12 16:17:56
  - Description:
-->
<head>
<title>新增/编辑采购合同信息</title>
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
	<legend>采购合同基本信息</legend>
	<form id="form1" method="post">
	<input name="purContract.purcontid" id="purcontid" class="nui-hidden"/>
	<input name="purContract.fileids" id="fileids"  class="nui-hidden"/>
		<div style="padding:5px;">
			<table style="table-layout:fixed;" id="table_file">
				<tr>
					<td align="right" style="width:120px">供应商：</td>
					<td style="width:250px"><input name="purContract.purSupplier.custid" id="custname" class="nui-buttonedit" onbuttonclick="showSupplier"  allowInput="false" style="width:280px" required="true"/></td>
					<td align="right" style="width:120px">采购合同编号：</td>
					<td style="width:140px"><input name="purContract.purcontnum" id="purcontnum" class="nui-textbox" required="true" style="width:150px" onblur="validePurContnum()"/></td>
					<td align="right" style="width:120px">采购合同类型：</td>
					<td style="width:150px"><input name="purContract.purtype" id="purtype"  class="nui-dictcombobox" dictTypeId="AME_CONTYPE"  style="width:120px" showNullItem="true" nullItemText=""/></td>
				</tr>
				<tr>
					<td align="right" style="width:120px">合同名称：</td>
					<td><input name="purContract.purcontname" id="purcontname" class="nui-textbox" style="width:285px" required="true"/></td>
					<td align="right" style="width:120px">签订日期：</td>
					<td><input name="purContract.signdate" id="signdate" class="nui-datepicker"  style="width:100px"/></td>
					<td align="right" style="width:120px">合同金额：</td>
					<td><input name="purContract.contmoney" id="contmoney" class="nui-spinner" format="n2" allowLimitValue="false" changeOnMousewheel="false" increment="0" showButton="false"  style="width:120px;" inputStyle="text-align:right;" allowInput="true" onvaluechanged="contmoneyValueChanged"/>(元)</td>
				</tr>
				<tr>
					<td align="right" style="width:120px">有效开始日期：</td>
					<td><input name="purContract.startdate" id="startdate" class="nui-datepicker"  style="width:100px"/></td>
					<td align="right" style="width:120px">有效截止日期：</td>
					<td><input name="purContract.enddate" id="enddate" class="nui-datepicker" style="width:100px"/></td>
					<td align="right" style="width:120px">我方经办人：</td>
					<td><input name="purContract.ouroper" id="ouroper" class="nui-textbox" style="width:120px" /></td>
				</tr>
				<tr>
					<td align="right" style="width:120px">合同联系人：</td>
					<td><input name="purContract.liankman" id="liankman" class="nui-textbox"  style="width:100px"/></td>
					<td align="right" style="width:120px">联系电话：</td>
					<td><input name="purContract.linktel" id="linktel" class="nui-textbox"  style="width:150px"/></td>
					<td align="right" style="width:120px">电子邮件：</td>
					<td><input name="purContract.linkemail" id="linkemail" class="nui-textbox"  style="width:180px"/></td>
				</tr>
				<tr>
					<td align="right" style="width:120px">销售合同编号：</td>
					<td><input name="purContract.outcontnum" id="outcontnum" onbuttonclick="selectCont" class="nui-buttonedit"style="width:120px" allowInput="false"/></td>
					<td align="right" style="width:120px">成本类型：</td>
					<td><input name="purContract.costtype" id="costtype" class="nui-dictcombobox" dictTypeId="AME_CONTCOSTTYPE" style="width:100px" showNullItem="true" nullItemText=""/></td>
					<td align="right" style="width:120px">合同状态：</td>
					<td><input name="purContract.purstatus" id="purstatus" class="nui-dictcombobox" dictTypeId="AME_ORDERSTATUS" required="true" style="width:120px" allowInput="false" showNullItem="true" nullItemText=""/></td>
				</tr>
				<tr>
					<td align="right" style="width:120px">合同关键内容信息：</td>
					<td colspan="7"><input name="purContract.contKeyinfo" id="contKeyinfo" class="nui-textarea"  style="width:100%"/></td>
				</tr>
				<tr>
					<td align="right" style="width:120px">其他说明：</td>
					<td colspan="7"><input name="purContract.comment" id="comment" class="nui-textarea" style="width:100%"/></td>
				</tr>
			</table>
		</div>
		</form>
	<jsp:include page="/ame_common/inputFile.jsp"/>
	</fieldset>
	<br/>
	<fieldset style="border:solid 1px #aaa;padding:3px;">
	    <legend>采购合同对应项目列表</legend>
	    <div style="width:100%;">
	        <div class="nui-toolbar" style="border-bottom:0;padding:0px;">
	            <table style="width:100%;">
	            	<tr>
	                    <td style="width:20%;">
	                        <a class="nui-button" id="addBtn" iconCls="icon-add" onclick="add()">增加</a>
	                        <a class="nui-button" id="deltbtn" iconCls="icon-remove"  onclick="removePurProjCont()">删除</a>
	                    </td>
	                </tr>
                 </table>
	        </div>
	    </div>
		<div id="grid_purProjCont" class="nui-datagrid" style="width:100%;height:auto;" allowResize="true" dataField="purProjConts" oncellendedit="calMoney"
		 url="com.primeton.eos.ame_pur.PurContract.queryPurProjContByPurcontid.biz.ext" allowCellSelect="true"  allowCellEdit="true" showPager="false" multiSelect="true" showSummaryRow="true" ondrawsummarycell="drawPurProjContSum">
			<div property="columns">
				<div type="indexcolumn" headerAlign="center" width="35" >编号</div>
				<div field="projectno" displayField="projectName" width="150" headerAlign="center">
					项目
	                <input property="editor" class="nui-buttonedit" onbuttonclick="selectProject" style="width:100%;"allowInput="false"/>
	            </div>
	            
				<div field="projectno" width="100" align="center" headerAlign="center" >项目编号</div>
				<div field="contnum" width="80" align="center" headerAlign="center" >销售合同编号</div>
				<div field="custjc" width="70" align="center" headerAlign="center" >所属客户</div>
				<div field="orgname" width="75" align="center" headerAlign="center">受益销售</div>	
				<div field="purmoney"  width="120" headerAlign="center" align="right" summaryType="sum" numberFormat="n2">
					采购金额
					<input property="editor" class="nui-spinner" format="n2" allowLimitValue="false" changeOnMousewheel="false" increment="0" showButton="false"  style="width:100%;" inputStyle="text-align:right;" allowInput="true" />
	            </div>
				<div field="wzfje" width="120" align="right" headerAlign="center" summaryType="sum" numberFormat="n2">未支付金额</div>
				<div field="status"  width="100" headerAlign="center" align="center" renderer="dictPurProjContStatus">
					状态
					<input property="editor" class="nui-dictcombobox" style="width:100%;" dictTypeId="AME_PROJCONTSTATUS"  />
	            </div>
				<div field="comment"  width="100" headerAlign="center" align="center">
					备注说明
					<input property="editor" class="nui-textbox" style="width:100%;"/>
	            </div>
			</div>
		</div>
	</fieldset>
	
	<fieldset style="border:solid 1px #aaa;padding:3px;">
	    <legend>采购付款计划列表</legend>
	    <div style="width:100%;">
	        <div class="nui-toolbar" style="border-bottom:0;padding:0px;">
	            <table style="width:100%;">
	            	<tr>
	                    <td style="width:20%;">
	                        <a class="nui-button" id="paymentPlanAddBtn" iconCls="icon-add" onclick="addPaymentPlan()">增加</a>
	                        <a class="nui-button" id="paymentPlanDelbtn" iconCls="icon-remove"  onclick="removePaymentPlan()">删除</a>
	                    </td>
	                </tr>
                 </table>
	        </div>
	    </div>
		<div id="paymentPlanGrid" class="nui-datagrid" style="width:100%;height:auto;" allowResize="true" dataField="plans" ondrawsummarycell="drawPaymentPlanSum" ondrawcell="paymentPlanGridDrawCell"
			 url="com.primeton.eos.ame_pur.purPaymentPlan.paymentPlanQueryByContract.biz.ext" allowCellSelect="true"  allowCellEdit="true" showPager="false" multiSelect="true" showSummaryRow="true" >
			<div property="columns">
				<div type="indexcolumn" headerAlign="center" width="35" >编号</div>
				<div field="payCount" width="80" align="center" headerAlign="center" >付款次数
					<input property="editor"  class="nui-textbox" style="width:100%" vtype="maxLength:200"/>
				</div>
				<div field="expectedAmount" width="100" align="center"  headerAlign="center" summaryType="sum" currencyUnit="￥" dataType="currency" numberFormat="n2" >付款金额
					<input property="editor" class="nui-spinner" format="n2" allowLimitValue="false" changeOnMousewheel="false" increment="0" showButton="false" onvaluechanged="formatAmount" style="width:100%;" inputStyle="text-align:right;" allowInput="true" allowNull="true"/>
				</div>
				<div field="percentage" name="percentage" width="80" align="center"  headerAlign="center"   summaryType="sum">付款比例
				</div>	
				<div field="expectedDate" width="100" align="center"  headerAlign="center" dataType="date" renderer="onDealDate" dateFormat="yyyy-MM">预计付款年月
					<input property="editor" class="nui-monthpicker"  style="width:250px" allowInput="false" format="yyyy-MM"/>
				</div>
	            <div field="evidence" width="140" align="center" headerAlign="center" >付款依据
	            	<input property="editor" class="nui-textbox" style="width:100%;" vtype="maxLength:2000"  />
	            </div>
				<div field="nodeRemark" width="280" align="center"  headerAlign="center" >付款节点备注
					<input property="editor" class="nui-textarea" style="width:100%;" vtype="maxLength:4000"/>
				</div>
			</div>
		</div>
	</fieldset>
</div>
	<div style="text-align:center;padding:10px;" class="nui-toolbar">
		<a class="nui-button" onclick="onOk()" id="savePurContract" style="width:60px;margin-right:20px;">保存</a>
		<a class="nui-button" onclick="onCancel('cancel')" style="width:60px;">关闭</a>
	</div>
<script type="text/javascript">
        nui.parse();
	  	var form = new nui.Form("form1");
	  	var grid_purProjCont = nui.get("grid_purProjCont");
	  	
        var updateURL = "com.primeton.eos.ame_pur.PurContract.updatePurContract.biz.ext";
		var addURL = "com.primeton.eos.ame_pur.PurContract.addPurContract.biz.ext";
    	var saveURL = "";        
        var purcontnumValid = "";
	    function SetData(data){
	    	data = nui.clone(data);
	    	if(data.action == "edit"){//编辑
	    		var json = nui.encode({purContract:data}); 
	        	nui.ajax({
	        		url: "com.primeton.eos.ame_pur.PurContract.getPurContractDetail.biz.ext",
	                data: json,
	                type: 'POST',
	                cache: false,
	                contentType: 'text/json',
	                success: function (o) {
	                    //加载附件设置参数
	                	nui.get("grid_0").load({"groupid":"purContract","relationid":o.purContract.purcontid});
	                    form.setData(o);
	                    form.isChanged(false);	
	                    nui.get("custname").setText(o.purContract.purSupplier.custname);
	                    nui.get("outcontnum").setText(o.purContract.outcontnum);
	                    purcontnumValid = o.purContract.purcontnum;
	                    
	                    //项目合同关系列表查询
	                    grid_purProjCont.load({purcontid:o.purContract.purcontid});
	                    //采购付款计划查询
	                    nui.get("paymentPlanGrid").load({purcontid:o.purContract.purcontid});
	                },
	                error: function (jqXHR, textStatus, errorThrown) {
	                    alert(jqXHR.responseText);
	                    CloseWindow();
	                }
	        	});
    		}else if(data.action == "new"){//新增
                nui.get("filedetail").hide();
                nui.get("grid_0").hide();
    		}else{
    			
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
                        	var row = grid_purProjCont.getSelected();
                        	//查询这个项目已支付金额
                        	nui.ajax({
				                url: "com.primeton.eos.ame_pur.PurContract.queryProjYzfjeByprojectno.biz.ext",
				                data: {projectno:data.projectno},
				                type: 'POST',
				                cache: false,
				                contentType: 'text/json',
				                success: function (text) {
		                            var rowData = { "projectid":data.projectid,
		                            				"projectno":data.projectno,
		                            				"projectName":data.projectName,
		                            				"custjc":data.custjc,
		                            				"orgname":data.orgname,
		                            				"yzfje":text.yzfje,
		                            				"contnum":data.contnum};//根据项目取出来的合同编号
								   	grid_purProjCont.updateRow(row,rowData);
				                },
				                error: function (jqXHR, textStatus, errorThrown) {
				                    alert(jqXHR.responseText);
				                }
				            });
                        }
                    }
                }
            });
        }
        
        function add() {
            var data = grid_purProjCont.getData();
            grid_purProjCont.addRow({name: "New Row"},data.length+1);
        }
        function removePurProjCont() {
		    var rows = grid_purProjCont.getSelecteds();
		    if(rows.length<1){
		    	alert("请至少选中一条记录！");
		    	return;
		    }
		    
        	grid_purProjCont.removeRows(rows, true);
        }
        //添加采购付款计划
        function addPaymentPlan() {
       		var paymentPlanGrid = nui.get("paymentPlanGrid");
            var data = paymentPlanGrid.getData();
            paymentPlanGrid.addRow({name: "New Row"},data.length+1);
        }
        //删除采购付款计划
        function removePaymentPlan() {
        	var paymentPlanGrid = nui.get("paymentPlanGrid");
		    var rows = paymentPlanGrid.getSelecteds();
		    if(rows.length<1){
		    	alert("请至少选中一条记录！");
		    	return;
		    }
        	paymentPlanGrid.removeRows(rows, true);
        }
        
        function calMoney(e){
	  		if(e.field=="purmoney"){
	  			var row = e.record;
	  			/* if(row.purmoney-row.yzfje<0){
	  				alert("采购金额不能小于已支付金额！");
	  			} */
	  			var rowData = {"wzfje":row.purmoney-row.yzfje};//状态修改？
			   	grid_purProjCont.updateRow(row,rowData);
	  		} 
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
	        var flag = true;
	        function validePurContnum(){
	        	//合同编号唯一性验证
	        	if(nui.get("purcontnum").getValue() == purcontnumValid){//编辑的情况
	        		flag = true;
	        		return;
	        	}
	            var purcontnum = nui.get("purcontnum").getValue();
	            var json = {purcontnum: purcontnum};
	            nui.ajax({
	                url: "com.primeton.eos.ame_pur.PurContract.validteContnum.biz.ext",
	                data: json,
	                type: 'POST',
	                cache: false,
	                contentType: 'text/json',
	                success: function (text) {
	                   	if(text.cont == 1){
	                   		alert("合同编号已被" + text.purContract.purSupplier.suppliersname + "的合同名称为'" + text.purContract.purcontname + "'使用！");
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
	        
	        //保存
	        function onOk() {
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
	        	var data_purProjContAll = grid_purProjCont.getData();
	        	//合同执行总金额
        		//针对框架合同不需要校验金额
	        	/* var purmoneyTotal = 0;
	        	for(var i = 0;i < data_purProjContAll.length;i ++){
	        		data_purProjContAll[i].purmoney = parseFloat(data_purProjContAll[i].purmoney);
    	    		purmoneyTotal += data_purProjContAll[i].purmoney;
        		}
        		if(!nui.get("contmoney").getValue()){
        			alert("采购合同总金额不能为空！");
        			return;
        		}
        		var contmoney = parseFloat(nui.get("contmoney").getValue());
        		if(purmoneyTotal != contmoney){
        			alert("采购合同总金额不等于各个项目金额之和！");
        			return;
        		} */
        		//付款计划的预计付款金额汇总要等于合同金额
		    	if(nui.get("paymentPlanGrid").getData().length > 0) {
					var contmoney = nui.get("contmoney").getValue();
					if(contmoney === "" || paymentPlanSum != contmoney){
						alert("采购付款计划的付款金额汇总要等于合同金额！");
						return;
					}
		    	}
	        	if(flag){
	            	if(confirm("确定提交？")){
						nui.get("savePurContract").disable();
						document.getElementById("fileCatalog").value="ame_pur";
						form2.submit();
					}
	            }else{
	            	alert("合同编号不可重复，请修改合同编号！");
	            }
	        }
	        
	        
    	//form2.submmit()回调SaveData()方法
        function SaveData() {
            if(form.validate()){
            	nui.get("savePurContract").disable();
	        	var purcontid = nui.get("purcontid").getValue();
	        	var saveURL = "";
	        	var data_purContract = form.getData();
	        	var data_purProjCont = grid_purProjCont.getChanges();
	        	var data_paymentPlan = nui.get("paymentPlanGrid").getChanges();
		        var json = nui.encode({purContract:data_purContract.purContract,purProjConts:data_purProjCont, paymentPlans:data_paymentPlan});
				if(purcontid){
					saveURL = updateURL;
					nui.ajax({
		                url: saveURL,
		                data: json,
		                type: 'POST',
		                cache: false,
		                contentType: 'text/json',
		                success: function (text) {
		                   var returnJson = nui.decode(text);
			              	if(returnJson.exception == null){
			                	alert("保存成功！");
			                	CloseWindow();
			              	}else{
	                    		alert("保存失败！");
	                    		nui.get("savePurContract").enable();
			              	}        
		                },
		                error: function (jqXHR, textStatus, errorThrown) {
		                    alert(jqXHR.responseText);
		                }
		            });
				} else{
					saveURL = addURL;
		            nui.ajax({
		                url: saveURL,
		                data: json,
		                type: 'POST',
		                cache: false,
		                contentType: 'text/json',
		                success: function (text) {
		                   	var returnJson = nui.decode(text);
		                   	form.setData(returnJson);
			              	if(returnJson.exception == null){
				                alert("新增成功！");
				                CloseWindow();
			              	}else{
		                		nui.alert("保存失败", "系统提示", function(action){
			                  	if(action == "ok" || action == "close"){
			                    	alert("新增失败！");
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
        }else{
        	alert("请补全信息！");
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
            if (window.CloseOwnerWindow) return window.CloseOwnerWindow(action);
            else window.close();            
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
		function drawPurProjContSum(e){
			if (e.field == "purmoney"||e.field == "wzfje") {
	            e.cellHtml = "<div align='right'><b>" + nui.formatNumber(e.cellHtml,'n') + "</b></div>";
	        }
		}
		function dictPurProjContStatus(e){
	    	return nui.getDictText('AME_PROJCONTSTATUS',e.value);
	    }
	 
	    function onDealDate(e){
			if(e.field == "expectedDate"){
				var date = e.value;
				if(date){
					return e.cellHtml.substring(0,7);
				}
				return "";
			}
		}
		
		var paymentPlanSum = 0;
		function drawPaymentPlanSum(e){
			if (e.field == "expectedAmount") {
				var html = nui.formatNumber(e.value,"n");
	            e.cellHtml = "<div align='right'><b>" + html + "</b></div>";
	            paymentPlanSum = (Math.round(e.value*100)/100);  
	            return;
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
		function formatAmount(e) {
	    	var paymentPlanGrid = nui.get("paymentPlanGrid");
	    	if(this.value != null && !isNaN(this.value)) {
	    		this.value = (Math.round(this.value*100)/100);
	    		
	    		var contmoney = nui.get("contmoney").getValue();
	        	if(contmoney && contmoney > 0) {
	        		var p = (Math.round(e.value * 10000 / contmoney ) / 100.00);
	        		paymentPlanGrid.getSelected().percentage = p;
	        	}
	    	} else {
	    		paymentPlanGrid.getSelected().percentage = "";
	    	}
	    }
	    function paymentPlanGridDrawCell(e) {
	    	if(e.field == "percentage"  && !isNaN(e.value)) {
	    		e.cellHtml = e.value + "%";
	    	}
	    }
	    function contmoneyValueChanged(e) {
	    	if(!e.value || e.value <= 0) {
	    		return;
	    	}
	    	var paymentPlanGrid = nui.get("paymentPlanGrid")
	    	var paymentPlanGridData = paymentPlanGrid.getData();
	    	if(paymentPlanGridData.length > 0) {
	    		for(var i = 0, l = paymentPlanGridData.length; i < l; i++) {
	    			var expectedAmount = paymentPlanGridData[i]["expectedAmount"];
	    			var p = (Math.round(expectedAmount * 10000 / e.value ) / 100.00);
	    			paymentPlanGrid.updateRow(paymentPlanGrid.getRow(i),{"percentage" : p});
	    		}
	    	}
	    }
    </script>
</body>
</html>

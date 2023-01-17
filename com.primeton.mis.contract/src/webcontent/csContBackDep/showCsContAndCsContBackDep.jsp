<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@page import="com.eos.data.datacontext.UserObject"%>
<html>
<!-- 
  - Author(s): zhuyl
  - Date: 2016-10-29 15:40:49
  - Description:
-->
<head>
<title>新增/编辑合同收款记录</title>
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
	<legend>合同基本信息</legend>
	<form id="form1" method="post">
	<input name="csContract.contractid" id="contractid" class="nui-hidden"/>
	<input name="csContract.contnum" id="contnum"  class="nui-hidden"/>
	<input name="fileids" id="fileids" class="nui-hidden"/>
		<div style="padding:5px;">
			<table style="table-layout:fixed;" id="table_file">
				<tr>
                    <td style="width:100px;" align="right">合同存档编号：</td>
                    <td style="width:250px;" id="csContract.contnum"></td>
                    <td style="width:100px;" align="right">合同名称：</td>
                    <td style="width:250px;" id="csContract.projectname"></td>
	                <td style="width:100px;" align="right">合同签署日期：</td>
	                <td style="width:100px;" id="csContract.signdate"></td>
                </tr>
                <tr>
                    <td style="width:100px;" align="right">签署单位：</td>
                    <td style="width:250px;" id="csContract.misCustinfo.custname"></td>
                    <td style="width:100px;" align="right">最终用户：</td>
                    <td style="width:250px;" id="csContract.username"></td>
                    <td style="width:100px;" align="right">受益销售：</td>
                    <td style="width:100px;" id="csContract.salename"></td>
                </tr>
                <tr>
                    <td style="width:100px;" align="right">产品金额：</td>
                    <td style="width:150px;"id="csContract.prodmon"></td>
                    <td style="width:100px;" align="right">服务金额：</td>
                    <td style="width:250px;"id="csContract.servmon"></td>
                    <td style="width:100px;" align="right">维保金额：</td>
                    <td style="width:150px;"id="csContract.masum"></td>
                </tr>
                <tr>
                    <td style="width:100px;" align="right">合同总金额：</td>
                    <td style="width:250px;"id="csContract.contsum"></td>
                    <td></td><td></td><td></td><td></td>
                </tr>
			</table>
		</div>
		</form>
	</fieldset>
	 <fieldset style="border:solid 1px #aaa;padding:3px;">
        <legend>合同保函保证金列表</legend>
        <div class="nui-toolbar">
            <a class="mini-button" iconCls="icon-add" id="addCsContBackDep1" onclick="add()" >增加</a>
            <a class="mini-button" iconCls="icon-edit" id="editCsContBackDep1" onclick="edit()">编辑</a>  
            <a class="mini-button" iconCls="icon-remove" id="removeCsContBackDep" onclick="removeCsContBackDep()">删除</a>
        </div>          
    	<div id="grid_csContBackDep" class="nui-datagrid" style="width:100%;height:auto;" allowResize="true" dataField="csContBackDeps" 
    		showSummaryRow="true" ondrawsummarycell="drawCsBackdepSum"
	 		url="com.primeton.mis.contract.csContBackDep.querycsContBackByContractid.biz.ext" 
	 		allowCellSelect="true"  showPager="false" multiSelect="true">
			<div property="columns">
				<div type="checkcolumn" width="25"></div>
				<div field="contractid" width="0">合同id</div>
				<div field="type" width="60" headerAlign="center" align="center"  renderer="onCsContType">类型</div>
                <div field="backdepmon" width="80" dataType="currency" headerAlign="center" align="right" summaryType="sum">金额</div>
		        <div field="expno" width="100" headerAlign="center" align="center" renderer="getDetail">付款申请单号</div>
                <div field="perioddesc" width="180" headerAlign="center" align="left">期间描述</div>
                <div field="isdeal" width="80" renderer="onGenderSaleseva" headerAlign="center" align="left">是否已办理</div>
                <div field="status" width="80" renderer="onCsBackDepStatus" headerAlign="center" align="left">状态</div>
                <div field="returnmon" width="80" dataType="currency" headerAlign="center" align="right" summaryType="sum">退还金额</div>
                <div field="paydate" width="80" headerAlign="center"  renderer="onDealDate" dateFormat="yyyy-MM-dd" align="left">保函开具/保证金打款日期</div>
                <div field="predredate" width="80" headerAlign="center" renderer="onDealDate" dateFormat="yyyy-MM-dd" align="left">保函到期/保证金预计退还日期</div>
                <div field="practredate" width="80" headerAlign="center" renderer="onDealDate" dateFormat="yyyy-MM-dd" align="left">保证金实际退还日期</div>
                <div field="remark" width="100" headerAlign="center" align="left">备注</div>
			</div>
		</div>
    </fieldset>
    <fieldset id="field_add" style="border:solid 1px #aaa;padding:3px;">
    	<legend>新增合同保函保证金记录</legend>
    	<form id="form_add" method="post">
	    	<input name="csContBackDep.contractid" id="contractid1" class="nui-hidden"/>
			<table style="table-layout:fixed;" id="table_file">
				<tr>
			    	<td align="right" style="width:120px">保函保证金类型：</td>
					<td><input name="csContBackDep.type" id="type" class="nui-dictcombobox" dictTypeId="CS_BACKDEP_TYPE"  style="width:100px" required="true" /></td>
					<td align="right" style="width:120px">金额：</td>
					<td><input name="csContBackDep.backdepmon" id="backdepmon" class="nui-spinner" format="n2"  allowLimitValue="false" changeOnMousewheel="false"  showbutton="false" style="width:120px" /></td>
					<td align="right" style="width:160px">保函保证金打款日期：</td>
					<td><input name="csContBackDep.paydate" id="paydate"  class="nui-datepicker" format="yyyy-MM-dd" style="width:120px" /></td>
    			</tr>
    			<tr>
			    	<td align="right" style="width:120px">是否已办理：</td>
					<td><input name="csContBackDep.isdeal" id="isdeal" class="nui-dictcombobox" dictTypeId="MIS_YN"  style="width:100px" /></td>
					<td align="right" style="width:120px">退还金额：</td>
					<td><input name="csContBackDep.returnmon" id=returnmon class="nui-spinner" format="n2"  allowLimitValue="false" changeOnMousewheel="false"  showbutton="false" style="width:120px" /></td>
					<td align="right" style="width:160px">保函保证金退还日期：</td>
					<td><input name="csContBackDep.predredate" id="predredate"  class="nui-datepicker" format="yyyy-MM-dd" style="width:120px" /></td>
    			</tr>
    			<tr>
    				
			    	<td align="right" style="width:120px">状态：</td>
					<td><input name="csContBackDep.status" id="status" class="nui-dictcombobox" dictTypeId="CS_BACK_DEP"  style="width:100px" /></td>
					<td align="right" style="width:120px" id="aaa">付款申请单号：</td>
    				<td id="bbb"><input name="csContBackDep.expno" id="expno" class="nui-textbox" style="width:120px" /></td>
					<td align="right" style="width:160px">保证金实际退还日期：</td>
					<td><input name="csContBackDep.practredate" id="practredate"  class="nui-datepicker" format="yyyy-MM-dd" style="width:120px" /></td>
    				
    			</tr>
    			<tr>
    				<td align="right" style="width:120px">期间描述：</td>
    				<td colspan="5"><input name="csContBackDep.perioddesc" id="perioddesc" class="nui-textbox" style="width:500px" /></td>
    			</tr>
				<tr>
					<td align="right" style="width:120px">备注：</td>
					<td colspan="5"><input name="csContBackDep.remark" id="remark" class="nui-textarea" style="width:100%"/></td>
				</tr>
    		</table>
	    </form>
    </fieldset>
    <fieldset id="field_edit" style="border:solid 1px #aaa;padding:3px;">
    	<legend>编辑合同保函保证金记录</legend>
    	<form id="form_edit" method="post">
    		<input name="csContBackDep.contbackdepid" id="contbackdepid" class="nui-hidden"/>
    		<input name="csContBackDep.contractid" id="contractid2" class="nui-hidden"/>
			<table style="table-layout:fixed;">
				<tr>
			    	<td align="right" style="width:120px">保函保证金类型：</td>
					<td><input name="csContBackDep.type" id="type_edit" class="nui-dictcombobox" dictTypeId="CS_BACKDEP_TYPE"  style="width:100px" required="true" /></td>
					<td align="right" style="width:120px">金额：</td>
					<td><input name="csContBackDep.backdepmon" id="backdepmon_edit" class="nui-spinner" format="n2"  allowLimitValue="false" changeOnMousewheel="false"  showbutton="false" style="width:120px" /></td>
					<td align="right" style="width:160px">保函保证金打款日期：</td>
					<td><input name="csContBackDep.paydate" id="paydate_edit"  class="nui-datepicker" format="yyyy-MM-dd" style="width:120px" /></td>
    			</tr>
    			<tr>
			    	<td align="right" style="width:120px">是否已办理：</td>
					<td><input name="csContBackDep.isdeal" id="isdeal_edit" class="nui-dictcombobox" dictTypeId="MIS_YN"  style="width:100px" /></td>
					<td align="right" style="width:120px">退还金额：</td>
					<td><input name="csContBackDep.returnmon" id="returnmon_edit" class="nui-spinner" format="n2"  allowLimitValue="false" changeOnMousewheel="false"  showbutton="false" style="width:120px" /></td>
					<td align="right" style="width:160px">保函保证金退还日期：</td>
					<td><input name="csContBackDep.predredate" id="predredate_edit"  class="nui-datepicker" format="yyyy-MM-dd" style="width:120px" /></td>
    			</tr>
    			<tr>
    				
			    	<td align="right" style="width:120px">状态：</td>
					<td><input name="csContBackDep.status" id="status_edit" class="nui-dictcombobox" dictTypeId="CS_BACK_DEP"  style="width:100px" /></td>
					<td align="right" style="width:120px" id="aaa">付款申请单号：</td>
    				<td id="bbb"><input name="csContBackDep.expno" id="expno" class="nui-textbox" style="width:120px" /></td>
					<td align="right" style="width:160px">保证金实际退还日期：</td>
					<td><input name="csContBackDep.practredate" id="practredate_edit"  class="nui-datepicker" format="yyyy-MM-dd" style="width:120px" /></td>
    			</tr>
    			<tr>
    				<td align="right" style="width:120px">期间描述：</td>
    				<td colspan="5"><input name="csContBackDep.perioddesc" id="perioddesc_edit" class="nui-textbox" style="width:500px" /></td>
    			</tr>
				<tr>
					<td align="right" style="width:120px">备注：</td>
					<td colspan="5"><input name="csContBackDep.remark" id="remark_edit" class="nui-textarea" style="width:100%"/></td>
				</tr>
    		</table>
    	</form>
    </fieldset>
</div>
	<div style="text-align:center;padding:10px;" class="nui-toolbar">
		<a class="nui-button" onclick="onOkAdd" id="addCsContBackDep" style="width:90px;margin-right:20px;">确定增加</a>
		<a class="nui-button" onclick="onOkEdit" id="editCsContBackDep" style="width:90px;margin-right:20px;">确定编辑</a>
		<a class="nui-button" onclick="onCancel('cancel')" style="width:60px;">关闭</a>
	</div>
<script type="text/javascript">
        nui.parse();
	  	var form = new nui.Form("form1");
	  	var form_add = new nui.Form("form_add");
	  	var form_edit = new nui.Form("form_edit");
	  	var grid_csContBackDep = nui.get("grid_csContBackDep");
  		document.getElementById("field_edit").style.display="none";
  		document.getElementById("field_add").style.display="none";
  		document.getElementById("addCsContBackDep").style.display="none";
  		document.getElementById("editCsContBackDep").style.display="none";
  		var contsum = 0; 
  		var servmon = 0; 
  		var prodmon = 0;
	  	//进页面调用方法
      	function SetData(data){
      		data = nui.clone(data);
      		var json = {csContract:{contractid: data.contractid}};
      		nui.ajax({
	            url: "com.primeton.eos.ame_income.csReveForecast.queryContByContractid.biz.ext",
	            data: json,
	            type: 'POST',
	            cache: false,
	            contentType: 'text/json',
	            success: function (o) {
	            	nui.get("contractid").setValue(o.csContract.contractid);
	            	nui.get("contnum").setValue(o.csContract.contnum);
	                document.getElementById("csContract.projectname").innerHTML = o.csContract.projectname == null ? "":o.csContract.projectname;
	                //合同编号加链接
	                var tempSrc = "<a href='javascript:void(0)' onclick='doView();' title='点击查看'>" + o.csContract.contnum + "</a>";
	                document.getElementById("csContract.contnum").innerHTML = tempSrc;
	                document.getElementById("csContract.signdate").innerHTML = o.csContract.signdate == null ?"":o.csContract.signdate;
	                document.getElementById("csContract.misCustinfo.custname").innerHTML = o.csContract.misCustinfo == null ? "" : o.csContract.misCustinfo.custname;
	                document.getElementById("csContract.username").innerHTML = o.csContract.username == null ? "" : o.csContract.username;
	                document.getElementById("csContract.contsum").innerHTML = o.csContract.contsum== null ? "" : toThousands(o.csContract.contsum);
	                contsum = o.csContract.contsum;
	                document.getElementById("csContract.salename").innerHTML = o.csContract.salename== null ? "" :o.csContract.salename;
	                document.getElementById("csContract.servmon").innerHTML = o.csContract.servmon== null ? "" : toThousands(o.csContract.servmon);
	                servmon = o.csContract.servmon; 
	                document.getElementById("csContract.prodmon").innerHTML = o.csContract.prodmon== null ? "" : toThousands(o.csContract.prodmon);
	                prodmon = o.csContract.prodmon;
	                document.getElementById("csContract.masum").innerHTML = o.csContract.masum== null ? "" : toThousands(o.csContract.masum);
	                grid_csContBackDep.sortBy("paydate","desc");
	                grid_csContBackDep.load({contractid: o.csContract.contractid});
	            },
	            error: function (jqXHR, textStatus, errorThrown) {
	                alert(jqXHR.responseText);
	            }
	        });
      	
      	}
		function onCancel(e) {
			if (window.CloseOwnerWindow) return window.CloseOwnerWindow();
	        else window.close();  
	    }
      	
      	//是否已办理
	    function onGenderSaleseva(e){
	    	return nui.getDictText('MIS_YN',e.value);
	    } 
	    //合同保函保证金状态
	    function onCsBackDepStatus(e){
	    	return nui.getDictText('CS_BACK_DEP',e.value);
	    }
		function onCsContType(e){
			return nui.getDictText("CS_BACKDEP_TYPE",e.value);
		}
		function drawCsBackdepSum(e){
			if (e.field == "backdepmon" || e.field == "returnmon") {
	            e.cellHtml = "<div align='right'><b>" + e.cellHtml + "</b></div>";
	        }
		}		
		
	    
	    function removeCsContBackDep() {
		    var rows = grid_csContBackDep.getSelecteds();   //获取所有选中的行对象
		    var data = {csContBackDeps: rows};
		    var json = nui.encode(data);     //序列化成json字符串
			if (rows.length> 0) {
				nui.confirm("确定删除选中记录？","删除提示",function(action){
					if(action == "ok"){
		                nui.ajax({
			                url: "com.primeton.mis.contract.csContBackDep.deletecsContBackDeps.biz.ext",
			                type: "post",
			                data: json, 
			                cache: false,
			                contentType: 'text/json',
			                success: function (text) {
			                	if(text.exception == null){
				                	nui.alert("删除成功！");
				                	grid_csContBackDep.reload();
				                	form_edit.reset();
						            document.getElementById("field_edit").style.display="none";
				            		document.getElementById("editCsContBackDep").style.display="none";
			                	}else{
			                		nui.alert("删除失败！");
			                	}
			                },
			                error: function () {
		                    }
						});
					}
				});
            } else {
                alert("请至少选中一条记录");
            }
        }
        //合同编号加链接
        function doView(){
			var contractid =nui.get("contractid").getValue();
			var executeUrl = "<%=request.getContextPath() %>/contract/contract/contractView.jsp?contractid=" + contractid;
			window.open(executeUrl, "合同查看", "fullscreen=1");
		}
	    //点击新增
        function add() { 
        	//编辑相关控件隐藏
          	document.getElementById("field_edit").style.display="none";
          	document.getElementById("editCsContBackDep").style.display="none";
          	//新增相关控件显示
          	document.getElementById("field_add").style.display="";
          	document.getElementById("addCsContBackDep").style.display="";
          	var contractid =nui.get("contractid").getValue();
          	//合同id
          	nui.get("contractid1").setValue(contractid);
          	//保函保证金状态
          	nui.get("status").setValue(0);
	    }
	    
	    //确定新增调用方法
		function onOkAdd() {
			if(!form_add.validate()){
				nui.alert("表单信息填写不完整，请确认必输项是否填写！！");
				return;
			}
			nui.confirm("确定新增保存？","保存提示",
				function(action){
					if(action == "ok"){
						nui.get("addCsContBackDep").setEnabled(false);
						var data_add = form_add.getData();
				        //合同编号
				        var contnum = nui.get("contnum").getValue();
				        data_add.csContBackDep.contnum = contnum;
				        //合同名称
				        var projectname = document.getElementById("csContract.projectname").innerHTML;
				        data_add.csContBackDep.projectname = projectname;
				        var json = {csContBackDep: data_add.csContBackDep};
						nui.ajax({
				            url: "com.primeton.mis.contract.csContBackDep.addCsContBackDep.biz.ext",
				            data: json,
				            type: 'POST',
				            cache: false,
				            contentType: 'text/json',
				            success: function (text) {
				            	if(text.exception == null){
					            	nui.alert("保存成功！");
					            	var contractid = nui.get("contractid").getValue();
						            var csContBackata = {contractid: contractid};
						            grid_csContBackDep.load(csContBackata);
						            form_add.reset();
						            document.getElementById("field_add").style.display="none";
				            		document.getElementById("addCsContBackDep").style.display="none";
				            	}else{
				            		nui.alert("保存失败！");
				            	}
				            	nui.get("addCsContBackDep").setEnabled(true);
				            },
				            error: function (jqXHR, textStatus, errorThrown) {
				                alert(jqXHR.responseText);
				            }
				        });
					}
				}	
			);
		}
		
		function edit(){
			var rows = grid_csContBackDep.getSelecteds();
	        if(rows.length==0){
				nui.alert("请选中一条记录！");
				return;
			}
	        if(rows.length>1){
				nui.alert("只能选中一条记录！");
				return;
			}
			var row = grid_csContBackDep.getSelected();
			document.getElementById("field_add").style.display="none";
          	document.getElementById("addCsContBackDep").style.display="none";
			document.getElementById("field_edit").style.display="";
			document.getElementById("editCsContBackDep").style.display="";
			//加载预估信息
    		var json = nui.encode({csContBackDep:{contbackdepid:row.contbackdepid}});
    		nui.ajax({
        		url: "com.primeton.mis.contract.csContBackDep.getCsContBackDepDetail.biz.ext",
                data: json,
                type: 'POST',
                cache: false,
                contentType: 'text/json',
                success: function (o) {
                    form_edit.setData(o);
                },
                error: function (jqXHR, textStatus, errorThrown) {
                    alert(jqXHR.responseText);
                }
        	}); 
		}
		//确定编辑调用方法
	    function onOkEdit(){
	    	if(!form_edit.validate()){
				nui.alert("表单信息填写不完整，请确认必输项是否填写！！");
				return;
			}
			nui.confirm("确定编辑保存？","保存提示",
				function(action){
					if(action == "ok"){
						nui.get("editCsContBackDep").setEnabled(false);
						var data_edit = form_edit.getData();
				        //合同编号
				        var contnum = nui.get("contnum").getValue();
				        data_edit.csContBackDep.contnum = contnum;
				        //合同名称
				        var projectname = document.getElementById("csContract.projectname").innerHTML;
				        data_edit.csContBackDep.projectname = projectname;
				        var json = {csContBackDep: data_edit.csContBackDep};
						nui.ajax({
				            url: "com.primeton.mis.contract.csContBackDep.editCsContBackDep.biz.ext",
				            data: json,
				            type: 'POST',
				            cache: false,
				            contentType: 'text/json',
				            success: function (text) {
				            	if(text.exception == null){
					            	nui.alert("保存成功！");
					            	var contractid = nui.get("contractid").getValue();
						            var csContBackata = {contractid: contractid};
						            grid_csContBackDep.load(csContBackata);
						            form_edit.reset();
						            document.getElementById("field_edit").style.display="none";
				            		document.getElementById("editCsContBackDep").style.display="none";
				            	}else{
				            		nui.alert("保存失败！");
				            	}
				            	nui.get("editCsContBackDep").setEnabled(true);
				            },
				            error: function (jqXHR, textStatus, errorThrown) {
				                alert(jqXHR.responseText);
				            }
				        });
					}
				}	
			);
	    }
		
		function getDetail(e){
			if(e.value){
	    		return "<a href='javascript:void(0)' onclick='checkDetailPayApply();' title='点击查看'>" + e.value + "</a>";
	    	}
	    }
	    function checkDetailPayApply(){
	 		var selectRow = grid_csContBackDep.getSelected();
			var executeUrl = "/default/ame_fee/PaymentApply/PayApplyDetail.jsp?expid=" + selectRow.expid;
			window.open(executeUrl, "付款申请明细", "fullscreen=1");
	    }
	    //金额千分位
	    function toThousands(num) {
			var num = (num || 0).toString(), result = '';
			if(num){
				if(num != 0){
					var s = num.substring(0,1);
					if(s=="-"){
						var num3 = num.split("-");
						var num4 = num3[1];
						var num2 = num4.split(".");
						num = num2[0];
						while (num.length > 3) {
							result = ',' + num.slice(-3) + result;
							num = num.slice(0, num.length - 3);
						}
						if (num) { 
							if(num2[1]){
								result = "-"+num + result + "." + num2[1]; 
							}else{
								result = "-"+num + result; 
							}
						}
					}else{
						var num2 = num.split(".");
						num = num2[0];
						while (num.length > 3) {
							result = ',' + num.slice(-3) + result;
							num = num.slice(0, num.length - 3);
						}
						if (num) { 
							if(num2[1]){
								result = num + result + "." + num2[1]; 
							}else{
								result = num + result; 
							}
						}
					}
				}else{
					result = 0;
				}
			}else{
				result = 0;
			}
			return result;
		}
		
    </script>
</body>
</html>

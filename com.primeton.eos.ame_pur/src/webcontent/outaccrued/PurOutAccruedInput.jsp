<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@page import="com.eos.data.datacontext.UserObject"%>
<%
	String contextPath=request.getContextPath();
 %>
<html>
<!-- 
  - Author(s): zyl
  - Date: 2016-05-31 18:11:50
  - Description:
-->
<head>
	<title>新增、编辑采购信息</title>
	<meta http-equiv="content-type" content="text/html; charset=UTF-8" />
	<script src="<%= request.getContextPath() %>/common/nui/nui.js"
		type="text/javascript"></script>
	<script src="../common/nui/nui.js" type="text/javascript"></script>
	<style type="text/css">
	    body{
	        margin:0;padding:0;border:0;width:100%;height:100%;overflow:hidden;
	    }
    </style>
</head>
<body>
	<div class="nui-fit">
		<form id="form1" method="post">
			<fieldset id="field1" style="border:solid 1px #aaa;padding:3px;">
				<legend>采购计提基本信息</legend>
				<div style="padding:5px;">
			 		<input name="purpresettle.fileids" id="fileids" class="nui-hidden"/>
					<input name="purpresettle.accruedid" id="accruedid"  class="nui-hidden"/>
					<input name="purpresettle.accrueddate" id="accrueddate" class="nui-hidden" format="yyyy-MM-dd"/>
					<input name="purpresettle.premonth" id="premonth" class="nui-hidden" />
					<table style="table-layout:fixed;" id="table_file">
						<tr>
							<td align="right" style="width:120px;">所属事业部：</td>
							<td><input name="purpresettle.syb" id="syb" required="true" class="nui-dictcombobox" onvaluechanged="selectsyb" dictTypeId="CONT_ORG" required="false" style="width:110px" /></td>
							<td align="right" style="width:120px;">供应商：</td>
							<td><input name="purpresettle.custid" id="custid" required="true" onbuttonclick="selectSupplier" class="nui-buttonedit" required="false" style="width:280px" emptyText="请选择供应商" allowInput="false"/></td>
						</tr>
						<tr>
							<td align="right" style="width:120px;">项目：</td>
							<td><input name="purpresettle.projectno" id="projectno" required="true" onbuttonclick="selectProject" class="nui-buttonedit" required="false" style="width:280px" allowInput="false"/></td>
							<td align="right" style="width:120px;">所属客户：</td>
							<td>
								<input id="miscustid" class="nui-combobox" textField="orgname" valueField="orgid" required="false" style="width:280px" showNullItem="false" allowInput="true"/>
							</td>	
						</tr>
						<tr>
							<td align="right" style="width:120px;">所属销售：</td>
							<td>
								<input name="purpresettle.salesid" id="salesid" class="nui-combobox" textField="orgname" valueField="orgid" required="false" style="width:100px" showNullItem="false" allowInput="true"/>
							</td>
							<td align="right" style="width:120px;">成本类型：</td>
							<td><input name="purpresettle.costtype" id="costtype" value="1" class="nui-dictcombobox" required="false" style="width:100px" dictTypeId="AME_CONTCOSTTYPE"/></td>
						</tr>
						<tr>
							<td align="right" style="width:120px;">采购合同：</td>
							<td><input name="purpresettle.purcontnum" id="purcontnum" onvaluechanged="changepurcontnum" textField="purcontname" valueField="purcontnum" showNullItem="true" class="nui-combobox" required="false" style="width:305px" /></td>
							<td align="right" style="width:120px;">财务对应合同：</td>
							<td><input name="purpresettle.contnum" id="contnum" onbuttonclick="selectcontnum" class="nui-buttonedit" required="false" style="width:150px" allowInput="false" showClose="true" oncloseclick="delecont"/></td>
						</tr>
						<tr>
							<td align="right" style="width:120px;">计提开始日期：</td>
							<td><input name="purpresettle.startdate" id="startdate" required="true" onvaluechanged="startandend('start')" class="nui-datepicker" required="false" style="width:100px"/></td>
							<td align="right" style="width:120px;">计提结束日期：</td>
							<td><input name="purpresettle.enddate" id="enddate" required="true" onvaluechanged="startandend('end')" class="nui-datepicker" required="false" style="width:100px" /></td>
						</tr>
						<tr>
							<td align="right" style="width:120px;">采购订单：</td>
							<td colspan="3"><input name="purpresettle.purorderid" id="purorderid" onvaluechanged="selectOrder" class="nui-combobox" multiSelect="true" showNullItem="false" valueField="purorderid" textField="purordernum"  style="width:650px" allowInput="false"/></td>
						</tr>
						<tr>
							<td align="right" style="width:120px;">相关外包人员：</td>
							<td colspan="3"><input name="purpresettle.outper" id="outper" class="nui-textarea" required="false" style="height:40px;width:650px"/></td>
						</tr>
						<tr>
							<td align="right" style="width:120px;">计提金额(元)：</td>
							<td><input name="purpresettle.accruedmoney" id="accruedmoney" onblur="changeMoney" inputStyle="text-align:right;" class="nui-textbox" required="true" style="width:150px" vtype="float" floatErrorText="请输入数字"/></td>
							<td align="right" style="width:120px;">计提状态：</td>
							<td><input name="purpresettle.accruedstatus" id="accruedstatus" class="nui-dictcombobox" required="false" style="width:90px" dictTypeId="AME_ACCRUEDSTATUS" value="0"/></td>
						</tr>
						<tr>
							<td align="right" style="width:120px;">计提税率：</td>
							<td><input name="purpresettle.taxrate" id="taxrate" inputStyle="text-align:right;" class="nui-textbox" required="true" style="width:50px" onblur="changetax"/> %</td>
							<td align="right" style="width:120px;">计提不含税金额(元)：</td>
							<td><input name="purpresettle.notaxmoney" id="notaxmoney" inputStyle="text-align:right;" class="nui-textbox" required="false" style="width:90px" readOnly="readOnly" /></td>
						</tr>
						<tr>
							<td align="right" style="width:120px;">工作量单位：</td>
							<td><input name="purpresettle.workunit" id="workunit" value="1"  class="nui-dictcombobox" dictTypeId="SERV_NUM_TYPE" required="true" style="width: 80px"  onvaluechanged="changeWorkamount"/></td>
							<!-- 工作量数量 -->
							<td align="right" style="width:120px;">工作量数量：</td>
							<td><input name="purpresettle.workamount" id="workamount" class="nui-spinner" showButton="false" 
								allowLimitValue="false" changeOnMousewheel="false" style="width: 100px;"
								inputStyle="text-align: left" /></td>
						</tr>
						<tr id="hide1">
							<td align="right" style="width:120px;">计提人员：</td>
							<td><input name="purpresettle.opername" id="opername" class="nui-textbox" required="false" style="width:100px" readOnly="readOnly" /></td>
							<td align="right" style="width:120px;">记账日期</td>
							<td><input name="purpresettle.acctdate" id="acctdate"class="nui-datepicker" required="false" style="width:100px" /></td>
						</tr>
						<tr>
							<td align="right" style="width:120px;">备注：</td>
							<td colspan="3"><input name="purpresettle.comment" id="comment" class="nui-textarea" required="false" style="height:40px;width:650px"/></td>
						</tr>
					</table>
				</div>
			</fieldset>
		</form>
		<jsp:include page="/ame_common/inputFile.jsp" />
	</div>
	<div style="text-align:center;padding:10px;" class="nui-toolbar">
		<a class="nui-button" onclick="onOk" style="width:60px;margin-right:20px;" id="sureButton">保存</a>
		<a class="nui-button" onclick="onCancel('cancel')" style="width:60px;" id="canelButton">关闭</a>
	</div>

	<script type="text/javascript">
		nui.parse();
		//更新逻辑流路径
		var updateURL = "com.primeton.eos.ame_pur.outaccrued.updatePurPresettle.biz.ext";
        //新增逻辑流路径
    	var addURL = "com.primeton.eos.ame_pur.outaccrued.addPurPresettle.biz.ext";
    	var saveURL = "";
	  	var form = new nui.Form("form1");
	  	//财务对应的原合同编号
	  	var oldContnum;
		init();
		function init(){
			var accrueddate = nui.get("accrueddate");
			accrueddate.setValue(new Date());
			accrueddate.disable();
			nui.get("purorderid").setReadOnly(true);
			nui.get("purorderid").setShowButton(false);
			nui.get("miscustid").setReadOnly(true);
			nui.get("salesid").setReadOnly(true);
			nui.get("miscustid").setShowButton(false);
			nui.get("salesid").setShowButton(false);
			//允许修改
			//nui.get("contnum").setReadOnly(true);
			var workunit = nui.get("workunit").getValue();
			if(workunit!='3'){
				nui.get("workamount").setRequired(true);
			}
		}
		
		function changeWorkamount(){
			var workunit = nui.get("workunit").getValue();
			if(workunit!='3'){
				nui.get("workamount").setRequired(true);
			}else{
				nui.get("workamount").setRequired(false);
			}	
		}
		
	  	//赋值
	  	var getTaxRate = 0;
	  	function SetData(data){
	    	data = nui.clone(data);
	    	if(data.action == "add"){
	    		//新增隐藏计提人
	    		document.getElementById("hide1").style.display="none";
	        	//计提月份
	        	var pyear = nui.get("accrueddate").getValue().getFullYear();
	        	var pmonth = nui.get("accrueddate").getValue().getMonth()+1;
	        	if(pmonth <10){
	        		pmonth = "0" + pmonth;
	        	}
	        	nui.get("premonth").setValue(pyear+"-"+pmonth);
			    //设置计提人
	        	<%
			   		UserObject user = (UserObject) session.getAttribute("userObject");
			   		String username = user.getUserName();
			   		String userno = user.getUserId();
			   		
			    %>
			    nui.get("opername").setValue("<%=username %>");
	    	}else if(data.action == "edit"){
	    		/**
	    		 * 允许修改的信息：计提周期、备注、计提金额、相关外包人员，计提状态，合同编号，项目编号，关联结算记录等
	    		**/
	    		//采购订单编号、供应商编号、所属销售、所属事业部不允许修改
	    		nui.get("purorderid").setReadOnly(true);
	    		nui.get("purorderid").setShowButton(false);
	    		nui.get("salesid").setReadOnly(true);
	    		nui.get("salesid").setShowButton(false);
	    		var json = nui.encode({purpresettle:data});  
	        	nui.ajax({
	        		url: "com.primeton.eos.ame_pur.outaccrued.getPurPresettle.biz.ext",
	                data: json,
	                type: 'POST',
	                cache: false,
	                contentType: 'text/json',
	                success: function (o) {
	                	nui.parse();
	                    form.setData(o);
	                    form.isChanged(false);
	            		nui.get("grid_0").load({"groupid":"PUR_PRESETTLE","relationid":o.purpresettle.accruedid});
	                    if(o.purpresettle.accruedstatus == "1"){
	                    	nui.get("contnum").setReadOnly(true);
	                    	nui.get("accruedmoney").setReadOnly(true);
	                    	nui.get("taxrate").setReadOnly(true);
	                    }
	                    var workunit = nui.get("workunit").getValue();
						if(workunit!='3'){
							nui.get("workamount").setRequired(true);
						}else{
							nui.get("workamount").setRequired(false);
						}
	                    //采购合同编号
	                    nui.get("purcontnum").setValue(o.purpresettle.purcontnum);
	                    nui.get("purcontnum").setText(o.purpresettle.purcontnum);
	                    var json = nui.decode({purSupplier:{custid: o.purpresettle.custid}});
                        nui.ajax({
			        		url: "com.primeton.eos.ame_pur.order.queryOrderList.biz.ext",
			                data: json,
			                type: 'POST',
			                cache: false,
			                contentType: 'text/json',
			                success: function (o) {
			                	nui.parse();
			                	var purContracts = o.purSupplier.purContracts;
			                	var purcontnums = [];
			                	for(var i = 0;i < o.purSupplier.purContracts.length;i ++){
			                		if(o.purSupplier.purContracts[i].purcontnum){
			                			purcontnums[i] = {"purcontnum": o.purSupplier.purContracts[i].purcontnum,
			                				"purcontname": o.purSupplier.purContracts[i].purcontname};
			                		}
			                	}
			                	nui.get("purcontnum").setData(nui.encode(purcontnums));
			                },
			                error: function (jqXHR, textStatus, errorThrown) {
			                    alert(jqXHR.responseText);
			                }
			            });
	                    //赋值供应商名称值
	                    nui.get("custid").setText(o.purpresettle.custname);
	                    nui.get("custid").setReadOnly(true);
	                    nui.get("custid").setShowButton(false);
	                    //所属销售	
	                    nui.get("salesid").setText(o.purpresettle.empname); 
	                    //采购订单
	                    var purordernums = [];
	                    if(o.purpresettle.purorderid){
	                    	purordernums = o.purpresettle.purorderid.split(",");
	                    }
	                    var setordernums = [];
	                    for(var i = 0;i < o.purpresettle.purOrders.length;i ++){
	                    	for(var j = 0;j < purordernums.length;j ++){
		                    	if(o.purpresettle.purOrders[i].purorderid == purordernums[j]){
		                    		setordernums[j] = {"purorderid": o.purpresettle.purOrders[i].purorderid,
		                    		"purordernum": o.purpresettle.purOrders[i].purordernum};
		                    	}
	                    	}
	                    }
	                	nui.get("purorderid").setData(setordernums);
	                    //项目
	                    nui.get("projectno").setValue(o.purpresettle.projectno);
	                    nui.get("projectno").setText(o.purpresettle.projectname);
	                    //销售合同编号
	                    nui.get("contnum").setValue(o.purpresettle.contnum);
	                    nui.get("contnum").setText(o.purpresettle.contnum);
	                    //赋值原合同编号
	                    oldContnum = o.purpresettle.contnum;
	                    //客户
	                    nui.get("miscustid").setText(o.purpresettle.miscustname);
	                    nui.get("miscustid").setShowButton(false);
	                    //税率
	                    nui.get("taxrate").setValue(parseFloat(o.purpresettle.taxrate * 100).toFixed(0));
	                },
	                error: function (jqXHR, textStatus, errorThrown) {
	                    alert(jqXHR.responseText);
	                    CloseWindow();
	                }
	        	});
    		}else if(data.action == "addpre"){	//供应商tab页中的计提新增
    			nui.get("custid").setValue(data.custid);
    			nui.get("custid").setText(data.custname);
    			nui.get("custid").setReadOnly(true);
    			nui.get("custid").setShowButton(false);
    			nui.get("salesid").setReadOnly(true);
    			nui.get("salesid").setShowButton(false);
				nui.get("miscustid").setReadOnly(true);
				nui.get("miscustid").setShowButton(false);
    			nui.get("purorderid").setReadOnly(false);
    			nui.get("purorderid").setShowButton(true);
    			
    			var json = nui.decode({purSupplier: {custid: data.custid}});
                nui.ajax({
	        		url: "com.primeton.eos.ame_pur.order.queryOrderList.biz.ext",
	                data: json,
	                type: 'POST',
	                cache: false,
	                contentType: 'text/json',
	                success: function (o) {
	                	nui.parse();
	                	var purorderids;
	                	var purordernums;
	                	for(var i = 0;i < o.purSupplier.purOrders.length;i ++){
	                		if(i == 0){
	                			purorderids = o.purSupplier.purOrders[i].purorderid;
	                			purordernums = o.purSupplier.purOrders[i].purordernum;
	                		}else{
		                		purorderids += "," + o.purSupplier.purOrders[i].purorderid;
		                		purordernums += "," + o.purSupplier.purOrders[i].purordernum;
	                		}
	                	}
	                	var purcontnums = [];
	                	for(var i = 0;i < o.purSupplier.purContracts.length;i ++){
	                		if(o.purSupplier.purContracts[i].purcontnum){
	                			purcontnums[i] = {"purcontnum": o.purSupplier.purContracts[i].purcontnum};
	                		}
	                	}
	                	nui.get("purcontnum").setData(nui.encode(purcontnums));
	                	nui.get("purorderid").setData(o.purSupplier.purOrders);
	                	var json = nui.decode({orderid: purorderids});
	                	nui.ajax({
	                		url: "com.primeton.eos.ame_pur.outperson.queryPurOutpersonByOrderIds.biz.ext",
	                		data: json,
	                		type: 'post',
	                		cache: false,
	                		contentType: 'text/json',
	                		success: function (o){
	                			var outpernames = null;
	                			for(var i = 0;i < o.orderOutpers.length;i ++){
	                				if(i == 0){
	                					outpernames = o.orderOutpers[i].purOutperson.outpername;
	                				}else{
		                				outpernames += "," + o.orderOutpers[i].purOutperson.outpername;
	                				}
	                			}
	                			nui.get("outper").setValue();
	                		},
	                		error: function (jqXHR, textStatus, errorThrown) {
			                    alert(jqXHR.responseText);
			                    CloseWindow();
			                }
	                	});
	                },
	                error: function (jqXHR, textStatus, errorThrown) {
	                    alert(jqXHR.responseText);
	                    CloseWindow();
	                }
	        	});
    		}
    		nui.get("accruedstatus").setReadOnly(true);
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
                            nui.get("purorderid").setReadOnly(false);
                            nui.get("purorderid").setShowButton(true);
                        	//增加计提时，如果供应商是一般纳税人和为空的，则税率缺省为6%，其他纳税人为3%
                        	if(data.istaxpayer == "n"){
                        		//其他纳税人
                        		nui.get("taxrate").setValue(3);
                        	}else{
                        		//一般纳税人
                        		nui.get("taxrate").setValue(6);
                        	}
                            //queryOrderList订单数据
                            var json = nui.decode({purSupplier:{custid:data.custid}});
                            nui.ajax({
				        		url: "com.primeton.eos.ame_pur.order.queryOrderList.biz.ext",
				                data: json,
				                type: 'POST',
				                cache: false,
				                contentType: 'text/json',
				                success: function (o) {
				                	nui.parse();
				                	//采购合同编号
				                	var purcontnums = [];
				                	for(var i = 0;i < o.purSupplier.purContracts.length;i ++){
				                		if(o.purSupplier.purContracts[i].purcontnum){
					                		purcontnums[i] = {"purcontnum": o.purSupplier.purContracts[i].purcontnum,
					                		"purcontname": o.purSupplier.purContracts[i].purcontname};
				                		}
				                	}
				                	nui.get("purcontnum").setData(nui.encode(purcontnums));
				                	var purorderids;
				                	var purordernums;
				                	for(var i = 0;i < o.purSupplier.purOrders.length;i ++){
				                		if(i == 0){
				                			purorderids = o.purSupplier.purOrders[i].purorderid;
				                			purordernums = o.purSupplier.purOrders[i].purordernum;
				                		}else{
					                		purorderids += "," + o.purSupplier.purOrders[i].purorderid;
					                		purordernums += "," + o.purSupplier.purOrders[i].purordernum;
				                		}
				                	}
				                	/* nui.get("purorderid").setValue(purorderids);
				                	nui.get("purorderid").setText(purordernums); */
				                	var ordernums = [];
				                	var jj = 0;
				                	for(var i = 0;i < o.purSupplier.purOrders.length;i ++){
				                		if(o.purSupplier.purOrders[i].purordernum){
				                			ordernums.length ++;
				                			ordernums[jj] = {"purorderid": o.purSupplier.purOrders[i].purorderid,
				                				"purordernum": o.purSupplier.purOrders[i].purordernum};
				                			jj ++;
				                		}
				                	}
				                	nui.get("purorderid").setData(ordernums);
				                	var json = nui.decode({orderid: purorderids});
				                	nui.ajax({
				                		url: "com.primeton.eos.ame_pur.outperson.queryPurOutpersonByOrderIds.biz.ext",
				                		data: json,
				                		type: 'post',
				                		cache: false,
				                		contentType: 'text/json',
				                		success: function (o){
				                			var outpernames = null;
				                			for(var i = 0;i < o.orderOutpers.length;i ++){
				                				if(i == 0){
				                					outpernames = o.orderOutpers[i].purOutperson.outpername;
				                				}else{
					                				outpernames += "," + o.orderOutpers[i].purOutperson.outpername;
				                				}
				                			}
				                			//nui.get("outper").setValue(outpernames);
				                			nui.get("outper").setValue();
				                		},
				                		error: function (jqXHR, textStatus, errorThrown) {
						                    alert(jqXHR.responseText);
						                    CloseWindow();
						                }
				                	});
				                },
				                error: function (jqXHR, textStatus, errorThrown) {
				                    alert(jqXHR.responseText);
				                    CloseWindow();
				                }
				        	});
				        	
				        	/* //采购合同编号
				        	var jsonCont = nui.decode({purSupplier:{custid:data.custid}});
                            nui.ajax({
				        		url: "com.primeton.eos.ame_pur.order.queryOrderList.biz.ext",
				                data: json,
				                type: 'POST',
				                cache: false,
				                contentType: 'text/json',
				                success: function (o) {
				                	
				                },
		                		error: function (jqXHR, textStatus, errorThrown) {
				                    alert(jqXHR.responseText);
				                    CloseWindow();
				                }
				            }); */
                        }
                    }
                }
            });
        }
        
        //选择订单
        function selectOrder(){
        	var purorderids = nui.get("purorderid").getValue();
        	var json = nui.decode({orderid: purorderids});
        	nui.ajax({
        		url: "com.primeton.eos.ame_pur.outperson.queryPurOutpersonByOrderIds.biz.ext",
        		data: json,
        		type: 'post',
        		cache: false,
        		contentType: 'text/json',
        		success: function (o){
        			var outpernames = null;
        			for(var i = 0;i < o.orderOutpers.length;i ++){
        				if(i == 0){
        					outpernames = o.orderOutpers[i].purOutperson.outpername;
        				}else{
            				outpernames += "," + o.orderOutpers[i].purOutperson.outpername;
        				}
        			}
        			//外包人员需要去重
        			var result = [], isRepeated;
        			var arr = outpernames.split(",");
        			arr.sort();
					for (var i = 0; i < arr.length; i++) {
	         			isRepeated = false;
						for (var j = 0; j < result.length; j++) {
							if (arr[i] == result[j]) {   
								isRepeated = true;
								break;
							}
						}
						if (!isRepeated) {
							result.push(arr[i]);
						}
					}
        			nui.get("outper").setValue(result);
        		},
        		error: function (jqXHR, textStatus, errorThrown) {
                    alert(jqXHR.responseText);
                    CloseWindow();
                }
        	});
        }
        
        //选择项目
        function selectProject(){
        	var btnEdit = this;
        	var syb = nui.get("syb").getValue();
        	nui.open({
                url:"<%=request.getContextPath() %>/ame_common/SelectProject.jsp?syb=" + syb,
                title: "选择项目",
                width: 900,
                height: 480,
                allowResize: false,
                ondestroy: function (action) {
                    if (action == "ok") {
                        var iframe = this.getIFrameEl();
                        var data = iframe.contentWindow.GetData();
                        data = nui.clone(data);    //必须
                        if (data) {
                            btnEdit.setValue(data.projectno);
                            btnEdit.setText(data.projectName);
                            nui.get("salesid").setValue(data.orgid);
							nui.get("salesid").setText(data.orgname);
							nui.get("miscustid").setValue(data.custid);
							nui.get("miscustid").setText(data.custname);
							nui.get("contnum").setValue(data.contnum);
							nui.get("contnum").setText(data.contnum);
                        }
                    }
                }
            });
        }
        
        //选择事业部
        function selectsyb(){
        	nui.get("projectno").setValue();
        	nui.get("projectno").setText();
        	nui.get("salesid").setValue();
			nui.get("salesid").setText();
			nui.get("miscustid").setValue();
			nui.get("miscustid").setText();
			nui.get("contnum").setValue();
			nui.get("contnum").setText();
        }
        
        //选择销售
        function selectSales(){
        	var btnEdit = this;
        	var syb = nui.get("syb").getValue();
	        nui.open({
				url:"<%=request.getContextPath() %>/petty/selectSale.jsp",
				title: "选择销售",
				width: 600,
				height: 400,
				onload: function () {
                    var iframe = this.getIFrameEl();
                    var data = {syb:syb};
                    iframe.contentWindow.SetData(data);
                },
				ondestroy: function (action) {
					if (action == "ok") {
						var iframe = this.getIFrameEl();
						var data = iframe.contentWindow.GetData();
						data = nui.clone(data);    //必须
						if (data) {
			                btnEdit.setValue(data.orgid);
			                btnEdit.setText(data.orgname);
						}
					}
				}
			});
        }
        
        //选择销售合同
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
    	
    	//保存
	  	function SaveData() {
            if(form.validate()){                         
	        	var accruedid = nui.get("accruedid").getValue();
	        	var saveURL = "";
				if(accruedid){
					saveURL = updateURL;
				} else{
					saveURL = addURL;
				}
				
				var o = form.getData();
	            o.purpresettle.taxrate = parseFloat(o.purpresettle.taxrate/100).toFixed(2);
	            //财务对应的原合同编号
	            o.purpresettle.oldContnum = oldContnum;
	            var json = nui.encode(o);
	            form.loading("保存中,请稍后...");
	            nui.ajax({
	                url: saveURL,
	                data: json,
	                type: 'POST',
	                cache: false,
	                contentType: 'text/json',
	                success: function (text) {
	                	form.unmask();
						var returnJson = nui.decode(text);
						if(returnJson.exception == null){
							if(saveURL == updateURL){
								nui.alert("保存成功!",null,function(){
									CloseWindow("ok");
								});
							}else{
								//保存成功后需要询问是否继续新增
								nui.showMessageBox({
						            title: "操作提示",
						            iconCls: "nui-messagebox-question",
						            buttons: ["yes", "no"],
						            message: "保存成功！是否继续新增?",
						            callback: function (action) {
						                if(action=="yes"){
						                	form.clear();
						                	document.getElementById('filetable').innerHTML = "";
						                	//计提状态
						                	nui.get("accruedstatus").setValue("0");
						                	//计提时间
						                	nui.get("accrueddate").setValue(new Date());
						                	//成本类型
						                	nui.get("costtype").setValue(1);
						                	//计提税率
						                	nui.get("taxrate").setValue(getTaxRate);
						                	//确认按钮
						                	nui.get("sureButton").setEnabled(true);
						                	//nui.get("purorderid").disable();
						                }else{
						                	CloseWindow("ok");	
						                }
						            }
						        });
							}
						}else{
							nui.alert("保存失败", "系统提示", function(action){
								nui.get("sureButton").setEnabled(true);
								if(action == "ok" || action == "close"){
									//CloseWindow("saveFailed");
								}
							});
						}        
	                },
	                error: function (jqXHR, textStatus, errorThrown) {
	                    alert(jqXHR.responseText);
	                    CloseWindow();
	                }
	               
	            });
	        }else{
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
        
		function onOk(){
			var startdate = nui.get("startdate").getValue();
        	var enddate = nui.get("enddate").getValue();
        	if(!startdate){
        		nui.alert("计提开始日期不能为空");
        		return;
        	}
        	if(!enddate){
        		nui.alert("计提结束日期不能为空");
        		return;
        	}
    		if(startdate > enddate){
    			nui.alert("计提开始日期:" + startdate.substring(0,10) + "不能大于计提结束日期:" + enddate.substring(0,10));
    			return;
        	}
	    	if(form.validate()){
        		nui.confirm("确认保存吗？", "确定？",
	            function (action) {            
	                if (action == "ok") {
	                	nui.get("sureButton").setEnabled(false);
		    			document.getElementById("fileCatalog").value="PurPresettle";
						form2.submit();
	    			}else{
						return;
					}
				});
	    	}else{
	    		return;
	    	}
	    }
    
        function onCancel(e) {
        	var data = form.getData();
        	if(data){
	        	nui.showMessageBox({
		            title: "关闭提示",
		            iconCls: "nui-messagebox-question",
		            buttons: ["yes", "no"],
		            message: "是否关闭？",
		            callback: function (action) {
		                if(action=="yes"){
		                	CloseWindow("cancel");
		                }
		            }
		        });
			}else{
				CloseWindow("cancel");
			}
        }
        
        //验证表单开始和截止日期
        function startandend(action){
        	var startdate = nui.get("startdate").getValue();
        	var enddate = nui.get("enddate").getValue();
			/* var nowdate = new Date();
			var nowyear = nowdate.getFullYear();
			var nowmonth;
			if(nowdate.getMonth() < 9){
				nowmonth = "0" + (nowdate.getMonth() + 1);
			}else{
				nowmonth = nowdate.getMonth() + 1;
			}
			var nowday;
			if(nowdate.getDate() <= 9){
				nowday = "0" + nowdate.getDate();
			}else{
				nowday = nowdate.getDate();
			}
			var now = nowyear + "-" + nowmonth + "-" + nowday;
			if(startdate.substring(0,10) > now){
				nui.alert("开始日期不能大于当前日期");
				return;
			}
			if(enddate.substring(0,10) > now){
				nui.alert("结束日期不能大于当前日期");
				return;
			} */
        	if(startdate){
        		if(enddate){
	        		if(startdate > enddate){
	        			if(action == "start"){
		        			nui.alert("计提开始日期:" + startdate.substring(0,10) + "不能大于计提结束日期:" + enddate.substring(0,10));
		        			return;
	        			}else if(action == "end"){
	        				nui.alert("计提结束日期:" + enddate.substring(0,10) + "不能小于计提开始日期:" + startdate.substring(0,10));
		        			return;
	        			}
	        		}
        		}
        	}
        }
        
        //计提金额改变
        function changeMoney(){
        	//计提金额
        	var accruedmoney = nui.get("accruedmoney").getValue();
        	if(accruedmoney){
	        	accruedmoney = parseFloat(accruedmoney);
	        	//税率
	        	var taxrate = nui.get("taxrate").getValue();
	        	if(taxrate){
		        	taxrate = parseFloat(taxrate/100);
		        	//不含税金额
		        	var notaxmoney = parseFloat(accruedmoney/(1+taxrate)).toFixed(2);
		        	nui.get("notaxmoney").setValue(notaxmoney);
	        	}else{
	        		nui.get("notaxmoney").setValue(0);
	        	}
        	}else{
        		nui.get("notaxmoney").setValue(0);
        	}
        }
        
        //更改采购合同
        function changepurcontnum(){
        	var purcontnum = nui.get("purcontnum").getValue();
        	var json = nui.decode({purContract: {purcontnum: purcontnum}});
        	nui.ajax({
        		url: "com.primeton.eos.ame_pur.purContractProcess.getContractApply.biz.ext",
        		data: json,
        		type: 'post',
        		cache: false,
        		contentType: 'text/json',
        		success: function (o){
        			o = nui.clone(o);
        			//如果根据采购合同编号查询到外部合同编号，对财务对应合同进行赋值
        			if(o.purContract.outcontnum){
        				nui.get("contnum").setValue(o.purContract.outcontnum);
        				nui.get("contnum").setText(o.purContract.outcontnum);
        			}
        		},
        		error: function (jqXHR, textStatus, errorThrown) {
                    alert(jqXHR.responseText);
                    CloseWindow();
                }
        	});
        }
        //选择财务对应合同编号
        function selectcontnum(){
        	var btnEdit = this;
        	nui.open({
                url:"<%=request.getContextPath() %>/ame_common/contract_lookup.jsp",
                title: "选择销售合同",
                width: 1000,
                height: 550,
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
        
        //修改税率
        function changetax(){
        	var accruedmoney = nui.get("accruedmoney").getValue();
        	if(accruedmoney){
	        	var taxrate = nui.get("taxrate").getValue();
	        	if(taxrate){
		        	accruedmoney = parseFloat(accruedmoney);
		        	taxrate = parseFloat(taxrate/100);
		        	taxrate = 1 + taxrate;
		        	var notaxmoney = accruedmoney/(taxrate);
		        	notaxmoney = parseFloat(notaxmoney).toFixed(2);
		        	nui.get("notaxmoney").setValue(notaxmoney);
	        	}else{
	        		nui.get("notaxmoney").setValue(0);
	        	}
        	}else{
        		nui.get("notaxmoney").setValue(0);
        	}
        }
        
        function delecont(){
        	nui.get("contnum").setValue("");
        	nui.get("contnum").setText("");
        }
	</script>
</body>
</html>
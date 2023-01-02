<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<!-- 
  - Author(s): zhuyl
  - Date: 2016-08-11 10:40:21
  - Description:
-->
<head>
	<title>更新收入确认信息</title>
	<meta http-equiv="content-type" content="text/html; charset=UTF-8" />
	<script src="<%= request.getContextPath() %>/common/nui/nui.js" type="text/javascript"></script>
	<script src="../common/nui/nui.js" type="text/javascript"></script>
	<style type="text/css">
	    body{
	        margin:0;padding:0;border:0;width:100%;height:100%;overflow:hidden;
	    }
	    .myrow
	    {
	        background:#fceee2;
	    }
    </style>
</head>
<body>
	<!-- 上面显示合同基本信息（不允许修改）：合同编号、客户名称、合同名称、签订日期、合同金额、已确认收入、待确认收入
动态列表显示字段：收入确认次数、收入类型、确认比例，预计确认金额，收入确认时点、收入确认证据、预计确认年月、旬度、当前状态、实际收入确认日期
允许编辑字段：预计确认比例、金额、预计确认年月、旬度（对于已完成收入确认的记录不允许编辑） -->
	<div class="nui-fit">
		<form id="formCsContract" method="post">
			<input name="csContract.contractid" id="contractid" class="nui-hidden"/>
			<fieldset id="field1" style="border:solid 1px #aaa;padding:3px;width: 1020px;">
				<legend>合同基本信息</legend>
				<div style="padding:5px;">
					<table style="table-layout:fixed;">
						<tr>
							<td align="right" width="120px">合同编号：</td>
							<td><input name="csContract.contnum" id="contnum" class="nui-textbox" readOnly="readOnly" style="width:100px" /></td>
							<td align="right" width="120px">客户名称：</td>
							<td>
								<input name="csContract.misCustinfo.custname" id="custname" class="nui-textbox" readOnly="readOnly" style="width:300px" />
								<input name="csContract.misCustinfo.custid" id="custid" class="nui-hidden" />
							</td>
						</tr>
						<tr>
							<td align="right" width="120px">合同名称：</td>
							<td><input name="csContract.projectname" id="projectname" class="nui-textbox" readOnly="readOnly" style="width:300px" /></td>
							<td align="right" width="120px">签订日期：</td>
							<td><input name="csContract.signdate" id="signdate" class="nui-datepicker" readOnly="readOnly" style="width:100px" /></td>
						</tr>
						<tr>
							<td align="right" width="120px">合同金额(元)：</td>
							<td><input name="csContract.contsum" id="contsum" class="nui-spinner" inputStyle="text-align:right;" readOnly="readOnly" style="width:100px" allowLimitValue="false" format="#,0" showbutton="false" /></td>
							<td align="right" width="120px">合同服务金额(元)</td>
							<td><input name="csContract.servmon" id="servmon" class="nui-spinner" inputStyle="text-align:right;" readOnly="readOnly" style="width:100px" allowLimitValue="false" format="#,0" showbutton="false" /></td>
						</tr>
						<tr>
							<td align="right" width="120px">合同产品金额(元)</td>
							<td><input name="csContract.prodmon" id="prodmon" class="nui-spinner" inputStyle="text-align:right;" readOnly="readOnly" style="width:100px" allowLimitValue="false" format="#,0" showbutton="false" /></td>
							<td align="right" width="120px">合同MA金额(元)</td>
							<td><input name="csContract.masum" id="masum" class="nui-spinner" inputStyle="text-align:right;" readOnly="readOnly" style="width:100px" allowLimitValue="false" format="#,0" showbutton="false" /></td>
						</tr>
						<tr>
							<td align="right" width="120px">待确认收入(元)：</td>
							<td><input name="csContract.recognizedRevenue" id="nui-spinner" class="nui-spinner" inputStyle="text-align:right;" readOnly="readOnly" style="width:100px" allowLimitValue="false" format="#,0" showbutton="false" /></td>
							<td align="right" width="120px">已确认收入(元)：</td>
							<td><input name="csContract.recognisedIncome" id="nui-spinner" class="nui-spinner" inputStyle="text-align:right;" readOnly="readOnly" style="width:100px" allowLimitValue="false" format="#,0" showbutton="false" /></td>
						</tr>
					</table>
				</div>
			</fieldset>
			<fieldset id="field1" style="border:solid 1px #aaa;padding:3px;width: 1380px;">
				<div id="datagrid1" class="nui-datagrid" style="width: 100%;height: auto;" dataField="csReveForecasts"
			    	url="com.primeton.eos.ame_income.csContract.queryCsReveForecastByIncome.biz.ext" multiSelect="true"
			    	onlyCheckSelection="true" allowCellEdit="true" allowCellSelect="true" oncellbeginedit="rowclick" 
			    	showPager="false" oncellendedit="doCsReveForecastEnd" oncellbeginedit="doCsReveForecastBegin" 
			    	allowHeaderWrap="true" showSortIcon="true">
					<div property="columns">
						<!-- 允许编辑字段：预计确认比例、金额、预计确认年月、旬度（对于已完成收入确认的记录不允许编辑） --> -->
						<div field="contnum" visible="false">合同编号</div>
						<div field="reveno" width="57" headerAlign="center" align="center">收入次数</div>
						<div field="revetype" width="160" headerAlign="center" align="left" renderer="dictGetReveType">收入类型</div>
						<div field="revetimedesc" width="110" headerAlign="center" align="left">收入确认时点</div>
						<div field="reveproof" width="150" headerAlign="center" align="left" renderer="dictGetReveProof">收入确认证据</div>
						<div field="newyearmonth" width="80" headerAlign="center" dateFormat="yyyy-MM" align="left">预计确认年月
							<input property="editor" class="nui-monthpicker" inputStyle="text-align: left"/>
						</div>
						<div field="newmonthperiod" width="50" headerAlign="center" align="left" renderer="dictGetPeriod">旬度
							<input property="editor" class="nui-dictcombobox" dictTypeId="AME_MONTHPERIOD" inputStyle="text-align: left"/>
						</div>
						<div field="servicesum" width="80" dataType="currency" headerAlign="center" align="right" visible="true">预计服务<br/>确认金额
							<input property="editor" class="nui-textbox" inputStyle="text-align: right"/>
						</div>
						<div field="productsum" width="80" dataType="currency" headerAlign="center" align="right" visible="true">预计产品<br/>确认金额
							<input property="editor" class="nui-textbox" inputStyle="text-align: right"/>
						</div>
						<div field="masum" width="80" dataType="currency" headerAlign="center" align="right" visible="true">预计MA<br/>确认金额
							<input property="editor" class="nui-textbox" inputStyle="text-align: right"/>
						</div>
						<div field="fcsum" width="80" dataType="currency" headerAlign="center" align="right">预计确认金额</div>
						<div field="fcreverate" width="60" headerAlign="center" align="right" numberFormat="p1">比例</div>
						<div field="status" width="90" headerAlign="center" align="left" renderer="dictGetStatus">当前状态</div>
						<div field="actsum" width="80" dataType="currency" headerAlign="center" align="right">实际确认金额(含税)</div>
						<div field="actsum2" width="80" dataType="currency" headerAlign="center" align="right">实际确认金额(不含税)</div>
						<div field="maconfirmday" width="80" headerAlign="center" align="center">实际确认日期</div>
						<div field="saleseva" width="60" headerAlign="center" align="center" renderer="onGenderSaleseva">是否业务发起</div>
						<div width="auto"></div>
					</div>
				</div>
				<div style="width:550px;height:25px;margin-left:450px;float:left;">
					<table style="table-layout:fixed;">
						<tr>
							<td align="right" style="width:144px;">总计：</td>
							<td id="totalservicesum" style="width:71px" align="right" ></td>
							<td style="width:2px"></td>
							<td id="totalproductsum" style="width:71px;" align="right" ></td>
							<td style="width:2px"></td>
							<td id="totalmasum" style="width:71px;" align="right" ></td>
							<td style="width:2px"></td>
							<td id="totalfcsum" style="width:71px;" align="right" ></td>
						</tr>
					</table>
				</div>
			</fieldset>
		</form>
		<span style="color: blue;font-weight: bold">&nbsp;更新收入确认信息说明：黄颜色区域为可编辑区域。</span>
		
		<br />
		&nbsp;&nbsp;<a class="nui-button" style="width: 140px" onclick="openMessage" id="openMessageButton" >收入记录异常情况申报</a>
		<span style="color: red;font-weight: bold;">如果发现收入记录异常（如无效的收入记录、收入记录不完整、确认金额不准确等），请使用“收入记录异常情况申报”。</span>
	</div>
	<div style="text-align:center;padding:10px;" class="nui-toolbar">
		<a class="nui-button" onclick="onOk" style="width:60px;margin-right:20px;" id="sureButton">保存</a>
		<a class="nui-button" onclick="onCancel('cancel')" style="width:60px;" id="canelButton">关闭</a>
	</div>
	<div id="win1" class="nui-window" title="收入记录异常情况申报" style="width: 380px;height: 320px;" 
	    showMaxButton="true" showCollapseButton="true" showShadow="true"
	    showToolbar="false" showFooter="true" showModal="true" allowResize="true" allowDrag="true">
    	<div style="padding:1px;">
    		<form id="formmessage" method="post">
    			<input id="userid" class="nui-hidden"/>
				<div style="padding:1px;">
					<table style="table-layout:fixed;">
						<tr>
							<td align="right" width="90px"></td>
							<td></td>
						</tr>
						<tr>
							<td colspan="2" width="360px;" ><span style="color: red;font-weight: bold;">收入记录异常主要指合同拆分的收入记录条数与实际情况有出入。请在告知内容中补充针对合同收入记录异常说明的具体描述。</span></td>
						</tr>
						<tr>
							<td align="right" width="90px">告知方式：</td>
							<td>
								<input class="nui-checkboxlist" id="messageMode" style="width: 200px;" textField="text" valueField="id" />
							</td>
						</tr>
						<tr>
							<td align="right" width="90px">告知人：</td>
							<td><input class="nui-buttonedit" id="messageEmpInfo" onbuttonclick="selectOmEmployee" allowInput="false" style="width: 90px;" /></td>
						</tr>
						<tr>
							<td align="right" width="90px">告知内容：</td>
							<td><input class="nui-textarea" id="messageInfo" style="width: 200px;height: 80px;" onclick="this.focus();this.select()" onblur="textNumbers" />
							</td>
						</tr>
					</table>
				</div>
			</form>
    	</div>
	    <div class="nui-toolbar" style="text-align:center;padding:5px;">
	        <a class="nui-button" onclick="goMessage()" style="width:60px;margin-right:20px;" id="goMesseageButton">发送</a>
	        <a class="nui-button" onclick="hideWindow()" style="width:60px;margin-right:20px;" id="hideWindowButton">关闭</a>
	    </div>
	</div>
	<script type="text/javascript">
		nui.parse();
		var formCsContract = new nui.Form("formCsContract");
		var grid = nui.get("datagrid1");
		var formmessage = new nui.Form("formmessage");
		//合同销售名称
	  	var salename = "";
		//合同收入变更通知人名称
	  	var skbgtzname = "";
        //合同收入变更通知人电话
        var skbgtztel = "";
        //合同收入变更通知人userid
        var skbgtzuserid = "";
		
		grid.on("drawcell", function (e) {
            var record = e.record,
	        column = e.column,
	        field = e.field,
	        value = e.value;
            //设置行样式
            if(field == "newyearmonth" || field == "newmonthperiod" || field == "masum" || field == "servicesum" || field == "productsum"){
            	if(record.status != 2 && record.status != 3 && record.status != 7 && record.status != 8  && record.saleseva == 1){
	            	e.cellStyle = "background: yellow";
            	}
            }

        });
		
		//计算确认金额和比例
		function doFcsumRate(e){
			var row = grid.getRow(e.rowIndex);
			var fcsum = 0;
			var fcreverate = 0;
			if(row.fcsum){
	        	fcsum = row.fcsum;
	        }
	        if(row.fcreverate){
	        	fcreverate = row.fcreverate;
	        }
	        //合同金额
	        var contsum = nui.get("contsum").getValue();
	        fcsum = parseFloat(contsum*fcreverate).toFixed(2);
	        fcreverate = parseFloat(fcsum/contsum).toFixed(2);
		}
		
		//合同列表点击更新收入确认信息按钮进入页面赋值
		var old = null;
		function SetData(data){
			//告知方式初始化
			var messageModeData = [{"id": "1","text": "短信"},{"id": "2","text": "微信"}];
	  		nui.get("messageMode").setData(messageModeData);
	  		nui.get("messageMode").setValue("1,2");
			data = nui.clone(data);
			if(data.action == "edit"){
				var json = nui.encode({csContract: {contractid: data.contractid}});
				formCsContract.loading("数据加载中...");  
	        	nui.ajax({
	        		url: "com.primeton.eos.ame_income.csContract.getCsContractDetail.biz.ext",
	                data: json,
	                type: 'POST',
	                cache: false,
	                contentType: 'text/json',
	                success: function (o) {
	                	nui.parse();
	                	formCsContract.unmask();
	                	o = nui.clone(o);
	                    formCsContract.setData(o);
	                    formCsContract.isChanged(false);
	                    //合同销售名称赋值
	                    salename = o.csContract.salename;
	                    //合同收入变更通知人名称
	                    skbgtztel = o.csContract.skbgtztel;
	                    //合同收入变更通知人电话
	                    skbgtzname = o.csContract.skbgtzname;
	                    skbgtzuserid = o.csContract.skbgtzuserid;
	                    grid.sortBy("reveno","asc");
	                    grid.load({"criteria": {"_expr[0]": {"_property": "contnum","_op": "=","_value": data.contnum}}},function(){
	                    	//统计行
		                    var datas = grid.getData();
							var sumfcsum = 0;
							var sumproductsum = 0;
							var sumservicesum = 0;
							var summasum = 0;
							for(var i=0;i<datas.length;i++){
								var fcsum = datas[i].fcsum;
								if(fcsum){
									if(!isNaN(fcsum)){
										sumfcsum += parseFloat(fcsum);
									}
								}
								var productsum = datas[i].productsum;
								if(productsum){
									if(!isNaN(productsum)){
										sumproductsum += parseFloat(productsum);
									}
								}
								var servicesum = datas[i].servicesum;
								if(servicesum){
									if(!isNaN(servicesum)){
										sumservicesum += parseFloat(servicesum);
									}
								}
								var masum = datas[i].masum;
								if(masum){
									if(!isNaN(masum)){
										summasum += parseFloat(masum);
									}
								}
							}
							sumfcsum = parseFloat(sumfcsum).toFixed(2);
							sumproductsum = parseFloat(sumproductsum).toFixed(2);
							sumservicesum = parseFloat(sumservicesum).toFixed(2);
							summasum = parseFloat(summasum).toFixed(2);
							document.getElementById("totalfcsum").innerHTML = sumfcsum;
							document.getElementById("totalproductsum").innerHTML = sumproductsum;
							document.getElementById("totalservicesum").innerHTML = sumservicesum;
							document.getElementById("totalmasum").innerHTML = summasum;
							old = grid.getData();
	                    });
	                    //grid.load();
	                    
	                },
	                error: function (jqXHR, textStatus, errorThrown) {
	                    alert(jqXHR.responseText);
	                }
	        	});
			}
		}
		
		//点击更新按钮
		function onOk(){
			if(grid.getChanges("modified",false).length == 0){
        		nui.alert("收入数据未作修改！无需保存！");
        		return;
        	}
        	if(formCsContract.validate()){
				var changeRows = grid.getChanges("modified",false); 
				//预计确认年月不能小于当前时间的年月。
				var nowdate = new Date();
				for(var i = 0;i < changeRows.length;i ++){
					var chooiseYearMonth = "";
					var nowYearMonth = "";
					if(typeof(changeRows[i].newyearmonth) == "object"){
						if((changeRows[i].newyearmonth.getMonth() + 1) < 10){
							chooiseYearMonth = changeRows[i].newyearmonth.getFullYear() + "0" + (changeRows[i].newyearmonth.getMonth() + 1);
						}else{
							chooiseYearMonth = changeRows[i].newyearmonth.getFullYear() + "" + (changeRows[i].newyearmonth.getMonth() + 1);
						}
						if((nowdate.getMonth() + 1) < 10){
							nowYearMonth = nowdate.getFullYear() + "0" + (nowdate.getMonth() + 1);
						}else{
							nowYearMonth = nowdate.getFullYear() + "" + (nowdate.getMonth() + 1);
						}
						if(chooiseYearMonth < nowYearMonth){
							nui.alert("修改的预计确认年月不能小于当前年月！");
							return;
						}
					}
				}
				var sumfcsum = document.getElementById("totalfcsum").innerHTML;
				var contsum = nui.get("contsum").getValue();
				if(parseFloat(sumfcsum) != parseFloat(contsum)){
					alert("预计确认金额总计与合同金额不一致，请确认后再进行保存！");
					return;
				}
        		nui.confirm("确认更新吗？", "确定？",
	            function (action) {            
	                if (action == "ok") {
	                	var o = formCsContract.getData();
	                	/* var rows = grid.getData();
						o.csContract.csReveForecasts = rows; */
						o.csContract.csReveForecasts = changeRows;
						for(var i = 0;i < o.csContract.csReveForecasts.length;i ++){
							if(typeof(o.csContract.csReveForecasts[i].yearmonth) != "string"){
								var year = o.csContract.csReveForecasts[i].yearmonth.getFullYear();
				        		var month = o.csContract.csReveForecasts[i].yearmonth.getMonth() + 1;
				        		if(month < 10){
				        			month = "0" + month;
				        		}
				        		o.csContract.csReveForecasts[i].yearmonth = year + "" +  month;
							}else{
				        		var year = o.csContract.csReveForecasts[i].yearmonth.substr(0,4);
				        		var month = o.csContract.csReveForecasts[i].yearmonth.substr(4,2);
				        		o.csContract.csReveForecasts[i].yearmonth = year + "" +  month;
				        	}
				        	if(typeof(o.csContract.csReveForecasts[i].newyearmonth) != "string"){
				        		var year = o.csContract.csReveForecasts[i].newyearmonth.getFullYear();
				        		var month = o.csContract.csReveForecasts[i].newyearmonth.getMonth() + 1;
				        		if(month < 10){
				        			month = "0" + month;
				        		}
				        		o.csContract.csReveForecasts[i].newyearmonth = year + "" +  month;
				        	}else{
				        		var year = o.csContract.csReveForecasts[i].newyearmonth.substr(0,4);
				        		var month = o.csContract.csReveForecasts[i].newyearmonth.substr(5,2);
				        		o.csContract.csReveForecasts[i].newyearmonth = year + "" +  month;
				        	}
			        	}
	            		var json = nui.encode(o);
	            		nui.get("sureButton").disable();
	            		formCsContract.loading("更新中...");
	            		nui.ajax({
			        		url: "com.primeton.eos.ame_income.csContract.updateCsContractIncome.biz.ext",
			                data: json,
			                type: 'POST',
			                cache: false,
			                contentType: 'text/json',
			                success: function (text) {
			                	formCsContract.unmask();
			                	text = nui.clone(text);
			                    if(text.csContract.exception == null){
			                    	nui.alert("更新成功",null,function(){
			                    		//CloseWindow("ok");//sureButton
			                    		nui.get("sureButton").enable();
			                    		grid.reload();
			                    	});
			                    }else{
			                    	nui.alert("更新失败");
			                    	nui.get("sureButton").enable();
			                    }
			                },
			                error: function (jqXHR, textStatus, errorThrown) {
			                    alert(jqXHR.responseText);
			                }
			        	});
			        }
			    });
        	}
	    }
	    
	    //点击关闭按钮
	    function onCancel(e) {
            var data = formCsContract.getData();
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
        
		//行选择时
		function rowclick(e){
			//状态为:2、收入确认流程中,3、已确认 不可以修改
			if((e.record.status == 2 || e.record.status == 3 || e.record.status == 7 || e.record.status == 8) || e.record.saleseva != "1"){	
				cancelEditRow(e.record);
			}
		}
		
        //收入类型
        function dictGetReveType(e){
        	return nui.getDictText('AME_REVETYPE',e.value);
        } 
        
        //收入确认证据
        function dictGetReveProof(e){
        	return nui.getDictText('MIS_INCOMECONV',e.value);
        }
        
		//旬度
        function dictGetPeriod(e) {
			return nui.getDictText('AME_MONTHPERIOD',e.value);
		}
		
        //当前状态
        function dictGetStatus(e) {
        	//0、收入未确认,1、收入确认延误,2、收入确认流程中,3、已确认,4、收入无法确认
        	//当状态为2和3时不允许修改预估值
			return nui.getDictText('AME_REVESTATUS',e.value);
		}
		
		//是否需要销售评估
	    function onGenderSaleseva(e){
	    	return nui.getDictText('MIS_YN',e.value);
	    }
	    
		//确认比例(编辑前)
	    var fcreverateBegin = 0;
	    //确认金额(编辑前)
		var fcsumBegin = 0;
	    //算比例金额(编辑前)
	    function doCsReveForecastBegin(e){
	    	var row = grid.getRow(e.rowIndex);
	    	if(row.fcreverate){
	        	fcreverateBegin = row.fcreverate;
	        }
	        if(row.fcsum){
	        	fcsumBegin = row.fcsum;
	        }
	    }
	    //算比例金额(编辑后)
	    function doCsReveForecastEnd(e){
	    	var contsum = nui.get("contsum").getValue();
	    	var row = grid.getRow(e.rowIndex);
	    	//确认比例
	    	var fcreverate = 0;
	    	//确认金额
	    	var fcsum = 0;
	    	//预计金额产品额
	    	var productsum = 0;
	    	//预计金额服务额
	    	var servicesum = 0;
	    	//预计金额MA额
	    	var masum = 0;
	    	if(row.fcreverate){
	        	fcreverate = row.fcreverate;
	        }
	        if(row.fcsum){
	        	fcsum = row.fcsum;
	        }
	        if(row.productsum){
	        	productsum = row.productsum;
	        }
	        if(row.servicesum){
	        	servicesum = row.servicesum;
	        }
	        if(row.masum){
	        	masum = row.masum;
	        }
	        productsum = parseFloat(productsum);
	        servicesum = parseFloat(servicesum);
	        masum = parseFloat(masum);
	        fcsum = productsum + servicesum + masum;
	        if(contsum){
		        fcreverate = fcsum/contsum;
	        }else{
	        	fcreverate = 0;
	        }
	        fcsum = parseFloat(fcsum).toFixed(2);
	        fcreverate = parseFloat(fcreverate).toFixed(3);
	        var rowData = {productsum: productsum,servicesum: servicesum,masum: masum,fcreverate: fcreverate,fcsum: fcsum};
			grid.updateRow(row,rowData);
			var datas = grid.getData();
			var sumfcsum = 0;
			var sumproductsum = 0;
			var sumservicesum = 0;
			var summasum = 0;
			for(var i=0;i<datas.length;i++){
				var fcsum = datas[i].fcsum;
				if(fcsum){
					if(!isNaN(fcsum)){
						sumfcsum += parseFloat(fcsum);
					}
				}
				var productsum = datas[i].productsum;
				if(productsum){
					if(!isNaN(productsum)){
						sumproductsum += parseFloat(productsum);
					}
				}
				var servicesum = datas[i].servicesum;
				if(servicesum){
					if(!isNaN(servicesum)){
						sumservicesum += parseFloat(servicesum);
					}
				}
				var masum = datas[i].masum;
				if(masum){
					if(!isNaN(masum)){
						summasum += parseFloat(masum);
					}
				}
			}
			sumfcsum = parseFloat(sumfcsum).toFixed(2);
			sumproductsum = parseFloat(sumproductsum).toFixed(2);
			sumservicesum = parseFloat(sumservicesum).toFixed(2);
			summasum = parseFloat(summasum).toFixed(2);
			document.getElementById("totalfcsum").innerHTML = sumfcsum;
			document.getElementById("totalproductsum").innerHTML = sumproductsum;
			document.getElementById("totalservicesum").innerHTML = sumservicesum;
			document.getElementById("totalmasum").innerHTML = summasum;
	    	/* var contsum = nui.get("contsum").getValue();
	    	var row = grid.getRow(e.rowIndex);
	    	//确认比例
	    	var fcreverate = 0;
	    	//确认金额
	    	var fcsum = 0;
	    	if(row.fcreverate){
	        	fcreverate = row.fcreverate;
	        }
	        if(row.fcsum){
	        	fcsum = row.fcsum;
	        }
	        if(fcsumBegin != fcsum){
		        fcreverate = fcsum/contsum;
		        fcsum = fcreverate * contsum;
	        }
	        if(fcreverateBegin != fcreverate){
	        	fcsum = fcreverate * contsum;
		        fcreverate = fcsum/contsum;
	        }
	        fcreverate = parseFloat(fcreverate).toFixed(3);
	        fcsum = parseFloat(fcsum).toFixed(3);
	        //修改预计金额
	        //收入类型(0-无条件产品收入,3-有条件产品收入,4-OEM产品收入,1-定制项目服务收入,5-人力服务收入,2-维保服务(MA))
	        var revetype;
	        //合同金额
	        var contsum = nui.get("contsum").getValue();
	        //合同服务金额
	        var servmon = nui.get("servmon").getValue();
	        //合同产品金额
	        var prodmon = nui.get("prodmon").getValue();
	        //合同维保金额
	        var masum = nui.get("masum").getValue();
	        if(row.revetype){
	        	revetype = row.revetype;
	        }
	        if(row.productsum){
	        	productsum = row.productsum;
	        }
	        if(row.servicesum){
	        	servicesum = row.servicesum;
	        }
	        if(row.masum){
	        	masum = row.masum;
	        }
        	if(revetype.indexOf("0")!=-1||revetype.indexOf("3")!=-1||revetype.indexOf("4")!=-1){//选择有产品
        		if(!(revetype.indexOf("1")!=-1||revetype.indexOf("5")!=-1||revetype.indexOf("2")!=-1)){//只有产品
	        		productsum = fcsum;
	        		servicesum = 0;
	        		masum= 0;
	        		var rowData = {fcreverate: fcreverate,fcsum: fcsum,productsum: productsum,servicesum: servicesum,masum: masum};
					grid.updateRow(row,rowData);
	        		return;
	        	}
        	}
        	if(revetype.indexOf("1")!=-1||revetype.indexOf("5")!=-1){//选择有服务
        		if(!(revetype.indexOf("0")!=-1||revetype.indexOf("3")!=-1||revetype.indexOf("4")!=-1||revetype.indexOf("2")!=-1)){//只有服务
        			servicesum = fcsum;
        			productsum = 0;
	        		masum = 0;
	        		var rowData = {fcreverate: fcreverate,fcsum: fcsum,productsum: productsum,servicesum: servicesum,masum: masum};
					grid.updateRow(row,rowData);
        			return;
        		}
        	}
        	if(revetype.indexOf("2")!=-1){//选择MA
        		if(!(revetype.indexOf("0")!=-1||revetype.indexOf("3")!=-1||revetype.indexOf("4")!=-1||revetype.indexOf("1")!=-1||revetype.indexOf("5")!=-1)){//只有MA
        			masum = fcsum;
        			productsum = 0;
	        		servicesum = 0;
	        		var rowData = {fcreverate: fcreverate,fcsum: fcsum,productsum: productsum,servicesum: servicesum,masum: masum};
					grid.updateRow(row,rowData);
        			return;
        		}
        	}
        	if(revetype.indexOf("0")!=-1||revetype.indexOf("3")!=-1||revetype.indexOf("4")!=-1){//选择有产品
        		if(prodmon=="" || prodmon==null || prodmon==0){//合同产品额为空
        			alert("收入类型（产品）与合同（产品金额）信息不一致！");
    				if(revetype.indexOf("1")!=-1||revetype.indexOf("5")!=-1){//选择有服务
		        		if(servmon=="" || servmon==null || servmon==0){//合同服务额为空
		        			alert("收入类型（服务）与合同（服务金额）信息不一致！");
				        		if(masum=="" || masum==null || masum==0){//合同MA额为空
				        			alert("收入类型（MA）与合同（MA金额）信息不一致！");
				        		}else {//合同MA额不为空
				    				masum = parseFloat(masum/contsum*fcsum).toFixed(2); 
				        		}
		        		}else {//合同服务额不为空
		    				nui.get("servicesum").setValue(parseFloat(servmon/contsum*fcsum).toFixed(2));
				        	if(revetype.indexOf("2")!=-1){//选择MA
				        		if(masum=="" || masum==null || masum==0){//合同MA额为空
				        			alert("收入类型（MA）与合同（MA金额）信息不一致！");
				        		}else {//合同MA额不为空
				    				masum = parseFloat(masum/contsum*fcsum).toFixed(2); 
				        		}
				        	}
		        		}
		        	}
        		}else {//合同产品额不为空
    				productsum = parseFloat(prodmon/contsum*fcsum).toFixed(2);
    				if(revetype.indexOf("1")!=-1||revetype.indexOf("5")!=-1){//选择有服务
		        		if(servmon=="" || servmon==null || servmon==0){//合同服务额为空
		        			alert("收入类型（服务）与合同（服务金额）信息不一致！");
		        		}else {//合同服务额不为空
		    				servicesum = parseFloat(servmon/contsum*fcsum).toFixed(2);
				        	if(revetype.indexOf("2")!=-1){//选择MA
				        		if(masum=="" || masum==null || masum==0){//合同MA额为空
				        			alert("收入类型（MA）与合同（MA金额）信息不一致！");
				        		}else {//合同MA额不为空
				    				masum = parseFloat(masum/contsum*fcsum).toFixed(2); 
				        		}
				        	}
		        		}
		        	}
        		}
        	}else{//没有选择产品
				if(revetype.indexOf("1")!=-1||revetype.indexOf("5")!=-1){//选择有服务
	        		if(servmon=="" || servmon==null || servmon==0){//合同服务额为空
	        			alert("收入类型（服务）与合同（服务金额）信息不一致！");
			        		if(masum=="" || masum==null || masum==0){//合同MA额为空
			        			alert("收入类型（MA）与合同（MA金额）信息不一致！");
			        		}else {//合同MA额不为空
			    				masum = parseFloat(masum/contsum*fcsum).toFixed(2); 
			        		}
	        		}else {//合同服务额不为空
	    				servicesum = parseFloat(servmon/contsum*fcsum).toFixed(2);
			        	if(revetype.indexOf("2")!=-1){//选择MA
			        		if(masum=="" || masum==null || masum==0){//合同MA额为空
			        			alert("收入类型（MA）与合同（MA金额）信息不一致！");
			        		}else {//合同MA额不为空
			    				masum = parseFloat(masum/contsum*fcsum).toFixed(2); 
			        		}
			        	}
	        		}
	        	}else{//MA
	        		if(masum=="" || masum==null || masum==0){//合同MA额为空
	        			alert("收入类型（MA）与合同（MA金额）信息不一致！");
	        		}else {//合同MA额不为空
	    				masum = parseFloat(masum/contsum*fcsum).toFixed(2); 
	        		}
	        	}
        	}
	        var rowData = {fcreverate: fcreverate,fcsum: fcsum,productsum: productsum,servicesum: servicesum,masum: masum};
			grid.updateRow(row,rowData); */
	    }
		
        //标准方法接口定义
        function CloseWindow(action) {
            if (action == "close" && formCsContract.isChanged()) {
                if (confirm("数据被修改了，是否先保存？")) {
                    return false;
                }
            }
            if (window.CloseOwnerWindow) return window.CloseOwnerWindow(action);
            else window.close();            
        }
        
        //短信告知
        //显示短信通知页面
		function openMessage() {
			//默认通知人为-骆冉
			nui.get("messageEmpInfo").setValue(skbgtztel);//skbgtztel
			nui.get("messageEmpInfo").setText(skbgtzname);
			nui.get("userid").setValue(skbgtzuserid);
			//合同发起人
			var username = salename;
			//合同编号
			var contnum = nui.get("contnum").getValue();
			var messageInfo = username + "发起合同编号为" + contnum + "的收入记录异常说明：";
			nui.get("messageInfo").setValue(messageInfo);
	        var win = nui.get("win1");
	        win.showAtPos("center", "middle");
	    }
	    //隐藏窗口
	    function hideWindow() {
	        var win = nui.get("win1");
	        win.hide();
	    }
	    //确认发送
	    function goMessage(){
	    	var data = formmessage.getData();
	    	var messageMode = nui.get("messageMode").getValue();
			if(!messageMode){
				nui.alert("告知方式至少需要选择一种！");
				return;
			}
	    	nui.confirm("确认发送吗？","是否确认发送",
	    		function(action){
	    			if (action == "ok") {
	    				var messageTel = nui.get("messageEmpInfo").getValue();
	    				var messageName = nui.get("messageEmpInfo").getText();
	    				var messageInfo = nui.get("messageInfo").getValue();
	    				var userid = nui.get("userid").getValue();
	    				var json = nui.encode({"messageTel": messageTel,"messageName": messageName,"messageInfo": messageInfo,
	    				"messageMode": messageMode,"userid": userid});
				    	nui.get("goMesseageButton").setEnabled(false);
	    				formmessage.loading("发送中...");
	    				nui.ajax({
			        		url: "com.primeton.eos.ame_income.csGatherFc.gatherUpdateSendMessage.biz.ext",
			                data: json,
			                type: 'POST',
			                cache: false,
			                contentType: 'text/json',
			                success: function (o) {
			                	formmessage.unmask();
			                	o = nui.clone(o);
			                    if(o.backmessage == null && o.exceptionWX == null){
			                    	nui.alert("发送成功",null,function(){
			                    		hideWindow();
			                    	});
			                    }else{
			                    	nui.alert(o.resultMessage);
			                    }
		                    	nui.get("goMesseageButton").enable();
			                },
			                error: function (jqXHR, textStatus, errorThrown) {
			                    alert(jqXHR.responseText);
			                }
			        	});
	    			}
	    		}
	    	);
	    }
        //选择通知人
    	function selectOmEmployee(e){
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
                        	nui.get("userid").setValue(data.userid);
	                    	btnEdit.setText(data.empname); 
	                    	if(data.mobileno){
	                    		btnEdit.setValue(data.mobileno);
	                    	}else{
	                    		nui.alert("你选择的人员未设置手机号码！");
	                    	}
                        }
                    }

                }
            });
    	}
        
        //限制字数为200以下。_不使用
        function textNumbers(){
        	if(nui.get("messageInfo").getValue().length > 200){
        		//nui.alert("文字个数超过200了！");
        	}
        }
	</script>

</body>
</html>
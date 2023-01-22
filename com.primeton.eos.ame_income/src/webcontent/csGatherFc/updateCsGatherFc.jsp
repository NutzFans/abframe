<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<!-- 
  - Author(s): zhuyl
  - Date: 2016-10-31 09:43:46
  - Description:
-->
<head>
<title>更新收款预测信息</title>
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
	<div class="nui-fit">
		<form id="form" method="post">
			<input name="csContract.contractid" id="contractid" class="nui-hidden"/>
			<fieldset id="field1" style="border:solid 1px #aaa;padding:3px;width: 970px;">
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
			<fieldset id="field2" style="border:solid 1px #aaa;padding:3px;width: 970px;">
				<div id="datagrid1" class="nui-datagrid" style="width: 100%;height: auto;" dataField="csGatherFcs"
			    	url="com.primeton.eos.ame_income.csGatherFc.queryCsGahterByUpdate.biz.ext" multiSelect="true"
			    	onlyCheckSelection="true" allowCellEdit="true" allowCellSelect="true" oncellbeginedit="rowclick" 
			    	showPager="false" allowHeaderWrap="true" showSortIcon="true" showModified="true">
			    	<!-- oncellendedit="doCsGatherFcEnd" oncellbeginedit="doCsGatherFcBegin" -->
					<div property="columns">
						<div field="contnum" visible="false">合同编号</div>
						<div field="gatherno" width="57" headerAlign="center" align="center">收款次数</div>
						<div field="gathertype" width="70" headerAlign="center" align="left" renderer="dictGetGatherType">收款类型</div>
						<div field="gathertimedesc" width="110" headerAlign="center" align="left">收款确认时点</div>
						<div field="newyearmonth" width="80" headerAlign="center" dateFormat="yyyy-MM" align="left">预计收款年月
							<input property="editor" class="nui-monthpicker" inputStyle="text-align: left"/>
						</div>
						<div field="servicesum" width="80" dataType="currency" headerAlign="center" align="right" visible="true">预计金额<br/>服务额
						</div>
						<div field="productsum" width="80" dataType="currency" headerAlign="center" align="right" visible="true">预计金额<br/>产品额
						</div>
						<div field="fcsum" width="80" dataType="currency" headerAlign="center" align="right">预计收款金额</div>
						<div field="fcreverate" width="50" headerAlign="center" align="right" numberFormat="p1">比例</div>
						<div field="status" width="50" headerAlign="center" align="left" renderer="dictGetStatus">收款状态</div>
						<div field="billstatus" width="50" headerAlign="center" align="left" renderer="dictGetStatus1">收款开票状态</div>
						<div field="actsum" width="80" dataType="currency" headerAlign="center" align="right">实际收款金额(含税)</div>
						<div field="actsum2" width="80" dataType="currency" headerAlign="center" align="right">实际收款金额(不含税)</div>
						<div field="confirmday" width="80" headerAlign="center" align="center">实际收款日期</div>
					</div>
				</div>
				<div style="width:640px;height:25px;margin-left: 180px;float:left;">
					<table style="table-layout:fixed;">
						<tr>
							<td align="right" style="width: 144px;">总计：</td>
							<td id="totalservicesum" style="width: 72px;" align="right" ></td>
							<td style="width: 1px"></td>
							<td id="totalproductsum" style="width: 72px;" align="right" ></td>
							<td style="width: 1px"></td>
							<td id="totalfcsum" style="width: 72px;" align="right" ></td>
							<td id="totalfcreverate" style="width: 50px;" align="right" ></td>
							<td style="width: 100px;"></td>
							<td id="totalactsum" style="width: 74px;" align="right" ></td>
							<td style="width: 1px"></td>
							<td id="totalactsum2" style="width: 74px;" align="right" ></td>
						</tr>
					</table>
				</div>
			</fieldset>
		</form>
		<span style="color: red;font-weight: bold;">&nbsp;&nbsp;如果发现收款记录异常（如无效的收款记录、收款记录不完整、收款金额不准确等），请使用“收款记录异常情况申报”。</span>
		<br />
		&nbsp;&nbsp;<a class="nui-button" style="width: 140px" onclick="openMessage" id="openMessageButton" >收款记录异常情况申报</a>
	</div>
	<div style="text-align:center;padding:10px;" class="nui-toolbar">
		<a class="nui-button" onclick="onOk" style="width:60px;margin-right:20px;" id="sureButton">保存</a>
		<a class="nui-button" onclick="onCancel('cancel')" style="width:60px;" id="canelButton">关闭</a>
	</div>
		<div id="win1" class="nui-window" title="收款记录异常情况申报" style="width: 360px;height: 300px;" 
		    showMaxButton="true" showCollapseButton="true" showShadow="true"
		    showToolbar="false" showFooter="true" showModal="true" allowResize="true" allowDrag="true">
	    	<div style="padding:1px;">
	    		<form id="formmessage" method="post">
					<input id="userid" class="nui-hidden"/>
					<div style="padding:1px;">
						<table style="table-layout:fixed;">
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
								<td><input class="nui-textarea" id="messageInfo" style="width: 200px;height: 80px;" onclick="this.focus();this.select()" />
								</td>
							</tr>
							<tr>
								<td colspan="2"><span style="color: red;font-weight: bold;">请在告知内容中补充针对合同收款记录异常情况的具体描述。</span></td>
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
	  	var form = new nui.Form("form");
	  	//外包人员归属项目
	  	var datagrid1 = nui.get("datagrid1");
	  	//短信发送内容
	  	var formmessage = new nui.Form("formmessage");
	  	//合同销售名称
	  	var salename = "";
	  	//合同收款变更通知人名称
	  	var skbgtzname = "";
        //合同收款变更通知人电话
        var skbgtztel = "";
        //合同收款变更通知人userid
        var skbgtzuserid = "";
	  	datagrid1.on("drawcell", function (e) {
            var record = e.record,
	        column = e.column,
	        field = e.field,
	        value = e.value;
            //设置行样式
            if(field == "newyearmonth"){
            	if(record.status == 0 || record.status == 1){
	            	e.cellStyle = "background: yellow";
            	}
            }

        });
	  	
	  	//初始化
		function SetData(data){
			//告知方式初始化
			var messageModeData = [{"id": "1","text": "短信"},{"id": "2","text": "微信"}];
	  		nui.get("messageMode").setData(messageModeData);
	  		nui.get("messageMode").setValue("1,2");
			data = nui.clone(data);
			if(data.action == "edit"){
				var json = nui.encode({csContract: {contractid: data.contractid}});
				form.loading("数据加载中...");  
	        	nui.ajax({
	        		url: "com.primeton.eos.ame_income.csGatherFc.getCsContractCsGatherFcDetail.biz.ext",
	                data: json,
	                type: 'POST',
	                cache: false,
	                contentType: 'text/json',
	                success: function (o) {
	                	nui.parse();
	                	form.unmask();
	                	o = nui.clone(o);
	                    form.setData(o);
	                    form.isChanged(false);
	                    //合同销售名称赋值
	                    salename = o.csContract.salename;
	                    //合同收款变更通知人名称
	                    skbgtztel = o.csContract.skbgtztel;
	                    //合同收款变更通知人电话
	                    skbgtzname = o.csContract.skbgtzname;
	                    //合同收款变更通知人userid
	                    skbgtzuserid = o.csContract.skbgtzuserid;
	                    
	                    datagrid1.load({"contnum": data.contnum},function(){
	                    	//统计行
		                    var datas = datagrid1.getData();
							var sumfcsum = 0;
							var sumfcreverate = 0;
							var sumproductsum = 0;
							var sumservicesum = 0;
							var sumactsum = 0;
							var sumactsum2 = 0;
							for(var i=0;i<datas.length;i++){
								var fcsum = datas[i].fcsum;
								if(fcsum){
									if(!isNaN(fcsum)){
										sumfcsum += parseFloat(fcsum);
									}
								}
								var fcreverate = datas[i].fcreverate;
								if(fcreverate){
									if(!isNaN(fcreverate)){
										sumfcreverate += parseFloat(fcreverate);
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
								var actsum = datas[i].actsum;
								if(actsum){
									if(!isNaN(actsum)){
										sumactsum += parseFloat(actsum);
									}
								}
								var actsum2 = datas[i].actsum2;
								if(actsum2){
									if(!isNaN(actsum2)){
										sumactsum2 += parseFloat(actsum2);
									}
								}
							}
							sumfcsum = parseFloat(sumfcsum).toFixed(2);
							sumfcreverate = parseFloat(sumfcreverate * 100).toFixed(1);
							sumproductsum = parseFloat(sumproductsum).toFixed(2);
							sumservicesum = parseFloat(sumservicesum).toFixed(2);
							sumactsum = parseFloat(sumactsum).toFixed(2);
							sumactsum2 = parseFloat(sumactsum2).toFixed(2);
							document.getElementById("totalfcsum").innerHTML = sumfcsum;
							document.getElementById("totalfcreverate").innerHTML = sumfcreverate + " %";
							document.getElementById("totalproductsum").innerHTML = sumproductsum;
							document.getElementById("totalservicesum").innerHTML = sumservicesum;
							document.getElementById("totalactsum").innerHTML = sumactsum;
							document.getElementById("totalactsum2").innerHTML = sumactsum2;
	                    });
	                },
	                error: function (jqXHR, textStatus, errorThrown) {
	                    alert(jqXHR.responseText);
	                }
	        	});
			}
		}
		
		function rowclick(e){
			//状态不是未收款的都不可以修改
			if(e.record.status != 0 && e.record.status != 1){	
				cancelEditRow(e.record);
			}
		}
		
		//收款比例(编辑前)
	    var fcreverateBegin = 0;
	    //收款金额(编辑前)
		var fcsumBegin = 0;
		//编辑前
		function doCsGatherFcBegin(e){
			var row = datagrid1.getRow(e.rowIndex);
	    	if(row.fcreverate){
	        	fcreverateBegin = row.fcreverate;
	        }
	        if(row.fcsum){
	        	fcsumBegin = row.fcsum;
	        }
		}
		
		//编辑后
		function doCsGatherFcEnd(e){
			var contsum = nui.get("contsum").getValue();
	    	var row = datagrid1.getRow(e.rowIndex);
	    	//收款比例
	    	var fcreverate = 0;
	    	//收款金额
	    	var fcsum = 0;
	    	//预计金额产品额
	    	var productsum = 0;
	    	//预计金额服务额
	    	var servicesum = 0;
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
	        productsum = parseFloat(productsum);
	        servicesum = parseFloat(servicesum);
	        fcsum = productsum + servicesum;
	        if(contsum){
		        fcreverate = fcsum/contsum;
	        }else{
	        	fcreverate = 0;
	        }
	        fcsum = parseFloat(fcsum).toFixed(2);
	        fcreverate = parseFloat(fcreverate).toFixed(3);
	        var rowData = {productsum: productsum,servicesum: servicesum,fcreverate: fcreverate,fcsum: fcsum};
			datagrid1.updateRow(row,rowData);
			var datas = datagrid1.getData();
			var sumfcsum = 0;
			var sumfcreverate = 0;
			var sumproductsum = 0;
			var sumservicesum = 0;
			for(var i=0;i<datas.length;i++){
				var fcsum = datas[i].fcsum;
				if(fcsum){
					if(!isNaN(fcsum)){
						sumfcsum += parseFloat(fcsum);
					}
				}
				var fcreverate = datas[i].fcreverate;
				if(fcreverate){
					if(!isNaN(fcreverate)){
						sumfcreverate += parseFloat(fcreverate);
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
			}
			sumfcsum = parseFloat(sumfcsum).toFixed(2);
			sumfcreverate = parseFloat(sumfcreverate * 100).toFixed(1);
			sumproductsum = parseFloat(sumproductsum).toFixed(2);
			sumservicesum = parseFloat(sumservicesum).toFixed(2);
			document.getElementById("totalfcsum").innerHTML = sumfcsum;
			document.getElementById("totalfcreverate").innerHTML = sumfcreverate + " %";
			document.getElementById("totalproductsum").innerHTML = sumproductsum;
			document.getElementById("totalservicesum").innerHTML = sumservicesum;
		}
		
		//设置业务字典-收款类型
		function dictGetGatherType(e){
        	return nui.getDictText("AME_GATHERTYPE",e.value);
        }
        
        //设置业务字典-收款状态
        function dictGetStatus(e){
        	return nui.getDictText("AME_GATHERSTATUS",e.value);
        }
        function dictGetStatus1(e){
        	return nui.getDictText("MIS_GATHERBILL",e.value);
        }
		
		//关闭
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
        
        //保存
        function onOk(){
        	if(datagrid1.getChanges("modified",false).length == 0){
        		nui.alert("收款数据未作修改！无需保存！");
        		return;
        	}
        	if(form.validate()){
            	var changeRows = datagrid1.getChanges("modified",false); 
            	//预计收款年月不能小于当前时间的年月。
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
							nui.alert("修改的预计收款年月不能小于当前年月！");
							return;
						}
					}
				}
        		nui.confirm("确认保存吗？", "确定？",
	            function (action) {            
	                if (action == "ok") {
	                	//nui.get("sureButton").disable();
	                	var o = form.getData();
	                	var rows = datagrid1.getData();
	                	//修改了数据的收款
	                	
						o.csContract.csGatherFcs = changeRows;
						var contnum = o.csContract.contnum;
						for(var i = 0;i < o.csContract.csGatherFcs.length;i ++){
							//最初预计收款年月
							if(o.csContract.csGatherFcs[i].yearmonth){
								if(typeof(o.csContract.csGatherFcs[i].yearmonth) != "string"){
									var year = o.csContract.csGatherFcs[i].yearmonth.getFullYear();
					        		var month = o.csContract.csGatherFcs[i].yearmonth.getMonth() + 1;
					        		if(month < 10){
					        			month = "0" + month;
					        		}
					        		o.csContract.csGatherFcs[i].yearmonth = year + "" +  month;
								}else{
					        		var year = o.csContract.csGatherFcs[i].yearmonth.substr(0,4);
					        		var month = o.csContract.csGatherFcs[i].yearmonth.substr(4,2);
					        		o.csContract.csGatherFcs[i].yearmonth = year + "" +  month;
					        	}
							}else{
								//最初预计收款年月为空,最新预计收款年月不为空
								if(o.csContract.csGatherFcs[i].newyearmonth){
									if(typeof(o.csContract.csGatherFcs[i].newyearmonth) != "string"){
						        		var year = o.csContract.csGatherFcs[i].newyearmonth.getFullYear();
						        		var month = o.csContract.csGatherFcs[i].newyearmonth.getMonth() + 1;
						        		if(month < 10){
						        			month = "0" + month;
						        		}
						        		o.csContract.csGatherFcs[i].yearmonth = year + "" +  month;
						        	}else{
						        		var year = o.csContract.csGatherFcs[i].newyearmonth.substr(0,4);
						        		var month = o.csContract.csGatherFcs[i].newyearmonth.substr(4,2);
						        		o.csContract.csGatherFcs[i].yearmonth = year + "" +  month;
						        	}
								}
							}
							if(o.csContract.csGatherFcs[i].newyearmonth){
								if(typeof(o.csContract.csGatherFcs[i].newyearmonth) != "string"){
					        		var year = o.csContract.csGatherFcs[i].newyearmonth.getFullYear();
					        		var month = o.csContract.csGatherFcs[i].newyearmonth.getMonth() + 1;
					        		if(month < 10){
					        			month = "0" + month;
					        		}
					        		o.csContract.csGatherFcs[i].newyearmonth = year + "" +  month;
					        	}else{
					        		var year = o.csContract.csGatherFcs[i].newyearmonth.substr(0,4);
					        		var month = o.csContract.csGatherFcs[i].newyearmonth.substr(4,2);
					        		o.csContract.csGatherFcs[i].newyearmonth = year + "" +  month;
					        	}
							}
				        	
			        	}
	            		var json = nui.encode(o);
	            		nui.get("sureButton").disable();
	            		form.loading("保存中...");
	            		nui.ajax({
			        		url: "com.primeton.eos.ame_income.csGatherFc.updateCsGatherFc.biz.ext",
			                data: json,
			                type: 'POST',
			                cache: false,
			                contentType: 'text/json',
			                success: function (o) {
			                	form.unmask();
			                	o = nui.clone(o);
			                    if(o.csContract.exception == null){
			                    	nui.alert("保存成功",null,function(){
			                    		nui.get("sureButton").enable();
			                    		datagrid1.reload();
			                    	});
			                    }else{
			                    	nui.alert("保存失败");
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
		
		//显示短信通知页面
		function openMessage() {
			//默认通知人为-骆冉
			nui.get("messageEmpInfo").setValue(skbgtztel);
			nui.get("messageEmpInfo").setText(skbgtzname);
			nui.get("userid").setValue(skbgtzuserid);
			//合同发起人
			var username = salename;
			//合同编号
			var contnum = nui.get("contnum").getValue();
			var messageInfo = username + "发起合同编号为" + contnum + "的收款记录异常情况的说明如下：";
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
    	
	</script>
</body>
</html>
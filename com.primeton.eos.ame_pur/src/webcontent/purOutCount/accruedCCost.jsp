<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@page import="com.eos.data.datacontext.UserObject"%>
<%
	String contextPath=request.getContextPath();
 %>
<html>
<!-- 
  - Author(s): zyl
  - Date: 2016-07-18 09:56:35
  - Description:
-->
<head>
	<title>外包计提生成</title>
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
	<div class="nui-fit" >
		<div style="width: 1330px;height:100%;padding:0px;margin:0px;" id="form1">
			<input class="nui-hidden" name="criteria._expr[0]._property" value="year" />
			<input class="nui-hidden" name="criteria._expr[0]._value" id="year" />
			<input class="nui-hidden" name="criteria._expr[1]._property" value="month" />
			<input class="nui-hidden" name="criteria._expr[1]._value" id="month" />
			<input class="nui-hidden" name="criteria._expr[6]._property" value="startdate" />
			<input class="nui-hidden" name="criteria._expr[6]._value" id="startdate" />
			<input class="nui-hidden" name="criteria._expr[7]._property" value="enddate" />
			<input class="nui-hidden" name="criteria._expr[7]._value" id="enddate" />
			<fieldset id="field1" style="border:solid 1px #aaa;padding:3px;">
				<legend>计提筛选条件</legend>
				<div class="nui-toolbar" style="border-bottom:0;padding:0px;">
						<table style="width:100%;">
							<tr>
								<td align="right" style="width:100px;">计提月度：</td>
								<td style="width:100px;"><input id="premonth" required="false" class="nui-monthPicker" ondrawdate="onDrawDate" onvaluechanged="premonthchange" required="false" style="width:78px"/></td>
								<td align="right" style="width:100px;">所属事业部：</td>
								<td style="width: 120px;">
									<input class="nui-hidden" name="criteria._expr[2]._property" value="syb" />
									<input name="criteria._expr[2]._value" id="syb" required="false" class="nui-dictcombobox" onvaluechanged="selectsyb" dictTypeId="CONT_ORG" required="false" style="width:110px" showNullItem="true" />
								</td>
								<td align="right" style="width:100px;">项目：</td>
								<td>
									<input class="nui-hidden" name="criteria._expr[3]._property" value="projectno" />
									<input name="criteria._expr[3]._value" id="projectno" required="false" onbuttonclick="selectProject" class="nui-buttonedit" required="false" style="width:150px" allowInput="false"/>
								</td>
								<td align="right" style="width:100px;">供应商：</td>
								<td>
									<input class="nui-hidden" name="criteria._expr[4]._property" value="custid" />
									<input name="criteria._expr[4]._value" id="custid" required="false" onbuttonclick="selectSupplier" class="nui-buttonedit" required="false" style="width:150px" allowInput="false"/>
								</td>
								<td align="right" style="width:100px;">客户：</td>
								<td>
									<input class="nui-hidden" name="criteria._expr[5]._property" value="custid1" />
									<input name="criteria._expr[5]._value" id="custid1" required="false" onbuttonclick="selectMisCustinfo" class="nui-buttonedit" required="false" style="width:150px" allowInput="false"/>
								</td>
							</tr>
							<tr>
								<td align="right" colspan="2">是否记录最近计提截止日期：</td>
								<td><input id="isRecordPreEndDate" class="nui-checkbox" style="width:100px" /></td>
								<td align="right" colspan="2">是否判断最近计提截止日期：</td>
								<td><input id="isjudgePreEndDate" class="nui-checkbox" style="width:100px;" /></td>
							</tr>
							<tr>
				    			<td align="center" colspan="10">
				                    <a class="nui-button" id="search" iconCls="icon-search" onclick="search()">查询</a>
				                    <a class="nui-button" id="reset" iconCls="icon-reload" onclick="reset()">重置</a>	
				                </td>
				            </tr>
						</table>
				</div>
			</fieldset>
			<fieldset id="field2" style="border:solid 1px #aaa;padding:3px;">
				<legend>月度计提信息</legend>
				<div id="datagridPre" class="nui-datagrid" dataField="purpresettles" style="width: 1320px;height: auto;" 
				url="com.primeton.eos.ame_pur.outaccrued.queryManualPresettleList.biz.ext" showPager="false" 
				showSummaryRow="true" ondrawsummarycell="drawPreSum">
		            <div property="columns" >
		            	<div field="syb" width="95" align="left" headerAlign="center" allowSort="true" renderer="dictGetContOrg" >所属事业部</div>
		                <div field="custname1" width="175" headerAlign="center" allowSort="true" >客户名称</div>
		                <div field="projectno" headerAlign="center" allowSort="true" visible="false" >项目名称no</div>
		                <div field="projectname" width="175" headerAlign="center" allowSort="true" >项目名称</div>
		                
		                <div field="orgname" width="50" align="center" headerAlign="center" allowSort="true" >销售</div>
		                <div field="suppliersname" width="70" headerAlign="center" allowSort="true" >供应商简称</div>
		                <div field="accruedmoney" width="80" headerAlign="left" align="right" dataType="currency" allowSort="true" summaryType="sum" >计提金额(元)</div>
		                <div field="notaxmoney" width="90" headerAlign="left" align="right" dataType="currency" allowSort="true" summaryType="sum" >不含税金额(元)</div>
		                <div field="costtype" width="60" headerAlign="left" allowSort="true" renderer="dictGetCosttype" >成本类型</div>
		                <div field="contnum" width="80" headerAlign="left" allowSort="true" >销售合同编号</div>
		                <div field="outper" width="200" headerAlign="center" allowSort="true" >相关外包人员</div>
		                <div field="accruedstatus" width="60" align="left" headerAlign="left" allowSort="true" renderer="dictGetStatus" >计提状态</div>
		                <!-- <div field="startdate" width="80" align="center" headerAlign="left" allowSort="true" >计提开始日期</div>
		                <div field="enddate" width="80" align="center" headerAlign="left" allowSort="true" >计提结束日期</div> -->
		                <div field="premonth" width="60" align="center" headerAlign="center" allowSort="true" >计提月度</div>
		                <div field="accrueddate" width="auto" headerAlign="center" allowSort="true" dateFormat="yyyy-MM-dd hh:mm:ss" >计提时间</div>
		            </div>
		        </div>
			</fieldset>
			<fieldset id="field3" style="border:solid 1px #aaa;padding:3px;">
				<legend>可计提的外包人员信息</legend>
				<div id="datagridoutperson" class="nui-datagrid" style="width: 1320px;height: auto;" allowResize="false" dataField="outCounts" 
			    	url="com.primeton.eos.ame_pur.purOutCount.queryAccrued.biz.ext" 
			    	showPager="false" allowAlternating="false" 
			    	allowCellEdit="true" allowCellSelect="true" 
			    	editNextOnEnterKey="true" editNextRowCell="true" >
					<div property="columns">
						<div field="outperno" align="center" headerAlign="center" allowSort="true" visible="false">人员编号</div>
						<div field="syb" width="95" align="center" headerAlign="center" allowSort="true" renderer="dictGetBelongto">所属事业部</div>
						<div field="custid" align="center" headerAlign="center" allowSort="true" visible="false">供应商id</div>
						<div field="custname" headerAlign="center" allowSort="true" visible="false">供应商名称</div>
						<div field="suppliersname" width="83" headerAlign="center" allowSort="true">供应商简称</div>
						<div field="miscustname" width="200" headerAlign="center" allowSort="false">客户名称</div>
						<div field="projectno" align="center" headerAlign="center" allowSort="true" visible="false">服务项目no</div>
						<div field="projectName" width="200"  headerAlign="center" allowSort="false">项目名称</div>
						<div field="startdate" name="startdate" align="center" width="100" headerAlign="center" allowSort="false" dateFormat="yyyy-MM-dd" renderer="formatDate">服务开始日期</div>
						<div field="expenddate" align="center" width="100" headerAlign="center" allowSort="false" renderer="formatDate">预计结束日期</div>
						<div field="actenddate" align="center" width="100" headerAlign="center" allowSort="false" renderer="formatDate">实际结束日期</div>
						<div field="outpername" width="70" align="center" headerAlign="center" allowSort="true" renderer="getDetail">姓名</div>	
						<div field="price" width="80" align="right" dataType="currency" headerAlign="center" allowSort="true">最近价格(元)</div>
						<div field="costenddate" align="center" width="110" headerAlign="center" allowSort="false" renderer="formatDate">最近结算截止日期</div>
						<div field="accuenddate" align="center" width="110" headerAlign="center" allowSort="false" renderer="formatDate">最近计提确认截止日期</div>
					</div>
				</div>
			</fieldset>
		</div>
	</div>
	<div style="text-align:center;padding:10px;" class="nui-toolbar">
		<a class="nui-button" onclick="onOk" style="width:70px;margin-right:20px;" id="sureButton">计提处理</a>
		<a class="nui-button" onclick="onCancel('cancel')" style="width:60px;" id="canelButton">关闭</a>
	</div>
	
	<script type="text/javascript">
		nui.parse();
		var form = new nui.Form("form1");
		var datagridPre = nui.get("datagridPre");
		var datagridoutperson = nui.get("datagridoutperson");
		//默认判断最近计提截止日期
		nui.get("isjudgePreEndDate").setChecked(true);
		init();
    	function init(){
			var datenow = new Date();
			var year = datenow.getFullYear();
			var month = datenow.getMonth() + 1;
			nui.get("year").setValue(year);
			nui.get("month").setValue(month);
			var startdate = year + "-" + month + "-" + "01";
			nui.get("startdate").setValue(startdate);
			var premonthnew = new Date(year,month,1);
			var enddateday = (new Date(premonthnew.getTime()-1000*60*60*24)).getDate();
			var enddate = year + "-" + month + "-" + enddateday;
			nui.get("enddate").setValue(enddate);
			nui.get("premonth").setValue(year + "-" + month);
			//计提记录
			var jsonPre = form.getData();
    		datagridPre.sortBy("projectno","desc");
			datagridPre.load(jsonPre);
			month =(month<10 ? "0"+month:month);
			nui.get("month").setValue(month);
			//需要计提的外包人员信息
			var json = form.getData();
			json.year = year;
			json.month = month;
			json.custid = null;
			json.projectno = null;
			json.syb = null;
			json.custid1 = null;
			datagridoutperson.sortBy("outperno","desc");
			datagridoutperson.load(json);
		}
		
		
		//选择月度
		function premonthchange(e){
			var premonth = nui.get("premonth").getValue();
			var year = premonth.getFullYear();
			var month = premonth.getMonth() + 1;
			nui.get("year").setValue(year);
			nui.get("month").setValue(month);
			var datenow = new Date();
			var yearnow = datenow.getFullYear();
			var monthnow = datenow.getMonth() + 1;
			var startdate = year + "-" + month + "-" + "01";
			nui.get("startdate").setValue(startdate);
			var premonthnew = new Date(year,month,1);
			var enddateday = (new Date(premonthnew.getTime()-1000*60*60*24)).getDate();
			var enddate = year + "-" + month + "-" + enddateday;
			nui.get("enddate").setValue(enddate);
		}
		
		function onDrawDate(e) {
            var date = e.date;
            var d = new Date();
            if (date.getMonth() < d.getMonth()) {
                e.allowSelect = false;
            }
        }
		
		//选择项目筛选条件
        function selectProject(){
        	var btnEdit = this;
        	var startdate = nui.get("startdate").getValue();
        	var enddate = nui.get("enddate").getValue();
        	var monthstartdate = startdate;
			var monthenddate = enddate;
            nui.open({
                url:"<%=request.getContextPath() %>/ame_pur/outaccrued/PurOutAccruedSelectProject.jsp?syb=" + syb +"&monthstartdate=" + monthstartdate + "&monthenddate=" + monthenddate,
                title: "选择项目",
                width: 650,
                height: 400,
                ondestroy: function (action) {
                    if (action == "ok") {
                        var iframe = this.getIFrameEl();
                        var data = iframe.contentWindow.GetData();
                        data = nui.clone(data);    //必须
                        if (data) {
                            btnEdit.setValue(data.projectno);
                            btnEdit.setText(data.projectname);
                        }else{
                        	btnEdit.setValue();
                            btnEdit.setText();
                        }
                    }
                }
            });
        }
        
        //选择项目行编辑
        function selectProjectRow(e){
        	var btnEdit = this;
        	var startdate = nui.get("startdate").getValue();
        	var enddate = nui.get("enddate").getValue();
        	var monthstartdate = startdate;
			var monthenddate = enddate;
            nui.open({
                url:"<%=request.getContextPath() %>/ame_pur/outaccrued/PurOutAccruedSelectProject.jsp?syb=" + syb +"&monthstartdate=" + monthstartdate + "&monthenddate=" + monthenddate,
                title: "选择项目",
                width: 650,
                height: 400,
                ondestroy: function (action) {
                    if (action == "ok") {
                        var iframe = this.getIFrameEl();
                        var data = iframe.contentWindow.GetData();
                        data = nui.clone(data);    //必须
                        if (data) {
                        	var row = datagridoutperson.getSelected();
                        	btnEdit.setValue(data.projectname);
                        	btnEdit.setText(data.projectname);
                        	datagridoutperson.updateRow(row, {
	                            projectno: data.projectno,
	                            projectname: data.projectname
	                        });
	                        var row2 = datagridoutperson.getSelected();
                        }
                    }
                }
            });
        }
        
		//选择供应商
        function selectSupplier(){
        	var btnEdit = this;
        	nui.open({
                url:"<%=request.getContextPath() %>/ame_pur/outaccrued/PurOutAccruedSelectSupplier.jsp",
                title: "选择供应商",
                width: 850,
                height: 420,
                allowResize: false,
                ondestroy: function (action) {
                    if (action == "ok") {
                        var iframe = this.getIFrameEl();
                        var data = iframe.contentWindow.GetData();
                        data = nui.clone(data);    //必须
                        if (data) {
                            btnEdit.setValue(data.custid);
                            btnEdit.setText(data.custname);
                        }else{
                        	btnEdit.setValue();
                            btnEdit.setText();
                        }
                    }
                }
            });
        }
        
        //计提处理
        function onOk(){
        	//点击计提处理按钮,禁用计提处理按钮,计提成功后释放计提处理按钮
        	nui.get("sureButton").setEnabled(false);
        	var startdate = nui.get("startdate").getValue();
			var enddate = nui.get("enddate").getValue();
			var custid = nui.get("custid").getValue();
			var projectno = nui.get("projectno").getValue();
			var syb = nui.get("syb").getValue();
			var custid1 = nui.get("custid1").getValue();
			var year = nui.get("year").getValue();
			var month = nui.get("month").getValue();
			if(month.length!=2){
				month =(month<10 ? "0"+month:month);
			}
			//是否记录最近计提截止日期 "true"-记录,"false"-不记录 
			var isRecordPreEndDate = nui.get("isRecordPreEndDate").getValue();
			//是否判断最近计提截止日期 "true"-记录,"false"-不记录 
			var isjudgePreEndDate = nui.get("isjudgePreEndDate").getValue();
			var jsonPre = nui.encode({purPresettleManual: {startdate: startdate,enddate: enddate,
				custid: custid,projectno: projectno,syb: syb,custid1: custid1,year: year,month:month,
				isRecordPreEndDate: isRecordPreEndDate,isjudgePreEndDate: isjudgePreEndDate}});
            form.loading("计提处理中....");
            nui.ajax({
                url: "com.primeton.eos.ame_pur.purOutCount.handleAccrued.biz.ext",
                data: jsonPre,
                type: 'POST',
                cache: false,
                contentType: 'text/json',
                success: function (text) {
                	if(text.result == 0){
                		alert("计提成功!");
	                	var form = new nui.Form("#form1");
			            var json = form.getData();
			            datagridPre.sortBy("projectno","desc");
			            datagridPre.load(json);
			            //需要计提的外包人员信息
						json.startdate = nui.get("startdate").getValue();
						json.enddate = nui.get("enddate").getValue();
						json.custid = nui.get("custid").getValue();
						json.projectno = nui.get("projectno").getValue();
						json.syb = nui.get("syb").getValue();
						json.custid1 = nui.get("custid1").getValue();
						datagridoutperson.sortBy("outperno","desc");
						datagridoutperson.load(json,function(){
							form.unmask();
						});
					}else if(text.result == 3){
						var form = new nui.Form("form1");
						if(confirm("指定条件的计提数据已存在，是否将其覆盖？")){
							form.loading("计提处理中....");
							var jsonPre = nui.encode({purPresettleManual: {startdate: startdate,enddate: enddate,
								custid: custid,projectno: projectno,syb: syb,custid1: custid1,year: year,month:month,
								isRecordPreEndDate: isRecordPreEndDate,isjudgePreEndDate: isjudgePreEndDate,state:1}});
							nui.ajax({
								url:"com.primeton.eos.ame_pur.purOutCount.handleAccrued.biz.ext",
								data:jsonPre,
								type:"post",
								cache: false,
								contentType:"text/json",
								success:function(o){
									if(o.result == 0){
							    		alert("计提成功!");
							        	var form = new nui.Form("#form1");
							            var json = form.getData();
							            datagridPre.sortBy("projectno","desc");
							            datagridPre.load(json);
							            //需要计提的外包人员信息
										json.startdate = nui.get("startdate").getValue();
										json.enddate = nui.get("enddate").getValue();
										json.custid = nui.get("custid").getValue();
										json.projectno = nui.get("projectno").getValue();
										json.syb = nui.get("syb").getValue();
										json.custid1 = nui.get("custid1").getValue();
										datagridoutperson.sortBy("outperno","desc");
										datagridoutperson.load(json,function(){
											form.unmask();
										});
									}else{
										form.unmask();
										nui.alert("计提失败！");
									}
									nui.get("sureButton").setEnabled(true);
									form.unmask();
								}
							});
						}else{
							form.unmask();
							nui.get("sureButton").setEnabled(true);
						}
					}else{
						form.unmask();
						nui.alert("计提失败！");
					}
					nui.get("sureButton").setEnabled(true);
					form.unmask();
				}
            });
        }
        
        function dictGetBelongto(e){
        	return nui.getDictText('CONT_ORG',e.value);
        }
        
        //设置业务字典值-事业部
		function dictGetContOrg(e){
			return nui.getDictText('CONT_ORG',e.value);
		}
		
		//设置业务字典值-计提状态
		function dictGetStatus(e){
			return nui.getDictText('AME_ACCRUEDSTATUS',e.value);
		}
		
		//设置业务字典值-成本类型
		function dictGetCosttype(e){
			return nui.getDictText('AME_CONTCOSTTYPE',e.value);
		}
        
        function formatDate(e){
        	if(e.value != null){
        		/* var date = new Date(e.value);
        		var year = date.getFullYear();
        		var month = date.getMonth() + 1;
        		var day = date.getDate();
        		if(month < 10){
        			month = 0 + "" + month;
        		}
        		if(day < 10){
        			day = 0 + "" + day;
        		}
        		var nowday = year + "-" + month + "-" + day;
    			return nowday; */
    			return nui.formatDate(nui.parseDate(e.value),"yyyy-MM-dd");
        	}else{
        		return;
        	}
        }
        
        //查询
        function search(){
        	/* var addHeight = 0;
			if($("#datagridPre").get(0).scrollWidth > $("#datagridPre").get(0).offsetWidth)
				addHeight = 18;
			var height1 = ($("#datagridPre").get(0).scrollHeight + addHeight + 110) +"px";
			var h = "height: " + height1;
			nui.get("datagridPre").setStyle(h); */
			
        	//相关计提记录
        	var month = nui.get("month").getValue();
            if(month.length!=2){
				month =(month<10 ? "0"+month:month);
				nui.get("month").setValue(month);
			}
        	var form = new nui.Form("#form1");
            var json = form.getData();
            datagridPre.sortBy("projectno","desc");
            datagridPre.load(json,function (text){
            	if(text.total == 0){
            		//nui.alert("没有查询到相关计提数据");
            	}
            });
            //需要计提的外包人员信息
			json.year = nui.get("year").getValue();
			json.month = month;
			json.custid = nui.get("custid").getValue();
			json.projectno = nui.get("projectno").getValue();
			json.syb = nui.get("syb").getValue();
			json.custid1 = nui.get("custid1").getValue();
			json.startdate = null;
			json.enddate = null;
			datagridoutperson.sortBy("outperno","desc");
			datagridoutperson.load(json);
        }
        
        //重置查询条件
        function reset(){
            var form = new nui.Form("#form1");
            form.reset();
            var datenow = new Date();
			var year = datenow.getFullYear();
			var month = datenow.getMonth() + 1;
			month =(month<10 ? "0"+month:month);
			var startdate = year + "-" + month + "-" + "01";
			nui.get("year").setValue(year);
			nui.get("month").setValue(month);
			nui.get("startdate").setValue(startdate);
			var premonthnew = new Date(year,month,1);
			var enddateday = (new Date(premonthnew.getTime()-1000*60*60*24)).getDate();
			var enddate = year + "-" + month + "-" + enddateday;
			nui.get("enddate").setValue(enddate);
			nui.get("premonth").setValue(year + "-" + month);
			var json = form.getData();
            datagridPre.sortBy("projectno","desc");
            datagridPre.load(json);
            
            //需要计提的外包人员信息
			json.year = nui.get("year").getValue();
			json.month = nui.get("month").getValue();
			json.custid = nui.get("custid").getValue();
			json.projectno = nui.get("projectno").getValue();
			json.syb = nui.get("syb").getValue();
			json.custid1 = nui.get("custid1").getValue();
			datagridoutperson.sortBy("outperno","desc");
			datagridoutperson.load(json);
        }
        
		//标准方法接口定义
        function CloseWindow(action) {            
            if (action == "close" && form.isChanged()) {
                if (confirm("数据被修改了，是否先保存？")) {
                    return false;
                }
            }
            window.opener.location.href=window.opener.location.href;
            window.close();
            /* if (window.CloseOwnerWindow) return window.CloseOwnerWindow(action);
            else window.close(); */            
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
        
        function selectMisCustinfo(e) {
	        var btnEdit = this;	
	        var lookupUrl = "/contract/contract/MisCustinfo_lookup.jsp";
	        nui.open({
				url:"<%=request.getContextPath()%>"+lookupUrl,
				title: "选择客户",
				width: 600,
				height: 400,
				ondestroy: function (action) {
					if (action == "ok") {
						var iframe = this.getIFrameEl();
						var data = iframe.contentWindow.GetData();
						data = nui.clone(data);    //必须
						if (data) {
			                btnEdit.setValue(data.id);
			                btnEdit.setText(data.text);
						}
					}
				}
			});
		}
		
		function drawPreSum(e){ 
			if (e.field == "accruedmoney") {
	            e.cellHtml = "<div align='right'><b>" + e.cellHtml + "</b></div>";
	        }
	        if (e.field == "notaxmoney") {
	            e.cellHtml = "<div align='right'><b>" + e.cellHtml + "</b></div>";
	        }
		}
	</script>
</body>
</html>
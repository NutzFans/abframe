<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="com.eos.data.datacontext.UserObject" %>
<%@ page import="commonj.sdo.DataObject" %>
<%@ page import="java.util.Map" %>
<%@ page import="java.util.HashMap" %>
<%@ page import="java.util.List" %>
<%@ page import="java.util.ArrayList" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<!-- 
  - Author(s): zhuyl
  - Date: 2016-10-26 18:21:08
  - Description:
-->
<head>
<title>合同收款记录查询</title>
<meta http-equiv="content-type" content="text/html; charset=UTF-8" />
<script src="<%= request.getContextPath() %>/common/nui/nui.js" type="text/javascript"></script>
</head>
<body>
	<!-- 
		1、查询条件：收款状态(可多选),预计收款年月，签署单位
		2、查询列表：合同编号，签署单位，合同名称，合同金额，收款次数编号，收款状态，预计收款年月，预计收款金额(含税)，实际收款金额(含税)，实际收款日期
		3、按预计收款年月顺序排序
		4、列表下提供统计行，针对数字字段进行统计
		5、合同编号、收款次数编号提供链接，分别链接对应详细信息
		6、提供“更新收款预测信息”按钮，针对状态为未收款的记录，调用“更新合同收款预测”
		7、该功能开放给销售人员
	 -->
	<div class="nui-panel" title="合同收款记录查询" width="auto">
		<div style="width:100%;height:20;padding:0px;margin:0px;"id="csGatherFcForm">
			<div class="nui-toolbar" style="border-bottom:0;padding:0px;">
				<table style="width:100%;">
					<tr>
						<td align="right" style="width: 100px;"><span>合同编号：</span></td>
		            	<td align="left">
						    <input name="criteria._expr[1]._value" class="nui-textbox" onenter="onKeyEnter" style="width:150px;"/>
						    <input class="nui-hidden" name="criteria._expr[1]._property" value="contnum"/>
						    <input class="nui-hidden" name="criteria._expr[1]._op" value="like"/>
						    <input class="nui-hidden" name="criteria._expr[1]._likeRule" value="all"/>
						</td>
						<td align="right" style="width: 100px;"><span>合同名称：</span></td>
						<td align="left">
							<input name="criteria._expr[10]._value" class="nui-textbox" onenter="onKeyEnter" style="width:150px;"/>
						    <input class="nui-hidden" name="criteria._expr[10]._property" value="projectname"/>
						    <input class="nui-hidden" name="criteria._expr[10]._op" value="like"/>
						    <input class="nui-hidden" name="criteria._expr[10]._likeRule" value="all"/>
						</td>
						<td align="right" style="width: 150px;"><span>受益部门：</span></td>
						<td align="left">
						     <input id="orgid2"  name="criteria._expr[3]._value" style="width:190px;" class="nui-combobox" 
							textField="orgname" valueField="orgseq" dataField="orgs" showNullItem="true" allowInput="true"/>
			            	<input class="nui-hidden" name="criteria._expr[3]._property" value="orgseq"/>
					        <input class="nui-hidden" name="criteria._expr[3]._op" value="like"/>
					        <input class="nui-hidden" name="criteria._expr[3]._likeRule" value="end"/>
					        <input class="nui-hidden" name="criteria._expr[4]._property" value="orgid"/>
					        <input class="nui-hidden" name="criteria._expr[4]._op" value="in"/>
					        <input class="nui-hidden" name="criteria._expr[4]._value" id="orgids1"/>
						</td>
					</tr>
					<tr>
						<td align="right" style="width: 100px;"><span>项目编号：</span></td>
						<td align="left">
							<input name="criteria._expr[9]._value" class="nui-textbox" onenter="onKeyEnter" style="width:150px;"/>
						    <input class="nui-hidden" name="criteria._expr[9]._property" value="projectno"/>
						    <input class="nui-hidden" name="criteria._expr[9]._op" value="like"/>
						    <input class="nui-hidden" name="criteria._expr[9]._likeRule" value="all"/>
						</td>
						<td align="right" style="width: 100px;"><span>签署单位：</span></td>
						<td align="left">
							<input name="criteria._expr[2]._value" class="nui-textbox" onenter="onKeyEnter" style="width:150px;"/>
						    <input class="nui-hidden" name="criteria._expr[2]._property" value="custname"/>
						    <input class="nui-hidden" name="criteria._expr[2]._op" value="like"/>
						    <input class="nui-hidden" name="criteria._expr[2]._likeRule" value="all"/>
						</td>
						<td align="right" style="width: 150px;"><span>预计收款年月范围：</span></td>
						<td align="left">
						    <input class="nui-monthpicker" name="criteria._expr[6]._min" style="width:90px;" id="newyearmonthMin" allowInput="true"/>
						     -
						    <input class="nui-monthpicker" name="criteria._expr[6]._max" style="width:90px;" id="newyearmonthMax" allowInput="true"/>
						    <input class="nui-hidden" name="criteria._expr[6]._property" value="newyearmonth"/>
						    <input class="nui-hidden" name="criteria._expr[6]._op" value="between"/>
					        <input class="nui-hidden" name="criteria._expr[6]._pattern" value="yyyyMM"/>
						</td>
					</tr>
					<tr>
						<td align="right" style="width: 100px;"><span>收款状态：</span></td>
						<td align="left">
							<input class="nui-dictcombobox" name="criteria._expr[5]._value" id="status" style="width: 150px;" dictTypeId="AME_GATHERSTATUS" multiSelect="true" showNullItem="true" />
						    <input class="nui-hidden" name="criteria._expr[5]._property" value="status"/>
						    <input class="nui-hidden" name="criteria._expr[5]._op" value="in"/>
						</td>
						<td align="right" style="width: 100px;"><span>收款开票状态：</span></td>
						<td align="left">
							<input class="nui-dictcombobox" name="criteria._expr[0]._value" id="billstatus" style="width: 150px;" dictTypeId="MIS_GATHERBILL" multiSelect="true" showNullItem="true" />
						    <input class="nui-hidden" name="criteria._expr[0]._property" value="billstatus"/>
						    <input class="nui-hidden" name="criteria._expr[0]._op" value="in"/>
						</td>
						<td align="right" style="width: 150px;"><span>实际收款日期范围：</span></td>
		            	<td align="left">
					        <input class="nui-datepicker" name="criteria._expr[7]._min" id="startTime" style="width:90px"/>
					         -
					        <input class="nui-datepicker" name="criteria._expr[7]._max" id="endTime" style="width:90px"/>
					        <input class="nui-hidden" name="criteria._expr[7]._property" value="maconfirmday"/>
						    <input class="nui-hidden" name="criteria._expr[7]._op" value="between"/>
					        <input class="nui-hidden" name="criteria._expr[7]._pattern" value="yyyy-MM-dd"/>
					        <input class="nui-hidden" name="criteria._expr[8]._value" value=""/>
					        <input class="nui-hidden" name="criteria._expr[8]._property" value="orgseq"/>
						    <input class="nui-hidden" name="criteria._expr[8]._op" value="like"/>
					        <input class="nui-hidden" name="criteria._expr[8]._likeRule" value="end"/>
						</td>
					</tr>
					<tr>
		    			<td align="center" colspan="15">
                            <a class="nui-button" id="search" iconCls="icon-search" onclick="search()">查找</a>
                            <a class="nui-button" id="reset" iconCls="icon-reload" onclick="reset()">重置</a>
                            <a class="nui-button" onclick="exportCsReves" iconCls="icon-download" style="width:150px;" id="exportButton">导出合同收款记录</a>
                       		<form name="viewlist1" id="viewlist1" action="com.primeton.eos.ame_common.ameExportCommon.flow" method="post">
								<input type="hidden" name="_eosFlowAction" value="action0" filter="false"/>
								<input type="hidden" name="downloadFile" filter="false"/>
								<input type="hidden" name="fileName" filter="false"/>
							</form>
                       </td>
	                </tr>
	            </table>           
	        </div>
	    </div>
	    <div class="nui-toolbar" style="border-bottom:0;padding:0px;">
            <table style="width:100%;">
            	<tr>
                    <td style="width:20%;">
                        <a class="nui-button" id="updateBtn" iconCls="icon-edit" onclick="update()">更新收款计划</a>
                        <a class="nui-button" id="startBtn" iconCls="icon-edit" onclick="updateCsGahter()">微信提醒更新收款计划</a>
                        <a class="nui-button" id="startBtn" iconCls="icon-goto" onclick="startIncome()">发起收款开票流程</a>
                         <a class="nui-button" id="startBtn" iconCls="icon-goto" onclick="startCancelBadDept()">发起坏账/减值处理审批流程</a>
                    </td>
                </tr>
             </table>           
        </div>
	    <div id="csGatherFcGrid" class="nui-datagrid" style="width:100%;height:350px;" allowResize="true" dataField="csGatherFcs" showSummaryRow="true" ondrawsummarycell="doCsGatherFcSum"
	    	url="com.primeton.eos.ame_income.csGatherFc.queryCsGahterFcList.biz.ext" sizeList="[10,20,50,100]"  multiSelect="true"
	    	frozenStartColumn="0" frozenEndColumn="5" allowSortColumn="true" ondrawcell="ondrawCsGatherFcGridcell" allowAlternating="true">
			<div property="columns">
				<div type="checkcolumn" width="25"></div>
				<div field="reveid" width="0" >预估主键</div>	
				<div field="org" width="110" align="center" headerAlign="center" renderer="dictOrg" allowSort="true">事业部</div>	
				<div field="salename" width="70" align="center" headerAlign="center" allowSort="true">受益销售</div> 
				<div field="contnum" width="70" align="center" headerAlign="center" allowSort="true" renderer="detailCont">合同编号</div> 
				<div field="projectname" width="180" align="center" headerAlign="center" allowSort="true" renderer="renderprojectname">合同项目名称</div>
				<div field="custname" width="200" align="left" headerAlign="center" allowSort="true">签署单位</div> 
				<div field="contsum" width="100" align="right" headerAlign="center" allowSort="true" dataType="currency" summaryType="sum">合同金额</div>
				<div field="gatherno" width="60" align="center" headerAlign="center" allowSort="true" renderer="detailGather">收款次数</div>
				<div field="status" width="80" align="center" headerAlign="center" allowSort="true" renderer="dictstatus">收款状态</div>
				<div field="billstatus" width="80" align="center" headerAlign="center" allowSort="true" renderer="dictstatus1">收款开票状态</div>
				<div field="newyearmonth" width="85" align="center" headerAlign="center" allowSort="true">预计收款年月</div>
				<div field="fcsum" width="120" align="right" headerAlign="center" allowSort="true" dataType="currency" summaryType="sum">预计收款金额(含税)</div>	
				<div field="actsum" width="110" align="right" headerAlign="center" allowSort="true" dataType="currency" summaryType="sum">已收款金额</div>	
				<div field="maconfirmday" width="80" align="center" headerAlign="center" allowSort="true">实际收款日期</div>
				<div field="projectno" width="90" align="center" headerAlign="center" allowSort="true" renderer="detailProj">项目编号</div>
				<div field="lastupdate" width="85" align="center" headerAlign="center" allowSort="true">最近更新日期</div>
				<div field="lastupdator" width="85" align="center" headerAlign="center" allowSort="true">最近更新人</div>	
			</div>
		</div>
	</div>
	
	<script type="text/javascript">
		nui.parse();
		var csGatherFcForm = new nui.Form("#csGatherFcForm");
		var csGatherFcGrid = nui.get("csGatherFcGrid");
		init();
		
		function init(){
			<% 
	    		UserObject user = (UserObject)session.getAttribute("userObject");
	    		String nowuserid = user.getUserId();
	    		String nowusername = user.getUserName();
	    	%>
	    	var userid = "<%=nowuserid %>";
	    	
	    	//初始化有权的机构
			//code:对应功能编码，map：对于机构的查询条件
			var json = {"code":"HTSKJLCX","map":{"property":"status","op":"=","value":"running"}};
				nui.ajax({
				url:"com.primeton.eos.ame_auth.ame_auth.getownorg1.biz.ext",
				data:json,
				type:'POST',
				contentType:'text/json',
				success:function(text){
					if(text.orgs){
						if(text.orgs.length==0){
							// 没有有权的机构时只能查销售为自己的数据
							nui.getbyName("criteria._expr[3]._value").setValue("<%=nowusername %>");
				    		nui.getbyName("criteria._expr[3]._value").setEnabled(false);
						}
						nui.get("orgid2").setData(text.orgs);
						var isall;
						for(var i=0;i<text.orgs.length;i++){
							if(text.orgs[i].orgid == "1"){
								isall = "1";
								break;
							}
						}
						//如果拥有全公司的权限就取消部门限制
						if(isall == "1"){
	        				nui.get("orgids1").setValue("");
						}else{
							nui.get("orgids1").setValue(text.orgids);
						}
					}else{
						// 没有有权的机构时只能查销售为自己的数据
						nui.getbyName("criteria._expr[3]._value").setValue("<%=nowusername %>");
				    	nui.getbyName("criteria._expr[3]._value").setEnabled(false);
					}
					search();
				}
			});
		}
		
		<%--3、选择指定的收款记录信息，点击“收款预测更新催促”按钮，向收款记录的合同受益人发送微信催促信息，信息如下：
		**，你好！客户***的合同“”(编号2016-S102)的第“4-3”次收款预计金额为****，预计收款年月为201704，现已逾期，请更新预计收款年月！
		4、说明：以上是逾期的提醒，如果是当月的，后面部分为“请确定是否需要更新预计收款年月” --%>
		function updateCsGahter(){
		    var rows = csGatherFcGrid.getSelecteds();
				if(rows==null||rows==""){
					nui.alert("请选择数据后再进行操作！");
					return;
				}
			if(confirm("是否确认催促？")){
				var nowDate = new Date();
		        var nowDateYear = nowDate.getFullYear();
		        var nowDateMonth = nowDate.getMonth() + 1;
		        if(nowDateMonth < 10){
		        	nowDateMonth = "0" + nowDateMonth;
		        }
				var nowDateValue = nowDateYear + "" + nowDateMonth;
				for(var a = 0;a<rows.length;a++){
					var row = rows[a];
					var newyearmonth = row.newyearmonth;
					if(parseInt(newyearmonth) > parseInt(nowDateValue)){
						alert("更新催促中有数据的最新预计收款年月比当前年月大，请检查后再进行该操作");
		            	return;
					}
					if(newyearmonth == "null" || newyearmonth =="" || newyearmonth==null){
						alert("更新催促中有数据的最新预计收款年月不合法，请检查后再进行该操作");
		            	return;
					}
					var status = row.status;
					if(status != "0" && status != "4"){
						alert("更新催促中有数据的收款状态不合法，请检查后再进行该操作");
		            	return;
					}
				}
				csGatherFcForm.loading("预测更新微信催促处理中...");
				var funcName = "sendCsGahter";	
	            var json = nui.encode({"csFcs":rows,"funcName":funcName,"nowDateValue":nowDateValue});
	    		nui.ajax({
	    			url: "com.primeton.eos.ame_income.csReveForecast.sendWX.biz.ext",
			        type: "post",
			        data: json,
			        cache: false,
			        contentType: 'text/json',
			        success: function (o) {
			     		if(o.result==1){
			     			alert("催促成功！");
			     			csGatherFcForm.unmask();
			     		}else{
			     			alert("催促失败！");
			     			csGatherFcForm.unmask();
			     		}
			     	}
				});
			}else{
				return;
			}
			
		}
		
		//汇总行
		function doCsGatherFcSum(e){        	
            if (e.field == "contsum" || e.field == "fcsum" || e.field == "actsum") {
                e.cellHtml = "<div align='right'><b>" + e.cellHtml + "</b></div>";
            }
        }
        
        //设置业务字典-收款状态
        function dictstatus(e){
        	return nui.getDictText("AME_GATHERSTATUS",e.value);
        }
        
        function dictstatus1(e){
        	return nui.getDictText("MIS_GATHERBILL",e.value);
        }
        //设置业务字典-事业部
        function dictOrg(e) {
			return nui.getDictText('CONT_ORG',e.value);//设置业务字典值
		}
        
        //合同收入记录详情
        function detailGather(e){
        	return "<a href='javascript:void(0)' onclick='detailGather1();' title='点击查看收款明细记录'>" + e.value + "</a>";
        }
        function detailGather1(){
	 		var selectRow = csGatherFcGrid.getSelected();
			var executeUrl = "<%=request.getContextPath() %>/ame_income/csGatherFc/detailCsGatherFc.jsp?id=" + selectRow.gatherid;
		    var iTop = (window.screen.availHeight-30-550)/2; //获得窗口的垂直位置;
			var iLeft = (window.screen.availWidth-10-1200)/2; //获得窗口的水平位置;
			window.open(executeUrl, "合同收款记录详细信息","fullscreen=1" );
	    }
	    
	    //合同详细信息
        function detailCont(e){
        	return "<a href='javascript:void(0)' onclick='detailCont1("+e.record.contractid+");' title='点击查看合同信息'>" + e.value + "</a>";
        }
        function detailCont1(contractid){
			var executeUrl = "<%=request.getContextPath() %>/contract/contract/contractView.jsp?contractid=" + contractid;
			window.open(executeUrl, "合同查看", "fullscreen=1");
	    }
	    
	    //项目详细信息
        function detailProj(e){
        	if(e.value){
	        	if(e.value.split(',').length == 1){
		        	return "<a href='javascript:void(0)' onclick='detailProj1();' title='点击查看项目信息'>" + e.value + "</a>";
	        	}else{
	        		return e.value;
	        	}
        	}
        }
        function detailProj1(){
	 		var selectRow = csGatherFcGrid.getSelected();
	 		var executeUrl = "/default/project/rdproject/projectDetail.jsp?projid=" + selectRow.projectid1;
			window.open(executeUrl);
	    }
	    
	    //查询
	    function search(){
	    	nui.get("search").disable();
			nui.get("reset").disable();
			nui.get("exportButton").disable();
	    	var data = csGatherFcForm.getData();
	    	//当预计收款年月不为空时修改预计收款年月格式
	    	var min = nui.get("newyearmonthMin").getValue();
	    	if(min){
		    	minyear = min.getFullYear();
		    	minmonth = min.getMonth();
		    	data.criteria._expr[6]._min = minyear+""+minmonth;
	    	}
	    	var max = nui.get("newyearmonthMax").getValue();
	    	if(max){
		    	maxyear = max.getFullYear();
		    	maxmonth = max.getMonth() + 1;
	    		data.criteria._expr[6]._max = maxyear+""+maxmonth;
	    	}
			csGatherFcGrid.sortBy("status","asc");
    		csGatherFcGrid.load(data,function(){
				nui.get("search").enable();
				nui.get("reset").enable();
				nui.get("exportButton").enable();
    		});
	    }
	    
	    //重置
	    function reset(){
			csGatherFcForm.reset();
			init();
	    }
	    
	    //回车触发
	    function onKeyEnter(e){
	    	search();
	    }
	    
	    //新增、编辑
	    function addOrEdit(){
	    	var rows = csGatherFcGrid.getSelecteds();
			if(rows.length<1){
				alert("请选中一条合同记录!");
			}else if (rows.length>1){
				alert("只能选中一条记录！");
			}else{
				var row = csGatherFcGrid.getSelected();
	            nui.open({
	                url: "<%=request.getContextPath() %>/ame_income/csGatherFc/showCsContAndCsGatherFc.jsp",
	                title: "新增/编辑合同收款记录", 
					width: 1100,
		            height: 520,
	                onload: function () {
	                    var iframe = this.getIFrameEl();
	                    var data = {contractid: row.contractid };
		              	iframe.contentWindow.SetData(data);
	                },
	                ondestroy: function (action) {
	                    csGatherFcGrid.reload();
	                }
	            });
			}
	    }
	    
	    //更新合同收款
	    function update(){
	    	//nui.alert("开发中...");
	    	var row = csGatherFcGrid.getSelected();
    		if (row) {
	      		nui.open({
		            url: "<%=request.getContextPath() %>/ame_income/csGatherFc/updateCsGatherFc.jsp",
		            title: "更新合同收款预测信息",
		            width: 1000,
		            height: 450,
		            onload: function () {
						var iframe = this.getIFrameEl();
						var data = {action: "edit",contractid: row.contractid,contnum: row.contnum };
						iframe.contentWindow.SetData(data);
					},
					ondestroy: function (action) {
						if(action=="ok"){
							grid.reload();
		                }
					}
				});
			} else {
				nui.alert("请选中一条记录","提示");
			}
	    }
	    
	    //导出收款
	    function exportCsReves(){
	    	//nui.alert("开发中...");
	    	//return;
	    	nui.confirm("是否确认导出合同收款记录？", "确定？",
            function (action) {
            	if(action=='ok'){
            		var json = csGatherFcForm.getData();
            		var min = nui.get("newyearmonthMin").getValue();
			    	if(min){
				    	minyear = min.getFullYear();
				    	minmonth = min.getMonth();
				    	json.criteria._expr[6]._min = minyear+""+minmonth;
			    	}
			    	var max = nui.get("newyearmonthMax").getValue();
			    	if(max){
				    	maxyear = max.getFullYear();
				    	maxmonth = max.getMonth() + 1;
			    		json.criteria._expr[6]._max = maxyear+""+maxmonth;
			    	}
			    	csGatherFcForm.loading("合同收款记录导出中...");
					nui.ajax({
		    			url: "com.primeton.eos.ame_income.csGatherFc.exportCsGatherFc.biz.ext",
				        type: "post",
				        data: json,
				        cache: false,
				        contentType: 'text/json',
				        success: function (o) {
				     		csGatherFcForm.unmask();
				     		var filePath = o.downloadFile;
				        	var fileName = "合同收款记录";
				        	var myDate = new Date();
				        	var year = myDate.getFullYear();
				        	var month = myDate.getMonth()+1;
				        	var day = myDate.getDate();
				        	var hours = myDate.getHours();
				        	var minutes = myDate.getMinutes();
				        	var seconds = myDate.getSeconds();
				        	var curDateTime = year;
				        	if(month>9){
								curDateTime = curDateTime + "" + month;
							}else{
								curDateTime = curDateTime + "0" + month;
								}
				        	if(day>9){
								curDateTime = curDateTime + day;
							}else{
								curDateTime = curDateTime + "0" + day;
								}
							if(hours>9){
								curDateTime = curDateTime + hours;
							}else{
								curDateTime = curDateTime + "0" + hours;
								}
							if(minutes>9){
								curDateTime = curDateTime + minutes;
							}else{
								curDateTime = curDateTime + "0" + minutes;
								}
							if(seconds>9){
								curDateTime = curDateTime + seconds;
							}else{
								curDateTime = curDateTime + "0" + seconds;
							}
							fileName = fileName + "_" + curDateTime + ".xls";
							var frm = document.getElementById("viewlist1");
				        	frm.elements["downloadFile"].value = filePath;
				        	frm.elements["fileName"].value = fileName;
						    frm.submit();
				        },
				        error: function () {
				        	alert("error");
				        }
					});
            		
            	}
            });   
	    }
	    
	    //发起收款开票流程
	    function startIncome(){
	    	<%-- nui.alert("开发中...");
	    	return; 
			如果上开票流程需要放开此注释，将上面两行注释掉。--%>
			var row = csGatherFcGrid.getSelected();
			if(row){
				nui.open({
					url:"<%=request.getContextPath() %>/ame_income/gatherFcBillingProcess/gatherFcBillingCreate.jsp?contnum=" + row.contnum,
					title: '',
		            width: 1120,
		            height: 565,
		            onload: function () {
		            },
		            ondestroy: function (action) {
		            	if(action == "ok"){
				            grid.reload();
		            	}
		       	 	}
				});
				<%--window.location="<%=request.getContextPath() %>/ame_income/gatherFcBillingProcess/gatherFcBillingCreate.jsp?contnum=" + row.contnum;--%>
			}else{
				nui.alert("请选择一条记录","提示");
			}
			
		}
		   //发起坏账核销流程
	    function startCancelBadDept(){
	    	<%-- nui.alert("开发中...");
	    	return; 
			如果上开票流程需要放开此注释，将上面两行注释掉。--%>
			var row = csGatherFcGrid.getSelected();
			if(row){
				if(row.status=='0'){
					nui.open({
					url:"<%=request.getContextPath() %>/contract/cancelBadDebts/creatCancelBadDebts.jsp?contnum=" + row.contnum,
					title: '',
		            width: 1120,
		            height: 565,
		            onload: function () {
		            },
		            ondestroy: function (action) {
		            	if(action == "ok"){
				            grid.reload();
		            	}
		       	 	}
				});
				
				}
				else{
				
				nui.alert("只有未收款才能发起坏账核销","提示")
				
				}
			
			}
			
			else{
				nui.alert("请选择一条记录","提示");
			}
			
		}
		function ondrawCsGatherFcGridcell(e){
			var record = e.record,
	        column = e.column,
	        field = e.field,
	        value = e.value;
	        var nowDate = new Date();
	        var nowDateYear = nowDate.getFullYear();
	        var nowDateMonth = nowDate.getMonth() + 1;
	        if(nowDateMonth < 10){
	        	nowDateMonth = "0" + nowDateMonth;
	        }
	        var nowDateValue = nowDateYear + "" + nowDateMonth;
            //设置行样式   状态为未收款，预计收款年月小于当前月标记为红颜色FF99CC，预计收款年月为当前月标记为黄颜色FFFF99。
        	if(record.status == "0"){
            	if(parseInt(record.newyearmonth) < parseInt(nowDateValue)){
            		e.rowStyle = "background-color: #FF99CC";
            	}else if(parseInt(record.newyearmonth) == parseInt(nowDateValue)){
            		e.rowStyle = "background-color: #FFFF99";
            	}
            }
		}
	</script>
</body>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>	
<%@ page import="com.eos.data.datacontext.UserObject" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<!-- 
  - Author(s): wanglinqiong
  - Date: 2016-05-13 15:11:04
  - Description:
-->
<head>
<title>收入预估列表查询</title>
<meta http-equiv="content-type" content="text/html; charset=UTF-8" />
<script src="<%= request.getContextPath() %>/common/nui/nui.js" type="text/javascript"></script>
</head>
<body>
	<div  class="mini-panel" title="合同收入记录查询" width="auto">
		<div style="width:100%;height:20;padding:0px;margin:0px;"id="form1">
			<div class="nui-toolbar" style="border-bottom:0;padding:0px;">
				<table style="width:100%;">
					<tr>
						<td align="right"><span>受益部门：</span></td>
						<td align="left">
							 <input id="orgid2"  name="criteria._expr[1]._value" style="width:162px;" class="nui-combobox" 
							textField="orgname" valueField="orgseq" dataField="orgs" showNullItem="true" allowInput="true"/>
			            	<input class="nui-hidden" name="criteria._expr[1]._property" value="orgseq"/>
					        <input class="nui-hidden" name="criteria._expr[1]._op" value="like"/>
					        <input class="nui-hidden" name="criteria._expr[1]._likeRule" value="end"/>
					        <input class="nui-hidden" name="criteria._expr[0]._property" value="orgid"/>
					        <input class="nui-hidden" name="criteria._expr[0]._op" value="in"/>
					        <input class="nui-hidden" name="criteria._expr[0]._value" id="orgids1"/>
						</td>
						<td align="right"><span>合同编号：</span></td>
		            	<td align="left">
						    <input name="criteria._expr[2]._value" class="nui-textbox" style="width:162px;"/>
						    <input class="nui-hidden" name="criteria._expr[2]._property" value="contnum"/>
						    <input class="nui-hidden" name="criteria._expr[2]._op" value="like"/>
						    <input class="nui-hidden" name="criteria._expr[2]._likeRule" value="all"/>
						</td>
						<td align="right"><span>客户：</span></td>
						<td align="left">
						    <input name="criteria._expr[6]._value" class="nui-textbox" style="width:162px;" />
						    <input class="nui-hidden" name="criteria._expr[6]._property" value="custname"/>
						    <input class="nui-hidden" name="criteria._expr[6]._op" value="like"/>
						    <input class="nui-hidden" name="criteria._expr[6]._likeRule" value="all"/>
						</td>
					</tr>
					<tr>
						<td align="right"><span>合同名称：</span></td>
						<td align="left">
						    <input name="criteria._expr[3]._value" class="nui-textbox" style="width:162px;"/>
						    <input class="nui-hidden" name="criteria._expr[3]._property" value="projectname"/>
						    <input class="nui-hidden" name="criteria._expr[3]._op" value="like"/>
						    <input class="nui-hidden" name="criteria._expr[3]._likeRule" value="all"/>
						</td>
						<td align="right"><span>收入确认状态：</span></td>
		            	<td align="left">
		            		<input class="nui-dictcombobox" dictTypeId="AME_REVESTATUS" name="criteria._expr[4]._value" multiSelect="true" style="width:162px" showNullItem="true"/>
		            		<input class="nui-hidden" name="criteria._expr[4]._property" value="status"/>
					        <input class="nui-hidden" name="criteria._expr[4]._op" value="in"/>
						</td> 
						<td align="right"><span>收入确认类型：</span></td>
						<td align="left">
						    <input name="criteria._expr[5]._value" class="nui-dictcombobox" dictTypeId="AME_REVETYPE" style="width:162px;" showNullItem="true" nullItemText=""/>
						    <input class="nui-hidden" name="criteria._expr[5]._property" value="revetype"/>
						    <input class="nui-hidden" name="criteria._expr[5]._op" value="like"/>
						    <input class="nui-hidden" name="criteria._expr[5]._likeRule" value="all"/>
						</td>
					</tr>
					<tr>
						<td align="right"><span>最新预计收入确认年月：</span></td>
						<td align="left">
						    <input name="criteria._expr[7]._min" class="nui-monthpicker" style="width:80px;" id="newyearmonth1" allowInput="true"/>-<input name="criteria._expr[7]._max" class="nui-monthpicker" style="width:80px;" id="newyearmonth2" allowInput="true"/>
						    <input class="nui-hidden" name="criteria._expr[7]._property" value="newyearmonth"/>
						    <input class="nui-hidden" name="criteria._expr[7]._op" value="between"/>
						</td>
						<td align="right"><span>实际确认日期 ：</span></td>
		            	<td align="left">
					        <input class="nui-datepicker" name="criteria._expr[8]._min" id="startTime" style="width:100px"/>-<input class="nui-datepicker" name="criteria._expr[8]._max" id="endTime" style="width:100px"/>
					        <input class="nui-hidden" name="criteria._expr[8]._property" value="maconfirmday"/>
						    <input class="nui-hidden" name="criteria._expr[8]._op" value="between"/>
					        <input class="nui-hidden" name="criteria._expr[8]._pattern" value="yyyy-MM-dd"/>
					        <input class="nui-hidden" name="criteria._expr[9]._value" value=""/>
					        <input class="nui-hidden" name="criteria._expr[9]._property" value="orgseq"/>
						    <input class="nui-hidden" name="criteria._expr[9]._op" value="like"/>
					        <input class="nui-hidden" name="criteria._expr[9]._likeRule" value="end"/>
						</td>
						<td align="right"><span>新合同收入类型：</span></td>
						<td align="left">
						    <input name="criteria._expr[10]._value" class="nui-dictcombobox" dictTypeId="AME_NEWTYPE" style="width:162px;" showNullItem="true" nullItemText=""  multiSelect="true"/>
						    <input class="nui-hidden" name="criteria._expr[10]._property" value="newtype"/>
						    <input class="nui-hidden" name="criteria._expr[10]._op" value="in"/>
						</td>
					</tr>
					<tr>
		    			<td align="center" colspan="6">
                            <a class="nui-button" id="search" iconCls="icon-search" onclick="search()">查找</a>
                            <a class="nui-button" id="reset" iconCls="icon-reload" onclick="reset">重置</a>
                            <a class="nui-button" onclick="exportCsReves" iconCls="icon-download"  id="exportButton">导出合同收入记录</a>
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
<!-- 2、查询条件：业务单元
7、事业部人员进入，能够控制数据权限(权限控制到事业部，业务单元暂时还没有)
8、提供数据导出Excel功能 -->
		<div class="nui-toolbar" style="border-bottom:0;padding:0px;">
            <table style="width:100%;">
            	<tr>
                    <td style="width:20%;">
                        <a class="nui-button" id="updateBtn" iconCls="icon-edit" onclick="updateIncome()">更新收入计划</a>
                        <a class="nui-button" id="startBtn" iconCls="icon-edit" onclick="updateCsReve()">微信提醒更新收入计划</a>
                        <a class="nui-button" id="startBtn" iconCls="icon-goto" onclick="startIncome()">发起收入确认流程</a>
                       	<!-- 待开发 
                        <a class="nui-button" id="requestBtn" iconCls="icon-goto" onclick="requestVote()">请求开票</a>
                        -->
                    </td>
                </tr>
             </table>           
        </div>
	    <div id="datagrid1" class="nui-datagrid" style="width:100%;height:350px;" allowResize="true" dataField="csReveForecasts" showSummaryRow="true" ondrawsummarycell="doCsReveSum"
	    url="com.primeton.eos.ame_income.csReveForecast.queryCsReveForeCastList.biz.ext" sizeList="[10,20,50,100,200,500,1000,10000]"  multiSelect="true" frozenStartColumn="0" frozenEndColumn="4"
	    ondrawcell="ondrawCsGatherFcGridcell">
			<div property="columns">
				<div type="checkcolumn" width="25"></div>
				<div field="reveid" width="0" >预估主键</div>	
				<div field="org" width="95" align="center" headerAlign="center" renderer="dictOrg" allowSort="true">事业部</div>	
				<div field="salename" width="70" align="center" headerAlign="center" allowSort="true">受益销售</div>	
				<div field="contnum" width="70" align="center" headerAlign="center" allowSort="true" renderer="detailCont">合同编号</div> 
				<div field="custname" width="150" align="left" headerAlign="center">签署客户</div>			
				<div field="projectname" width="180" headerAlign="center" renderer="renderprojectname">合同项目名称</div>
				<div field="contsum" width="100" align="right"  headerAlign="center" dataType="currency" summaryType="sum" currencyUnit="￥">合同金额</div>
				<div field="reveno" width="80" align="center"  headerAlign="center" renderer="detailReve">收入确认次数</div>
				<div field="status" width="100" align="center" headerAlign="center" renderer="dictstatus">目前确认状态</div>		
				<div field="newyearmonth" width="85" align="center"  headerAlign="center">预计确认年月</div>
				<div field="fcsum2" width="140" align="right" headerAlign="center" dataType="currency" summaryType="sum" currencyUnit="￥">预计确认金额（不含税）</div>	
				<div field="actsum2" width="140" align="right" headerAlign="center" dataType="currency" summaryType="sum" currencyUnit="￥">实际确认金额（不含税）</div>	
				<div field="fcsum" width="140" align="right" headerAlign="center" dataType="currency" summaryType="sum" currencyUnit="￥">预计确认金额（含税）</div>	
				<div field="actsum" width="140" align="right" headerAlign="center" dataType="currency" summaryType="sum" currencyUnit="￥">实际确认金额（含税）</div>	
				<div field="maconfirmday" width="80" align="center" headerAlign="center" >实际确认日期</div>	
				<div field="contractid" width="0">合同主键</div>	
				<div field="projectno" width="100" renderer="detailProj" headerAlign="center">项目编号</div>
				<div field="projectname1" width="0" headerAlign="center">项目名称</div>
				<div field="projectid1" width="0" >项目id</div>
				<div field="lastupdate" width="85" align="center" headerAlign="center" allowSort="true">最近更新日期</div>
				<div field="lastupdator" width="85" align="center" headerAlign="center" allowSort="true">最近更新人</div>	
				<div field="newtype" width="120" align="center" headerAlign="center" renderer="newtype">新合同确认类型</div>
			</div>
		</div>
	</div>
	<script type="text/javascript">
		/**供应商查询*/
		var form = new nui.Form("#form1");
    	nui.parse();
    	var grid = nui.get("datagrid1");
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
			var json = {"code":"queryCsRevecast","map":{"property":"status","op":"=","value":"running"}};
			
			nui.get("search").disable();
			nui.get("reset").disable();
			nui.get("exportButton").disable();
    		//初始化事业部
			nui.ajax({
                url: "com.primeton.eos.ame_auth.ame_auth.getownorg1.biz.ext",
                type: "post",
                cache: false,
                data:json,
                contentType: 'text/json',
                success: function (text) {
                	if(text.orgs){
                		if(text.orgs.length==0){
							// 没有有权的机构时只能查销售为自己的数据
							nui.getbyName("criteria._expr[1]._value").setValue("<%=nowusername %>");
				    		nui.getbyName("criteria._expr[1]._value").setEnabled(false);
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
	    				//最新预计收入确认年月初始化为当前
	    				var nowDate = new Date();
	    				var nowYearStartMonth;
	    				var nowYear = nowDate.getFullYear();
	    				nui.get("newyearmonth1").setValue(nowYear+"-01");
						nui.get("newyearmonth2").setValue(new Date());
						var newyearmonth2 = nui.get("newyearmonth2").getText();
						var data = form.getData();
						data.criteria._expr[7]._max = newyearmonth2.substring(0,4)+""+newyearmonth2.substring(5,7);
						data.criteria._expr[7]._min = nowYear+"01";
						grid.sortBy("contnum","asc");
			    		grid.load(data,function(){
							nui.get("search").enable();
							nui.get("reset").enable();
							nui.get("exportButton").enable();
			    		});
                	}else{
                		// 没有有权的机构时只能查销售为自己的数据
						nui.getbyName("criteria._expr[1]._value").setValue("<%=nowusername %>");
				    	nui.getbyName("criteria._expr[1]._value").setEnabled(false);
	    				//最新预计收入确认年月初始化为当前
	    				var nowYear = new Date().getFullYear();
	    				nui.get("newyearmonth1").setValue(nowYear+"-01");
						nui.get("newyearmonth2").setValue(new Date());
						var newyearmonth2 = nui.get("newyearmonth2").getText();
						var data = form.getData();
						data.criteria._expr[7]._max = newyearmonth2.substring(0,4)+""+newyearmonth2.substring(5,7);
						data.criteria._expr[7]._min = nowYear+"01";
	    				grid.sortBy("contnum","asc");
			    		grid.load(data,function(){
							nui.get("search").enable();
							nui.get("reset").enable();
							nui.get("exportButton").enable();
			    		});
                	}
	    		}
	    	});
		}
		function dictOrg(e) {
			return nui.getDictText('CONT_ORG',e.value);//设置业务字典值
		}
		function dictproof(e) {
			return nui.getDictText('MIS_INCOMECONV',e.value);//设置业务字典值
		}
		function dictmonth(e) {
			return nui.getDictText('AME_MONTHPERIOD',e.value);//设置业务字典值
		}
		function dictstatus(e) {
			if((e.value == "2" || e.value == "3") && e.record.processinstid != null){
				return "<a href='javascript:void(0)' onclick='checkDictstatus();' title='点击查看流程图'>" + nui.getDictText('AME_REVESTATUS',e.value) + "</a>";
			}else{
				return nui.getDictText('AME_REVESTATUS',e.value);//设置业务字典值
			}
		}
		function newtype(e) {
			return nui.getDictText('AME_NEWTYPE',e.value);//设置业务字典值
		}
		function checkDictstatus(e){
			var selectRow = grid.getSelected();
			var processInstID = selectRow.processinstid;
    		var url = "<%=request.getContextPath() %>/bps/wfclient/task/processinstView.jsp";
    		var title = "流程图查看";
    		var width=1000;
		    nui.open({
				url: url,
				title: title,
				width: width,
				height: 550,
				onload: function () {
					var iframe = this.getIFrameEl();
					if(iframe.contentWindow.initData) {
						iframe.contentWindow.initData({"processInstID": processInstID});
					}
				},
				ondestroy: function (action){
				}
			});
		}
		
		function renderprojectname(e) {
			if(e.value){
				return e.value;
			}
		}
		function doCsReveSum(e){        	
            if (e.field == "contsum" || e.field == "fcsum2" ||e.field == "actsum2" || e.field == "fcsum" ||e.field == "actsum") {
                e.cellHtml = "<div align='right'><b>" + e.cellHtml + "</b></div>";
            }
        }
		
		function search() {
			nui.get("search").disable();
			nui.get("reset").disable();
			nui.get("exportButton").disable();
			var form = new nui.Form("#form1");
			var data = form.getData(); 
			//数据库确认年月格式为int类型，monthpicker类型是date类型，所以要转换
			if(!(nui.get("newyearmonth1").getText()==""||nui.get("newyearmonth1").getText()==null||
				nui.get("newyearmonth2").getText()==""||nui.get("newyearmonth2").getText()==null)){
				var newyearmonth1 = nui.get("newyearmonth1").getText();
				var newyearmonth2 = nui.get("newyearmonth2").getText();
				data.criteria._expr[7]._min = newyearmonth1.substring(0,4)+""+newyearmonth1.substring(5,7);
				data.criteria._expr[7]._max = newyearmonth2.substring(0,4)+""+newyearmonth2.substring(5,7);
			}
		  	grid.load(data,function(){
				nui.get("search").enable();
				nui.get("reset").enable();
				nui.get("exportButton").enable();
    		}); //datagrid加载数据
		}
		
		function reset(){
			var form = new nui.Form("#form1");
			form.reset();
			init();
		}
        //合同详细信息
        function detailCont(e){
        	return "<a href='javascript:void(0)' onclick='detailCont1();' title='点击查看合同信息'>" + e.value + "</a>";
        }
        function detailCont1(){
	 		var selectRow = grid.getSelected();
			var executeUrl = "<%=request.getContextPath() %>/contract/contract/contractView.jsp?contractid=" + selectRow.contractid;
			window.open(executeUrl, "合同查看", "fullscreen=1");
	    }
	    //合同收入记录详情
        function detailReve(e){
        	return "<a href='javascript:void(0)' onclick='detailReve1();' title='点击查看收入记录'>" + e.value + "</a>";
        }
        function detailReve1(){
	 		var selectRow = grid.getSelected();
			var executeUrl = "/default/ame_income/csReveForecast/detailCsReveForecast.jsp?id=" + selectRow.reveid;
		    var iTop = (window.screen.availHeight-30-550)/2; //获得窗口的垂直位置;
			var iLeft = (window.screen.availWidth-10-1200)/2; //获得窗口的水平位置;
			window.open(executeUrl, "合同收入记录详细信息","fullscreen=1" );//"height=550, width=1200,top="+iTop+",left="+iLeft+",resizable=yes"
	    }
	    
	    //项目详细信息
        function detailProj(e){
        	/* if(e.value){
	        	return "<a href='javascript:void(0)' onclick='detailProj1();' title='点击查看项目信息'>" + e.value + "</a>";
        	} */
        	if(e.value){
	        	if(e.value.split(',').length == 1){
		        	return "<a href='javascript:void(0)' onclick='detailProj1();' title='点击查看项目信息'>" + e.value + "</a>";
	        	}else{
	        		return e.value;
	        	}
        	}
        }
        function detailProj1(){
	 		var selectRow = grid.getSelected();
	 		var executeUrl = "/default/project/rdproject/projectDetail.jsp?projid=" + selectRow.projectid1;
			window.open(executeUrl);
	    }
	    
	    //导出合同收入记录
        function exportCsReves(){
        	nui.confirm("是否确认导出合同收入记录？", "确定？",
            function (action) {
            	if(action=='ok'){
            		var json = form.getData();
            		if(!(nui.get("newyearmonth2").getText()==""||nui.get("newyearmonth2").getText()==null)){
		        		var newyearmonth1 = nui.get("newyearmonth1").getText();
						var newyearmonth2 = nui.get("newyearmonth2").getText();
						json.criteria._expr[7]._min = newyearmonth1.substring(0,4)+""+newyearmonth1.substring(5,7);
						json.criteria._expr[7]._max = newyearmonth2.substring(0,4)+""+newyearmonth2.substring(5,7);
					}
					nui.ajax({
		    			url: "com.primeton.eos.ame_income.csReveForecast.exportCsReveForecast.biz.ext",
				        type: "post",
				        data: json,
				        cache: false,
				        contentType: 'text/json',
				        success: function (o) {
				     		nui.unmask();
				     		var filePath = o.downloadFile;
				        	var fileName = "合同收入记录";
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
        
        function updateIncome(){
			var row = grid.getSelected();
			if(row){
				nui.open({
		            url: "<%=request.getContextPath() %>/ame_income/csContract/csContractUpdateIncome.jsp",
		            title: "更新收入确认信息",
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
						/* if(action=="saveSuccess"){
		                	nui.alert("保存成功");
		                } */
					}
				});
			}else{
				nui.alert("请选择一条记录","提示");
			}
		}
		
		//发起收入确认流程
		function startIncome(){
			var row = grid.getSelected();
			if(row){
				nui.open({
					url: "<%=request.getContextPath() %>/ame_income/reveConfirmProcess/creatReveConfirmProcess.jsp?id=" + row.contnum,
	                title: "发起收入确认流程", 
					width: 1100,
		            height: 520,
		            onload: function () {
	                },
	                ondestroy: function (action) {
	                }
				});
				<%--window.location="<%=request.getContextPath() %>/ame_income/reveConfirmProcess/creatReveConfirmProcess.jsp?id=" + row.contnum;--%>
			}else{
				nui.alert("请选择一条记录","提示");
			}
		}
		
		//针对已经过期的收入预测记录背景显示为浅红色，当月的收入预测记录背景显示为淡黄色，增加显示最近修改时间和修改人
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
		
		//选择指定的收入记录信息，点击“收入预测更新催促”按钮，向收入记录的合同受益人发送微信催促信息，信息如下：
		//**，你好！客户***的合同“”(编号2016-S102)的第“2-1”次收入确认预计金额为****，预计确认年月为201705，现已逾期，请重新更新收入确认预计年月！
		//4、说明：以上是逾期的提醒，如果是当月的，后面部分为“请确定是否需要更新收入确认预计年月”
		function updateCsReve(){
		   var rows = grid.getSelecteds();
			if(rows==null||rows==""){
					nui.alert("请选择数据后再进行操作！");
					return;
				}
			if(confirm("是否确认催促？")){
				
				for(var a = 0;a<rows.length;a++){
					var row = rows[a];
					var status = row.status;
					if(status != "0"){
						alert("更新催促中有数据不合法，请检查后再进行该操作");
		            	return;
					}
				}
				form.loading("预测更新微信催促处理中...");
				var nowDate = new Date();
		        var nowDateYear = nowDate.getFullYear();
		        var nowDateMonth = nowDate.getMonth() + 1;
		        if(nowDateMonth < 10){
		        	nowDateMonth = "0" + nowDateMonth;
		        }
				var nowDateValue = nowDateYear + "" + nowDateMonth;
				var funcName = "sendCsReve";	
	            var json = nui.encode({"csReves":rows,"funcName":funcName,"nowDateValue":nowDateValue});
	    		nui.ajax({
	    			url: "com.primeton.eos.ame_income.csReveForecast.sendWX.biz.ext",
			        type: "post",
			        data: json,
			        cache: false,
			        contentType: 'text/json',
			        success: function (o) {
			     		if(o.result==1){
			     			alert("催促成功！");
			     			form.unmask();
			     		}else{
			     			alert("催促失败！");
			     			form.unmask();
			     		}
			     	}
				});
			}else{
				return;
			}
		}
  </script>
</body>
</html>
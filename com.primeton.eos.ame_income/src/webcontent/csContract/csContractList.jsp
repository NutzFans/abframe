<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>	
<%@page import="com.eos.foundation.eoscommon.ConfigurationUtil"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<!-- 
  - Author(s): zhuyl
  - Date: 2016-08-09 15:06:13
  - Description:
-->
<head>
	<title>销售合同查询</title>
	<meta http-equiv="content-type" content="text/html; charset=UTF-8" />
	<script src="<%= request.getContextPath() %>/common/nui/nui.js" type="text/javascript"></script>
</head>
<body>
	<div class="nui-fix">
		<div class="mini-panel" title="我的销售合同" style="width: auto">
			<div style="width:100%;height:100%;padding:0px;margin:0px;" id="form1">
				<div class="nui-toolbar" style="border-bottom:0;padding:0px;">
					<table style="width:100%;">
						<tr>
							<td align="right"><span>合同编号：</span></td>
			            	<td align="left">
			            		<input name="criteria._expr[0]._value" onenter="onKeyEnter" class="nui-textbox" style="width:100px;"/>
			            		<input class="nui-hidden" name="criteria._expr[0]._property" value="contnum"/>
			            		<input class="nui-hidden" name="criteria._expr[0]._op" value="like"/>
			            		<input class="nui-hidden" name="criteria._expr[0]._likeRule" value="all"/>
							</td>
							<td align="right"><span>客户名称：</span></td>
			            	<td align="left">
			            		<input name="criteria._expr[1]._value" onenter="onKeyEnter" class="nui-textbox" style="width:100px;"/>
			            		<input class="nui-hidden" name="criteria._expr[1]._property" value="misCustinfo.custname"/>
			            		<input class="nui-hidden" name="criteria._expr[1]._op" value="like"/>
			            		<input class="nui-hidden" name="criteria._expr[1]._likeRule" value="all"/>
							</td> 
							<td align="right"><span>合同名称：</span></td>
			            	<td align="left">
			            		<input name="criteria._expr[2]._value" onenter="onKeyEnter" class="nui-textbox" style="width:100px;"/>
			            		<input class="nui-hidden" name="criteria._expr[2]._property" value="projectname"/>
			            		<input class="nui-hidden" name="criteria._expr[2]._op" value="like"/>
			            		<input class="nui-hidden" name="criteria._expr[2]._likeRule" value="all"/>
							</td> 
							<td align="right"><span>签订日期：</span></td>
			            	<td align="left">
			            		<input name="criteria._expr[3]._value" onenter="onKeyEnter" class="nui-datepicker" style="width:100px;"/>
			            		<input class="nui-hidden" name="criteria._expr[3]._property" value="signdate"/>
							</td> 
						</tr>
						<tr>
							<td align="right"><span>状态：</span></td>
			            	<td align="left">
			            		<input name="criteria._expr[4]._value" onenter="onKeyEnter" class="nui-dictcombobox" dictTypeId="CS_CONTRACTTYPE" shownullitem="true" style="width:100px;" id="csContractTypeStatus"/>
							    <input class="nui-hidden" name="criteria._expr[4]._property" value="status"/>
							</td>
							<td align="right"><span>类型：</span></td>
			            	<td align="left">
			            		<input name="criteria._expr[5]._value" onenter="onKeyEnter" class="nui-dictcombobox" dictTypeId="MIS_CONTRACTTYPE" shownullitem="true" style="width:100px;"/>
							    <input class="nui-hidden" name="criteria._expr[5]._property" value="contracttype"/>
							</td>  
						</tr>
					    <tr>
			    			<td align="center" colspan="7">
		                        <a class="nui-button" id="search" iconCls="icon-search" onclick="search()">查找</a>
		                        <a class="nui-button" id="reset" iconCls="icon-reload" onclick="reset">重置</a>	
		                   </td>
		                </tr>
		            </table>           
		        </div>
		    </div>
		    <div style="width:100%;">
		        <div class="nui-toolbar" style="border-bottom:0;padding:0px;">
		            <table style="width:100%;">
		            	<tr>
		                    <td style="width:20%;">
		                        <a class="nui-button" id="updateBtn" iconCls="icon-edit" onclick="updateIncome()">更新收入确认信息</a>
		                        <a class="nui-button" id="startBtn" iconCls="icon-goto" onclick="startIncome()">发起收入确认流程</a>
		                       	<!-- 待开发 
		                        <a class="nui-button" id="requestBtn" iconCls="icon-goto" onclick="requestVote()">请求开票</a>
		                        -->
		                    </td>
		                </tr>
		             </table>           
		        </div>
		        <!-- 
		        	通过点击首页我的销售合同中"更多"链接进入
					列表字段：合同编号、客户名称、合同名称、签订日期、合同金额、已确认收入、待确认收入、已收款金额、状态、目前成本汇总
					操作：更新收入确认信息、发起收入确认流程、请求开票…
				 -->
		        <div id="datagrid1" class="nui-datagrid" style="width:100%;height:335px;" allowResize="true" dataField="csContracts" 
			    	url="com.primeton.eos.ame_income.csContract.queryContractByList.biz.ext" showSummaryRow="true" 
			    	ondrawsummarycell="onDrawSummaryCell" onshowrowdetail="onShowRowDetail"
			    	multiSelect="true" allowAlternating="true" onselectionchanged="selectionChanged" >
					<div property="columns">
						<div type="expandcolumn"></div>
						<div type="checkcolumn" width="30"></div>
						<div field="contractid" visible="false"></div>
						<div field="contnum" width="80" renderer="onCsContractRenderer" align="left" headerAlign="center" allowSort="true">合同编号</div>
						<div field="misCustinfo.custname" width="240" align="left" headerAlign="center" allowSort="true">客户名称</div>
						<div field="projectname" width="237" align="left" headerAlign="center" allowSort="true">合同名称</div>
						<div field="signdate" width="75" align="center" headerAlign="center" allowSort="true">签订日期</div>
						<div field="contsum" summaryType="sum" width="90" align="right" headerAlign="center" allowSort="true" dataType="currency">合同金额</div>
						<div field="recognisedIncome" summaryType="sum" width="110" align="right" headerAlign="center" allowSort="false" dataType="currency">已确认收入(含税)</div>
						<div field="bili" width="80" align="right" headerAlign="center" allowSort="false" numberFormat="p">收入确认比例</div>
						<div field="recognizedRevenue" summaryType="sum" width="110" align="right" headerAlign="center" allowSort="false" dataType="currency">待确认收入(含税)</div>
						<div field="gathermon" summaryType="sum" width="90" align="right" headerAlign="center" allowSort="false" dataType="currency">已收款金额</div>
						<div field="status" width="60" align="center" headerAlign="center" allowSort="true" renderer="dictGetStatus">状态</div>
						<div field="contracttype" width="90" align="left" headerAlign="center" allowSort="true" renderer="dictGetContractType">类型</div>
						<div field="projectno" width="90" align="left" headerAlign="center" allowSort="true" renderer="onProjectnoRenderer">项目编号</div>
						<div field="projectPriceSum" summaryType="sum" width="80" renderer="onProPriceRenderer" align="right" headerAlign="center" allowSort="false" dataType="currency">目前成本汇总</div>
						<div width="auto"></div>
						<!-- contracttype 合同类型 -->
					</div>
				</div>
				<div id="detailGrid" style="display:none;">
			        <div id="reve_grid" class="nui-datagrid" style="width:96%;height:auto;" dataField="csReveForecasts" showSummaryRow="true" 
			        url="com.primeton.eos.ame_income.csReveForecast.queryIncome.biz.ext" showPager="false" allowCellSelect="true" ondrawsummarycell="doCountSum">			            
			            <div property="columns">
							<div field="reveno" width="80" align="center"  headerAlign="center" allowSort="true" renderer="getDetail">收入确认次数</div>
							<div field="fcsum" width="100" align="right" headerAlign="center" summaryType="sum" dataType="currency">预计确认金额</div>	
							<div field="yearmonth" width="85" align="center"  headerAlign="center">预计确认年月</div>
							<div field="revetimedesc" width="280" align="left" headerAlign="center" >收入确认时点描述</div>
							<div field="reveproof" width="150" align="center" headerAlign="center" renderer="dictproof">预计收入确认证据</div>		
							<div field="status" width="100" align="center" headerAlign="center" renderer="dictstatus">目前确认状态</div>		
							<div field="confirmday" width="90" align="center" headerAlign="center" >实际确认日期</div>		
							<div field="actsum" width="120" headerAlign="center" dataType="currency" summaryType="sum" align="right">实际确认金额</div>
			            </div>
			        </div>    
			    </div>
			</div>
		</div>
	</div>
	
	
	<script type="text/javascript">
        nui.parse();
        var datagridCsContract = nui.get("datagrid1");
        var formCsContract = new nui.Form("form1");
        var reve_grid = nui.get("reve_grid");
        
        init();
        
        function init(){
        	//按照录入日期排序
        	datagridCsContract.sortBy("contreg","DESC");
        	datagridCsContract.load(null,function(){
	        	//移除"历史合同归"档选项
	        	var statusdata = nui.get("csContractTypeStatus").data;
	        	for(var i = 0; i < statusdata.length; i ++){
	        		if(statusdata[i].dictID == "4" && statusdata[i].dictName == "历史合同归档"){
	        			statusdata.splice(i,1);
	        		}
	        	}
	        	nui.get("csContractTypeStatus").setData(statusdata);
        	});
        }
        
        //汇总行
        function onDrawSummaryCell(e) {
            var result = e.result;
            var grid = e.sender;
            if (e.field == "contnum") {
                e.cellHtml = "<span style='font-weight: bold;font-size: 12px;'>金额单位(元)</span>";
            }
            if (e.field == "signdate") {
                e.cellHtml = "<span style='display: block;font-weight: bold;font-size: 12px;text-align: right;'>合计：</span>";
            }
            if (e.field == "contsum") {
                if(e.cellHtml != 0){
	                e.cellHtml = "<span style='display: block;font-weight: bold;text-align: right;'>" + e.cellHtml.substr(".",(e.cellHtml.length - 3)) + "</span>";
            	}else{
            		e.cellHtml = "<span style='display: block;font-weight: bold;text-align: right;'>" + 0 + "</span>";
            	}
            }
            if (e.field == "recognisedIncome") {
                if(e.cellHtml != 0){
	                e.cellHtml = "<span style='display: block;font-weight: bold;text-align: right;'>" + e.cellHtml.substr(".",(e.cellHtml.length - 3)) + "</span>";
            	}else{
            		e.cellHtml = "<span style='display: block;font-weight: bold;text-align: right;'>" + 0 + "</span>";
            	}
            }
            if (e.field == "recognizedRevenue") {
                if(e.cellHtml != 0){
	                e.cellHtml = "<span style='display: block;font-weight: bold;text-align: right;'>" + e.cellHtml.substr(".",(e.cellHtml.length - 3)) + "</span>";
            	}else{
            		e.cellHtml = "<span style='display: block;font-weight: bold;text-align: right;'>" + 0 + "</span>";
            	}
            }
            if (e.field == "gathermon") {
                if(e.cellHtml != 0){
	                e.cellHtml = "<span style='display: block;font-weight: bold;text-align: right;'>" + e.cellHtml.substr(".",(e.cellHtml.length - 3)) + "</span>";
            	}else{
            		e.cellHtml = "<span style='display: block;font-weight: bold;text-align: right;'>" + 0 + "</span>";
            	}
            }
            if (e.field == "projectPriceSum") {
            	if(e.cellHtml != 0){
	                e.cellHtml = "<span style='display: block;font-weight: bold;text-align: right;'>" + e.cellHtml.substr(".",(e.cellHtml.length - 3)) + "</span>";
            	}else{
            		e.cellHtml = "<span style='display: block;font-weight: bold;text-align: right;'>" + 0 + "</span>";
            	}
            }
        }
        
        //展开信息
        var detailGrid = document.getElementById("detailGrid");
		function onShowRowDetail(e) {
	        var cont_grid = e.sender;
	        var cont_row = e.record;
			var currentRow = cont_row;
	        var td = cont_grid.getRowDetailCellEl(cont_row);
	        td.appendChild(detailGrid);
	        //查询收入预估
	        if(cont_row.contnum==null || cont_row.contnum==""){
	        	return;
	        }else{
	            var incomedata = {contnum: cont_row.contnum};
	            reve_grid.load(incomedata);
				$('#detailGrid').show();
	        }
		}
		
		//汇总行
		function doCountSum(e){    
			if (e.field == "reveno") {
                e.cellHtml = "<span style='display: block;font-weight: bold;font-size: 12px;text-align: right'>合计：</span>";
            }	   	
            if (e.field == "fcsum") {
                if(e.cellHtml != 0){
	                e.cellHtml = "<span style='display: block;font-weight: bold;text-align: right;'>" + e.cellHtml.substr(".",(e.cellHtml.length - 3)) + "</span>";
            	}else{
            		e.cellHtml = "<span style='display: block;font-weight: bold;text-align: right;'>" + 0 + "</span>";
            	} 
            }
           	if (e.field == "actsum") {
                if(e.cellHtml != 0){
	                e.cellHtml = "<span style='display: block;font-weight: bold;text-align: right;'>" + e.cellHtml.substr(".",(e.cellHtml.length - 3)) + "</span>";
            	}else{
            		e.cellHtml = "<span style='display: block;font-weight: bold;text-align: right;'>" + 0 + "</span>";
            	} 
            }
        }
        
        function getDetail(e){
        	return "<a href='javascript:void(0)' onclick='checkDetail();' title='点击查看'>" + e.value + "</a>";
        }
        function checkDetail(){
	 		var selectRow = reve_grid.getSelected();
			var executeUrl = "/default/ame_income/csReveForecast/detailCsReveForecast.jsp?id=" + selectRow.reveid;
		    var iTop = (window.screen.availHeight-30-550)/2; //获得窗口的垂直位置;
			var iLeft = (window.screen.availWidth-10-1200)/2; //获得窗口的水平位置;
			var title = "合同收入记录详细信息" + selectRow.reveid;
			window.open(executeUrl, title,"height=550, width=1200,top="+iTop+",left="+iLeft+",resizable=yes" );
	    }
        
        function dictproof(e) {
			return nui.getDictText('MIS_INCOMECONV',e.value);//设置业务字典值
		}
		function dictstatus(e) {
			return nui.getDictText('AME_REVESTATUS',e.value);//设置业务字典值
		}
		
        //选择行改事件
        function selectionChanged(){
        	var rows = datagridCsContract.getSelecteds();
        	if(rows.length>1){
                nui.get("updateBtn").disable();
                nui.get("startBtn").disable();
            }else{
                nui.get("updateBtn").enable();
                nui.get("startBtn").enable();
            }
        }
        
        //合同状态
        function dictGetStatus(e){
        	return nui.getDictText('CS_CONTRACTTYPE',e.value);
        }
        
        //合同类型
        function dictGetContractType(e){
        	return nui.getDictText("MIS_CONTRACTTYPE",e.value);
        }
        
        function onKeyEnter(e) {
            search();
        }
        
        //查询
        function search(){
			var data = formCsContract.getData(); //获取表单JS对象数据
			//alert(nui.encode(data));
		  	datagridCsContract.load(data); //datagrid加载数据
        }
        
        //重置
        function reset(){
			formCsContract.reset();
			datagridCsContract.load();
        }
        
        //查看销售合同
		function onCsContractRenderer(e) {
			var s = '<a class="dgBtn" href="javascript: doViewCsContract(' + e.record.contractid + ')">' + e.value + '</a> ';
            return s;
		}
		
		function doViewCsContract(cscontractid){
			//contract/contract/contractView.jsp
			window.open("<%=request.getContextPath() %>/contract/contract/contractView.jsp?contractid="+cscontractid,"csContractView","height=600,width=1000,top=0,left=0,toolbar=no,menubar=no,scrollbars=yes,resizable=yes,location=no,status=no");
		}
		
		//查看成本汇总
		function onProPriceRenderer(e){
			if(e.record.projectId){
				var param = e.record.projectId;
				var s = '<a class="dgBtn" href="javascript: doViewProPrice(' + param + ')">' + e.value + '</a>';
	            return s;
			}else{
				return '';
			}
		}
		
		function doViewProPrice(param){
			window.open("<%=request.getContextPath() %>/project/rdproject/projectprofit.jsp?projid=" + param + "&flag=1" ,"projectView","height=600,width=1000,top=0,left=0,toolbar=no,menubar=no,scrollbars=yes,resizable=yes,location=no,status=no");
		}
		
		//查看项目
		/* 
		function onProjectnoRenderer(e){
			return e.value;
			if(e.record.projectno){
				var param = e.record.projectno;
				var s = '<a class="dgBtn" href="javascript: doViewProPrice(' + param + ')">' + e.value + '</a>';
	            return s;
			}else{
				return '';
			}
		}
		 */
		
		//合同详细信息
		function onProjectnoRenderer(e){
        	if(e.value){
	        	return "<a href='javascript:void(0)' onclick='detailProj1();' title='点击查看项目信息'>" + e.value + "</a>";
        	}
        }
        function detailProj1(){
	 		var selectRow = datagridCsContract.getSelected();
	 		var executeUrl = "/default/project/rdproject/projectDetail.jsp?projid=" + selectRow.projectId;
			window.open(executeUrl);
	    }
		//更新收入确认信息
		/* 
			通过选择我的销售合同页面中合同并点击"更新收入确认信息"按钮进入
			上面显示合同基本信息（不允许修改）：合同编号客户名称、合同名称、签订日期、合同金额、已确认收入、待确认收入
动态列表显示字段：收入确认次数、收入类型、确认比例，预计确认金额，收入确认时点、收入确认证据、预计确认年月、旬度、当前状态、实际收入确认日期
允许编辑字段：预计确认比例、金额、预计确认年月、旬度（对于已完成收入确认的记录不允许编辑） 
		*/
		function updateIncome(){
			var row = datagridCsContract.getSelected();
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
							datagridCsContract.reload();
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
			var row = datagridCsContract.getSelected();
			if(row){
				window.location="<%=request.getContextPath() %>/ame_income/reveConfirmProcess/creatReveConfirmProcess.jsp?id=" + row.contnum;
			}else{
				nui.alert("请选择一条记录","提示");
			}
		}
		
		//请求开票
		function requestVote(){
			nui.alert("请求开票");
		}
	</script>
</body>
</html>
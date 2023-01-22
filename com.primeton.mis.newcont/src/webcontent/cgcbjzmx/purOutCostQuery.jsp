<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>	
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@page import="com.eos.data.datacontext.UserObject"%>
<%@page import="commonj.sdo.DataObject"%>
<%@page import="java.util.Map"%>
<html>
<!-- 
  - Author(s): ChiaYang
  - Date: 2016-10-31 14:19:25
  - Description:
-->
<head>
	<title>采购成本结转明细查询</title>
	<meta http-equiv="content-type" content="text/html; charset=UTF-8" />
	<script src="<%= request.getContextPath() %>/common/nui/nui.js" type="text/javascript"></script>
</head>
<body>
	<%
		UserObject user = (UserObject) session.getAttribute("userObject");
		String username = user.getUserName();
		String userno = user.getUserId();
	%>
	<div class="nui-fix">
		<div class="nui-panel" title="采购成本结转明细" style="width: auto">
			<div id="form1">
				<div class="nui-toolbar" style="border-bottom:0;padding:0px;">
					<table style="width:100%;">
						<tr>
			            	<td align="right"><span>财务对应合同编号：</span></td>
			            	<td>
						        <input class="nui-textbox" name="criteria._expr[0]._value" onenter="onKeyEnter"/>
			            		<input class="nui-hidden" name="criteria._expr[0]._property" value="contnum"/>
						        <input class="nui-hidden" name="criteria._expr[0]._op" value="like"/>
						        <input class="nui-hidden" name="criteria._expr[0]._likeRule" value="all"/>
						    </td>
				        	<td align="right"><span>成本确认日期范围：</span></td>
			            	<td>
			            		<input class="nui-datepicker" name="criteria._expr[1]._min" style="width:98px" id="firstdate"/>
			            		-
			            		<input class="nui-datepicker" name="criteria._expr[1]._max" style="width:98px" id="lastdate"/>
						        <input class="nui-hidden" name="criteria._expr[1]._property" value="confirmdate"/>
						        <input class="nui-hidden" name="criteria._expr[1]._op" value="between"/>
						        <input class="nui-hidden" name="criteria._expr[1]._pattern" value="yyyy-MM-dd"/>
						    </td>
						    <td align="right"><span>供应商简称：</span></td>
			            	<td>
			            		<input class="nui-textbox" name="criteria._expr[2]._value" onenter="onKeyEnter"/>
			            		<input class="nui-hidden" name="criteria._expr[2]._property" value="suppliersname"/>
						        <input class="nui-hidden" name="criteria._expr[2]._op" value="like"/>
						        <input class="nui-hidden" name="criteria._expr[2]._likeRule" value="all"/>
						        <!-- <input class="nui-hidden" name="criteria._expr[2]._property" value="supplierid"/>
							    <input class="nui-hidden" name="criteria._expr[2]._op" value="in" id="tempcond11"/>
							    <input class="nui-hidden" name="criteria._expr[2]._ref" value="1" id="tempcond12"/>
							    <input class="nui-hidden" name="criteria._ref[0]._id" value="1"/>
							    <input class="nui-hidden" name="criteria._ref[0]._select._field[0]" value="custid"/>
							    <input class="nui-hidden" name="criteria._ref[0]._entity" value="com.primeton.eos.ame_pur.ame.PurSupplier"/>
							    <input class="nui-hidden" name="criteria._ref[0]._expr[0]._property" value="custname">
				            	<input class="nui-textbox" name="criteria._ref[0]._expr[0]._value" id="dyassetnum1" onvaluechanged="changeSupplierid()"/>
							    <input class="nui-hidden" name="criteria._ref[0]._expr[0]._op" value="like"/>
							    <input class="nui-hidden" name="criteria._ref[0]._expr[0]._likeRule" value="all"/> -->
						    </td>
						    <td align="right"><span>结转类型：</span></td>
			            	<td>
			            		<input name="criteria._expr[3]._value" id="outcosttype" class="nui-dictcombobox" dictTypeId="AME_OUTCOSTTYPE" showNullItem="true" nullItemText=""/>
								<input class="nui-hidden" name="criteria._expr[3]._property" value="outcosttype"/>
								<input class="nui-hidden" name="criteria._expr[3]._op" value="="/>
						    </td>
						</tr>
						<tr>
						    <td align="right"><span>采购合同编号：</span></td>
			            	<td>
			            		<input class="nui-textbox" name="criteria._expr[4]._value" onenter="onKeyEnter"/>
			            		<input class="nui-hidden" name="criteria._expr[4]._property" value="purcontno"/>
						        <input class="nui-hidden" name="criteria._expr[4]._op" value="like"/>
						        <input class="nui-hidden" name="criteria._expr[4]._likeRule" value="all"/>
						    </td>
						    <td align="right"><span>采购订单编号：</span></td>
			            	<td>
			            		<input class="nui-textbox" name="criteria._expr[5]._value" onenter="onKeyEnter"/>
			            		<input class="nui-hidden" name="criteria._expr[5]._property" value="purorderno"/>
						        <input class="nui-hidden" name="criteria._expr[5]._op" value="like"/>
						        <input class="nui-hidden" name="criteria._expr[5]._likeRule" value="all"/>
						    </td>
						    <td align="right"><span>结算单编号：</span></td>
			            	<td>
			            		<input class="nui-textbox" name="criteria._expr[6]._value" onenter="onKeyEnter"/>
			            		<input class="nui-hidden" name="criteria._expr[6]._property" value="settlementno"/>
						        <input class="nui-hidden" name="criteria._expr[6]._op" value="like"/>
								<input class="nui-hidden" name="criteria._expr[6]._likeRule" value="all"/>
						    </td>
						    <td align="right"><span>状态：</span></td>
			            	<td>
						        <input name="criteria._expr[7]._value" class="nui-dictcombobox" dictTypeId="AME_OUTCOSTSTATUS" showNullItem="true" nullItemText=""/>
								<input class="nui-hidden" name="criteria._expr[7]._property" value="outcoststatus"/>
								<input class="nui-hidden" name="criteria._expr[7]._op" value="="/>
						    </td>
						</tr>
						<tr>
							<td align="right"><span>项目编号：</span></td>
			            	<td>
						        <input name="criteria._expr[8]._value" class="nui-textbox" onenter="onKeyEnter" />
								<input class="nui-hidden" name="criteria._expr[8]._property" value="projectno"/>
								<input class="nui-hidden" name="criteria._expr[8]._op" value="like"/>
								<input class="nui-hidden" name="criteria._expr[8]._likeRule" value="all"/>
						    </td>
						    <td align="right"><span>计提单编号：</span></td>
			            	<td>
						        <input name="criteria._expr[9]._value" class="nui-textbox" onenter="onKeyEnter" />
								<input class="nui-hidden" name="criteria._expr[9]._property" value="accruedid"/>
								<input class="nui-hidden" name="criteria._expr[9]._op" value="like"/>
								<input class="nui-hidden" name="criteria._expr[9]._likeRule" value="all"/>
						    </td>
						    <td align="right"><span>成本说明：</span></td>
			            	<td>
						        <input name="criteria._expr[10]._value" class="nui-dictcombobox" dictTypeId="AME_COSTTYPE" showNullItem="true" />
								<input class="nui-hidden" name="criteria._expr[10]._property" value="costmemo"/>
								<input class="nui-hidden" name="criteria._expr[10]._op" value="="/>
						    </td>
						    <td align="right"><span>受益部门：</span></td>
						    <td>
						    	<input name="criteria._expr[11]._value" class="nui-textbox" onenter="onKeyEnter"/>
								<input class="nui-hidden" name="criteria._expr[11]._property" value="orgname"/>
								<input class="nui-hidden" name="criteria._expr[11]._op" value="like"/>
								<input class="nui-hidden" name="criteria._expr[11]._likeRule" value="all"/>
						    </td>
						</tr>
						<tr>
							<td align="right"><span>凭证号数：</span></td>
			            	<td>
						        <input name="criteria._expr[12]._value" class="nui-textbox" onenter="onKeyEnter" />
								<input class="nui-hidden" name="criteria._expr[12]._property" value="pzhs"/>
								<input class="nui-hidden" name="criteria._expr[12]._op" value="like"/>
								<input class="nui-hidden" name="criteria._expr[12]._likeRule" value="all"/>
						    </td>
							<td align="right"><span>成本结转ID：</span></td>
			            	<td>
						        <input name="criteria._expr[13]._value" class="nui-textbox" onenter="onKeyEnter" />
								<input class="nui-hidden" name="criteria._expr[13]._property" value="outcostid"/>
								<input class="nui-hidden" name="criteria._expr[13]._op" value="="/>
						    </td>
						    <td align="right"><span>成本归属类型：</span></td>
			            	<td>
						        <input name="criteria._expr[14]._value" class="nui-dictcombobox" dictTypeId="AME_CONTCOSTTYPE" multiSelect="true" showNullItem="true" />
								<input class="nui-hidden" name="criteria._expr[14]._property" value="costtype"/>
								<input class="nui-hidden" name="criteria._expr[14]._op" value="in"/>
						    </td>
						</tr>
						<tr>
							<td align="center" colspan="10">
								<a class="nui-button" iconCls="icon-search" onclick="search()">查找</a>
								<a class="nui-button" iconCls="icon-reload" onclick="reset()">重置</a>
								<a class="nui-button" iconCls="icon-download" onclick="exportOutCost()">导出</a>
								<!-- <a class="nui-button" iconCls="icon-export" onclick="exportU8()">导出计提U8明细</a> -->
							</td>
						</tr>
				    </table>
				</div>
		    </div>
		    <div class="nui-toolbar" style="border-bottom:0;padding:0px;">
		        <table style="width:100%;">
		              <tr>
		                  <td style="width:100%;">
		                  	 <a class="nui-button" iconCls="icon-net" onclick="sureFileData()">确认</a>
							 <a class="nui-button" iconCls="icon-ok" onclick="sureAuditData()">审计</a>
							 <a class="nui-button" id="updateBtn" iconCls="icon-edit"  onclick="edit()">编辑</a>
		                  </td>
		              </tr>
		         </table>
		    </div>
		    <div id="datagrid1" class="nui-datagrid" style="width:100%;height:335px;" allowResize="true" dataField="purOutCosts" 
		    	url="com.primeton.mis.newcont.cgcbjzmx.purOutCostQuery.biz.ext" idField="id" allowResize="true" 
		    	sizeList="[10,20,50,100,1000]" pageSize="10"  multiSelect="true" showSummaryRow="true" ondrawsummarycell="doCountNowPage">
			    <div property="columns">
			    	<div type="checkcolumn"></div>
			    	<div field="outcostid" width="50px;" align="center" headerAlign="center" allowSort="true" renderer="getOutCostDetail">编号</div>
			    	<div field="confirmdate" width="80px;" align="center" headerAlign="center" allowSort="true">成本确认日期</div>
			    	<div field="outcosttype" width="80px;" align="center" headerAlign="center" allowSort="true" renderer="dictGetAME_OUTCOSTTYPE">成本结转类型</div>
			    	<div field="costtype" width="80px;" align="center" headerAlign="center" allowSort="true" renderer="dictGetAME_CONTCOSTTYPE">成本归属类型</div>
			    	<div field="pzhs" width="50px;" align="center" headerAlign="center" allowSort="true">凭证号数</div>
			    	<div field="taxmon" width="115px;" align="right" headerAlign="center" allowSort="true" currencyUnit="￥" summaryType="sum" dataType="currency">成本结转金额(含税)</div>
			    	<div field="notaxmon" width="125px;" align="right" headerAlign="center" allowSort="true" currencyUnit="￥" summaryType="sum" dataType="currency">成本结转金额(不含税)</div>
			    	<div field="suppliersname" width="150px;" align="center" headerAlign="center" allowSort="true">供应商简称</div>
			    	<div field="purcontno" width="125px;" align="left" headerAlign="center" allowSort="true" renderer="getPurContractDetail">采购合同编号</div>
			    	<div field="purcontid" width="0" align="left" headerAlign="center" allowSort="true">采购合同id</div>	
			    	<div field="purorderno" width="135px;" align="left" headerAlign="center" allowSort="true">采购订单编号</div>
			    	<div field="purorderid" width="0" align="left" headerAlign="center" allowSort="true">采购订单id</div>  	
			    	<div field="settlementno" width="120px;" align="left" headerAlign="center" allowSort="true" renderer="getSettlementno">结算单编号</div>
			    	<div field="settlemon" width="90px;" align="right" headerAlign="center" allowSort="true" currencyUnit="￥" summaryType="sum" dataType="currency">结算单金额</div>
			    	<div field="accruedid" width="70px;" align="left" headerAlign="center" allowSort="true">计提单编号</div>
			    	<div field="accruedmon" width="90px;" align="right" headerAlign="center" allowSort="true" currencyUnit="￥" summaryType="sum" dataType="currency">计提金额</div>
			    	<div field="startdate" width="80px;" align="center" headerAlign="center" allowSort="true">成本开始日期</div>
			    	<div field="enddate" width="80px;" align="center" headerAlign="center" allowSort="true">成本结束日期</div>
			    	<div field="outcoststatus" width="80px;" align="center" headerAlign="center" allowSort="true" renderer="dictGetAME_OUTCOSTSTATUS">成本结转状态</div>
			    	<div field="costmemo" width="80px;" align="center" headerAlign="center" allowSort="true" renderer="dictGetAME_COSTTYPE">成本结转说明</div>
			    	<div field="stockdate" width="80px;" align="center" headerAlign="center" allowSort="true">存货结转日期</div>
			    	<div field="projectno" width="100px;" align="left" headerAlign="center" allowSort="true" renderer="detailProj">项目编号</div>
			    	<div field="contnum" width="110px;" align="left" headerAlign="center" allowSort="true" renderer="detailCscontract">财务对应合同编号</div>
			    	<div field="orgname" width="80px;" align="center" headerAlign="center" allowSort="true">受益部门</div>
			    	<div field="workunit" width="80" align="center" headerAlign="center" allowSort="true" renderer="dictGetWorkunit">工作量单位</div>
	                <div field="workamount" width="80" headerAlign="center" allowSort="true" >工作量数量</div>
			    </div>
			</div>
		</div>
	</div>
	<form name="viewlist1" id="viewlist1" action="com.primeton.eos.ame_common.ameExportCommon.flow" method="post">
		<input type="hidden" name="_eosFlowAction" value="action0" filter="false"/>
		<input type="hidden" name="downloadFile" filter="false"/>
		<input type="hidden" name="fileName" filter="false"/>
	</form>
	<script type="text/javascript">
		nui.parse();
				
		var grid = nui.get("datagrid1");
		var form = new nui.Form("form1");
			
		//初始化加载数据,默认按照成本确认日期降序排列
		init();
	    function init() {
			grid.load(); 
	    	grid.sortBy("confirmdate","desc");
	    }
		
		//数字列提供统计行
        function doCountNowPage(e){        	
            if (e.field == "taxmon") {
                e.cellHtml = "<div align='right'><b>" + e.cellHtml + "</b></div>";
            }
            if (e.field == "notaxmon") {
                e.cellHtml = "<div align='right'><b>" + e.cellHtml + "</b></div>";
            }
            if (e.field == "settlemon") {
                e.cellHtml = "<div align='right'><b>" + e.cellHtml + "</b></div>";
            }
            if (e.field == "accruedmon") {
                e.cellHtml = "<div align='right'><b>" + e.cellHtml + "</b></div>";
            }
        }
        
		//当执行供应商模糊查询时执行的操作
		function changeSupplierid(){
			if(!(nui.get("dyassetnum1").getValue()==""||nui.get("dyassetnum1").getValue()==null)){
				nui.get("tempcond11").setValue("in");
				nui.get("tempcond12").setValue("1");
			}
		}
		
		//采购成本结转明细详细信息
		function getOutCostDetail(e) {
			return "<a href='javascript:void(0)' onclick='checkOutCostDetail();' title='点击查看采购成本结转明细'>" + e.value + "</a>";
		}
		
		//采购合同编号提供链接
	    function getPurContractDetail(e) {
	    	if(e.value){
				return "<a href='javascript:void(0)' onclick='checkPurContractDetail();' title='点击查看采购合同'>" + e.value + "</a>";
	    	}
		}
		
		//采购订单编号提供链接
	    function getPurOrderDetail(e) {
	    	if(e.value){
				return "<a href='javascript:void(0)' onclick='checkPurOrderDetail();' title='点击查看采购订单'>" + e.value + "</a>";
	    	}
		}
		
	    //采购成本结转明细查看
	    function checkOutCostDetail(){
	    	var selectRow = grid.getSelected();
			var executeUrl = "/default/newcont/cgcbjzmx/purOutCostView.jsp?outcostid=" + selectRow.outcostid;
			window.open(executeUrl, "采购成本结转明细查看", "fullscreen=1");
		}
	    
	    //采购合同查看
	    function checkPurContractDetail(){
	    	var selectRow = grid.getSelected();
			var executeUrl = "/default/ame_pur/PurContract/DetailPurContract.jsp?id=" + selectRow.purcontid;
			window.open(executeUrl, "采购合同查看", "fullscreen=1");
		}
		
		//采购订单查看
		function checkPurOrderDetail(){
			var selectRow = grid.getSelected();
			var executeUrl = "/default/ame_pur/PurOrder/DetailPurOrder.jsp?id=" + selectRow.purorderid;
			window.open(executeUrl, "采购订单查看", "fullscreen=1");
		}
		
		//设置业务字典值-状态
	    function dictGetAME_OUTCOSTSTATUS(e) {
	        return nui.getDictText('AME_OUTCOSTSTATUS',e.value);
	    }
	    
	    //设置业务字典值-状态
	    function dictGetAME_COSTTYPE(e) {
	        return nui.getDictText('AME_COSTTYPE',e.value);
	    }
	      
	    //设置业务字典值-成本结转类型
	    function dictGetAME_OUTCOSTTYPE(e) {
	        return nui.getDictText('AME_OUTCOSTTYPE',e.value);
	    }
	    
	    //设置业务字典值-成本结转类型
	    function dictGetAME_CONTCOSTTYPE(e) {
	        return nui.getDictText('AME_CONTCOSTTYPE',e.value);
	    }
	    
	    //执行多条件查询
	    function search() {
	    	/* if(nui.get("dyassetnum1").getValue()==""||nui.get("dyassetnum1").getValue()==null){
				nui.get("tempcond11").setValue("=");
				nui.get("tempcond12").setValue("");
			} */
			var form = new nui.Form("#form1");
			var data = form.getData(); //获取表单JS对象数据
			grid.load(data); //datagrid加载数据
		}
		
		//回车
		function onKeyEnter(){
			search();
		}
			
		//重置多条件查询
		function reset(){
			var form = new nui.Form("#form1");
			form.reset();
			grid.load();
		}

		//归档/审计
		var choosesRows = "";

		function sureFileData(){
			file();
		}

		//指定成本确认日期范围内状态为“新增”的数据的状态变更为已归档
		function file() {
			 var rows = grid.getSelecteds();
			 if (rows.length > 0) {
			 	for (var i = 0; i < rows.length; i++) {
			 		if (rows[i].outcoststatus != "1") {
			 			//nui.alert("存在," + nui.getDictText('AME_OUTCOSTSTATUS', rows[i].outcoststatus) + "数据！");
			 			nui.alert("结转确认只能针对“新增”状态数据处理，选择的数据中包含了“" + nui.getDictText('AME_OUTCOSTSTATUS', rows[i].outcoststatus) + "”状态的数据！","结转确认提醒");
                        return;
			 		}
			 	}
			 	chooseRows = rows;
			 	sureFile(chooseRows);
			 } else {
			 	nui.alert("请选中一条记录！");
			 }
		}
		
		//批量确认归档
		function sureFile(rows){		
            nui.confirm("确定要结转确认选中的成本结转明细信息？","结转确认提示",function(action){
                if(action=="ok"){
                    var firstdate = nui.get("firstdate").getValue();
                    var lastdate = nui.get("lastdate").getValue();
                    var countrow = 0;
                    
                    for (var i = 0;i < rows.length;i++) {
                    	countrow++;
                    }
                    
                    var json = nui.encode({"purOutCosts": rows,"purOutcostParam":{"filedate": new Date(),"fileoper": "<%=username %>","firstdate":firstdate,"lastdate":lastdate,"countrow":countrow}});
                    
                    grid.loading("正在结转确认中,请稍等...");
                    $.ajax({
                        url:"com.primeton.mis.newcont.cgcbjzmx.sureFileOutCost.biz.ext",
                        data:json,
                        type:'POST',
                        cache: false,
                        contentType:'text/json',
                        success:function(text){
                            var returnJson = nui.decode(text);
                            grid.unmask();
                            if(returnJson.exception == null){
                                nui.alert("结转确认成功", "系统提示",function(){
                                    grid.reload();
                                });
                            }else{
                                nui.alert("结转确认失败", "系统提示");
                            }
                        }
                    });
                }
            });
        }		
		
		function sureAuditData() {
			audit();
		}
		
		//指定成本确认日期范围内状态为“已归档”的数据的状态变更为已审计
		function audit() {
			 var rows = grid.getSelecteds();
			 if (rows.length > 0) {
			 	for (var i = 0; i < rows.length; i++) {
			 		if (rows[i].outcoststatus != "2") {
			 			//nui.alert("存在," + nui.getDictText('AME_OUTCOSTSTATUS', rows[i].outcoststatus) + "数据！");
			 			nui.alert(nui.getDictText('AME_OUTCOSTSTATUS', rows[i].outcoststatus) + "状态的数据不能变更为已审计，选择的数据中包含了" + nui.getDictText('AME_OUTCOSTSTATUS', rows[i].outcoststatus) + "状态。","审计提醒");
                        return;
			 		}
			 	}
			 	chooseRows = rows;
			 	sureAudit(chooseRows);
			 } else {
			 	nui.alert("请选中一条记录！");
			 }
		}
		
        //批量确认审计
        function sureAudit(rows){
            nui.confirm("确定要审计选中的成本结转明细信息？","确认审计提示",function(action){
                if(action=="ok"){
                    var firstdate = nui.get("firstdate").getValue();
                    var lastdate = nui.get("lastdate").getValue();
                    var countrow = 0;
                    
                    for (var i = 0;i < rows.length;i++) {
                    	countrow++;
                    }
                    
                    var json = nui.encode({"purOutCosts": rows,"purOutcostParam":{"auditdate": new Date(),"auditor": "<%=username %>","firstdate":firstdate,"lastdate":lastdate,"countrow":countrow}});
      
                    grid.loading("正在确认审计中,请稍等...");
                    $.ajax({
                        url:"com.primeton.mis.newcont.cgcbjzmx.sureAuditOutCost.biz.ext",
                        type:'POST',
                        data:json,
                        cache: false,
                        contentType:'text/json',
                        success:function(text){
                            var returnJson = nui.decode(text);
                            grid.unmask();
                            if(returnJson.exception == null){
                                nui.alert("确认审计成功", "系统提示",function(){
                                    grid.reload();
                                });
                            }else{
                                nui.alert("确认审计失败", "系统提示");
                            }
                        }
                    }); 
                }
            });
        }
        
        //项目详细信息
        function detailProj(e){
        	if(e.value){
        		//项目为多个，暂时不添加链接
        		if(e.value.indexOf(",") >= 0){
        			return e.value;
        		}else{
	        		return "<a href='javascript:void(0)' onclick='detailProj1();' title='点击查看项目信息'>" + e.value + "</a>";
        		}
        	}
        }
        function detailProj1(){
	 		var selectRow = grid.getSelected();
	 		var executeUrl = "/default/project/rdproject/projectDetail.jsp?projid=" + selectRow.projectId;
			window.open(executeUrl);
	    }
	    
	    //销售合同编号
	    function detailCscontract(e){
	    	if(e.record.contractid){
	    		return "<a href='javascript:void(0)' onclick='detailCscontract1();' title='点击查看'>" + e.value + "</a>";
	    	}else{
	    		return e.value;
	    	}
	    }
	    function detailCscontract1(){
			var selectRow = grid.getSelected();
			var executeUrl = "<%=request.getContextPath() %>/contract/contract/contractView.jsp?contractid=" + selectRow.contractid;
			window.open(executeUrl, "合同查看", "fullscreen=1");
		}
		
		//结算单编号
		function getSettlementno(e){
			if(e.value){
				//结算单编号多个，暂时不添加链接
				if(e.value.indexOf(",") >= 0){
        			return e.value;
        		}else{
					return "<a href='javascript:void(0)' onclick='getSettlementno1();' title='点击查看'>" + e.value + "</a>";
				}
			}
		}
		function getSettlementno1(){
			var selectRow = grid.getSelected();
	 		var executeUrl = "";
	 		if (selectRow.purtype == 0) {
	 			executeUrl = "<%=request.getContextPath() %>/ame_pur/settle/PurOutSettleLook.jsp?settlementid=" + selectRow.settlementid + "&projectno=" + selectRow.projectno + "&custid=" + selectRow.supplierid + "&custno=" + selectRow.custno;
	 		} else {
	 			executeUrl = "<%=request.getContextPath() %>/ame_pur/settle/PurOutSettleOtherLook.jsp?settlementid=" + selectRow.settlementid + "&projectno=" + selectRow.projectno + "&custid=" + selectRow.supplierid;			
	 		}
			window.open(executeUrl, "结算单查看", "fullscreen=1");
		}
		
		//设置业务字典值-工作量单位
		function dictGetWorkunit(e){
			return nui.getDictText('SERV_NUM_TYPE',e.value);
		}
		
		//导出成本结转记录
		function exportOutCost(){
			var form = new nui.Form("#form1");
			var json = form.getData();
			form.loading("成本结转记录导出中...");
			nui.ajax({
    			url: "com.primeton.mis.newcont.cgcbjzmx.exportOutCost.biz.ext",
		        type: "post",
		        data: json,
		        cache: false,
		        contentType: 'text/json',
		        success: function (o) {
		     		form.unmask();
		        	var filePath = o.downloadFile;
		        	var fileName = "成本结转记录";
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
	    
	    function exportU8(){
	    	var outcosttype = nui.get("outcosttype").getValue();
	    	if( outcosttype == ""){
	    		nui.alert("请选择结转类型，选择的结转类型必须为计提！");
	    	}else if(outcosttype == "1"){
	    		var form = new nui.Form("#form1");
	    		var json = form.getData();
	    		form.loading("计提U8明细导出中...");
	    		nui.ajax({
    			url: "com.primeton.mis.newcont.cgcbjzmx.exportU8.biz.ext",
		        type: "post",
		        data: json,
		        cache: false,
		        contentType: 'text/json',
		        success: function (o) {
		        	if(o.result==-1){
		        		nui.alert("导出凭证失败！请联系管理员。");
		        	}else if(o.result==0){
		        		nui.alert("符合条件可以导出的凭证为空，未生成文件。");
		        	}else{
		        		nui.alert("导出凭证为："+o.result+"条！")
		        		var filePath = o.filePath;
			        	var fileName = "计提U8凭证";
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
						fileName = fileName + "_" + curDateTime + ".txt";
						var frm = document.getElementById("viewlist1");
			        	frm.elements["downloadFile"].value = filePath;
			        	frm.elements["fileName"].value = fileName;
					    frm.submit();
		        	}
		        	form.unmask();
		        },
		        error: function () {
		        	alert("error");
	        	}
				});	
	    	}else{
	    		nui.alert("选择的结转类型必须为计提！");
	    	}
	    }
	    
	    function edit() {
			var rows = grid.getSelecteds();
			if (rows.length == 1) {
				var row = rows[0];
				if(row.outcoststatus != 1) {
					alert("只能修改成本结转状态为新增的成本明细");
					return;
				}
				
				nui.open({
		            url: "<%=request.getContextPath() %>/newcont/cgcbjzmx/purOutCostEdit.jsp",
		            title: "修改成本明细",
		            width: 850,
		            height: 350,
		            onload: function () {
		              var iframe = this.getIFrameEl();
		              var data = {action: "edit", row: row };
		              iframe.contentWindow.SetData(data);
		            },
		            ondestroy: function (action) {
		                if(action=="ok"){
		                  grid.reload();
		                }
		            }
            	});
				
			} else if(rows.length > 1) {
				nui.alert("一次只能编辑一条数据!");
			} else {
				nui.alert("请选中一条记录!");
			}
		}
	</script>
</body>
</html>
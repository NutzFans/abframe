<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<!-- 
  - Author(s): 朱勇伦
  - Date: 2017-03-31 14:19:21
  - Description:
-->
<head>
	<title>本部门受益的采购结算</title>
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
		<div class="nui-panel" title="本部门受益的采购结算" width="auto">
			<div style="width:100%;height:100%;padding:0px;margin:0px;" id="form1">
				<div class="nui-toolbar" style="border-bottom:0;padding:0px;">
					<table style="width:100%;">
						<tr>
							<!-- 
							查询条件：供应商、项目名称、项目编号、客户名称、销售合同（项目对应的商务合同）、相关外包人员、结算状态
							查询结果：参考采购结算管理的查询结果，去掉财务合同显示，增加商务合同显示(项目对应的商务合同编号)
							排序字段：缺省按结算开始日期倒序排列，支持页面端列头排序
							 -->
							<td align="right" style="width: 100px;"><span>供应商名称：</span></td>
			            	<td align="left" style="width: 120px;">
							    <input name="criteria._expr[0]._value" class="nui-textbox" style="width:120px;" onenter="onKeyEnter"/>
							    <input class="nui-hidden" name="criteria._expr[0]._property" value="custname"/>
							    <input class="nui-hidden" name="criteria._expr[0]._op" value="like"/>
							    <input class="nui-hidden" name="criteria._expr[0]._likeRule" value="all"/>
							</td>
							<td align="right" style="width: 100px"><span>项目名称：</span></td>
			            	<td align="left" style="width: 120px;">
			            		<input name="criteria._expr[1]._value" class="nui-textbox" style="width:120px;" onenter="onKeyEnter"/>
							    <input class="nui-hidden" name="criteria._expr[1]._property" value="projectName"/>
							    <input class="nui-hidden" name="criteria._expr[1]._op" value="like"/>
							    <input class="nui-hidden" name="criteria._expr[1]._likeRule" value="all"/>
							</td>
							<td align="right" style="width: 100px"><span>项目编号：</span></td>
			            	<td align="left" style="width: 12px;">
			            		<input name="criteria._expr[2]._value" class="nui-textbox" style="width:120px;" onenter="onKeyEnter"/>
							    <input class="nui-hidden" name="criteria._expr[2]._property" value="projectno"/>
							    <input class="nui-hidden" name="criteria._expr[2]._op" value="like"/>
							    <input class="nui-hidden" name="criteria._expr[2]._likeRule" value="all"/>
			            	</td>
							<td align="right" style="width: 100px"><span>结算状态：</span></td>
			            	<td align="left">
							    <input name="criteria._expr[5]._value" class="nui-dictcombobox" dictTypeId="AME_SETSTATUS" shownullItem="true" multiSelect="true" style="width:204px;"/>
							    <input class="nui-hidden" name="criteria._expr[5]._property" value="setstatus"/>
							    <input class="nui-hidden" name="criteria._expr[5]._op" value="in"/>
							</td>
						</tr>
						<tr>
			            	<!-- 2016年10月26日增加 -->
			            	<td align="right" style="width: 100px"><span>合同编号：</span></td>
			            	<td align="left" style="width: 120px;">
			            		<input name="criteria._expr[3]._value" class="nui-textbox" style="width:120px;" onenter="onKeyEnter"/>
							    <input class="nui-hidden" name="criteria._expr[3]._property" value="contnum"/>
							    <input class="nui-hidden" name="criteria._expr[3]._op" value="like"/>
							    <input class="nui-hidden" name="criteria._expr[3]._likeRule" value="all"/>
			            	</td>
							<td align="right" style="width: 100px"><span>所属客户：</span></td>
			            	<td align="left" style="width: 120px;">
							    <input name="criteria._expr[4]._value" class="nui-textbox" style="width:120px;" onenter="onKeyEnter"/>
							    <input class="nui-hidden" name="criteria._expr[4]._property" value="custname1"/>
							    <input class="nui-hidden" name="criteria._expr[4]._op" value="like"/>
							    <input class="nui-hidden" name="criteria._expr[4]._likeRule" value="all"/>
							</td>
							<td align="right" style="width: 100px"><span>相关外包人员：</span></td>
			            	<td align="left" style="width: 120px;">
			            		<input name="criteria._expr[7]._value" class="nui-textbox" style="width:120px;" onenter="onKeyEnter"/>
							    <input class="nui-hidden" name="criteria._expr[7]._property" value="outpername"/>
							    <input class="nui-hidden" name="criteria._expr[7]._op" value="like"/>
							    <input class="nui-hidden" name="criteria._expr[7]._likeRule" value="all"/>
			            	</td>
							<td align="right" style="width: 100px;"><span>结算开始日期：</span></td>
			            	<td align="left">
			            		<input name="criteria._expr[9]._min" class="nui-datepicker" style="width:100px;"/>-<input name="criteria._expr[9]._max" class="nui-datepicker" style="width:100px;" />
							    <input class="nui-hidden" name="criteria._expr[9]._property" value="startdate"/>
							    <input class="nui-hidden" name="criteria._expr[9]._op" value="between"/>
			            	</td>
						</tr>
						<tr>
							<td align="right" style="width: 100px"><span>事业部：</span></td>
			            	<td align="left" style="width: 120px;">
			            		<input class="nui-dictcombobox" name="criteria._expr[8]._value" id="syb" dictTypeId="CONT_ORG" style="width: 120px;"/>
							    <input class="nui-hidden" name="criteria._expr[8]._property" value="sybywzd"/>
							    <input class="nui-hidden" name="criteria._expr[8]._op" value="like"/>
			            	</td>
							<td align="right" style="width: 100px"><span>受益人：</span></td>
							<td align="left" style="width: 120px;">
			            		<input class="nui-textbox" name="criteria._expr[6]._value" style="width:120px;" onenter="onKeyEnter"/>
							    <input class="nui-hidden" name="criteria._expr[6]._property" value="orgname"/>
							    <input class="nui-hidden" name="criteria._expr[6]._op" value="like"/>
						        <input class="nui-hidden" name="criteria._expr[6]._likeRule" value="all"/>
							</td>
							<td colspan="2"></td>
			            	<td align="right" style="width: 100px;"><span>结算结束日期：</span></td>
			            	<td align="left">
			            		<input name="criteria._expr[10]._min" class="nui-datepicker" style="width:100px;"/>-<input name="criteria._expr[10]._max" class="nui-datepicker" style="width:100px;" />
							    <input class="nui-hidden" name="criteria._expr[10]._property" value="enddate"/>
							    <input class="nui-hidden" name="criteria._expr[10]._op" value="between"/>
			            	</td> 
							<td></td>
							<td></td>
						</tr>
					    <tr>
			    			<td align="center" colspan="15">
		                        <a class="nui-button" id="search" iconCls="icon-search" onclick="search()">查询</a>
		                        <a class="nui-button" id="reset" iconCls="icon-reload" onclick="reset()">重置</a>
		                   </td>
		                </tr>
		            </table>           
		        </div>
		    </div>
			<div id="datagrid1" class="nui-datagrid" dataField="purSettles" style="width:100%;height: 375px;" 
	        	url="com.primeton.eos.ame_pur.settle.queryBenefitToMeSettle.biz.ext" 
	        	showSummaryRow="true" ondrawsummarycell="onDrawSummaryCell" sortMode="client" 
	        	pageSize="10" showPageInfo="true" multiSelect="true" onselectionchanged="selectionChanged" 
	        	frozenStartColumn="0" frozenEndColumn="5">
	            <div property="columns">
	                <div type="checkcolumn" width="30"></div>
	                <!-- <div field="processinstid" headerAlign="center" allowSort="true" visible="false">流程实例ID</div>
	                <div field="benefitid" headerAlign="center" allowSort="true" visible="false">受益部门id</div>
	                <div field="custid" headerAlign="center" allowSort="true" visible="false">供应商ID</div> -->
	                <div field="orgname" width="70" headerAlign="center" allowSort="true">受益部门</div>
	                <div field="suppliersname" width="90" headerAlign="center" allowSort="true">供应商简称</div>
	                <div field="startdate" width="80" headerAlign="center" allowSort="true">结算开始日期</div>
	                <div field="enddate" width="80" headerAlign="center" allowSort="true">结算截止日期</div>
	                <div field="setamount" width="120" summaryType="sum" align="right" dataType="currency" headerAlign="center" allowSort="true">结算总金额(元)</div>
	                <div field="notaxmon" width="120" summaryType="sum" align="right" dataType="currency" headerAlign="center" allowSort="true">不含税金额(元)</div>
	                <div field="outpername" width="200" headerAlign="center" allowSort="true">外包人员</div>
	                <div field="projectno" width="90" headerAlign="center" allowSort="true" renderer="detailProj">项目编号</div>
	                <div field="projectName" width="220" headerAlign="center" allowSort="true">项目名称</div>
	                <div field="costtype" width="80" headerAlign="center" allowSort="true" renderer="dictGetCosttype">成本归属类型</div>
	                <div field="setstatus" width="70" headerAlign="center" allowSort="true" renderer="dictGetStatus">结算单状态</div>
	                <div field="purtype" width="70" headerAlign="center" allowSort="true" renderer="dictGetPurtype" visible="true">合同类型</div>
	                <div field="purcontnum" width="140" headerAlign="center" allowSort="true">采购合同编号</div>
	                <div field="purordernum" width="140" headerAlign="center" allowSort="false">采购订单编号</div>
	                <div field="pettyexpno" headerAlign="center" allowSort="true" visible="false">报销单编号</div>
	                <div field="custno" headerAlign="center" allowSort="true" visible="false">客户代码</div>
	                <div field="custnamemis" width="260" headerAlign="center" allowSort="true">客户名称</div>
	                <div field="workunit" width="70" headerAlign="center" allowSort="true" renderer="dictGetServ">工作量单位</div>
	                <div field="workamount" width="70" headerAlign="center" allowSort="true">工作量数量</div>
	                <div field="subdate" width="80" headerAlign="center" allowSort="true" style="width:100px;">结算提交日期</div>
	                <div field="paydate" width="80" headerAlign="center" allowSort="true" style="width:100px;">付款日期</div>
	                <div field="confper" width="90" headerAlign="center" allowSort="true">结算单确认人</div>
	                <div field="contnum" width="80" headerAlign="center" allowSort="true" renderer="detailCscontract" >合同编号</div>
	                <div field="settlementno" width="100" headerAlign="center" allowSort="true" >结算单编号</div>
	                <div field="creatorname" width="80" headerAlign="center" allowSort="true" >流程发起人</div>
	            </div>
	        </div>
		</div>
	</div>
	
	<script type="text/javascript">
		nui.parse();
		var form = new nui.Form("#form1");
    	var grid = nui.get("datagrid1");
    	//所属事业部
    	var sybdata = [];
    	init();
    	function init(){
    		nui.ajax({
                url: "com.primeton.eos.ame_common.sendMail.getMySYB.biz.ext",
                type: "post",
                cache: false,
                contentType: 'text/json',
                success: function (text) {
					//除了PMO都能查到事业部，PMO为0
		    		if(text.syb.length > 0){//属于单个或多个事业部
	    				for(var i = 0;i < text.syb.length;i ++){
	    					sybdata[i] = {"dictID": text.syb[i].dictid,"dictName": text.syb[i].dictname};
	    				}
	    				nui.getbyName("criteria._expr[8]._value").setData(sybdata);
	    				nui.getbyName("criteria._expr[8]._value").setShowNullItem(false);
    					nui.getbyName("criteria._expr[8]._value").select(0);
    				}
    				var json = form.getData();
		    		grid.load(json);
	    		}
	    	});
		    
		}
		
		function search(){
			var json = form.getData();
    		grid.sortBy("subdate","desc");
		    grid.load(json);
		}
		
		function reset(){
			var form = new nui.Form("#form1");
            form.reset();
            nui.getbyName("criteria._expr[8]._value").setData(sybdata);
			nui.getbyName("criteria._expr[8]._value").setShowNullItem(false);
			nui.getbyName("criteria._expr[8]._value").select(0);
		    var json = form.getData();
            grid.sortBy("subdate","desc");
            grid.load(json);
		}
		
		//enter键触发查询
        function onKeyEnter(e) {
            search();
        }
		
		function onDrawSummaryCell(e) {
            var result = e.result;
            var grid = e.sender;
            if (e.field == "enddate") {
                e.cellHtml = "<span style='display: block;font-weight: bold;font-size: 12px;text-align: right;'>合计：</span>";
            }
            if (e.field == "setamount") {
            	e.cellHtml = "<span style='display: block;font-weight: bold;text-align: right;'>" + e.cellHtml + "</span>";
            }
            if (e.field == "notaxmon") {
            	e.cellHtml = "<span style='display: block;font-weight: bold;text-align: right;'>" + e.cellHtml + "</span>";
            }
        }
        
		//设置业务字典值-成本归属类型
		function dictGetCosttype(e){
			return nui.getDictText('AME_CONTCOSTTYPE',e.value);
		}
		
		//设置业务字典值-合同类型
		function dictGetPurtype(e){
			return nui.getDictText('AME_CONTYPE',e.value);
		}
		
		//设置业务字典值-工作量单位
		function dictGetServ(e){
			return nui.getDictText('SERV_NUM_TYPE',e.value);
		}
		
		//项目详细信息
        function detailProj(e){
        	if(e.value){
	        	return "<a href='javascript:void(0)' onclick='detailProj1();' title='点击查看项目信息'>" + e.value + "</a>";
        	}
        }
        function detailProj1(){
	 		var selectRow = grid.getSelected();
	 		var executeUrl = "/default/project/rdproject/projectDetail.jsp?projid=" + selectRow.projectId;
			window.open(executeUrl);
	    }
		
		//销售合同编号
	    function detailCscontract(e){
	    	if(e.value){
	    		return "<a href='javascript:void(0)' onclick='detailCscontract1();' title='点击查看'>" + e.value + "</a>";
	    	}
	    }
	    function detailCscontract1(){
			var selectRow = grid.getSelected();
			var executeUrl = "<%=request.getContextPath() %>/contract/contract/contractView.jsp?contractid=" + selectRow.contractid;
			window.open(executeUrl, "合同查看", "fullscreen=1");
		}
		
		//设置业务字典值-结算单状态
		function dictGetStatus(e){
			if(e.record.processinstid != null){
	        	return "<a href='javascript:void(0)' onclick='doViewProc();' title='查看结算流程图'>" + nui.getDictText('AME_SETSTATUS',e.value) + "</a>";
        	}else{
        		return nui.getDictText('AME_SETSTATUS',e.value);
        	}
		}
		//查看流程图
	    function doViewProc(){
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
	</script>
</body>
</html>
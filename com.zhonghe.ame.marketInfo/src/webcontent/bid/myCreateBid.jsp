<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@include file="/purchase/common/common.jsp"%>
<html>
<head>
<title>投标信息管理</title>
	<style type="text/css">
		html, body{
	        margin:0;padding:0;border:0;width:100%;height:100%;overflow:hidden;
	    }    
    </style>
</head>
<body>
<div  id="form1">
	  <input class="nui-hidden" name="critria._entity" value="com.zhonghe.ame.marketInfo.marketInfo.queryBid" />
		<div class="nui-toolbar" style="border-bottom: 0; padding: 0px;">
			<table align="center" border="0" width="100%" class="form_table">
				<tr>
					<td class="form_label" align="right" style="width: 3%">牵头部门:</td>
					<td colspan="1" style="width: 7%"><input
						name="critria._expr[1]._value" class="nui-textbox" id = "orgname"
						style="width: 200px;" /> <input class="nui-hidden" 
						name="critria._expr[1]._property" value="orgname" /> <input
						class="nui-hidden" name="critria._expr[1]._op" value="like" /></td>
					<td align="right" style="width: 3%">内协外联:</td>
					<td colspan="1" style="width: 7%"><input
						class="nui-dictcombobox" name="critria._expr[2]._value" id = "externalType"
						style="width: 200px;" dictTypeId="EXTERNAL_TYPE" nullItemText="全部"
						showNullItem="true" /> <input class="nui-hidden"
						name="critria._expr[2]._property" value="externalType" /> <input
						class="nui-hidden" name="critria._expr[2]._op" value="=" /></td>
					<td class="form_label" align="right" style="width: 3%">甲方全称:</td>
					<td colspan="1" style="width: 7%"><input
						name="critria._expr[3]._value" class="nui-textbox" id = "partyName"
						style="width: 200px;" /> <input class="nui-hidden"
						name="critria._expr[3]._property" value="partyName" /> <input
						class="nui-hidden" name="critria._expr[3]._op" value="like" /></td>
				</tr>
				<tr>
					<td class="form_label" align="right" style="width: 3%">项目名称:</td>
					<td colspan="1" style="width: 7%"><input
						name="critria._expr[4]._value" class="nui-textbox" id = "projectName"
						style="width: 200px;" /> <input class="nui-hidden"
						name="critria._expr[4]._property" value="projectName" /> <input
						class="nui-hidden" name="critria._expr[4]._op" value="like" /></td>
					<td class="form_label" align="right" style="width: 3%">投资额/万:</td>
					<td colspan="1" style="width: 7%"><input
						name="critria._expr[5]._value" class="nui-textbox" id = "investmentAmount"
						style="width: 200px;" /> <input class="nui-hidden"
						name="critria._expr[5]._property" value="investmentAmount" /> <input
						class="nui-hidden" name="critria._expr[5]._op" value="=" /></td>		
					<td align="right" style="width: 3%">标的额:</td>
					<td colspan="1" style="width: 7%"><input
						class="nui-dictcombobox" name="critria._expr[6]._value" id = "matterAmount"
						style="width: 200px;" dictTypeId="MATTER_AMOUNT" nullItemText="全部"
						showNullItem="true" /> <input class="nui-hidden"
						name="critria._expr[6]._property" value="matterAmount" /> <input
						class="nui-hidden" name="critria._expr[6]._op" value="=" /></td>				
				</tr>
				<tr>
					<td class="form_label" align="right" style="width: 3%">项目地点:</td>
					<td colspan="1" style="width: 7%"><input
						name="critria._expr[7]._value" class="nui-textbox" id = "projectlocal"
						style="width: 200px;" /> <input class="nui-hidden"
						name="critria._expr[7]._property" value="projectlocal" /> <input
						class="nui-hidden" name="critria._expr[7]._op" value="=" /></td>	
					<td align="right" style="width: 3%">集团内外:</td>
					<td colspan="1" style="width: 7%"><input
						class="nui-dictcombobox" name="critria._expr[8]._value" id = "headquarterGroup"
						style="width: 200px;" dictTypeId="HEADQUARTER_GROUP" nullItemText="全部"
						showNullItem="true" /> <input class="nui-hidden"
						name="critria._expr[8]._property" value="headquarterGroup" /> <input
						class="nui-hidden" name="critria._expr[8]._op" value="=" /></td>
					<td align="right" style="width: 3%">特点:</td>
					<td colspan="1" style="width: 7%"><input
						class="nui-dictcombobox" name="critria._expr[9]._value" id = "characteristics"
						style="width: 200px;" dictTypeId="CHARACTERISTICS" nullItemText="全部"
						showNullItem="true" /> <input class="nui-hidden"
						name="critria._expr[9]._property" value="characteristics" /> <input
						class="nui-hidden" name="critria._expr[9]._op" value="=" /></td>
				</tr>
				<tr>
					<td align="right" style="width: 3%">工程类别:</td>
					<td colspan="1" style="width: 7%"><input
						class="nui-dictcombobox" name="critria._expr[10]._value" id = "serviceType"
						style="width: 200px;" dictTypeId="SERVICE_TYPE" nullItemText="全部"
						showNullItem="true" /> <input class="nui-hidden"
						name="critria._expr[10]._property" value="serviceType" /> <input
						class="nui-hidden" name="critria._expr[10]._op" value="=" /></td>
					<td align="right" style="width: 3%">专业类别:</td>
					<td colspan="1" style="width: 7%"><input
						class="nui-dictcombobox" name="critria._expr[11]._value" id = "major"
						style="width: 200px;" dictTypeId="BID_MAJOR" nullItemText="全部"
						showNullItem="true" /> <input class="nui-hidden"
						name="critria._expr[11]._property" value="major" /> <input
						class="nui-hidden" name="critria._expr[11]._op" value="=" /></td>
					<td align="right" style="width: 3%">服务范围:</td>
					<td colspan="1" style="width: 7%"><input
						class="nui-dictcombobox" name="critria._expr[12]._value" id = "scopeService"
						style="width: 200px;" dictTypeId="SCOPE_SERVICE" nullItemText="全部"
						showNullItem="true" /> <input class="nui-hidden"
						name="critria._expr[12]._property" value="scopeService" /> <input
						class="nui-hidden" name="critria._expr[12]._op" value="=" /></td>
				</tr>
				<tr>
					<td class="form_label" align="right" style="width: 3%">主要项目特征:</td>
					<td colspan="1" style="width: 7%"><input
						name="critria._expr[13]._value" class="nui-textbox" id = "features"
						style="width: 200px;" /> <input class="nui-hidden"
						name="critria._expr[13]._property" value="features" /> <input
						class="nui-hidden" name="critria._expr[13]._op" value="=" /></td>	
					<td align="right" style="width: 3%">合同类型:</td>
					<td colspan="1" style="width: 7%"><input
						class="nui-dictcombobox" name="critria._expr[14]._value" id = "contractType"
						style="width: 200px;" dictTypeId="CONTRACT_TYPE" nullItemText="全部"
						showNullItem="true" /> <input class="nui-hidden"
						name="critria._expr[14]._property" value="contractType" /> <input
						class="nui-hidden" name="critria._expr[14]._op" value="=" /></td>
					<td align="right" style="width: 3%">采购方式:</td>
					<td colspan="1" style="width: 7%"><input
						class="nui-dictcombobox" name="critria._expr[15]._value" id = "procurementType"
						style="width: 200px;" dictTypeId="BIDPROCUREMENT_TYPE" nullItemText="全部"
						showNullItem="true" /> <input class="nui-hidden"
						name="critria._expr[15]._property" value="procurementType" /> <input
						class="nui-hidden" name="critria._expr[15]._op" value="=" /></td>
				</tr>
				<tr>
					<td align="right" style="width: 3%">价格模式:</td>
					<td colspan="1" style="width: 7%"><input
						class="nui-dictcombobox" name="critria._expr[16]._value" id = "priceModel"
						style="width: 200px;" dictTypeId="PRICE_MODEL" nullItemText="全部"
						showNullItem="true" /> <input class="nui-hidden"
						name="critria._expr[16]._property" value="priceModel" /> <input
						class="nui-hidden" name="critria._expr[16]._op" value="=" /></td>
					<td align="right" style="width: 3%">折合万/人月:</td>
					<td colspan="1" style="width: 7%"><input
						name="critria._expr[17]._value" class="nui-textbox" id = "equivalent"
						style="width: 200px;" /> <input class="nui-hidden"
						name="critria._expr[17]._property" value="equivalent" /> <input
						class="nui-hidden" name="critria._expr[17]._op" value="=" /></td>	
					<td align="right" style="width: 3%">中标结果:</td>
					<td colspan="1" style="width: 7%"><input
						class="nui-dictcombobox" name="critria._expr[18]._value" id = "bidResult"
						style="width: 200px;" dictTypeId="BID_RESULT" nullItemText="全部"
						showNullItem="true" /> <input class="nui-hidden"
						name="critria._expr[18]._property" value="bidResult" /> <input
						class="nui-hidden" name="critria._expr[18]._op" value="=" /></td>
				</tr>
				<tr>
					<td align="right" style="width: 3%">参与单位:</td>
					<td colspan="1" style="width: 7%">
					<input property="editor" class="nui-combobox" id = "custName"
	                			url="com.zhonghe.ame.marketInfo.marketinfo.khxx.commpetior.getAllCompetitor.biz.ext" filterType="like" 
								textField="custname" valueField="custid" dataField="allCom" valueFromSelect="true"  style="width: 200px;"
								allowInput="true"/>
					</td>
					<td class="form_label" align = "right">定标日期:</td>
	        <td colspan="1">
	            <input class="nui-hidden" name="critria._expr[19]._op" value="between" />
	            <input class="nui-hidden" name="critria._expr[19]._pattern" value="yyyy-MM-dd" />
	            <input class="nui-hidden" name="critria._expr[19]._property" value="opentime" />
	            <input class="nui-datepicker" name="critria._expr[19]._min" style="width: 21%;" id = "opentimeMin"/>
	            <span style="border-spacing: 0px; padding-left: 0.2em; padding-right: 0.2em;">至</span>
	            <input class="nui-datepicker" name="critria._expr[19]._max" style="width: 21%;" id = "opentimeMax"/>
	        </td>
				</tr>
			</table>
	</div>
</div>

	<div class="nui-toolbar" style="border-bottom:0;padding:0px;">
        <table style="width:100%;">
        	<tr>
                <td style="width:20%;">
		            <a class="nui-button" id="checkview" iconCls="icon-add" onclick="add()">增加</a>
		            <a class="nui-button" id="checkview" iconCls="icon-edit" onclick="editBid()">修改</a>
		              <a class="nui-button" id="checkview"  onclick="exportCwlist()">导出</a>
		            <a class="nui-button" id="checkview" iconCls="icon-remove" onclick="deleteBid()">删除</a>
		            <a class="nui-button" id="improt" iconCls="icon-print" onclick="improt()">导入</a>
		        </td>
		        <td   align="right">
		             <a class="nui-button" id="search" iconCls="icon-search" onclick="search()">查询</a>
	            	<a class="nui-button" id="reset" iconCls="icon-reload" onclick="reset()">重置</a>
		        </td>
            </tr>
        </table>           
    </div>
    <div class="nui-fit">
	    <div id="datagrid1"  sizeList="[10,20,50,100]" showPager="true" dataField="data"   sortMode="client"  pageSize="20"
	    	class="nui-datagrid" style="width:100%;height:100%;" url="com.zhonghe.ame.marketInfo.marketinfo.khxx.commpetior.querybidinfoNew.biz.ext" 
	    	multiSelect="true" allowSortColumn=true onshowrowdetail="onShowRowDetail" >
	        <div property="columns">
	        	<div type="checkcolumn"></div>
	        	<div type="expandcolumn" width="20"></div>
	        	<div field="orgname" width="120" align="left" headerAlign="center" allowSort="true"  >牵头部门</div>
	        	<div field="opentime" width="80" align="left" headerAlign="center" dateFormat="yyyy-MM-dd" allowSort="true"  >定标日期</div>
	        	<div field="empname" width="60" align="left" headerAlign="center" allowSort="true" >填报人</div>
	        	<div field="externalType" width="100" align="left" headerAlign="center" allowSort="true" renderer="EXTERNAL_TYPE">内协外联</div>
	        	<div field="partyName" width="180" align="left" headerAlign="center" allowSort="true" >甲方名称</div>
	        	<div field="projectName" width="280" align="left" headerAlign="center" allowSort="true" renderer="lookInfo">项目名称</div>
	        	<div field="investmentAmount" width="80" align="left" headerAlign="center" allowSort="true" >投资额/万</div>
	        	<div field="matterAmount" width="80" align="left" headerAlign="center" allowSort="true"  renderer= "MATTER_AMOUNT">标的额</div>
	        	<div field="projectlocal" width="100" align="left" headerAlign="center" >项目地点</div>
	        	<div field="headquarterGroup" width="100" align="left" headerAlign="center" renderer="HEADQUARTER_GROUP">集团内外</div>
	        	<div field="characteristics" width="80" align="left" headerAlign="center" renderer="CHARACTERISTICS">特点</div>
	        	<div field="serviceType" width="120" align="left" headerAlign="center" allowSort="true" renderer="SERVICE_TYPE">工程类型</div>
	        	<div field="major" width="120" align="left" headerAlign="center" allowSort="true" renderer="BID_MAJOR">专业类型</div>
	        	<div field="scopeService" width="150" align="left" headerAlign="center" allowSort="true" renderer="SCOPE_SERVICE">服务范围</div>
	        	<div field="features" width="150" align="left" headerAlign="center" >主要项目特征</div>
	        	<div field="contractType" width="150" align="left" headerAlign="center" renderer="CONTRACT_TYPE">合同类型</div>
	            <div field="procurementType" width="150" align="left" headerAlign="center" renderer="BIDPROCUREMENT_TYPE">采购方式</div>
	            <div field="priceModel" width="150" align="left" headerAlign="center" allowSort="true" renderer="PRICE_MODEL">价格模式</div>
	            <div field="equivalent" width="150" align="left" headerAlign="center" allowSort="true" >折合万/人月</div>
	            <div field="bidResult" width="120" align="left" headerAlign="center" allowSort="true" renderer="BID_RESULT">中标结果</div>
	            <div field="remake" width="500" align="left" headerAlign="center" >备注</div>
	        </div>
        </div>
	</div>
	<div id="detailGrid_Form" style="display:none;width:55%">
	    <div id="reve_grid" class="nui-datagrid" dataField="bidCom" showSummaryRow="true"
	    	url="com.zhonghe.ame.marketInfo.marketinfo.khxx.commpetior.getBidComInfo.biz.ext" showPager="false" allowCellEdit="true" allowCellSelect="true" multiSelect="true" editNextOnEnterKey="true">			            
	        <div property="columns">
	            <div field="custName"  width="80" headerAlign="center" align="center">参与单位</div>    
	            <div field="comBidPrice" width="60" headerAlign="center" align="center" >报价/合同价/万元/%</div> 
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
		var form = new nui.Form("#form1");
    	var grid = nui.get("datagrid1");
		var reve_grid = nui.get("reve_grid");
		var detailGrid = document.getElementById("detailGrid_Form");   
		search();
		function lookInfo(e) {
			
			var bidid = e.row.id;
			
			if(bidid==0 || bidid==null ){
				nui.alert("查询信息有误");
			}else{
				return "<a href='javascript:void(0)' onclick='doView("+ bidid +");' title='点击查看'>" + e.value + "</a>";
			}
		}
		http://127.0.0.1:8080/default/marketInfo/bid/bidDetail.jsp
		
	    function doView(reiid){
			var executeUrl = "<%= request.getContextPath() %>/marketInfo/bid/bidDetail.jsp?bidid=" + reiid;
			window.open(executeUrl);
	    }
		function dictGetType(e){
			return nui.getDictText('EXP_EXPTYPE',e.value);
		}
		function dictGetStatus(e){
			return nui.getDictText('EXP_CHECKFLAG',e.value);
		}
		 
		function search() {
			//alert(nui.get("opentimeMin").getValue());
			//alert(nui.get("opentimeMax").getValue());
			var custName = nui.get("custName").getValue();
			if(custName == null || custName == ""){
				var form = new nui.Form("#form1");
				var data = form.getData(); //获取表单JS对象数据
		  		grid.load(data); //datagrid加载数据
			}else{
				var custName = nui.get("custName").getValue();
				var orgname = nui.get("orgname").getValue();
				var externalType = nui.get("externalType").getValue();
				var partyName = nui.get("partyName").getValue();
				var projectName = nui.get("projectName").getValue();
				var investmentAmount = nui.get("investmentAmount").getValue();
				var matterAmount = nui.get("matterAmount").getValue();
				var projectlocal = nui.get("projectlocal").getValue();
				var headquarterGroup = nui.get("headquarterGroup").getValue();
				var characteristics = nui.get("characteristics").getValue();
				var serviceType = nui.get("serviceType").getValue();
				var major = nui.get("major").getValue();
				var scopeService = nui.get("scopeService").getValue();
				var features = nui.get("features").getValue(); 
				var contractType = nui.get("contractType").getValue();
				var procurementType = nui.get("procurementType").getValue();
				var priceModel = nui.get("priceModel").getValue();
				var equivalent = nui.get("equivalent").getValue();
				var bdResult = nui.get("bidResult").getValue();
				var opentimeMax = nui.get("opentimeMax").getValue();
				var opentimeMin = nui.get("opentimeMin").getValue();
				var json = nui.encode({'custName':custName,"orgname" : orgname,"externalType" : externalType
					,"partyName" : partyName,"projectName" : projectName,"investmentAmount" : investmentAmount
					,"matterAmount" : matterAmount,"projectlocal" : projectlocal,"headquarterGroup" : headquarterGroup
					,"characteristics" : characteristics,"serviceType" : serviceType,"major" : major
					,"scopeService" : scopeService,"features" : features,"contractType" : contractType
					,"procurementType" : procurementType,"priceModel" : priceModel,"equivalent" : equivalent
					,"bdResult" : bdResult,"opentimeMax":opentimeMax,"opentimeMin":opentimeMin});
				nui.ajax({
		                url: "com.zhonghe.ame.marketInfo.marketinfo.khxx.commpetior.queryMyBid.biz.ext",
		                data: json,
		                type: 'POST',
		                cache: false,
		                contentType: 'text/json',
		                success: function (data) {
		                	grid.setData(data.data);
		                }
		         });    
			}
		}
		function reset(){
			var form = new nui.Form("#form1");
			form.reset();
			grid.load();
			search();
		}
		
		function onOk(){
			search();
		}
	
		
	function exportCwlist(){
		var data = form.getData(); //获取表单JS对象数据
		exportExcel({"url":"com.zhonghe.ame.marketInfo.marketinfo.khxx.commpetior.exMyCreatBid.biz.ext","fileName":"招标信息","data":data});
	}
		
		//修改投标明细
		function editBid(){
    		var row = grid.getSelecteds();
			if (row.length > 1) {
    		nui.alert("只能选中一条项目记录进行编辑");
    		}else{
    		var row=row[0];
			if (row) {
				nui.open({
				url: "/default/marketInfo/bid/editBid.jsp?id="+row.id,
				width: 1114,
				height: 526,
				onload: function () {
					var iframe = this.getIFrameEl();
				},
				ondestroy: function (action){
					
	            		grid.reload();
	            	
				}
			})
			}else{
				nui.alert("请选中一条记录","提示");
			}
			
    		}
		}
		
		//展示明细
		function onShowRowDetail(e) {
		 	var grid = e.sender;
	    	var row = e.record;
	        var td = grid.getRowDetailCellEl(row);
	        td.appendChild(detailGrid);
	        detailGrid_Form.style.display = "block";
	        reve_grid.load({ id: row.id });
		}
		
		//回车触发
		function onKeyEnter(){
			search();
		}
		
		function getExpRei(e){
	    	if(e.value){
	    		return "<a href='javascript:void(0)' onclick='checkExpNo("+ e.value +");' title='点击查看'>" + e.value + "</a>";
	    	}
	    }
	    function checkExpNo(reiid){
			var executeUrl = "<%= request.getContextPath() %>/ame_fee/myExpenseReimbursement/myReiFee.jsp?reiid=" + reiid;
			window.open(executeUrl);
	    }
	    
	    
	    function onActionRenderer(e) {
			var grid = e.sender;
            var record = e.record;
            var uid = record._uid;
        	var processInstID=record.processinstid;
			
			var s = " <a  href='javascript:void(0)' onclick='feeView();' >流程</a>";
			
            return s;
        }
        
        function feeView(){
	        var selectRow = grid.getSelected();
	        var processInstID=selectRow.processinstid;
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
        
		
	function deleteBid(e){
	
			var row = grid.getSelected();
			if (row) {
				
				//获取当前客户的其他信息
				var json = nui.encode({bidid:row.id});
				
				
				var c=confirm("该信息可以删除，您确认吗？");
				if(c==true){ 
				nui.ajax({
					    url: "com.zhonghe.ame.marketInfo.marketinfo.khxx.commpetior.delBidInfo.biz.ext",
						type: 'POST',
						data: json,	
						contentType: 'text/json',
					    success: function (o) {
					           if(o.result==1){
					            nui.alert("删除成功","提示");
					            reset();
					           }else{
					            nui.alert("删除失败","提示");
					           }
					    }
				});
				}
			}else{
				nui.alert("请选中一条记录","提示");
			}
	
	
	
	}
	
	
	function add(){
		nui.open({
			url: "/default/marketInfo/bid/creatBid.jsp",
			width: 1114,
			height: 526,
			onload: function () {
				var iframe = this.getIFrameEl();
			},
			ondestroy: function (action){
			reset();
			}
		})
	}
	
	
	function EXTERNAL_TYPE(e) {
		return nui.getDictText("EXTERNAL_TYPE", e.value);
	}
	function MATTER_AMOUNT(e) {
		return nui.getDictText("MATTER_AMOUNT", e.value);
	}
	function HEADQUARTER_GROUP(e) {
		return nui.getDictText("HEADQUARTER_GROUP", e.value);
	}
	function CHARACTERISTICS(e) {
		return nui.getDictText("CHARACTERISTICS", e.value);
	}
	function SCOPE_SERVICE(e) {
		return nui.getDictText("SCOPE_SERVICE", e.value);
	}
	function SERVICE_TYPE(e) {
		return nui.getDictText("SERVICE_TYPE", e.value);
	}
	function BID_MAJOR(e) {
		return nui.getDictText("BID_MAJOR", e.value);
	}
	function CONTRACT_TYPE(e) {
		return nui.getDictText("CONTRACT_TYPE", e.value);
	}
	function PROCUREMENT_TYPE(e) {
		return nui.getDictText("PROCUREMENT_TYPE", e.value);
	}
	function PRICE_MODEL(e) {
		return nui.getDictText("PRICE_MODEL", e.value);
	}
	function BID_RESULT(e) {
		return nui.getDictText("BID_RESULT", e.value);
	}
	function BIDPROCUREMENT_TYPE(e) {
		return nui.getDictText("BIDPROCUREMENT_TYPE", e.value);
	}
	function improt() {
		nui.open({
          	url: "<%=request.getContextPath()%>/marketInfo/bid/improtMyBid.jsp",
			title : "选择文件",
			width : 700,
			height : 200,
			allowResize : false
		});
	}
</script>
</body>
</html>
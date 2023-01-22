<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>	
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
	<div  class="mini-panel" title="合同收入记录管理" width="auto">
		<div style="width:100%;height:20;padding:0px;margin:0px;"id="form1">
			<div class="nui-toolbar" style="border-bottom:0;padding:0px;">
				<table style="width:100%;">
					<tr>
		            	<td align="right"><span>合同存档编号：</span></td>
		            	<td>
		            		<input class="nui-textbox" name="criteria._expr[0].contnum" style="width: 150px;"/>
					        <input class="nui-hidden" name="criteria._expr[0]._op" value="like"/>
					        <input class="nui-hidden" name="criteria._expr[0]._likeRule" value="all"/>
					    </td>
		            	<td align="right"><span>合同类型：</span></td>
		            	<td>
		            		<input class="nui-dictcombobox" name="criteria._expr[1].contracttype" dictTypeId="MIS_CONTRACTTYPE" multiSelect="true" style="width: 160px;"/>
		            		<input class="nui-hidden" name="criteria._expr[1]._op" value="in"/>
					    </td>
					    <td align="right"><span>合同项目名称：</span></td>
		            	<td>
		            		<input class="nui-textbox" name="criteria._expr[2]._value" style="width: 150px;"/>
		            		<input class="nui-hidden" name="criteria._expr[2]._property" value="projectname"/>
					        <input class="nui-hidden" name="criteria._expr[2]._op" value="like"/>
					        <input class="nui-hidden" name="criteria._expr[2]._likeRule" value="all"/>
					    </td>
						<td align="right"><span>签署单位：</span></td>
		            	<td>
		            		<input class="nui-textbox" name="criteria._expr[3]._value" style="width: 150px;"/>
		            		<input class="nui-hidden" name="criteria._expr[3]._property" value="misCustinfo.custname"/>
					        <input class="nui-hidden" name="criteria._expr[3]._op" value="like"/>
					        <input class="nui-hidden" name="criteria._expr[3]._likeRule" value="all"/>
					    </td>
					</tr>
					<tr>
					    <td align="right"><span>销售姓名：</span></td>
		            	<td>
		            		<input class="nui-textbox" name="criteria._expr[4]._value" id="salename" style="width: 150px;"/>
		            		<input class="nui-hidden" name="criteria._expr[4]._property" value="salename"/>
					        <input class="nui-hidden" name="criteria._expr[4]._op" value="like"/>
					        <input class="nui-hidden" name="criteria._expr[4]._likeRule" value="all"/>
					    </td>
					    <td align="right"><span>所属事业部：</span></td>
		            	<td>
		            		<input class="nui-dictcombobox" id="org" name="criteria._expr[5]._value" dictTypeId="CONT_ORG" showNullItem="true" nullItemText="全部" allowinput="true" style="width: 160px;"/>
		            		<input class="nui-hidden" name="criteria._expr[5]._property" value="org"/>
					        <input class="nui-hidden" name="criteria._expr[5]._op" value="like"/>
					        <input class="nui-hidden" name="criteria._expr[5]._likeRule" value="all"/>
					    </td>
					    <td align="right"><span>收入确认状态 ：</span></td>
					    <td align="left">
			            	<input class="nui-hidden" name="criteria._expr[6]._property" value="contnum"/>
					        <input class="nui-hidden" name="criteria._expr[6]._op" value="in" id="tempcond11"/>
					        <input class="nui-hidden" name="criteria._expr[6]._ref" value="1" id="tempcond12"/>
					        <input class="nui-hidden" name="criteria._ref[0]._id" value="1"/>
					        <input class="nui-hidden" name="criteria._ref[0]._select._field[0]" value="contnum"/>
					        <input class="nui-hidden" name="criteria._ref[0]._entity" value="com.primeton.mis.contract.contract.CsReveForecast"/>
					        <input class="nui-hidden" name="criteria._ref[0]._expr[0]._property" value="status">
		            		<input class="nui-dictcombobox" name="criteria._ref[0]._expr[0]._value" id="dyassetnum1" style="width:150px;" dictTypeId="AME_REVESTATUS" multiSelect="true" onvaluechanged="changeStatus"/>
					        <input class="nui-hidden" name="criteria._ref[0]._expr[0]._op" value="in"/>
						</td>		
					    <td align="right"><span>收入类型：</span></td>
		            	<td>
		            		<input class="nui-hidden" name="criteria._expr[7]._property" value="contnum"/>
					        <input class="nui-hidden" name="criteria._expr[7]._op" value="in" id="tempcond21"/>
					        <input class="nui-hidden" name="criteria._expr[7]._ref" value="2" id="tempcond22"/>
					        <input class="nui-hidden" name="criteria._ref[1]._id" value="2"/>
					        <input class="nui-hidden" name="criteria._ref[1]._select._field[0]" value="contnum"/>
					        <input class="nui-hidden" name="criteria._ref[1]._entity" value="com.primeton.mis.contract.contract.CsReveForecast"/>
					        <input class="nui-hidden" name="criteria._ref[1]._expr[0]._property" value="revetype" >
		            		<input class="nui-dictcombobox" name="criteria._ref[1]._expr[0]._value" dictTypeId="AME_REVETYPE" id="dyassetnum2" multiSelect="true" style="width:150px;" onvaluechanged="changeRevetype"/>
		            		<input class="nui-hidden" name="criteria._ref[1]._expr[0]._op" value="in"/>
					    </td>	
					</tr>
					<tr>
						<td align="right"><span>预计收入确认证据：</span></td>
		            	<td>
		            		<input class="nui-hidden" name="criteria._expr[8]._property" value="contnum"/>
					        <input class="nui-hidden" name="criteria._expr[8]._op" value="in" id="tempcond31"/>
					        <input class="nui-hidden" name="criteria._expr[8]._ref" value="3" id="tempcond32"/>
					        <input class="nui-hidden" name="criteria._ref[2]._id" value="3"/>
					        <input class="nui-hidden" name="criteria._ref[2]._select._field[0]" value="contnum"/>
					        <input class="nui-hidden" name="criteria._ref[2]._entity" value="com.primeton.mis.contract.contract.CsReveForecast"/>
					        <input class="nui-hidden" name="criteria._ref[2]._expr[0]._property" value="reveproof" >
		            		<input class="nui-dictcombobox" name="criteria._ref[2]._expr[0]._value" dictTypeId="MIS_INCOMECONV" id="dyassetnum3" multiSelect="true" style="width:150px;" onvaluechanged="changeReveproof"/>
		            		<input class="nui-hidden" name="criteria._ref[2]._expr[0]._op" value="in"/>
					    </td>	
					    <td align="right"><span>新合同收入类型：</span></td>
		            	<td>
		            		<input class="nui-hidden" name="criteria._expr[9]._property" value="contnum"/>
					        <input class="nui-hidden" name="criteria._expr[9]._op" value="in" id="tempcond41"/>
					        <input class="nui-hidden" name="criteria._expr[9]._ref" value="4" id="tempcond42"/>
					        <input class="nui-hidden" name="criteria._ref[3]._id" value="4"/>
					        <input class="nui-hidden" name="criteria._ref[3]._select._field[0]" value="contnum"/>
					        <input class="nui-hidden" name="criteria._ref[3]._entity" value="com.primeton.mis.contract.contract.CsReveForecast"/>
					        <input class="nui-hidden" name="criteria._ref[3]._expr[0]._property" value="newtype" >
		            		<input class="nui-dictcombobox" name="criteria._ref[3]._expr[0]._value" dictTypeId="AME_NEWTYPE" id="dyassetnum4" multiSelect="true" style="width:160px;" onvaluechanged="changeNewtype"/>
		            		<input class="nui-hidden" name="criteria._ref[3]._expr[0]._op" value="in"/>
					    </td>
					    <td align="right"><span>实际确认日期：</span></td>
		            	<td>
		            		<input class="nui-hidden" name="criteria._expr[10]._property" value="contnum"/>
					        <input class="nui-hidden" name="criteria._expr[10]._op" value="in" id="tempcond43"/>
					        <input class="nui-hidden" name="criteria._expr[10]._ref" value="5" id="tempcond44"/>
					        <input class="nui-hidden" name="criteria._ref[4]._id" value="5"/>
					        <input class="nui-hidden" name="criteria._ref[4]._select._field[0]" value="contnum"/>
					        <input class="nui-hidden" name="criteria._ref[4]._entity" value="com.primeton.mis.contract.contract.CsReveForecast"/>
					        <input class="nui-hidden" name="criteria._ref[4]._expr[0]._property" value="maconfirmday" >
		            		<input class="nui-datepicker" name="criteria._ref[4]._expr[0]._min" id="startTime" style="width:100px" onvaluechanged="changeConfirmday"/>-<input class="nui-datepicker" name="criteria._ref[4]._expr[0]._max" id="endTime" style="width:100px" onvaluechanged="changeConfirmday"/>
		            		<input class="nui-hidden" name="criteria._ref[4]._expr[0]._op" value="between"/>
					        <input class="nui-hidden" name="criteria._ref[4]._expr[0]._pattern" value="yyyy-MM-dd"/>
					    </td>
					</tr>
					<tr>
		    			<td align="center" colspan="15">
                            <a class="nui-button" id="search" iconCls="icon-search" onclick="search()">查找</a>
                            <a class="nui-button" id="reset" iconCls="icon-reload" onclick="reset">重置</a>	
                            <a class="nui-button" onclick="exportCsReves" iconCls="icon-download"  id="csReveForecast_exportButton">导出</a>
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
	    <div style="width:100%;">
	        <div class="nui-toolbar" style="border-bottom:0;padding:0px;">
	            <table style="width:100%;">
	            	<tr>
	                    <td style="width:20%;">
	                        <a class="nui-button" id="addBtn" iconCls="icon-edit" onclick="addOrEdit()">增加/编辑合同收入记录</a>
	                        <a class="nui-button" id="startBtn" iconCls="icon-goto" onclick="startIncome()">发起收入确认流程</a>
	                        <a class="nui-button" id="addBtn" iconCls="icon-edit" onclick="withdraw()">合同已确认收入记录撤回</a>
	                    </td>
	                </tr>
                 </table>
	        </div>
	    </div>
	    <div id="cont_grid" class="nui-datagrid" style="width:auto;height:335px;" allowResize="true" dataField="contracts" url="com.primeton.eos.ame_income.csReveForecast.queryContract.biz.ext"
	    	 sizeList="[10,20,50,100]"  idField="appid" multiSelect="true" onshowrowdetail="onShowRowDetail" showSummaryRow="true" ondrawsummarycell="doCountSum">
			<div property="columns">
				<div type="expandcolumn"></div>
				<div type="checkcolumn" width="25"></div>
				<div field="contractid" width="0">合同ID</div>
				<div field="contnum" width="73" renderer="onTitleRenderer" headerAlign="center" allowSort="true" renderer="renderCss" renderer="onTitleRenderer">合同存档编号</div>
		        <div field="contreg" width="80" headerAlign="center" dateFormat="yyyy-MM-dd" allowSort="true">登记日期</div>
		        <div field="misCustinfo.custname" width="160" dateFormat="yyyy-MM-dd" headerAlign="center" allowSort="true">签署单位</div>
		        <div field="projectname" width="180" headerAlign="center">合同项目名称</div>
		        <div field="contsum" summaryType="sum" currencyUnit="￥" dataType="currency" align="right" width="100" headerAlign="center" allowSort="true" >总金额（元）</div>
		        <div field="servsubmon" summaryType="sum" currencyUnit="￥" dataType="currency" align="right" width="100" headerAlign="center" allowSort="true" >外包1金额（元）</div>
		        <div field="times" align="right" width="100" headerAlign="center" >已确认收入次数</div>
		        <div field="rate" align="right" width="100" headerAlign="center" renderer="csReveRate">收入确认比例</div>
		        <div field="confMoney" align="right" width="100" headerAlign="center" dataType="currency" summaryType="sum" currencyUnit="￥" >待确认收入(含税)</div>
		        <div field="sumMoney" dataType="currency" summaryType="sum" currencyUnit="￥" align="right" width="100" headerAlign="center" >已确认收入(含税)</div>
		        <div field="gathermon" dataType="currency" summaryType="sum" currencyUnit="￥" align="right" width="100" headerAlign="center">已收款金额（元）</div>
		        <div field="salename" width="70" headerAlign="center" allowSort="true">销售姓名</div>
		        <div field="org" renderer="onGenderRenderer" width="100" headerAlign="center" allowSort="true">部门</div>
		        <div field="projectno" align="center" width="90" headerAlign="center" renderer="renderProj">项目编号</div>
		        <div field="projectId" width="0" >项目id</div>
			</div>
		</div>
		<div id="detailGrid_Form" style="display:none;">
	        <div id="reve_grid" class="nui-datagrid" style="width:100%;height:auto;" oncellendedit="doSubCal" dataField="csReveForecasts" showSummaryRow="true" ondrawsummarycell="doCountSum"
	        url="com.primeton.eos.ame_income.csReveForecast.queryIncome.biz.ext" showPager="false" allowCellEdit="true" allowCellSelect="true" multiSelect="true" editNextOnEnterKey="true">			            
	            <div property="columns">
					<div field="reveno" width="65" align="center"  headerAlign="center" allowSort="true" renderer="getDetail">收入确认次数</div>
					<div field="revetype" width="75" align="center"  headerAlign="center" allowSort="true" renderer="dictReveType">收入类型</div>
					<div field="fcsum" width="70" align="right" headerAlign="center" summaryType="sum" dataType="currency" currencyUnit="￥">预计确认金额</div>	
					<div field="newyearmonth" width="85" align="center"  headerAlign="center">预计确认年月</div>
					<div field="revetimedesc" width="80" align="center" headerAlign="center" >收入确认时点描述</div>
					<div field="reveproof" width="100" align="center" headerAlign="center" renderer="dictproof">预计收入确认证据</div>		
					<div field="status" width="70" align="center" headerAlign="center" renderer="dictstatus">目前确认状态</div>		
					<div field="maconfirmday" width="70" align="center" headerAlign="center" >实际确认日期</div>	
					<div field="actsum" width="70" headerAlign="center" dataType="currency" summaryType="sum" currencyUnit="￥" align="right">实际确认金额</div>
	            </div>
	        </div>    
	    </div>
	</div>
	<script type="text/javascript">
		/**供应商查询*/
		var form = new nui.Form("#form1");
    	nui.parse();
    	var cont_grid = nui.get("cont_grid");
    	var reve_grid = nui.get("reve_grid");
    	init();
    	function init(){
    		//初始化事业部
			nui.ajax({
                url: "com.primeton.eos.ame_common.sendMail.getMySYB.biz.ext",
                type: "post",
                cache: false,
                contentType: 'text/json',
                success: function (text) {
					//除了PMO都能查到事业部，PMO为0
		    		if(text.syb.length > 0){
		    			//禁用按钮
		    			//nui.get("addBtn").disable();
	    				var sybdata = [];
	    				for(var i = 0;i < text.syb.length;i ++){
	    					sybdata[i] = {"dictID": text.syb[i].dictid,"dictName": text.syb[i].dictname};
	    				}
	    				nui.get("org").setData(sybdata);
	    				if(text.syb.length==1){
	    					nui.get("org").setValue(sybdata[0].dictID);
		    				nui.get("org").setText(sybdata[0].dictName);
		    				//如果只有一个事业部,不显示nullitem，默认选择自己的事业部
		    				nui.get("org").setShowNullItem(false);
	    					nui.get("org").select(0);
	    					if(nui.get("dyassetnum1").getValue()==""||nui.get("dyassetnum1").getValue()==null){
								nui.get("tempcond11").setValue("=");
								nui.get("tempcond12").setValue("");
							} 
	    					if(nui.get("dyassetnum2").getValue()==""||nui.get("dyassetnum2").getValue()==null){
								nui.get("tempcond21").setValue("=");
								nui.get("tempcond22").setValue("");
							} 
							var data = form.getData();
						  	cont_grid.load(data); 
							cont_grid.sortBy("contnum","desc");
		    				return;
	    				}else {//如果有多个事业部,不显示nullitem，默认查询两个事业部所有订单
	    					nui.get("org").setShowNullItem(false);
	    					nui.get("org").select(0);
	    					if(nui.get("dyassetnum1").getValue()==""||nui.get("dyassetnum1").getValue()==null){
								nui.get("tempcond11").setValue("=");
								nui.get("tempcond12").setValue("");
							} 
							if(nui.get("dyassetnum2").getValue()==""||nui.get("dyassetnum2").getValue()==null){
								nui.get("tempcond21").setValue("=");
								nui.get("tempcond22").setValue("");
							} 
							var data = form.getData();
						  	cont_grid.load(data); 
							cont_grid.sortBy("contnum","desc");
		    				return;
	    				}
    				}else{
    					//PMO权限,默认展示全部
    					if(nui.get("dyassetnum1").getValue()==""||nui.get("dyassetnum1").getValue()==null){
							nui.get("tempcond11").setValue("=");
							nui.get("tempcond12").setValue("");
						} 
						if(nui.get("dyassetnum2").getValue()==""||nui.get("dyassetnum2").getValue()==null){
							nui.get("tempcond21").setValue("=");
							nui.get("tempcond22").setValue("");
						} 
						var data = form.getData(); //获取表单JS对象数据
					  	cont_grid.load(data); 
						cont_grid.sortBy("contnum","desc");
    				}
                },
                error: function () {
                }
           	});
           	
           	//按钮权限的控制
           	getOpeatorButtonAuth("csReveForecast_exportButton");
           	
		}
		function dictproof(e) {
			return nui.getDictText('MIS_INCOMECONV',e.value);//设置业务字典值
		}
		function dictmonth(e) {
			return nui.getDictText('AME_MONTHPERIOD',e.value);//设置业务字典值
		}
		function dictstatus(e) {
	  		if(e.record.processinstid){//有流程实例id
				if(e.value == "2"||e.value == "3"){
					return "<a href='javascript:void(0)' onclick='checkDictstatus();' title='点击查看流程图'>" + nui.getDictText('AME_REVESTATUS',e.value) + "</a>";
				}else{
					return nui.getDictText('AME_REVESTATUS',e.value);//设置业务字典值
				}
	  		}else{//没有流程实例id
				return nui.getDictText('AME_REVESTATUS',e.value);//设置业务字典值
			}
		}
		function checkDictstatus(e){
			var selectRow = reve_grid.getSelected();
			var processInstID = selectRow.processinstid;
    		var url = "/default/bps/wfclient/task/processinstView.jsp";
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
		function onGenderRenderer(e) {
            return nui.getDictText('CONT_ORG',e.value);
        }
		function dictReveType(e) {
            return nui.getDictText('AME_REVETYPE',e.value);
        }
        function renderrate(e) {
			return parseFloat(e.value*100).toFixed(1)+"%";
        }
        function changeStatus(){
			if(!(nui.get("dyassetnum1").getValue()==""||nui.get("dyassetnum1").getValue()==null)){
				nui.get("tempcond11").setValue("in");
				nui.get("tempcond12").setValue("1");
			}
		}
        function changeRevetype(){
			if(!(nui.get("dyassetnum2").getValue()==""||nui.get("dyassetnum2").getValue()==null)){
				nui.get("tempcond21").setValue("in");
				nui.get("tempcond22").setValue("2");
			}
		}
		function changeReveproof(){
			if(!(nui.get("dyassetnum3").getValue()==""||nui.get("dyassetnum3").getValue()==null)){
				nui.get("tempcond21").setValue("in");
				nui.get("tempcond22").setValue("3");
			}
		}
		function changeNewtype(){
			if(!(nui.get("dyassetnum4").getValue()==""||nui.get("dyassetnum4").getValue()==null)){
				nui.get("tempcond41").setValue("in");
				nui.get("tempcond42").setValue("4");
			}
		}
		function changeConfirmday(){
			if((nui.get("startTime").getValue()!=""&&nui.get("startTime").getValue()!=null)||(nui.get("endTime").getValue()!=""&&nui.get("endTime").getValue()!=null)){
				nui.get("tempcond43").setValue("in");
				nui.get("tempcond44").setValue("5");
			}
		}
        function doCountSum(e){        	
            if (e.field == "fcsum") {
                e.cellHtml = "<div align='right'><b>" + e.cellHtml + "</b></div>";
            }
           	if (e.field == "actsum") {
                e.cellHtml = "<div align='right'><b>" + e.cellHtml + "</b></div>";
            }
           	if (e.field == "contsum") {
                e.cellHtml = "<div align='right'><b>" + e.cellHtml + "</b></div>";
            }
           	if (e.field == "sumMoney") {
                e.cellHtml = "<div align='right'><b>" + e.cellHtml + "</b></div>";
            }
           	if (e.field == "gathermon") {
                e.cellHtml = "<div align='right'><b>" + e.cellHtml + "</b></div>";
            }
           	if (e.field == "confMoney") {
                e.cellHtml = "<div align='right'><b>" + e.cellHtml + "</b></div>";
            }
           	if (e.field == "servsubmon") {
                e.cellHtml = "<div align='right'><b>" + e.cellHtml + "</b></div>";
            }
        }
        function renderCss(e){        	
            e.cellmeta = "style='width:600px";
        }
        function csReveRate(e){
        	if(e.value!=-1){//-1代表没有合同总金额或合同总金额为空
	        	return parseFloat(e.value*100).toFixed(2)+"%";
        	}else{
        		return "合同总金额为空";
        	}
        }
		var detailGrid_Form = document.getElementById("detailGrid_Form");
		function onShowRowDetail(e) {
	        var cont_grid = e.sender;
	        var cont_row = e.record;
			var currentRow = cont_row;
	        var td = cont_grid.getRowDetailCellEl(cont_row);
	        td.appendChild(detailGrid_Form);
	        //查询收入预估
	        if(cont_row.contnum==null || cont_row.contnum==""){
	        	return;
	        }else{
	            var incomedata = {contnum: cont_row.contnum};
	            reve_grid.load(incomedata);
				$('#detailGrid_Form').show();
	        }
		}
		
		function search() {
            var form = new nui.Form("#form1");
            if(nui.get("dyassetnum1").getValue()==""||nui.get("dyassetnum1").getValue()==null){
				nui.get("tempcond11").setValue("=");
				nui.get("tempcond12").setValue("");
			} 
			if(nui.get("dyassetnum2").getValue()==""||nui.get("dyassetnum2").getValue()==null){
				nui.get("tempcond21").setValue("=");
				nui.get("tempcond22").setValue("");
			}
			if(nui.get("dyassetnum3").getValue()==""||nui.get("dyassetnum3").getValue()==null){
				nui.get("tempcond31").setValue("=");
				nui.get("tempcond32").setValue("");
			} 
			if(nui.get("dyassetnum4").getValue()==""||nui.get("dyassetnum4").getValue()==null){
				nui.get("tempcond41").setValue("=");
				nui.get("tempcond42").setValue("");
			} 
			if((nui.get("startTime").getValue()==""||nui.get("startTime").getValue()==null)&&(nui.get("endTime").getValue()==""||nui.get("endTime").getValue()==null)){
				nui.get("tempcond43").setValue("=");
				nui.get("tempcond44").setValue("");
			} 
			var data = form.getData();
            cont_grid.load(data);
        }
		
		function reset(){
			var form = new nui.Form("#form1");
			form.reset();
			cont_grid.load();
		}
		function addOrEdit() {
			var rows = cont_grid.getSelecteds();
			if(rows.length<1){
				alert("请选中一条合同记录!");
			}else if (rows.length>1){
				alert("只能选中一条记录！");
			}else{
				var row = cont_grid.getSelected();
	            nui.open({
	                url: "<%=request.getContextPath() %>/ame_income/csReveForecast/showCsContAndCsReveForecast.jsp",
	                title: "新增/编辑合同收入记录", 
					width: 1100,
		            height: 520,
	                onload: function () {
	                    var iframe = this.getIFrameEl();
	                    var data = {contractid: row.contractid };
		              	iframe.contentWindow.SetData(data);
	                },
	                ondestroy: function (action) {
	                    cont_grid.reload();
	                }
	            });
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
			window.open(executeUrl, "合同收入记录详细信息","height=550, width=1200,top="+iTop+",left="+iLeft+",resizable=yes" );
	    }
	    
	    function onTitleRenderer(e) {
			return "<a href='javascript:void(0)' onclick='doView();' title='点击查看'>" + e.value + "</a>";
		}
		function doView(){
			var selectRow = cont_grid.getSelected();
			var executeUrl = "<%=request.getContextPath() %>/contract/contract/contractView.jsp?contractid=" + selectRow.contractid;
			window.open(executeUrl, "合同查看", "fullscreen=1");
		}
		//项目详细信息
        function renderProj(e){
        	if(e.value==null){
        		return;
        	}
        	return "<a href='javascript:void(0)' onclick='detailProj1();' title='点击查看项目信息'>" + e.value + "</a>";
        }
        function detailProj1(){
	 		var selectRow = cont_grid.getSelected();
	 		var executeUrl = "/default/project/rdproject/projectDetail.jsp?projid=" + selectRow.projectId;
			window.open(executeUrl);
	    }
	    
	    //发起收入确认流程
		function startIncome(){
			var row = cont_grid.getSelected();
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
		
		function withdraw(){
			var rows = cont_grid.getSelecteds();
			if(rows.length<1){
				alert("请选中一条合同记录!");
				return;
			}else if (rows.length>1){
				alert("只能选中一条记录！");
				return;
			}else if(rows[0].sumMoney == 0 || rows[0].sumMoney == null){
				alert("该合同没有已确认收入！");
				return;
			}else{
				var row = cont_grid.getSelected();
	            nui.open({
	                url: "<%=request.getContextPath() %>/ame_income/csReveForecast/withdrawCsReveForecast.jsp",
	                title: "已确认收入撤回", 
					width: 1100,
		            height: 520,
	                onload: function () {
	                    var iframe = this.getIFrameEl();
	                    var data = {contractid: row.contractid };
		              	iframe.contentWindow.SetData(data);
	                },
	                ondestroy: function (action) {
	                    cont_grid.reload();
	                }
	            });
			}
		}
	    function exportCsReves(){
	    	nui.confirm("是否确认导出收入合同记录？", "确定？",
            function (action) {
            	if(action=='ok'){
            		var form = new nui.Form("#form1");
		            if(nui.get("dyassetnum1").getValue()==""||nui.get("dyassetnum1").getValue()==null){
						nui.get("tempcond11").setValue("=");
						nui.get("tempcond12").setValue("");
					} 
					if(nui.get("dyassetnum2").getValue()==""||nui.get("dyassetnum2").getValue()==null){
						nui.get("tempcond21").setValue("=");
						nui.get("tempcond22").setValue("");
					}
					if(nui.get("dyassetnum3").getValue()==""||nui.get("dyassetnum3").getValue()==null){
						nui.get("tempcond31").setValue("=");
						nui.get("tempcond32").setValue("");
					}  
					if(nui.get("dyassetnum4").getValue()==""||nui.get("dyassetnum4").getValue()==null){
						nui.get("tempcond41").setValue("=");
						nui.get("tempcond42").setValue("");
					} 
					if((nui.get("startTime").getValue()==""||nui.get("startTime").getValue()==null)&&(nui.get("endTime").getValue()==""||nui.get("endTime").getValue()==null)){
						nui.get("tempcond43").setValue("=");
						nui.get("tempcond44").setValue("");
					} 
            		var json = form.getData();
            		cont_grid.loading("操作中，请稍后......");
					nui.ajax({
		    			url: "com.primeton.eos.ame_income.csReveForecast.exportContract.biz.ext",
				        type: "post",
				        data: json,
				        cache: false,
				        contentType: 'text/json',
				        success: function (o) {
				     		cont_grid.unmask();
				     		var filePath = o.downloadFile;
				        	var fileName = "收入合同记录";
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
				        	cont_grid.unmask();
				        	alert("error");
				        }
					});
            		
            	}
            });
	    }
  </script>
</body>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>	
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@page import="com.eos.data.datacontext.UserObject"%>
<%@page import="commonj.sdo.DataObject"%>
<%@page import="java.util.Map"%>
<html>
<!-- 
  - Author(s): zhuyonglun
  - Date: 2016-05-31 14:37:23
  - Description:
-->
<head>
	<title>采购计提查询</title>
	<meta http-equiv="content-type" content="text/html; charset=UTF-8" />
	<script src="<%= request.getContextPath() %>/common/nui/nui.js" type="text/javascript"></script>
</head>
<body>
	<div class="nui-fix">
		<div class="nui-panel" title="计提管理" width="auto">
			<div style="width:100%;height:100%;padding:0px;margin:0px;" id="form1">
				<div class="nui-toolbar" style="border-bottom:0;padding:0px;">
					<table style="width:100%;">
						<tr>
							<td align="right" style="width: 100px"><span>开始日期：</span></td>
			            	<td align="left" style="width: 220px;">
			            		<input name="criteria._expr[9]._min" class="nui-datepicker" style="width:100px;"/>-<input name="criteria._expr[9]._max" class="nui-datepicker" style="width:100px;" />
							    <input class="nui-hidden" name="criteria._expr[9]._property" value="startdate"/>
							    <input class="nui-hidden" name="criteria._expr[9]._op" value="between"/>
			            	</td>	
							<td align="right" style="width: 100px"><span>供应商名称：</span></td>
			            	<td align="left" style="width: 120px;">
							    <input name="criteria._expr[0]._value" class="nui-textbox" style="width:120px;" onenter="onKeyEnter"/>
							    <input class="nui-hidden" name="criteria._expr[0]._property" value="custname"/>
							    <input class="nui-hidden" name="criteria._expr[0]._op" value="like"/>
							    <input class="nui-hidden" name="criteria._expr[0]._likeRule" value="all"/>
							</td>
							<td align="right" style="width: 100px"><span>项目名称：</span></td>
			            	<td align="left" style="width: 120px;">
			            		<input name="criteria._expr[1]._value" class="nui-textbox" style="width:120px;" onenter="onKeyEnter"/>
							    <input class="nui-hidden" name="criteria._expr[1]._property" value="projectname"/>
							    <input class="nui-hidden" name="criteria._expr[1]._op" value="like"/>
							    <input class="nui-hidden" name="criteria._expr[1]._likeRule" value="all"/>
							</td>
							<td align="right" style="width: 100px"><span>项目编号：</span></td>
			            	<td align="left" >
			            		<input name="criteria._expr[2]._value" class="nui-textbox" style="width:120px;" onenter="onKeyEnter"/>
							    <input class="nui-hidden" name="criteria._expr[2]._property" value="projectno"/>
							    <input class="nui-hidden" name="criteria._expr[2]._op" value="like"/>
							    <input class="nui-hidden" name="criteria._expr[2]._likeRule" value="all"/>
			            	</td>
						</tr>
						<tr>
							<td align="right"><span>结束日期：</span></td>
			            	<td align="left">
			            		<input name="criteria._expr[10]._min" class="nui-datepicker" style="width:100px;"/>-<input name="criteria._expr[10]._max" class="nui-datepicker" style="width:100px;" />
							    <input class="nui-hidden" name="criteria._expr[10]._property" value="enddate"/>
							    <input class="nui-hidden" name="criteria._expr[10]._op" value="between"/>
			            	</td>
							<td align="right"><span>所属客户：</span></td>
			            	<td align="left">
							    <input name="criteria._expr[4]._value" class="nui-textbox" style="width:120px;" onenter="onKeyEnter"/>
							    <input class="nui-hidden" name="criteria._expr[4]._property" value="custname1"/>
							    <input class="nui-hidden" name="criteria._expr[4]._op" value="like"/>
							    <input class="nui-hidden" name="criteria._expr[4]._likeRule" value="all"/>
							</td> 
							<td align="right"><span>所属销售：</span></td>
			            	<td align="left">
							    <input name="criteria._expr[5]._value" class="nui-textbox" style="width:120px;" onenter="onKeyEnter"/>
							    <input class="nui-hidden" name="criteria._expr[5]._property" value="orgname"/>
							    <input class="nui-hidden" name="criteria._expr[5]._op" value="like"/>
							    <input class="nui-hidden" name="criteria._expr[5]._likeRule" value="all"/>
							</td>
							<td align="right"><span>所属事业部：</span></td>
			            	<td align="left">
							    <input name="criteria._expr[6]._value" class="nui-dictcombobox" dictTypeId="CONT_ORG" shownullItem="true" style="width:120px;"/>
							    <input class="nui-hidden" name="criteria._expr[6]._property" value="syb"/>
							</td> 
						</tr>
						<tr>
							<td align="right"><span>计提时间：</span></td>
			            	<td align="left">
			            		<input name="criteria._expr[12]._min" class="nui-datepicker" style="width:100px;"/>-<input name="criteria._expr[12]._max" class="nui-datepicker" style="width:100px;" />
							    <input class="nui-hidden" name="criteria._expr[12]._property" value="accrueddate"/>
							    <input class="nui-hidden" name="criteria._expr[12]._op" value="between"/>
			            	</td>
							<td align="right"><span>成本归属类型：</span></td>
			            	<td align="left">
			            		<input name="criteria._expr[8]._value" class="nui-dictcombobox" dictTypeId="AME_CONTCOSTTYPE" shownullItem="true" style="width:120px;"/>
							    <input class="nui-hidden" name="criteria._expr[8]._property" value="costtype"/>
			            	</td>
			            	<td align="right"><span>采购合同编号：</span></td>
			            	<td align="left" style="width: 160px;">
			            		<input name="criteria._expr[14]._value" class="nui-textbox" style="width:120px;" onenter="onKeyEnter"/>
							    <input class="nui-hidden" name="criteria._expr[14]._property" value="purcontnum"/>
							    <input class="nui-hidden" name="criteria._expr[14]._op" value="like"/>
							    <input class="nui-hidden" name="criteria._expr[14]._likeRule" value="all"/>
			            	</td>
			            	<!-- 2016年10月26日增加 -->
			            	<td align="right" style="width: 120px"><span>财务对应合同编号：</span></td>
			            	<td align="left" style="width: 160px;">
			            		<input name="criteria._expr[3]._value" class="nui-textbox" style="width:120px;" onenter="onKeyEnter"/>
							    <input class="nui-hidden" name="criteria._expr[3]._property" value="contnum"/>
							    <input class="nui-hidden" name="criteria._expr[3]._op" value="like"/>
							    <input class="nui-hidden" name="criteria._expr[3]._likeRule" value="all"/>
			            	</td>
						</tr>
						<tr>
							<td align="right"><span>计提金额：</span></td>
			            	<td align="left">
			            		<input name="criteria._expr[15]._min" class="nui-textbox" style="width:100px;"/>-<input name="criteria._expr[15]._max" class="nui-textbox" style="width:100px;" />
							    <input class="nui-hidden" name="criteria._expr[15]._property" value="accruedmoney"/>
							    <input class="nui-hidden" name="criteria._expr[15]._op" value="between"/>
			            	</td>
							<td align="right"><span>计提ID：</span></td>
			            	<td align="left">
			            		<input name="criteria._expr[13]._value" class="nui-textbox" style="width:120px;" onenter="onKeyEnter"/>
							    <input class="nui-hidden" name="criteria._expr[13]._property" value="accruedid"/>
			            	</td>
			            	<td align="right"><span>合同类型：</span></td>
			            	<td align="left">
			            		<input name="criteria._expr[16]._value" class="nui-dictcombobox" dictTypeId="MIS_CONTRACTTYPE" shownullItem="true" style="width:120px;"/>
							    <input class="nui-hidden" name="criteria._expr[16]._property" value="contracttype"/>
			            	</td>
			            	<td align="right"><span>相关外包人员：</span></td>
			            	<td align="left">
			            		<input name="criteria._expr[11]._value" class="nui-textbox" style="width:120px;" onenter="onKeyEnter"/>
							    <input class="nui-hidden" name="criteria._expr[11]._property" value="outper"/>
							    <input class="nui-hidden" name="criteria._expr[11]._op" value="like"/>
							    <input class="nui-hidden" name="criteria._expr[11]._likeRule" value="all"/>
			            	</td>
						</tr>
						<tr>
							<td align="right"><span>成本确认日期：</span></td>
			            	<td align="left">
			            		<input name="criteria._expr[18]._min" class="nui-datepicker" style="width:100px;"/>-<input name="criteria._expr[18]._max" class="nui-datepicker" style="width:100px;" />
							    <input class="nui-hidden" name="criteria._expr[18]._property" value="confirmdate"/>
							    <input class="nui-hidden" name="criteria._expr[18]._op" value="between"/>
			            	</td>
							<td align="right"><span>计提状态：</span></td>
			            	<td align="left" colspan="2">
							    <input name="criteria._expr[7]._value" class="nui-dictcombobox" dictTypeId="AME_ACCRUEDSTATUS" shownullItem="true" multiSelect="true" style="width:220px;"/>
							    <input class="nui-hidden" name="criteria._expr[7]._property" value="accruedstatus"/>
							    <input class="nui-hidden" name="criteria._expr[7]._op" value="in"/>
							</td>
							<td align="right" colspan="2"><span>项目合同编号与计提对应财务合同编号是否一致：</span></td>
			            	<td align="left">
			            		<input name="criteria._expr[17]._value" class="nui-dictcombobox" dictTypeId="MIS_YN" shownullItem="true" style="width:100px;"/>
							    <input class="nui-hidden" name="criteria._expr[17]._property" value="issame"/>
			            	</td>
						</tr>
						<tr>
							<td align="right"><span>记账日期：</span></td>
			            	<td align="left">
			            		<input name="criteria._expr[19]._min" class="nui-datepicker" style="width:100px;"/>-<input name="criteria._expr[19]._max" class="nui-datepicker" style="width:100px;" />
							    <input class="nui-hidden" name="criteria._expr[19]._property" value="acctdate"/>
							    <input class="nui-hidden" name="criteria._expr[19]._op" value="between"/>
			            	</td>
							<td align="right"><span>是否已记账：</span></td>
			            	<td align="left" colspan="2">
							    <input name="criteria._expr[20]._value" class="nui-dictcombobox" dictTypeId="MIS_YN" shownullItem="true" style="width:220px;"/>
							    <input class="nui-hidden" name="criteria._expr[20]._property" value="isacct"/>
							    <input class="nui-hidden" name="criteria._expr[20]._op" value="="/>
							</td>
							<td colspan="3"></td>
			            	
						</tr>
					    <tr>
			    			<td align="center" colspan="15">
		                        <a class="nui-button" id="search" iconCls="icon-search" onclick="search()">查询</a>
		                        <a class="nui-button" id="reset" iconCls="icon-reload" onclick="reset()">重置</a>
		                        <a class="nui-button" onclick="exportOutAccrued" iconCls="icon-download" style="width:135px;" id="exportButton">导出计提数据</a>	
		                   </td>
		                </tr>
		            </table>           
		        </div>
		    </div>
			<div style="width:100%;height:85%;" showToolbar="false" showFooter="false" >
			    <div class="nui-toolbar" style="border-bottom:0;padding:0px;">
			        <table style="width:100%;">
			            <tr>
			                <td style="width:100%;">
			                    <a class="nui-button" iconCls="icon-add" onclick="add()">增加</a>
			                    <a id="update" class="nui-button" iconCls="icon-edit" onclick="edit()">编辑</a>
			                    <a class="nui-button" iconCls="icon-remove" onclick="remove()">删除</a>
			                    <!-- <a id="autobutton" class="nui-button" iconCls="" onclick="autopre()">自动计提</a> -->
			                    <!--<a id="autobutton" class="nui-button" iconCls="icon-manualpre" onclick="manualpre()">采购成本人工计提</a>-->
			                    <a id="surebutton" class="nui-button" iconCls="icon-ok" onclick="surepre()">确认计提</a>
			            		<a class="nui-button" id="batchAcct" iconCls="icon-asyicon" onclick="batchAcct()">批量记账</a>
			                </td>
			            </tr>
			        </table>
			    </div>
		        <div id="datagrid1" class="nui-datagrid" dataField="purpresettles" style="width:100%;height:350px;" sizeList="[10,20,50,100,200,500,1000,10000]"
		        	url="com.primeton.eos.ame_pur.outaccrued.queryPurPresettleList.biz.ext" 
		        	pageSize="10" showPageInfo="true" multiSelect="true" onselectionchanged="selectionChanged" 
		        	allowSortColumn="true" showSummaryRow="true" ondrawsummarycell="onDrawSummaryCell" 
		        	frozenStartColumn="0" frozenEndColumn="7" ondrawcell="ondrawPurOutAccrued">
		            <div property="columns">
		                <div type="checkcolumn" width="30"></div>
		                <div field="accruedid" width="58" align="center" headerAlign="center" allowSort="true" renderer="getDetail">查看计提</div>
		                <div field="syb" headerAlign="center" allowSort="true" renderer="dictGetContOrg" >所属事业部</div>
		                <div field="orgname" width="60" headerAlign="center" allowSort="true" >所属销售</div>
		                <div field="suppliersname" width="70" headerAlign="center" allowSort="true" >供应商简称</div>
		                <div field="startdate" width="80" headerAlign="center" allowSort="true" >计提开始日期</div>
		                <div field="enddate" width="80" headerAlign="center" allowSort="true" >计提结束日期</div>
		                
		                <div field="accruedmoney" width="100" summaryType="sum" headerAlign="center" align="right" dataType="currency" allowSort="true" >计提金额(元)</div>
		                <div field="notaxmoney" width="100" summaryType="sum" align="right" dataType="currency" headerAlign="center" allowSort="true">不含税金额(元)</div>
		                <div field="confirmdate" width="80" align="center" headerAlign="center" allowSort="true" dateFormat="yyyy-MM-dd" >成本确认日期</div>
		                <div field="accruedstatus" width="120" headerAlign="center" allowSort="true" renderer="dictGetStatus" >计提状态</div>
		                <div field="outper" width="150" headerAlign="center" allowSort="true" >相关外包人员</div>
		                <div field="projectno" width="110" headerAlign="center" allowSort="true" renderer="detailProj" >项目编号</div>
		                <div field="projectname" width="210" headerAlign="center" allowSort="true" >项目名称</div>
		                <div field="custname1" width="240" headerAlign="center" allowSort="true" >所属客户</div>
		                <div field="swcontnum" width="110" headerAlign="center" allowSort="true"  >项目对应合同编号</div>
		                <div field="contnum" width="110" headerAlign="center" allowSort="true" renderer="detailCscontract" >财务对应合同编号</div>
		                <div field="contracttype" width="110" headerAlign="center" allowSort="true" renderer="dictGetContracttype" >合同类型</div>
		                <div field="actrate" width="95" align="right" headerAlign="center" allowSort="true" renderer="csReveRate" >收入确认比例</div>
		                <div field="confirmday" width="80" align="center" headerAlign="center" allowSort="true" dateFormat="yyyy-MM-dd" >最近确认日期</div>
		                <div field="purcontnum" width="120" headerAlign="center" allowSort="true" >所属采购合同</div>
		                <div field="costtype" width="80" align="center" headerAlign="center" allowSort="true" renderer="dictGetCostType">成本归属类型</div>
		                
		                <div field="workunit" width="80" align="center" headerAlign="center" allowSort="true" renderer="dictGetWorkunit">工作量单位</div>
		                <div field="workamount" width="80" align="right" headerAlign="center" allowSort="true" summaryType="sum" renderer="geTworkamount">工作量数量</div>
		                
		                <div field="comment" width="180" headerAlign="center" allowSort="true" >备注</div>
		                <div field="accrueddate" width="130" headerAlign="center" allowSort="true" dateFormat="yyyy-MM-dd HH:mm:ss" >计提时间</div>
		                <div field="accruedid" headerAlign="center" allowSort="true" visible="false" >计提编号</div>
		            </div>
		        </div>
		    </div>
	    </div>
		<div id="win1" class="nui-window" title="成本确认日期" style="width:100px;height:120px;" 
		    showMaxButton="true" showCollapseButton="true" showShadow="true"
		    showToolbar="false" showFooter="true" showModal="false" allowResize="true" allowDrag="true">
	    	<div style="padding:5px;">
	    		<input name="purOutcost.confirmdate" id="confirmdate" class="nui-datePicker" style="width: 100px;margin-left: 10px;"/>
	    	</div>
		    <div property="footbar" style="padding:5px;margin-left: 10px;">
		        <input type='button' value='确定' onclick="sureDate()" style="vertical-align: bottom;"/>
		        <input type='button' value='关闭' onclick="hideWindow()" style="vertical-align: bottom;margin-left: 20px"/>
		    </div>
		</div>
		<div id="win2" class="nui-window" title="记账日期" style="width:100px;height:120px;" 
		    showMaxButton="true" showCollapseButton="true" showShadow="true"
		    showToolbar="false" showFooter="true" showModal="false" allowResize="true" allowDrag="true">
	    	<div style="padding:5px;">
	    		<input  id="acctdate" class="nui-datePicker" style="width: 100px;margin-left: 10px;"/>
	    	</div>
		    <div property="footbar" style="padding:5px;margin-left: 10px;">
		        <input type='button' value='确定' onclick="acctDate()" style="vertical-align: bottom;"/>
		        <input type='button' value='关闭' onclick="hideWindow1()" style="vertical-align: bottom;margin-left: 20px"/>
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
        //批量记账
	    var chooseRows = "";
        
        function autopre(){
        	var json = nui.encode({});
            $.ajax({
                url:"com.primeton.eos.ame_pur.outaccrued.autoPresettle.biz.ext",
                type:'POST',
                data:json,
                cache: false,
                contentType:'text/json',
                success:function(text){
                	grid.load();
                	grid.sortBy("lastupdatetime","desc");
                }
            });
        }
        
		init();
    	function init(){
    		grid.load();
    		grid.sortBy("lastupdatetime","desc");
		}
		
		//设置业务字典值-事业部
		function dictGetContOrg(e){
			return nui.getDictText('CONT_ORG',e.value);
		}
		
		//设置业务字典值-计提状态
		function dictGetStatus(e){
			var record = e.record;
			var settlementid = record.settlementid;
			var dictname = nui.getDictText('AME_ACCRUEDSTATUS',e.value);
			if(settlementid !=null && settlementid !=0){
		    	return "<a href='javascript:void(0)' onclick='checkDt();' title='点击查看'>" + dictname + "</a>";
	    	}else{
	    	    return dictname;//设置业务字典值
	    	}
		}
		
		function geTworkamount(e){
			if(e.value){
				return parseFloat(parseFloat(e.value).toFixed(2));
			}
		}
		
		function checkDt(){
			var selectRow = grid.getSelected();
	 		var executeUrl = "";
	 		if (selectRow.purtype == 0) {
	 			executeUrl = "<%=request.getContextPath() %>/ame_pur/settle/PurOutSettleLook.jsp?settlementid=" + selectRow.settlementid + "&projectno=" + selectRow.projectno + "&custid=" + selectRow.custid + "&custno=" + selectRow.custno;
	 		} else {
	 			executeUrl = "<%=request.getContextPath() %>/ame_pur/settle/PurOutSettleOtherLook.jsp?settlementid=" + selectRow.settlementid + "&projectno=" + selectRow.projectno + "&custid=" + selectRow.custid;			
	 		}
	 		window.open(executeUrl, "查看结算信息", "fullscreen=1");
		}
		
		//设置业务字典值-成本归属类型
		function dictGetCostType(e){
			return nui.getDictText('AME_CONTCOSTTYPE',e.value);
		}
		
		//设置业务字典值-工作量单位
		function dictGetWorkunit(e){
			return nui.getDictText('SERV_NUM_TYPE',e.value);
		}
		
		//点击查看详情
        function getDetail(e){
	        return "<a href='javascript:void(0)' onclick='checkDetail();' title='点击查看' >"+e.value+"</a>";
        }
        function checkDetail(){
	 		var selectRow = grid.getSelected();
			var executeUrl = "<%=request.getContextPath() %>/ame_pur/outaccrued/PurOutPreSettleLook.jsp?accruedid=" + selectRow.accruedid;
			window.open(executeUrl, "查看计提信息", "fullscreen=1");
	    }
	    
	    //收入确认比例
	    function csReveRate(e){
        	/* if(e.value!=-1){//-1代表没有合同总金额或合同总金额为空
	        	return parseFloat(e.value*100).toFixed(2)+"%";
        	}else{
        		return "合同总金额为空";
        	} */
        	/* if(e.value == "" || e.value == null){
        		return "合同总金额为空";
        	}else{
        		return parseFloat(e.value*100).toFixed(2)+"%";
        	} */
    		if(e.record.contnum == null){
        		return "";
        	}else if(e.record.contnum != null && (e.record.contsum == 0 || e.record.contsum == null)){
        		return "合同总金额为空";
        	}else{
        		return parseFloat(e.value*100).toFixed(2)+"%";
        	}
        }
        
        //合同类型
        function dictGetContracttype(e){
        	return nui.getDictText('MIS_CONTRACTTYPE',e.value);
        }
		
		//选择供应商
        function selectSupplier(){
        	var btnEdit = this;
            nui.open({
                url:"<%=request.getContextPath() %>/ame_pur/PurSupplier/SelectSupplier.jsp",
                title: "选择供应商",
                width: 650,
                height: 380,
                ondestroy: function (action) {
                    //if (action == "close") return false;
                    if (action == "ok") {
                        var iframe = this.getIFrameEl();
                        var data = iframe.contentWindow.GetData();
                        data = nui.clone(data);    //必须
                        if (data) {
                            btnEdit.setValue(data.custid);
                            btnEdit.setText(data.custname);
                        }
                    }

                }
            });
        }
		
        //新增计提信息
        function add() {
            nui.open({
                url: "<%=request.getContextPath() %>/ame_pur/outaccrued/PurOutAccruedInput.jsp",
                title: "新增采购计提信息", 
                width: 850, 
                height: 560,
                onload: function () {//弹出页面加载完成
	                var iframe = this.getIFrameEl();
	                var data = {action:"add"};//传入页面的json数据
	                iframe.contentWindow.SetData(data);
                },
                ondestroy: function (action) {//弹出页面关闭前
                	if(action == "ok"){
	                    grid.reload();
                	}
                }
            });
        }
        
        //编辑
        function edit() {
            var row = grid.getSelected();
            if (row) {
        		if(row.accruedstatus == "2" || row.accruedstatus == "3" || row.accruedstatus == "4"){
        			nui.alert("计提状态为" + nui.getDictText('AME_ACCRUEDSTATUS', row.accruedstatus) + "！不能编辑！");
		            return;
        		}
                nui.open({
                    url: "<%=request.getContextPath() %>/ame_pur/outaccrued/PurOutAccruedInput.jsp",
                    title: "编辑采购计提信息",
                    width: 850,
                    height: 560,
                    onload: function () {
                        var iframe = this.getIFrameEl();
                        var data = {action:"edit",accruedid:row.accruedid};
                        iframe.contentWindow.SetData(data);
                    },
                    ondestroy: function (action) {
                        if(action == "ok"){
		                    grid.reload();
	                	}
                    }
                });
            } else {
                nui.alert("请选中一条记录","提示");
            }
        }

        //删除
        function remove(){
            var rows = grid.getSelecteds();
            //对于状态已经“确认计提”和“核销”的计提不允许删除
            if(rows.length > 0){
            	for(var i = 0; i < rows.length; i++){
            		if(rows[i].accruedstatus != "0"){
            			nui.alert("计提状态为" + nui.getDictText('AME_ACCRUEDSTATUS', rows[i].accruedstatus) + "！不能删除！");
			            return;
            		}
            	}
                nui.confirm("确定删除选中的计提信息？","删除计提信息提示",
                function(action){
                    if(action=="ok"){
                        var json = nui.encode({purpresettles:rows});
                        grid.loading("正在删除中,请稍等...");
                        $.ajax({
                            url:"com.primeton.eos.ame_pur.outaccrued.deletePurPresettles.biz.ext",
                            type:'POST',
                            data:json,
                            cache: false,
                            contentType:'text/json',
                            success:function(text){
                                var returnJson = nui.decode(text);
                                if(returnJson.exception == null){
                                    grid.reload();
                                    nui.alert("删除成功", "系统提示", function(action){
                                    });
                                }else{
                                    grid.unmask();
                                    nui.alert("删除失败", "系统提示");
                                }
                            }
                        });
                    }
                });
            }else{
                nui.alert("请选中一条记录！");
            }
        }
        
        //确认计提
        var chooseRows = "";
        function surepre(){
        	var rows = grid.getSelecteds();
            //对于状态为"新增"的才允许确认计提
            if(rows.length > 0){
            	for(var i = 0; i < rows.length; i++){
            		if(rows[i].accruedstatus != "0" && rows[i].accruedstatus != "4"){
            			nui.alert("所选的记录中，包含计提状态为【" + nui.getDictText('AME_ACCRUEDSTATUS', rows[i].accruedstatus) + "】的计提数据！不能进行确认计提操作！");
			            return;
            		}
            	}
            	if(nui.get("confirmdate").getValue() == ""){
		        	nui.get("confirmdate").setValue(new Date());
	        	}
            	chooseRows = rows;
            	showAtPos();
            }else{
                nui.alert("请选中一条记录！");
            }
        }

        //重新刷新页面
        function refresh(){
            var form = new  nui.Form("#form1");
            var json = form.getData(false,false);
            grid.sortBy("lastupdatetime","desc");
            grid.load(json);//grid查询
            nui.get("update").enable();
        }

        //查询
        function search() {
        	if(nui.getbyName("criteria._expr[12]._max").getValue()){
	        	var ctime = nui.getbyName("criteria._expr[12]._max").getValue().substring(0,10);
    	    	nui.getbyName("criteria._expr[12]._max").setValue(ctime + " 23:59:59");
        	}
            var form = new nui.Form("#form1");
            var json = form.getData();
            grid.load(json);
            grid.sortBy("lastupdatetime","desc");
        }

        //重置查询条件
        function reset(){
            var form = new nui.Form("#form1");
            form.reset();
            grid.load();
            grid.sortBy("lastupdatetime","desc");
        }

        //enter键触发查询
        function onKeyEnter(e) {
            search();
        }

        //当选择列时
        function selectionChanged(){
            var rows = grid.getSelecteds();
            if(rows.length>1){
                nui.get("update").disable();
            }else{
                nui.get("update").enable();
            }
        }
        
        //导出计提数据
        function exportOutAccrued(){
        	nui.confirm("是否确认导出计提数据？", "确定？",
            function (action) {            
                if (action == "ok") {
					var json = form.getData();
					form.loading("计提数据导出中...");
					nui.ajax({
		    			url: "com.primeton.eos.ame_pur.outaccrued.exportOutAccrued.biz.ext",
				        type: "post",
				        data: json,
				        cache: false,
				        contentType: 'text/json',
				        success: function (o) {
				     		form.unmask();
				        	var filePath = o.downloadFile;
				        	var fileName = "计提";
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
				}else{
					return;
				}
            });
        }
        
        function onDrawSummaryCell(e) {
            var result = e.result;
            var grid = e.sender;
            //客户端汇总计算
            if (e.field == "enddate") {
                e.cellHtml = "<div style='width: 83px;height: 20px;text-align: right;'><span style='color: blue;align: right;font-weight: bold'>合计：</span></div>";
            }
            if (e.field == "accruedmoney") {
                e.cellHtml = "<div style='width: 96px;height: 20px;text-align: right;'><span style='color: blue;align: right;font-weight: bold'>" + e.cellHtml + "</span></div>";
            }
            if (e.field == "notaxmoney") {
                e.cellHtml = "<div style='width: 96px;height: 20px;text-align: right;'><span style='color: blue;align: right;font-weight: bold'>" + e.cellHtml + "</span></div>";
            }
            if (e.field == "workamount"){
            	e.cellHtml = "<div style='width: 96px;height: 20px;text-align: right;'><span style='color: blue;align: right;font-weight: bold'>" + e.cellHtml + "</span></div>";
            }
        }
        
        //成本确认日期
        function showAtPos() {
	        var win = nui.get("win1");
	        win.showAtPos("center", "middle");
	    }
	    function hideWindow() {
	        var win = nui.get("win1");
	        win.hide();
	    }
	    function sureDate(){
	    	hideWindow();
	    	surePreSettle(chooseRows);
	    }
	    function surePreSettle(rows){
	    	nui.confirm("确定要确认计提选中的计提信息？","确认计提信息提示",function(action){
                if(action=="ok"){
                    var json = nui.encode({"purpresettles": rows,"purOutcostParam": {"iden": "AccruedList","confirmdate": nui.get("confirmdate").getValue()}});
                    grid.loading("正在确认计提中,请稍等...");
                    $.ajax({
                        url:"com.primeton.eos.ame_pur.outaccrued.surePresettle.biz.ext",
                        type:'POST',
                        data:json,
                        cache: false,
                        contentType:'text/json',
                        success:function(text){
                            var returnJson = nui.decode(text);
                            grid.unmask();
                            if(returnJson.exception == null){
                            	nui.alert("共：" + (rows.length) + "条数据被计提，全部确认计提成功！", "系统提示",function(){
                                    grid.reload();
                                });
                            }else{
                                nui.alert("共：" + (rows.length) + "条数据被计提,其中" + (returnJson.count) + "条确认计提成功，" + (rows.length - returnJson.count) + "条确认计提失败！", "系统提示",function(){
                                	grid.reload();
                                });
                            }
                        }
                    }); 
                }
            });
	    }
	    
	    function  batchAcct(){
			var rows = grid.getSelecteds();
			if(rows.length>0){
				//遍历判断所选报销记录是否全是财务已出款
				for(var i=0 ;i<rows.length;i++){
					if(rows[i].acctdate !=null){
						nui.alert("所选操作包含已记账处理过的报销单，请确认！");
						return;
					}
					if(rows[i].costtype !="1"){
						nui.alert("所选操作成本归属类型必须是成本项，请确认！");
						return;
					}
				}
				if(nui.get("acctdate").getValue() == ""){
		        	nui.get("acctdate").setValue(new Date());
	        	}
	        	chooseRows=rows;
	        	showAtPos1();
			}else{
				nui.alert("请至少选中一条记录");
			}
	    }
	    
	    //记账日期
        function showAtPos1() {
	        var win = nui.get("win2");
	        win.showAtPos("center", "middle");
	    }
	    function hideWindow1() {
	        var win = nui.get("win2");
	        win.hide();
	    }
	    function acctDate(){
	    	hideWindow1();
	    	sureAcct(chooseRows);
	    } 
	    function sureAcct(rows){
	    	if (confirm("确定进行批量记账处理？")) {
                    var json = nui.encode({purpresettles: rows,acctDate: nui.get("acctdate").getValue()});
                    grid.loading("操作中，请稍后......");
                    
                    nui.ajax({//进行批量记账修改
		    			url:"com.primeton.eos.ame_pur.outaccrued.batchAcctPurPresettles.biz.ext",
		    			data: json,
		    			type:"post",
		    			contentType:"text/json",
		    			success:function(o){
		    				var info = removeBlock(nui.encode(o.returnDatas)).replace(/",/g,'"\r\n');
	          				alert(info);
		    				grid.reload();
						},
					    error: function (jqXHR, textStatus, errorThrown) {
					       alert(jqXHR.responseText);
					    }
						
					});	   
                 }
	    }
	    
	     //去除包裹的大括号
		function removeBlock(str){
		    if (str) {
		        var reg = /^\{/gi;
		        var reg2 = /\}$/gi;
		        str = str.replace(reg, '');
		        str = str.replace(reg2, '');
		        return str;
		    } else {
		        return str;
		    }
		} 
	    //项目详细信息
        function detailProj(e){
        	if(e.value){
	        	return "<a href='javascript:void(0)' onclick='detailProj1();' title='点击查看项目信息'>" + e.value + "</a>";
        	}
        }
        function detailProj1(){
	 		var selectRow = grid.getSelected();
	 		var executeUrl = "/default/project/rdproject/projectDetail.jsp?projid=" + selectRow.projectid;
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
		
		function ondrawPurOutAccrued(e){
			var record = e.record,
	        column = e.column,
	        field = e.field,
	        value = e.value;
            //设置行样式   将计提的项目的合同编号与计提对应财务合同编号不一致的数据，用浅红色表示#FF99CC
            //e.rowStyle = "background-color: #FF99CC";
            if(record.issame=='0'){
            	e.rowStyle = "background-color: #FF99CC";
            }
		}
    </script>
</body>
</html>
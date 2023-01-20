<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<!-- 
  - Author(s): 朱勇伦
  - Date: 2017-03-31 16:38:51
  - Description:
-->
<head>
	<title>本部门受益的采购计提</title>
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
		<div class="nui-panel" title="本部门受益的采购计提" width="auto">
			<div style="width:100%;height:100%;padding:0px;margin:0px;" id="form1">
				<div class="nui-toolbar" style="border-bottom:0;padding:0px;">
					<table style="width:100%;">
						<tr>
							<!-- 
							查询条件：供应商、项目名称、项目编号、客户名称、销售合同（项目对应的商务合同）、相关外包人员、计提状态
							查询结果：参考计提管理的查询结果，去掉财务合同显示，增加商务合同显示
							排序字段：缺省按计提开始日期倒序排列，支持页面端列头排序
							 -->
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
			            	<td align="left" style="width: 120px;">
			            		<input name="criteria._expr[2]._value" class="nui-textbox" style="width:120px;" onenter="onKeyEnter"/>
							    <input class="nui-hidden" name="criteria._expr[2]._property" value="projectno"/>
							    <input class="nui-hidden" name="criteria._expr[2]._op" value="like"/>
							    <input class="nui-hidden" name="criteria._expr[2]._likeRule" value="all"/>
			            	</td>
							<td align="right" style="width: 100px"><span>计提状态：</span></td>
			            	<td align="left">
							    <input name="criteria._expr[5]._value" class="nui-dictcombobox" dictTypeId="AME_ACCRUEDSTATUS" shownullItem="true" multiSelect="true" style="width:204px;"/>
							    <input class="nui-hidden" name="criteria._expr[5]._property" value="accruedstatus"/>
							    <input class="nui-hidden" name="criteria._expr[5]._op" value="in"/>
							</td>
						</tr>
						<tr>
			            	<!-- 2016年10月26日增加 -->
			            	<td align="right" style="width: 100px"><span>合同编号：</span></td>
			            	<td align="left" style="width: 120px;">
			            		<input name="criteria._expr[3]._value" class="nui-textbox" style="width:120px;" onenter="onKeyEnter"/>
							    <input class="nui-hidden" name="criteria._expr[3]._property" value="swcontnum"/>
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
			            		<input name="criteria._expr[6]._value" class="nui-textbox" style="width:120px;" onenter="onKeyEnter"/>
							    <input class="nui-hidden" name="criteria._expr[6]._property" value="outper"/>
							    <input class="nui-hidden" name="criteria._expr[6]._op" value="like"/>
							    <input class="nui-hidden" name="criteria._expr[6]._likeRule" value="all"/>
			            	</td>
							<td align="right" style="width: 100px;"><span>计提开始日期：</span></td>
			            	<td align="left">
			            		<input name="criteria._expr[8]._min" class="nui-datepicker" style="width:100px;"/>-<input name="criteria._expr[8]._max" class="nui-datepicker" style="width:100px;" />
							    <input class="nui-hidden" name="criteria._expr[8]._property" value="startdate"/>
							    <input class="nui-hidden" name="criteria._expr[8]._op" value="between"/>
			            	</td>
						</tr>
						<tr>
							<td align="right" style="width: 100px"><span>事业部：</span></td>
			            	<td align="left" style="width: 120px;">
							    <input class="nui-dictcombobox" name="criteria._expr[7]._value" id="syb" dictTypeId="CONT_ORG" style="width: 120px;"/>
							    <input class="nui-hidden" name="criteria._expr[7]._property" value="syb"/>
							    <input class="nui-hidden" name="criteria._expr[7]._op" value="like"/>
							</td>
							<td colspan="4"></td>
			            	<td align="right" style="width: 120px;"><span>计提结束日期：</span></td>
			            	<td align="left">
			            		<input name="criteria._expr[9]._min" class="nui-datepicker" style="width:100px;"/>-<input name="criteria._expr[9]._max" class="nui-datepicker" style="width:100px;" />
							    <input class="nui-hidden" name="criteria._expr[9]._property" value="enddate"/>
							    <input class="nui-hidden" name="criteria._expr[9]._op" value="between"/>
			            	</td> 
						</tr>
					    <tr>
			    			<td align="center" colspan="15">
		                        <a class="nui-button" id="search" iconCls="icon-search" onclick="search()">查询</a>
		                        <a class="nui-button" id="reset" iconCls="icon-reload" onclick="reset()">重置</a>
		                        <!-- <a class="nui-button" onclick="exportOutAccrued" iconCls="icon-download" style="width:135px;" id="exportButton">导出计提数据</a>	 -->
		                   </td>
		                </tr>
		            </table>           
		        </div>
		    </div>
			<div style="width:100%;">
				<div id="datagrid1" class="nui-datagrid" dataField="purpresettles" style="width:100%;height: 375px;" 
		        	url="com.primeton.eos.ame_pur.outaccrued.queryPurPresettleList.biz.ext" 
		        	pageSize="10" showPageInfo="true" multiSelect="true" allowCellSelect="true" sortMode="client" 
		        	allowSortColumn="true" showSummaryRow="true" ondrawsummarycell="onDrawSummaryCell" 
		        	frozenStartColumn="0" frozenEndColumn="5">
		            <div property="columns">
		                <div type="checkcolumn" width="30"></div>
		                <!-- <div field="accruedid" width="58" align="center" headerAlign="center" allowSort="true" renderer="getDetail">查看计提</div> -->
		                <!-- <div field="syb" headerAlign="center" allowSort="true" renderer="dictGetContOrg" >所属事业部</div> -->
		                <div field="orgname" width="60" headerAlign="center" allowSort="true" >受益部门</div>
		                <div field="suppliersname" width="90" headerAlign="center" allowSort="true" >供应商简称</div>
		                <div field="startdate" width="80" headerAlign="center" allowSort="true" >计提开始日期</div>
		                <div field="enddate" width="80" headerAlign="center" allowSort="true" >计提结束日期</div>
		                
		                <div field="accruedmoney" width="100" summaryType="sum" headerAlign="center" align="right" dataType="currency" allowSort="true" >计提金额(元)</div>
		                <div field="notaxmoney" width="100" summaryType="sum" align="right" dataType="currency" headerAlign="center" allowSort="true">不含税金额(元)</div>
		                
		                <div field="accruedstatus" width="120" headerAlign="center" allowSort="true" renderer="dictGetStatus" >计提状态</div>
		                <div field="outper" width="150" headerAlign="center" allowSort="true" >相关外包人员</div>
		                <div field="projectno" width="110" headerAlign="center" allowSort="true" renderer="detailProj" >项目编号</div>
		                <div field="projectname" width="210" headerAlign="center" allowSort="true" >项目名称</div>
		                <div field="custname1" width="240" headerAlign="center" allowSort="true" >所属客户</div>
		                <div field="swcontnum" width="110" headerAlign="center" allowSort="true" renderer="detailCscontract" >合同编号</div>
		                <div field="purcontnum" width="120" headerAlign="center" allowSort="true" >所属采购合同</div>
		                <div field="costtype" width="80" align="center" headerAlign="center" allowSort="true" renderer="dictGetCostType">成本归属类型</div>
		                
		                <div field="workunit" width="80" align="center" headerAlign="center" allowSort="true" renderer="dictGetWorkunit">工作量单位</div>
		                <div field="workamount" width="80" align="right" headerAlign="center" allowSort="true" summaryType="sum" decimalPlaces="3" >工作量数量</div>
		                
		                <div field="comment" width="180" headerAlign="center" allowSort="true" >备注</div>
		                <div field="accrueddate" width="130" headerAlign="center" allowSort="true" dateFormat="yyyy-MM-dd HH:mm:ss" >计提时间</div>
		                <div field="accruedid" headerAlign="center" visible="false" >计提编号</div>
		            </div>
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
	    				nui.getbyName("criteria._expr[7]._value").setData(sybdata);
	    				nui.getbyName("criteria._expr[7]._value").setShowNullItem(false);
    					nui.getbyName("criteria._expr[7]._value").select(0);
    				}
				    var json = form.getData();
				    grid.load(json);
	    		}
	    	});
		}
		
		function search(){
			var json = form.getData();
    		grid.sortBy("accrueddate","desc");
		    grid.load(json);
		}
		
		function reset(){
			var form = new nui.Form("#form1");
            form.reset();
            nui.getbyName("criteria._expr[7]._value").setData(sybdata);
			nui.getbyName("criteria._expr[7]._value").setShowNullItem(false);
			nui.getbyName("criteria._expr[7]._value").select(0);
		    var json = form.getData();
            grid.sortBy("accrueddate","desc");
            grid.load(json);
		}
		
		//enter键触发查询
        function onKeyEnter(e) {
            search();
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
            	e.cellHtml = "<div style='width: 76px;height: 20px;text-align: right;'><span style='color: blue;align: right;font-weight: bold'>" + e.cellHtml + "</span></div>";
            }
        }
        
        //设置业务字典值-事业部
		function dictGetContOrg(e){
			return nui.getDictText('CONT_ORG',e.value);
		}
		
		//设置业务字典值-计提状态
		function dictGetStatus(e){
			return nui.getDictText('AME_ACCRUEDSTATUS',e.value);
		}
		
		//设置业务字典值-成本归属类型
		function dictGetCostType(e){
			return nui.getDictText('AME_CONTCOSTTYPE',e.value);
		}
		
		//设置业务字典值-工作量单位
		function dictGetWorkunit(e){
			return nui.getDictText('SERV_NUM_TYPE',e.value);
		}
		
		//销售合同编号
	    function detailCscontract(e){
	    	if(e.value){
	    		return "<a href='javascript:void(0)' onclick='detailCscontract1();' title='点击查看'>" + e.value + "</a>";
	    	}
	    }
	    function detailCscontract1(){
			var selectRow = grid.getSelected();
			var executeUrl = "<%=request.getContextPath() %>/contract/contract/contractView.jsp?contractid=" + selectRow.swcontractid;
			window.open(executeUrl, "合同查看", "fullscreen=1");
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
	</script>
</body>
</html>
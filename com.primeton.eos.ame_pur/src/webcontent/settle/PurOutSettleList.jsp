<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>	
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@page import="com.eos.data.datacontext.UserObject"%>
<%@page import="commonj.sdo.DataObject"%>
<%@page import="java.util.Map"%>
<% 
	UserObject user = (UserObject) session.getAttribute("userObject"); 
%>
<html>
<!-- 
  - Author(s): zyl
  - Date: 2016-06-07 14:29:37
  - Description:
-->
<head>
	<title>结算</title>
	<meta http-equiv="content-type" content="text/html; charset=UTF-8" />
	<script src="<%= request.getContextPath() %>/common/nui/nui.js" type="text/javascript"></script>
</head>
<body>
	<div class="nui-fix">
	<div class="mini-panel" title="采购结算管理" width="auto">
	<div style="width:100%;height:100%;padding:0px;margin:0px;" id="form1">
		<div class="nui-toolbar"style="border-bottom:0;padding:0px;">
			<table style="width:100%;">
				<!-- 
					查询条件：事业部，受益人，项目，供应商，结算时间范围
				 -->
				<tr>
					<td align="right"><span>结算开始日期范围：</span></td>
					<td align="left">
						<input name="criteria._expr[0]._min" class="nui-datepicker" style="width:100px;"/>-<input name="criteria._expr[0]._max" class="nui-datepicker" style="width:100px;" />
					    <input class="nui-hidden" name="criteria._expr[0]._property" value="startdate"/>
					    <input class="nui-hidden" name="criteria._expr[0]._op" value="between"/>
					</td>
					<td align="right"><span>事业部：</span></td>
	            	<td align="left">
					    <input class="nui-dictcombobox" name="criteria._expr[1]._value" id="syb" dictTypeId="CONT_ORG" style="width:120px;"/>
					    <input class="nui-hidden" name="criteria._expr[1]._property" value="sybywzd"/>
					    <input class="nui-hidden" name="criteria._expr[1]._op" value="like"/>
					</td>
					<td align="right"><span>项目名称：</span></td>
					<td align="left">
	            		<input class="nui-textbox" name="criteria._expr[2]._value" style="width:120px;" onenter="onKeyEnter"/>
					    <input class="nui-hidden" name="criteria._expr[2]._property" value="projectName"/>
					    <input class="nui-hidden" name="criteria._expr[2]._op" value="like"/>
				        <input class="nui-hidden" name="criteria._expr[2]._likeRule" value="all"/>
					</td>
					<td align="right"><span>项目编号：</span></td>
					<td align="left" style="width: 200px;">
	            		<input class="nui-textbox" name="criteria._expr[3]._value" style="width:120px;" onenter="onKeyEnter"/>
					    <input class="nui-hidden" name="criteria._expr[3]._property" value="projectno"/>
					    <input class="nui-hidden" name="criteria._expr[3]._op" value="like"/>
				        <input class="nui-hidden" name="criteria._expr[3]._likeRule" value="all"/>
					</td>
				</tr>
				<tr>
					<td align="right"><span>结算截止日期范围：</span></td>
					<td align="left">
						<input name="criteria._expr[4]._min" class="nui-datepicker" style="width:100px;"/>-<input name="criteria._expr[4]._max" class="nui-datepicker" style="width:100px;" />
					    <input class="nui-hidden" name="criteria._expr[4]._property" value="enddate"/>
					    <input class="nui-hidden" name="criteria._expr[4]._op" value="between"/>
					</td>
					<td align="right"><span>供应商名称：</span></td>
					<td align="left">
	            		<input class="nui-textbox" name="criteria._expr[16]._value" style="width:120px;" onenter="onKeyEnter"/>
					    <input class="nui-hidden" name="criteria._expr[16]._property" value="custname"/>
					    <input class="nui-hidden" name="criteria._expr[16]._op" value="like"/>
				        <input class="nui-hidden" name="criteria._expr[16]._likeRule" value="all"/>
					</td>
					<td align="right"><span>受益部门：</span></td>
					<td align="left">
	            		<input class="nui-textbox" name="criteria._expr[6]._value" style="width:120px;" onenter="onKeyEnter"/>
					    <input class="nui-hidden" name="criteria._expr[6]._property" value="orgname"/>
					    <input class="nui-hidden" name="criteria._expr[6]._op" value="like"/>
				        <input class="nui-hidden" name="criteria._expr[6]._likeRule" value="all"/>
					</td>
					<td align="right"><span>财务合同编号：</span></td>
					<td align="left">
						<input class="nui-textbox" name="criteria._expr[7]._value" style="width:120px;" onenter="onKeyEnter"/>
					    <input class="nui-hidden" name="criteria._expr[7]._property" value="cwcontnum"/>
					    <input class="nui-hidden" name="criteria._expr[7]._op" value="like"/>
				        <input class="nui-hidden" name="criteria._expr[7]._likeRule" value="all"/>
					</td>
				</tr>
				<tr>
					<td align="right"><span>结算提交日期范围：</span></td>
					<td align="left">
						<input name="criteria._expr[8]._min" class="nui-datepicker" style="width:100px;"/>-<input name="criteria._expr[8]._max" class="nui-datepicker" style="width:100px;" />
					    <input class="nui-hidden" name="criteria._expr[8]._property" value="subdate"/>
					    <input class="nui-hidden" name="criteria._expr[8]._op" value="between"/>
					</td>
					<td align="right"><span>成本归属类型：</span></td>
					<td align="left">
	            		<input name="criteria._expr[9]._value" class="nui-dictcombobox" dictTypeId="AME_CONTCOSTTYPE" showNullItem="true" style="width:120px;"/>
						<input class="nui-hidden" name="criteria._expr[9]._property" value="costtype"/>
						<input class="nui-hidden" name="criteria._expr[9]._op" value="="/>
					</td>
					<td align="right"><span>结算单ID：</span></td>
					<td align="left">
	            		<input class="nui-textbox" name="criteria._expr[10]._value" style="width:120px;"/>
						<input class="nui-hidden" name="criteria._expr[10]._property" value="settlementid"/>
						<input class="nui-hidden" name="criteria._expr[10]._op" value="="/>
					</td>
					<td align="right"><span>结算单编号：</span></td>
					<td align="left" >
						<input class="nui-textbox" name="criteria._expr[11]._value" style="width:120px;"/>
						<input class="nui-hidden" name="criteria._expr[11]._property" value="settlementno"/>
						<input class="nui-hidden" name="criteria._expr[11]._op" value="like"/>
					    <input class="nui-hidden" name="criteria._expr[11]._likeRule" value="all"/>
					</td>
				</tr>
				<tr>
					<td align="right"><span>付款日期范围：</span></td>
					<td align="left">
						<input name="criteria._expr[12]._min" class="nui-datepicker" style="width:100px;"/>-<input name="criteria._expr[12]._max" class="nui-datepicker" style="width:100px;" />
					    <input class="nui-hidden" name="criteria._expr[12]._property" value="paydate"/>
					    <input class="nui-hidden" name="criteria._expr[12]._op" value="between"/>
					</td>
					<td align="right"><span>采购合同类型：</span></td>
					<td align="left" >
						<input name="criteria._expr[13]._value" class="nui-dictcombobox" dictTypeId="AME_CONTYPE" showNullItem="true" style="width:120px;"/>
						<input class="nui-hidden" name="criteria._expr[13]._property" value="purtype"/>
						<input class="nui-hidden" name="criteria._expr[13]._op" value="="/>
					</td>
					<td align="right"><span>采购合同编号：</span></td>
					<td align="left" >
						<input class="nui-textbox" name="criteria._expr[14]._value" style="width:120px;" onenter="onKeyEnter"/>
					    <input class="nui-hidden" name="criteria._expr[14]._property" value="purcontnum"/>
					    <input class="nui-hidden" name="criteria._expr[14]._op" value="like"/>
				        <input class="nui-hidden" name="criteria._expr[14]._likeRule" value="all"/>
					</td>
					<td align="right"><span>流程发起人：</span></td>
					<td align="left">
						<input class="nui-textbox" name="criteria._expr[15]._value" style="width:120px;"/>
					    <input class="nui-hidden" name="criteria._expr[15]._property" value="creatorname"/>
					    <input class="nui-hidden" name="criteria._expr[15]._op" value="like"/>
					    <input class="nui-hidden" name="criteria._expr[15]._likeRule" value="all"/>
					</td>
				</tr>
				<tr>
					<td align="right"><span>结算单状态：</span></td>
					<td align="left">
						<input name="criteria._expr[5]._value" class="nui-dictcombobox" dictTypeId="AME_SETSTATUS" showNullItem="true" multiSelect="true" style="width:205px;"/>
						<input class="nui-hidden" name="criteria._expr[5]._property" value="setstatus"/>
						<input class="nui-hidden" name="criteria._expr[5]._op" value="in"/>
					</td>
					<td align="right"><span>外包人员：</span></td>
					<td align="left">
						<input class="nui-textbox" name="criteria._expr[17]._value" style="width:120px;"/>
					    <input class="nui-hidden" name="criteria._expr[17]._property" value="outpername"/>
					    <input class="nui-hidden" name="criteria._expr[17]._op" value="like"/>
					    <input class="nui-hidden" name="criteria._expr[17]._likeRule" value="all"/>
					</td>
					<td align="right"><span>客户名称：</span></td>
					<td align="left">
	            		<input class="nui-textbox" name="criteria._expr[18]._value" style="width:120px;" onenter="onKeyEnter"/>
					    <input class="nui-hidden" name="criteria._expr[18]._property" value="custnamemis"/>
					    <input class="nui-hidden" name="criteria._expr[18]._op" value="like"/>
				        <input class="nui-hidden" name="criteria._expr[18]._likeRule" value="all"/>
					</td>
				</tr>
			    <tr>
	    			<td align="center" colspan="10">
                        <a class="nui-button" id="search" iconCls="icon-search" onclick="search()">查询</a>
                        <a class="nui-button" id="reset" iconCls="icon-reload" onclick="reset()">重置</a>
                        <a class="nui-button" id="exportCurrentExcel" iconCls="icon-download" onclick="exportCurrent">导出</a>	
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
	                    <a class="nui-button" iconCls="icon-editt" onclick="add()">增加外包结算</a>
	                    <a class="nui-button" iconCls="icon-add" onclick="addother()">增加非外包结算</a>
	                    <a id="upbutton" class="nui-button" iconCls="icon-edit" onclick="edit()">编辑</a>
	                    <a id="deletebutton" class="nui-button" iconCls="icon-remove" onclick="remove()">删除</a>
	                </td>
	            </tr>
	        </table>
	    </div>
        <div id="datagrid1" class="nui-datagrid" dataField="purSettles" style="width:100%;height:350px;" sizeList="[10,20,50,100,200,500,1000,10000]"
        	url="com.primeton.eos.ame_pur.settle.queryPursettleList.biz.ext" showSummaryRow="true" ondrawsummarycell="onDrawSummaryCell" 
        	pageSize="10" showPageInfo="true" multiSelect="true" onselectionchanged="selectionChanged" >
            <div property="columns">
                <!-- <div type="indexcolumn" width="60"></div> -->
                <div type="checkcolumn" width="30"></div>
                <div field="processinstid" headerAlign="center" allowSort="true" visible="false">流程实例ID</div>
                <div field="settlementid" width="70" align="center" headerAlign="center" allowSort="true" renderer="getDetail">查看结算</div>
                <div field="benefitid" headerAlign="center" allowSort="true" visible="false">受益部门id</div>
                <div field="orgname" width="70" headerAlign="center" allowSort="true">受益部门</div>
                <div field="projectName" width="220" headerAlign="center" allowSort="true">项目名称</div>
                <div field="projectno" width="90" headerAlign="center" allowSort="true" visible="true">项目编号</div>
                <div field="custid" headerAlign="center" allowSort="true" visible="false">供应商ID</div>
                <div field="custname" width="200" headerAlign="center" allowSort="true">供应商名称</div>
                <div field="startdate" width="80" headerAlign="center" allowSort="true">结算开始日期</div>
                <div field="enddate" width="80" headerAlign="center" allowSort="true">结算截止日期</div>
                <div field="setamount" width="120" summaryType="sum" align="right" dataType="currency" headerAlign="center" allowSort="true">结算总金额(元)</div>
                <div field="notaxmon" width="120" summaryType="sum" align="right" dataType="currency" headerAlign="center" allowSort="true">不含税金额(元)</div>
                <div field="outpername" width="200" headerAlign="center" allowSort="false">外包人员</div>
                <div field="costtype" width="80" headerAlign="center" allowSort="true" renderer="dictGetCosttype">成本归属类型</div>
                <div field="setstatus" width="70" headerAlign="center" allowSort="true" renderer="dictGetStatus">结算单状态</div>
                <div field="purtype" width="70" headerAlign="center" allowSort="true" renderer="dictGetPurtype" visible="true">合同类型</div>
                <%--<div field="purorderid" headerAlign="center" allowSort="true" visible="false">采购订单编号</div>
                --%>
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
                <div field="cwcontnum" width="80" headerAlign="center" allowSort="true" renderer="detailCscontract">财务合同编号</div>
                <div field="settlementno" width="100" headerAlign="center" allowSort="true" >结算单编号</div>
                <div field="creatorname" width="80" headerAlign="center" allowSort="true" >流程发起人</div>
            </div>
        </div>
	</div>
	</div>
	<form name="viewlist1" id="viewlist1" action="com.primeton.eos.ame_common.ameExportCommon.flow" method="post">
		<input type="hidden" name="_eosFlowAction" value="action0" filter="false"/>
		<input type="hidden" name="downloadFile" filter="false"/>
		<input type="hidden" name="fileName" filter="false"/>
	</form> 
	</div>
	<script type="text/javascript">
        nui.parse();
		var form = new nui.Form("#form1");
        var grid = nui.get("datagrid1");
		init();
    	function init(){
    		//criteria._expr[0]._value
    		grid.sortBy("subdate","desc");
    		grid.load();
    		var data = {};
			var json = nui.decode(data);
    		nui.ajax({
    			url:"com.primeton.eos.ame_common.sendMail.getMySYB.biz.ext",
    			data:json,
    			type:"post",
    			contentType:"text/json",
    			success:function(action){
    				if(action.syb.length > 0){
	    				var sybdata = [];
	    				for(var i = 0;i < action.syb.length;i ++){
	    					sybdata[i] = {"dictID": action.syb[i].dictid,"dictName": action.syb[i].dictname};
	    				}
	    				nui.get("syb").setData(sybdata);
	    				if(sybdata.length == 1){
	    					nui.get("syb").setShowNullItem(false);
	    					nui.get("syb").select(0);
	    				}
    				}else{
    					nui.get("syb").setShowNullItem(true);
    				}
    			},
    			error:function(jqXHR, textStatus, errorThrown){
    				nui.alert("error:" + jqXHR.responseText);
    			}
    		});
		}
		
		
		//设置业务字典值-结算单状态
		function dictGetStatus(e){
			return nui.getDictText('AME_SETSTATUS',e.value);
		}
		
		//设置业务字典值-成本归属类型
		function dictGetCosttype(e){
			return nui.getDictText('AME_CONTCOSTTYPE',e.value);
		}
		
		//设置业务字典值-合同类型
		function dictGetPurtype(e){
			return nui.getDictText('AME_CONTYPE',e.value);
		}
		
        //新增计提信息
        function add() {
            nui.open({
                url: "<%=request.getContextPath() %>/ame_pur/settle/PurOutSettleInput.jsp",
                title: "新增结算信息", 
                width: 1000, 
                height: 500,
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
        
         //新增其他采购结算信息
        function addother() {
            nui.open({
                url: "<%=request.getContextPath() %>/ame_pur/settle/PurOutSettleOtherInput.jsp",
                title: "新增非外包采购结算信息", 
                width: 950, 
                height: 450,
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
            	//如果选择的结算单为流程运转中则不能编辑和删除，只能查看
        		/* if(row.setstatus == "1" || row.setstatus == "2"){
        			nui.alert("结算状态为" + nui.getDictText('AME_SETSTATUS', row.setstatus) + ",不能编辑！");
		            return;
        		} */
        		//2016/11/16只有结算单状态为新增的才能编辑和删除
        		//2016/12/08放开编辑。
        		if(row.setstatus == "1" || row.setstatus == "2" || row.setstatus == "3"){
        			nui.confirm("结算单状态为【" + nui.getDictText('AME_SETSTATUS', row.setstatus) + "】，编辑时请仔细！","编辑结算信息提示",
	                function(action){
	                    if(action=="ok"){
	                    	if (row.purtype == null || row.purtype == 0) {
			        			nui.open({ 
				                   url: "<%=request.getContextPath() %>/ame_pur/settle/PurOutSettleInput.jsp",
				                   title: "编辑结算信息",
				                   width: 1000,
				                   height: 500,
				                   onload: function () {
				                       var iframe = this.getIFrameEl();
				                       var data = {action:"edit",settlementid: row.settlementid,custid: row.custid,custno: row.custno};
				                       iframe.contentWindow.SetData(data);
				                   },
				                   ondestroy: function (action) {
				                   	   if(action == "ok"){
					                      grid.reload();
				                       }
				                   }
			                	});
			        		} else {
			        			nui.open({
			        			   url: "<%=request.getContextPath() %>/ame_pur/settle/PurOutSettleOtherInput.jsp",
			        			   title: "编辑非外包采购结算信息",
				                   width: 950,
				                   height: 450,
				                   onload: function () {
				                   		var iframe = this.getIFrameEl();
				                   		var data = {action:"edit",custid: row.custid,settlementid: row.settlementid};
				                   		iframe.contentWindow.SetData(data);
				                   },
				                   ondestroy: function (action){
					                   	if(action == "ok") {
					                   		grid.reload();
					                   	}
				                   }
								});
			        		}	  
	                    }
	                });
        		}else{
        			if (row.purtype == null || row.purtype == 0) {
			        			nui.open({ 
				                   url: "<%=request.getContextPath() %>/ame_pur/settle/PurOutSettleInput.jsp",
				                   title: "编辑结算信息",
				                   width: 1000,
				                   height: 500,
				                   onload: function () {
				                       var iframe = this.getIFrameEl();
				                       var data = {action:"edit",settlementid: row.settlementid,custid: row.custid,custno: row.custno};
				                       iframe.contentWindow.SetData(data);
				                   },
				                   ondestroy: function (action) {
				                   	   if(action == "ok"){
					                      grid.reload();
				                       }
				                   }
			                	});
			        		} else {
			        			nui.open({
			        			   url: "<%=request.getContextPath() %>/ame_pur/settle/PurOutSettleOtherInput.jsp",
			        			   title: "编辑非外包采购结算信息",
				                   width: 950,
				                   height: 450,
				                   onload: function () {
				                   		var iframe = this.getIFrameEl();
				                   		var data = {action:"edit",custid: row.custid,settlementid: row.settlementid};
				                   		iframe.contentWindow.SetData(data);
				                   },
				                   ondestroy: function (action){
					                   	if(action == "ok") {
					                   		grid.reload();
					                   	}
				                   }
								});
			        		}
        		}
            } else {
                nui.alert("请选中一条记录","提示");
            }
        }
        
        //查看
        function look(){
        	var row = grid.getSelected();
            if (row) {
            	
            	if (row.purtype == null || row.purtype == 0) {
            		nui.open({
	                    url: "<%=request.getContextPath() %>/ame_pur/settle/PurOutSettleLook.jsp",
	                    title: "查看结算信息",
	                    width: 1000,
	                    height: 600,
	                    onload: function () {
	                        var iframe = this.getIFrameEl();
	                        var data = {action:"look",settlementid:row.settlementid};
	                        iframe.contentWindow.SetData(data);
	                    },
	                    ondestroy: function (action) {
	                        grid.reload();
	                    }
                	});
            	} else {
            		nui.open({
            			url: "<%=request.getContextPath() %>/ame_pur/settle/PurOutSettleOtherLook.jsp",
            			title: "查看非外包采购结算信息",
            			width: 950,
            			height: 450,
            			onload: function () {
            				var iframe = this.getIFrameEl();
	                        var data = {action:"look",settlementid:row.settlementid};
	                        iframe.contentWindow.SetData(data);
            			},
            			ondestory: function (action) {
            				grid.reload();
            			}
            		});
            	}
            } else {
                nui.alert("请选中一条记录","提示");
            }
        }

        //删除结算信息
        function remove(){
            var rows = grid.getSelecteds();
            if(rows.length > 0){
	            //如果选择的结算单为流程运转或完成中则不能编辑和删除，只能查看
            	/* for(var i = 0; i < rows.length; i++){
            		if(rows[i].setstatus == "1" || rows[i].setstatus == "2"){
            			nui.alert("结算状态为" + nui.getDictText('AME_SETSTATUS', rows[i].setstatus) + ",不能删除！");
			            return;
            		}
            	} */
            	for(var j=0;j<rows.length;j++){
		        	if(rows[j].setstatus == "1" || rows[j].setstatus == "2" || rows[j].setstatus == "3"){
	        			nui.alert("结算单状态为" + nui.getDictText('AME_SETSTATUS',rows[j].setstatus) + "，不能删除！");
			            return;
	        		}
		        }
            	
                nui.confirm("确定删除选中的结算信息？","删除结算信息提示",
                function(action){
                    if(action=="ok"){
                    	var data = rows;
                    	var purSettles=[];
                    	for(var i = 0;i < data.length;i ++){
                    		purSettles[i] = {"settlementid": data[i].settlementid,"processinstid": data[i].processinstid,"setstatus": data[i].setstatus};
                    	}
						var json = nui.encode({purSettles: purSettles});
                        grid.loading("正在删除中,请稍等...");
                        $.ajax({
                            url:"com.primeton.eos.ame_pur.settle.deletePursettle.biz.ext",
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

        //重新刷新页面
        function refresh(){
            var form = new  nui.Form("#form1");
            var json = form.getData(false,false);
            grid.load(json);//grid查询
        }

        //查询
        function search() {
            var form = new nui.Form("#form1");
            var json = form.getData();
            grid.load(json);//grid查询
        }

        //重置查询条件
        function reset(){
            var form = new nui.Form("#form1");//将普通form转为nui的form
            form.reset();
            grid.load();
        }

        //enter键触发查询
        function onKeyEnter(e) {
            search();
        }

        //当选择列时
        function selectionChanged(){
            var rows = grid.getSelecteds();
            if(rows.length>1){
                nui.get("upbutton").disable();
            }else{
                nui.get("upbutton").enable();
            }
            <%--
            //如果选择的结算单为流程审批中则不能编辑和删除，只能查看
            if(rows.length>0){
        		var j = 0;
            	for(var i = 0; i < rows.length; i++){
            		if(rows[i].processinstid){
            			j += 1;
            		}
            		if(j > 0){
            			nui.get("upbutton").disable();
            			nui.get("deletebutton").disable();
            		}else{
            			nui.get("deletebutton").enable();
            		}
            	}
            }else{
            	nui.get("deletebutton").enable();
            }--%>
        }
        
        //点击查看详情
        function getDetail(e){
	        return "<a href='javascript:void(0)' onclick='checkDetail();' title='点击查看' >"+e.value+"</a>";
        }
        function checkDetail(){
	 		var selectRow = grid.getSelected();
	 		var executeUrl = "";
	 		if (selectRow.purtype == 0) {
	 			executeUrl = "<%=request.getContextPath() %>/ame_pur/settle/PurOutSettleLook.jsp?settlementid=" + selectRow.settlementid + "&projectno=" + selectRow.projectno + "&custid=" + selectRow.custid + "&custno=" + selectRow.custno;
	 		} else {
	 			executeUrl = "<%=request.getContextPath() %>/ame_pur/settle/PurOutSettleOtherLook.jsp?settlementid=" + selectRow.settlementid + "&projectno=" + selectRow.projectno + "&custid=" + selectRow.custid;			
	 		}
	 		window.open(executeUrl, "查看结算信息", "fullscreen=1");
	    }
	    
	    //财务合同编号
	    function detailCscontract(e){
	    	if(e.value){
	    		return "<a href='javascript:void(0)' onclick='detailCscontract1();' title='点击查看'>" + e.value + "</a>";
	    	}
	    }
	    function detailCscontract1(){
			var selectRow = grid.getSelected();
			var executeUrl = "<%=request.getContextPath() %>/contract/contract/contractView.jsp?contractid=" + selectRow.cwcontractid;
			window.open(executeUrl, "合同查看", "fullscreen=1");
		}
	    
	    //设置业务字典值-事业部
		function dictGetContOrg(e){
			return nui.getDictText('CONT_ORG',e.value);
		}
		
		//设置业务字典值-工作量单位
		function dictGetServ(e){
			return nui.getDictText('SERV_NUM_TYPE',e.value);
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
        
        function exportCurrent(){
			var form = new nui.Form("#form1");
			var json = form.getData();
			form.loading("结算记录导出中...");
			nui.ajax({
    			url: "com.primeton.eos.ame_pur.settle.exportSettleCheck.biz.ext",
		        type: "post",
		        data: json,
		        cache: false,
		        contentType: 'text/json',
		        success: function (o) {
		     		form.unmask();
		        	var filePath = o.downloadFile;
		        	var fileName = "purSettle";
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
    </script>
</body>
</html>
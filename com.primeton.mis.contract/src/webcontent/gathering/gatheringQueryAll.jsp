<%@page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<!-- 
  - Author(s): LJ
  - Date: 2013-03-03 11:07:52
  - Description:
-->
<%@include file="/nui/common.jsp" %>
<%@include file="/common/common.jsp"%>
<head>
    <title>Pagination 分页表格</title>
    <meta http-equiv="content-type" content="text/html; charset=UTF-8" />
    <link href="../demo.css" rel="stylesheet" type="text/css" />
</head>
<body>
    <div class="nui-panel" title="收款确认查询" style="width:100%;">
	    <div style="padding-bottom:5px;" id="form1">
	    	<input class="nui-hidden" name="sortField" value="optime"/>
			<input class="nui-hidden" name="sortOrder" value="desc"/>
			<div class="nui-toolbar" style="border-bottom:0;padding:0px;">
				<table style="width:100%;">
					<tr>
		            	<td align="right" nowrap="nowrap"><span>销售:</span></td>
		            	<td align="left">
							<input class="nui-textbox" name="criteria._ref[1]._expr[0]._value" id="salename"/>						
							<input class="nui-hidden" name="criteria._expr[0]._property" value="gatherid"/>
							<input class="nui-hidden" name="criteria._expr[0]._op" value="in" id="tempCond1"/>
							<input class="nui-hidden" name="criteria._expr[0]._ref" value="1" id="tempCond2"/>
							<input class="nui-hidden" name="criteria._ref[0]._id" value="1"/>
							<input class="nui-hidden" name="criteria._ref[0]._entity" value="com.primeton.mis.contract.contract.CsGatherCont"/>
							<input class="nui-hidden" name="criteria._ref[0]._select._field[0]" value="csGather.gatherid"/>
					        <input class="nui-hidden" name="criteria._ref[0]._expr[0]._property" value="csContract.contractid"/>
					        <input class="nui-hidden" name="criteria._ref[0]._expr[0]._op" value="in"/>
					        <input class="nui-hidden" name="criteria._ref[0]._expr[0]._ref" value="2"/>
							<input class="nui-hidden" name="criteria._ref[1]._id" value="2"/>
							<input class="nui-hidden" name="criteria._ref[1]._entity" value="com.primeton.mis.contract.contract.CsContract"/>
							<input class="nui-hidden" name="criteria._ref[1]._select._field[0]" value="contractid"/>
					        <input class="nui-hidden" name="criteria._ref[1]._expr[0]._property" value="salename"/>
							<input class="nui-hidden" name="criteria._ref[1]._expr[0]._op" value="like"/>
							<input class="nui-hidden" name="criteria._ref[1]._expr[0]._likeRule" value="all"/>
						</td>
						<td align="right" nowrap="nowrap"><span>实际收款日期:</span></td>
		            	<td align="left">
		            		<input class="nui-datepicker" name="criteria._expr[1]._min" style="width:100px;"/>-<input class="nui-datepicker" name="criteria._expr[1]._max" style="width:100px;"/>
					        <input class="nui-hidden" name="criteria._expr[1]._property" value="gatherdate"/>
					        <input class="nui-hidden" name="criteria._expr[1]._op" value="between"/>
					        <input class="nui-hidden" name="criteria._expr[1]._pattern" value="yyyy-MM-dd"/>
					    </td>
		            	<td align="right" nowrap="nowrap"><span>支付单位:</span></td>
		            	<td align="left">
							<input class="nui-textbox" name="criteria._expr[2]._value"/>
							<input class="nui-hidden" name="criteria._expr[2]._property" value="misCustinfo.custname" id="custnameProperty"/>
							<input class="nui-hidden" name="criteria._expr[2]._op" value="like"/>
							<input class="nui-hidden" name="criteria._expr[2]._likeRule" value="all"/>
						</td>
		            	<td align="right" nowrap="nowrap"><span>合同存档编号:</span></td>
		            	<td align="left">
							<input class="nui-textbox" name="criteria._ref[1]._expr[1]._value" id="contnum"/>
					        <input class="nui-hidden" name="criteria._ref[1]._expr[1]._property" value="contnum"/>
							<input class="nui-hidden" name="criteria._ref[1]._expr[1]._op" value="like"/>
							<input class="nui-hidden" name="criteria._ref[1]._expr[1]._likeRule" value="all"/>
					    </td>
					</tr>
					<tr>
					    <td align="right"><span>收款金额:</span></td>
					    <td align="left">
		            		<input class="nui-textbox" name="criteria._expr[3]._min" style="width:80px;"/>-<input class="nui-textbox" name="criteria._expr[3]._max" style="width:80px;"/>
					        <input class="nui-hidden" name="criteria._expr[3]._property" value="summon"/>
					        <input class="nui-hidden" name="criteria._expr[3]._op" value="between"/>
					    </td>
						<td align="right"><span>财报收款日期:</span></td>
		            	<td align="left" nowrap="nowrap">
		            		<input class="nui-datepicker" name="criteria._expr[6]._min" style="width:100px;"/>-<input class="nui-datepicker" name="criteria._expr[6]._max" style="width:100px;"/>
					        <input class="nui-hidden" name="criteria._expr[6]._property" value="confirmday"/>
					        <input class="nui-hidden" name="criteria._expr[6]._op" value="between"/>
					        <input class="nui-hidden" name="criteria._expr[6]._pattern" value="yyyy-MM-dd"/>
					    </td>
		            	<td align="right"><span>所属事业部:</span></td>
		            	<td align="left">
		            		<input class="nui-dictcombobox" name="criteria._ref[1]._expr[2]._value" id="org" dictTypeId="CONT_ORG" showNullItem="true" nullItemText="全部"/>
					        <input class="nui-hidden" name="criteria._ref[1]._expr[2]._property" value="org"/>
							<input class="nui-hidden" name="criteria._ref[1]._expr[2]._op" value="like"/>
							<input class="nui-hidden" name="criteria._ref[1]._expr[2]._likeRule" value="all"/>
													
							<input class="nui-hidden" name="criteria._ref[1]._expr[3]._value" id="salesname"/>
		            		<input class="nui-hidden" name="criteria._ref[1]._expr[3]._property" value="salename"/>
					        <input class="nui-hidden" name="criteria._ref[1]._expr[3]._op" value="in"/>
					    </td>
		            	<td align="right"><span>收款方式:</span></td>
		            	<td align="left">
		            		<input class="nui-dictcombobox" name="criteria._expr[4]._value" id="gathertype" multiSelect="true" dictTypeId="AME_CSGATHERTYPE" showNullItem="false" />
					        <input class="nui-hidden" name="criteria._expr[4]._property" value="gathertype"/>
							<input class="nui-hidden" name="criteria._expr[4]._op" value="in"/>
					    </td>
					</tr>
					<tr>
						<td align="right"><span>收款操作日期:</span></td>
		            	<td align="left">
		            		<input class="nui-datepicker" name="criteria._expr[5]._min" style="width:100px;"/>-<input class="nui-datepicker" name="criteria._expr[5]._max" style="width:100px;"/>
					        <input class="nui-hidden" name="criteria._expr[5]._property" value="optime"/>
					        <input class="nui-hidden" name="criteria._expr[5]._op" value="between"/>
					        <input class="nui-hidden" name="criteria._expr[5]._pattern" value="yyyy-MM-dd"/>
					    </td>
						<td align="right"><span>汇票承兑日期:</span></td>
		            	<td align="left" nowrap="nowrap">
		            		<input class="nui-datepicker" name="criteria._expr[7]._min" style="width:100px;"/>-<input class="nui-datepicker" name="criteria._expr[7]._max" style="width:100px;"/>
					        <input class="nui-hidden" name="criteria._expr[7]._property" value="acceptday"/>
					        <input class="nui-hidden" name="criteria._expr[7]._op" value="between"/>
					        <input class="nui-hidden" name="criteria._expr[7]._pattern" value="yyyy-MM-dd"/>
					    </td>
						<td align="right"><span>票面到期日:</span></td>
		            	<td align="left" nowrap="nowrap">
		            		<input class="nui-datepicker" name="criteria._expr[8]._min" style="width:100px;"/>-<input class="nui-datepicker" name="criteria._expr[8]._max" style="width:100px;"/>
					        <input class="nui-hidden" name="criteria._expr[8]._property" value="expiredate"/>
					        <input class="nui-hidden" name="criteria._expr[8]._op" value="between"/>
					        <input class="nui-hidden" name="criteria._expr[8]._pattern" value="yyyy-MM-dd"/>
					    </td>
					    <td align="center" colspan="2">
						</td>
					</tr>
					<tr>
						<td align="center" colspan="8">
							<a class="nui-button" iconCls="icon-search" onclick="search()">查找</a>
							<a class="nui-button" iconCls="icon-download" onclick="exportGather()">导出收款到Excel</a>
							<a class="nui-button" iconCls="icon-download" onclick="exportGatherCont()">导出合同收款到Excel</a>
						</td>
					</tr>
				</table>
			</div>
	    </div>
	    <div style="width:100%;">
	        <div class="nui-toolbar" style="border-bottom:0;padding:0px;">
	            <table style="width:100%;">
	                <tr>
	                    <td style="width:100%;">
	                        <a class="nui-button" id="addBtn" iconCls="icon-add" onclick="add()">增加</a>
	                        <a class="nui-button" id="editBtn" iconCls="icon-edit" onclick="edit()">编辑</a>
	                        <a class="nui-button" id="deleteBtn" iconCls="icon-remove" onclick="remove()">删除</a>
	                        <a class="nui-button" id="editBtn3" iconCls="icon-edit" onclick="edit3()">汇票承兑</a>
	                    </td>
	                </tr>
	            </table>           
	        </div>
	    </div>
		
	    <div id="datagrid1" class="nui-datagrid" style="width:100%;height:450px;" allowResize="true" pageSize="20"  showSummaryRow="true" ondrawsummarycell="doCountNowPage"
        url="com.primeton.mis.contract.gathering.queryGathering.biz.ext" idField="id" frozenStartColumn="0" frozenEndColumn="4" multiSelect="false"
    	 sizeList="[10,20,30,50,100,200,500,1000,3000]">
		    <div property="columns">
		       	<div type="checkcolumn" ></div>
		        <div field="misCustinfo.custname" width="120" renderer="onTitleRenderer" headerAlign="center" allowSort="true">支付单位</div>
		        <div field="gatherdate" width="80" dateFormat="yyyy-MM-dd" align="center" headerAlign="center" allowSort="true">实际收款日期</div>
		        <div field="confirmday" width="80" dateFormat="yyyy-MM-dd" align="center" headerAlign="center" allowSort="true">财报收款日期</div>
		        <div field="acceptday" width="80" dateFormat="yyyy-MM-dd" align="center" headerAlign="center" allowSort="true">汇票承兑日期</div>
		        <div field="summon" width="70" dataType="currency" summaryType="sum" align="right" headerAlign="center" allowSort="true">收款金额</div>
		        <div field="gathertype" renderer="gathertypeDeal" width="50" headerAlign="center">收款方式</div>
		        <div field="expiredate" width="80" dateFormat="yyyy-MM-dd" align="center" headerAlign="center" allowSort="true">票面到期日</div>
		        <div field="contnums" width="55" headerAlign="center">合同存档编号</div>
		        <div field="projectnames" width="100" headerAlign="center">合同名称（项目）</div>
		        <div field="salenames" width="40" headerAlign="center">销售</div>
		        <div field="ejorgname" width="60" headerAlign="center">销售所在部门</div>
		        <div field="orgs" renderer="orgDeal" width="60" headerAlign="center">所属事业部</div>
		        <div field="incomeyear" width="0" headerAlign="center" allowSort="true">对应收入年份</div>
		        <div field="optime"" width="65" dateFormat="yyyy-MM-dd" align="center" headerAlign="center" allowSort="true">收款操作日期</div>
		        <div field="kmbm" displayField="kmbmname" width="60" headerAlign="center">总账科目</div>
		    </div>
		</div>
	</div>
	<form name="viewlist1" id="viewlist1" action="com.primeton.eos.ame_common.ameExportCommon.flow" method="post">
		<h:hidden property="_eosFlowAction" value="action0"/>
		<h:hidden property="downloadFile"/>
		<h:hidden property="fileName"/>
	</form> 
	<script type="text/javascript">
		nui.parse();
		var grid = nui.get("datagrid1");	
		init();
		function init(){
			var isCommerce = false;
			var isFinance = false;
			var isLeader = false;
			var isAssistant = false;//是否是事业部助理
			var isOrgLeader = false;//是否是销售部门的主管
			<l:iterate id="roles" property="userObject/attributes/roles" scope="session">
				var roleid = "<b:write iterateId='roles' property='roleid'/>";
				if(roleid == "commerce"){
					isCommerce = true;
				}
				if(roleid == "finance"){
					isFinance = true;
				}
				if(roleid == "assistant"){
					isAssistant = true;
				}
				if(roleid == "COO" || roleid == "legal" || roleid == "PMO" || roleid == "YYPT"){
					isLeader = true;
				}
			</l:iterate>
			if(isFinance == false && isCommerce == false){
				nui.get("addBtn").setEnabled(false);
				nui.get("editBtn").setEnabled(false);
				nui.get("deleteBtn").setEnabled(false);
			}
			if(isAssistant == true && isLeader == false){//助理，可以看本事业部的
				nui.get("addBtn").setEnabled(false);
				nui.get("editBtn").setEnabled(false);
				nui.get("deleteBtn").setEnabled(false);
				var userid = "<b:write property='userObject/userId' scope='session'/>";
				var data = {userid:userid};
	            var json = nui.encode(data);
				nui.ajax({
	                url: "com.primeton.mis.contract.contract.getAssisBelongTo.biz.ext",
	                type: "post",
	                data: json, 
	                cache: false,
	                contentType: 'text/json',
	                success: function (o) {
	                    if(o.org == null || o.org == ""){
	                    	nui.get("org").setValue("5");
	                    	nui.get("org").setEnabled(false);
	                    }else{
	                    	nui.get("org").setValue(o.org);
	                    	nui.get("org").setEnabled(false);
	                    }
	                	var form=new nui.Form("#form1");
						var data=form.getData();
						grid.load(data);
	                },
	                error: function () {
	                }
	            });
			}
			if(isFinance == false && isCommerce == false && isLeader == false && isAssistant == false){//非商务、非财务、非助理，只能看自己的合同或者自己部门的合同
				var empid = "<b:write property='userObject/attributes/empid' scope='session'/>";
				var data = {empid:empid};
			    var json = nui.encode(data);
			    var salesname = "";
				nui.ajax({
			        url: "com.primeton.mis.contract.contract.getSaleLeadersAllSubSale.biz.ext",
			        type: "post",
			        data: json, 
			        cache: false,
			        contentType: 'text/json',
			        success: function (o) {
			            if(o.isorgleader == "1"){
			            	isOrgLeader = true;
			            	salesname = o.salesname;
							if(isOrgLeader == true){//部门经理，可以看本部门的
								nui.get("salesname").setValue(salesname);
			                	var form=new nui.Form("#form1");
								var data=form.getData();
								grid.load(data);
							}
			            }else{		            	
							var username = "<b:write property='userObject/userName' scope='session'/>";
							nui.get("salename").setValue(username);
							nui.get("salename").setEnabled(false);
		                	var form=new nui.Form("#form1");
							var data=form.getData();
							grid.load(data);
			            }
			        },
			        error: function () {
			        }
			    });
			}else{
				grid.load();
				grid.sortBy("optime", "desc");
			}
		}
		function orgDeal(e) {
	        return nui.getDictText('CONT_ORG',e.value);
	    }
		function search() {
			if(nui.get("salename").getValue() == "" && nui.get("contnum").getValue() == "" && nui.get("org").getValue() == "" && nui.get("salesname").getValue() == ""){
	    		nui.get("tempCond1").setValue("=");
	    		nui.get("tempCond2").setValue("");
	    	}else{
	    		nui.get("tempCond1").setValue("in");
	    		nui.get("tempCond2").setValue("1");
	    	}
			var form=new nui.Form("#form1");
	    	var data=form.getData();
			grid.load(data);
		}
		function onGenderRenderer(e) {
	        return nui.getDictText('BILLTYPE',e.value);
	    }
		function onGender1Renderer(e) {
	        return nui.getDictText('CS_BILLTYPE',e.value);
	    }
	    function gathertypeDeal(e){
	        return nui.getDictText('AME_CSGATHERTYPE',e.value);
	    }
	    function onTitleRenderer(e) {
			return "<a href='javascript:void(0)' onclick='doView();' title='点击查看收款信息'>" + e.value + "</a>";
		}
		function doView(){
			var selectRow = grid.getSelected();
			if(!selectRow){
				nui.alert("请选择其中一条收款数据!");
				return;
			}
			var executeUrl = "<%=request.getContextPath() %>/contract/gathering/gatheringView.jsp?gatherid=" + selectRow.gatherid;
			window.open(executeUrl, "收款确认信息查看", "fullscreen=1");
		}
		//对该页的总金额做合计
	    function doCountNowPage(e){        	
	        //客户端汇总计算
	        if (e.field == "summon" || e.field == "unrecmon") {
	            e.cellHtml = "<div align='right'><b>￥" + e.cellHtml + "</b></div>";
	        }
	    }
	    function remove() {            
	        var row = grid.getSelected();
	        var data = {csgather:row};
	        var json = nui.encode(data);
	        if (row) {
	            if (confirm("删除收款会清空该收款对应合同下的所有核销应收，是否删除？")) {
		        	if(row.processinstid != null && row.processinstid != ""){
		        		if(!confirm("您选中的收款记录已经发起了收款确认流程，您还是确认要删除吗？")){
		        			return;
		        		}
		        	}
	                grid.loading("操作中，请稍后......");
	                nui.ajax({
	                    url: "com.primeton.mis.contract.gathering.deleteGatherings.biz.ext",
	                    type: "post",
	                    data: json, 
	                    cache: false,
	                    contentType: 'text/json',
	                    success: function (text) {
	                        grid.reload();
	                    },
	                    error: function () {
	                    }
	                });
	            }
	        } else {
	            alert("请选中一条记录");
	        }
	    }
	    function add() {
	        nui.open({
	            url: "<%=request.getContextPath() %>/contract/gathering/gatheringModify.jsp",
	            title: "财务新增收款确认", width: 650, height: 320,
	            onload: function () {
	                var iframe = this.getIFrameEl();
	                var data = { action: "new"};
	                iframe.contentWindow.SetData(data);
	            },
	            ondestroy: function (action) {
	                if(action == "save"){
	                	nui.alert("保存成功！");
	                	grid.reload();
	                }
	            }
	        });
	    }
	    function edit() {
	    	var rows = grid.getSelecteds();
	    	if (rows.length > 1) {
	    		alert("只能选中一条记录进行编辑");
	    	}else{
	            var row = grid.getSelected();
	            if (row) {
	            	if(row.processinstid != null && row.processinstid != ""){
	            		alert("该条记录已经发起了收款确认流程，您无权进行编辑！");
	            		return;
	            	}
	                nui.open({
	                    url: "<%=request.getContextPath() %>/contract/gathering/gatheringModify.jsp",
	                    title: "财务编辑开票申请", width: 650, height: 320,
	                    onload: function () {
	                        var iframe = this.getIFrameEl();
	                        var data = { action: "edit", gatherid: row.gatherid };
	                        iframe.contentWindow.SetData(data);
	                    },
	                    ondestroy: function (action) {
	                    	if(action == "save"){
	                    		nui.alert("保存成功！");
		                        grid.reload();
	                    	}
	                    }
	                });
	                
	            } else {
	                alert("请选中一条记录");
	            }
	        }
	    }
	    function edit1() {
	    	var rows = grid.getSelecteds();
	    	if (rows.length > 1) {
	    		alert("只能选中一条记录进行编辑,请任意选择该合同的一条收款即可！");
	    	}else{
	    		var row = grid.getSelected();
	    		var json = {csGather: row};
	            if (row) {
	            	var messageId = nui.loading("正在计算中,请稍后...","提示");
		            nui.ajax({
				        url: "com.primeton.mis.contract.rec.setRalationOfGatherAndIncome.biz.ext",
				        type: "post",
				        data: json,
				        cache: false,
				        contentType: 'text/json',
				        success: function () {
				        	nui.hideMessageBox(messageId);
							alert("success!");			     		
							grid.reload();
				        },
				        error: function () {
				        	alert("error!");
				        }
				    });
	    		}else{
	    			alert("请任意选择该合同的一条收款即可!");
	    		}
	        }
	    }
	    
	    function edit2() {
	    	var rows = grid.getSelecteds();
	    	if (rows.length > 1) {
	    		alert("只能选中一条记录进行编辑");
	    	}else{
	            var row = grid.getSelected();
	            if (row) {
	            	//if(row.processinstid != null && row.processinstid != ""){
	            	//	alert("该条记录已经发起了收款确认流程，您无权进行核销开票！");
	            	//	return;
	            	//}
	                nui.open({
	                    url: "<%=request.getContextPath() %>/contract/gathering/gatheringDeal.jsp",
	                    title: "核销开票", width: 1000, height: 500,
	                    onload: function () {
	                        var iframe = this.getIFrameEl();
	                        var data = { action: "edit", gatherid: row.gatherid };
	                        iframe.contentWindow.SetData(data);
	                    },
	                    ondestroy: function (action) {
	                        grid.reload();
	                    }
	                });
	                
	            } else {
	                alert("请选中一条记录");
	            }
	        }
	    }
	    
	    //汇票承兑
	    function edit3(){
	    	var rows = grid.getSelecteds();
	    	if (rows.length > 1) {
	    		alert("只能选中一条记录进行编辑");
	    	}else{
	            var row = grid.getSelected();
	            if (row) {
	            	if(row.gathertype != '3' && row.gathertype != '4'){
	            		nui.alert("只有收款方式为'银行承兑汇票'和'商业承兑汇票'的收款记录才能汇票承兑！");
	            		return;
	            	}
	            	if(row.contnums == '' || row.contnums == null){
	            		nui.alert("只有收款确认流程已完成的收款才能汇票承兑！");
	            		return;
	            	}
	                nui.open({
	                    url: "<%=request.getContextPath() %>/contract/gathering/gatheringAccept.jsp",
	                    title: "汇票承兑", width: 650, height: 320,
	                    onload: function () {
	                        var iframe = this.getIFrameEl();
	                        var data = { gatherid: row.gatherid };
	                        iframe.contentWindow.SetData(data);
	                    },
	                    ondestroy: function (action) {
	                    	if(action == "save"){
	                    		nui.alert("汇票承兑成功！");
		                        grid.reload();
	                    	}
	                    }
	                });
	                
	            } else {
	                alert("请选中一条记录");
	            }
	        }
	    }
	    
	    function exportGather(){
	    	 if(nui.get("salename").getValue() == "" && nui.get("contnum").getValue() == "" && nui.get("org").getValue() == "" && nui.get("salesname").getValue() == ""){
	    		nui.get("tempCond1").setValue("=");
	    		nui.get("tempCond2").setValue("");
	    	}else{
	    		nui.get("tempCond1").setValue("in");
	    		nui.get("tempCond2").setValue("1");
	    	}
			var form=new nui.Form("#form1");
	    	var data=form.getData();
	    	var json = nui.encode(data);
	    	
	    	grid.loading("操作中，请稍后......");
			nui.ajax({
		        url: "com.primeton.mis.contract.gathering.exportQueryGathering.biz.ext",
		        type: "post",
		        data: json,
		        cache: false,
		        contentType: 'text/json',
		        success: function (o) {
		     		grid.unmask ( );
		        	var filePath = o.downloadFile;
		        	var fileName = "gather";
		        	var myDate = new Date();
		        	var year = myDate.getYear();
		        	var month = myDate.getMonth()+1;
		        	var day = myDate.getDate();
		        	var hours = myDate.getHours();
		        	var minutes = myDate.getMinutes();
		        	var seconds = myDate.getSeconds();
		        	var curDateTime = year;
		        	if(month>9)
						curDateTime = curDateTime + "" + month;
					else
						curDateTime = curDateTime + "0" + month;
		        	if(day>9)
						curDateTime = curDateTime + "" + day;
					else
						curDateTime = curDateTime + "0" + day;
					if(hours>9)
						curDateTime = curDateTime + "" + hours;
					else
						curDateTime = curDateTime + "0" + hours;
					if(minutes>9)
						curDateTime = curDateTime + "" + minutes;
					else
						curDateTime = curDateTime + "0" + minutes;
					if(seconds>9)
						curDateTime = curDateTime + "" + seconds;
					else
						curDateTime = curDateTime + "0" + seconds;
					fileName = fileName + "_" + curDateTime + ".xls";
		        	var frm = document.getElementById("viewlist1");
		        	frm.elements["downloadFile"].value = filePath;
		        	frm.elements["fileName"].value = fileName;
				    frm.submit();
		            //window.open("com.primeton.mis.contract.exportGather.flow?downloadFile="+filePath+"&fileName=gather.xls");
		        },
		        error: function () {
		        	alert("error");
		        }
		    });
	         
	    }
	    
	    function exportGatherCont(){
	    	 if(nui.get("salename").getValue() == "" && nui.get("contnum").getValue() == "" && nui.get("org").getValue() == "" && nui.get("salesname").getValue() == ""){
	    		nui.get("tempCond1").setValue("=");
	    		nui.get("tempCond2").setValue("");
	    	}else{
	    		nui.get("tempCond1").setValue("in");
	    		nui.get("tempCond2").setValue("1");
	    	}
	    	nui.get("custnameProperty").setValue("custname");
			var form=new nui.Form("#form1");
	    	var data=form.getData();
	    	var json = nui.encode(data);
	    	
	    	grid.loading("操作中，请稍后......");
			nui.ajax({
		        url: "com.primeton.mis.contract.gathering.exportCsGatherCont.biz.ext",
		        type: "post",
		        data: json,
		        cache: false,
		        contentType: 'text/json',
		        success: function (o) {
	    			nui.get("custnameProperty").setValue("misCustinfo.custname");
		     		grid.unmask ( );
		        	var filePath = o.downloadFile;
		        	var fileName = "gather";
		        	var myDate = new Date();
		        	var year = myDate.getYear();
		        	var month = myDate.getMonth()+1;
		        	var day = myDate.getDate();
		        	var hours = myDate.getHours();
		        	var minutes = myDate.getMinutes();
		        	var seconds = myDate.getSeconds();
		        	var curDateTime = year;
		        	if(month>9)
						curDateTime = curDateTime + "" + month;
					else
						curDateTime = curDateTime + "0" + month;
		        	if(day>9)
						curDateTime = curDateTime + "" + day;
					else
						curDateTime = curDateTime + "0" + day;
					if(hours>9)
						curDateTime = curDateTime + "" + hours;
					else
						curDateTime = curDateTime + "0" + hours;
					if(minutes>9)
						curDateTime = curDateTime + "" + minutes;
					else
						curDateTime = curDateTime + "0" + minutes;
					if(seconds>9)
						curDateTime = curDateTime + "" + seconds;
					else
						curDateTime = curDateTime + "0" + seconds;
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
	</script>
</body>
</html>
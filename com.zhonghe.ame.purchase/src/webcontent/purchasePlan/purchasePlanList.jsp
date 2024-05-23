<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@include file="/purchase/common/common.jsp"%>
<html>
<head>
<title>采购计划</title>
<style type="text/css">
html,body {
	margin: 0;
	padding: 0;
	border: 0;
	width: 100%;
	height: 100%;
	overflow: hidden;
}

.mini-grid-cell-nowrap {
	white-space: nowrap;
}
</style>
</head>
<body>
	<div id="form1" style="width: 100%; height: 100%">
		<div class="nui-toolbar" style="border-bottom: 0; padding: 0px;">
			<table align="center" border="0" width="100%" class="form_table">
				<tr>
					<td>
						<input class="nui-hidden" name="criteria._expr[0]._op" value="like" />
						<input class="nui-hidden" name="criteria._expr[3]._op" value="=" />
						<input class="nui-hidden" name="criteria._expr[4]._op" value="=" />
						<input class="nui-hidden" name="criteria._expr[11]._op" value="like" />
					</td>
					<td colspan="1">
						<input class="nui-hidden" name="criteria._expr[2]._property" value="needOrgId" />
						<input class="nui-hidden" name="criteria._expr[2]._op" value="in" id="tempCond1" />
						<input class="nui-hidden" name="criteria._expr[2]._ref" value="" id="tempCond2" />
						<input class="nui-hidden" name="criteria._ref[0]._id" value="1" />
						<input class="nui-hidden" name="criteria._ref[0]._entity" value="org.gocom.abframe.dataset.organization.OmOrganization" />
						<input class="nui-hidden" name="criteria._ref[0]._select._field[0]" value="orgid" />
						<input class="nui-hidden" name="criteria._ref[0]._expr[0]._property" value="orgseq" />
						<input class="nui-hidden" name="criteria._ref[0]._expr[0]._op" value="like" />
						<input class="nui-hidden" name="criteria._ref[0]._expr[0]._likeRule" value="end" />
						<input class="nui-hidden" name="criteria._expr[5]._property" value="needOrgId" />
						<input class="nui-hidden" name="criteria._expr[5]._op" value="in" />
						<input class="nui-hidden" name="criteria._expr[5]._value" id="orgids2" />
					</td>
					<td>
						<input name="criteria._expr[6]._value" class="nui-hidden" id="createdBy" />
						<input class="nui-hidden" name="criteria._expr[6]._property" value="createdBy" />
						<input class="nui-hidden" name="criteria._expr[6]._op" value="=" />
						<input name="criteria._expr[7].ischange" class="nui-hidden" value="1" />
						<input class="nui-hidden" name="criteria._expr[7]._op" value="=" />
					</td>
				</tr>
				<tr>
				</tr>
			</table>
		</div>
		<div class="nui-fit">
			<div class="nui-toolbar" style="border-bottom: 0; padding: 0px;">
				<table style="width: 100%;">
					<tr>
						<td style="width: 40%;">
							<a class="nui-button" id="cgjh_add" iconCls="icon-add" onclick="getDate()">新增</a>
							<a class="nui-button" id="checkviewedit" iconCls="icon-edit" onclick="addChange()">补充计划</a>
							<a class="nui-button" id="checkviewedit" iconCls="icon-edit" onclick="openEdit(2)">变更</a>
							<a class="nui-button" id="cgjh_zf" iconCls="icon-edit" onclick="zf_edit()">作废</a>
							<a class="nui-button" id="cgjh_exportExcel" iconCls="icon-download" onclick="onExportExcel()">导出</a>
							<a class="nui-button" id="checkview" iconCls="icon-print" onclick="print()">打印</a>
							<a class="nui-button" id="cgjh_help" iconCls="icon-help" onclick="help()">帮助</a>
							<a class="nui-button" id="cgjh_help_bcbg" iconCls="icon-help" onclick="help_bcbg()">帮助(补充/变更)</a>
						</td>
						<td colspan="9" align="right">
							<a class="nui-button" id="search" iconCls="icon-search" onclick="search()">查询</a>
							<a class="nui-button" id="reset" iconCls="icon-reload" onclick="reset()">重置</a>
						</td>
					</tr>
				</table>
			</div>
			<div id="datagrid1" sizeList="[25,50,100]" showPager="true" dataField="data" pageSize="25" showFilterRow="true" allowAlternating="true" class="nui-datagrid" style="width: 100%; height: 95%;"
				url="com.zhonghe.ame.purchase.purchaseItems.queryPurPlanList.biz.ext" multiSelect="false" allowSortColumn=true>
				<div property="columns">
					<div name="temp123" type="checkcolumn"></div>
					<div type="indexcolumn" align="center" headerAlign="center">序号</div>
					<div field="name" width="160" align="left" headerAlign="center" renderer="lookInfo">
						采购计划名称
						<input name="criteria._expr[0].name" property="filter" class="nui-textbox" style="width: 100%;" onvaluechanged="search" />
					</div>
					<div field="needOrgName" width="100" align="center" headerAlign="center">
						采购单位
						<input id="orgid2" name="criteria._ref[0]._expr[0]._value" style="width: 100%;" class="nui-combobox" property="filter" textField="orgname" valueField="orgseq" dataField="orgs"
							showNullItem="true" allowInput="true" onvaluechanged="search" />
					</div>
					<div field="type" width="80" align="center" headerAlign="center" renderer="dictIshavebak">
						采购类型
						<input name="criteria._expr[4].type" class="nui-dictcombobox" property="filter" dictTypeId="ZH_PURCHASE" shownullItem="true" width="100%" onvaluechanged="search" />
					</div>
					<div field="year" width="80" align="center" headerAlign="center">
						计划年度
						<input name="criteria._expr[10].year" class="nui-textbox" property="filter" width="100%" onvaluechanged="search" />
					</div>
					<div field="budgetAmount" width="100" align="center" headerAlign="center">
						计划金额（万元）
						<input name="criteria._expr[8].budgetAmount" class="nui-textbox" property="filter" width="100%" onvaluechanged="search" />
					</div>
					<div field="newBudgetAmount" width="100" align="center" headerAlign="center">
						变更后计划金额（万元）
						<input name="criteria._expr[9].newBudgetAmount" class="nui-textbox" property="filter" width="100%" onvaluechanged="search" />
					</div>
					<div field="createdUsername" width="80" align="center" headerAlign="center">
						创建人
						<input name="criteria._expr[11].createdUsername" property="filter" class="nui-textbox" style="width: 100%;" onvaluechanged="search" />
					</div>
					<div field="updatedTime" width="80" align="center" headerAlign="center" dateFormat="yyyy-MM-dd" allowSort="true">更新时间</div>
					<div field="status" width="80" align="center" headerAlign="center" renderer="onActionRenderer">
						状态
						<input name="criteria._expr[12].status" class="nui-dictcombobox" property="filter" dictTypeId="ZH_FLOW_TYPE" shownullItem="true" width="100%" onvaluechanged="search" />
					</div>
					<div field="changeState" width="80" align="center" headerAlign="center" renderer="onYn">
						是否变更
						<input name="criteria._expr[13].changeState" class="nui-dictcombobox" property="filter" dictTypeId="ZH_YN" shownullItem="true" width="100%" onvaluechanged="search" />
					</div>
				</div>
			</div>
		</div>
	</div>
	<form name="viewlist1" id="viewlist1" action="com.primeton.eos.ame_common.ameExportCommon.flow" method="post">
		<input type="hidden" name="_eosFlowAction" value="action0" filter="false" />
		<input type="hidden" name="downloadFile" filter="false" />
		<input type="hidden" name="fileName" filter="false" />
	</form>
	<script type="text/javascript">
    	nui.parse();
		var form = new nui.Form("#form1");
    	var grid = nui.get("datagrid1");
		init();
		//查询季度数据字典
		var changeDict;
		//查询季度数据字典
		var planOpenDict;
    	function init(){
    		//按钮权限的控制
	    	getOpeatorButtonAuth("cgjh_exportExcel,cgjh_zf,cgjh_add,cgjh_help,cgjh_help_bcbg");
    		//code:对应功能编码，map：对于机构的查询条件
			var json = {"code":"cgjh"};
    		nui.ajax({
				url:"com.primeton.eos.ame_auth.ame_auth.getownorg1.biz.ext",
				data:json,
				type:'POST',
				contentType:'text/json',
				success:function(text){
					if(text.orgs){
						if(text.orgs.length==0){
							//当没有有权的机构时将申请人设置为登陆人
							nui.get("createdBy").setValue(userId);
							/* nui.get("createBy").setValue(userId);
							nui.get("createname").setValue(userName);
							nui.get("createname").setReadOnly(true); */
						}
						//根据情况选择一种
						nui.get("orgid2").setData(text.orgs);
						nui.get("orgids2").setValue(text.orgids);
					}else{
						//当没有有权的机构时将申请人设置为登陆人
						nui.get("createdBy").setValue(userId);
						/* nui.get("createUserid").setValue(userId);
						nui.get("createname").setValue(userName);
						nui.get("createname").setReadOnly(true); */
					}
					search();
				}
			});
			
			//加载定期开放
			changeDict = getDict ({"dicttypeid":"ZH_PURPLAN_OPEN", "dictid":"plan_open"});
			planOpenDict = getDict ({"dicttypeid":"ZH_PURPLAN_OPEN", "dictid":"change_open"});
		}
		
		function getDate(){
			var planOpen=nui.getDictText('ZH_PURPLAN_OPEN', 'plan_open');
			var date = new Date();
			var month=date.getMonth()+1;
			if(month==planOpen||planOpenDict=='true'){
				add();
			}else{
				showTips("每年度11月份报备次年计划","danger");
			}
		}
		
		function add(){
			nui.open({
				url: "/default/purchase/purchasePlan/purchasePlanAdd.jsp?judge="+getJudge(),
				width: '100%',
				height: '100%',
				title:'新增采购计划',
				onload: function () {
					var iframe = this.getIFrameEl();
				},
				ondestroy: function (action){
				reset();
				}
			})
		}
		
		function addChange(){
			var info=nui.getDictText('zh_purplan_open', 'chang_open');//季度字典信息
			var arrayInfo=info.split(',');
			var date = new Date();
			var month=date .getMonth()+1;
			for(var i=0;i<arrayInfo.length;i++){
				if(month==arrayInfo[i]||planOpenDict=='true'){
					nui.open({
						url: "/default/purchase/planchange/addPurchasePlanChange.jsp?judge="+getJudge(),
						width: '100%',
						height: '100%',
						title:'补充采购计划',
						onload: function () {
							var iframe = this.getIFrameEl();
						},
						ondestroy: function (action){
						reset();
						}
					})
					return;
				}else{
					if(i==arrayInfo.length-1){
						showTips("每季度第一个月开发计划变更","danger")
					}
					
				}
			}
			
		}
		
		function openEdit(e){
			var info=nui.getDictText('zh_purplan_open', 'chang_open');//季度字典信息
			var arrayInfo=info.split(',');
			var date = new Date();
			var month=date .getMonth()+1;
			for(var i=0;i<arrayInfo.length;i++){
				if(month==arrayInfo[i]||planOpenDict=='true'){
					editTaskMng();
					return;
				}else{
					if(i==arrayInfo.length-1){
						showTips("每季度第一个月开发计划变更","danger")
					}
					
				}
			}
		}
		
		//采购计划变更
		function editTaskMng() {
			var row = grid.getSelecteds();
				if (row.length > 1) {
				 	nui.alert("只能选中一条项目记录进行编辑");
				 }else {
				 var row = row[0];
				 if (row) {
					 if (row.status == 2) {
						 nui.open({
							 url: "/default/purchase/planchange/editPurPlanChange.jsp?processid=" + row.processid +
							 "&id=" + row.id,
							 width: '100%',
							 title: "采购计划变更",
							 height: '100%',
							 onload: function() {
							 	var iframe = this.getIFrameEl();
							 },
							 ondestroy: function(action) {
								 if (action == "ok") {
								 	grid.reload();
								 }
							 }
						 })
					 }else{
					 	showTips("审批中无法修改","danger");
					 }
				 } else {
				 	nui.alert("请选中一条记录", "提示");
				 }
			 }
		 }
    	
    	function search() {
			var form = new nui.Form("#form1");
			if(nui.get("orgid2").getValue() == ""){
	    		nui.get("tempCond1").setValue("=");
	    		nui.get("tempCond2").setValue("");
	    	}else{
	    		nui.get("tempCond1").setValue("in");
	    		nui.get("tempCond2").setValue("1");
	    	}
			var data = form.getData(); //获取表单JS对象数据
			grid.sortBy('updatedTime', 'desc');
		  	grid.load(data); //datagrid加载数据
		}
		
		function onActionRenderer(e) {
            var record = e.record;
        	var processId=record.processid;
			var s = "<a  href='javascript:void(0)' onclick='feeView();' >"+nui.getDictText('ZH_FLOW_TYPE',e.value)+"</a>";
            return s;
    	}
    
		function feeView(){
	        var selectRow = grid.getSelected();
	        var processId=selectRow.processid;
			var url = "/default/bps/wfclient/task/processinstView.jsp";
			var title = "流程图查看";
			var width=1000;
		    nui.open({
				url: url,
				title: title,
				width: "100%",
				height: "100%",
				onload: function () {
					var iframe = this.getIFrameEl();
					if(iframe.contentWindow.initData) {
						iframe.contentWindow.initData({"processInstID": processId});
					}
				},
				ondestroy: function (action){
				}
			});
	    }
        
		function dictIshavebak(e) {
			return nui.getDictText('ZH_PURCHASE',e.value);//设置业务字典值
		}
		function getStatus(e) {
			return nui.getDictText('ZH_FLOW_TYPE',e.value);//设置业务字典值
		}
		
		function onYn(e){
   		return nui.getDictText("ZH_YN",e.value);
	}
		
		function lookInfo(e) {
			var id = e.row.id;
			if(id==0 || id==null ){
				nui.alert("查询信息有误");
			}else{
				return "<a href='javascript:void(0)' onclick='doView("+ id +");' title='点击查看'>" + e.value + "</a>";
			}
		}
	    function doView(id){
			var executeUrl = "<%= request.getContextPath() %>/purchase/plan/purPlanDetailById.jsp?id=" + id;
			window.open(executeUrl);
	    }
		 
		function reset(){
			var form = new nui.Form("#form1");
			form.reset();
			init();
		}
		
		function onOk(){
			search();
		}
		
		
		function deleteInfo(){
			if(!confirm("确定删除吗？")){
				return;
			}else{	
	    		var row = grid.getSelecteds();
				if (row.length > 1) {
	    			nui.alert("只能选中一条项目记录进行删除");
	    		}else{
		    		var row=row[0];
		    		console.log(row);
					if (row) {
						var json = nui.encode({id:row.id});
						nui.ajax({
							    url: "com.zhonghe.ame.purchase.purchaseItems.delPurPlan.biz.ext",
								type: 'POST',
								data: json,	
								contentType: 'text/json',
							    success: function (o) {
						           if(o.result==1){
			                	 		nui.alert("删除成功","系统提示",function(){
						        			grid.reload();
						        		});
			                	 	}else{
				                	 	nui.alert("删除失败，请联系信息技术部人员！","系统提示");
			                	 	}
							    }
						}); 
						row.id;
					}else{
						nui.alert("请选中一条记录","提示");
					}
	    		}
    		}
		}
	    
		function onExportExcel(){
			var form = new nui.Form("#form1");
			var data = form.getData();
			exportExcel({"data":data,"url": "com.zhonghe.ame.purchase.exportExcel.exportaPurPlanList.biz.ext","fileName":"采购计划表"});
		}
		
		function print() {
			var row = grid.getSelected();
			if (row) {
				executeUrl = "<%= request.getContextPath() %>/purchase/print/purPlanListPrint.jsp?id=" + row.id;
				window.open(executeUrl);
			} else {
				showTips("请选中一条记录");
			}
		}

		function getDict(json) {
			var dict;
			nui.ajax({
				url : "com.zhonghe.ame.purchase.purchaseItems.purPlanRegularOpen.biz.ext",
				data : json,
				type : 'POST',
				async : false,
				contentType : 'text/json',
				success : function(text) {
					dict = text.dictEntry[0].filter1;
				}
			});
			return dict;
		}

		function zf_edit() {
			var row = grid.getSelecteds();
			if (row.length > 1 || row.length == 0) {
				showTips("只能选中一条项目记录进行作废", "danger");
				return;
			} else {
				var row = row[0];
				if (row.status == '2') {
					if (!confirm("是否作废？")) {
						return;
					} else {
						if (row) {
							var json = nui.encode({
								'data' : row
							});
							nui.ajax({
								url : "com.zhonghe.ame.purchase.purchaseItems.zfPurchasePlanById.biz.ext",
								type : 'POST',
								data : json,
								contentType : 'text/json',
								success : function(o) {
									if (o.result == 1) {
										showTips("作废成功");
										grid.reload();
									} else if (o.result == 2) {
										showTips("有采购立项关联了该计划无法作废！", "danger");
									} else {
										showTips("作废失败，请联系信息技术部人员！", "danger");
									}
								}
							});
						} else {
							showTips("只能选中一条项目记录进行作废", "danger");
						}
					}
				} else {
					showTips("只能作废审批状态为【审批通过】的数据", "danger");
				}
			}
		}
		
		function help() {
			executeUrl = "<%= request.getContextPath() %>/purchase/purchasePlan/purchasePlanDesgin.jsp";
			window.open(executeUrl);
		}
		
		function help_bcbg(){
			executeUrl = "<%= request.getContextPath() %>/purchase/purchasePlan/purchasePlanBcbgDesgin.jsp";
			window.open(executeUrl);
		}		
		
	</script>
</body>
</html>
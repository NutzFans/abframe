<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@include file="/purchase/common/common.jsp"%>
<html>
<head>
<title></title>
<style type="text/css">
html,body {
	margin: 0;
	padding: 0;
	border: 0;
	width: 100%;
	height: 100%;
	overflow: hidden;
}
</style>
</head>
<body>
	<div id="form1">
		<div class="nui-toolbar" style="border-bottom: 0; padding: 0px;">
			<table align="center" border="0" width="100%" class="form_table">
				<tr>
					<td class="form_label" align="right">验收单编号:</td>
					<td colspan="1"><input name="critria._expr[2]._value"
						class="nui-textbox" style="width: 65%;" /> <input
						class="nui-hidden" name="critria._expr[2]._property"
						value="verifyCode" /> <input class="nui-hidden"
						name="critria._expr[2]._op" value="like" /></td>
					<td class="form_label" align="right">合同编号:</td>
					<td colspan="1"><input name="critria._expr[3]._value"
						class="nui-textbox" style="width: 65%;" /> <input
						class="nui-hidden" name="critria._expr[3]._property"
						value="contractNo" /> <input class="nui-hidden"
						name="critria._expr[3]._op" value="like" /></td>

					<td class="form_label" align="right">验收部门:</td>
					<td colspan="1"><input name="critria._expr[4]._value"
						class="nui-textbox" style="width: 65%;" /> <input
						class="nui-hidden" name="critria._expr[4]._property"
						value="orgname" /> <input class="nui-hidden"
						name="critria._expr[4]._op" value="like" /></td>
				</tr>
				<tr>
					<td colspan="9" align="center"><a class="nui-button"
						id="search" iconCls="icon-search" onclick="search()">查询</a> <a
						class="nui-button" id="reset" iconCls="icon-reload"
						onclick="reset()">重置</a></td>
				</tr>
			</table>
		</div>
</div>
<div class="nui-toolbar" style="border-bottom: 0; padding: 0px;">
	<table style="width: 100%;">
		<tr>
			<td style="width: 20%;"><a class="nui-button" id="checkview"
				iconCls="icon-add" onclick="add()">新增</a> <a class="nui-button"
				id="checkview1" iconCls="icon-remove" onclick="deleteInfo()">删除</a>
				<a class="nui-button" id="checkview" iconCls="icon-print"
				onclick="print()">打印</a></td>
		</tr>
	</table>
</div>
<div class="nui-fit">
	<div id="datagrid1" frozenStartColumn="0" sizeList="[10,20,50,100]"
		showPager="true" dataField="purVerify" sortMode="client"
		class="nui-datagrid" style="width: 100%; height: 100%;"
		url="com.zhonghe.ame.purchase.purchaseVerify.queryVerify.biz.ext"
					multiSelect="false" allowSortColumn=true align="left">
					<div property="columns">
						<div name="temp123" type="checkcolumn"></div>
						<div type="indexcolumn" align="center" headerAlign="center">序号</div>
						<!-- <div type="expandcolumn" width="20"></div> -->
			<div field="verifyCode" width="200" headerAlign="center"
				allowSort="true" renderer="lookInfo">验收单编号</div>
			<div field="contractNo" width="200" align="center"
				headerAlign="center" allowSort="true">合同编号</div>
			<div field="totalPrice" align="center" headerAlign="center"
				allowSort="true">货品总价(万元)</div>
			<div field="orgname" width="200" align="center"
				headerAlign="center" allowSort="true">验收部门</div>
			<div field="empname" width="80" align="center"
				headerAlign="center" allowSort="true">验收人</div>
			<div field="createTime" align="center" headerAlign="center">创建时间</div>
			<div field="status" align="center" renderer="onActionRenderer"
				headerAlign="center">状态</div>
		</div>
	</div>
</div>
	<script type="text/javascript">
    	nui.parse();
		var form = new nui.Form("#form1");
    	var grid = nui.get("datagrid1");
    	search();
    	var type = <%=request.getParameter("type")%>;
		var reve_grid = nui.get("reve_grid");
    	var json=nui.encode({"iden": "1","expseq": null,"feeseq": null,"parentfeetypeid": null});
//     	if(type==1){
//     	document.getElementById("checkview").style.display="none";
//     	document.getElementById("checkview1").style.display="none";
//     	}
//     	init();
    	function init(){
    		grid.load({type:type});
    		grid.sortBy("tbdate","desc");
		}
		function getStatus(e){
    		if(e.value==1){
    			return "审核中"
    		}
		}
		function check(e){
			if(e.value==1){
			return "是";
			}else{
			return "否";
			}
		}
		
		function onActionRenderer(e) {
            var record = e.record;
        	var processId=record.processid;
        	console.log(e.value);
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
				width: width,
				height: 550,
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
		
		function lookInfo(e) {
			var id = e.row.id;
			if(id==0 || id==null ){
				nui.alert("查询信息有误");
			}else{
				return "<a href='javascript:void(0)' onclick='doView("+ id +");' title='点击查看'>" + e.value + "</a>";
			}
		}
		
		function changeInfo(){
			
			var row = grid.getSelecteds();
			if (row.length > 1) {
    		nui.alert("只能选中一条项目记录进行编辑");
    		}else{
    		var row=row[0];
			if (row) {
				nui.open({
				url: "/default/purchase/project/proAppChange.jsp?id="+row.id,
				width: 1114,
				height: 526,
				onload: function () {
					var iframe = this.getIFrameEl();
				},
				ondestroy: function (action){
			
				}
			})
			}else{
				nui.alert("请选中一条记录","提示");
			}
			
    		}
		
		
		}
		
	    function doView(id){
	    
			var executeUrl = "<%= request.getContextPath() %>/purchase/verify/purVerifyDetail.jsp?id=" + id;
			window.open(executeUrl);
		}
		
		function dictGetType(e){
			return nui.getDictText('EXP_EXPTYPE',e.value);
		}
		function dictGetStatus(e){
			return nui.getDictText('EXP_CHECKFLAG',e.value);
		}
		 
		function search() {
			var form = new nui.Form("#form1");
			var data = form.getData(); //获取表单JS对象数据
			
		  	grid.load(data); //datagrid加载数据
		}
		function reset(){
			var form = new nui.Form("#form1");
			form.reset();
			grid.load();
			search()
		}
		
		function onOk(){
			search();
		}
		
		//修改投标明细
		function edit(){
		debugger;
    		var row = grid.getSelecteds();
    		var data=row[0];
			if (data) {
				nui.open({
				url: "/default/contractPact/chargeContract/chargeContractEdit.jsp",
				width: '90%',
				height: '90%',
				title: "收费合同签订编辑",
		        onload: function () {
		        	var iframe = this.getIFrameEl();
					iframe.contentWindow.setEditData(data);
		        },
				ondestroy: function (action) {
	            	if(action=="ok"){
	            		grid.reload();
	            	}
	            }
			})
			
			}else{
				nui.alert("请选中一条记录","提示");
			}
			
//     		}
		}
		
		function deleteInfo(){
			var row = grid.getSelecteds();
			if(row.length>0){
				if(!confirm("确定删除吗？")){
        				return;
        			}else{
			
    		
				if (row.length > 1) {
	    		nui.alert("只能选中一条项目记录进行删除");
	    		}else{
	    		var row=row[0];
	    		console.log(row);
				if (row) {
					
					var json = nui.encode({id:row.id});
					nui.ajax({
						    url: "com.zhonghe.ame.purchase.purchaseVerify.delPurVerify.biz.ext",
							type: 'POST',
							data: json,	
							contentType: 'text/json',
						    success: function (o) {
					           if(o.result==1){
			                	 	nui.alert("删除成功","系统提示",function(){
					        		//nui.get("sureButton").setEnabled(true);
					        		/* CloseWindow("ok"); */
					        		grid.reload();
					        	});
			                	 }else{
			                	 nui.alert("删除失败，请联系信息技术部人员！","系统提示", function(action){
									//nui.get("sureButton").setEnabled(true);
								});
			                	 
			                	 }
						    }
					}); 
					row.id;
					
				
				}
	    		}
	    		
	    		}
			}else{
				nui.alert("请选中一条记录","提示");
			}
			
    		
		}
		
		//回车触发
		function onKeyEnter(){
			search();
		}
	    

     function add(){
		nui.open({
			url: "/default/purchase/verify/addPurVerify.jsp",
			width: '70%',
			height: '75%',
			title: "验收单",
			onload: function () {
				var iframe = this.getIFrameEl();
			},
			ondestroy: function (action){
				search();
			}
		})
	}
	function zhContractType(e) {
		return nui.getDictText("ZH_CONTRACT_TYPE", e.value);
	}
	
	function print() {
		var row = grid.getSelected();
		if (row) {
			executeUrl = "<%= request.getContextPath() %>/purchase/verify/purVerifyDetail.jsp?id=" + row.id;
			window.open(executeUrl);
		}else {
		
			showTips("请选中一条记录");
		}
	}
</script>
</body>
</html>
 <%@page import="com.eos.data.datacontext.UserObject"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@include file="/purchase/common/common.jsp"%>
<html>
<head>
<title>采购发包列表</title>
	<style type="text/css">
	    body{
	        margin: 0;padding: 0;border: 0;width: 100%;height: 100%;overflow: hidden;	
	    } 
    </style>
</head>
<body>
	<div  id="form1">
		  <div class="nui-toolbar" style="border-bottom:0;padding:0px;">
			  <table align="center" border="0" width="100%" class="form_table">
		        <tr >
		        	<td colspan="1">
						<input class="nui-hidden" name="critria._expr[5]._property" value="orgId" />
						<input class="nui-hidden" name="critria._expr[5]._op" value="in" id="tempCond1" />
						<input class="nui-hidden" name="critria._expr[5]._ref" value="" id="tempCond2" />
						<input class="nui-hidden" name="critria._ref[0]._id" value="1" />
						<input class="nui-hidden" name="critria._ref[0]._entity"
							value="org.gocom.abframe.dataset.organization.OmOrganization" />
						<input class="nui-hidden" name="critria._ref[0]._select._field[0]" value="orgid" />
						<input class="nui-hidden" name="critria._ref[0]._expr[0]._property" value="orgseq" />
						<input class="nui-hidden" name="critria._ref[0]._expr[0]._op" value="like" />
						<input class="nui-hidden" name="critria._ref[0]._expr[0]._likeRule" value="end" />
						<input class="nui-hidden" name="critria._expr[3]._property" value="orgId" />
						<input class="nui-hidden" name="critria._expr[3]._op" value="in" />
						<input class="nui-hidden" name="critria._expr[3]._value" id="orgids2" />
						
						<input class="nui-hidden" name="critria._expr[4].createdBy" id="createdBy"  />
					</td>
		        
					<td class="form_label" align = "right">采购发包编号:</td>
					<td colspan="1">
						<input name="critria._expr[0].proAppName" class="nui-textbox" style="width:65%;" />
					    <input class="nui-hidden" name="critria._expr[0]._op" value="like"/>
			          </td>	
	  		    	 <td class="form_label" align = "right">采购立项编号:</td>
			         <td colspan="1">
				    	<input name="critria._expr[1].proAppCode" class="nui-textbox" style="width:65%;" />
					    <input class="nui-hidden" name="critria._expr[1]._op" value="like"/>
			         </td>
	  		         <td class="form_label" align = "right">项目名称:</td>
			         <td colspan="1">
			    		<input name="critria._expr[2].purchaseNumber" class="nui-textbox" style="width:65%;" />
						<input class="nui-hidden" name="critria._expr[2]._op" value="like"/>
					</td>		          
	            	<td colspan="9" align="center">
		            	<a class="nui-button" id="search" iconCls="icon-search" onclick="search()">查询</a>
		            	<a class="nui-button" id="reset" iconCls="icon-reload" onclick="reset()">重置</a>
			        </td>
		        </tr>
			</table>
		</div>
	</div>
	<div class="nui-toolbar" style="border-bottom:0;padding:0px;">
	    <table style="width:100%;">
	    	<tr>
	            <td style="width:20%;">
	            	<a class="nui-button" id="checkview" iconCls="icon-add" onclick="add()">新增</a>
				            <!-- <a class="nui-button" id="checkview1" iconCls="icon-remove" onclick="deleteInfo()">删除</a> -->
		            <a class="nui-button" id="checkview" iconCls="icon-print" onclick="print()">打印</a>
		        </td>
	        </tr>
	    </table>           
	</div>
	<div class="nui-fit">
		<div id="datagrid1" frozenStartColumn="0"  sizeList="[10,20,50,100]" showPager="true" dataField="proApp"  pageSize="20"
			class="nui-datagrid" style="width:100%;height:100%;" url="com.zhonghe.ame.purchase.purchasePackage.queryPurPackage.biz.ext" 
			multiSelect="false" allowSortColumn=true >
		    <div property="columns">
		    <div name="temp123" type="checkcolumn"></div>
		    <div type="indexcolumn" align="center" headerAlign="center">序号</div>
		    	
		    	<!-- <div type="expandcolumn" width="20"></div> -->
		    	<div field="packageCode" width="160" align="center" headerAlign="center" allowSort="true" renderer="lookInfo">发包编号</div>
		    	<div field="packageType" renderer="dictstatus" dateFormat="yyyy-MM-dd" width="80" align="center" headerAlign="center" >发包方式</div>
		        <div field="proAppCode" width="200" align="center" headerAlign="center" allowSort="true" >立项编号</div>
		        <div field="price" width="80" align="center" headerAlign="center" allowSort="true" >立项金额</div>
		        <div field="orgname" width="200" align="center" headerAlign="center" allowSort="true" >立项单位</div>
		        <div field="projectName" width="200" align="center" headerAlign="center" allowSort="true" >项目名称</div>
		        <div field="appTime" width="80" align="center" headerAlign="center" allowSort="true"  >申请日期</div>
		        <div field="status"  align="center" renderer="onActionRenderer" headerAlign="center" >状态</div>
		    </div>
    	</div>
	</div>
<script type="text/javascript">
    	nui.parse();
		var form = new nui.Form("#form1");
    	var grid = nui.get("datagrid1");
    	init();
	function init() {
		//按钮权限的控制
		//getOpeatorButtonAuth("checkview"); //操作按钮权限初始化
		//code:对应功能编码，map：对于机构的查询条件
		var json = {"code":"cgfb","map":{"property":"status","op":"=","value":"running"}};
		ajaxCommon({
			"url": "com.primeton.eos.ame_auth.ame_auth.getownorg1.biz.ext",
			"data": json,
			"success": function(data) {
				if (data.orgs) {
					if (data.orgs.length == 0) {
						//当没有有权的机构时将申请人设置为登陆人
						 nui.get("createdBy").setValue(userId);
					}
					nui.get("orgids2").setValue(data.orgids);
				} else {
					//当没有有权的机构时将申请人设置为登陆人
					nui.get("createdBy").setValue(userId);
				}
				search();
			}
		});
	}
    	var type = <%=request.getParameter("type")%>;
		var reve_grid = nui.get("reve_grid");
    	var json=nui.encode({"iden": "1","expseq": null,"feeseq": null,"parentfeetypeid": null});
    	var jsonQuer

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
    	function init(){
    		grid.load({type:type});
    		grid.sortBy("tbdate","desc");
		}
		
		function getStatus(e) {
			return nui.getDictText('ZH_FLOW_TYPE',e.value);//设置业务字典值
		}
		function check(e){
			if(e.value==1){
			return "是";
			}else{
			return "否";
			}
		}
		function dictstatus(e) {
			return nui.getDictText('ZH_CGFS',e.value);//设置业务字典值
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
	    	
			var executeUrl = "<%= request.getContextPath() %>/purchase/print/purPackagePrint.jsp?id=" + id;
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
					    url: "com.zhonghe.ame.purchase.purchasePackage.delPurchasePackage.biz.ext",
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
				
			
			}else{
				nui.alert("请选中一条记录","提示");
			}
			
    		}
    		
    		}
    		
		}
		
		//回车触发
		function onKeyEnter(){
			search();
		}
	    
	    
     function add(){
		nui.open({
			url: "/default/purchase/packagemethod/addPackageApp.jsp",
			width: '90%',
			height: '90%',
			title:"&nbsp;",
			onload: function () {
				var iframe = this.getIFrameEl();
			},
			ondestroy: function (action){
				search();
			}
		})
	}
    function alteration(){
		var row = grid.getSelecteds();
		var data=row[0];
		if (data) {
			nui.open({
				url: "/default/contractPact/chargeContract/chargeContractAlteration.jsp",
				width: '90%',
				height: '90%',
				title: "收费合同协议变更",
				onload: function () {
					var iframe = this.getIFrameEl();
				},
				ondestroy: function (action){
					search();
				}
			})
		}else{
			nui.alert("请选中一条记录","提示");
			}
	}
	
	function contractHistory(){
		var row = grid.getSelecteds();
		var data=row[0];
		if (data) {
			nui.open({
				url: "/default/contractPact/chargeContract/chargeContractHistoryList.jsp",
				width: '90%',
				height: '60%',
				onload: function () {
					var iframe = this.getIFrameEl();
					iframe.contentWindow.setContractHistoryData(data);
				},
				ondestroy: function (action){
					search();
				}
			})
		}else{
			nui.alert("请选中一条记录","提示");
			}
	}
	function zhContractType(e) {
		return nui.getDictText("ZH_CONTRACT_TYPE", e.value);
	}
	
	function print() {
		var row = grid.getSelected();
		if (row) {
			executeUrl = "<%= request.getContextPath() %>/purchase/print/purPackagePrint.jsp?id=" + row.id;
			window.open(executeUrl);
		}else {
			showTips("请选中一条记录");
		}
	}
</script>
</body>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@include file="/purchase/common/common.jsp"%>
<html>
<style type="text/css">
	html, body{
        margin:0;padding:0;border:0;width:100%;height:100%;overflow:hidden;
    }    
</style>
<head>
<title>付费合同管理</title>
</head>
<body>
<div  id="form1">
<input class="nui-hidden" name="critria._entity" value="com.zhonghe.ame.payContract.payContract.ZhPayContractEntity"/>
  <div class="nui-toolbar" style="border-bottom:0;padding:0px;">
	  <table align="center" border="0" width="100%" class="form_table">
	    <tr>
	        <td class="form_label" align = "right" >申请人:</td>
	        <td colspan="1" >
	            <input name="critria._expr[1].createUsername" class="nui-textbox" style="width:65%;" id="createname"/>
	            <input class="nui-hidden" name="critria._expr[1]._op" value="like"/>
	            <input name="critria._expr[0].createUserid" class="nui-hidden" id="createUserid"/>
	        </td>
	        <td class="form_label" align = "right" >合同实施部门:</td>
	        <td colspan="1" >
	            <input id="orgid2"  name="critria._ref[0]._expr[0]._value" style="width:50%;" class="nui-combobox"
	                   textField="orgname" valueField="orgseq" dataField="orgs" showNullItem="true" allowInput="true"/>
	            <input class="nui-hidden" name="critria._expr[2]._property" value="implementOrg"/>
	            <input class="nui-hidden" name="critria._expr[2]._op" value="in" id="tempCond1"/>
	            <input class="nui-hidden"name="critria._expr[2]._ref" value="1" id="tempCond2"/>
	            <input class="nui-hidden" name="critria._ref[0]._id" value="1"/>
	            <input class="nui-hidden" name="critria._ref[0]._entity" value="org.gocom.abframe.dataset.organization.OmOrganization"/>
	            <input class="nui-hidden" name="critria._ref[0]._select._field[0]" value="orgid"/>
	            <input class="nui-hidden" name="critria._ref[0]._expr[0]._property" value="orgseq"/>
	            <input class="nui-hidden" name="critria._ref[0]._expr[0]._op" value="like"/>
	            <input class="nui-hidden" name="critria._ref[0]._expr[0]._likeRule" value="end"/>
	            <input class="nui-hidden" name="critria._expr[3]._property" value="implementOrg"/>
	            <input class="nui-hidden" name="critria._expr[3]._op" value="in"/>
	            <input class="nui-hidden" name="critria._expr[3]._value" id="orgids2"/>
	            <input class="nui-hidden"name="critria._or[1]._expr[1].createUserid" id="createUserid1"  />
	            <input class="nui-hidden" name="critria._or[1]._expr[1]._op" value="=" />
	        </td>
	        <td class="form_label" align = "right" >签约方:</td>
	        <td colspan="1" >
	            <input name="critria._expr[20]._value" class="nui-textbox" style="width:79%;" />
	            <input class="nui-hidden" name="critria._expr[20]._property" value="signatoryname"/>
	            <input class="nui-hidden" name="critria._expr[20]._op" value="like"/>
	        </td>
	    </tr>
	    <tr>
	        <td class="form_label" align = "right">标的规模:</td>
	        <td colspan="1">
	            <input name="critria._expr[11]._value" class="nui-textbox" style="width:65%;" />
	            <input class="nui-hidden" name="critria._expr[11]._property" value="projectSize"/>
	            <input class="nui-hidden" name="critria._expr[11]._op" value="like"/>
	        </td>
	        <td class="form_label" align = "right">合同金额（元）:</td>
	        <td colspan="1">
	            <input class="nui-textbox" name="critria._expr[7]._min" width="24%"/>~
	            <input class="nui-textbox" name="critria._expr[7]._max" width="24%"/>
	            <input class="nui-hidden" name="critria._expr[7]._property" value="contractSum"/>
	            <input class="nui-hidden" name="critria._expr[7]._op" value="between"/>
	        </td>
	        <td class="form_label" align = "right">合同名称:</td>
	        <td colspan="1">
	            <input name="critria._expr[6]._value" class="nui-textbox" style="width:79%;" />
	            <input class="nui-hidden" name="critria._expr[6]._property" value="contractName"/>
	            <input class="nui-hidden" name="critria._expr[6]._op" value="like"/>
	        </td>
	    </tr>
	    <tr>
	        <td class="form_label" align = "right">合同编号:</td>
	        <td colspan="1">
	        	<input name="critria._expr[10]._value" class="nui-textbox" style="width:65%;" />
	            <input class="nui-hidden" name="critria._expr[10]._property" value="contractNo"/>
	            <input class="nui-hidden" name="critria._expr[10]._op" value="like"/>
	        </td>
	        <td class="form_label" align = "right">签订日期:</td>
	        <td colspan="1">
	            <input class="nui-hidden" name="critria._expr[5]._op" value="between" />
	            <input class="nui-hidden" name="critria._expr[5]._pattern" value="yyyy-MM-dd" />
	            <input class="nui-hidden" name="critria._expr[5]._property" value="signingDate" />
	            <input class="nui-datepicker" name="critria._expr[5]._min" style="width:50%;"/>
	        </td>
	        <td class="form_label" align = "right">审批状态:</td>
	        <td colspan="1">
	            <input name="critria._expr[12].appStatus" class="nui-dictcombobox" dictTypeId="ZH_FLOW_TYPE" style="width:79%;" showNullItem="true" nullItemText="全部"/>
	        </td>
	    </tr>
	    <tr>
	        <td class="form_label" align = "right">合同类型:</td>
	        <td colspan="1">
	            <input name="critria._expr[9].contractType" class="nui-dictcombobox" dictTypeId="ZH_CONTRACT_TYPE" style="width:65%;" showNullItem="true" nullItemText="全部"/>
	        </td>
	        <td class="form_label" align = "right">申请日期:</td>
	        <td colspan="1">
	            <input class="nui-hidden" name="critria._expr[8]._op" value="between" />
	            <input class="nui-hidden" name="critria._expr[8]._pattern" value="yyyy-MM-dd" />
	            <input class="nui-hidden" name="critria._expr[8]._property" value="createTime" />
	            <input class="nui-datepicker" name="critria._expr[8]._min" style="width: 23%;" />
	            <span style="border-spacing: 0px; padding-left: 0.2em; padding-right: 0.2em;">至</span>
	            <input class="nui-datepicker" name="critria._expr[8]._max" style="width: 23%;" />
	        </td>
	    </tr>
	</table>
	</div>
</div>

	<div class="nui-toolbar" style="border-bottom:0;padding:0px;">
        <table style="width:100%;">
        	<tr>
                <td>
                	<!--  <a class="nui-button" id="ffhtlist_add" iconCls="icon-add" onclick="add()">新增</a>
		            <a class="nui-button" id="ffhtlist_edit" iconCls="icon-edit" onclick="edit()">编辑</a>-->
		            <a class="nui-button" id="add" iconCls="icon-add" onclick="add()">新增</a>
		            <a class="nui-button" id="edit" iconCls="icon-edit" onclick="edit()">编辑</a>
		            <a class="nui-button" id="ffhtlist_del" iconCls="icon-remove" onclick="deleteInfo()">删除</a>
		            <a class="nui-button" id="checkview" iconCls="icon-print" onclick="print()">打印</a>
		            <a class="nui-button" id="ffhtlist_bcxy" iconCls="icon-add" onclick="alteration()">发起补充协议签订申请</a>
		            <!-- <a class="nui-button" id="ffhtlist_fksq" iconCls="icon-add" onclick="payMentFlow()">发起付款申请</a>
		            <a class="nui-button" id="ffhtlist_fksq_bc" iconCls="icon-edit" onclick="eridPayMentFlow()">维护付款申请历史数据</a>
		            -->
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
    <div id="datagrid1" sizeList="[10,20,50,100]" showPager="true" dataField="data" 
    	showSummaryRow="true"  pageSize="15" align="left"
    	class="nui-datagrid" style="width:100%;height:100%;" url="com.zhonghe.ame.payContract.payContract.payContractAll.biz.ext"  
    	allowSortColumn=true multiSelect="true" allowSortColumn=true frozenStartColumn="0" frozenEndColumn="6">
        <div property="columns">
        <div type="checkcolumn"></div>
        <div field="id" headerAlign="center" allowSort="true" visible="false">id</div>
        <div type="indexcolumn" width="40" align="center" headerAlign="center">序号</div>
        	<div field="createUsername" width="60"  headerAlign="center" allowSort="true" >申请人</div>
        	 <div field="implementOrgname" width="120"  headerAlign="center" allowSort="true" >合同承办部门</div>
        	 <div field="contractNo" width="180" headerAlign="center" allowSort="true" >合同编号</div>
        	 <div field="contractName" width="250"  headerAlign="center" allowSort="true" renderer="lookInfo">合同名称</div>
        	 <div field="contractSum" width="120"  headerAlign="center" allowSort="true" dataType="currency" summaryType="sum">合同金额（元）</div>
        	 <div field="finalSum" width="140"  headerAlign="center" allowSort="true" >合同最终金额（元）</div>
        	 <div field="noTaxSum" width="150"  headerAlign="center" allowSort="true" >合同不含税金额（元）</div>
        	 <div field="payTax" width="120"  headerAlign="center" allowSort="true" >税额（元）</div>
        	 <div field="contractBalance" width="120"  headerAlign="center" allowSort="true" summaryType="sum">合同余额（元）</div>
        	 <div field="executeStatus"    headerAlign="center" allowSort="true" renderer="EXECUTE_STATUS" >执行状态</div>
        	 <div field="appStatus"    headerAlign="center" allowSort="true" renderer="onActionRenderer" >审批状态</div>
        	  <div field="signatoryname" width="190"  headerAlign="center" allowSort="true" >签约方</div>
        	 <div field="contractSubject"    headerAlign="center" allowSort="true" renderer="PAYER" >合同签约主体</div>
        	 <div field="payer" width="150"  headerAlign="center" allowSort="true" renderer="zhInvoiceNameType">付款方</div>
        	 <div field="signingDate"  dateFormat="yyyy-MM-dd" width="90"   headerAlign="center" >签订日期</div>
        	 <div field="contractType" width="120"  headerAlign="center" allowSort="true"  renderer="zhContractType">合同类型</div>
        	 <div field="contractSecretLevel" width="120"  headerAlign="center" allowSort="true"  renderer="CONTRACT_SECRET_LEVEL">合同密级</div>
        	 <div field="projectSecretLevel" width="120"  headerAlign="center" allowSort="true"  renderer="PROJECT_SECRET_LEVEL">项目密级</div>
        	 <div field="issm" width="180"  headerAlign="center" allowSort="true"  renderer="ABF_YESORNO">是否为SM协作配套</div>
        	 <div field="issupagreement" width="120"  headerAlign="center" allowSort="true"  renderer="ABF_YESORNO">是否为补充协议</div>
        	 <div field="contractNature" width="120"  headerAlign="center" allowSort="true"  renderer="CONTRACT_NATURE">合同性质</div>
        	 <div field="contractPrice" width="120"  headerAlign="center" allowSort="true"  renderer="CONTRACT_PRICE">合同价款形式</div>
        	 <div field="planYear" width="120"  headerAlign="center" allowSort="true" >采购计划年份</div>
        	 <div field="budgetSum" width="150"  headerAlign="center" allowSort="true" >合同预算金额（元）</div>
        	 <div field="markType" width="120"  headerAlign="center" allowSort="true"  renderer="MARK_TYPE">标的类型</div>
        	 <div field="intype" width="120"  headerAlign="center" allowSort="true"  renderer="INTYPE">集采类型</div>
        	 <div field="procurementType" width="120"  headerAlign="center" allowSort="true"  renderer="PROCUREMENT_TYPE">采购方式</div>
        	 <div field="supplierSource" width="120"  headerAlign="center" allowSort="true"  renderer="SUPPLIER_SOURCE">供应商来源</div>
        	 <div field="iselectronic" width="120"  headerAlign="center" allowSort="true"  renderer="ABF_YESORNO">是否电子采购</div>
        	 
        	 
        	 
        	 
        	 
             
        </div>
    </div>
</div>
<script type="text/javascript">
    	nui.parse();
		var form = new nui.Form("#form1");
    	var grid = nui.get("datagrid1");
    	var type = <%=request.getParameter("type")%>;
		var reve_grid = nui.get("reve_grid");
    	var json=nui.encode({"iden": "1","expseq": null,"feeseq": null,"parentfeetypeid": null});
    	
		init();
    	function init(){
    		//按钮权限的控制
	    	getOpeatorButtonAuth("ffhtlist_fksq_bc,ffhtlist_add,ffhtlist_edit,ffhtlist_bcxy,ffhtlist_fksq");//操作按钮权限初始化
    		//code:对应功能编码，map：对于机构的查询条件
			var json = {"code":"ffhtlist","map":{"property":"status","op":"=","value":"running"}};
    		ajaxCommon({
				url:"com.primeton.eos.ame_auth.ame_auth.getownorg1.biz.ext",
				data:json,
				success:function(text){
				debugger
					if(text.orgs){
						var orgids = text.orgids;
						if(text.orgs.length==0){
							//当没有有权的机构时将申请人设置为登陆人
							nui.get("createUserid").setValue(userId);
							nui.get("createname").setValue(userName);
							nui.get("createname").setReadOnly(true);
						}
						//根据情况选择一种
						/* nui.get("orgid2").setData(text.orgs); */
// 						nui.get("createUserid1").setValue(userId);
						if(orgids!=null){
							orgids = orgids.split(",");
							clog(isStr(orgids, "1"))
							if(!isStr(orgids, "1")){
							//根据情况选择一种
								nui.get("orgids2").setValue(text.orgids);
								
							}
// 							else{
// 								nui.get("createUserid1").setValue("");
// 							}
						}
					}else{
						//当没有有权的机构时将申请人设置为登陆人
							nui.get("createUserid").setValue(userId);
							nui.get("createname").setValue(userName);
							nui.get("createname").setReadOnly(true);
					}
					search();
				}
			});
		}
		function check(e){
			if(e.value==1){
			return "是";
			}else{
			return "否";
			}
		}
		
		function print() {
			var row = grid.getSelected();
			if (row) {
				executeUrl = "<%= request.getContextPath() %>/contractPact/print/payContractListPrint.jsp?id=" + row.id;
				window.open(executeUrl);
			}else {
				showTips("请选中一条记录");
			}
		}
		
		function lookInfo(e) {
			return "<a href='javascript:void(0)' onclick='doView();' title='点击查看'>" + e.value + "</a>";
		}
	    function doView(){
			var row = grid.getSelected();
			if (row) {
				executeUrl = "<%= request.getContextPath() %>/contractPact/print/payContractListPrint.jsp?id=" + row.id;
				window.open(executeUrl);
			}else {
				showTips("请选中一条记录");
			}
			
// 			  	nui.open({
// 			  		url : url,
// 			        width:'100%', 
// 			        height: '100%',
// 			       onload: function () {
// 			       	var iframe = this.getIFrameEl();
// 						iframe.contentWindow.setViewData(selectRow);
// 			       },
// 			       ondestroy: function (action) {
// 			       	search();
// 			       }
// 			  	});
		}
		
		function dictGetType(e){
			return nui.getDictText('EXP_EXPTYPE',e.value);
		}
		function dictGetStatus(e){
			return nui.getDictText('EXP_CHECKFLAG',e.value);
		}
		 
		function search() {
			var form = new nui.Form("#form1");
			/* if(nui.get("orgid2").getValue() == ""){
	    		nui.get("tempCond1").setValue("=");
	    		nui.get("tempCond2").setValue("");
	    	}else{
	    		nui.get("tempCond1").setValue("in");
	    		nui.get("tempCond2").setValue("1");
	    	} */
			var data = form.getData(); //获取表单JS对象数据
			<%-- data.critria._expr[2]._value= "<%=userName %>"; --%>
			console.log(data)
		  	grid.sortBy("createTime","desc");
		  	grid.load(data); //datagrid加载数据
		}
		
		function isStr(str, val) {
		  if (str.indexOf(val) != -1) {
		    return true
		  } else {
		    return false
		  }
  		}
		
		function reset(){
			var form = new nui.Form("#form1");
			form.reset();
			init();
		}
		
		function onOk(){
			search();
		}
		
		//修改投标明细
		function edit(){
    		var row = grid.getSelecteds();
    		var data=row[0];
    		if(data.appStatus == "0"){
    			
    		}else if(data.appStatus != "2"){
    			showTips("流程未审批通过，无法修改！");
    			return;
    		}
			if (data) {
				nui.open({
				url: "/default/contractPact/payContract/payContractEdit.jsp",
				width: '100%',
				height: '100%',
				title: "付费合同签订编辑",
		        onload: function () {
		        	var iframe = this.getIFrameEl();
					iframe.contentWindow.setEditData(data);
		        },
				ondestroy: function (action) {
	            	if(action=="ok"){
	            		grid.reload();
	            	}
	            	search();
	            }
			})
			
			}else{
				showTips("请选中一条记录","danger");
			}
			
		}
		
		function deleteInfo(){
    		var row = grid.getSelecteds();
			if (row.length > 1) {
    			showTips("只能选中一条项目记录进行删除","danger");
    		}else{
    		var row=row[0];
    		if(!confirm("是否删除？")){
        				return;
        			}else{
					if (row) {
						var json = nui.encode({'data':row});
						nui.ajax({
							    url: "com.zhonghe.ame.payContract.payContract.deletePayContractById.biz.ext",
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
						
					
					}else{
						nui.alert("请选中一条记录","提示");
					}
				}
    		}
		}
		
	
	
     function add(){
		nui.open({
			url: "/default/contractPact/payContract/payContractAdd.jsp",
			width: '100%',
			height: '100%',
			title: "付费合同签订申请",
			onload: function () {
				var iframe = this.getIFrameEl();
			},
			ondestroy: function (action){
			search();
			}
		})
	}
	
    function payMentFlow(){
		var row = grid.getSelecteds();
		//alert(nui.encode(row));
		//alert(row.length);
		if(row.length > 1){
			showTips("请仅选中一条“审批通过”的记录","danger");
			return;
		}
		var data=row[0];
		if(data.issupagreement == "1"){
			showTips("请选中一条主合同进行付款","danger");
			return;
		}
		if (data.appStatus == "2") {
			nui.open({
				url: "/default/contractPact/payment/payMentAdd.jsp",
				width: '90%',
				height: '90%',
				title: "发起付款流程",
				onload: function () {
						var iframe = this.getIFrameEl();
						iframe.contentWindow.setViewData(data);
				},
				ondestroy: function (action){
					search();
				}
			})
		}else{
			showTips("请选中一条“审批通过”的记录","danger");
			}
	}
    function eridPayMentFlow(){
		var row = grid.getSelecteds();
		if(row.length > 1){
			showTips("请仅选中一条“审批通过”的记录","danger");
			return;
		}
		var data=row[0];
		if(data.issupagreement == "1"){
			showTips("请选中一条主合同进行付款","danger");
			return;
		}
		if (data.appStatus == "2") {
			nui.open({
				url: "/default/contractPact/payment/editPayMentAdd.jsp",
				width: '90%',
				height: '90%',
				title: "发起付款流程",
				onload: function () {
					var iframe = this.getIFrameEl();
					iframe.contentWindow.setViewData(data);
				},
				ondestroy: function (action){
					search();
				}
			})
		}else{
			showTips("请选中一条“审批通过”的记录","danger");
		}
	}
	
	function alteration(){
		var row = grid.getSelecteds();
		if(row.length > 1){
			showTips("请仅选中一条“审批通过”的记录","danger");
			return;
		}
		var data=row[0];
		if(data.issupagreement == "1"){
			showTips("请选中一条主合同发起协议变更","danger");
			return;
		}
		if (data.appStatus == "2") {
			nui.open({
				url: "/default/contractPact/payContract/payContractAlteration.jsp",
				width: '90%',
				height: '90%',
				title: "付费合同协议变更",
				onload: function () {
					var iframe = this.getIFrameEl();
					iframe.contentWindow.setEditData(data);
				},
				ondestroy: function (action){
					search();
				}
			})
		}else{
			showTips("请选中一条“审批通过”的记录");
		}
	}
	
	function contractHistory(){
		var row = grid.getSelecteds();
		var data=row[0];
		if (data) {
			nui.open({
				url: "/default/contractPact/payContract/payContractHistoryList.jsp",
				width: '90%',
				height: '70%',
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
	
	function onActionRenderer(e) {
            var record = e.record;
        	var processId=record.processid;
			var s = "<a  href='javascript:void(0)' onclick='feeView();' >"+nui.getDictText('ZH_FLOW_TYPE', e.value)+"</a>";
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
	
	function zhContractType(e) {
		return nui.getDictText("ZH_CONTRACT_TYPE", e.value);
	}
	
	function zhInvoiceNameType(e) {
		return nui.getDictText("ZH_INVOICE_NAME_TYPE", e.value);
	}
	
	function zhFlowType(e) {
		return nui.getDictText("ZH_FLOW_TYPE", e.value);
		onActionRenderer();
	}
	function zhIsSupagreement(e) {
		return nui.getDictText("ZH_ISSUPAGREEMENT", e.value);
	}
	function improt() {
		nui.open({
          	url: "<%=request.getContextPath()%>/contractPact/payContract/improtPayContract.jsp",
			title : "选择文件",
			width : 700,
			height : 200,
			allowResize : false
		});
	}
	
	function ORGANIZER(e) {
		return nui.getDictText("ORGANIZER", e.value);
	}
	function EXECUTE_STATUS(e) {
		return nui.getDictText("EXECUTE_STATUS", e.value);
	}
	function PAYER(e) {
		return nui.getDictText("PAYER", e.value);
	}
	function CONTRACT_SECRET_LEVEL(e) {
		return nui.getDictText("CONTRACT_SECRET_LEVEL", e.value);
	}
	function PROJECT_SECRET_LEVEL(e) {
		return nui.getDictText("PROJECT_SECRET_LEVEL", e.value);
	}
	function ABF_YESORNO(e) {
		return nui.getDictText("ABF_YESORNO", e.value);
	}
	function CONTRACT_NATURE(e) {
		return nui.getDictText("CONTRACT_NATURE", e.value);
	}
	function CONTRACT_PRICE(e) {
		return nui.getDictText("CONTRACT_PRICE", e.value);
	}
	function MARK_TYPE(e) {
		return nui.getDictText("MARK_TYPE", e.value);
	}
	function INTYPE(e) {
		return nui.getDictText("INTYPE", e.value);
	}
	function PROCUREMENT_TYPE(e) {
		return nui.getDictText("PROCUREMENT_TYPE", e.value);
	}
	function SUPPLIER_SOURCE(e) {
		return nui.getDictText("SUPPLIER_SOURCE", e.value);
	}
	
</script>
</body>
</html>
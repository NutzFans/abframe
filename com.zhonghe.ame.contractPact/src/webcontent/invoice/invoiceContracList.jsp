<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@include file="/purchase/common/common.jsp"%>
<html>
<head>
<style type="text/css">
	html, body{
        margin:0;padding:0;border:0;width:100%;height:100%;overflow:hidden;
    }    
</style>
<title>收费合同签订</title>
</head>
<body>
<div  id="form1">
    <input class="nui-hidden" name="critria._entity" value="com.zhonghe.ame.chargeContract.chargeContract.ZhChargeContractEntity"/>
    <div class="nui-toolbar" style="border-bottom:0;padding:0px;">
        <table align="center" border="0" width="100%" class="form_table">
            <tr >
                <td class="form_label" align = "right">申请人:</td>
                <td colspan="1">
                    <input name="critria._expr[0]._value" class="nui-textbox" style="width:65%;" id="createUsername"/>
                    <input class="nui-hidden" name="critria._expr[0]._property" value="createUsername"/>
                    <input class="nui-hidden" name="critria._expr[0]._op" value="like"/>
                    <input name="critria._expr[1]._value" class="nui-hidden" id="createUserid"/>
                    <input class="nui-hidden" name="critria._expr[1]._property" value="createUserid"/>
                </td>
                <td class="form_label" align = "right">合同实施部门:</td>
                <td colspan="1">
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
                </td>
                <td class="form_label" align = "right">签约方:</td>
                <td colspan="1">
                    <input name="critria._expr[7]._value" class="nui-textbox" style="width:79%;" />
                    <input class="nui-hidden" name="critria._expr[7]._property" value="signatoryname"/>
                    <input class="nui-hidden" name="critria._expr[7]._op" value="like"/>
                </td>
            </tr>
            <tr>
                <td class="form_label" align = "right">合同名称:</td>
                <td colspan="1">
                    <input name="critria._expr[5]._value" class="nui-textbox" style="width:65%;" />
                    <input class="nui-hidden" name="critria._expr[5]._property" value="contractName"/>
                    <input class="nui-hidden" name="critria._expr[5]._op" value="like"/>
                </td>
                <td class="form_label" align = "right">合同金额(元):</td>
                <td colspan="1">
                    <input class="nui-textbox" name="critria._expr[6]._min" width="24%"/>~<input class="nui-textbox" name="critria._expr[6]._max" width="24%"/>
                    <input class="nui-hidden" name="critria._expr[6]._property" value="contractSum"/>
                    <input class="nui-hidden" name="critria._expr[6]._op" value="between"/>
                </td>
                <td class="form_label" align = "right">实施地点:</td>
                <td colspan="1">
                    <input name="critria._expr[9]._value" class="nui-textbox" style="width:79%;" />
                    <input class="nui-hidden" name="critria._expr[9]._property" value="projectLocal"/>
                    <input class="nui-hidden" name="critria._expr[9]._op" value="like"/>
                </td>
            </tr>
            <tr>
                <td class="form_label" align = "right">专业类别:</td>
                <td colspan="1">
                    <input name="critria._expr[8]._value" class="nui-dictcombobox" dictTypeId="ZH_MAJOR_TYPE" style="width:65%;" showNullItem="true" nullItemText="全部"/>
                    <input class="nui-hidden" name="critria._expr[8]._property" value="major"/>
                    <input class="nui-hidden" name="critria._expr[8]._op" value="like"/>
                </td>
                <td class="form_label" align = "right">申请日期:</td>
                <td colspan="1">
                    <input class="nui-hidden" name="critria._expr[4]._op" value="between" />
                    <input class="nui-hidden" name="critria._expr[4]._pattern" value="yyyy-MM-dd" />
                    <input class="nui-hidden" name="critria._expr[4]._property" value="createTime" />
                    <input class="nui-datepicker" name="critria._expr[4]._min" style="width:22.5%;"/>
                    <span style="border-spacing: 0px; padding-left: 0.2em;padding-right: 0.2em;">至</span>
                    <input class="nui-datepicker" name="critria._expr[4]._max" style="width:23%;"/>
                </td>
                <td class="form_label" align = "right">标的规模:</td>
                <td colspan="1">
                    <input name="critria._expr[10]._value" class="nui-textbox" style="width:79%;" />
                    <input class="nui-hidden" name="critria._expr[10]._property" value="projectSize"/>
                    <input class="nui-hidden" name="critria._expr[10]._op" value="like"/>
                </td>
            </tr>
            <tr>
                <td class="form_label" align = "right">合同编号:</td>
                <td colspan="1">
                    <input name="critria._expr[11]._value" class="nui-textbox" style="width:65%;" />
                    <input class="nui-hidden" name="critria._expr[11]._property" value="contractNo"/>
                    <input class="nui-hidden" name="critria._expr[11]._op" value="like"/>
                </td>
                <td class="form_label" align = "right">签订日期:</td>
                <td colspan="1">
                    <input class="nui-hidden" name="critria._expr[13]._op" value="between" />
                    <input class="nui-hidden" name="critria._expr[13]._pattern" value="yyyy-MM-dd" />
                    <input class="nui-hidden" name="critria._expr[13]._property" value="signingDate" />
                    <input class="nui-datepicker" name="critria._expr[13]._min" style="width:50%;"/>
                </td>
                <td class="form_label" align = "right">审批状态:</td>
                <td colspan="1">
                    <input name="critria._expr[12].appStatus" class="nui-dictcombobox" dictTypeId="ZH_FLOW_TYPE" style="width:79%;" showNullItem="true" nullItemText="全部"/>
                </td>
            </tr>
            <tr>
                <td colspan="9" align="center">
                    <a class="nui-button" id="search" iconCls="icon-search" onclick="search()">查询</a>
                    <a class="nui-button" id="reset" iconCls="icon-reload" onclick="reset()">重置</a>
                </td>
            </tr>
        </table>
    </div>
</div>

    <div class="nui-fit">
    <div id="datagrid1" sizeList="[10,20,50,100]" showPager="true" dataField="data" 
    	showSummaryRow="true" ondrawsummarycell="onDrawSummaryCell" pageSize="15"
    	class="nui-datagrid" style="width:100%;height:100%;" url="com.zhonghe.ame.chargeContract.chargeContract.queryChargeContractAll.biz.ext" 
    	multiSelect="true" allowSortColumn=true  ondrawcell="setBackGroundColor">
        <div property="columns">
        <div name="temp123" type="checkcolumn"></div>
        <div type="indexcolumn" width="40" align="center" headerAlign="center">序号</div>
        	<div field="createUsername" width="60" align="center" headerAlign="center" allowSort="true" >合同经办人</div>
        	<div field="organizer" width="120"  headerAlign="center" allowSort="true"  renderer="ORGANIZER">合同承办部门</div>
        	<div field="contractNo" width="100" headerAlign="center" allowSort="true" >合同编号</div>
        	<div field="contractName" width="150" align="center" headerAlign="center" allowSort="true" renderer="lookInfo">合同名称</div>
        	<div field="contractSum" width="120" align="center" headerAlign="center" allowSort="true" dataType="currency" summaryType="sum">合同金额</div>
        	<div field="finContractSum" width="120" align="center" headerAlign="center" allowSort="true" dataType="currency" summaryType="sum">合同最终金额（元）</div>
        	<div field="noTaxSum" width="120" align="center" headerAlign="center" allowSort="true" dataType="currency" summaryType="sum">合同不含税金额（元）</div>
            <div field="payTax" width="120" align="center" headerAlign="center" allowSort="true" dataType="currency" summaryType="sum">税额（元）</div>
            <div field="contractBalance" width="120" align="center" headerAlign="center" allowSort="true" dataType="currency" summaryType="sum">税额（元）</div>
        	<div field="executeStatus" width="80" align="center" headerAlign="center" allowSort="true"  renderer="EXECUTE_STATUS">执行状态</div>
        	<div field="appStatus"  align="center" headerAlign="center" allowSort="true" renderer="onActionRenderer" >审批状态</div>
        	<div field="signatoryname" width="190" align="center" headerAlign="center" allowSort="true" >签约方</div>
        	<div field="contractSubject" width="80" align="center" headerAlign="center" allowSort="true"  renderer="PAYER">合同签约主体</div>
       		<div field="payee" width="80" align="center" headerAlign="center" allowSort="true"  renderer="PAYER">收款方</div>
        	<div field="signingDate"  dateFormat="yyyy-MM-dd" width="90"   headerAlign="center" >签订日期</div>
        	<div field="contractSecretLevel" width="80" align="center" headerAlign="center" allowSort="true"  renderer="CONTRACT_SECRET_LEVEL">合同密级</div>
        	<div field="projectSecretLevel" width="80" align="center" headerAlign="center" allowSort="true"  renderer="PROJECT_SECRET_LEVEL">项目密级</div>
            <div field="isfb" width="80" align="center" headerAlign="center" allowSort="true"  renderer="ABF_YESORNO">是否计划对外分包</div>
        	<div field="issupagreement"  align="center" headerAlign="center" allowSort="true" renderer="ABF_YESORNO" >是否协议变更</div>
        	<div field="major" width="80" align="center" headerAlign="center" allowSort="true"  renderer="ZH_MAJOR_TYPE">专业类别</div>
        	<div field="projectType" width="80" align="center" headerAlign="center" allowSort="true"  renderer="ZH_PROJECT_TYPE">工程类别</div>
        	<div field="headquarterGroup" width="80" align="center" headerAlign="center" allowSort="true"  renderer="ZH_GROUP">集团内外</div>
        	<div field="contractModel" width="80" align="center" headerAlign="center" allowSort="true"  renderer="CONTRACT_MODEL">合同价格模式</div>
        	<div field="procurementType" width="80" align="center" headerAlign="center" allowSort="true"  renderer="ZH_PROCUREMENT_TYPE">招标人采购方式</div>
        </div>
        </div>
        <div style="text-align: center;padding: 10px;" class="nui-toolbar">
			<a class="nui-button" onclick="onOk()" id="creatReimbProcess" style="width: 80px;margin-right: 20px;">确定</a>
			<a class="nui-button" onclick="onCancel" id="saveReimbProcess" style="width: 80px;margin-right: 140px;">关闭</a>
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
	    	getOpeatorButtonAuth("sfhtlist_kpsq_bc,sfhtlist_add,sfhtlist_edit,sfhtlist_bcxy,sfhtlist_kpsq");//操作按钮权限初始化
    		//code:对应功能编码，map：对于机构的查询条件
			var json = {"code":"sfhtlist","map":{"property":"status","op":"=","value":"running"}};
    		nui.ajax({
				url:"com.primeton.eos.ame_auth.ame_auth.getownorg1.biz.ext",
				data:json,
				type:'POST',
				contentType:'text/json',
				success:function(text){
					if(text.orgs){
						var orgids = text.orgids;
							if(text.orgs.length==0){
								//当没有有权的机构时将申请人设置为登陆人
								nui.get("createUserid").setValue(userId);
								nui.get("createUsername").setValue(userName);
								nui.get("createUsername").setReadOnly(true);
							}
								nui.get("orgid2").setData(text.orgs);
								
								if(orgids!=null){
									orgids = orgids.split(",");
									if(!isStr(orgids, "1")){
									//根据情况选择一种
										nui.get("orgids2").setValue(text.orgids);
									}
								}
						}else{
							//当没有有权的机构时将申请人设置为登陆人
								nui.get("createUserid").setValue(userId);
								nui.get("createUsername").setValue(userName);
								nui.get("createUsername").setReadOnly(true);
						}
					search();
				}
			});
		}
		
		function isStr(str, val) {
		  if (str.indexOf(val) != -1) {
		    return true
		  } else {
		    return false
		  }
  		}
		
		function check(e){
			if(e.value==1){
			return "是";
			}else{
			return "否";
			}
		}
		
		function lookInfo(e) {
			return "<a href='javascript:void(0)' onclick='doView();' title='点击查看'>" + e.value + "</a>";
		}
	    function doView(){
			var row = grid.getSelected();
			if (row) {
				executeUrl = "<%= request.getContextPath() %>/contractPact/print/chargeContractInfoPrint.jsp?id=" + row.id;
				window.open(executeUrl);
			}else {
				showTips("请选中一条记录");
			}
		}
		
		function printBtn() {
			var row = grid.getSelected();
			if (row) {
				executeUrl = "<%= request.getContextPath() %>/contractPact/print/chargeContractInfoPrint.jsp?id=" + row.id;
				window.open(executeUrl);
			}else {
				showTips("请选中一条记录");
			}
		}
		
		function dictGetType(e){
			return nui.getDictText('EXP_EXPTYPE',e.value);
		}
		function dictGetStatus(e){
			return nui.getDictText('EXP_CHECKFLAG',e.value);
		}
		
		function search() {
			if(nui.get("orgid2").getValue() == ""){
	    		nui.get("tempCond1").setValue("=");
	    		nui.get("tempCond2").setValue("");
	    	}else{
	    		nui.get("tempCond1").setValue("in");
	    		nui.get("tempCond2").setValue("1");
	    	}
			var form = new nui.Form("#form1");
			var data = form.getData(); //获取表单JS对象数据
			grid.sortBy("createTime","desc");
			console.log(data)
		  	grid.load(data); //datagrid加载数据
		}
		function reset(){
			var form = new nui.Form("#form1");
			form.reset();
			init();
		}
		
		function setBackGroundColor(e){	
		return;		
			var record = e.record;
        	if(record.appStatus == "0"){
            		e.rowStyle = "background-color: #FFFF99";  	
            }else if(record.appStatus == "1"){
            	e.rowStyle = "background-color: #FF99CC";
            }
		}
		
		function onOk(){
			var row = grid.getSelected();
			CloseWindow("ok");     
		}
		 function GetData() {
        	var row = grid.getSelected();
        	return row;
    	}
		
		
		//回车触发
		function onKeyEnter(){
			search();
		}
	    
	    function onActionRenderer(e) {
			var grid = e.sender;
            var record = e.record;
            var uid = record._uid;
        	var processInstID=record.processinstid;
			
			var s = " <a  href='javascript:void(0)' onclick='feeView();' >流程</a>";
			
            return s;
        }
        
	    
	    function onDrawSummaryCell(e) {
		    var result = e.result;
		    var grid = e.sender;
		   
		}
	
	
    
    
	
	
	function contractHistory(){
		var row = grid.getSelecteds();
		var data=row[0];
		if (data) {
			nui.open({
				url: "/default/contractPact/chargeContract/chargeContractHistoryList.jsp",
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
			showTips("请选中一条记录","提示");
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
	function zhFlowType(e) {
		return nui.getDictText("ZH_FLOW_TYPE", e.value);
	}
	function zhProjectType(e) {
		return nui.getDictText("ZH_PROJECT_TYPE", e.value);
	}
	function zhInvoiceNameType(e) {
		return nui.getDictText("ZH_INVOICE_NAME_TYPE", e.value);
	}
	function zhExecuteStatus(e) {
		return nui.getDictText("ZH_EXECUTESTATUS", e.value);
	}
	function zhInvoiceGroup(e) {
		return nui.getDictText("ZH_GROUP", e.value);
	}
	function zhMajorType(e) {
		return nui.getDictText("ZH_MAJOR_TYPE", e.value);
	}
	function zhIsSupagreement(e) {
		return nui.getDictText("ZH_ISSUPAGREEMENT", e.value);
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
	function improt() {
		nui.open({
          	url: "<%=request.getContextPath()%>/contractPact/chargeContract/improtChargeContract.jsp",
			title : "选择文件",
			width : 700,
			height : 200,
			allowResize : false
		});
	}
	function ZH_MAJOR_TYPE(e) {
		return nui.getDictText("ZH_MAJOR_TYPE", e.value);
	}
	function ZH_PROJECT_TYPE(e) {
		return nui.getDictText("ZH_PROJECT_TYPE", e.value);
	}
	function CONTRACT_MODEL(e) {
		return nui.getDictText("CONTRACT_MODEL", e.value);
	}
	function ZH_GROUP(e) {
		return nui.getDictText("ZH_GROUP", e.value);
	}
	function ZH_PROCUREMENT_TYPE(e) {
		return nui.getDictText("ZH_PROCUREMENT_TYPE", e.value);
	}
	function onRowDblClick(e) {
		onOk();
	}
	
	function onCancel(e) {
    	CloseWindow("cancel");
	}
	//标准方法接口定义
	function CloseWindow(action) {           
	    if (window.CloseOwnerWindow) return window.CloseOwnerWindow(action);
	    else window.close();            
	}
</script>
</body>
</html>
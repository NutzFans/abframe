<%@page import="com.eos.data.datacontext.UserObject"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@include file="/common/common.jsp"%>
<html>
<head>
<title></title>
<meta http-equiv="content-type" content="text/html; charset=UTF-8" />
<script src="<%= request.getContextPath() %>/common/nui/nui.js"
	type="text/javascript"></script>
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
	<div class="nui-panel" title="付款计划查询" style="width: 100%;height: 100%">
	<div id="form1">
		<input class="nui-hidden" name="critria._entity" value="com.zhonghe.ame.annualPlan.annualPlan.AnnualChargePlanEntity" />
		<div class="nui-toolbar" style="border-bottom: 0; padding: 0px;">
			<table align="center" border="0" width="100%" class="form_table">
				<tr>
					<td class="form_label" align="right" style="width: 3%">经办人:</td>
			        <td colspan="1" style="width: 7%">
			            <input name="critria._expr[1]._value" class="nui-textbox" style="width: 200px;" />
			            <input class="nui-hidden" name="critria._expr[1]._property" value="createUsername" />
			            <input class="nui-hidden" name="critria._expr[1]._op" value="like" />
			        </td>
			        
			        <td class="form_label" align="right" style="width: 3%">合同名称:</td>
			        <td colspan="1" style="width: 7%">
			            <input name="critria._expr[2]._value" class="nui-textbox" style="width: 200px;" />
			            <input class="nui-hidden" name="critria._expr[2]._property" value="contractName" />
			            <input class="nui-hidden" name="critria._expr[2]._op" value="like" />
			        </td>
			        <td align="right" style="width: 3%">付款方：</td>
			        <td colspan="1" style="width: 7%">
			            <input class="nui-dictcombobox" name="critria._expr[3]._value"  style="width: 200px;"
			            	dictTypeId="ZH_INVOICE_NAME_TYPE" nullItemText="全部" showNullItem="true"  />
			            <input class="nui-hidden" name="critria._expr[3]._property" value="payee" />
			            <input class="nui-hidden" name="critria._expr[3]._op" value="=" />
			        </td>
				</tr>
				<tr>
					<td align="right" style="width: 3%">专业类别：</td>
			        <td colspan="1" style="width: 7%">
			            <input class="nui-dictcombobox" name="critria._expr[4]._value"  style="width: 200px;"
			            	dictTypeId="ZH_MAJOR_TYPE" nullItemText="全部" showNullItem="true"  />
			            <input class="nui-hidden" name="critria._expr[4]._property" value="major" />
			            <input class="nui-hidden" name="critria._expr[4]._op" value="=" />
			        </td>
			        <td align="right" style="width: 3%">工程类别：</td>
			        <td colspan="1" style="width: 7%">
			            <input class="nui-dictcombobox" name="critria._expr[5]._value"  style="width: 200px;"
			            	dictTypeId="ZH_PROJECT_TYPE" nullItemText="全部" showNullItem="true"  />
			            <input class="nui-hidden" name="critria._expr[5]._property" value="projectType" />
			            <input class="nui-hidden" name="critria._expr[5]._op" value="=" />
			        </td>
			        <td align="right" style="width: 3%">集团内/外：</td>
			        <td colspan="1" style="width: 7%">
			            <input class="nui-dictcombobox" name="critria._expr[6]._value"  style="width: 200px;"
			            	dictTypeId="ZH_GROUP" nullItemText="全部" showNullItem="true"  />
			            <input class="nui-hidden" name="critria._expr[6]._property" value="headquarterGroup" />
			            <input class="nui-hidden" name="critria._expr[6]._op" value="=" />
			        </td>
				</tr>
				
			</table>
		</div>
	</div>
	<div class="nui-toolbar" style="border-bottom:0;padding:0px;">
		<table style="width:100%;">
        	<tr>
		        <td   align="center">
		            <a class="nui-button" id="search" iconCls="icon-search" onclick="search()">查询</a>
		            <a class="nui-button" id="reset" iconCls="icon-reload" onclick="reset()">重置</a>
		        </td>
            </tr>
        </table>           
    </div>
	<div class="nui-fit">
		<div id="datagrid1" sizeList="[10,20,50,100]" showPager="true" dataField="data" sortMode="client"
			class="nui-datagrid" style="width: 100%; height: 100%;"
			url="com.zhonghe.ame.annualPlan.annualPlan.payPlanAll.biz.ext" multiSelect="true">
			<div property="columns">
				<div name="temp123" type="checkcolumn"></div>
				<div type="indexcolumn" width="50" align="center" headerAlign="center">序号</div>
				<!-- <div type="expandcolumn" width="20"></div> -->
				<div field="years" width="120" align="center"
					headerAlign="center" allowSort="true">年份</div>
				<div field="createUsername" width="120" align="center"
					headerAlign="center" allowSort="true">经办人</div>
				<div field="organizer" width="120" align="center"
					headerAlign="center" allowSort="true">承办部门</div>
				<div field="contractNo" width="120" align="center"
					headerAlign="center" allowSort="true">合同编号</div>
				<div field="contractName" width="120" align="center"
					headerAlign="center" allowSort="true">合同名称</div>
				<div field="signatoryname" width="180" align="center"
					headerAlign="center" allowSort="true">付款单位</div>
				<div field="payee" width="120" align="center"
					headerAlign="center" allowSort="true" renderer="PAYER">付款方</div>
				<div field="contractSum" width="120" align="center"
					headerAlign="center" allowSort="true">合同金额（元）</div>
				<div field="income" width="130" align="center"
					headerAlign="center" allowSort="true">计划收入（元）</div>
				<div field="sum" width="130" align="center"
					headerAlign="center" allowSort="true">计划收款金额（元）</div>
				<div field="jan" width="120" align="center"
					headerAlign="center" allowSort="true">1月</div>
					<div field="feb" width="120" align="center"
					headerAlign="center" allowSort="true">2月</div>
					<div field="mar" width="120" align="center"
					headerAlign="center" allowSort="true">3月</div>
					<div field="apr" width="120" align="center"
					headerAlign="center" allowSort="true">4月</div>
					<div field="may" width="120" align="center"
					headerAlign="center" allowSort="true">5月</div>
					<div field="jun" width="120" align="center"
					headerAlign="center" allowSort="true">6月</div>
					<div field="jul" width="120" align="center"
					headerAlign="center" allowSort="true">7月</div>
					<div field="aug" width="120" align="center"
					headerAlign="center" allowSort="true">8月</div>
					<div field="sep" width="120" align="center"
					headerAlign="center" allowSort="true">9月</div>
					<div field="oct" width="120" align="center"
					headerAlign="center" allowSort="true">10月</div>
					<div field="nov" width="120" align="center"
					headerAlign="center" allowSort="true">11月</div>
					<div field="dec" width="120" align="center"
					headerAlign="center" allowSort="true">12月</div>
				<div field="major" width="80" align="center" headerAlign="center" allowSort="true"  renderer="ZH_MAJOR_TYPE">专业类别</div>
        	<div field="projectType" width="80" align="center" headerAlign="center" allowSort="true"  renderer="ZH_PROJECT_TYPE">工程类别</div>
        	<div field="headquarterGroup" width="80" align="center" headerAlign="center" allowSort="true"  renderer="ZH_GROUP">集团内外</div>
			</div>
		</div>
	</div>
</div>

	<% UserObject user = (UserObject)session.getAttribute("userObject");
	String userName=user.getUserName();
	String userId=user.getUserId();
	String orgName=user.getUserOrgName();
 %>
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


		init2();
    	function init2(){
    		//按钮权限的控制
	    	//getOpeatorButtonAuth("ffhtlist_add,ffhtlist_edit,ffhtlist_bcxy,ffhtlist_fksq");//操作按钮权限初始化
    		//code:对应功能编码，map：对于机构的查询条件
			var json = {"code":"fklblist","map":{"property":"status","op":"=","value":"running"}};
    		nui.ajax({
				url:"com.primeton.eos.ame_auth.ame_auth.getownorg1.biz.ext",
				data:json,
				type:'POST',
				contentType:'text/json',
				success:function(text){
					if(text.orgs){
						if(text.orgs.length==0){
							//当没有有权的机构时将申请人设置为登陆人
							nui.get("createUserid").setValue('<%=userId %>');
							nui.get("createname").setValue('<%=userName %>');
							nui.get("createname").setReadOnly(true);
						}
						//根据情况选择一种
						nui.get("orgid2").setData(text.orgs);
						nui.get("orgids2").setValue(text.orgids);
					}else{
						//当没有有权的机构时将申请人设置为登陆人
							nui.get("createUserid").setValue('<%=userId %>');
							nui.get("createname").setValue('<%=userName %>');
							nui.get("createname").setReadOnly(true);
					}
					search();
				}
			});
		}



//     	init();
    	function init(){
    		grid.load({type:type});
    		grid.sortBy("tbdate","desc");
		}
		function check(e){
		console.log(e);
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
				executeUrl = "<%= request.getContextPath() %>/contractPact/print/payMentListPrint.jsp?id=" + row.id;
				window.open(executeUrl);
			}else {
				showTips("请选中一条记录");
			}
		}
		function printBtn() {
			var row = grid.getSelected();
			if (row) {
				executeUrl = "<%= request.getContextPath() %>/contractPact/print/payMentListPrint.jsp?id=" + row.id;
				window.open(executeUrl);
			}else {
				showTips("请选中一条记录");
			}
		}
		<%-- function print() {
				var selectRow = grid.getSelected();
				if (selectRow) {
					var url = "<%= request.getContextPath() %>/contractPact/print/payMentListPrint.jsp?id="+selectRow.id;
					var myWindow = window.open(url);
					myWindow.onload = function(){
						myWindow.document.title = "付费合同签订查看";
						myWindow.setViewData(selectRow);
					};
				}else {
					showTips("请选中一条记录");
				}
		} --%>
		
		 
		function search() {
			var form = new nui.Form("#form1");
			var data = form.getData(); //获取表单JS对象数据
			grid.sortBy("createTime","desc");
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
		
		
		function setBackGroundColor(e){			
			var record = e.record;
        	if(record.appStatus == "0"){
            		e.rowStyle = "background-color: #FFFF99";  	
            }else if(record.appStatus == "1"){
            	e.rowStyle = "background-color: #FF99CC";
            }
		}
		
		
		//回车触发
	function onKeyEnter(){
		search();
	}
    
    function onActionRenderer(e) {
        var record = e.record;
    	var processId=record.processid;
		var s = "<a  href='javascript:void(0)' onclick='feeView();' >"+nui.getDictText('ZH_FLOW_TYPE', e.value)+"</a>";
        return s;
    }
    
        
    function onDrawSummaryCell(e) {
	    var result = e.result;
	    var grid = e.sender;
	   /*  if (e.field == "empname") {
	        e.cellHtml = "<span style='display: block;font-weight: bold;font-size: 12px;text-align: right;'>合计：</span>";
	    }
	    if (e.field == "total") {
	    	e.cellHtml = "<span style='display: block;font-weight: bold;text-align: right;'>" + e.cellHtml + "</span>";
	    }
	    if (e.field == "confamt") {
	    	e.cellHtml = "<span style='display: block;font-weight: bold;text-align: right;'>" + e.cellHtml + "</span>";
	    }
	    if (e.field == "hxamt") {
	    	e.cellHtml = "<span style='display: block;font-weight: bold;text-align: right;'>" + e.cellHtml + "</span>";
	    }
	    if (e.field == "payamt") {
	    	e.cellHtml = "<span style='display: block;font-weight: bold;text-align: right;'>" + e.cellHtml + "</span>";
	    } */
	}
		//将中国标准时间格式化为“yyyy-MM-dd HH:mm:ss”
	function ondealdate(e){
		if(e.value){
		  var now  = e.value;
		  var   year=now.getFullYear();     
          var   month=now.getMonth()+1;
          var   day=now.getDate();     
          var   hours=now.getHours();     
          var   minutes=now.getMinutes();     
          var   seconds=now.getSeconds();
          var curDateTime = year;
          if(month>9){
			curDateTime = curDateTime +"-" + month;
		  }else{
		  	curDateTime = curDateTime+"-" + "0" + month;
		  }
    	if(day>9){
			curDateTime = curDateTime+"-" + day;
		}else{
			curDateTime = curDateTime+"-" + "0" + day;
			}
		if(hours>9){
			curDateTime = curDateTime+"   " + hours;
		}else{
			curDateTime = curDateTime+"   " + "0" + hours;
			}
		if(minutes>9){
			curDateTime = curDateTime+":" + minutes;
		}else{
			curDateTime = curDateTime+":" + "0" + minutes;
			}
		if(seconds>9){
			curDateTime = curDateTime+":" + seconds;
		}else{
			curDateTime = curDateTime+":" + "0" + seconds;
			}     
          return   curDateTime;     
		}
	}
	
	
	function dictGetType(e){
			return nui.getDictText('EXP_EXPTYPE',e.value);
		}
		function dictGetStatus(e){
			return nui.getDictText('EXP_CHECKFLAG',e.value);
		}
	function zhContractType(e) {
		return nui.getDictText("ZH_CONTRACT_TYPE", e.value);
	}
	function zhFlowType(e) {
		return nui.getDictText("ZH_FLOW_TYPE", e.value);
	}
	function zhLaborDispatchingFlag(e) {
		return nui.getDictText("ZH_LABOR_DISPATCHING_FLAG", e.value);
	}
	function payType(e) {
		return nui.getDictText("payType", e.value);
	}
	function PAYER(e) {
		return nui.getDictText("PAYER", e.value);
	}
	function MIS_MA_INVOICETYPE(e) {
		return nui.getDictText("MIS_MA_INVOICETYPE", e.value);
	}
	function CONTRACT_NATURE(e) {
		return nui.getDictText("CONTRACT_NATURE", e.value);
	}
	function ZH_CONTRACT_TYPE(e) {
		return nui.getDictText("ZH_CONTRACT_TYPE", e.value);
	}
	
	function ZH_INVOICE_NAME_TYPE(e) {
		return nui.getDictText("ZH_INVOICE_NAME_TYPE", e.value);
	}
	function ZH_MAJOR_TYPE(e) {
		return nui.getDictText("ZH_MAJOR_TYPE", e.value);
	}
	function ZH_PROJECT_TYPE(e) {
		return nui.getDictText("ZH_PROJECT_TYPE", e.value);
	}
	function ZH_GROUP(e) {
		return nui.getDictText("ZH_GROUP", e.value);
	}
</script>
</body>
</html>

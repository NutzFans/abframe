 <%@page import="com.eos.data.datacontext.UserObject"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@include file="/common/common.jsp"%>
<html>
<head>
<title>采购立项列表</title>
	<meta http-equiv="content-type" content="text/html; charset=UTF-8" />
	<script src="<%= request.getContextPath() %>/common/nui/nui.js" type="text/javascript"></script>
	<style type="text/css">
	    .nui-radiobuttonlist-item{
	    	float: left;
		    margin-left: 200px;
		    color: pink;
		 }
    </style>
</head>
<body>
	<div class="nui-panel"  style="width:100%;">
        <div  id="form1">
        	<input class="nui-hidden" name="critria._entity" value="com.zhonghe.ame.payContract.payContract.PayContractEntity"/>
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
	            <input name="critria._expr[8]._value" class="nui-textbox" style="width:79%;" />
	            <input class="nui-hidden" name="critria._expr[8]._property" value="signatoryname"/>
	            <input class="nui-hidden" name="critria._expr[8]._op" value="like"/>
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
	     <tr>
		            <td colspan="9" align="center">
			            <a class="nui-button" id="search" iconCls="icon-search" onclick="search()">查询</a>
			            <a class="nui-button" id="reset" iconCls="icon-reload" onclick="reset()">重置</a>
			        </td>
		        </tr>
	</table>
	</div>
</div>
<div >
    <div id="datagrid1" frozenStartColumn="0"  sizeList="[10,20,50,100]" showPager="true" dataField="data" 
    	showSummaryRow="true"   ondrawsummarycell="onDrawSummaryCell" onrowdblclick="onRowDblClick"
    	class="nui-datagrid" style="width:100%;height:300px;" url="com.zhonghe.ame.payContract.payContract.payContractAll.biz.ext" 
    	multiSelect="false" allowSortColumn=true >
        <div property="columns">
        <div type="indexcolumn" align="center" headerAlign="center">序号</div>
        	<div name="temp123" type="checkcolumn"></div>
        	<div field="createUsername" width="60"  headerAlign="center" allowSort="true" >申请人</div>
            <div field="contractName" width="250"  headerAlign="center" allowSort="true" renderer="lookInfo">合同名称</div>
            <div field="signatoryname" width="190"  headerAlign="center" allowSort="true" >签约方</div>
            <div field="payer" width="150"  headerAlign="center" allowSort="true" renderer="zhInvoiceNameType">付款方</div>
            <div field="contractSum" width="120" align="right" headerAlign="center" allowSort="true" dataType="currency" summaryType="sum">合同金额（元）</div>
            <div field="actContractSum" width="120" align="right" headerAlign="center" allowSort="true" dataType="currency" summaryType="sum">合同最终金额（元）</div>
            <div field="implementOrgname" width="240"  headerAlign="center" allowSort="true" >合同实施部门</div>
            <div field="createTime" width="100"  headerAlign="center" allowSort="true" >申请日期</div>
            <div field="projectLocal"   headerAlign="center" allowSort="true"  >实施地点</div>
            <div field="projectSize" width="100" headerAlign="center" allowSort="true" >标的规模</div>
            <div field="contractType" width="120"  headerAlign="center" allowSort="true"  renderer="zhContractType">合同类型</div>
            <div field="appStatus"    headerAlign="center" allowSort="true" renderer="onActionRenderer" >审批状态</div>
            <div field="issupagreement"  align="center"headerAlign="center" allowSort="true" renderer="zhIsSupagreement" >是否协议变更</div>
            <div field="startTime"  dateFormat="yyyy-MM-dd" width="90"   headerAlign="center" >合同起始日期</div>
            <div field="endTime" dateFormat="yyyy-MM-dd" width="90"   headerAlign="center" >合同结束日期</div>
            <div field="contractNo" width="100" headerAlign="center" allowSort="true" >合同编号</div>
            <div field="signingDate"  dateFormat="yyyy-MM-dd" width="90"   headerAlign="center" >签订日期</div>
        </div>
        </div>
    	<div style="text-align: center;padding: 10px;" class="nui-toolbar">
			<a class="nui-button" onclick="onOk()" id="creatReimbProcess" style="width: 80px;margin-right: 20px;">确定</a>
			<a class="nui-button" onclick="onCancel" id="saveReimbProcess" style="width: 80px;margin-right: 140px;">关闭</a>
		</div>
			
		</div>
	</div>
	
<% UserObject user = (UserObject)session.getAttribute("userObject");
	String userName=user.getUserName();
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
		function getStatus(e){
    		if(e.value==1){
    			return "审核中"
    		}
		}
		function search() {
			var form = new nui.Form("#form1");
			var data = form.getData(); //获取表单JS对象数据
// 			if(data.critria._expr[4]._property == "status"){
// 				data.critria._expr[4]._value="2"
// 			}
		  	console.log(data)
		  	grid.sortBy("createTime","desc");
		  	grid.load(data); //datagrid加载数据
		}
		function reset(){
			var form = new nui.Form("#form1");
			form.reset();
			grid.load();
			search()
		}
		
    function onOk() {
        var row = grid.getSelected();
        if(row.status==1){
        	//alert(row.status);
        	alert("請選擇已完成的立項");
        	return;
        }
        
//        alert(nui.encode(row));
  //      return;
        //console.log(node);
//         if (node && tree.isLeaf(node) == false) {
//             alert("不能选中父节点");
//             return;
//         }

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
	
	function dictIshavebak(e) {
		return nui.getDictText('ZH_PURCHASE',e.value);//设置业务字典值
	}
	
	function getStatus(e) {
		return nui.getDictText('zh_purplan_status',e.value);//设置业务字典值
	}
	
	function zhContractType(e) {
		return nui.getDictText("ZH_CONTRACT_TYPE", e.value);
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
	function zhFlowType(e) {
		return nui.getDictText("ZH_FLOW_TYPE", e.value);
		onActionRenderer();
	}
	function onActionRenderer(e) {
            var record = e.record;
        	var processId=record.processid;
			var s = "<a  href='javascript:void(0)' onclick='feeView();' >"+nui.getDictText('ZH_FLOW_TYPE', e.value)+"</a>";
            return s;
    }
    function zhInvoiceNameType(e) {
		return nui.getDictText("ZH_INVOICE_NAME_TYPE", e.value);
	}
</script>
</body>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>	
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@page import="commonj.sdo.DataObject"%>
<%@page import="java.util.Map"%>
<%@page import="com.eos.data.datacontext.UserObject"%>
<html>
<!-- 
  - Author(s): mengyy
  - Date: 2020-04-29 09:58:21
  - Description:
-->
<head>
	<title>正式申请查询</title>
	<meta http-equiv="content-type" content="text/html; charset=UTF-8" />
	<script src="<%= request.getContextPath() %>/common/nui/nui.js" type="text/javascript"></script>
</head>
<body>
<div style="width:100%;height:100%;padding:0px;margin:0px;" >
<div class="nui-panel" title="正式许可申请查询" style="width:100%;">
    <div style="width:100%;height:100%;padding:0px;margin:0px;" id="form1">
    	<div class="nui-toolbar" style="border-bottom:0;padding:0px;">
    		<table align="center" border="0" width="100%">
    			<tr>
    				<td align="right">销售所属机构:</td>
					<td align="left">
					    <input name="criteria._ref[2]._expr[0]._value" class="nui-combobox" style="width: 150px" id="orgseq" textField="orgname" 
					    valueField="orgseq" dataField = "orgs"  shownullItem="true" onenter="onKeyEnter" allowInput="true" />
                    
                    <input class="nui-hidden" name="criteria._expr[0]._property" value="contractid"/>
			        <input class="nui-hidden" name="criteria._expr[0]._op" value="in" id="tempCond1"/>
			        <input class="nui-hidden" name="criteria._expr[0]._ref" value="2" id="tempCond2"/>
			        <input class="nui-hidden" name="criteria._ref[1]._id" value="2"/>
			        <input class="nui-hidden" name="criteria._ref[1]._entity" value="com.primeton.mis.contract.contract.CsContractsale"/>
			        <input class="nui-hidden" name="criteria._ref[1]._select._field[0]" value="contractid"/>
			        <input class="nui-hidden" name="criteria._ref[1]._expr[0]._property" value="orgid"/>
			        <input class="nui-hidden" name="criteria._ref[1]._expr[0]._op" value="in" id="tempCond3"/>
			        <input class="nui-hidden" name="criteria._ref[1]._expr[0]._ref" value="3" id="tempCond4"/>
			        <input class="nui-hidden" name="criteria._ref[2]._id" value="3"/>
			        <input class="nui-hidden" name="criteria._ref[2]._entity" value="org.gocom.abframe.dataset.organization.OmOrganization"/>
			        <input class="nui-hidden" name="criteria._ref[2]._select._field[0]" value="orgid"/>
			        <input class="nui-hidden" name="criteria._ref[2]._expr[0]._property" value="orgseq"/>
			        <input class="nui-hidden" name="criteria._ref[2]._expr[0]._op" value="like"/>
			        <input class="nui-hidden" name="criteria._ref[2]._expr[0]._likeRule" value="end"/>
                    
                    
                    <input class="nui-hidden" name="criteria._or[0]._expr[0]._property" value="contractid"/>
			        <input class="nui-hidden" name="criteria._or[0]._expr[0]._op" value="in" id="tempCond1"/>
			        <input class="nui-hidden" name="criteria._or[0]._expr[0]._ref" value="1" id="tempCond2"/>
			        <input class="nui-hidden" name="criteria._ref[0]._id" value="1"/>
			        <input class="nui-hidden" name="criteria._ref[0]._entity" value="com.primeton.mis.contract.contract.CsContractsale"/>
			        <input class="nui-hidden" name="criteria._ref[0]._select._field[0]" value="contractid"/>
			        <input class="nui-hidden" name="criteria._ref[0]._expr[0]._property" value="orgid"/>
			        <input class="nui-hidden" name="criteria._ref[0]._expr[0]._op" value="in" />
                    <input class="nui-hidden" name="criteria._ref[0]._expr[0]._value" id="orgids"/>
			        <input class="nui-hidden" name="criteria._or[0]._expr[1]._value"  style="width: 150px;" id="applyemp"/>
            		<input class="nui-hidden" name="criteria._or[0]._expr[1]._property" value="applyemp"/>
			        <input class="nui-hidden" name="criteria._or[0]._expr[1]._op" value="="/>
			       
					</td>
					<td align="right">接收人:</td>
					<td align="left">
				        <input name="criteria._expr[2]._value" id="empname" style="width:150px;" class="nui-textbox"  onenter="onKeyEnter" allowInput="true" />
		            	<input class="nui-hidden" name="criteria._expr[2]._property" value="inceptperson"/>
				        <input class="nui-hidden" name="criteria._expr[2]._op" value="like"/>
						<input class="nui-hidden" name="criteria._expr[2]._likeRule" value="all"/>
					</td>
					<td  align = "right">商务合同号:</td>
			        <td align="left">
				        <input name="criteria._expr[4]._value" class="nui-textbox" style="width:150px;" onenter="onKeyEnter" allowInput="true"  />
						<input class="nui-hidden" name="criteria._expr[4]._property" value="contid"/>
						<input class="nui-hidden" name="criteria._expr[4]._op" value="like"/>
						<input class="nui-hidden" name="criteria._expr[4]._likeRule" value="all"/>
			        </td>
					<td align = "right">应用系统:</td>
		         	<td align="left">
		         		<input name="criteria._expr[3]._value"  id="projectname" style="width:205px;" class="nui-textbox" allowInput="true" />
		            	<input class="nui-hidden" name="criteria._expr[3]._property" value="projectname"/>
				        <input class="nui-hidden" name="criteria._expr[3]._op" value="like"/>
						<input class="nui-hidden" name="criteria._expr[3]._likeRule" value="all"/>
		          	</td>
    			</tr>
    			<tr>
    				<td  align = "right">合同编号:</td>
			        <td align="left">
				        <input name="criteria._expr[13]._value"  id="contnum" style="width:150px;" class="nui-textbox" allowInput="true" />
		            	<input class="nui-hidden" name="criteria._expr[13]._property" value="contnum"/>
				        <input class="nui-hidden" name="criteria._expr[13]._op" value="like"/>
						<input class="nui-hidden" name="criteria._expr[13]._likeRule" value="all"/>
			        </td>
					<td  align = "right">申请人:</td>
			        <td align="left">
				      	<input name="criteria._expr[5]._value"  id="applyempname" style="width:150px;" class="nui-textbox" allowInput="true" />
		            	<input class="nui-hidden" name="criteria._expr[5]._property" value="applyempname"/>
				        <input class="nui-hidden" name="criteria._expr[5]._op" value="like"/>
						<input class="nui-hidden" name="criteria._expr[5]._likeRule" value="all"/>
			        </td>
			        <td  align = "right">申请状态:</td>
			        <td align="left">
				         <input name="criteria._expr[6]._value" class="nui-dictcombobox" dictTypeId="PC_LICENSE_STATUS" shownullItem="true" multiSelect="true" style="width:150px;" />
						<input class="nui-hidden" name="criteria._expr[6]._property" value="status"/>
						<input class="nui-hidden" name="criteria._expr[6]._op" value="in"/>
			        </td>
					<td align="right">发送日期:</td>
					<td align="left">
						<input class="nui-datepicker" name="criteria._expr[8]._min" style="width:100px"/>-<input class="nui-datepicker" name="criteria._expr[8]._max" style="width:100px"/>
					    <input class="nui-hidden" name="criteria._expr[8]._property" value="senddate"/>
					    <input class="nui-hidden" name="criteria._expr[8]._op" value="between"/>
					    <input class="nui-hidden" name="criteria._expr[8]._pattern" value="yyyy-MM-dd"/>
					</td>
    			</tr>
    			<tr>
		        <td colspan="8" align="center">
		            <a class="nui-button" id="search" iconCls="icon-search" onclick="search()">查询</a>
		            <a class="nui-button" id="reset" iconCls="icon-reload" onclick="reset()">重置</a>
				    <!-- <a class="nui-button" id="exportEmpCont" iconCls="icon-download" onclick="exportEmpCont()">导出</a> -->
		        </td>
    		</table>
    	</div>
    </div>
	<div id="datagrid1"  class="nui-datagrid" style="width:100%;height:372px;" allowResize="true" frozenStartColumn="0" frozenEndColumn="3" 
	    dataField="licesend" multiSelect="true" pageSize="20" sizeList="[10,20,30,50]" allowAlternating="true"
	    url='com.primeton.mis.contract.csLicense.queryLicesend.biz.ext' >
	    <div property="columns">
		    <!-- <div type="checkcolumn" width="30px"></div> -->
    	    <div field="processinstid" width="80" headerAlign="center" align="center" renderer="onActionRenderer">操作</div>
	        <div field="senddate" width="80" headerAlign="center" align="center" allowSort="true">发送日期</div>
	        <div field="projectname" width="150" headerAlign="center" align="center" allowSort="true">应用系统</div> 
	        <div field="contnum" width="70" headerAlign="center" align="left" allowSort="true">合同编号</div>
	        <div field="contid"  width="70" headerAlign="center"  align="left" allowSort="true" >商务合同号</div>
	    	<div field="salename" width="50" headerAlign="center" align="left" allowSort="true">销售</div>
	    	<div field="inceptperson" width="50" headerAlign="center" align="left" allowSort="true">接收人</div>
	    	<div field="applyempname" width="50" headerAlign="center" align="left" allowSort="true">申请人</div>
	    	<div field="applydate" width="60" headerAlign="center" align="left" allowSort="true">申请日期</div>
	    	<div field="status" width="60" headerAlign="center" align="left" allowSort="true" renderer="onLicStatus">申请状态</div>
	        <div field="remark" width="80" align="left" headerAlign="center" >备注</div> 
	    </div>
	</div>
</div>
</div>
</body>
<script type="text/javascript">
	nui.parse();
	
	var form = new nui.Form("#form1");
	var grid = nui.get("datagrid1");
	<% 
		UserObject user = (UserObject)session.getAttribute("userObject");
		String nowuserid = user.getUserId();
		String nowusername = user.getUserName();
	%>
	var nowusername = '<%=nowusername %>';
	var nowuserid = '<%=nowuserid %>';
	
	init();
	function init(){
		
		//按钮权限的控制
	    //getOpeatorButtonAuth("creatEmpCont_button");//操作按钮权限初始化
	    
	    //机构权限初始化
		//code:对应功能编码，map：对于机构的查询条件			
		var json = {"code":"csLicenseList","map":{"property":"status","op":"=","value":"running"}};
		nui.ajax({
			url:"com.primeton.eos.ame_auth.ame_auth.getownorg1.biz.ext",
			data:json,
			type:'POST',
			contentType:'text/json',
			success:function(text){
				if(text.orgs){
					if(text.orgs.length==0){
						// 没有有权的机构时只能查项目负责人为自己的数据
						nui.get("applyempname").setValue('<%=nowusername %>');
						nui.get("applyempname").setReadOnly(true);
					}
					nui.get("applyemp").setValue('<%=nowuserid %>');
					nui.get("orgseq").setData(text.orgs);
					nui.get("orgids").setValue(text.orgids);
				}else{
					// 没有有权的机构时只能查项目负责人为自己的数据
					nui.get("applyempname").setValue('<%=nowusername %>');
					nui.get("applyempname").setReadOnly(true);
				}
				search();
			}
		});
	}
	function search(){
		var data = form.getData();
		grid.load(data);
		grid.sortBy("senddate","desc");
	}
	
	function onActionRenderer(e) {
        var record = e.record;
    	var sendid=e.record.sendid;
    	var processinstid = e.record.processinstid;
    	var s;
    	if(processinstid){
			s = " <a  href='javascript:void(0)' onclick='getdetailLic(" + sendid +")' title='点击查看'>详情</a>"+" "+" <a  href='javascript:void(0)' onclick='feeView();' title='点击查看'>流程</a>";
    	}else{
    		s = " <a  href='javascript:void(0)' onclick='getdetailLic(" + sendid +")' title='点击查看'>详情</a>";
    	}
        return s;
    }   
    function getdetailLic(sendid){
		var executeUrl = "<%= request.getContextPath() %>/contract/csLicense/csLicenseDetail.jsp?sendid=" + sendid;
		window.open(executeUrl);
	} 
	function feeView(){
        var selectRow = grid.getSelected();
        var processInstID=selectRow.processinstid;
		var url = "<%=request.getContextPath() %>/bps/wfclient/task/processinstView.jsp";
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
					iframe.contentWindow.initData({"processInstID": processInstID});
				}
			},
			ondestroy: function (action){
			}
		});
    }
	
	function onLicStatus(e){
		return nui.getDictText('PC_LICENSE_STATUS',e.value);
	}
</script>
</html>
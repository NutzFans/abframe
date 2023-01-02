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
	<title>采购分包报备查询</title>
	<meta http-equiv="content-type" content="text/html; charset=UTF-8" />
	<script src="<%= request.getContextPath() %>/common/nui/nui.js" type="text/javascript"></script>
</head>
<body>
<div style="width:100%;height:100%;padding:0px;margin:0px;" >
<div class="nui-panel" title="采购分包报备查询" style="width:100%;">
    <div style="width:100%;height:100%;padding:0px;margin:0px;" id="form1">
    	<div class="nui-toolbar" style="border-bottom:0;padding:0px;">
    		<table align="center" border="0" width="100%">
    			<tr>
    				<td align="right">申请人所属机构:</td>
					<td align="left">
						<input id="orgseq"  name="criteria._expr[0]._value"  class="nui-combobox" 
					    textField="orgname" valueField="orgseq" dataField="orgs" showNullItem="true" allowInput="true" style="width:150px;"/>
				        <input class="nui-hidden" name="criteria._expr[0]._property" value="orgseq"/>
				        <input class="nui-hidden" name="criteria._expr[0]._op" value="like"/>
				        <input class="nui-hidden" name="criteria._expr[0]._likeRule" value="end"/>
				        <input class="nui-hidden" name="criteria._or[0]._expr[0]._property" value="orgid"/>
				        <input class="nui-hidden" name="criteria._or[0]._expr[0]._op" value="in"/>
				        <input class="nui-hidden" name="criteria._or[0]._expr[0]._value" id="orgids"/>
				        <input class="nui-hidden" name="criteria._or[0]._expr[1]._value"  style="width: 150px;" id="applyemp"/>
	            		<input class="nui-hidden" name="criteria._or[0]._expr[1]._property" value="applyemp"/>
				        <input class="nui-hidden" name="criteria._or[0]._expr[1]._op" value="="/>
					</td>
					<td align="right">客户:</td>
					<td align="left">
				        <input name="criteria._expr[1]._value" style="width:150px;" class="nui-textbox"  onenter="onKeyEnter" allowInput="true" />
		            	<input class="nui-hidden" name="criteria._expr[1]._property" value="custname"/>
				        <input class="nui-hidden" name="criteria._expr[1]._op" value="like"/>
						<input class="nui-hidden" name="criteria._expr[1]._likeRule" value="all"/>
					</td>
					<td  align = "right">项目名称:</td>
			        <td align="left">
				        <input name="criteria._expr[4]._value" class="nui-textbox" style="width:150px;" onenter="onKeyEnter" allowInput="true"  />
						<input class="nui-hidden" name="criteria._expr[4]._property" value="projectname"/>
						<input class="nui-hidden" name="criteria._expr[4]._op" value="like"/>
						<input class="nui-hidden" name="criteria._expr[4]._likeRule" value="all"/>
			        </td>
					<td  align = "right">申请人:</td>
			        <td align="left">
				      	<input name="criteria._expr[5]._value"  id="applyempname" style="width:205px;" class="nui-textbox" allowInput="true" />
		            	<input class="nui-hidden" name="criteria._expr[5]._property" value="applyempname"/>
				        <input class="nui-hidden" name="criteria._expr[5]._op" value="like"/>
						<input class="nui-hidden" name="criteria._expr[5]._likeRule" value="all"/>
			        </td>
    			</tr>
    			<tr>
    				<td  align = "right">供应商1:</td>
			        <td align="left">
				        <input name="criteria._expr[13]._value"  id="supplier1" style="width:150px;" class="nui-textbox" allowInput="true" />
		            	<input class="nui-hidden" name="criteria._expr[13]._property" value="supplier1"/>
				        <input class="nui-hidden" name="criteria._expr[13]._op" value="like"/>
						<input class="nui-hidden" name="criteria._expr[13]._likeRule" value="all"/>
			        </td>
			        <td align = "right">供应商2:</td>
		         	<td align="left">
		         		<input name="criteria._expr[3]._value"  id="supplier2" style="width:150px;" class="nui-textbox" allowInput="true" />
		            	<input class="nui-hidden" name="criteria._expr[3]._property" value="supplier2"/>
				        <input class="nui-hidden" name="criteria._expr[3]._op" value="like"/>
						<input class="nui-hidden" name="criteria._expr[3]._likeRule" value="all"/>
		          	</td>
			        <td  align = "right">申请状态:</td>
			        <td align="left">
				         <input name="criteria._expr[6]._value" class="nui-dictcombobox" dictTypeId="PURSUBSTATUS" shownullItem="true" multiSelect="true" style="width:150px;" />
						<input class="nui-hidden" name="criteria._expr[6]._property" value="status"/>
						<input class="nui-hidden" name="criteria._expr[6]._op" value="in"/>
			        </td>
					<td align="right">发送日期:</td>
					<td align="left">
						<input class="nui-datepicker" name="criteria._expr[8]._min" style="width:100px"/>-<input class="nui-datepicker" name="criteria._expr[8]._max" style="width:100px"/>
					    <input class="nui-hidden" name="criteria._expr[8]._property" value="applydate"/>
					    <input class="nui-hidden" name="criteria._expr[8]._op" value="between"/>
					    <input class="nui-hidden" name="criteria._expr[8]._pattern" value="yyyy-MM-dd"/>
					</td>
    			</tr>
    			<tr>
    				<td  align = "right">商务对应阶段:</td>
			        <td align="left">
				        <input name="criteria._expr[2]._value"  style="width:150px;" class="nui-dictcombobox" dictTypeId="MIS_PROJOUTSTATUS" shownullItem="true" multiSelect="true"/>
		            	<input class="nui-hidden" name="criteria._expr[2]._property" value="outstatus"/>
						<input class="nui-hidden" name="criteria._expr[2]._op" value="in"/>
			        </td>
			        <td align = "right">分包类型:</td>
		         	<td align="left">
		         		<input name="criteria._expr[7]._value" style="width:150px;" class="nui-dictcombobox" dictTypeId="PURSUBTYPE" shownullItem="true" multiSelect="true" />
		            	<input class="nui-hidden" name="criteria._expr[7]._property" value="subtype"/>
						<input class="nui-hidden" name="criteria._expr[7]._op" value="in"/>
		          	</td>
					<td  align = "right">对应项目编号:</td>
			        <td align="left">
				        <input name="criteria._expr[9]._value" class="nui-textbox" style="width:150px;" onenter="onKeyEnter" allowInput="true"  />
						<input class="nui-hidden" name="criteria._expr[9]._property" value="projectno"/>
						<input class="nui-hidden" name="criteria._expr[9]._op" value="like"/>
						<input class="nui-hidden" name="criteria._expr[9]._likeRule" value="all"/>
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
    <div class="nui-toolbar" style="border-bottom:0;padding:0px;">
        <table style="width:100%;">
        	<tr>
                <td style="width:20%;">
                    <a class="nui-button" id="creatPurSub_button" iconCls="icon-goto" onclick="startPurSub()">发起采购分包报备流程</a>
                </td>
            </tr>
         </table>           
    </div>
	<div id="datagrid1"  class="nui-datagrid" style="width:100%;height:372px;" allowResize="true" frozenStartColumn="0" frozenEndColumn="3" 
	    dataField="purSubConts" multiSelect="true" pageSize="20" sizeList="[10,20,30,50]" allowAlternating="true"
	    url='com.primeton.eos.ame_pur.purSub.queryPurSub.biz.ext' >
	    <div property="columns">
		    <!-- <div type="checkcolumn" width="30px"></div> -->
    	    <div field="processinstid" width="80" headerAlign="center" align="center" renderer="onActionRenderer">操作</div>
	        <div field="custname" width="150" headerAlign="center" align="center" allowSort="true">客户</div>
	        <div field="projectname" width="150" headerAlign="center" align="center" allowSort="true">项目名称</div> 
	        <div field="projectno" width="102" headerAlign="center" align="left" allowSort="true">对应系统项目编号</div>
	        <div field="linprojectname" width="120" headerAlign="center" align="left" allowSort="true">对应系统项目</div>
	        <div field="outstatus"  width="90" headerAlign="center"  align="left" allowSort="true" renderer="getOutStatus">项目对应阶段</div>
	    	<div field="subtype" width="90" headerAlign="center" align="left" allowSort="true" renderer="getPurType">分包类型</div>
	    	<div field="contsum" width="80" headerAlign="center" align="left" allowSort="true" dataType="currency" summaryType="sum">总金额</div>
	    	<div field="prodmon" width="80" headerAlign="center" align="left" allowSort="true" dataType="currency" summaryType="sum">产品金额</div>
	    	<div field="servmon" width="80" headerAlign="center" align="left" allowSort="true" dataType="currency" summaryType="sum">服务金额</div>
	    	<div field="supplier1" width="120" headerAlign="center" align="left" allowSort="true">拟承包供应商1</div>
	    	<div field="purmon1" width="70" headerAlign="center" align="left" allowSort="true" dataType="currency" summaryType="sum">拟采购金额1</div>
	    	<div field="supplier2" width="120" headerAlign="center" align="left" allowSort="true">拟承包供应商2</div>
	    	<div field="purmon2" width="70" headerAlign="center" align="left" allowSort="true" dataType="currency" summaryType="sum">拟采购金额2</div>
	    	<div field="status" width="100" headerAlign="center" align="left" allowSort="true" renderer="onPurStatus">申请状态</div>
	        <div field="applyempname" width="90" headerAlign="center" align="center" allowSort="true">申请人</div> 
	        <div field="applydate" width="100" headerAlign="center" align="center" allowSort="true">申请时间</div> 
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
		var json = {"code":"purSubList","map":{"property":"status","op":"=","value":"running"}};
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
		grid.sortBy("applydate","desc");
	}
	
	function onActionRenderer(e) {
        var record = e.record;
    	var subcontid=e.record.subcontid;
    	var processinstid = e.record.processinstid;
    	var s;
    	if(processinstid){
			s = " <a  href='javascript:void(0)' onclick='getdetailPur(" + subcontid +")' title='点击查看'>详情</a>"+" "+" <a  href='javascript:void(0)' onclick='feeView();' title='点击查看'>流程</a>";
    	}else{
    		s = " <a  href='javascript:void(0)' onclick='getdetailPur(" + subcontid +")' title='点击查看'>详情</a>";
    	}
        return s;
    }   
    function getdetailPur(subcontid){
		var executeUrl = "<%= request.getContextPath() %>/ame_pur/pursub/purSubDetail.jsp?subcontid=" + subcontid;
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
	
	function startPurSub(){
		nui.open({
			url:"<%=request.getContextPath() %>/ame_pur/pursub/creatPurSub.jsp",
			title: '发起采购分包报备流程',
            width: 1120,
            height: 580,
            onload: function () {
            },
            ondestroy: function (action) {
            	if(action == "ok"){
		            grid.reload();
            	}
       	 	}
		});
		
	}
	
	function onPurStatus(e){
		return nui.getDictText('PURSUBSTATUS',e.value);
	}
	
	function getOutStatus(e){
		return nui.getDictText('MIS_PROJOUTSTATUS',e.value);
	}
	function getPurType(e){
		return nui.getDictText('PURSUBTYPE',e.value);
	}
</script>
</html>
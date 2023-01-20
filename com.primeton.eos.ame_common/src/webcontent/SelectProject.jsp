<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@page import="commonj.sdo.DataObject"%>
<%@page import="java.util.HashMap"%>
<%@page import="com.eos.data.datacontext.UserObject"%>
<%@ page import="java.util.Map" %>
<%@page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>

<script src="../common/nui/nui.js" type="text/javascript"></script>
<%@include file="/common/common.jsp"%>
<head>
	<title></title>
	<meta http-equiv="content-type" content="text/html; charset=UTF-8" />
    <link href="../demo.css" rel="stylesheet" type="text/css" />
    <style type="text/css">
    body{
        margin:0;padding:0;border:0;width:100%;height:100%;overflow:hidden;
    }
    </style>	
</head>
<body>
	<!-- 增加了按照项目编号和合同编号查询条件__朱勇伦2016/10/10 -->
	<div class="nui-toolbar" style="text-align:center;" borderStyle="border:0;" id="form1">
    	<input class="nui-hidden" name="sortField" value="projectId"/>
		<input class="nui-hidden" name="sortOrder" value="asc"/>
        <table style="width:100%;">
	    	<tr>
				<td align="right" style="width:90px;"><span>项目名称：</span></td>
	        	<td align="left" style="width:200px;">
				  	<input class="nui-textbox" name="criteria._expr[0]._value" style="width:160px;" />
			        <input class="nui-hidden" name="criteria._expr[0]._property" value="projectName"/>
			        <input class="nui-hidden" name="criteria._expr[0]._op" value="like"/>
			        <input class="nui-hidden" name="criteria._expr[0]._likeRule" value="all"/>
				</td>
				<td align="right" style="width:90px"><span>项目编号：</span></td>
            	<td align="left">
				    <input name="criteria._expr[5]._value" class="nui-textbox" style="width:100px;" />
				    <input class="nui-hidden" name="criteria._expr[5]._property" value="projectno"/>
				    <input class="nui-hidden" name="criteria._expr[5]._op" value="like"/>
				</td>
				<td align="right" style="width:90px"><span>受益部门：</span></td>
				<td align="left">
				    <input name="criteria._expr[2]._value" class="nui-textbox" id="orgname" style="width:100px;" />
				    <input class="nui-hidden" name="criteria._expr[2]._property" value="orgname"/>
				    <input class="nui-hidden" name="criteria._expr[2]._op" value="like"/>
				    <input class="nui-hidden" name="criteria._expr[2]._likeRule" value="all"/>
				</td>
			</tr>
			<tr>
				<td align="right"><span>所属客户：</span></td>
            	<td align="left">
			        <input class="nui-textbox" name="criteria._expr[3]._value" style="width:160px;" />
			        <input class="nui-hidden" name="criteria._expr[3]._property" value="custname"/>
			        <input class="nui-hidden" name="criteria._expr[3]._op" value="like"/>
			        <input class="nui-hidden" name="criteria._expr[3]._likeRule" value="all"/>
				</td>
				<td align="right"><span>项目内部状态：</span></td>
            	<td align="left">
				    <input name="criteria._expr[4]._value" class="nui-dictcombobox" dictTypeId="MIS_PROJSTATUS" shownullItem="true" style="width:100px;" />
				    <input class="nui-hidden" name="criteria._expr[4]._property" value="projectStatus"/>
				    <input class="nui-hidden" name="criteria._expr[4]._op" value="="/>
				</td>
				<td align="right"><span>合同编号：</span></td>
            	<td align="left">
            		<input class="nui-textbox" name="criteria._expr[6]._value" />
				    <input class="nui-hidden" name="criteria._expr[6]._property" value="contnum"/>
				    <input class="nui-hidden" name="criteria._expr[6]._op" value="like"/>
				    <input class="nui-hidden" name="criteria._expr[6]._likeRule" value="all"/>
				</td>
			</tr>
			<tr>
    			<td align="center" colspan="15">
                    <a class="nui-button" id="search" iconCls="icon-search" onclick="search()">查找</a>
                    <a class="nui-button" id="reset" iconCls="icon-reload" onclick="reset()">重置</a>	
               </td>
            </tr>
        </table>      
    </div>
    <div class="nui-fit">
        <div id="grid1" class="nui-datagrid" style="width:100%;height:100%;"
            idField="projectId" allowResize="true" dataField="projects" multiSelect="false"
            borderStyle="border-left:0;border-right:0;" onrowdblclick="onRowDblClick">
            <div property="columns">	    
        		<div type="checkcolumn"></div>
                <div field="projectId" headerAlign="center" allowSort="true" visible="false">项目ID</div>                                            
				<div field="projectno" width="90" headerAlign="center" allowSort="true">项目编号</div>
                <div field="projectName" width="150" headerAlign="center" allowSort="true">项目名称</div>
                <div field="custid"  headerAlign="center" allowSort="true" visible="false">客户ID</div> 
                <div field="custname" width="150" headerAlign="center">所属客户</div>
				<div field="finUnitId"  headerAlign="center" allowSort="true" visible="false">受益部门ID</div>                 
                <div field="orgname" width="55" headerAlign="center" allowSort="true">受益部门</div>   
                <div field="managername" width="55" headerAlign="center" allowSort="true">项目经理</div>
                <div field="projectStatus" renderer="getStatus" width="80" headerAlign="center" allowSort="true">项目内部状态</div>
                <div field="contnum" width="80" headerAlign="center" allowSort="false" visible="true">内部合同编号</div>                                       
            </div>
        </div>
	</div>  
	              
    <div class="nui-toolbar" style="text-align:center;padding-top:8px;padding-bottom:8px;" borderStyle="border:0;">
        <a class="nui-button" style="width:60px;" onclick="onOk()">确定</a>
        <span style="display:inline-block;width:25px;"></span>
        <a class="nui-button" style="width:60px;" onclick="onCancel()">关闭</a>
    </div>

</body>
</html>

<script type="text/javascript">
	nui.parse();
	var url="com.primeton.eos.ame_common.contract.queryProject.biz.ext"
	var grid = nui.get("grid1");
	grid.setUrl(url);

        
	function getUrlParam(name) { 
		var reg = new RegExp("(^|&)" + name + "=([^&]*)(&|$)"); 
		var r = window.location.search.substr(1).match(reg); 
		if (r != null) 
		return unescape(r[2]); 
		return null; 
	}
	//var syb = getUrlParam("syb");
	//结算模块过滤项目操作传入的标识(传入"preSettle"，控制权限；传入"bukongzhi"，可查询到所有项目。)
	var preSettle = getUrlParam("preSettle");
	var custname = '<%=request.getParameter("custname") %>';
	var orgname = '<%=request.getParameter("orgname") %>';
	if(custname=='null'){
		
	}else{
		nui.getbyName("criteria._expr[3]._value").setValue(custname);
		nui.getbyName("criteria._expr[3]._value").setValue(custname);
	}
	if(orgname=='null' || orgname=='undefined'){
	
	}else{
		nui.get("orgname").setValue(orgname);
		nui.get("orgname").disable();
	}
	search();
	function search() {
		if(preSettle){
			//结算模块使用此方法、项目考核使用此方法
			purSettleUse(preSettle);
			return;
		}else{
			<% 
	    		UserObject user = (UserObject)session.getAttribute("userObject");
	    		String userid = user.getUserId();
	    		String username = user.getUserName();
	    		Map attr = user.getAttributes();
	    		Map map = new HashMap();
	    		Boolean rolesroleids = false;	//是否是事业部助理
	    		//角色
	    		DataObject[] roles = (DataObject[])attr.get("roles");
				for(int i=0;i < roles.length;i++){
					if(roles[i].getString("roleid").equals("assistant") || roles[i].getString("roleid").equals("techManager") || roles[i].getString("roleid").equals("viceGeneral")){//是助理
						rolesroleids = true;
					}
				}
	    	%>
			var form = new nui.Form("#form1");
			var data = form.getData(true,true);
			if(preSettle){
				data.iden = preSettle;
			}
			grid.load(data);
			grid.sortBy("createdate", "desc");
		}
	}
	
	//重置
    function reset(){
    	var form = new nui.Form("#form1");
    	form.reset();
		var data = form.getData();
		if(preSettle){
			data.iden = preSettle;
		}
		grid.load(data);
		grid.sortBy("projectName", "asc");
    }
    
	function GetData() {
		var row = grid.getSelected();
		return row;
	}
	 
	function onKeyEnter(e) {
		search();
	}
	    
	function onRowDblClick(e) {
		onOk();
	}

	function CloseWindow(action) {
		if (window.CloseOwnerWindow) return window.CloseOwnerWindow(action);
		else window.close();
	}
	
	function onOk() {
		CloseWindow("ok");
	}
	function onCancel() {
		CloseWindow("cancel");
	} 
	function getSyb(e){
		return nui.getDictText('CONT_ORG',e.value);//设置业务字典值
  	}
  	function getStatus(e) {
		return nui.getDictText('MIS_PROJSTATUS',e.value);//设置业务字典值
  	}
  	
  	//结算模块使用
  	function purSettleUse(e){
  		//不控制权限
		if(preSettle == "bukongzhi"){
			var form = new nui.Form("#form1");
			var data = form.getData();
			grid.load(data);
			grid.sortBy("createdate", "desc");	
		}else if ("purFiling" == preSettle){
			var form = new nui.Form("#form1");
			var data = form.getData();
			data.iden = "purFiling";
			grid.load(data);
			grid.sortBy("createdate", "desc");	
		}else if ("projectScore" == preSettle){
			var form = new nui.Form("#form1");
			var data = form.getData();
			data.iden = "projectScore";
			grid.load(data);
			grid.sortBy("createdate", "desc");	
		}else{
			var form = new nui.Form("#form1");
			var data = form.getData();
			if(preSettle){
				data.iden = preSettle;
			}
			grid.load(data);
			grid.sortBy("createdate", "desc");	
		}
  	}
</script>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@include file="/common/common.jsp"%>
<%@page import="com.eos.data.datacontext.UserObject"%>
<%@page import="commonj.sdo.DataObject"%>
<%@page import="java.util.Map"%>
<html>
<!-- 
  - Author(s):zhang-yb
  - Date: 2018-03-14 11:09:43
  - Description:
-->
<head>
<title>机构人员管理</title>
<meta http-equiv="content-type" content="text/html; charset=UTF-8" />
<script src="<%= request.getContextPath() %>/common/nui/nui.js" type="text/javascript"></script>
<style type="text/css">
	body{margin: 0;padding: 0;width: 100%;height: 100%;background: #f1f8ff;}
</style>
</head>
<body>
<div class="nui-fit">
	<div class="nui-splitter" style="width:100%;height:100%;">
	 	<!-- 左边预算组织机构树 -->
		<div size="25" showCollapseButton="true"> 
			<table id="form1"  style="height: 7%;border-bottom: dashed 1px #909aa6;width: 100%;">
				<tr>
					<td align="left">年:<input class="nui-monthpicker" name="date" style="width: 55px" id='dateTime' onvaluechanged="search()" format="yyyy" />	
					机构:<input class="nui-dictcombobox" id="orgstatus" name="status" style="width: 50px"  onvaluechanged="search()" shownullItem="true" dictTypeId="ABF_ORGSTATUS" onenter="onKeyEnter" value="running"/>
						<%--<input id="orgstatus" name="status" onvaluechanged="search()" class="nui-radiobuttonlist" data="[{id: 'running', text: '有效'}, {id:'cancel' , text: '失效'},{id: '', text: '全部'}]" value='running'/>--%>
					人员:<input  class="nui-dictcombobox" id="empstatus" name="empstatus"  style="width: 50px" onvaluechanged="search()" dictTypeId="ABF_EMPSTATUS" shownullItem="true" onenter="onKeyEnter" value="on"/>
		 				<%--<input id="empstatus" onvaluechanged="search()" name="empstatus" class="nui-radiobuttonlist" data="[{id: 'on', text: '在职'}, {id:'leave', text: '离职'}, {id:'' , text: '全部'}]" value = 'on'/>--%>
					</td>
				</tr>
			</table>
			<!-- 机构树展现  start-->
			<ul id="tree1" class="nui-tree" style="width:100%;height: 85%;padding:5px;"  resultAsTree ="false" expandOnLoad="1" ondrawnode="onDrawNode" 
				showTreeIcon="true"  textField="orgname" dataField="newOrgTree" idField="treeid" onnodeclick="click" onbeforedrop="onNodeBeforeDrop"
				parentField="parentorgid"  contextMenu="#treeMenu" allowDrag="true" allowDrop="true" allowLeafDropIn="true" onbeforeexpand="onbeforeexpand">      
			</ul>
			
			<!-- 机构树操作  start-->
			<ul id="treeMenu"  class="nui-contextmenu"  onbeforeopen="onBeforeOpen">
				<li name="addNext" iconCls="icon-add" id="addNext"  onclick="addNext">增加下级机构</li>
				<li name="addNextW" iconCls="icon-add" id="addNextW"  onclick="addNextW">增加下级岗位</li>
				<li name="addOrgPeopleW" iconCls="icon-add" id="addOrgPeopleW"  onclick="addOrgPeopleW">增加岗位人员</li>
				<li name="editOrgWAuth" iconCls="icon-edit" id="editOrgWAuth"  onclick="editOrgWAuth">维护岗位权限</li>
				<li name="removeThisOrgW" iconCls="icon-remove" id="removeThisOrgW"  onclick="removeThisOrgW">删除本级岗位</li>
				<li name="addOrgPeople" iconCls="icon-add" id="addOrgPeople"  onclick="addOrgPeople">增加机构人员</li>
				<li name="editOrgAuth" iconCls="icon-edit" id="editOrgAuth"  onclick="editOrgAuth">维护机构权限</li>
				<li name="removeThisOrg" iconCls="icon-remove" id="removeThisOrg"  onclick="removeThisOrg">删除本级机构</li>
				
				<li name="editPeopleAuth" iconCls="icon-edit" id="editPeopleAuth"  onclick="editPeopleAuth">维护人员权限</li>
				<li name="setLeaveInfo" iconCls="icon-edit" id="setLeaveInfo"  onclick="setLeaveInfo">设置离职信息</li>
				
				<li name="refresh" iconCls="icon-reload" id="refresh"  onclick="reload">刷新</li>
			</ul>
			<!-- 机构树操作  end-->
		</div>
		<!-- 右边机构详情 -->
		<div size="80" showCollapseButton="true" > 
			<div id="prod_tab" class="nui-tabs" style="width:auto;height:100%">
				<div name="queryOrg" url="<%=request.getContextPath() %>/abframe/org/newOrganization/queryOrg.jsp" title="机构查询" refreshOnClick="true"></div>
				<div name="queryPeople" url="<%=request.getContextPath() %>/abframe/org/newOrganization/queryPeople.jsp" title="人员查询" refreshOnClick="true"></div>
				<div name="peopleMove" url="<%=request.getContextPath() %>/abframe/org/newOrganization/peopleMove.jsp" title="人员数据转移" refreshOnClick="true"></div>
				<div name="peopleExport" url="<%=request.getContextPath() %>/abframe/org/newOrganization/peopleExport.jsp" title="人员数据导出" refreshOnClick="true"></div>
				
				<div name="thisOrg" url="<%=request.getContextPath() %>/abframe/org/newOrganization/thisOrg.jsp" title="本级机构" refreshOnClick="true"></div>
				<div name="orgWinfo" url="<%=request.getContextPath() %>/abframe/org/newOrganization/orgWinfo.jsp" title="岗位信息" refreshOnClick="true"></div>
				<div name="nextOrg" url="<%=request.getContextPath() %>/abframe/org/newOrganization/nextOrg.jsp" title="下级机构" refreshOnClick="true"></div>
				<div name="nextOrgW" url="<%=request.getContextPath() %>/abframe/org/newOrganization/nextOrgW.jsp" title="下级岗位" refreshOnClick="true"></div>
				<div name="peopleInfo" url="<%=request.getContextPath() %>/abframe/org/newOrganization/peopleInfo.jsp" title="人员信息" refreshOnClick="true"></div>
				<div name="authInfo" url="<%=request.getContextPath() %>/abframe/org/newOrganization/authInfo.jsp" title="权限信息" refreshOnClick="true"></div>
				
				<div name="addOrgPerson" url="<%=request.getContextPath() %>/abframe/org/newOrganization/addOrgPerson_zh.jsp" title="基本信息" refreshOnClick="true"></div>
				<div name="myEmpOrg" url="<%=request.getContextPath() %>/abframe/org/emp/myEmpOrg.jsp" title="组织归属" refreshOnClick="true"></div>
				<div name="peopleAuth" url="<%=request.getContextPath() %>/abframe/org/newOrganization/peopleAuth.jsp" title="人员权限" refreshOnClick="true"></div>
			</div>
		</div>
	</div>
</div>
</body>
<script type="text/javascript">
	<%
		UserObject user = (UserObject) session.getAttribute("userObject");
		String username = user.getUserName();
		String userid = user.getUserId();
		Map attr = user.getAttributes();
		String empid = (String) attr.get("empid");
		String operatorid = (String) attr.get("operatorid");
		DataObject[] roles = (DataObject[]) attr.get("roles");
		Boolean isHr = false;
		Boolean isEosAdmin = false;
		Boolean isOrgAdmin = false;
		for(int i=0;i<roles.length;i++){
			if(roles[i].getString("roleid").equals("hr")){//是否人事
				isHr = true;
			}
			if(roles[i].getString("roleid").equals("eosadmin")){//是否系统管理员
				isEosAdmin = true;
			}
			if(roles[i].getString("roleid").equals("orgadmin")){//是否机构管理员
				isOrgAdmin = true;
			}
		}
	
	%>
	nui.parse();
	
	var userid = '<%=userid %>';
	var operatorid = '<%=operatorid %>';
	var tree = nui.get("tree1");
	var freshNode = null;
	var addNode = null;
	var rootNode = tree.getRootNode();
	var tabs = nui.get("prod_tab");
	var orgs = [];//定义变量存储可以查看的机构
	var form = new nui.Form("#form1");
	var isHr = '<%=isHr %>';
	var isEosAdmin = '<%=isEosAdmin %>';
	var isOrgAdmin = '<%=isOrgAdmin %>';
	queryAuth();
	search();
	//查询可以查看的机构
	function queryAuth(){
		nui.get("dateTime").setValue(new Date());//显示当期日期
		nui.ajax({
        	url: "org.gocom.abframe.org.party.PartyManager.queryManagedOrgs.biz.ext",
        	type: 'POST',
        	cache: false,
        	async:false,
        	dataType:"json",
        	success: function (text) {
        		for(var i = 0 ; i < text.orgs.length ; i++){
        			orgs.push(text.orgs[i].orgseq);
        		}
        	}
        });
	}
	
	tabs.updateTab("queryOrg",{visible:true});
	tabs.updateTab("queryPeople",{visible:true});
	if(userid == "0646"){
		tabs.updateTab("peopleMove",{visible:true});
	}else{
		tabs.updateTab("peopleMove",{visible:false});
	}
	tabs.updateTab("peopleExport",{visible:true});
	
	tabs.updateTab("thisOrg",{visible:false});
	tabs.updateTab("orgWinfo",{visible:false});
	tabs.updateTab("nextOrg",{visible:false});
	tabs.updateTab("nextOrgW",{visible:false});
	tabs.updateTab("peopleInfo",{visible:false});
	tabs.updateTab("authInfo",{visible:false});
	
	tabs.updateTab("addOrgPerson",{visible:false});
	tabs.updateTab("myEmpOrg",{visible:false});
	tabs.updateTab("peopleAuth",{visible:false});
	
	//重新初始化树
	function search(){
		var form = new nui.Form("#form1");
		var data = form.getData();
		var year = data.date.getFullYear();
		var startDate = year + '-01-01';
		var endDate = year + '-12-31';
		var json = {empstatus:data.empstatus,status:data.status,startdate:startDate,enddate:endDate};
		nui.ajax({
        	url: "org.gocom.abframe.org.party.PartyManager.newQueryOrgTree.biz.ext",
        	type: 'POST',
        	data:json,
        	dataType:"json",
        	success: function (text) {
        		console.log(text);
        		//加载tree
    			tree.loadList(text.newOrgTree, "treeid", "parentorgid");
        	}
        }); 
	}
	
	//点击树事件
	function click(e){
		var typecode = e.node.typecode;
		var orgseq = e.node.orgseq;
		var orgid = e.node.orgid;
		
		if(typecode == "org"){
    		var ss = checkAuth(orgseq);
    		if(ss == false){
	    		nui.showTips({
		            content: "<b>提示！</b> <br/>您没有权限操作该机构。",
		            state: 'danger',
		            x: 'center',
		            y: 'center',
		            timeout: 3000
	    		});
	    		return false;
    		}
    	}
		
		var parentorgid = e.node.parentorgid;
		var empid = e.node.empid;
		var operatorid = e.node.operatorid;
		if(typecode == "porg"){
			
			tabs.updateTab("queryOrg",{visible:true});
			tabs.updateTab("queryPeople",{visible:true});
			if(userid == "0646"){
				tabs.updateTab("peopleMove",{visible:true});
			}else{
				tabs.updateTab("peopleMove",{visible:false});
			}
			tabs.updateTab("peopleExport",{visible:true});
			
			tabs.updateTab("thisOrg",{visible:false});
			tabs.updateTab("orgWinfo",{visible:false});
			tabs.updateTab("nextOrg",{visible:false});
			tabs.updateTab("nextOrgW",{visible:false});
			tabs.updateTab("peopleInfo",{visible:false});
			tabs.updateTab("authInfo",{visible:false});
			
			tabs.updateTab("addOrgPerson",{visible:false});
			tabs.updateTab("myEmpOrg",{visible:false});
			tabs.updateTab("peopleAuth",{visible:false});
			
			
			tabs.setActiveIndex(0);
			//获取当前激活的机构
			//var tab = tabs.getActiveTab();
			//当切换节点，而又没有切换TAB时，出现未切换的TAB页页面不刷新问题
			for(var i=0;i<tabs.tabs.length;i++){
				var temp_tab = tabs.tabs[i];
				if(temp_tab.title=="机构查询"){
					tabs.loadTab("<%=request.getContextPath() %>/abframe/org/newOrganization/queryOrg.jsp", temp_tab);
				}else if(temp_tab.title=="人员查询"){
					tabs.loadTab("<%=request.getContextPath() %>/abframe/org/newOrganization/queryPeople.jsp", temp_tab);
				}else if(temp_tab.title=="人员数据转移"){
					tabs.loadTab("<%=request.getContextPath() %>/abframe/org/newOrganization/peopleMove.jsp", temp_tab);
				}else if(temp_tab.title=="人员数据导出"){
					tabs.loadTab("<%=request.getContextPath() %>/abframe/org/newOrganization/peopleExport.jsp", temp_tab);
				}
			}
			tabs.reloadTab();
					
		}else if(typecode == "org"){
			tabs.updateTab("queryOrg",{visible:false});
			tabs.updateTab("queryPeople",{visible:false});
			tabs.updateTab("peopleMove",{visible:false});
			tabs.updateTab("peopleExport",{visible:false});
			
			tabs.updateTab("thisOrg",{visible:true});
			tabs.updateTab("orgWinfo",{visible:false});
			tabs.updateTab("nextOrg",{visible:true});
			tabs.updateTab("nextOrgW",{visible:true});
			tabs.updateTab("peopleInfo",{visible:true});
			tabs.updateTab("authInfo",{visible:true});
			
			tabs.updateTab("addOrgPerson",{visible:false});
			tabs.updateTab("myEmpOrg",{visible:false});
			tabs.updateTab("peopleAuth",{visible:false});
			
			tabs.setActiveIndex(4);
			//当切换节点，而又没有切换TAB时，出现未切换的TAB页页面不刷新问题
			for(var i=0; i < tabs.tabs.length; i++){
				var temp_tab = tabs.tabs[i];
				if(temp_tab.title=="本级机构"){
					tabs.loadTab("<%=request.getContextPath() %>/abframe/org/newOrganization/thisOrg.jsp?orgid="+orgid, temp_tab);
				}else if(temp_tab.title=="下级机构"){
					tabs.loadTab("<%=request.getContextPath() %>/abframe/org/newOrganization/nextOrg.jsp?orgid="+orgid, temp_tab);
				}else if(temp_tab.title=="下级岗位"){
					tabs.loadTab("<%=request.getContextPath() %>/abframe/org/newOrganization/nextOrgW.jsp?orgid=&parentorgid="+orgid, temp_tab);
				}else if(temp_tab.title=="人员信息"){
					tabs.loadTab("<%=request.getContextPath() %>/abframe/org/newOrganization/peopleInfo.jsp?orgid="+orgid, temp_tab);
				}else if(temp_tab.title=="权限信息"){
					tabs.loadTab("<%=request.getContextPath() %>/abframe/org/newOrganization/authInfo.jsp?orgid="+orgid, temp_tab);
				}
			}
			tabs.reloadTab();
			
		}else if(typecode == "orgGw"){
			tabs.updateTab("queryOrg",{visible:false});
			tabs.updateTab("queryPeople",{visible:false});
			tabs.updateTab("peopleMove",{visible:false});
			tabs.updateTab("peopleExport",{visible:false});
			
			tabs.updateTab("thisOrg",{visible:false});
			tabs.updateTab("orgWinfo",{visible:true});
			tabs.updateTab("nextOrg",{visible:false});
			tabs.updateTab("nextOrgW",{visible:true});
			tabs.updateTab("peopleInfo",{visible:true});
			tabs.updateTab("authInfo",{visible:true});
			
			tabs.updateTab("addOrgPerson",{visible:false});
			tabs.updateTab("myEmpOrg",{visible:false});
			tabs.updateTab("peopleAuth",{visible:false});
			
			tabs.setActiveIndex(5);
			//当切换节点，而又没有切换TAB时，出现未切换的TAB页页面不刷新问题
			for(var i=0; i < tabs.tabs.length; i++){
				var temp_tab = tabs.tabs[i];
				if(temp_tab.title=="岗位信息"){
					tabs.loadTab("<%=request.getContextPath() %>/abframe/org/newOrganization/orgWinfo.jsp?positionid="+orgid, temp_tab);
				}else if(temp_tab.title=="下级岗位"){
					tabs.loadTab("<%=request.getContextPath() %>/abframe/org/newOrganization/nextOrgW.jsp?orgid="+orgid+"&parentorgid="+parentorgid, temp_tab);
				}else if(temp_tab.title=="人员信息"){
					tabs.loadTab("<%=request.getContextPath() %>/abframe/org/newOrganization/peopleInfo.jsp?orgid="+orgid, temp_tab);
				}else if(temp_tab.title=="权限信息"){
					tabs.loadTab("<%=request.getContextPath() %>/abframe/org/newOrganization/authInfo.jsp?orgid="+orgid, temp_tab);
				}
			}
			tabs.reloadTab();
			
		}else if(typecode == "emp"){
			
			tabs.updateTab("queryOrg",{visible:false});
			tabs.updateTab("queryPeople",{visible:false});
			tabs.updateTab("peopleMove",{visible:false});
			tabs.updateTab("peopleExport",{visible:false});
			
			tabs.updateTab("thisOrg",{visible:false});
			tabs.updateTab("orgWinfo",{visible:false});
			tabs.updateTab("nextOrg",{visible:false});
			tabs.updateTab("nextOrgW",{visible:false});
			tabs.updateTab("peopleInfo",{visible:false});
			tabs.updateTab("authInfo",{visible:false});
			
			tabs.updateTab("addOrgPerson",{visible:true});
			tabs.updateTab("myEmpOrg",{visible:true});
			tabs.updateTab("peopleAuth",{visible:true});
			
			tabs.setActiveIndex(10);
			
			//当切换节点，而又没有切换TAB时，出现未切换的TAB页页面不刷新问题
			for(var i=0; i < tabs.tabs.length; i++){
				var temp_tab = tabs.tabs[i];
				if(temp_tab.title=="基本信息"){
					tabs.loadTab("<%=request.getContextPath() %>/abframe/org/newOrganization/addOrgPerson_zh.jsp?empid="+empid+"&orgid="+orgid+"&status=tree", temp_tab);
				}else if(temp_tab.title=="组织归属"){
					tabs.loadTab("<%=request.getContextPath() %>/abframe/org/emp/myEmpOrg.jsp?empid="+empid, temp_tab);
				}else if(temp_tab.title=="人员权限"){
					tabs.loadTab("<%=request.getContextPath() %>/abframe/org/newOrganization/peopleAuth.jsp?empid="+empid+"&operatorid="+operatorid, temp_tab);
				}
			}
			tabs.reloadTab();
		}
	}
	
	//右键菜单
	function onBeforeOpen(e) {
		if(isHr=='true'||isEosAdmin =='true'||isOrgAdmin =='true'){
			var node = tree.getSelectedNode();
			if (!node) {
		        e.cancel = true;
		        return;
		    }
		    var typecode = node.typecode;
		    var orgid = node.orgid;
		    var orgseq = node.orgseq 
		    if(orgseq==null||orgseq=='null'){
		    	if(node.typecode=="porg"){
			    	nui.get("addNext").show();
			    	nui.get("addNextW").hide();
			    	nui.get("addOrgPeopleW").hide();
			    	nui.get("editOrgWAuth").hide();
			    	nui.get("removeThisOrgW").hide();
			    	nui.get("addOrgPeople").hide();
			    	nui.get("editOrgAuth").hide();
			    	nui.get("removeThisOrg").hide();
			    	nui.get("editPeopleAuth").hide();
			    	nui.get("setLeaveInfo").hide();
			    	nui.get("refresh").show();
			    	e.htmlEvent.preventDefault();
			    }else if(node.typecode=="emp"){
					nui.get("addNext").hide();
			    	nui.get("addNextW").hide();
			    	nui.get("addOrgPeopleW").hide();
			    	nui.get("editOrgWAuth").hide();
			    	nui.get("removeThisOrgW").hide();
			    	nui.get("addOrgPeople").hide();
			    	nui.get("editOrgAuth").hide();
			    	nui.get("removeThisOrg").hide();
			    	nui.get("editPeopleAuth").show();
			    	nui.get("setLeaveInfo").show();
			    	nui.get("refresh").hide();
				}
		    	return;
		    }
		    var ss = checkAuth(orgseq);
		    if(ss == false ){
		    	if(typecode == "emp"){
		    		nui.showTips({
			            content: "<b>提示！</b> <br/>您没有权限查看该人员信息。",
			            state: 'danger',
			            x: 'center',
			            y: 'center',
			            timeout: 3000
		    		});
		    	}else{
		    		nui.showTips({
			            content: "<b>提示！</b> <br/>您没有权限操作该机构。",
			            state: 'danger',
			            x: 'center',
			            y: 'center',
			            timeout: 3000
		    		});
		    	}
		    	e.cancel = true;
			}
		    
		    
		    if(node.typecode=="org"){
				nui.get("addNext").show();
		    	nui.get("addNextW").show();
		    	nui.get("addOrgPeopleW").hide();
		    	nui.get("editOrgWAuth").hide();
		    	nui.get("removeThisOrgW").hide();
		    	nui.get("addOrgPeople").show();
		    	nui.get("editOrgAuth").show();
		    	nui.get("removeThisOrg").show();
		    	nui.get("editPeopleAuth").hide();
		    	nui.get("setLeaveInfo").hide();
		    	nui.get("refresh").show();
			}else if(node.typecode=="orgGw"){
				nui.get("addNext").hide();
		    	nui.get("addNextW").show();
		    	nui.get("addOrgPeopleW").show();
		    	nui.get("editOrgWAuth").show();
		    	nui.get("removeThisOrgW").show();
		    	nui.get("addOrgPeople").hide();
		    	nui.get("editOrgAuth").hide();
		    	nui.get("removeThisOrg").hide();
		    	nui.get("editPeopleAuth").hide();
		    	nui.get("setLeaveInfo").hide();
		    	nui.get("refresh").show();
			}
		}else{
			e.cancel = true;
		}
	    e.htmlEvent.preventDefault();
	}
	
	//定义两个全局变量记录移动前的from和to节点,用于更新节点的subcount属性，
	//因为移动后不会重新load这两个节点，否则需要重新load整棵树或者他们的父节点才能更新节点属性，这样树的展现方式不太友好
	var fromNode = null;
	var toNode = null;
	var parentNode = null;
	
	function onNodeBeforeDrop(e){
		if(isHr=='true'||isEosAdmin =='true'||isOrgAdmin =='true'){
			fromNode = e.dragNode;
			toNode =e.dropNode;
			var typecode = fromNode.typecode;
			//var orgseq = fromNode.orgseq;
			var orgid = fromNode.orgid;
<%--			var ss = checkAuth(orgseq);
			if(ss == false ){
				e.cancel = true;
		    	if(typecode == "emp"){
		    		nui.showTips({
			            content: "<b>提示！</b> <br/>您没有权限查看该人员信息。",
			            state: 'warning',
			            x: 'center',
			            y: 'center',
			            timeout: 3000
		    		});
		    		return;
		    	}else{
		    		nui.showTips({
			            content: "<b>提示！</b> <br/>您没有权限操作该机构。",
			            state: 'warning',
			            x: 'center',
			            y: 'center',
			            timeout: 3000
		    		});
		    		return;
		    	}
			}
--%>			
			parentNode = tree.getParentNode(fromNode);
			if(toNode.typecode=="porg"){
				e.cancel = true;
			}else{
				if(fromNode.typecode == 'emp'){
					e.cancel=true;
					var moveUrl = "<%=request.getContextPath() %>/abframe/org/newOrganization/moveNode.jsp";
			        nui.open({
			            url: moveUrl,
			            title: "移动节点", 
			            width:550,
			            height:380,
			            onload: function () {
			            	var json = {empid:fromNode.empid,orgid:fromNode.orgid,toorgid:toNode.orgid}
			            	var iframe = this.getIFrameEl();
	     					iframe.contentWindow.search(json);
			            },
			            ondestroy: function (action) {
			            	if(action == "ok"){
			            		var iframe = this.getIFrameEl();
								var data = iframe.contentWindow.getData();
								data = nui.clone(data);   
								peopleDrag(data);
			            	}
			            }
			        });
				}else{
					e.cancel = true;
					var moveUrl = "<%=request.getContextPath() %>/abframe/org/newOrganization/moveOrgNode.jsp";
			        nui.open({
			            url: moveUrl,
			            title: "移动节点", 
			            width:300,
			            height:200,
			            onload: function () {
			            	<%--var json = {empid:fromNode.orgid,orgid:fromNode.parentorgid}
			            	var iframe = this.getIFrameEl();
	     					iframe.contentWindow.search(json);--%>
			            },
			            ondestroy: function (action) {
			            	if(action == "ok"){
			            		var iframe = this.getIFrameEl();
								var data = iframe.contentWindow.getData();
								data = nui.clone(data);   
								orgDrag(data);
			            	}
			            }
			        });
				}
				<%--if(confirm("确认要将'"+fromNode.orgname+"'移动到'"+toNode.orgname+"'下面吗？")){
					menuDrag(e);
				}else{
					e.cancel=true;
				}--%>
			}
		}else{
			e.cancel=true;
		}
	}
	
	
	//实现拖拽功能——移动/复制人员到机构或者岗位
	function peopleDrag(data){
		var text;		
		if(data.newEmpprop == "0"){
			text = data.opertion + data.indatea + data.newEmpprop+'.00';
		}else if(data.newEmpprop.length == 3){
			text = data.opertion + data.indatea + data.newEmpprop+'0';
		}else{
			text = data.opertion + data.indatea + data.newEmpprop;
		}
		var level;
		if(data.level){
			level = data.level
		}
		var nature = data.nature;
		var degree = data.degree;
		var inplace=data.inplace;
		var manager=data.manager;
		var inpositionname=data.inpositionname;
		var operate1=data.operate1;
		var positionname=data.positionname;
		//获取当前选择的节点
		var json = nui.encode({'to':toNode,'from':parentNode,'isMoveOrCopy':text,'oaEmp':fromNode,'level':level,'nature':nature,'degree':degree,'inpositionname':inpositionname,'inplace':inplace,'manager':manager,operate1:operate1,'positionname':positionname});
		$.ajax({ 
            url: "org.gocom.abframe.org.organization.OrgManager.moveEmpToOrg.biz.ext",
            type: 'POST',
            data: json,
            cache: false,
            contentType:'text/json',
            cache: false,
            success: function (text) {
            	var retCode = text.retCode;
            	if(retCode == 0){
            		nui.alert("节点操作成功。");
            		search();
            		return;
            	}else{
            		nui.alert("节点操作失败，请联系信息技术部。");
            	}
            }
     	});
		
	}
	
	
	//实现拖拽功能——移动/复制机构到机构或者岗位
	function orgDrag(data){
		var text = data.opertion + data.indatea + data.newEmpprop;
		//获取当前选择的节点
		var json = nui.encode({'to':toNode,'from':parentNode,'isMoveOrCopy':text,'oaOrg':fromNode});
		
		$.ajax({ 
            url: "org.gocom.abframe.org.organization.OrgManager.copyOrMoveOrgFromOrgToOrg.biz.ext",
            type: 'POST',
            data: json,
            cache: false,
            contentType:'text/json',
            cache: false,
            success: function (text) {
            	var iRtn = text.iRtn;
            	if(iRtn == 0){
            		nui.alert("节点操作成功");
            		search();
            		return;
            	}else{
            		nui.alert("节点操作失败，请联系信息技术部。");
            	}
            }
     	});	
		
	}
	
	
	
	//设置图标
	function onDrawNode(e) {
        var isLeaf= e.isLeaf;
    	var typecode = e.node.typecode;
    	if(typecode=='porg'){
    		e.img = "/default/common/skins/styles/default/images/abf/org-tree.png";
    	}else if(typecode=='org'){
            e.img = "/default/common/skins/styles/default/images/abf/org-org.png";
        }else if(typecode=='orgGw'){
            e.img = "/default/common/skins/styles/default/images/abf/group.png";
        }else{
        	if(e.node.empstatus == 'on'){
        		if(e.node.gender == 'm'){
	            	e.img = "/default/common/skins/styles/default/images/abf/on-man.png";
	            }else{
	            	e.img = "/default/common/skins/styles/default/images/abf/on-women.png";
	            }
        	}else{
        		if(e.node.gender == 'm'){
	            	e.img = "/default/common/skins/styles/default/images/abf/leave-man.png";
	            }else{
	            	e.img = "/default/common/skins/styles/default/images/abf/leave-women.png";
	            }
        	}
            
        }
    }
    //增加下级机构
    function addNext(){
	 	var node = tree.getSelectedNode();
	 	var orgid = node.orgid;
		var addUrl = "<%=request.getContextPath() %>/abframe/org/newOrganization/thisOrg.jsp?orgid="+orgid+"&status=0";
        nui.open({
            url: addUrl,
            title: "新增下级机构", 
            width:800,
            height:500,
            onload: function () {
        		<%--var iframe = this.getIFrameEl();
             	iframe.contentWindow.setData(0);--%>
            },
            ondestroy: function (action) {
            	if (action == "save") {
            		nui.alert("新增成功。");
            		queryAuth();
                	search();
	            }
            }
        });
    }
    //增加下级岗位
    function addNextW(){
		var node = tree.getSelectedNode();
	 	var parentorgid = node.orgid;
		var addUrl = "<%=request.getContextPath() %>/abframe/org/newOrganization/orgWinfo.jsp?status=0&positionid="+parentorgid;
        nui.open({
            url: addUrl,
            title: "新增下级岗位", 
            width:750,
            height:280,
            onload: function () {
        		var iframe = this.getIFrameEl();
             	iframe.contentWindow.setData(0);
            },
            ondestroy: function (action) {
            	if (action == "save") {
            		nui.alert("新增成功。")
            		queryAuth();
                	search();
	            }
            }
        });
    }

	//增加岗位人员
	function addOrgPeopleW(){
		var node = tree.getSelectedNode();
	 	var orgid = node.orgid;
	 	var addUrl = "<%=request.getContextPath() %>/abframe/org/newOrganization/addOrgPerson_zh.jsp?orgid="+orgid+"&empid=";
        nui.open({
            url: addUrl,
            title: "新增人员信息", 
            width:800,
            height:500,
            onload: function () {
        		//var iframe = this.getIFrameEl();
             	//iframe.contentWindow.setData(0);
            },
            ondestroy: function (action) {
            	if (action == "save") {
                	search();
	            }
            }
        });
	}
	
	//维护岗位权限
	function editOrgWAuth(){
		var node = tree.getSelectedNode();
    	var orgid = node.orgid;
    	var addUrl = "<%=request.getContextPath() %>/abframe/org/newOrganization/authInfo.jsp?orgid="+orgid;
        nui.open({
            url: addUrl,
            title: "维护岗位权限", 
            width:800,
            height:500,
            onload: function () {
        		//var iframe = this.getIFrameEl();
             	//iframe.contentWindow.setData(0);
            },
            ondestroy: function (action) {
            	if (action == "save") {
                	search();
	            }
            }
        });
	}
	
	//删除本级岗位
	function removeThisOrgW(){
		var node = tree.getSelectedNode();
    	var orgid = node.orgid;
    	var orgseq = node.orgseq;
		nui.confirm("确定删除该岗位？", "确定？",
            function (action) {
                if (action == "ok") {
                	var json = {positionid:orgid,positionseq:orgseq}
                	var arr = [];
                	arr.push(json);
                    json = {pos:arr};
					nui.ajax({
						url:'org.gocom.abframe.org.position.PositionManager.deletePositions.biz.ext',
						data:json,
						type:'post',
						dataType:'json',
						success:function(res){
							if(res.retCode){
								nui.alert("删除成功。");
								search();
							}
						},
					})
                } else {
                    return;
                }
            }
        );
	}
    
    //增加机构人员
    function addOrgPeople(){
    	var node = tree.getSelectedNode();
	 	var orgid = node.orgid;
	 	var addUrl = "<%=request.getContextPath() %>/abframe/org/newOrganization/addOrgPerson_zh.jsp?orgid="+orgid+"&empid=";
        nui.open({
            url: addUrl,
            title: "新增人员信息", 
            width:800,
            height:500,
            onload: function () {
        		//var iframe = this.getIFrameEl();
             	//iframe.contentWindow.setData(0);
            },
            ondestroy: function (action) {
            	if (action == "save") {
                	search();
	            }
            }
        });
    }
    
    //维护机构权限
    function editOrgAuth(){
    	var node = tree.getSelectedNode();
    	var orgid = node.orgid;
    	var addUrl = "<%=request.getContextPath() %>/abframe/org/newOrganization/authInfo.jsp?orgid="+orgid;
        nui.open({
            url: addUrl,
            title: "维护机构权限", 
            width:800,
            height:500,
            onload: function () {
        		//var iframe = this.getIFrameEl();
             	//iframe.contentWindow.setData(0);
            },
            ondestroy: function (action) {
            	if (action == "save") {
                	search();
	            }
            }
        });
    }
    
    //删除本机机构
    function removeThisOrg(){
    	var node = tree.getSelectedNode();
    	if(node.children){
    		nui.alert("请删除此部门下的成员或子部门后，再删除此部门");
    		return;
    	}
    	var orgid = node.orgid;
    	var orgseq = node.orgseq;
    	var orgname = node.orgname;
    	var json = {oRmvOrg:{orgid:orgid,orgname:orgname,orgseq:orgseq}};
    	nui.confirm("删除所选项，将删除该选项的所有子选项？", "确定？",  
    		function (action) {
	  			if (action == "ok") {
		    		nui.ajax({
			        	url: "org.gocom.abframe.org.organization.OrgManager.removeOrg.biz.ext",
			        	type: 'POST',
			        	cache: false,
			        	data:json,
			        	dataType:"json",
			        	success: function (text) {
			        		if(text.iRtn=='0'){
			        			if(text.wxresult){
		    						nui.alert("删除成功,但机构微信企业号未能成功同步,错误原因："+nui.getDictText('AME_WE_STATUS',text.wxresult));
		    					}else{
		    						nui.alert("删除成功。");
		    					}
			        			search();
			        		}else{
			        			nui.alert("删除失败，请联系信息技术部。");
			        		}
			        	}
			        });
		        }else {
                    return;
                }
	        }
		)
    }
    
    //维护人员权限
    function editPeopleAuth(){
    	var node = tree.getSelectedNode();
    	var empid = node.empid;
    	var operatorid = node.operatorid;
    	var addUrl = "<%=request.getContextPath() %>/abframe/org/newOrganization/peopleAuth.jsp?empid="+empid+"&operatorid="+operatorid;
        nui.open({
            url: addUrl,
            title: "维护人员权限", 
            width:800,
            height:500,
            onload: function () {
        		//var iframe = this.getIFrameEl();
             	//iframe.contentWindow.setData(0);
            },
            ondestroy: function (action) {
            	if (action == "save") {
                	search();
	            }
            }
        });
    }
    
     //设置离职信息
    function setLeaveInfo(){
    	var node = tree.getSelectedNode();
    	var empid = node.empid;
    	var addUrl = "<%=request.getContextPath() %>/abframe/org/emp/updateLeave.jsp?empid="+empid;
        nui.open({
            url: addUrl,
            title: "维护人员权限", 
            width:800,
            height:500,
            onload: function () {
        		//var iframe = this.getIFrameEl();
             	//iframe.contentWindow.setData(0);
            },
            ondestroy: function (action) {
            	if (action == "save") {
                	search();
	            }
            }
        });
    }
    
    
    function onbeforeexpand(e){
    	var typecode = e.node.typecode;
		var orgseq = e.node.orgseq;
		if(typecode != 'porg'){
			var ss = checkAuth(orgseq);
		}else{
			return;
		}
		if(ss == false ){
			if(typecode != "emp" ){
				e.cancel = true;
				nui.showTips({
		            content: "<b>提示！</b> <br/>您没有权限查看该机构。",
		            state: 'danger',
		            x: 'center',
		            y: 'center',
		            timeout: 3000
	    		});
				return false;
			}
		}
    	
    }
    
    function reload(){
    	queryAuth();
    	search();
    }
    
    //判断用户是否有权操作机构
    function checkAuth(orgseq){
      for(var i=0;i<orgs.length;i++){
          if(orgs[i].indexOf(orgseq) !=-1 || orgseq.indexOf(orgs[i]) !=-1 ){
             return true;
          }
      }
      return false;
    }
    <%--function contains(arr, obj) { 
    	if(obj=='0'){
    		return true;
    	} 
	    var i = arr.length;  
	    while (i--) {  
	        if (arr[i] === obj) {  
	            return true;  
	        }  
	    }  
	    return false;  
	}--%>
	
	var parserDate = function (date) {  
	    var t = Date.parse(date);  
	    if (!isNaN(t)) {  
	        return new Date(Date.parse(date.replace(/-/g, "/")));  
	    } else {  
	        return new Date();  
	    }  
	}; 
	
	//选中树节点的某个人
    top["win"]=window;
	function returnMsg(e){
		var orgseq = e.row.orgseq;
		var ss = checkAuth(orgseq);
		if(!ss){
			return false;
		}
		var empid = e.row.empid;
		var node = tree.getNode('E'+empid.toString());
		tree.selectNode(node);
		tree.expandPath(node);
		//
	}
	
	//选中树中的某个组织机构
	function returnMsg2(e){
		var orgseq = e.row.orgseq;
		var orgid = e.row.orgid;
		var ss = checkAuth(orgseq);
		if(!ss){
			return false;
		}
		var node = tree.getNode(orgid.toString());
		tree.selectNode(node);
		tree.expandPath(node);
	}
	//双击人员列表tab加载该人员数据
	function returnMsgB(e){
		var orgseq = e.row.orgseq;
		var ss = checkAuth(orgseq);
		if(!ss){
			return false;
		}
		var empid = e.row.empid;
		var node = tree.getNode('E'+empid.toString());
		tree.selectNode(node);
		var orgid = node.orgid;
		var empid = node.empid;
		var operatorid = node.operatorid;
		tabs.updateTab("queryOrg",{visible:false});
		tabs.updateTab("queryPeople",{visible:false});
		tabs.updateTab("peopleMove",{visible:false});
		tabs.updateTab("peopleExport",{visible:false});
		
		tabs.updateTab("thisOrg",{visible:false});
		tabs.updateTab("orgWinfo",{visible:false});
		tabs.updateTab("nextOrg",{visible:false});
		tabs.updateTab("nextOrgW",{visible:false});
		tabs.updateTab("peopleInfo",{visible:false});
		tabs.updateTab("authInfo",{visible:false});
		
		tabs.updateTab("addOrgPerson",{visible:true});
		tabs.updateTab("myEmpOrg",{visible:true});
		tabs.updateTab("peopleAuth",{visible:true});
		
		tabs.setActiveIndex(10);
		
		//当切换节点，而又没有切换TAB时，出现未切换的TAB页页面不刷新问题
		for(var i=0; i < tabs.tabs.length; i++){
			var temp_tab = tabs.tabs[i];
			if(temp_tab.title=="基本信息"){
				tabs.loadTab("<%=request.getContextPath() %>/abframe/org/newOrganization/addOrgPerson_zh.jsp?empid="+empid+"&orgid="+orgid+"&status=tree", temp_tab);
			}else if(temp_tab.title=="组织归属"){
				tabs.loadTab("<%=request.getContextPath() %>/abframe/org/emp/myEmpOrg.jsp?empid="+empid, temp_tab);
			}else if(temp_tab.title=="人员权限"){
				tabs.loadTab("<%=request.getContextPath() %>/abframe/org/newOrganization/peopleAuth.jsp?empid="+empid+"&operatorid="+operatorid, temp_tab);
			}
		}
		tabs.reloadTab();
	}
	
	
	//双击机构列表tab加载该人员数据
	function returnMsgB2(e){
		var orgseq = e.row.orgseq;
		var orgid = e.row.orgid;
		var ss = checkAuth(orgseq);
		if(!ss){
			return false;
		}
		var node = tree.getNode(orgid.toString());
		tree.selectNode(node);
		
		tabs.updateTab("queryOrg",{visible:false});
		tabs.updateTab("queryPeople",{visible:false});
		tabs.updateTab("peopleMove",{visible:false});
		tabs.updateTab("peopleExport",{visible:false});
		
		tabs.updateTab("thisOrg",{visible:true});
		tabs.updateTab("orgWinfo",{visible:false});
		tabs.updateTab("nextOrg",{visible:true});
		tabs.updateTab("nextOrgW",{visible:true});
		tabs.updateTab("peopleInfo",{visible:true});
		tabs.updateTab("authInfo",{visible:true});
		
		tabs.updateTab("addOrgPerson",{visible:false});
		tabs.updateTab("myEmpOrg",{visible:false});
		tabs.updateTab("peopleAuth",{visible:false});
		
		tabs.setActiveIndex(4);
		//当切换节点，而又没有切换TAB时，出现未切换的TAB页页面不刷新问题
		for(var i=0; i < tabs.tabs.length; i++){
			var temp_tab = tabs.tabs[i];
			if(temp_tab.title=="本级机构"){
				tabs.loadTab("<%=request.getContextPath() %>/abframe/org/newOrganization/thisOrg.jsp?orgid="+orgid, temp_tab);
			}else if(temp_tab.title=="下级机构"){
				tabs.loadTab("<%=request.getContextPath() %>/abframe/org/newOrganization/nextOrg.jsp?orgid="+orgid, temp_tab);
			}else if(temp_tab.title=="下级岗位"){
				tabs.loadTab("<%=request.getContextPath() %>/abframe/org/newOrganization/nextOrgW.jsp?orgid=&parentorgid="+orgid, temp_tab);
			}else if(temp_tab.title=="人员信息"){
				tabs.loadTab("<%=request.getContextPath() %>/abframe/org/newOrganization/peopleInfo.jsp?orgid="+orgid, temp_tab);
			}else if(temp_tab.title=="权限信息"){
				tabs.loadTab("<%=request.getContextPath() %>/abframe/org/newOrganization/authInfo.jsp?orgid="+orgid, temp_tab);
			}
		}
		tabs.reloadTab();
	}
</script>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>	
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@include file="/common/common.jsp"%>
<html>
<!-- 
  - Author(s): mengyy
  - Date: 2019-01-21 14:19:18
  - Description:
-->
<head>
	<title>新增机构人员</title>
	<meta http-equiv="content-type" content="text/html; charset=UTF-8" />
	<script src="<%= request.getContextPath() %>/common/nui/nui.js" type="text/javascript"></script>
	<style type="text/css">
		body{margin: 0;padding: 0;width: 100%;height: 100%;}
	</style>
</head>
<body>
	<div class="nui-fit">
		<div class="nui-splitter" style="width:100%;height:100%;">
			<div size="40" showCollapseButton="true">
				<div id="form1" class="nui-toolbar" >
					<table style="height: 7%;border-bottom: dashed 1px #909aa6;width: 100%;">
						<tr>
							<td align="left">年:<input class="nui-monthpicker" name="date" style="width: 55px" id='dateTime' onvaluechanged="search()" format="yyyy" />	
							机构:<input class="nui-dictcombobox" id="orgstatus" name="status" style="width: 50px"  onvaluechanged="search()" shownullItem="true" dictTypeId="ABF_ORGSTATUS" onenter="onKeyEnter" value="running"/>
							</td>
						</tr>
					</table>
		        </div>
				<!-- 机构树展现  start-->
				<ul id="tree1" class="nui-tree" style="width:100%;height: 80%;padding:5px;"  resultAsTree ="false" expandOnLoad="1" ondrawnode="onDrawNode" 
					showTreeIcon="true"  textField="orgname" dataField="newOrgTree" idField="treeid" onnodeclick="click"
					parentField="parentorgid"  contextMenu="#treeMenu" allowDrag="true" allowDrop="true" allowLeafDropIn="true">      
				</ul>
			</div>
			<div size="60" showCollapseButton="true"> 
				<div class="nui-toolbar" id="form2" >
					<table style="width:100%;">
						<tr>
							<td id="tagname">
								&nbsp;
							</td>
						</tr>
		            </table> 
		        </div>
				<div id="employee_grid" class="nui-datagrid" style="width:100%;height:422px;" dataField="operList" allowAlternating="true" pageSize="false"
		        url="com.primeton.eos.ame_common.wxTagManage.queryOrgUsers.biz.ext" showPager="false"  multiSelect="true" ondrawcell="isIn">
			        <div property="columns">
			        	<div type="checkcolumn"></div>
			        	<div field="empcode" width="0" headerAlign="center" align="center">工号</div>
			            <div field="userid" width="60" headerAlign="center" align="center">登录名称</div>
			            <div field="empname" width="60" headerAlign="center" align="center">操作员名称</div>
			            <div field="orgname" width="80" headerAlign="center" align="center">所属机构</div>
			        </div>
			    </div>  	
			</div>
		</div>
	</div>

	<div class="nui-toolbar" style="text-align:center;padding-top:8px;padding-bottom:8px;" borderStyle="border:0;">
        <a class="nui-button" style="width:60px;" onclick="onOk()">确定</a>
        <span style="display:inline-block;width:25px;"></span>
        <a class="nui-button" style="width:60px;" onclick="onCancel()">取消</a>
    </div>
</body>
<script type="text/javascript">
	nui.parse();
	
	var tagid = null;//tagid
	var form = new nui.Form("#form1");
	var tree = nui.get("tree1");
	var employee_grid = nui.get("employee_grid");
	var tagUserList = [];//
	var type = 0;//判断是点击机构还是多选人员
	
	function SetData(data){
		tagid = data.tagid;
		viewTagUsers();
	}
	search();
	//重新初始化树
	function search(){
		nui.get("dateTime").setValue(new Date());//显示当期日期
		var data = form.getData();
		var year = data.date.getFullYear();
		var startDate = year + '-01-01';
		var endDate = year + '-12-31';
		var json = {status:data.status,startdate:startDate,enddate:endDate};
		nui.ajax({
        	url: "com.primeton.eos.ame_common.wxTagManage.queryOrgTree.biz.ext",
        	type: 'POST',
        	data:json,
        	dataType:"json",
        	success: function (text) {
        		//加载tree
    			tree.loadList(text.newOrgTree, "treeid", "parentorgid");
        	}
        });
	}
	
	//查看该标签成员列表
	function viewTagUsers(){
		var json = {tagid:tagid};
		nui.ajax({
			url: "com.primeton.eos.ame_common.wxTagManage.queryTagUsers.biz.ext",
            type: "post",
            cache: false,
            data:json,
            async:false,
            success: function (o) {
            	//将用户名拼成数组
            	var userList = eval('(' + o.userlist + ')');
            	for(var i = 0 ; i < userList.length ; i++){
            		tagUserList.push(userList[i].userid);
            	}
            }
		})
	}
	function click(e){
		var typecode = e.node.typecode;
		console.log(e.node);
		var orgseq = e.node.orgseq;
		var json =  {"criteria":{"_expr":[{"_value":orgseq,"_property":"orgseq","_op":"like","_likeRule":"end"},{"_value":"on","_property":"empstatus","_op":"="}]}};
        if (orgseq) {
            employee_grid.load(json);
        }
	}
	
	function isIn(e){
    	if(e.field == "userid"){
			if(contains(tagUserList,e.record.userid)){
				e.rowStyle = "display:none";
			}
		}
    }
    
    //判断是否在数组中已经存在
 	function contains(arr, obj) { 
    	if(obj=='0'){
    		return true;
    	} 
	    var i = arr.length;  
	    while (i--){  
	        if (arr[i] === obj) {  
	            return true;  
	        }  
	    }  
	    return false;  
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
        }
    }
	//为母页面做返回数据使用
	function GetData() {
		var row = employee_grid.getSelecteds();
		return row;
	}
	
	//确认按钮
	function onOk(){
		CloseWindow("ok");
	}
	
	//取消按钮
	function onCancel(){
		CloseWindow("cancel");
	}
	
	//关闭窗口
	function CloseWindow(action) {
		if (window.CloseOwnerWindow) return window.CloseOwnerWindow(action);
		else window.close();
	}
</script>
</html>
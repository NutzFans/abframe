<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ page import="com.eos.data.datacontext.UserObject"%>
<%@ page import="commonj.sdo.DataObject" %>
<%@ page import="java.util.Map" %>
<html>
<!-- 
  - Author(s): zhuhx
  - Date: 2017-08-31 16:41:29
  - Description:
-->
<head>
<title>部门权限控制示例</title>
<meta http-equiv="content-type" content="text/html; charset=UTF-8" />
<script src="<%= request.getContextPath() %>/common/nui/nui.js" type="text/javascript"></script>
</head>
<body>
<div class="nui-fix">
	<div class="nui-panel" title="部门" style="width:100%;">
        <div style="width:100%;height:100%;padding:0px;margin:0px;" id="form1">
        	<div class="nui-toolbar" style="border-bottom:0;padding:0px;">
        		<table align="center" border="0" width="100%">
        			<tr>
						<td align="right">部门:</td>
						<!-- 用树形展示 -->
						<td align="left">
					       <input id="orgid"  name="criteria._expr[1]._value"  style="width:200px;" class="nui-treeselect" 
							textField="orgname" valueField="orgid" parentField="parentorgid" dataField="orgs" showTreeIcon="true" valueFromSelect="true"
							showNullItem="true" multiSelect="true" checkRecursive = "true" expandOnLoad="true" showFolderCheckBox="true"/>
			            	<input class="nui-hidden" name="criteria._expr[1]._property" value="orgid"/>
					        <input class="nui-hidden" name="criteria._expr[1]._op" value="in"/>
					        <input class="nui-hidden" name="criteria._expr[2]._property" value="orgid"/>
					        <input class="nui-hidden" name="criteria._expr[2]._op" value="in"/>
					        <input class="nui-hidden" name="criteria._expr[2]._value" id="orgids"/>
						</td>
						<!-- 结果集既有orgid又有orgseq的并且用combobox展示 -->
						<td align="left">
					       <input id="orgid1"  name="criteria._expr[1]._value" style="width:200px;" class="nui-combobox" 
							textField="orgname" valueField="orgseq" dataField="orgs" showNullItem="true" allowInput="true"/>
			            	<input class="nui-hidden" name="criteria._expr[1]._property" value="orgseq"/>
					        <input class="nui-hidden" name="criteria._expr[1]._op" value="like"/>
					        <input class="nui-hidden" name="criteria._expr[1]._likeRule" value="end"/>
					        <input class="nui-hidden" name="criteria._expr[2]._property" value="orgid"/>
					        <input class="nui-hidden" name="criteria._expr[2]._op" value="in"/>
					        <input class="nui-hidden" name="criteria._expr[2]._value" id="orgids1"/>
						</td>
						<!-- 结果集只有orgid的并且用combobox展示 -->
						<td>
							<input id="orgid2"  name="criteria._ref[1]._expr[0]._value" style="width:200px;" class="nui-combobox" 
							textField="orgname" valueField="orgseq" dataField="orgs" showNullItem="true" allowInput="true"/>
		            		<input class="nui-hidden" name="criteria._expr[1]._property" value="orgid"/>
					        <input class="nui-hidden" name="criteria._expr[1]._op" value="in" id="tempCond1"/>
					        <input class="nui-hidden" name="criteria._expr[1]._ref" value="1" id="tempCond2"/>
					        <input class="nui-hidden" name="criteria._ref[1]._id" value="1"/>
					        <input class="nui-hidden" name="criteria._ref[1]._entity" value="org.gocom.abframe.dataset.organization.OmOrganization"/>
					        <input class="nui-hidden" name="criteria._ref[1]._select._field[0]" value="orgid"/>
					        <input class="nui-hidden" name="criteria._ref[1]._expr[0]._property" value="orgseq"/>
					        <input class="nui-hidden" name="criteria._ref[1]._expr[0]._op" value="like"/>
					        <input class="nui-hidden" name="criteria._ref[1]._expr[0]._likeRule" value="end"/>
					        <input class="nui-hidden" name="criteria._expr[2]._property" value="orgid"/>
					        <input class="nui-hidden" name="criteria._expr[2]._op" value="in"/>
					        <input class="nui-hidden" name="criteria._expr[2]._value" id="orgids2"/>
						</td>
        			</tr>
        			<tr>
		    			<td align="center" colspan="3">
                            <a class="nui-button" id="search" iconCls="icon-search" onclick="search()">查找</a>
                            <a class="nui-button" id="reset" iconCls="icon-reload" onclick="reset">重置</a>
                       </td>
	                </tr>
        		</table>
        	</div>
        </div>
</div>
<script type="text/javascript">
	nui.parse();
	<% 
    		UserObject user = (UserObject)session.getAttribute("userObject");
    		String nowuserid = user.getUserId();
    		String nowusername = user.getUserName();
    	%>
	//code:对应功能编码，map：对于机构的查询条件
	var json = {"code":"SRQRYL","map":{"property":"status","op":"=","value":"running"}};
	nui.ajax({
		url:"com.primeton.eos.ame_auth.ame_auth.getownorg.biz.ext",
		data:json,
		type:'POST',
		contentType:'text/json',
		success:function(text){
			if(text.orgs){
				if(text.orgs.length==0){
					//当没有有权的机构时将某一个查询条件限定住比如说“员工”，“项目负责人”等
					nui.get("id").setValue(<%=nowuserid %>);
					nui.get("id").setReadOnly(true);
					return;
				}
				nui.get("orgid").loadList(text.orgs, "orgid", "parentorgid");
				nui.get("orgids").setValue(text.orgids);
				search();
			}else{
				//当没有有权的机构时将某一个查询条件限定住比如说“员工”，“项目负责人”等
					nui.get("id").setValue(<%=nowuserid %>);
					nui.get("id").setReadOnly(true);
					return;
			}
		}
	});
	
	nui.ajax({
		url:"com.primeton.eos.ame_auth.ame_auth.getownorg1.biz.ext",
		data:json,
		type:'POST',
		contentType:'text/json',
		success:function(text){
			if(text.orgs){
				if(text.orgs.length==0){
					//当没有有权的机构时将某一个查询条件限定住比如说“员工”，“项目负责人”等
					nui.get("id").setValue(<%=nowuserid %>);
					nui.get("id").setReadOnly(true);
					return;
				}
				nui.get("orgid1").setData(text.orgs);
				nui.get("orgids1").setValue(text.orgids);
				//根据情况选择一种
				nui.get("orgid2").setData(text.orgs);
				nui.get("orgids2").setValue(text.orgids);
				search();
			}else{
				//当没有有权的机构时将某一个查询条件限定住比如说“员工”，“项目负责人”等
					nui.get("id").setValue(<%=nowuserid %>);
					nui.get("id").setReadOnly(true);
					return;
			}
			
		}
	});
	function search(){
		if(nui.get("orgid2").getValue() == ""){
    		nui.get("tempCond1").setValue("=");
    		nui.get("tempCond2").setValue("");
    	}else{
    		nui.get("tempCond1").setValue("in");
    		nui.get("tempCond2").setValue("1");
    	}
	}
</script>
</body>
</html>
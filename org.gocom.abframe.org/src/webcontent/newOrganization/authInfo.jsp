<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@include file="/common/common.jsp"%>
<html>
<!-- 
  - Author(s): 张一博
  - Date: 2018-03-30 16:21:37
  - Description:
-->
<head>
<title>权限信息</title>
<script src="<%= request.getContextPath() %>/common/nui/nui.js" type="text/javascript"></script>
<style type="text/css">
	body{margin: 0;padding: 0;width: 100%;height: 100%;}
</style>
</head>
<body>
<div class="nui-fit">
		<table>
			<tr>
				<td id='processinfo'></td>
			</tr>
		</table>
		<table >
        <tr>
            <td>
            	<div class="nui-toolbar" style="border-bottom:0;padding:0px;">
		            <table style="width:100%;">
		            	<tr>
		                    <td style="width:20%;">
		                       	已授予角色
		                    </td>
		                </tr>
		             </table>           
		        </div>
                <div id="listbox1" class="nui-listbox" style="width:200px;height:450px;" 
                	textField="rolename" valueField="roleid" onitemdblclick="query">     
                    <div header="" headeralign="center" field="rolename"></div>
                </div>
            </td>
            <td style="width:50px;text-align:center;">
                <input type="button" value="&gt;&gt;" onclick="remove()" style="width:40px;"/><br/>
                <input type="button" value="&lt;&lt;" onclick="add()" style="width:40px;"/><br/>
            </td>
            <td>
            	<div class="nui-toolbar" style="border-bottom:0;padding:0px;">
		            <table style="width:100%;">
		            	<tr>
		                    <td style="width:20%;">
		                       	未授予角色
		                    </td>
		                </tr>
		             </table>           
		        </div>
                <div id="listbox2" class="nui-listbox" onitemdblclick="query" style="width:200px;height:450px;" 
                	textField="rolename" valueField="roleid">     
                </div>
            </td>
            <td>
            	<div class="nui-toolbar" style="border-bottom:0;padding:0px;">
		            <table style="width:100%;">
		            	<tr>
		                    <td style="width:20%;">
		                       	角色功能列表
		                    </td>
		                </tr>
		             </table>           
		        </div>
            	<div id="datagrid1"  class="nui-datagrid" style="width:auto;height:450px;"
				    dataField="rolefuncs" multiSelect="true" pageSize="20" sizeList="[10,20,30,50]" allowAlternating="true"
				    url='org.gocom.abframe.org.party.PartyManager.queryPartyRolefuncView.biz.ext'>
				    <div property="columns">
				        <div field="funcname" width="50" headerAlign="center" allowSort="true" align="center">功能名称</div> 
				    </div>
				</div>
            </td>
        </tr>
    </table> 
	</div>
</body>
<script type="text/javascript">
	nui.parse();
 	var listbox1 = mini.get("listbox1");
    var listbox2 = mini.get("listbox2");
	var orgid = '<%=request.getParameter("orgid") %>';
	var grid = nui.get("datagrid1");
	
	function query(e){
		var item = e.item;
		var json = {rolefunc:{_entity:"org.gocom.abframe.dataset.organization.AcRolefuncView",_expr:{
			roleid: item.roleid, _op: "in"
		}}};
		grid.load(json);
	}
	
	search();
	function search(){
		var json1 = {oPartyrole:{partytype:"organization",partyid:orgid}};
		nui.ajax({
        	url: "org.gocom.abframe.org.party.PartyManager.queryPartyRole.biz.ext",
        	type: 'POST',
        	data:json1,
        	dataType:"json",
        	success: function (text) {
        		var arr = [];
        		for(var i = 0 ; i<text.partyroles.length ; i++ ){
        			arr.push(text.partyroles[i].acRole);
        		}
        		listbox1.addItems(arr);
        	}
        });
		var json2 = {partyRole:{partytype:"organization",partyid:orgid}};
		nui.ajax({
        	url: "org.gocom.abframe.org.party.PartyManager.queryLackPartyRole.biz.ext",
        	type: 'POST',
        	cache: false,
        	data:json2,
        	dataType:"json",
        	success: function (text) {
        		listbox2.addItems(text.groupRolesAllow);
        	}
        });
	}
	
	
 	function add() {
 		var items = listbox2.getSelecteds();
        var omPartyrole = [];
        omPartyrole.push({acRole:items[0]});
        var json ={oPartyrole:{partytype:"organization",partyid:orgid},omPartyrole:omPartyrole};
 		nui.ajax({
        	url: "org.gocom.abframe.org.party.PartyManager.addPartyRole.biz.ext",
        	type: 'POST',
        	data:json,
        	dataType:"json",
        	success: function (text) {
	        	if(text.retCode){
	        		
	        		listbox2.removeAll();
        			listbox1.removeAll();
        			search();
        			nui.alert("添加成功。")
	        	}else{
	        		nui.alert("添加失败，请联系信息技术部。")
	        	}
        	}
        });
        
    }
    
    //
    
    function remove() {
        var items = listbox1.getSelecteds();
     	var omPartyrole = [];
        omPartyrole.push({acRole:items[0]});
        var json ={oPartyrole:{partytype:"organization",partyid:orgid},omPartyrole:omPartyrole};
        nui.ajax({
        	url: "org.gocom.abframe.org.party.PartyManager.deletePartyRole.biz.ext",
        	type: 'POST',
        	data:json,
        	dataType:"json",
        	success: function (text) {
        		if(text.retCode){
        			listbox2.removeAll();
        			listbox1.removeAll();
        			search();
        			nui.alert("删除成功。")
        		}else{
        			nui.alert("删除失败，请联系信息技术部。");
        		}
        		
        	}
        });
    }
</script>
</html>
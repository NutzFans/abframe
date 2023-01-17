<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ page import="com.eos.data.datacontext.UserObject"%>
<html>
<!-- 
  - Author(s): zhang-yb
  - Date: 2018-06-27 17:31:24
  - Description:
-->
<head>
<title>项目有权人员查询</title>
	<meta http-equiv="content-type" content="text/html; charset=UTF-8" />
	<script src="<%= request.getContextPath() %>/common/nui/nui.js" type="text/javascript"></script>
	<style type="text/css">
	    body{
	        margin:0;padding:0;border:0;width:100%;height:100%;
	    }
    </style>
</head>
<body>
<div class="nui-fix">
	<div class="nui-panel" title="项目查询" style="width:100%;">
        <div style="width:100%;height:100%;padding:0px;margin:0px;" id="form1">
        	<div class="nui-toolbar" style="border-bottom:0;padding:0px;">
	            <!-- 数据实体的名称 -->
	            <input class="nui-hidden" name="criteria/_entity" value="com.primeton.rdmgr.data.rd.QueryRdProject">
	            <table align="center" border="0" width="100%" class="form_table">
		        	<tr>
			          	<td align="right">项目名称：</td>
			          	<td align="left">
			            	<input name="criteria._expr[0]._value" class="nui-textbox" style="width:150px;" onenter="onKeyEnter"/>
						    <input class="nui-hidden" name="criteria._expr[0]._property" value="projectName"/>
						    <input class="nui-hidden" name="criteria._expr[0]._op" value="like"/>
						    <input class="nui-hidden" name="criteria._expr[0]._likeRule" value="all"/>
			          	</td>
			          	<td align="right">项目编号：</td>
			          	<td>
				            <input name="criteria._expr[1]._value" class="nui-textbox" style="width:170px;" onenter="onKeyEnter"/>
						    <input class="nui-hidden" name="criteria._expr[1]._property" value="projectNo"/>
						    <input class="nui-hidden" name="criteria._expr[1]._op" value="like"/>
						    <input class="nui-hidden" name="criteria._expr[1]._likeRule" value="all"/>
			          	</td>
			    	  	<td align="right">对应客户：</td>
		           		<td>
			          		<input class="nui-textbox" name="criteria._expr[2]._value" style="width:150px;"/>
			          		<input class="nui-hidden" name="criteria._expr[2]._property" value="custname"/>
			                <input class="nui-hidden" name="criteria._expr[2]._op" value="like"/>
			                <input class="nui-hidden" name="criteria._expr[2]._likeRule" value="all"/>
			         	</td>
			      	</tr>
		        	<tr>
		        		<td align="right">人员：</td>
			           	<td>
			          		<input name="criteria._expr[3]._value" class="nui-textboxlist" id="userid" allowInput="true" textField="empname" valueField="userid" searchField="name" style="width:150px;" url="com.primeton.eos.ame_budget.budgetOrgManager.queryUseridByName.biz.ext"/>
					    	<input class="nui-hidden" name="criteria._expr[3]._property" value="userid"/>
					    	<input class="nui-hidden" name="criteria._expr[3]._op" value="in"/>
			          	</td>
			        	<td align="right">受益部门：</td>
			           	<td>
					         <input id="finUnitId"  name="criteria._expr[4]._value"  class="nui-combobox" 
						    textField="orgname" valueField="orgseq" dataField="orgs" showNullItem="true" allowInput="true" style="width:170px;"/>
				    		<input class="nui-hidden" name="criteria._expr[4]._property" value="orgseq"/>
					        <input class="nui-hidden" name="criteria._expr[4]._op" value="like"/>
					         <input class="nui-hidden" name="criteria._expr[4]._likeRule" value="end"/>
					        
					        <input class="nui-hidden" name="criteria._expr[6]._property" value="finUnitId"/>
					        <input class="nui-hidden" name="criteria._expr[6]._op" value="in"/>
					        <input class="nui-hidden" name="criteria._expr[6]._value" id="orgids"/>
			        	</td>
			        	<td align="right">计价模式：</td>
			          	<td>
				            <input name="criteria._expr[5]._value" class="nui-dictcombobox" dictTypeId="MIS_PRICETYPE" shownullItem="true" style="width:150px;"/>
						    <input class="nui-hidden" name="criteria._expr[5]._property" value="pricetype"/>
						    <input class="nui-hidden" name="criteria._expr[5]._op" value="="/>
			          	</td>
		        	</tr>
		        	<tr>
		        		<td align="right">人员所属部门：</td>
			           	<td>
				         	<input name="criteria._expr[7]._value" class="nui-combobox"  id="orgid" textField="orgname" valueField="orgid" dataField = "orgs" shownullItem="true"
						     allowInput="true" style="width:150px;" />
						    <input class="nui-hidden" name="criteria._expr[7]._property" value="orgid"/>
						    <input class="nui-hidden" name="criteria._expr[7]._op" value="like"/>
						    <input class="nui-hidden" name="criteria._expr[7]._likeRule" value="end"/>
			        	</td>
			        	<td align="right">项目负责人：</td>
			           	<td>
			          		<input name="criteria._or[0]._expr[0]._value" class="nui-textboxlist" id="manager" allowInput="true" textField="empname" valueField="userid" searchField="name" style="width:150px;" url="com.primeton.eos.ame_budget.budgetOrgManager.queryUseridByName.biz.ext"/>
					    	<input class="nui-hidden" name="criteria._or[0]._expr[0]._property" value="manager"/>
					    	<input class="nui-hidden" name="criteria._or[0]._expr[0]._op" value="in"/>
					    	
					    	<input class="nui-hidden" name="criteria._or[0]._expr[1]._value" id="userid1" />
					    	<input class="nui-hidden" name="criteria._or[0]._expr[1]._property" value="userid"/>
					    	<input class="nui-hidden" name="criteria._or[0]._expr[1]._op" value="="/>
			          	</td>
		        	</tr>
		      	</table>
			    <table style="width:100%;" id = "toolbars1">
			    	<tr>
			            <td style="width:20%;" align="center">
				            <a class="nui-button" id="search" iconCls="icon-search" onclick="search()">查询</a>
				            <a class="nui-button" id="reset" iconCls="icon-reload" onclick="reset()">重置</a>
				        </td>
			        </tr>
			    </table>           
			</div>
		</div>
    	<div style="width:100%;" >
            <div id="datagrid1" sizeList="[10,20,50,100]" showPager="true" dataField="peopleLists" 
            	showSummaryRow="true"  sortMode="client" allowResize="true" class="nui-datagrid" 
            	style="width:100%;height:340px;" url="com.primeton.rdmgr.project.rdProject.queryProjectAuthPeople.biz.ext" 
            	multiSelect="true" allowSortColumn="true">
                <div property="columns">
                	<div type="checkcolumn"></div>
                	<div field="empname" width="40" align="left" headerAlign="center" allowSort="true" renderer="viewWorkTime">人员</div>
                	<div field="orgname" width="80" align="center" headerAlign="center" allowSort="true">所属部门</div>
                    <div field="projectNo" width="100" align="center" headerAlign="center" allowSort="true" >项目编号</div>
                    <div field="projectName" width="120" align="center" headerAlign="center" allowSort="true">项目名称</div>
                    <div field="managername" width="50" align="center" headerAlign="center" allowSort="true">项目负责人</div>
                    <div field="custname" width="120" align="center" headerAlign="center" allowSort="true">所属客户</div>
                    <div field="finUnitName" width="110" align="center" headerAlign="center" allowSort="true" >受益部门</div>
                    <div field="yjbmname" width="80" align="center" headerAlign="center" allowSort="true">受益一级部门</div>
                    <div field="ejbmname" width="80" align="center" headerAlign="center" allowSort="true">受益二级部门</div>
                    <div field="pricetype" width="50" align="center" headerAlign="center" allowSort="true" renderer="pricetype">计价模式</div>
                    <div field="cost" width="80" align="right" headerAlign="center" dataType="currency" allowSort="true" >人员项目成本</div>
                    <div field="pcostsum" width="80" align="right" headerAlign="center" dataType="currency" allowSort="true" >当前项目总成本</div>
                </div>
            </div>
		</div>
	</div>
</div>
</body>
<script type="text/javascript">
	nui.parse();
	var form = new nui.Form("#form1");
	var grid = nui.get("datagrid1");
	
	init();
	function init(){
		<% 
    		UserObject user = (UserObject)session.getAttribute("userObject");
    		String nowuserid = user.getUserId();
    		String nowusername = user.getUserName();
    		String userorgid=user.getUserOrgId();
		%>
    		
		//机构权限初始化
		//code:对应功能编码，map：对于机构的查询条件
					
		var json = {"code":"projectAuthPeople","map":{"property":"status","op":"=","value":"running"}};
		nui.ajax({
			url:"com.primeton.eos.ame_auth.ame_auth.getownorg1.biz.ext",
			data:json,
			type:'POST',
			async:false,
			contentType:'text/json',
			success:function(text){
				if(text.orgs){
					var isall;//是否拥有全公司的权限
					for(var i=0;i<text.orgs.length;i++){
						if(text.orgs[i].orgid == "1"){
							isall = "1";
							break;
						}
					}
					//如果拥有全公司的权限就取消部门限制
					if(isall == "1"){
						nui.getbyName("criteria._expr[4]._op").setValue("=");
        				nui.getbyName("criteria._expr[4]._value").setValue("");
        				nui.getbyName("criteria._expr[7]._op").setValue("=");
        				nui.getbyName("criteria._expr[7]._value").setValue("");
					}else{
						nui.get("orgids").setValue(text.orgids);
						if(text.orgids == null){
							//alert(isall);
							nui.get("manager").setValue("<%=nowuserid %>");
							nui.get("manager").setText("<%=nowusername %>");
							nui.get("manager").setReadOnly(true);
							nui.get("userid1").setValue("<%=nowuserid %>");
						}
					}
					nui.get("finUnitId").setData(text.orgs);
					nui.get("orgid").setData(text.orgs);
				}
				search();
			}
		});
	}
	
	function search() {
		var form = new nui.Form("#form1");
		var data = form.getData(); //获取表单JS对象数据
	  	grid.load(data); //datagrid加载数据
	}
		
	//重置
	function reset(){
		var form = new nui.Form("#form1");
		form.reset();
		init();
	}
	
	function onOk(){
		search();
	}
	
	//回车触发
	function onKeyEnter(){
		search();
	}
		
		
	function viewWorkTime(e){
		var rowInfo = e.row;
    	if(e.value){
    		return "<a href='javascript:void(0)' onclick='workTimeInfo("+JSON.stringify(rowInfo)+");' title='点击查看'>" + e.value + "</a>";
    	}
    }
    
    function workTimeInfo(data){
    	var executeUrl = "<%=request.getContextPath() %>/project/projectParticipateByMe/getProjLabor.jsp?userid=" + data.userid +"&projectId="+data.projectId;
		window.open(executeUrl, "工时明细", "height=600,width=1000,top=0,left=0,toolbar=no,menubar=no,scrollbars=yes,resizable=yes,location=no,status=no");
    }
	
	//计价模式
	function pricetype(e){
		return nui.getDictText('MIS_PRICETYPE',e.value);
	}
</script>
</html>
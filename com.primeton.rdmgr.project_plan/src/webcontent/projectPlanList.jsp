<%@page import="java.util.Map"%>
<%@page import="commonj.sdo.DataObject"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@include file="/common/common.jsp"%>
<%@ page import="com.eos.data.datacontext.UserObject"%>
<html>
<!-- 
  - Author(s): mengyy
  - Date: 2017-08-21 17:51:37
  - Description:
-->
<head>
<title>项目查询</title>
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
	            <input class="nui-hidden" name="criteria/_entity" value="com.primeton.rdmgr.project_plan.projectPlanManager.QueryPlanProject">
	            <table align="center" border="0" width="100%" class="form_table">
			        <tr>
			          <td class="form_label" align="right">项目名称</td>
			          <td colspan="1" align="left" style="width: 150px">
			            <input name="criteria._expr[0]._value" class="nui-textbox" style="width:150px;" onenter="onKeyEnter"/>
					    <input class="nui-hidden" name="criteria._expr[0]._property" value="projectName"/>
					    <input class="nui-hidden" name="criteria._expr[0]._op" value="like"/>
					    <input class="nui-hidden" name="criteria._expr[0]._likeRule" value="all"/>
			          </td>
			          <td class="form_label" align="right">项目编号</td>
			          <td colspan="1">
			            <input name="criteria._expr[1]._value" class="nui-textbox" style="width:150px;" onenter="onKeyEnter"/>
					    <input class="nui-hidden" name="criteria._expr[1]._property" value="projectno"/>
					    <input class="nui-hidden" name="criteria._expr[1]._op" value="like"/>
					    <input class="nui-hidden" name="criteria._expr[1]._likeRule" value="all"/>
			          </td>
			          <td class="form_label" align="right">对应客户</td>
			           <td colspan="1">
			          		<input class="nui-textbox" name="criteria._expr[11]._value" style="width:150px;"/>
			          		<input class="nui-hidden" name="criteria._expr[11]._property" value="custname"/>
			                <input class="nui-hidden" name="criteria._expr[11]._op" value="like"/>
			                <input class="nui-hidden" name="criteria._expr[11]._likeRule" value="all"/>
			         </td>
			          <td class = "form_label" align="right">最近成本日期</td>
				      <td colspan="1">
						 <input class="nui-datepicker" name="criteria._expr[4]._min" style="width:100px"/>-<input class="nui-datepicker" name="criteria._expr[4]._max" style="width:100px"/>
						 <input class="nui-hidden" name="criteria._expr[4]._property" value="lastcostdate"/>
						 <input class="nui-hidden" name="criteria._expr[4]._op" value="between"/>
						 <input class="nui-hidden" name="criteria._expr[4]._pattern" value="yyyy-MM-dd"/>
					  </td>
			      </tr>
			      <tr>
			          <td class="form_label" align="right">商务合同编号</td>
			           <td colspan="1">
					    	<input class="nui-textbox" name="criteria._expr[13]._value" style="width:150px;"/>
					    	<input class="nui-hidden" name="criteria._expr[13]._property" value="contnum"/>
			                <input class="nui-hidden" name="criteria._expr[13]._op" value="like"/>
			                <input class="nui-hidden" name="criteria._expr[13]._likeRule" value="all"/>
			        	</td>
			          <td class="form_label" align="right">项目负责人</td>
			           <td colspan="1">
			          		<input class="nui-textbox" name="criteria._expr[6]._value" style="width:150px;" id = "emp"/>
			          		<input class="nui-hidden" name="criteria._expr[6]._property" value="managername"/>
			                <input class="nui-hidden" name="criteria._expr[6]._op" value="like" />
			                <input class="nui-hidden" name="criteria._expr[6]._likeRule" value="all" />
			          </td>
			          <td class="form_label" align="right">项目内部状态</td>
			          <td colspan="1">
						<input name="criteria._expr[7]._value" value="0,1,2,3,4" class="nui-dictcombobox" dictTypeId="MIS_PROJSTATUS" style="width:150px;" showNullItem="true" multiSelect="true" />
					    <input class="nui-hidden" name="criteria._expr[7]._property" value="projectStatus"/>
					    <input class="nui-hidden" name="criteria._expr[7]._op" value="in"/>
			          </td>
			          <td class = "form_label" align="right">项目创建日期</td>
				      <td colspan="1">
						 <input class="nui-datepicker" name="criteria._expr[9]._min" style="width:100px"/>-<input class="nui-datepicker" name="criteria._expr[9]._max" style="width:100px"/>
						 <input class="nui-hidden" name="criteria._expr[9]._property" value="createdate"/>
						 <input class="nui-hidden" name="criteria._expr[9]._op" value="between"/>
						 <input class="nui-hidden" name="criteria._expr[9]._pattern" value="yyyy-MM-dd"/>
					  </td>
				  </tr>
			      <tr>
			        	<td class="form_label" align="right">是否有外包</td>
			           	<td colspan="1">
			           		<input class="nui-dictcombobox" name="criteria._expr[16]._value" dictTypeId="MIS_YN" shownullItem="true" style="width:150px;"/>
			                <input class="nui-hidden" name="criteria._expr[16]._property" value="ishavewb" />
			                <input class="nui-hidden" name="criteria._expr[16]._op" value="="/>
			        	</td>
			          <td class="form_label" align="right">项目类型</td>
			          <td colspan="1">
			            <input name="criteria._expr[2]._value" class="nui-dictcombobox" dictTypeId="PROJECT_TYPE" shownullItem="true" style="width:150px;"/>
					    <input class="nui-hidden" name="criteria._expr[2]._property" value="projectType"/>
					    <input class="nui-hidden" name="criteria._expr[2]._op" value="="/>
			          </td>
			          <td class="form_label" align="right">项目外部状态</td>
			          <td colspan="1">
			            <input name="criteria._expr[12]._value" class="nui-dictcombobox" dictTypeId="MIS_PROJOUTSTATUS" shownullItem="true" style="width:150px;" multiSelect="true"/>
					    <input class="nui-hidden" name="criteria._expr[12]._property" value="outstatus"/>
					    <input class="nui-hidden" name="criteria._expr[12]._op" value="in"/>
			          </td>
			        <td class = "form_label" align="right">项目关闭日期</td>
				      <td colspan="1">
						 <input class="nui-datepicker" name="criteria._expr[14]._min" style="width:100px"/>-<input class="nui-datepicker" name="criteria._expr[14]._max" style="width:100px"/>
						 <input class="nui-hidden" name="criteria._expr[14]._property" value="closedate"/>
						 <input class="nui-hidden" name="criteria._expr[14]._op" value="between"/>
						 <input class="nui-hidden" name="criteria._expr[14]._pattern" value="yyyy-MM-dd"/>
					  </td>
			        </tr>
			        <tr>
			        	<td class="form_label" align="right">考核状态</td>
			          <td colspan="1">
			            <input name="criteria._expr[18]._value" class="nui-dictcombobox" dictTypeId="PROJ_CHECK" shownullItem="true" style="width:150px;"/>
					    <input class="nui-hidden" name="criteria._expr[18]._property" value="checkstatus"/>
					    <input class="nui-hidden" name="criteria._expr[18]._op" value="="/>
			          </td>
			          <td class="form_label" align="right">是否延续性项目</td>
			          <td colspan="1">
			            <input name="criteria._expr[3]._value" class="nui-dictcombobox" dictTypeId="MIS_YN" shownullItem="true" style="width:150px;"/>
					    <input class="nui-hidden" name="criteria._expr[3]._property" value="isconproj"/>
					    <input class="nui-hidden" name="criteria._expr[3]._op" value="="/>
			          </td>
			          <td class="form_label" align="right">预算状态</td>
			          <td>
			            <input name="criteria._expr[8]._value" class="nui-dictcombobox" dictTypeId="AME_ISPASSBUD" shownullItem="true" style="width:150px;"/>
					    <input class="nui-hidden" name="criteria._expr[8]._property" value="ispassbud"/>
					    <input class="nui-hidden" name="criteria._expr[8]._op" value="="/>
			          </td>
			          <td class="form_label" align="right">受益部门</td>
			          <td colspan="1">
					    <input id="finUnitId"  name="criteria._expr[10]._value"  class="nui-combobox" 
					    textField="orgname" valueField="orgseq" dataField="orgs" showNullItem="true" allowInput="true" style="width:206px;"/>
			    		<input class="nui-hidden" name="criteria._expr[10]._property" value="orgseq"/>
				        <input class="nui-hidden" name="criteria._expr[10]._op" value="like"/>
				         <input class="nui-hidden" name="criteria._expr[10]._likeRule" value="end"/>
				        
				        <input class="nui-hidden" name="criteria._expr[19]._property" value="finUnitId"/>
				        <input class="nui-hidden" name="criteria._expr[19]._op" value="in"/>
				        <input class="nui-hidden" name="criteria._expr[19]._value" id="orgids"/>
			          </td>
			        </tr>
			        <tr>
			        	<td class="form_label" align="right">项目人员</td>
			           <td colspan="1">
			          		<input class="nui-hidden" name="criteria._expr[17]._property" value="projectId"/>
			                <input class="nui-hidden" name="criteria._expr[17]._op" value="in" id="jjj"/>
			                <input class="nui-hidden" name="criteria._expr[17]._ref" value="5" id="kkk"/>
			                <input class="nui-hidden" name="criteria._ref[0]._id" value="5"/>
			                <input class="nui-hidden" name="criteria._ref[0]._entity" value="com.primeton.rdmgr.data.rd.RdEmpProj"/>
			                <input class="nui-hidden" name="criteria._ref[0]._select._field[0]" value="rdProject.projectId"/>
			                <input class="nui-hidden" name="criteria._ref[0]._expr[0]._property" value="userid"/>
			                <input class="nui-hidden" name="criteria._ref[0]._expr[0]._op" value="in"/>
					        <input class="nui-hidden" name="criteria._ref[0]._expr[0]._ref" value="6"/>
					        <input class="nui-hidden" name="criteria._ref[1]._id" value="6"/>
					        <input class="nui-hidden" name="criteria._ref[1]._entity" value="org.gocom.abframe.dataset.organization.OmEmployee"/>
					        <input class="nui-hidden" name="criteria._ref[1]._select._field[0]" value="userid"/>
					        <input class="nui-hidden" name="criteria._ref[1]._expr[0]._property" value="empname"/>
					        <input class="nui-textbox" name="criteria._ref[1]._expr[0]._value" id="empname" onvaluechanged="changeusername(e)" style="width:150px;"/>
					        <input class="nui-hidden" name="criteria._ref[1]._expr[0]._op" value="like"/>
					        <input class="nui-hidden" name="criteria._ref[1]._expr[0]._likeRule" value="all"/>
			          </td>
			          <td align="right" width="110px" nowrap="nowrap"><span>限定条件：</span></td>
						<td>
							<input property="editor" class="nui-combobox" id="term"  data="termdata" onvaluechanged="watchterm" style="width: 150px"/>
						</td> 
						<td class="form_label" align="right">实施城市</td>
			          <td colspan="1">
			            <input name="criteria._expr[15]._value" class="nui-dictcombobox" dictTypeId="AREA4CLRY" shownullItem="true" style="width:150px;"/>
					    <input class="nui-hidden" name="criteria._expr[15]._property" value="implementcity"/>
					    <input class="nui-hidden" name="criteria._expr[15]._op" value="="/>
			          </td>
			          <td class="form_label" align="right">实施部门</td>
			          <td>
					    <input id="managerdept"  name="criteria._expr[20]._value"  class="nui-combobox" 
					    textField="orgname" valueField="orgseq" dataField="orgs" showNullItem="true" allowInput="true" style="width:206px;"/>
			    		<input class="nui-hidden" name="criteria._expr[20]._property" value="managerdeptseq"/>
				        <input class="nui-hidden" name="criteria._expr[20]._op" value="like"/>
				         <input class="nui-hidden" name="criteria._expr[20]._likeRule" value="end"/>
				         
				         <input class="nui-hidden" name="criteria._expr[5]._property" value="managerdept"/>
				        <input class="nui-hidden" name="criteria._expr[5]._op" value="in"/>
				        <input class="nui-hidden" name="criteria._expr[5]._value" id="manageorgids"/>
				        
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
    		<div class="nui-toolbar" id="toolbars" style="border-bottom:0;padding:0px;">
	            <table style="width:100%;">
	            	<tr>
	                    <td style="width:20%;">
				            <!-- <a class="nui-button" id="addWreport" iconCls="icon-add" onclick="commitWreport()">提交周报</a>
				            <a class="nui-button" id="updatePlan" iconCls="icon-edit" onclick="projectPlanModify()">项目计划变更</a> -->
				            <a class="nui-button" id="planList" iconCls="icon-node" onclick="projectPlanList()">计划变更记录</a>
				        </td>
	                </tr>
	            </table>           
	        </div>
            <div id="datagrid1" frozenStartColumn="0" frozenEndColumn="7" sizeList="[10,20,50,100]" showPager="true" dataField="rdprojects" 
            	showSummaryRow="true"  sortMode="client" ondrawcell="ondrawGridcell" allowResize="true"
            	class="nui-datagrid" style="width:100%;height:340px;" url="com.primeton.rdmgr.project_plan.projectPlanManager.projectPlanList.biz.ext" 
            	multiSelect="true" allowSortColumn=true>
                <div property="columns">
                	<div type="checkcolumn"></div>
                    <div field="projectName" width="220" align="left" headerAlign="center" allowSort="true" renderer="getProjectNameDetail">项目名称</div>
                    <div field="projectno" width="100" align="center" headerAlign="center" allowSort="true" renderer="getProjectNoDetail">项目编号</div>
                    <div field="contsum" width="100" align="right" headerAlign="center" dataType="currency" currencyUnit="￥" allowSort="true" >合同金额</div>
                    <div field="pcostsum" width="100" align="right" headerAlign="center" dataType="currency" currencyUnit="￥" allowSort="true" >预算成本</div>
                    <div field="cost" width="100" align="right" headerAlign="center" dataType="currency" currencyUnit="￥" allowSort="true" >实际成本</div>
                    <div field="reporttime" width="130" align="center" headerAlign="center" allowSort="true" renderer="renderTime" >最新周报</div>
                    <div field="ptime" width="130" align="center" headerAlign="center" allowSort="true" renderer="renderTime" >计划提交日期</div>
                    <div field="projectType" width="120" align="center" headerAlign="center" allowSort="true" renderer="dictGetType">项目类型</div>
                    <div field="orgname" width="110" align="center" headerAlign="center" allowSort="true" >受益部门</div>
                    <div field="managername" width="80" align="center" headerAlign="center" allowSort="true" >项目负责人</div>
                    <div field="projectStatus" width="85" align="center" headerAlign="center" allowSort="true" renderer="dictGetStatus">内部状态</div>
                    <div field="outstatus" width="85" align="center" headerAlign="center" allowSort="true" renderer="dictGetOutStatus">外部状态</div>
                    <div field="custname" width="180" align="left" headerAlign="center" allowSort="true" >对应客户</div>
                    <div field="contnum" width="80" align="center" headerAlign="center" allowSort="true" >合同编号</div>
                    <div field="ispassbud" width="90" align="center" headerAlign="center" allowSort="true" renderer="dictIspassbud">预算状态</div>
                    <div field="createdate" width="80" align="center" headerAlign="center" allowSort="true" >创建日期</div>
                    <div field="closedate" width="80" align="center" headerAlign="center" allowSort="true" >关闭日期</div>
                    <div field="lastcostdate" width="80" align="center" headerAlign="center" allowSort="true" >最近成本日期</div>
                    <div field="managerdeptname" width="110" align="center" headerAlign="center" allowSort="true" >实施部门</div>
                </div>
            </div>
		</div>
	</div>
</div>
<form name="viewlist1" id="viewlist1" action="com.primeton.eos.ame_common.ameExportCommon.flow" method="post">
		<input type="hidden" name="_eosFlowAction" value="action0" filter="false"/>
		<input type="hidden" name="downloadFile" filter="false"/>
		<input type="hidden" name="fileName" filter="false"/>
</form>
<script type="text/javascript">
    	nui.parse();
		var form = new nui.Form("#form1");
    	var grid = nui.get("datagrid1");
		var termdata = [{id: "orgid",text: "限定实施部门"},
	               		{id: "syorgid",text: "限定受益部门"}];//权限限定条件
    	init();
    	function init(){
    		<% 
	    		UserObject user = (UserObject)session.getAttribute("userObject");
	    		String nowuserid = user.getUserId();
	    		String nowusername = user.getUserName();
	    		String userorgid=user.getUserOrgId();
	    		boolean isPMO=false;
    			boolean rolesroleids = false;	//是否是事业部助理
	    		Map attr = user.getAttributes();
				DataObject[] roles = (DataObject[]) attr.get("roles");
				for(int i=0;i<roles.length;i++){
					String rolesTemp = roles[i].getString("roleid");
					if(rolesTemp.equals("PMO")){
						isPMO=true;
					}
					if(roles[i].getString("roleid").equals("assistant") || 
						roles[i].getString("roleid").equals("HDJRZL") ){
						rolesroleids = true;
					}
				}
    		%>
    		var isPMO = <%= isPMO %>;
    		var rolesroleids = "<%=rolesroleids %>";
			var isSYBAssistant = false;	//以事业部助理身份登陆将默认限定填报部门，有编辑权限
    		if(rolesroleids == "true"){
	    		isSYBAssistant = true;//助理按照受益人管理权限 
	    	}
	    	
			//设置动态下拉框
			nui.get("term").setData(termdata);
			var jsonemp = {"oEmp":{"userid":"<%=nowuserid %>"}};
			var degree = '0' ;
			nui.ajax({
                url: "org.gocom.abframe.org.employee.EmpManager.queryEmpByTemplate.biz.ext",
                type: "post",
                data: jsonemp, 
                cache: false,
   				async:false,
                contentType: 'text/json',
                success: function (text) {
                	degree=text.oaEmp[0].degree;
                },
                error: function () {
                }
            });
			if(isSYBAssistant == true || degree == '2' || degree == '3'){
	    		nui.get("term").setValue("orgid");
    			changeterm("orgid");
	    	}else{
	    		nui.get("term").setValue("syorgid");
				changeterm("syorgid");	
	    	}
	    	
	    	if("<%=nowuserid %>"=="0408"){
	    		nui.ajax({
	                url: "com.primeton.rdmgr.project_plan.projectPlanManager.queryBusiparterOrg.biz.ext",
	                type: "post",
	                data: {"userid":"<%=nowuserid %>"}, 
	                cache: false,
	   				async:false,
	                contentType: 'text/json',
	                success: function (text) {
	                	if(text.orgseq){
	                		if(text.orgseq.split(".").length==4){
			                	nui.get("finUnitId").setValue(text.orgseq);
				    			nui.get("managerdept").setValue(text.orgseq);
	                		}
	                	}
	                },
	                error: function () {
	                }
	            });
	    	}
	    	
	    	
	    	search();
		}
	
		function dictGetType(e){
			return nui.getDictText('PROJECT_TYPE',e.value);
		}
		function dictGetStatus(e){
			return nui.getDictText('MIS_PROJSTATUS',e.value);
		}
		function dictGetOutStatus(e){
			return nui.getDictText('MIS_PROJOUTSTATUS',e.value);
		}
		function dictIspassbud(e){
			return nui.getDictText('AME_ISPASSBUD',e.value);
		}
		function dictCbversion(e){
			if(e.value == null || e.value == ""){
				return "否";
			}else{
				return "是";
			}
		}
		
		function changeusername(e){
			if(!(nui.get("empname").getValue()==""||nui.get("empname").getValue()==null)){
				nui.get("jjj").setValue("in");
				nui.get("kkk").setValue("5");
			}
		}
		function search() {
			if(nui.get("empname").getValue()==""||nui.get("empname").getValue()==null){
				nui.get("jjj").setValue("=");
				nui.get("kkk").setValue("");
			} 
			var form = new nui.Form("#form1");
			var data = form.getData(); //获取表单JS对象数据
		  	grid.load(data); //datagrid加载数据
		}
		
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
		
		
		function getProjectNameDetail(e){
	    	if(e.value){
	    		return "<a href='javascript:void(0)' onclick='checkProjectName();' title='点击查看'>" + e.value + "</a>";
	    	}
	    }
	    
	    function getProjectNoDetail(e){
	    	if(e.value){
	    		return "<a href='javascript:void(0)' onclick='checkProjectNo();' title='点击查看'>" + e.value + "</a>";
	    	}
	    }
	    function checkProjectNo(){
	    	var selectRow = grid.getSelected();
			var executeUrl = "/default/project/rdproject/projectDetail.jsp?projid=" + selectRow.projectId;
			window.open(executeUrl);
		}
	    function checkProjectName(){
			var row = grid.getSelected();
			nui.open({
		        url: "<%=request.getContextPath() %>/project_plan/projectPlanDetail.jsp",
		        title: "查看项目过程",
		        width: 1000,
		        height: 610,
		        onload: function () { //弹出页面加载完成
		            var iframe = this.getIFrameEl();
		            var data = {
		                projectNo:row.projectno,
		                projectName:row.projectName
		            };
		            iframe.contentWindow.setFormData(data);
		        },
		        ondestroy: function (action) { //弹出页面关闭前
		            //search();
		        }
		    });
			
	    }
	    
	    //超阶段预算黄色  超总预算红色
		function ondrawGridcell(e){
			var record = e.record;
            //设置行样式   红颜色FF99CC，黄颜色FFFF99。
        	if(record.ispassbud == "1"){
        		e.rowStyle = "background-color: #FFFF99";
            }else if(record.ispassbud == "2"){
            	e.rowStyle = "background-color: #FF99CC";
            }
		}
		
		//控制权限
		var authorgs;//有权的机构，定义为全局变量，只查一遍
		var authorgids;//有权的机构，定义为全局变量，只查一遍
		var allorgs;//所有的机构，定义为全局变量，只查一遍
		var isall //是否查看全公司;
		function changeterm(e){
			//根据限定条件来调整权限控制
			var name;
			var name1;
			var ids;
			var ids1;
			if(e=="orgid"){//managerdept/manageorgids/finUnitId/orgids
				name = "managerdept";
				name1 = "finUnitId";
				ids="manageorgids";
				ids1="orgids";
			}else{
				name = "finUnitId";
				name1 = "managerdept";
				ids="orgids";
				ids1="manageorgids";
			}
			
			if(authorgs){
				nui.get(name).setData(authorgs);
				if(isall == '1'){
					nui.get(ids).setValue("");
				}else{
					nui.get(ids).setValue(authorgids);
				}
				nui.get(name1).setData(allorgs);
	    		nui.get(ids1).setValue("");
			}else{
				var json = {"code":"projectPlan","map":{"property":"status","op":"=","value":"running"}};
				nui.ajax({
					url:"com.primeton.eos.ame_auth.ame_auth.getownorg1.biz.ext",
					data:json,
					type:'POST',
	                async:false,
					contentType:'text/json',
					success:function(text){
						if(text.orgs){
							if(text.orgs.length==0){
								// 没有有权的机构时只能查项目负责人为自己的数据
								nui.get("emp").setValue('<%=nowusername %>');
								nui.get("emp").setReadOnly(true);
								nui.ajax({
						            url: "com.bos.mp.common.SelectManage.queryAllOrg.biz.ext",
						            type: "post",
						            data: '',
						            cache: false,
	               					async:false,
						            contentType: 'text/json',
						            success: function (text) {
							    		allorgs = text.orgs;
							    		nui.get(name1).setData(allorgs);
							    		nui.get(ids1).setValue("");
							    		authorgs=text.orgs;
							    		authorgids = text.orgids;
							    		nui.get(name).setData(authorgs);
										nui.get(ids).setValue("");
						    		}
						    	});
						    	return;
							}
							authorgs=text.orgs;
				    		authorgids = text.orgids;
							for(var i=0;i<text.orgs.length;i++){
								if(text.orgs[i].orgid == "1"){
									isall = "1";
									break;
								}
							}
							//如果拥有全公司的权限就取消部门限制
							if(isall == "1"){
								nui.get(ids).setValue("");
							}else{
								nui.get(ids).setValue(authorgids);
							}
				    		nui.get(name).setData(authorgs);
							
						}else{
							nui.get("emp").setValue('<%=nowusername %>');
							nui.get("emp").setReadOnly(true);
							nui.ajax({
					            url: "com.bos.mp.common.SelectManage.queryAllOrg.biz.ext",
					            type: "post",
					            data: '',
					            cache: false,
	                			async:false,
					            contentType: 'text/json',
					            success: function (text) {
						    		allorgs = text.orgs;
						    		nui.get(name1).setData(allorgs);
						    		nui.get(ids1).setValue("");
						    		authorgids = text.orgids;
						    		nui.get(name).setData(authorgs);
									nui.get(ids).setValue("");
					    		}
					    	});
						}
					}
				});
		    	nui.ajax({
		            url: "com.bos.mp.common.SelectManage.queryAllOrg.biz.ext",
		            type: "post",
		            data: '',
		            cache: false,
	                async:false,
		            contentType: 'text/json',
		            success: function (text) {
			    		allorgs = text.orgs;
			    		nui.get(name1).setData(allorgs);
			    		nui.get(ids1).setValue("");
		    		}
		    	});
			}
		}
		
		//改变查询的限定条件
		function watchterm(){
			var ter = nui.get("term").getValue();
			changeterm(ter);
		}
		
		//格式化周报时间，并且增加超链接
		function renderTime(e){
			if(e.value){
					var reporttime = nui.formatDate(e.value,"yyyy-MM-dd HH:mm:ss");
	    		if (e.field == "reporttime") {
	    			return "<a href='javascript:void(0)' onclick=showReport('"+e.row.projectno+"'); title='点击查看最新周报'>" + reporttime + "</a>";
	    		}
	    		if (e.field == "ptime") {
	    			return reporttime;
	    		}
	    	}
		}
		
		//提交周报
		function commitWreport(){
			var rows = grid.getSelecteds();
			if(rows.length!=1){
				nui.alert("请选择一个项目！");
				return false;
			}
			
			nui.open({
		        url: "<%=request.getContextPath() %>/project_plan/addWeekly.jsp",
		        title: "提交周报",
		        width: 800,
		        height: 510,
		        onload: function () { //弹出页面加载完成
		            var iframe = this.getIFrameEl();
		            var data = {
		                projectNo:rows[0].projectno,
		                projectName:rows[0].projectName,
		                managername:rows[0].managername
		            };
		            iframe.contentWindow.setFormData(data);
		        },
		        ondestroy: function (action) { //弹出页面关闭前
		            search();
		        }
		    });
		}
	
	    /**
	             项目计划变更，第一次项目变更，不发起流程
	             修改计划才发起项目计划变更流程
	    */
		function projectPlanModify(){
			var rows = grid.getSelecteds();
			if(rows.length!=1){
				nui.alert("请选择一个项目！");
				return false;
			}
			nui.open({
		        url: "<%=request.getContextPath() %>/project_plan/modifyProjectPlan.jsp",
		        title: "维护项目计划",
		        width: 800,
		        height: 410,
		        onload: function () { //弹出页面加载完成
		            var iframe = this.getIFrameEl();
		            var data = {
		                projectNo:rows[0].projectno,
		                projectName:rows[0].projectName,
		                startdate:rows[0].startdate
		            };
		            iframe.contentWindow.setFormData(data);
		        },
		        ondestroy: function (action) { //弹出页面关闭前
		            //search();
		        }
		    });
		}
		
		//查看周报
		function showReport(projectno){
			nui.open({
		        url: "<%=request.getContextPath() %>/project_plan/showWeekly.jsp",
		        title: "查看周报",
		        width: 800,
		        height: 510,
		        onload: function () { //弹出页面加载完成
		            var iframe = this.getIFrameEl();
		            var data = {
		                projectNo:projectno
		            };
		            iframe.contentWindow.setFormData(data);
		        },
		        ondestroy: function (action) { //弹出页面关闭前
		            //search();
		        }
		    });
		}
		
		function projectPlanList(){
			var rows = grid.getSelecteds();
			if(rows.length!=1){
				nui.alert("请选择一个项目！");
				return false;
			}
			nui.open({
		        url: "<%=request.getContextPath() %>/project_plan/showPlanList.jsp",
		        title: "项目计划跟踪一览",
		        width: 800,
		        height: 510,
		        onload: function () { //弹出页面加载完成
		            var iframe = this.getIFrameEl();
		            iframe.contentWindow.setFormData(rows[0].projectno);
		        },
		        ondestroy: function (action) { //弹出页面关闭前
		            //search();
		        }
		    });
		}
</script>
</body>
</html>
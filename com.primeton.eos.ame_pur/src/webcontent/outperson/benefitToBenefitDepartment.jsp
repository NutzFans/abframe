<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>	
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@page import="com.eos.data.datacontext.UserObject"%>
<html>
<!-- 
  - Author(s): zhuyl
  - Date: 2016-12-28 10:20:24
  - Description:
-->
<head>
	<title>由我受益的项目外包人员-受益部门</title>
	<script src="<%= request.getContextPath() %>/common/nui/nui.js" type="text/javascript"></script>
</head>
<body>
	<!-- 
		查询条件：客户名称、项目名称、项目编号、供应商、外包人员、服务状态(多选)
		显示列：客户、项目、供应商、外包人员、服务开始日期、预计结束日期、投入比重、服务状态、实际结束日期、联系电话、
			结算截止日期、计提截止日期
		排序字段：缺省按客户项目、供应商、服务开始日期(倒序)排列 -->
		
	<div class="nui-fix">
		<div class="nui-panel" title="由我受益的项目外包人员-受益部门" width="auto">
			<div style="width:100%;height:100%;padding:0px;margin:0px;" id="form1">
				<div class="nui-toolbar" style="border-bottom:0;padding:0px;">
					<table style="width:100%;">
						<tr>
							<td align="right"><span>项目名称：</span></td>
			            	<td align="left">
							    <input name="criteria._expr[0]._value" class="nui-textbox" style="width:150px;" onenter="onKeyEnter"/>
							    <input class="nui-hidden" name="criteria._expr[0]._property" value="projectname"/>
							    <input class="nui-hidden" name="criteria._expr[0]._op" value="like"/>
							    <input class="nui-hidden" name="criteria._expr[0]._likeRule" value="all"/>
							</td>
							<td align="right"><span>项目编号：</span></td>
			            	<td align="left">
							    <input name="criteria._expr[1]._value" class="nui-textbox" style="width:150px;" onenter="onKeyEnter"/>
							    <input class="nui-hidden" name="criteria._expr[1]._property" value="projectno"/>
							    <input class="nui-hidden" name="criteria._expr[1]._op" value="like"/>
							    <input class="nui-hidden" name="criteria._expr[1]._likeRule" value="all"/>
							</td>
							<td align="right"><span>供应商：</span></td>
			            	<td align="left">
							    <input name="criteria._expr[2]._value" class="nui-textbox" style="width:150px;" onenter="onKeyEnter"/>
							    <input class="nui-hidden" name="criteria._expr[2]._property" value="custname"/>
							    <input class="nui-hidden" name="criteria._expr[2]._op" value="like"/>
							    <input class="nui-hidden" name="criteria._expr[2]._likeRule" value="all"/>
							</td> 
							<td align="right"><span>服务客户：</span></td>
			            	<td align="left">
							    <input name="criteria._expr[3]._value" class="nui-textbox" style="width:150px;" onenter="onKeyEnter" />
							    <input class="nui-hidden" name="criteria._expr[3]._property" value="miscustname"/>
							    <input class="nui-hidden" name="criteria._expr[3]._op" value="like"/>
							    <input class="nui-hidden" name="criteria._expr[3]._likeRule" value="all"/>
							</td>
						</tr>
						<tr>
							<td align="right"><span>服务开始日期范围：</span></td>
			            	<td align="left">
							    <input name="criteria._expr[4]._min" class="nui-datepicker" style="width:100px;"/>
							    -
							    <input name="criteria._expr[4]._max" class="nui-datepicker" style="width:100px;"/>
							    <input class="nui-hidden" name="criteria._expr[4]._property" value="startdate"/>
							    <input class="nui-hidden" name="criteria._expr[4]._op" value="between"/>
							    <input class="nui-hidden" name="criteria._expr[4]._likeRule" value="all"/>
							</td>
							<td align="right"><span>服务状态：</span></td>
			            	<td align="left" colspan="3">
							    <input name="criteria._expr[5]._value" class="nui-dictcombobox" dictTypeId="AME_OUTPERSTATUS" style="width: 320px;" showNullItem="true" multiSelect="true"/>
							    <input class="nui-hidden" name="criteria._expr[5]._property" value="currentstatus"/>
							    <input class="nui-hidden" name="criteria._expr[5]._op" value="in"/>
							</td>
							<td align="right"><span>外包人员：</span></td>
			            	<td align="left">
			            		<input name="criteria._expr[6]._value" class="nui-textbox" style="width:100px;" onenter="onKeyEnter" />
							    <input class="nui-hidden" name="criteria._expr[6]._property" value="outpername"/>
							    <input class="nui-hidden" name="criteria._expr[6]._op" value="like"/>
							    <input class="nui-hidden" name="criteria._expr[6]._likeRule" value="all"/>
			            	</td>
							<td align="right"></td>
			            	<td align="left">
							    <input name="criteria._expr[7]._value" class="nui-hidden" style="width:100px;" onenter="onKeyEnter"/>
							    <input class="nui-hidden" name="criteria._expr[7]._property" value="benefitname"/>
							</td>
			            </tr>
						<tr>
			    			<td align="center" colspan="8">
		                        <a class="nui-button" id="search" iconCls="icon-search" onclick="search()">查找</a>
		                        <a class="nui-button" id="reset" iconCls="icon-reload" onclick="reset">重置</a>
		                   </td>
		                </tr>
					</table>
				</div>
			</div>
			<div style="width:100%;">
				<div class="nui-toolbar" style="border-bottom:0;padding:0px;">
		            <table style="width:100%;">
		            	<tr>
		                    <td style="width:20%;">
		                        <a class="nui-button" id="addFilingBtn" iconCls="icon-add" onclick="addPurOutpersonFiling()">新增外包人员报备申请</a>
		                    </td>
		                </tr>
		             </table>           
		        </div>
		        <div id="datagrid1" class="nui-datagrid" style="width: 100%;height:325px;" allowResize="true" dataField="projectOutpers" 
			    	url="com.primeton.eos.ame_pur.outperson.queryReportingToManager.biz.ext" 
			    	multiSelect="true" allowAlternating="true" 
			    	frozenStartColumn="0" frozenEndColumn="3">
					<div property="columns">
						<div type="checkcolumn" width="30"></div>	
						<div field="outpername" width="80" align="center" headerAlign="center" allowSort="true" renderer="getOutperDetail">外包人员</div>
						<div field="suppliersname" width="100" align="center" headerAlign="center" allowSort="true" renderer="getSupplierDetail">供应商</div>
						<div field="projectname" width="200" align="left" headerAlign="center" allowSort="true" renderer="getProjectNameDetail">项目名称</div>
						<div field="projectno" width="100" align="center" headerAlign="center" allowSort="true">项目编号</div>
						<div field="miscustname" width="200" align="left" headerAlign="center" allowSort="true">服务客户</div>
						<div field="reportingmanager" width="80" align="center" headerAlign="center" allowSort="true">汇报对象</div>
						<div field="price" width="100" align="right" headerAlign="center" allowSort="true" numberFormat="n">服务价格</div>
						<div field="startdate" width="90" align="center" headerAlign="center" allowSort="true">服务开始日期</div>
						<div field="expenddate" width="110" align="center" headerAlign="center" allowSort="true">预计服务结束日期</div>
						<div field="inputratio" width="80" align="center" headerAlign="center" allowSort="true" numberFormat="p0">投入比重</div>
						<div field="currentstatus" width="100" align="center" headerAlign="center" allowSort="true" renderer="dictGetStatus">服务状态</div>
						<div field="actenddate" width="110" align="center" headerAlign="center" allowSort="true">实际服务结束日期</div>
						<div field="degree" width="70" align="center" headerAlign="center" allowSort="true" renderer="dictGetDegree">学历</div>
						<div field="gradudate" width="90" align="center" headerAlign="center" allowSort="true">毕业时间</div>
						<div field="linktel" width="100" align="center" headerAlign="center" allowSort="true">联系电话</div>
						<div field="costenddate" width="110" align="center" headerAlign="center" allowSort="true">最近结算截止日期</div>
						<div field="accuenddate" width="110" align="center" headerAlign="center" allowSort="true">最近计提截止日期</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	
	<script type="text/javascript">
		nui.parse();
		var form = new nui.Form("#form1");
    	var grid = nui.get("datagrid1");
    	init();
		<%
	   		UserObject user = (UserObject) session.getAttribute("userObject");
	   		String username = user.getUserName();
	   		String userno = user.getUserId();
	   		
	    %>
    	function init(){
		    nui.getbyName("criteria._expr[7]._value").setValue("<%=username %>");
		    nui.getbyName("criteria._expr[7]._value").setEnabled(false);
		    //服务状态缺省去掉已离场
		    nui.getbyName("criteria._expr[5]._value").setValue("1,2,3,4");
		    var json = form.getData();
			//grid.sortBy("outpername","asc");
    		grid.load(json);
		}
		
		//设置业务字典值-人员状态
		function dictGetStatus(e){
			return nui.getDictText('AME_OUTPERSTATUS',e.value);
		}
		
		//设置业务字典值-学历
		function dictGetDegree(e) {
			return nui.getDictText('DEGREE',e.value);
		}
		
		//查询
		function search(){
			var json = form.getData();
			grid.sortBy("outpername","asc");
			grid.load(json);
		}
		
		//回车触发
		function onKeyEnter(){
			search();
		}
		
		//重置
		function reset(){
			form.reset();
			nui.getbyName("criteria._expr[9]._value").setValue("<%=username %>");
			var json = form.getData();
			grid.sortBy("outpername","asc");
			grid.load(json);
		}
		
		/**
         * 新增外包人员报备申请
         */
        function addPurOutpersonFiling(){
        	nui.open({
	            url: "<%=request.getContextPath() %>/ame_pur/outpersonFiling/PurOutpersonFilingFirst.jsp",
	            title: "新增外包人员报备申请",
	            width: 1000,
	            height: 480,
	            onload: function () {
					var iframe = this.getIFrameEl();
					var data = {action: "addPurOutpersonFiling"};
					iframe.contentWindow.SetData(data);
				},
				ondestroy: function (action) {
					if(action=="ok"){
						grid.reload();
	                }
				}
			});
        }
        
          //外包人员考勤统计
        function getOutperDetail(e){
		if(e.value){
    		return "<a href='javascript:void(0)' onclick='checkDetail();' title='点击查看'>" + e.value + "</a>";
    	}
	    }
	    function checkDetail(){
	 		var selectRow = grid.getSelected();
			var executeUrl = "/default/ame_common/attendance/conutAttenddance.jsp?names=" + selectRow.outpername+"&projectno="+selectRow.projectno+"&state=1";
			window.open(executeUrl, "考勤统计明细", "fullscreen=1");
	    }
	</script>
</body>
</html>
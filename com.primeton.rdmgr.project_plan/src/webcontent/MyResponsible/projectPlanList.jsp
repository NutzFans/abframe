<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@include file="/common/common.jsp"%>
<html>
<!-- 
  - Author(s): yaoyi
  - Date: 2017-02-27 10:10:45
  - Description:
-->
<head>
<title>由我负责的项目</title>
	<meta http-equiv="content-type" content="text/html; charset=UTF-8" />
	<script src="<%= request.getContextPath() %>/common/nui/nui.js" type="text/javascript"></script>
	<style type="text/css">
	    body{
	        margin:0;padding:0;border:0;width:100%;height:100%;overflow:hidden;
	    }
    </style>
</head>
<body>
<div class="nui-fix">
	<div class="nui-panel" title="由我负责的项目" style="width:100%;">
        <div style="width:100%;height:100%;padding:0px;margin:0px;" id="form1">
        	<div class="nui-toolbar" style="border-bottom:0;padding:0px;">
	            <!-- 数据实体的名称 -->
	            <input class="nui-hidden" name="criteria/_entity" value="com.primeton.rdmgr.data.rd.RdProject">
	            <table align="center" border="0" width="100%" class="form_table">
        <tr>
          <td class="form_label">
            项目名称
          </td>
          <td colspan="1">
            <input name="criteria._expr[0]._value" class="nui-textbox" style="width:150px;" onenter="onKeyEnter"/>
		    <input class="nui-hidden" name="criteria._expr[0]._property" value="projectName"/>
		    <input class="nui-hidden" name="criteria._expr[0]._op" value="like"/>
		    <input class="nui-hidden" name="criteria._expr[0]._likeRule" value="all"/>
          </td>
          <td class="form_label">
            项目编号
          </td>
          <td colspan="1">
            <input name="criteria._expr[1]._value" class="nui-textbox" style="width:150px;" onenter="onKeyEnter"/>
		    <input class="nui-hidden" name="criteria._expr[1]._property" value="projectno"/>
		    <input class="nui-hidden" name="criteria._expr[1]._op" value="like"/>
		    <input class="nui-hidden" name="criteria._expr[1]._likeRule" value="all"/>
          </td>
          <td class="form_label">项目内部状态</td>
          <td colspan="1">
			<input name="criteria._expr[2]._value" value="0,1,2,3,4" class="nui-dictcombobox" dictTypeId="MIS_PROJSTATUS" style="width:150px;" showNullItem="true" multiSelect="true" />
		    <input class="nui-hidden" name="criteria._expr[2]._property" value="projectStatus"/>
		    <input class="nui-hidden" name="criteria._expr[2]._op" value="in"/>
          </td>
          
      </tr>
      <tr>
          <td class="form_label">
            项目类型
          </td>
          <td colspan="1">
            <input name="criteria._expr[3]._value" class="nui-dictcombobox" dictTypeId="PROJECT_TYPE" shownullItem="true" style="width:150px;"/>
		    <input class="nui-hidden" name="criteria._expr[3]._property" value="projectType"/>
		    <input class="nui-hidden" name="criteria._expr[3]._op" value="="/>
          </td>
           <td class="form_label">项目外部状态</td>
          <td colspan="1">
            <input name="criteria._expr[4]._value" class="nui-dictcombobox" dictTypeId="MIS_PROJOUTSTATUS" shownullItem="true" style="width:150px;" multiSelect="true"/>
		    <input class="nui-hidden" name="criteria._expr[4]._property" value="outstatus"/>
		    <input class="nui-hidden" name="criteria._expr[4]._op" value="in"/>
          </td>
          <td class="form_label">受益部门</td>
          <td colspan="1">
          <input name="criteria._expr[5]._value" id="finUnitId" class="nui-combobox" url="com.primeton.rdmgr.labor.labormgr.getAllOrgs.biz.ext" 
			filterType="like" textField="orgname" valueField="orgid" dataField="allorgs" valueFromSelect="true" allowInput="true" style="width:150px;" >
			<input class="nui-hidden" name="criteria._expr[5]._property" value="finUnitId"/>
		    <input class="nui-hidden" name="criteria._expr[5]._op" value="="/>
          </td>
	  </tr>
      <tr>
           <td class="form_label">对应客户</td>
           <td colspan="1">
          		<input class="nui-hidden" name="criteria._expr[6]._property" value="custid"/>
                <input class="nui-hidden" name="criteria._expr[6]._op" value="in" id="bbb"/>
                <input class="nui-hidden" name="criteria._expr[6]._ref" value="1" id="aaa"/>
                <input class="nui-hidden" name="criteria._ref[0]._id" value="1"/>
                <input class="nui-hidden" name="criteria._ref[0]._entity" value="com.primeton.rdmgr.data.csomsData.MisCustinfo"/>
                <input class="nui-hidden" name="criteria._ref[0]._select._field[0]" value="custid"/>
                <input class="nui-hidden" name="criteria._ref[0]._expr[0]._property" value="custname"/>
                <input class="nui-textbox" name="criteria._ref[0]._expr[0]._value" id="cust" onchange="changecustid()" style="width:150px;"/>
                <input class="nui-hidden" name="criteria._ref[0]._expr[0]._op" value="like"/>
                <input class="nui-hidden" name="criteria._ref[0]._expr[0]._likeRule" value="all"/>
        </td>
        <td class="form_label">销售合同编号</td>
           <td colspan="1">
           		<input class="nui-hidden" name="criteria._expr[7]._property" value="contnum"/>
                <input class="nui-hidden" name="criteria._expr[7]._op" value="like"/>
                <input class="nui-hidden" name="criteria._expr[7]._likeRule" value="all"/>
                <input class="nui-textbox" name="criteria._expr[7]._value" style="width:150px;"/>
        </td>
        </tr>
      </table>
      <table style="width:100%;">
    	<tr>
            <td style="width:20%;" align="center">
	            <a class="nui-button" id="search" iconCls="icon-search" onclick="search()">查询</a>
	            <a class="nui-button" id="reset" iconCls="icon-reload" onclick="reset()">重置</a>
	        </td>
        </tr>
      </table>           
	</div>
</div>

    	<div style="width:100%;">
    		<div class="nui-toolbar" id="toolbars" style="border-bottom:0;padding:0px;">
	            <table style="width:100%;">
	            	<tr>
	                    <td style="width:20%;">
				            <a class="nui-button" id="addWreport" iconCls="icon-add" onclick="commitWreport()">提交周报</a>
				            <a class="nui-button" id="updatePlan" iconCls="icon-edit" onclick="projectPlanModify()">项目计划变更</a>
				            <a class="nui-button" id="planList" iconCls="icon-node" onclick="projectPlanList()">计划变更记录</a>
				        </td>
	                </tr>
	            </table>           
	        </div>
            <div id="datagrid1" frozenStartColumn="0" frozenEndColumn="7" sizeList="[10,20,50,100]" showPager="true" dataField="rdprojects" 
            	showSummaryRow="true"  sortMode="client" onselectionchanged="selectionChanged" ondrawsummarycell="onDrawSummaryCell"
            	class="nui-datagrid" style="width:100%;height:340px;" url="com.primeton.rdmgr.project_plan.projectPlanManager.queryMyResponsibleList.biz.ext" 
            	multiSelect="true" allowSortColumn=true>
                <div property="columns">
                    <div field="projectName" width="140" align="left" headerAlign="center" allowSort="true" renderer="getProjectNameDetail">项目名称</div>
                    <div field="projectno" width="120" align="center" headerAlign="center" allowSort="true" renderer="getProjectNoDetail">项目编号</div>
                    <div field="contsum" width="100" align="right" headerAlign="center" dataType="currency" currencyUnit="￥" allowSort="true" >合同金额</div>
                    <div field="pcostsum" width="100" align="right" headerAlign="center" dataType="currency" currencyUnit="￥" allowSort="true" >预算成本</div>
                    <div field="cost" width="100" align="right" headerAlign="center" dataType="currency" currencyUnit="￥" allowSort="true" >实际成本</div>
                    <div field="reporttime" width="130" align="center" headerAlign="center" allowSort="true" renderer="renderTime" >最新周报</div>
                    <div field="ptime" width="130" align="center" headerAlign="center" allowSort="true" renderer="renderTime" >计划提交日期</div>
                    <div field="projectType" width="120" align="center" headerAlign="center" allowSort="true" renderer="dictGetType">项目类型</div>
                    <div field="orgname" width="110" align="center" headerAlign="center" allowSort="true" >受益部门</div>
                    <div field="custname" width="200" align="left"headerAlign="center" allowSort="true" >对应客户</div>
                    <div field="projectStatus" width="100" align="center" headerAlign="center" allowSort="true" renderer="dictGetStatus">项目内部状态</div>
                    <div field="outstatus" width="100" align="center" headerAlign="center" allowSort="true" renderer="dictGetOutStatus">项目外部状态</div>
                    <div field="contnum" width="100" align="center" headerAlign="center" allowSort="true" >合同编号</div>
                    <div field="createdate" width="110" align="center" headerAlign="center" allowSort="true" >创建日期</div>
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
    	function init(){
    		grid.load();
			grid.sortBy("createdate","desc");
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
		
		function changecustid(){
			if(!(nui.get("cust").getValue()==""||nui.get("cust").getValue()==null)){
				nui.get("bbb").setValue("in");
				nui.get("aaa").setValue("1");
			}
		}
		
		function search() {
			if(nui.get("cust").getValue()==""||nui.get("cust").getValue()==null){
				nui.get("bbb").setValue("=");
				nui.get("aaa").setValue("");
			}
			var form = new nui.Form("#form1");
			var data = form.getData(); //获取表单JS对象数据
		  	grid.load(data); //datagrid加载数据
		}
		function reset(){
			var form = new nui.Form("#form1");
			form.reset();
			grid.load();
		}
		
		function onOk(){
			search();
		}
		
		//回车触发
		function onKeyEnter(){
			search();
		}
		
		function onDrawSummaryCell(e) {
            var result = e.result;
            var grid = e.sender;
            if (e.field == "pcostsum") {
            	e.cellHtml = "<span style='display: block;font-weight: bold;text-align: right;'>" + e.cellHtml + "</span>";
            }
            if (e.field == "pcostsum1") {
            	e.cellHtml = "<span style='display: block;font-weight: bold;text-align: right;'>" + e.cellHtml + "</span>";
            }
        }
		
		function getProjectNameDetail(e){
	    	if(e.value){
	    		return "<a href='javascript:void(0)' onclick='checkProjectName();' title='点击编辑'>" + e.value + "</a>";
	    	}
	    }
	    
	    function getProjectNoDetail(e){
	    	if(e.value){
	    		return "<a href='javascript:void(0)' onclick='checkProjectNo();' title='点击查看'>" + e.value + "</a>";
	    	}
	    }
	    
	    function checkProjectNo(){
	    	var selectRow = grid.getSelected();
			var executeUrl = "/default/project/benefitToBenefitProject/projectMessage.jsp?projid=" + selectRow.projectId;
			window.open(executeUrl, "项目详细信息", "fullscreen=1");
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
	    
	    function renderTime(e){
			if(e.value){
				var time = nui.formatDate(e.value,"yyyy-MM-dd HH:mm:ss");
				if (e.field == "reporttime") {
	    			return "<a href='javascript:void(0)' onclick=showReport('"+e.row.projectno+"'); title='点击查看最新周报'>" + time + "</a>";
	    		}
	    		if (e.field == "ptime") {
	    			return time;
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
		        	if(action=="ok"){
			            search();
		        	}
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
		            if(action=="ok"){
			            search();
		        	}
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
		
		//查看项目变更记录
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
</script>
</body>
</html>
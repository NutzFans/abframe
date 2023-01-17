<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@include file="/common/common.jsp"%>
<%@ page import="com.eos.data.datacontext.UserObject"%>
<html>
<!-- 
  - Author(s): yaoyi
  - Date: 2017-02-27 10:10:45
  - Description:
-->
<head>
<title>由我受益的项目</title>
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
	<div class="nui-panel" title="由我受益的项目" style="width:100%;">
        <div style="width:100%;height:100%;padding:0px;margin:0px;" id="form1">
        	<div class="nui-toolbar" style="border-bottom:0;padding:0px;">
	            <!-- 数据实体的名称 -->
	            <input class="nui-hidden" name="criteria._entity" value="com.primeton.rdmgr.data.rd.RdProject">
	            <table align="center" border="0" width="100%" class="form_table">
			        <tr>
			          <td class="form_label" align="right">项目名称：</td>
			          <td colspan="1">
			            <input name="criteria._expr[0]._value" class="nui-textbox" style="width:150px;" onenter="onKeyEnter"/>
					    <input class="nui-hidden" name="criteria._expr[0]._property" value="projectName"/>
					    <input class="nui-hidden" name="criteria._expr[0]._op" value="like"/>
					    <input class="nui-hidden" name="criteria._expr[0]._likeRule" value="all"/>
			          </td>
			          <td class="form_label" align="right">项目编号：</td>
			          <td colspan="1">
			            <input name="criteria._expr[1]._value" class="nui-textbox" style="width:150px;" onenter="onKeyEnter"/>
					    <input class="nui-hidden" name="criteria._expr[1]._property" value="projectno"/>
					    <input class="nui-hidden" name="criteria._expr[1]._op" value="like"/>
					    <input class="nui-hidden" name="criteria._expr[1]._likeRule" value="all"/>
			          </td>
			          <td class="form_label" align="right">项目操作状态：</td>
			          <td colspan="1">
						<input name="criteria._expr[2]._value" class="nui-dictcombobox" dictTypeId="MIS_PROJSTATUS" style="width:150px;" showNullItem="true" multiSelect="true"/>
					    <input class="nui-hidden" name="criteria._expr[2]._property" value="projectStatus"/>
					    <input class="nui-hidden" name="criteria._expr[2]._op" value="in"/>
			          </td>
			          
			      </tr>
			      <tr>
			          <td class="form_label" align="right">受益部门：</td>
			          <td colspan="1">
					    <input id="finUnitId"  name="criteria._expr[3]._value"  class="nui-combobox" 
					    textField="orgname" valueField="orgseq" dataField="orgs" showNullItem="true" allowInput="true" style="width:150px;"/>
			    		<input class="nui-hidden" name="criteria._expr[3]._property" value="orgseq"/>
				        <input class="nui-hidden" name="criteria._expr[3]._op" value="like"/>
				         <input class="nui-hidden" name="criteria._expr[3]._likeRule" value="end"/>
				        
				        <input class="nui-hidden" name="criteria._expr[10]._property" value="finUnitId"/>
				        <input class="nui-hidden" name="criteria._expr[10]._op" value="in"/>
				        <input class="nui-hidden" name="criteria._expr[10]._value" id="orgids"/>
			          </td>
			          <td class="form_label" align="right">项目类型：</td>
			          <td colspan="1">
			            <input name="criteria._expr[4]._value" class="nui-dictcombobox" dictTypeId="PROJECT_TYPE" shownullItem="true" style="width:150px;"/>
					    <input class="nui-hidden" name="criteria._expr[4]._property" value="projectType"/>
					    <input class="nui-hidden" name="criteria._expr[4]._op" value="="/>
			          </td>
			           <td class="form_label" align="right">项目商务状态：</td>
			          <td colspan="1">
			            <input name="criteria._expr[5]._value" class="nui-dictcombobox" dictTypeId="MIS_PROJOUTSTATUS" shownullItem="true" style="width:150px;" multiSelect="true"/>
					    <input class="nui-hidden" name="criteria._expr[5]._property" value="outstatus"/>
					    <input class="nui-hidden" name="criteria._expr[5]._op" value="in"/>
			          </td>
			          
				  </tr>
			      <tr>
			      	  <td class="form_label" align="right">项目负责人：</td>
				           <td colspan="1">
				            <input class="nui-textbox" name="criteria._expr[6]._value" style="width:150px;" id = "emp"/>
			          		<input class="nui-hidden" name="criteria._expr[6]._property" value="managername"/>
			                <input class="nui-hidden" name="criteria._expr[6]._op" value="like" />
			                <input class="nui-hidden" name="criteria._expr[6]._likeRule" value="all" />
				        </td>
			           <td class="form_label" align="right">对应客户：</td>
			           <td colspan="1">
			          		<input class="nui-textbox" name="criteria._expr[7]._value" style="width:150px;"/>
			          		<input class="nui-hidden" name="criteria._expr[7]._property" value="custname"/>
			                <input class="nui-hidden" name="criteria._expr[7]._op" value="like"/>
			                <input class="nui-hidden" name="criteria._expr[7]._likeRule" value="all"/>
			        </td>
			        <td class="form_label" align="right">项目交付状态：</td>
			          <td colspan="1">
						<input name="criteria._expr[11]._value" class="nui-dictcombobox" dictTypeId="MIS_PROJDESTATUS" style="width:150px;" showNullItem="true" multiSelect="true"/>
					    <input class="nui-hidden" name="criteria._expr[11]._property" value="projectDestatus"/>
					    <input class="nui-hidden" name="criteria._expr[11]._op" value="in"/>
			          </td>
			        </tr>
			        <tr>
			        	<td class="form_label" align="right">预算状态：</td>
			          	<td colspan="1">
				            <input name="criteria._expr[9]._value" class="nui-dictcombobox" dictTypeId="AME_ISPASSBUD" shownullItem="true" style="width:150px;"/>
						    <input class="nui-hidden" name="criteria._expr[9]._property" value="ispassbud"/>
						    <input class="nui-hidden" name="criteria._expr[9]._op" value="="/>
			          	</td>
				        <td class="form_label"align="right">销售合同编号：</td>
				           <td colspan="1">
				           		<input class="nui-hidden" name="criteria._expr[8]._property" value="contnum"/>
				                <input class="nui-hidden" name="criteria._expr[8]._op" value="like"/>
				                <input class="nui-hidden" name="criteria._expr[8]._likeRule" value="all"/>
				                <input class="nui-textbox" name="criteria._expr[8]._value" style="width:150px;"/>
				        </td>
			        </tr>
	      		</table>
  			</div>
		</div>
		 <div style="width:100%;">
	        <div class="nui-toolbar" style="border-bottom:0;padding:0px;">
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
            <div id="datagrid1" frozenStartColumn="0" frozenEndColumn="4" sizeList="[10,20,50,100]" showPager="true" dataField="rdprojects" 
            	showSummaryRow="true"  sortMode="client" onselectionchanged="selectionChanged" ondrawsummarycell="onDrawSummaryCell"
            	class="nui-datagrid" style="width:100%;height:350px;" url="com.primeton.rdmgr.project.benefitToBenefitProject.benefitToMeProject.biz.ext" 
            	multiSelect="true" allowSortColumn="true" ondrawcell="ondrawGridcell">
                <div property="columns">
                    <div field="projectName" width="140" align="left" headerAlign="center" allowSort="true" renderer="getProjectNameDetail">项目名称</div>
                    <div field="projectno" width="120" align="center" headerAlign="center" allowSort="true" >项目编号</div>
                    <div field="projectType" width="120" align="center" headerAlign="center" allowSort="true" renderer="dictGetType">项目类型</div>
                    <div field="orgname" width="110" align="center" headerAlign="center" allowSort="true" >受益部门</div>
                    <div field="managername" width="110" align="center" headerAlign="center" allowSort="true" >项目负责人</div>
                    <div field="custname" width="200" align="left" headerAlign="center" allowSort="true" >对应客户</div>
                    <div field="projectStatus" width="100" align="center" headerAlign="center" allowSort="true" renderer="dictGetStatus">项目操作状态</div>
                    <div field="outstatus" width="100" align="center" headerAlign="center" allowSort="true" renderer="dictGetOutStatus">项目商务状态</div>
                    <div field="projectDestatus" width="100" align="center" headerAlign="center" allowSort="true" renderer="dictGetDeStatus">项目交付状态</div>
                    <div field="contnum" width="100" align="center" headerAlign="center" allowSort="true" >合同编号</div>
                    <div field="ispassbud" width="90" align="center" headerAlign="center" allowSort="true" renderer="dictIspassbud">预算状态</div>
                    <div field="lastcostdate" width="80" align="center" headerAlign="center" allowSort="true" >最近成本日期</div>
                    <div field="contamt1" width="130" align="right" headerAlign="center" allowSort="true" summaryType="sum" dataType="currency">合同额</div>
                    <div field="pcostsum1" width="110" align="right" headerAlign="center" allowSort="true" summaryType="sum" dataType="currency">当前总成本金额</div>
                    <div field="createdate" width="80" align="center" headerAlign="center" allowSort="true" >创建日期</div>
                    <div field="closedate" width="80" align="center" headerAlign="center" allowSort="true" >关闭日期</div>
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
    		<% 
	    		UserObject user = (UserObject)session.getAttribute("userObject");
	    		String nowuserid = user.getUserId();
	    		String nowusername = user.getUserName();
	    		String userorgid=user.getUserOrgId();
    		%>
    		//机构权限初始化
    		//code:对应功能编码，map：对于机构的查询条件
						
			var json = {"code":"benefitToMeProject","map":{"property":"status","op":"=","value":"running"}};
			nui.ajax({
				url:"com.primeton.eos.ame_auth.ame_auth.getownorg1.biz.ext",
				data:json,
				type:'POST',
				async: false,
				contentType:'text/json',
				success:function(text){
					
					if(text.orgs && text.errcode!="没有有权的机构"){
						if(text.orgs.length==0){
							// 没有有权的机构时只能查受益部门为自己的数据
							nui.get("finUnitId").setValue('<%=nowusername %>');
							nui.get("finUnitId").setText('<%=nowusername %>');
						}
						var isall;//是否拥有全公司的权限
						for(var i=0;i<text.orgs.length;i++){
							if(text.orgs[i].orgid == "1"){
								isall = "1";
								break;
							}
						}
						//如果拥有全公司的权限就取消部门限制
						if(isall == "1"){
							nui.getbyName("criteria._expr[10]._op").setValue("=");
	        				nui.getbyName("criteria._expr[10]._value").setValue("");
						}else{
							nui.get("orgids").setValue(text.orgids);
						}
						nui.get("finUnitId").setData(text.orgs);
					}else{
						// 没有有权的机构时只能查受益部门为自己的数据
							nui.get("finUnitId").setValue('<%=nowusername %>');
							nui.get("finUnitId").setText('<%=nowusername %>');
							nui.get("finUnitId").setReadOnly(true);;
					}
					search();
				}
			});
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
		
		function dictGetDeStatus(e){
			return nui.getDictText('MIS_PROJDESTATUS',e.value);
		}
		function dictIspassbud(e){
			return nui.getDictText('AME_ISPASSBUD',e.value);
		}
		
		function search() {
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
		
		function onDrawSummaryCell(e) {
            var result = e.result;
            var grid = e.sender;
            if (e.field == "contnum") {
                e.cellHtml = "<span style='display: block;font-weight: bold;font-size: 12px;text-align: right;'>合计：</span>";
            }
            if (e.field == "contamt1") {
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
	    function checkProjectName(){
	    	var selectRow = grid.getSelected();
			var executeUrl = "/default/project/rdproject/projectDetail.jsp?projid=" + selectRow.projectId;
			window.open(executeUrl, "项目详细信息", "fullscreen=1");
	    }
	    
	    function ondrawGridcell(e){
			var record = e.record,
	        column = e.column,
	        field = e.field,
	        value = e.value;
            //设置行样式   超总预算标记为红颜色FF99CC，超阶段预算标记为黄颜色FFFF99。
        	if(record.ispassbud=='2'){
        		e.rowStyle = "background-color: #FF99CC";
        	}else if(record.ispassbud=='1'){
        		e.rowStyle = "background-color: #FFFF99";
        	}
		}
</script>
</body>
</html>
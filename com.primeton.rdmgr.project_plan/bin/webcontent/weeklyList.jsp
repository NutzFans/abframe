<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<!-- 
  - Author(s): ganli
  - Date: 2019-05-24 14:55:51
  - Description:
-->
<head>
<title>查看周报</title>
	<meta http-equiv="content-type" content="text/html; charset=UTF-8" />
	<script src="<%= request.getContextPath() %>/common/nui/nui.js" type="text/javascript"></script>
	<style type="text/css">
	    body{
	        margin:0;padding:0;border:0;width:100%;height:100%;overflow:hidden;
	    }
    </style>
    
</head>
<body>
	<div class="nui-fit">
    	<div class="nui-panel" title="周报查询" style="width:100%;">
	        <div style="width:100%;height:100%;padding:0px;margin:0px;" id="form1">
	        	<div class="nui-toolbar" style="border-bottom:0;padding:0px;">
	        		<input class="nui-hidden" id="projectNo" name="condition.projectNo" />
		            <!-- 数据实体的名称 -->
		            <table align="center" border="0" width="100%" class="form_table">
				        <tr>
				          <td class="form_label" align="right">提交时间：</td>
				          <td colspan="1" align="left" style="width: 250px">
				             <input class="nui-datepicker" id="minptime" name="condition.minptime" style="width:100px"/>-<input class="nui-datepicker" id="maxptime" name="condition.maxptime" style="width:100px"/>
				          </td>
				          <td class="form_label" align="right">周报内容：</td>
				          <td colspan="1">
				             <input class="nui-textbox" id="weeklycont" name="condition.weeklycont" style="width:150px;"/>
				          </td>
				      	</tr>
				      </table>
				      <table style="width:100%;" id = "toolbars1">
				    	<tr>
				            <td style="width:20%;" align="center">
					            <a class="nui-button" id="search" iconCls="icon-search" onclick="search()">查询</a>
					            <a class="nui-button" id="reset" iconCls="icon-reload" onclick="reset()">重置</a>
					            <a class="nui-button" id="close" onclick="onCancel()">关闭</a>
					        </td>
				        </tr>
				    </table> 
		        </div>
		     </div>
		     <div style="width:100%;" >
             <div id="datagrid1" sizeList="[10,20,50,100]" showPager="true" dataField="weeklys" 
            	showSummaryRow="true"  allowResize="true"
            	class="nui-datagrid" style="width:100%;height:340px;" url="com.primeton.rdmgr.project_plan.projectPlanManager.queryAllWeekly.biz.ext" 
            	multiSelect="true" allowSortColumn=true>
                <div property="columns">
                	<div type="checkcolumn"></div>
                    <div field="submitName" width="80" align="center" headerAlign="center" allowSort="true" >提交人</div>
                    <div field="ptime" width="80" align="center" headerAlign="center" allowSort="true"  renderer="renderTime" >提交时间</div>
                    <div field="weeklycont" width="200" align="left" headerAlign="center" >周报内容</div>
                </div>
            </div>
		</div>
		</div>
	</div>
</body>
<script type="text/javascript">
    	nui.parse();
    	var form = new nui.Form("form1");
    	var grid = nui.get("datagrid1");
    	
    	function setFormData(d) {
		    nui.get("projectNo").setValue(d);
			search();
	    }
	    
	    function search(){
	    	var data = form.getData(); //获取表单JS对象数据
	    	if((data.condition.minptime!=""&&data.condition.maxptime=="") || (data.condition.minptime==""&&data.condition.maxptime!="")){
	    		nui.alert("请选择提交时间段!");
	    		return false;
	    	} 
		  	grid.load(data); //datagrid加载数据
	    }
	    
    	function onCancel() {
	        if(window.CloseOwnerWindow){
	 			return window.CloseOwnerWindow("Cancel");
	 		}else{
	 			window.close();
	 		} 
	    }
	    
	    //格式化周报时间，并且增加超链接
		function renderTime(e){
			if(e.value){
			var reporttime = nui.formatDate(e.value,"yyyy-MM-dd HH:mm:ss");
	    		return reporttime;
	    	}
		}
		
		//重置表单
		function reset(){
			nui.get("minptime").setValue("");
			nui.get("maxptime").setValue("");
			nui.get("weeklycont").setValue("");
			
		}
	</script>
</html>
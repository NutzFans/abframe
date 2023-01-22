<%@page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<!-- 
  - Author(s): xupc
  - Date: 2014-08-22 16:28:09
  - Description:
-->
<script src="<%= request.getContextPath() %>/common/nui/nui.js" type="text/javascript"></script>
<%@include file="/common/common.jsp"%>
<head>
	<title>选择招聘需求编号</title>
	<meta http-equiv="content-type" content="text/html; charset=UTF-8" />
    <style type="text/css">
    body{
        margin:0;padding:0;border:0;width:100%;height:100%;overflow:hidden;
    }
    </style>	
</head>
	<body>
	    <div class="nui-toolbar" line-height="30px;" borderStyle="border:0;" id="form1">
			    <table id="table1" style="width: 100%;height:32px;font-size:12px;" align="center" >
		        	<tr>
		        		<td align="right" nowrap="nowrap">招聘职位:</td>
		        		<td align="left" nowrap="nowrap">
			        		<input class="nui-textbox" name="criteria._expr[0]._value" id = "recpositionname">
							<input class="nui-hidden" name="criteria._expr[0]._property" value="recpositionname">
							<input class="nui-hidden" name="criteria._expr[0]._op" value="like">
		        		</td>
		        		<td align="right" nowrap="nowrap">工作地点:</td>
		            	<td align="left" nowrap="nowrap">
						  	<input class="nui-dictcombobox" name="criteria._expr[1]._value" style="width:125px" id="workplace" showNullItem="true"  dictTypeId="AREA4CLRY" multiselect="true">
							<input class="nui-hidden" name="criteria._expr[1]._property" value="workplace">
							<input class="nui-hidden" name="criteria._expr[1]._op"  value="in">
						</td>
						<td align="right" nowrap="nowrap">提出日期:</td>
		            	<td align="left" nowrap="nowrap">
						  	<input class="nui-datepicker" id="min1" name="criteria._expr[2]._min" style="width:100px" dateFormat="yyyy-MM-dd H:mm:ss"/>-<input class="nui-datepicker" id="max1" name="criteria._expr[2]._max" style="width:100px"  dateFormat="yyyy-MM-dd H:mm:ss"/>
						    <input class="nui-hidden" name="criteria._expr[2]._property" value="propdate"/>
						    <input class="nui-hidden" name="criteria._expr[2]._op" value="between"/>
						    <input class="nui-hidden" name="criteria._expr[2]._pattern" value="yyyy-MM-dd HH:mm:ss"/>
						</td>
					</tr>	
	            	<tr>
	                    <td colspan="9" align="center">
				            <a class="nui-button grayBtn" iconCls="icon-search" onclick="search">查询</a>
							<a class="nui-button grayBtn" iconCls="icon-reload" onclick="reset">重置</a>
				        </td>
	                </tr>
	            </table>  
	      </div>
	    <div class="nui-fit">
	        <div id="grid1" class="nui-datagrid" style="width:100%;height:100%;"  idField="empid" allowSortColumn=true
	             allowResize="true" dataField="omRecruits"  allowCellWrap="true"
	             url="org.gocom.abframe.org.recruit.SelecrRecruitno.biz.ext" >
	            <div property="columns">	
	                <!-- <div field="recruitno" width="20" headerAlign="center" align="center" allowSort="true" >需求编号</div> -->
	                <div field="orgname" width="100" align="center" headerAlign="center">招聘部门</div>                             
	                <div field="recpositionname" width="80" align="center" headerAlign="center" allowSort="true">招聘职位</div>
	                <div field="propdate" width="80" align="center" headerAlign="center" allowSort="true" >提出日期</div>    
	                <div field="workplace" width="80" align="center" headerAlign="center" allowSort="true" renderer="getWorkspace">工作地点</div>
	                <!-- <div field="status" width="80" align="center" headerAlign="center" allowSort="true" renderer="getStatus">招聘状态</div> -->
	                <div field="workduties" width="200" align="left"  allowSort="true" headerAlign="center">工作职责</div>
	                <div field="recdesc" width="200" align="left" allowSort="true" headerAlign="center">招聘要求描述</div>
	                <!-- <div field="isreferrer" width="60" align="center" headerAlign="center" allowSort="true" renderer="getYN">是否支持内推</div> -->
	            </div>
	        </div>
		</div>  
		              
	    <div class="nui-toolbar" style="text-align:center;padding-top:8px;padding-bottom:8px;" borderStyle="border:0;">
	        <!-- <a class="nui-button" style="width:60px;" onclick="onOk()" iconCls="icon-ok">确定</a> -->
	        <span style="display:inline-block;width:25px;"></span>
	        <a class="nui-button" style="width:60px;" onclick="onCancel()" iconCls="icon-cancel">取消</a>
	    </div>
	</body>
	<script type="text/javascript">
		nui.parse();
		var form = new nui.Form("#form1"); 
		var grid = nui.get("grid1");
		//初始化
		init();
    	function init(){
    		grid.sortBy("recruitno","desc");
    		search(); 
		}
		//查询
		function search(){
		    var data = form.getData();
    	    var json = {"criteria":data.criteria,isflag:2};
			grid.load(json);
			grid.sortBy("recruitno","asc");
	   }
		function reset(){
			form.reset();
			search();
		}
		function CloseWindow(action) {
			if (window.CloseOwnerWindow) return window.CloseOwnerWindow(action);
			else window.close();
		}
		/* //保存
		function onOk() {
		    CloseWindow("ok");
		} */
		
		function onCancel() {
			CloseWindow("cancel");
		}
		function getJobType(e){
		    return nui.getDictText('AME_EMPTYPE2',e.value);
		}
		function getPosition(e){
			return nui.getDictText('EMP_TYPE',e.value);
		}
		function getWorkspace(e){
			return nui.getDictText('AREA4CLRY',e.value);
		}
		function getStatus(e){
			return nui.getDictText('RECRUIT_STATUS',e.value);
		}
		function getYN(e){
		    return nui.getDictText('MIS_YN',e.value);
	    }
</script>
</html>
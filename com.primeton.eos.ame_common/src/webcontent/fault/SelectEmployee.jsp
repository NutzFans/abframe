<%@page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">

<%@include file="/nui/common.jsp"%>
<%@include file="/common/common.jsp"%>
<head>
	<title></title>
	<meta http-equiv="content-type" content="text/html; charset=UTF-8" />
    <link href="../demo.css" rel="stylesheet" type="text/css" />
    <style type="text/css">
    body{
        margin:0;padding:0;border:0;width:100%;height:100%;overflow:hidden;
    }
    </style>	
</head>
<body>

	<div class="nui-toolbar" style="text-align:center;line-height:30px;" borderStyle="border:0;">
		<table id="form1" style="width:100%;">
    		<tr>
			 	<td align="right" nowrap="nowrap">人员姓名：</td>
			 	<td>
			 		<input class="nui-textbox" name="criteria._expr[0].empname" onenter="onKeyEnter"/>
	        		<input class="nui-hidden" name="criteria._expr[0]._op" value="like"/>
	        		<input class="nui-hidden" name="criteria._expr[0]._likeRule" value="all"/>
			    </td>
				<td align="right">员工类型：</td>
			 	<td>
			 		<input class="nui-dictcombobox"  name="criteria._expr[1]._value" style="width: 70px" dictTypeId="AME_EMPTYPE2" shownullItem="true" onenter="onKeyEnter"/>
		 		 	<input class="nui-hidden" name="criteria._expr[1]._property" value="degree"/>
                    <input class="nui-hidden" name="criteria._expr[1]._op" value="like"/>
			    </td>
			    <td align="right" nowrap="nowrap">员工状态：</td>
			 	<td>
			 		<input class="nui-dictcombobox" name="criteria._expr[2]._value" style="width: 70px" value="on" dictTypeId="ABF_EMPSTATUS" shownullItem="true" onenter="onKeyEnter"/>
		 		 	<input class="nui-hidden" name="criteria._expr[2]._property" value="empstatus"/>
                    <input class="nui-hidden" name="criteria._expr[2]._op" value="="/>
			    </td>
				<td align="right">入职日期：</td>
            	<td align="left">
				    <input class="nui-datepicker" id="min1" name="criteria._expr[3]._min" style="width:95px" onenter="onKeyEnter"/>-<input class="nui-datepicker" id="max1" name="criteria._expr[3]._max" onenter="onKeyEnter" style="width:95px"/>
		 		 	<input class="nui-hidden" name="criteria._expr[3]._property" value="indate"/>
                    <input class="nui-hidden" name="criteria._expr[3]._op" value="between"/>
				</td>
    		</tr>
    		<tr>
    			<td align="center" colspan="8">
    				<a class="nui-button" id="search" iconCls="icon-search" onclick="search()">查找</a>
                    <a class="nui-button" id="reset" iconCls="icon-reload" onclick="reset()">重置</a>
    			</td>
    		</tr>
		</table>
    </div>
    
    <div class="nui-fit">
        <div id="grid1" class="nui-datagrid" style="width:100%;height:100%;"
            idField="empid" allowResize="true" dataField="omEmployees" multiSelect="false" showPager="false"
            onrowdblclick="onRowDblClick" url="com.primeton.eos.ame_common.fault.queryEmployee.biz.ext">
            <div property="columns">	    
        		<div type="checkcolumn"></div>
        		<div type="indexcolumn"></div>
                <div field="userid" width="80" headerAlign="center">员工工号</div>                                            
                <div field="empname" width="120" headerAlign="center">员工姓名</div>    
                <div field="mobileno" width="100" headerAlign="center">手机</div>                                           
                <div field="orgname" width="100" headerAlign="center">部门名称</div>                                            
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
	var grid = nui.get("grid1");
	var form = new nui.Form("#form1");
	
	function SetData(data){
		if(data){
			if(data.multiSelect){//如果为true那么可以多选，else单选
				grid.setMultiSelect(true);
			}
			 if(data.isPage){//如果为true显示分页，else不显示分页
				grid.setShowPager(true);
			}
			var json = form.getData();
			json.isPage = data.isPage;
			grid.load(json);
		}
	}
	
	function search() {
		var data = form.getData();
		grid.load(data);
	}
	 
	function GetData() {
		var row = grid.getSelecteds();
		return row;
	}
	 
	function onKeyEnter(e) {
		search();
	}
	
	//重置
	function reset(){
		form.reset();
		var data = form.getData();
		grid.load(data);
	}
	    
	function onRowDblClick(e) {
		onOk();
	}

	function CloseWindow(action) {
		if (window.CloseOwnerWindow) return window.CloseOwnerWindow(action);
		else window.close();
	}
	
	function onOk() {
		CloseWindow("ok");
	}
	
	function onCancel() {
		CloseWindow("cancel");
	} 
</script>
</html>
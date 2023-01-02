<%@page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<%@include file="/nui/common.jsp"%>
<%@include file="/common/common.jsp"%>
<%@include file="/common/skins/skin0/component.jsp" %>
<head>

	<title>机器查询</title>
	<meta http-equiv="content-type" content="text/html; charset=UTF-8" />
	<script src="../common/nui/nui.js" type="text/javascript"></script>
	<link href="../demo.css" rel="stylesheet" type="text/css" />
	<style type="text/css">
    body{
        margin:0;padding:0;border:0;width:100%;height:100%;overflow:hidden;
    }
    </style>
</head>
<body>
	<div class="nui-fit">
	    <div id="form1">
			<input class="nui-hidden" name="sortField" value="id"/>
			<input class="nui-hidden" name="sortOrder" value="desc"/>
			<div class="nui-toolbar" style="border-bottom:0;padding:0px;">
				<table style="width:100%;">
					<tr>
			        	
					    <td align="right"><span>操作人员：</span></td>
		            	<td align="left">
		            		<input class="nui-hidden" name="criteria._expr[0]._property" value="operator"/>
					        <input class="nui-hidden" name="criteria._expr[0]._op" value="in" id="tempcond11"/>
					        <input class="nui-hidden" name="criteria._expr[0]._ref" value="1" id="tempcond12"/>
					        <input class="nui-hidden" name="criteria._ref[0]._id" value="1"/>
					        <input class="nui-hidden" name="criteria._ref[0]._entity" value="org.gocom.abframe.dataset.organization.OmEmployee"/>
					        <input class="nui-hidden" name="criteria._ref[0]._select._field[0]" value="userid"/>
					        <input class="nui-textbox" name="criteria._ref[0]._expr[0].empname" id="czr"/>
					        <input class="nui-hidden" name="criteria._ref[0]._expr[0]._op" value="like"/>
					        <input class="nui-hidden" name="criteria._ref[0]._expr[0]._likeRule" value="all"/>
					    </td>
					    <td align="right"><span>原区域：</span></td>
		            	<td align="left">
		            		<input class="nui-dictcombobox" name="criteria._expr[1]._value" dictTypeId="EXP_REGION"/>
		            		<input class="nui-hidden" name="criteria._expr[1]._property" value="areaOld"/>
					        <input class="nui-hidden" name="criteria._expr[1]._op" value="="/>
					        <input class="nui-hidden" name="criteria._expr[1]._likeRule" value="all"/>
					    </td>
					    <td align="right"><span>新区域：</span></td>
		            	<td align="left">
		            		<input class="nui-dictcombobox" name="criteria._expr[2]._value" dictTypeId="EXP_REGION"/>
		            		<input class="nui-hidden" name="criteria._expr[2]._property" value="area"/>
					        <input class="nui-hidden" name="criteria._expr[2]._op" value="="/>
					        <input class="nui-hidden" name="criteria._expr[2]._likeRule" value="all"/>
					    </td>
					    <td align="right"><span>更改日期：</span></td>
		            	<td align="left">
		            		<input class="nui-datepicker" name="criteria._expr[3]._min" style="width:125px"/>-<input class="nui-datepicker" name="criteria._expr[3]._max" style="width:125px"/>
					        <input class="nui-hidden" name="criteria._expr[3]._property" value="changtime"/>
					        <input class="nui-hidden" name="criteria._expr[3]._op" value="between"/>
					        <input class="nui-hidden" name="criteria._expr[3]._pattern" value="yyyy-MM-dd"/>
					    </td>
		    		</tr>
		    		<tr>
					    <td align="right" id="fzrname"><span>原负责人：</span></td>
		            	<td align="left">
		            		<input class="nui-hidden" name="criteria._expr[4].userOld"/>
					        <input class="nui-hidden" name="criteria._expr[4]._op" value="in" id="tempcond21"/>
					        <input class="nui-hidden" name="criteria._expr[4]._ref" value="2" id="tempcond22"/>
					        <input class="nui-hidden" name="criteria._ref[1]._id" value="2"/>
					        <input class="nui-hidden" name="criteria._ref[1]._entity" value="org.gocom.abframe.dataset.organization.OmEmployee"/>
					        <input class="nui-hidden" name="criteria._ref[1]._select._field[0]" value="userid"/>
					        <input class="nui-textbox" name="criteria._ref[1]._expr[0].empname" id="yfzr"/>
					        <input class="nui-hidden" name="criteria._ref[1]._expr[0]._op" value="like"/>
					        <input class="nui-hidden" name="criteria._ref[1]._expr[0]._likeRule" value="all"/>
					    </td>
					    <td align="right" id="fzrname"><span>新负责人：</span></td>
		            	<td align="left">
		            		<input class="nui-hidden" name="criteria._expr[5].usingemp" />
					        <input class="nui-hidden" name="criteria._expr[5]._op" value="in" id="tempcond31"/>
					        <input class="nui-hidden" name="criteria._expr[5]._ref" value="3" id="tempcond32"/>
					        <input class="nui-hidden" name="criteria._ref[2]._id" value="3"/>
					        <input class="nui-hidden" name="criteria._ref[2]._entity" value="org.gocom.abframe.dataset.organization.OmEmployee"/>
					        <input class="nui-hidden" name="criteria._ref[2]._select._field[0]" value="userid"/>
					        <input class="nui-textbox" name="criteria._ref[2]._expr[0].empname" id="fzr"/>
					        <input class="nui-hidden" name="criteria._ref[2]._expr[0]._op" value="like"/>
					        <input class="nui-hidden" name="criteria._ref[2]._expr[0]._likeRule" value="all"/>
					    </td>
					    <td align="right"><span>原状态：</span></td>
		            	<td align="left">
		            		<input class="nui-dictcombobox" name="criteria._expr[6]._value" dictTypeId="MIS_MA_STATUS"/>
		            		<input class="nui-hidden" name="criteria._expr[6]._property" value="statusOld"/>
					        <input class="nui-hidden" name="criteria._expr[6]._op" value="="/>
					        <input class="nui-hidden" name="criteria._expr[6]._likeRule" value="all"/>
					    </td>
					    <td align="right"><span>新状态：</span></td>
		            	<td align="left">
		            		<input class="nui-dictcombobox" name="criteria._expr[7]._value" dictTypeId="MIS_MA_STATUS"/>
		            		<input class="nui-hidden" name="criteria._expr[7]._property" value="status"/>
					        <input class="nui-hidden" name="criteria._expr[7]._op" value="="/>
					        <input class="nui-hidden" name="criteria._expr[7]._likeRule" value="all"/>
					    </td>
		    		</tr>
		    		<tr>
		    			<td align="right"><span>资产编号：</span></td>
		            	<td align="left">
		            		<input class="nui-textbox" name="criteria._expr[8]._value"/>
		            		<input class="nui-hidden" name="criteria._expr[8]._property" value="assetnum"/>
					        <input class="nui-hidden" name="criteria._expr[8]._op" value="like"/>
					        <input class="nui-hidden" name="criteria._expr[8]._likeRule" value="all"/>
					    </td>
		    			<td align="right"><span>原所属部门：</span></td>
		            	<td align="left">
		            		<input class="nui-hidden" name="criteria._expr[9].deptOld"/>
					        <input class="nui-hidden" name="criteria._expr[9]._op" value="in" id="tempcond41"/>
					        <input class="nui-hidden" name="criteria._expr[9]._ref" value="4" id="tempcond42"/>
					        <input class="nui-hidden" name="criteria._ref[3]._id" value="4"/>
					        <input class="nui-hidden" name="criteria._ref[3]._entity" value="org.gocom.abframe.dataset.organization.OmOrganization"/>
					        <input class="nui-hidden" name="criteria._ref[3]._select._field[0]" value="orgid"/>
					        <input class="nui-textbox" name="criteria._ref[3]._expr[0].orgname" id="ybm"/>
					        <input class="nui-hidden" name="criteria._ref[3]._expr[0]._op" value="like"/>
					        <input class="nui-hidden" name="criteria._ref[3]._expr[0]._likeRule" value="all"/>
					    </td>
					    <td align="right"><span>新所属部门：</span></td>
		            	<td align="left">
		            		<input class="nui-hidden" name="criteria._expr[10].dept"/>
					        <input class="nui-hidden" name="criteria._expr[10]._op" value="in" id="tempcond51"/>
					        <input class="nui-hidden" name="criteria._expr[10]._ref" value="5" id="tempcond52"/>
					        <input class="nui-hidden" name="criteria._ref[4]._id" value="5"/>
					        <input class="nui-hidden" name="criteria._ref[4]._entity" value="org.gocom.abframe.dataset.organization.OmOrganization"/>
					        <input class="nui-hidden" name="criteria._ref[4]._select._field[0]" value="orgid"/>
					        <input class="nui-textbox" name="criteria._ref[4]._expr[0].orgname" id="bm"/>
					        <input class="nui-hidden" name="criteria._ref[4]._expr[0]._op" value="like"/>
					        <input class="nui-hidden" name="criteria._ref[4]._expr[0]._likeRule" value="all"/>
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
	    <div id="datagrid1" class="nui-datagrid" style="width:auto;height:auto" 
	            url="com.primeton.eos.machine.machine.ChangeQuery.biz.ext"
	            idField="id" sizeList="[5,10,20,50]" pageSize="10" multiSelect="true" allowCellEdit="true" allowCellSelect="true">
	        <div property="columns">
	        	<div type="indexcolumn"></div>
	        	<div field="changeid" width="0" headerAlign="center" allowSort="true">变更编号</div>
	        	<div field="assetnum" width="60" headerAlign="center" renderer="onActionRenderer" allowSort="true">资产编号</div>
	        	<div field="operatorname" width="60" headerAlign="center"  allowSort="true">操作人</div>
	        	<div field="changetime"width="80" headerAlign="center" dateFormat="yyyy-MM-dd" allowSort="true">更改时间</div>
	        	<div field="oldemp" width="50" headerAlign="center">原负责人</div>
	        	<div field="emp" headerAlign="center" width="50" >新负责人</div>
	        	<div field="oldorg" width="80" headerAlign="center">原所属部门</div>
	        	<div field="org" headerAlign="center" width="80">新所属部门</div>
	        	<div field="statusOld"width="60" renderer="dictStatus" headerAlign="center" allowSort="true">原状态</div>
	        	<div field="status"width="60" renderer="dictStatus" headerAlign="center" allowSort="true">新状态</div>
	        	<div field="areaOld"width="60" renderer="dictArea" headerAlign="center" allowSort="true">原区域</div>
	        	<div field="area" renderer="dictArea" width="60" headerAlign="center" allowSort="true">新区域</div>
	        	<div field="changeType" width="120" headerAlign="center">更改方式</div>
	        </div>
	     </div>
	     <div style="text-align:center;padding:10px;border-width:1px 0px 0px 0px;" class="nui-toolbar">               
    		<a class="nui-button" onclick="onCancel('cancel')" style="width:60px;">关闭</a>
		</div>
		</div>
	</div>
<script type="text/javascript">
	nui.parse();
	var grid=nui.get("datagrid1");
	grid.load();
	grid.sortBy("changeid","desc");
	
	function search(){
		if(nui.get("czr").getValue()==""){
			nui.get("tempcond11").setValue("=");
			nui.get("tempcond12").setValue("");
		} else {
			nui.get("tempcond11").setValue("in");
			nui.get("tempcond12").setValue("1");
		}
		if(nui.get("yfzr").getValue()==""){
			nui.get("tempcond21").setValue("=");
			nui.get("tempcond22").setValue("");
		} else {
			nui.get("tempcond21").setValue("in");
			nui.get("tempcond22").setValue("2");
		}
		if(nui.get("fzr").getValue()==""){
			nui.get("tempcond31").setValue("=");
			nui.get("tempcond32").setValue("");
		} else {
			nui.get("tempcond31").setValue("in");
			nui.get("tempcond32").setValue("3");
		}
		if(nui.get("ybm").getValue()==""){
			nui.get("tempcond41").setValue("=");
			nui.get("tempcond42").setValue("");
		} else {
			nui.get("tempcond41").setValue("in");
			nui.get("tempcond42").setValue("4");
		}
		if(nui.get("bm").getValue()==""){
			nui.get("tempcond51").setValue("=");
			nui.get("tempcond52").setValue("");
		} else {
			nui.get("tempcond51").setValue("in");
			nui.get("tempcond52").setValue("5");
		}
		var form = new nui.Form("#form1");
		var data = form.getData();
        grid.load(data);
	}

 	function onActionRenderer(e) {
 		return "<a href='javascript:void(0)' onclick='doView();' title='点击查看'>" + e.value + "</a>";
 	}
 
 	function doView(){
 		var selectRow = grid.getSelected();
		var executeUrl = "/default/machine/machineChangeDetail.jsp?changeid=" + selectRow.changeid;
		window.open(executeUrl, "机器变更详细信息", "fullscreen=1");
    }
   
	function dictType(e){
		return nui.getDictText("MIS_MA_TYPE",e.value);
	}
	
	function dictStorageType(e){
		return nui.getDictText("MIS_MA_STORAGE",e.value);
	}
	
	function dictStatus(e){
		return nui.getDictText("MIS_MA_STATUS",e.value);
	}
	
	function dictArea(e){
		return nui.getDictText("EXP_REGION",e.value);
	}
	
	function reset(){
		var form = new nui.Form("#form1");
		form.reset();
		grid.load();
	}
	
	function onCancel(e) {
		if (window.CloseOwnerWindow) 
			return window.CloseOwnerWindow(e);
        else window.close();  
    }
</script>
</body>
</html>
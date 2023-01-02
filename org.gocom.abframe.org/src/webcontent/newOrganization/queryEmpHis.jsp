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
<title>人员组织变动查询</title>
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
	<div class="nui-panel" title="人员组织变动查询" style="width:100%;">
        <div style="width:100%;height:100%;padding:0px;margin:0px;" id="form1">
        	<div class="nui-toolbar" style="border-bottom:0;padding:0px;">
	            <table align="center" border="0" width="100%" class="form_table">
        <tr>
          <td class="form_label" align="right">
           人员姓名
          </td>
          <td colspan="1">
            <input class="nui-hidden" name="criteria._expr[0]._property" value="empid"/>
	        <input class="nui-hidden" name="criteria._expr[0]._op" value="in" id="aaa"/>
	        <input class="nui-hidden" name="criteria._expr[0]._ref" value="1" id="bbb"/>
	        <input class="nui-hidden" name="criteria._ref[0]._id" value="1"/>
	        <input class="nui-hidden" name="criteria._ref[0]._entity" value="org.gocom.abframe.dataset.organization.OmEmployee"/>
	        <input class="nui-hidden" name="criteria._ref[0]._select._field[0]" value="empid"/>
	        <input class="nui-hidden" name="criteria._ref[0]._expr[0]._property" value="empname"/>
	        <input class="nui-textbox" name="criteria._ref[0]._expr[0]._value" id="expuser"  style="width:150px;"/>
	        <input class="nui-hidden" name="criteria._ref[0]._expr[0]._op" value="like"/>
	        <input class="nui-hidden" name="criteria._ref[0]._expr[0]._likeRule" value="all"/>
          </td>
          <td class="form_label" align="right">部门名称</td>
          <td colspan="1">
            <input name="criteria._expr[1]._value" class="nui-combobox" url="com.primeton.rdmgr.labor.labormgr.getAllOrgs.biz.ext" 
			filterType="like" textField="orgname" valueField="orgid" dataField="allorgs" valueFromSelect="true" allowInput="true" style="width:150px;"  />
		    <input class="nui-hidden" name="criteria._expr[1]._property" value="orgid"/>
		    <input class="nui-hidden" name="criteria._expr[1]._op" value="="/>
          </td>
          <td class="form_label" align="right">组织变动类型</td>
          <td align="left">		        
			  <input class="nui-hidden" name="criteria._expr[3]._property" value="nature"/>
			  <input class="nui-hidden" name="criteria._expr[3]._op" value="in"/>
			  <input name="criteria._expr[3]._value" class="nui-dictcombobox" dictTypeId="ORG_CHANGE_TYPE" multiSelect="true" shownullItem="true" style="width:100px;"  />
	     </td>
          <td class="form_label" align="right">日期范围</td>
          <td colspan="1">
			<input class="nui-datepicker" name="criteria._expr[2]._min" style="width:100px"/>-<input class="nui-datepicker" name="criteria._expr[2]._max" style="width:100px"/>
		    <input class="nui-hidden" name="criteria._expr[2]._property" value="startdate"/>
		    <input class="nui-hidden" name="criteria._expr[2]._op" value="between"/>
		    <input class="nui-hidden" name="criteria._expr[2]._pattern" value="yyyy-MM-dd"/>
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
            <div id="datagrid1"  class="nui-datagrid" sizeList="[10,20,50,100]" showPager="true" dataField="omEmpHiss" 
            	showSummaryRow="true"  sortMode="client" onselectionchanged="selectionChanged" multiSelect="true" allowSortColumn="true"
            	 style="width:100%;height:400px;" url="org.gocom.abframe.org.organization.newOrgEmp.queryEmpHis.biz.ext">
                <div property="columns">
                    <div field="empname" width="80" align="center" headerAlign="center" allowSort="true" >人员姓名</div>
                    <div field="empcode" width="80" align="center"headerAlign="center" allowSort="true" >人员工号</div>
                    <div field="userid" width="100" align="center"headerAlign="center" allowSort="true" >人员登录名</div>
                    <div field="orgname" width="120" align="center" headerAlign="center" allowSort="true" >所属部门</div>
                    <div field="startdate" width="120" align="center" headerAlign="center" allowSort="true">开始日期</div>
                    <div field="enddate" width="90" align="center" headerAlign="center" allowSort="true" >结束日期</div>
                    <div field="currstate" width="60" align="center" headerAlign="center" allowSort="true" renderer="dictGetType">当前状态</div>
                    <div field="nature" width="100" align="center" headerAlign="center" allowSort="true" renderer="dictNature">组织变动类型</div>
                    <div field="operattime" width="140" align="center" headerAlign="center" allowSort="true" dateFormat="yyyy-MM-dd HH:mm:ss">操作时间</div>
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
			grid.sortBy("startdate","desc");
		}

		function dictGetType(e){
			return nui.getDictText('ABF_HIS_EMPSTATE',e.value);
		}
		function dictNature(e){
			return nui.getDictText('ORG_CHANGE_TYPE',e.value);
		}
		
		function search() {
			if(nui.get("expuser").getValue()==""||nui.get("expuser").getValue()==null){
				nui.get("aaa").setValue("=");
				nui.get("bbb").setValue("");
			}else{
				nui.get("aaa").setValue("in");
				nui.get("bbb").setValue("1");
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
		
</script>
</body>
</html>
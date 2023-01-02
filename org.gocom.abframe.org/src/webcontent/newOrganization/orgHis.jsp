<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<!-- 
  - Author(s): zhang-yb
  - Date: 2018-08-02 09:39:00
  - Description:
-->
<head>
<title>组织机构变动查询</title>
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
	<div class="nui-panel" title="组织组织变动查询" style="width:100%;">
		<div id="form1" class="nui-toolbar" style="border-bottom:0;padding:0px;">
	    	<table align="center" border="0" width="100%" class="form_table">
		        <tr>
		          	<td class="form_label" align="right">机构名称：</td>
		          	<td colspan="1">
    					<input name="criteria._expr[0]._value" class="nui-combobox" style="width: 170px" id="orgseq" textField="orgname" valueField="orgid" dataField = "orgs"  shownullItem="true" onenter="onKeyEnter"
					    allowInput="true" url="com.bos.mp.common.SelectManage.getAllOrgS.biz.ext"/>
						<input class="nui-hidden" name="criteria._expr[0]._property" value="orgid"/>
			 		 	<input class="nui-hidden" name="criteria._expr[0]._op" value="="/>
		          	</td>
		          	<td class="form_label" align="right">父机构名称：</td>
		          	<td colspan="1">
		          		<input name="criteria._expr[1]._value" class="nui-combobox" style="width: 170px" id="orgseq" textField="orgname" valueField="parentorgid" dataField = "orgs"  shownullItem="true" onenter="onKeyEnter"
					    allowInput="true" url="com.bos.mp.common.SelectManage.getAllOrgS.biz.ext"/>
						<input class="nui-hidden" name="criteria._expr[1]._property" value="parentorgid"/>
			 		 	<input class="nui-hidden" name="criteria._expr[1]._op" value="="/>
		          	</td>
		          	<td class="form_label" align="right">机构状态：</td>
		          	<td colspan="1">
		          		<input class="nui-dictcombobox" name="criteria._expr[3]._value" style="width: 70px" dictTypeId="ABF_ORGSTATUS" shownullItem="true" onenter="onKeyEnter"/>
						<input class="nui-hidden" name="criteria._expr[3]._property" value="orgstatus"/>
			 		 	<input class="nui-hidden" name="criteria._expr[3]._op" value="="/>
		          	</td>
		          	<td class="form_label" align="right">日期范围：</td>
		          	<td colspan="1">
						<input class="nui-datepicker" name="criteria._expr[2]._min" style="width:100px"  onenter="onKeyEnter"/>-<input class="nui-datepicker" name="criteria._expr[2]._max" style="width:100px"  onenter="onKeyEnter"/>
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
	    <div id="datagrid1"  class="nui-datagrid" sizeList="[10,20,50,100]" showPager="true" dataField="orgHis" 
    	 multiSelect="true" allowSortColumn="false"
    	 style="width:100%;height:400px;" url="org.gocom.abframe.org.party.PartyManager.queryOrgHis.biz.ext">
	        <div property="columns">
	            <div field="orgname" width="100" align="left" headerAlign="center">机构名称</div>
	            <div field="parentorgname" width="100" align="left"headerAlign="center" >父机构名称</div>
	            <div field="startdate" width="90" align="center" headerAlign="center">开始日期</div>
	            <div field="enddate" width="90" align="center" headerAlign="center" >结束日期</div>
	            <div field="orgstatus" width="60" align="center" headerAlign="center" renderer="dictGetType">当前状态</div>
	            <div field="nature" width="60" align="center" headerAlign="center" renderer="dictNature">组织变动类型</div>
	            <div field="operattime" width="90" align="center" headerAlign="center" dateFormat="yyyy-MM-dd HH:mm:ss">操作时间</div>
	        </div>
	    </div>
	</div>
</div>
</body>
<script type="text/javascript">
	nui.parse();
	var form = new nui.Form("#form1");
	var grid = nui.get("datagrid1");
	
	search();
	
	function dictGetType(e){
		return nui.getDictText('ABF_ORGSTATUS',e.value);
	}
	function dictNature(e){
		return nui.getDictText('ORG_CHANGE_TYPE',e.value);
	}
	
	function search() {
		var form = new nui.Form("#form1");
		var data = form.getData(); //获取表单JS对象数据
	  	grid.load(data); //datagrid加载数据
	}
	
	function reset(){
		var form = new nui.Form("#form1");
		form.reset();
		search();
	}
	
	//回车触发
	function onKeyEnter(){
		search();
	}
</script>
</html>
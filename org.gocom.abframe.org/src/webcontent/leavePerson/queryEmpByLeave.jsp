<%@page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<%@include file="/nui/common.jsp"%>
<html>
<!-- 
  - Author(s): Administrator
  - Date: 2015-07-10 14:06:49
  - Description:
-->
<head>
	<title>离职人员查询</title>
	<link href="../demo.css" rel="stylesheet" type="text/css" />
</head>
<body style="width:100%;height:100%;padding:0px;margin:0px;">
<div class="nui-fix">
	<div class="nui-panel" title="离职人员查询" style="width:100%;">
	<div id="form1">
		<div class="nui-toolbar" style="border-bottom:0;padding:0px;">
			<table style="width:100%;">
				  <tr>
			      	  <td class="form_label" align="right" style="width:150px;">人员名称</td>
			          <td colspan="1" align="left">
			            <input name="criteria._expr[0]._value" class="nui-textbox" style="width:150px;" onenter="onKeyEnter"/>
					    <input class="nui-hidden" name="criteria._expr[0]._property" value="empname"/>
					    <input class="nui-hidden" name="criteria._expr[0]._op" value="like"/>
					    <input class="nui-hidden" name="criteria._expr[0]._likeRule" value="all"/>
			          </td>
			          <td class="form_label" align="right" style="width:150px;">员工工号</td>
			          <td colspan="1">
			            <input name="criteria._expr[1]._value" class="nui-textbox" style="width:150px;" onenter="onKeyEnter"/>
					    <input class="nui-hidden" name="criteria._expr[1]._property" value="empcode"/>
					    <input class="nui-hidden" name="criteria._expr[1]._op" value="like"/>
					    <input class="nui-hidden" name="criteria._expr[1]._likeRule" value="all"/>
			          </td>
				      <td class="form_label" align="right" style="width:150px;">登陆名</td>
			          <td colspan="1">
			            <input name="criteria._expr[2]._value" class="nui-textbox" style="width:204px;" onenter="onKeyEnter"/>
					    <input class="nui-hidden" name="criteria._expr[2]._property" value="userid"/>
					    <input class="nui-hidden" name="criteria._expr[2]._op" value="like"/>
					    <input class="nui-hidden" name="criteria._expr[2]._likeRule" value="all"/>
			          </td>
	    		</tr>
				<tr>
					<td class="form_label" align="right" style="width:150px;">离职性质</td>
		          	<td colspan="1">
			           	<input name="criteria._expr[3]._value" class="nui-dictcombobox" id="outtype" dictTypeId="OUT_TYPE" shownullItem="true" style="width:150px;" onvaluechanged="changeReason"/>
					    <input class="nui-hidden" name="criteria._expr[3]._property" value="outtype"/>
					    <input class="nui-hidden" name="criteria._expr[3]._op" value="="/>
		          	</td>
			    	<td class="form_label" align="right" style="width:150px;">离职原因</td>
		          	<td colspan="1">
			           	<input name="criteria._expr[4]._value" id="outreason" class="nui-dictcombobox" dictTypeId="OUT_REASON"  multiSelect="true" shownullItem="true"  width="150px" />
					    <input class="nui-hidden" name="criteria._expr[4]._property" value="outreason"/>
					    <input class="nui-hidden" name="criteria._expr[4]._op" value="="/>
		          	</td>
		    		<td class="form_label" align="right" style="width:150px;">离职日期</td>
		          	<td colspan="1">
						 <input class="nui-datepicker" name="criteria._expr[5]._min" style="width:100px"/>-<input class="nui-datepicker" name="criteria._expr[5]._max" style="width:100px"/>
						 <input class="nui-hidden" name="criteria._expr[5]._property" value="outdate"/>
						 <input class="nui-hidden" name="criteria._expr[5]._op" value="between"/>
						 <input class="nui-hidden" name="criteria._expr[5]._pattern" value="yyyy-MM-dd"/>
		          	</td>
		      	</tr>
		      	<tr>
		      	<td align="right">员工属性：</td>
            	<td align="left" >
                    <input class="nui-dictcombobox"  name="criteria._expr[6]._value"  style="width: 150px" dictTypeId="EMP_TYPE"  multiSelect="true" shownullItem="true"/>
		 		 	<input class="nui-hidden" name="criteria._expr[6]._property" value="emptype"/>
                    <input class="nui-hidden" name="criteria._expr[6]._op" value="in"/>
				</td>
				<td align="right">人员性质：</td>
            	<td align="left" >
                    <input class="nui-dictcombobox"  name="criteria._expr[7]._value"  style="width: 150px" dictTypeId="AME_EMPTYPE2" multiSelect="true" shownullItem="true"/>
		 		 	<input class="nui-hidden" name="criteria._expr[7]._property" value="nature"/>
                    <input class="nui-hidden" name="criteria._expr[7]._op" value="in"/>
				</td>
		      	</tr>
	    		<tr>
	    			<td align="center" colspan="8">
						<a class="nui-button" id="search" iconCls="icon-search" onclick="search">查找</a>
						<a class="nui-button" id="reset" iconCls="icon-reload" onclick="reset">重置</a>
					</td>
				</tr>
	    	</table>
    	</div>
	</div>
	<div class="nui-fit">
	    <div id="datagrid1" frozenStartColumn="0" sizeList="[10,20,50,100]" showPager="true" dataField="emps" 
        	showSummaryRow="true"  sortMode="client" allowCellWrap="true"
        	class="nui-datagrid" style="width:100%;height:340px;" url="org.gocom.abframe.org.employee.EmpByLeave.queryEmpByLeave.biz.ext" 
        	multiSelect="true" allowSortColumn=true>
            <div property="columns">
            	<div type="checkcolumn"></div>
                <div field="empcode" width="60" align="center" headerAlign="center" allowSort="true" >员工工号</div>
                <div field="empname" width="80" align="center" headerAlign="center" allowSort="true">人员姓名</div>
                <div field="userid" width="70" align="center" headerAlign="center" allowSort="true" >用户登录名</div>
                <div field="emptype" width="60" headerAlign="center" align="center" renderer="getEmptype" allowSort="true">员工属性</div> 
                <div field="nature" width="60" headerAlign="center" align="center" renderer="getNature" allowSort="true">人员性质</div>
                <!-- <div field="empstatus" width="70" align="center" headerAlign="center" allowSort="true" >员工状态</div>  -->
                <div field="outtype" width="100" align="center" headerAlign="center" allowSort="true" renderer="dictGetOuttype">离职性质</div>
                <div field="outreason" width="100" align="center" headerAlign="center" allowSort="true" renderer="dictGetOutreason">离职原因</div>
                <div field="outdate" width="100" align="center" headerAlign="center" allowSort="true">离职日期</div>
                <div field="outmakeup" width="200" align="left" headerAlign="center" allowSort="true">离职补偿</div>
                <div field="outto" width="200" align="left" headerAlign="center" allowSort="true">离职去向</div>
                <div field="outmemo" width="250" align="left"headerAlign="center" allowSort="true">离职说明</div>
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
</body>
<script>
	nui.parse();
	var grid = nui.get("datagrid1");
	var state = false;
	search();
	
	function search() {
		var form = new nui.Form("#form1");
		var data = form.getData();
		grid.load(data);
	}
	function reset(){
		var form = new nui.Form("#form1");
		form.reset();
		grid.load();
	}
	
	function dictGetOuttype(e){
		return nui.getDictText('OUT_TYPE',e.value);
	}
	
	function dictGetOutreason(e){
		return nui.getDictText('OUT_REASON',e.value);
	}
	
	function changeReason(){
			var outtype = nui.get("outtype").getValue();
			if(outtype == null || outtype == ""){
				nui.get("outreason").setData(null);
			}else{
				var json = nui.encode({"dictid":outtype});
				nui.ajax({
	        		url: "org.gocom.abframe.org.employee.EmpManager.changeOutReason.biz.ext",
	        		data: json,
	        		type: 'POST',
	    			cache: false,
	    			contentType: 'text/json',
	    			success: function(text){
	    				nui.get("outreason").setData(text.data);
	    			},
	    			error: function(jqXHR, textStatus, errorThrown){
	    			}
	        	});
			}
		}	
	
	
	//回车触发
	function onKeyEnter(){
		search();
	}
	//人员属性
	function getEmptype(e){
		return nui.getDictText('EMP_TYPE',e.value);
	}
	//人员性质
	function getNature(e){
		return nui.getDictText('AME_EMPTYPE2',e.value);
	}
</script>
</html>
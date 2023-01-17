<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@include file="/common/common.jsp"%>
<html>
<!-- 
  - Author(s): 张一博
  - Date: 2018-03-14 13:40:07
  - Description:
-->
<head>
<title>机构查询</title>
<script src="<%= request.getContextPath() %>/common/nui/nui.js" type="text/javascript"></script>

</head>
<body>
<div style="width:100%;height:100%;padding:0px;margin:0px;" >
	<div style="width:100%;">
        <div class="nui-toolbar" style="border-bottom:0;padding:0px;">
            <table style="width:100%;">
            	<tr>
                    <td style="width:20%;">
                       	组织机构列表
                    </td>
                </tr>
             </table>           
        </div>
    </div>
    <div id="form1" class="nui-toolbar" style="border-bottom:0;padding:0px;">
    	<input class="nui-hidden" name="ctOrg._entity" value="org.gocom.abframe.dataset.organization.OmOrganization"/>
    	<table style="width:100%;">
    		<tr>
			 	<!-- <td align="right" nowrap="nowrap">机构代码：</td>
			 	<td>
			 		<input class="nui-textbox" name="ctOrg._expr[0]._value"/>
		 		 	<input class="nui-hidden" name="ctOrg._expr[0]._property" value="orgcode"/>
                    <input class="nui-hidden" name="ctOrg._expr[0]._op" value="like"/>
			    </td> -->
				<td align="right">机构名称：</td>
            	<td align="left">
				    <input class="nui-textbox" name="ctOrg._expr[1]._value" dictTypeId="ABF_APPTYPE" id="dyassetnum1"/>
		 		 	<input class="nui-hidden" name="ctOrg._expr[1]._property" value="orgname"/>
                    <input class="nui-hidden" name="ctOrg._expr[1]._op" value="like"/>
				</td>
				<!-- <td align="right">机构类型：</td>
            	<td align="left">
				    <input class="nui-dictcombobox" name="ctOrg._expr[2]._value" dictTypeId="ABF_ORGTYPE" />
		 		 	<input class="nui-hidden" name="ctOrg._expr[2]._property" value="orgtype"/>
                    <input class="nui-hidden" name="ctOrg._expr[2]._op" value="="/>
				</td>
				<td align="right">机构状态：</td>
            	<td align="left">
				    <input class="nui-dictcombobox" name="ctOrg._expr[3]._value" dictTypeId="ABF_ORGSTATUS" id="dyassetnum1"/>
		 		 	<input class="nui-hidden" name="ctOrg._expr[3]._property" value="status"/>
                    <input class="nui-hidden" name="ctOrg._expr[3]._op" value="="/>
				</td> -->
    		</tr>
    		<tr>
    			<td align="center" colspan="8">
    				<a class="nui-button" id="search" iconCls="icon-search" onclick="search()">查找</a>
                    <a class="nui-button" id="reset" iconCls="icon-reload" onclick="reset()">重置</a>
                    
    				<form name="viewlist1" id="viewlist1" action="com.primeton.eos.ame_common.ameExportCommon.flow" method="post">
						<input type="hidden" name="_eosFlowAction" value="action0" filter="false"/>
						<input type="hidden" name="downloadFile" filter="false"/>
						<input type="hidden" name="fileName" filter="false"/>
					</form>
    			</td>
    		</tr>
    	</table>
    </div>
</div>
<div style="width:100%;">

</div>
<div id="datagrid1"  class="nui-datagrid" style="width:100%;height:372px;"
    dataField="oaOrg" multiSelect="true" pageSize="20" sizeList="[10,20,30,50]" allowAlternating="true"
    url='org.gocom.abframe.org.organization.OrgManager.queryOrgByCriteria.biz.ext',>
    <div property="columns">
    	<div type="checkcolumn"></div>
        <!-- <div field="orgcode" width="50" headerAlign="center" align="center">机构代码</div> -->
    	<div field="orgname" width="100" headerAlign="center" align="center" >机构名称</div> 	    
       <!--  <div field="orgtype" width="70" headerAlign="center" align="center" renderer="orgtype">机构类型</div>
        <div field="status" width="50" headerAlign="center"  align="center" renderer="status">机构状态</div> 
         <div field="orgdegree" width="50" headerAlign="center" align="center" renderer="orgdegree">机构等级</div>  -->
    </div>
</div>
<div class="nui-toolbar" style="text-align:center;padding-top:8px;padding-bottom:8px;" borderStyle="border:0;">
		<a class="nui-button" style="width:60px;" onclick="onOk()">确定</a>
	    <span style="display:inline-block;width:25px;"></span>
	    <a class="nui-button" style="width:60px;" onclick="onCancel()">关闭</a>
	</div>
</body>
<script type="text/javascript">
	nui.parse();
	var grid = nui.get('datagrid1');
	var appid = '<%=request.getParameter("appid") %>';
	search();
	//查询功能列表
	function search(){
		var form = new nui.Form("#form1");
        var data = form.getData();
		grid.load(data);
	}
	
	function onOk() {
      	var row = grid.getSelected();
      	if (!row) {
        	alert("请选中一条记录");
        	return;
      	}
      	CloseWindow("ok");
    }
    
    function CloseWindow(action) {            
        if (action == "close" && form.isChanged()) {
            if (confirm("数据被修改了，是否先保存？")) {
                return false;
            }
        }
        if (window.CloseOwnerWindow) return window.CloseOwnerWindow(action);
        else window.close();            
    }
	
	//导出当前页
	function exportPage(){
		var form = new nui.Form("#form1");
        var data = form.getData();
		var json = {data:data.ctOrg,count:'0'};
		grid.loading("操作中，请稍后......");
		nui.ajax({
            url: "org.gocom.abframe.org.OrganizationmapManager.exportOrg.biz.ext",
            type: 'POST',
            data:json,  
            contentType: 'text/json',
            success: function (data) {
            	grid.unmask();
            	var filePath = data.downloadFile;
	        	var fileName = "组织机构";
	        	var myDate = new Date();
	        	var year = myDate.getFullYear();
	        	var month = myDate.getMonth()+1;
	        	var day = myDate.getDate();
	        	var hours = myDate.getHours();
	        	var minutes = myDate.getMinutes();
	        	var seconds = myDate.getSeconds();
	        	var curDateTime = year;
	        	if(month>9){
					curDateTime = curDateTime + "" + month;
				}else{
					curDateTime = curDateTime + "0" + month;
					}
	        	if(day>9){
					curDateTime = curDateTime + day;
				}else{
					curDateTime = curDateTime + "0" + day;
					}
				if(hours>9){
					curDateTime = curDateTime + hours;
				}else{
					curDateTime = curDateTime + "0" + hours;
					}
				if(minutes>9){
					curDateTime = curDateTime + minutes;
				}else{
					curDateTime = curDateTime + "0" + minutes;
					}
				if(seconds>9){
					curDateTime = curDateTime + seconds;
				}else{
					curDateTime = curDateTime + "0" + seconds;
				}
				fileName = fileName + "_" + curDateTime + ".xls";
				var frm = document.getElementById("viewlist1");
	        	frm.elements["downloadFile"].value = filePath;
	        	frm.elements["fileName"].value = fileName;
			    frm.submit();
            }
        });
	}
	
	//导出全部
	function exportALL(){
		var json = {count:"1"};
		grid.loading("操作中，请稍后......");
		nui.ajax({
            url: "org.gocom.abframe.org.OrganizationmapManager.exportOrg.biz.ext",
            type: 'POST',
            data:json,  
            contentType: 'text/json',
            success: function (data) {
                grid.unmask();
                var filePath = data.downloadFile;
	        	var fileName = "组织机构";
	        	var myDate = new Date();
	        	var year = myDate.getFullYear();
	        	var month = myDate.getMonth()+1;
	        	var day = myDate.getDate();
	        	var hours = myDate.getHours();
	        	var minutes = myDate.getMinutes();
	        	var seconds = myDate.getSeconds();
	        	var curDateTime = year;
	        	if(month>9){
					curDateTime = curDateTime + "" + month;
				}else{
					curDateTime = curDateTime + "0" + month;
					}
	        	if(day>9){
					curDateTime = curDateTime + day;
				}else{
					curDateTime = curDateTime + "0" + day;
					}
				if(hours>9){
					curDateTime = curDateTime + hours;
				}else{
					curDateTime = curDateTime + "0" + hours;
					}
				if(minutes>9){
					curDateTime = curDateTime + minutes;
				}else{
					curDateTime = curDateTime + "0" + minutes;
					}
				if(seconds>9){
					curDateTime = curDateTime + seconds;
				}else{
					curDateTime = curDateTime + "0" + seconds;
				}
				fileName = fileName + "_" + curDateTime + ".xls";
				var frm = document.getElementById("viewlist1");
	        	frm.elements["downloadFile"].value = filePath;
	        	frm.elements["fileName"].value = fileName;
			    frm.submit();
            }
        });
	}
	
	//重置
	function reset(){
		var form = new nui.Form("#form1");
		form.reset();
        var data = form.getData();
		grid.load(data);
	}
	
	function GetData() {
    	var data = grid.getSelecteds();
		return data;
    }
    
    function onCancel() {
      	CloseWindow("cancel");
    }
    
    
     function CloseWindow(action) {
      	if (window.CloseOwnerWindow) return window.CloseOwnerWindow(action);
      	else window.close();
    }
	//结构类型
	function orgtype(e){
		return nui.getDictText('ABF_ORGTYPE',e.value);
	}
	//机构状态
	function status(e){
		return nui.getDictText('ABF_ORGSTATUS',e.value);
	}
	
	//机构等级
	function orgdegree(e){
		return nui.getDictText('ABF_ORGDEGREE',e.value);
	}
	
	
</script>
</html>
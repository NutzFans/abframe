<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@page import="com.eos.data.datacontext.UserObject"%>
<%@page import="commonj.sdo.DataObject"%>
<%@page import="java.util.Map"%>
<html>
<!-- 
  - Author(s): xupc
  - Date: 2020-03-04 
  - Description:
-->
<head>
<title>招聘费用查询</title>
<meta http-equiv="content-type" content="text/html; charset=UTF-8" />
<script src="<%= request.getContextPath() %>/common/nui/nui.js" type="text/javascript"></script>
</head>
<body style="width: 98%" class="body-font">
	<div style="width:100%;height:100%;padding:0px;margin:0px;">
		<div class="nui-toolbar" style="border-bottom:0;padding:0px;">
			<legend>招聘费用查询</legend>
			<div class="nui-toolbar" line-height="30px;" borderStyle="border:0;" id="form1">
			    <table id="table1" style="width: 100%;height:32px;font-size:12px;" align="center" >
		        	<tr>
		        		<td align="right" nowrap="nowrap">费用类型 :</td>
		        		<td align="left" nowrap="nowrap">
			        		<input name="criteria._expr[0]._value" class="nui-combobox" valueField="id" textField="text"  id = "fintype" showNullItem="true" nullItemText="全部"
						   data=[{"id":'1R',"text":'猎头费'},{"id":'1S',"text":'招聘网站费'},{"id":'1H',"text":'其他'},{"id":'bole',"text":'伯乐奖'}] style="width:150px;"/>
			               <input class="nui-hidden" name="criteria._expr[0]._property" value="fintype"/>
						   <input class="nui-hidden" name="criteria._expr[0]._op" value="="/>
		        		</td>
		        		<td align="right" nowrap="nowrap">受益部门:</td>
		            	<td align="left" nowrap="nowrap">
						  	<input name="criteria._expr[1]._value" id="beneforgid" class="nui-combobox" url="com.primeton.rdmgr.labor.labormgr.getAllOrgs.biz.ext" 
							filterType="like" textField="orgname" valueField="orgid" dataField="allorgs" valueFromSelect="true" allowInput="true" style="width:200px;" >
							<input class="nui-hidden" name="criteria._expr[1]._property" value="beneforgid"/>
						    <input class="nui-hidden" name="criteria._expr[1]._op" value="="/>
						</td>
						<td align="right" nowrap="nowrap">费用日期:</td>
						<td align="left" nowrap="nowrap">
						    <input class="nui-monthpicker" name="criteria._expr[2]._min" style="width:100px"/>-<input class="nui-monthpicker" name="criteria._expr[2]._max" style="width:100px"/>
						    <input class="nui-hidden" name="criteria._expr[2]._property" value="costdate"/>
						    <input class="nui-hidden" name="criteria._expr[2]._op" value="between"/>
						</td>
					</tr>
					<tr>
					   <td align="center" colspan="15">
		            	<a class="nui-button" iconCls="icon-search" onclick="search()">查询</a>
		            	<a class="nui-button" id="reset" iconCls="icon-reload" onclick="reset()">重置</a>
		            	<a class="nui-button" id="Newstaffs_exportStaffs" iconCls="icon-download" onclick="exportRecruitConfamt()">导出招聘费用信息</a>
		     		   </td>
                    </tr>
	            </table>  
	         </div>
		    <div id="RecruitConfamt" class="nui-datagrid"  allowResize="true" showSummaryRow="true"   ondrawsummarycell="onDrawSummaryCell"
				style="margin-top:0px;width: 100%;height:410px;" dataField="queryRecruitConfamts" sizeList="[10,20,50,100,200,500]" 
				url="com.primeton.eos.ame_permanage.ame_resum.queryRecruitConfamt.biz.ext" 
				allowAlternating="true" pageSize="20" showPager="true" multiSelect="true">
					<div property="columns">
					<div field="feetypename" headerAlign="center" align="center" allowSort="true" width="50">费用类型</div>
					<div field="orgname" headerAlign="center" align="center" allowSort="true" width="80">受益部门</div>
					<div field="confamt" headerAlign="center" align="right" width="60" dataType="currency" summaryType="sum">金额</div>
					<div field="costdate" headerAlign="center" align="center"width="85" >费用日期</div>
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
<script type="text/javascript">
	nui.parse();
	var grid=nui.get("RecruitConfamt");
	var form = new nui.Form("#form1"); 
	search();
	function search(){
	    var data = form.getData();
        grid.load(data);
        grid.sortBy("costdate", "desc");
	}
	function reset(){
		form.reset();
		search();
	}
	//日期格式化---时分秒的格式化
    function ondealdate(e){
		if(typeof(e.value)=="string" && e.value != '' && e.value != null && e.value != 'null'){
			return e.value.substring(0,18);
		}else{
			//alert(nui.formatDate(e.value,"yyyy-MM-dd HH:mm"))
			return nui.formatDate(e.value,"yyyy-MM-dd HH:mm:ss");
		}
	}
	function onDrawSummaryCell(e) {
	    var result = e.result;
	    var grid = e.sender;
	    if (e.field == "confamt") {
	    	e.cellHtml = "<span style='display: block;font-weight: bold;text-align: right;'>" + e.cellHtml + "</span>";
	    }
	}
	function exportRecruitConfamt(){
    	if(!confirm("是否确认导出？")){
			return;
		}
		var data = form.getData();
		var json =  nui.encode(data);
		nui.ajax({
			url: "com.primeton.eos.ame_permanage.ame_resum.exportRecruitConfamt.biz.ext",
	        type: "post",
	        data: json,
	        cache: false,
	        contentType: 'text/json',
	        success: function (o) {
	     		nui.unmask();
	     		var filePath = o.downloadFile;
	        	var fileName = "招聘费用导出";
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
	        },
	        error: function () {
	        	alert("error");
	        }
		});
    }
</script>
</html>
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
<title>年假查询</title>
	<meta http-equiv="content-type" content="text/html; charset=UTF-8" />
	<script src="../common/nui/nui.js" type="text/javascript"></script>
	<style type="text/css">
	    body{
	        margin:0;padding:0;border:0;width:100%;height:100%;overflow:hidden;
	    }
    </style>
</head>
<body>
<div class="nui-fix">
	<div class="nui-panel" title="年假查询" style="width:100%;">
        <div style="width:100%;height:100%;padding:0px;margin:0px;" id="form1">
        	<div class="nui-toolbar" style="border-bottom:0;padding:0px;">
	            <table id="table1" style="width:100%">
	                <tr>
	                    <td align="right"><span>年份：</span></td>
	                    <td colspan="1" align="left">
	                        <input name="param.year" class="nui-textbox" id="year" style="width:100px;" />
	                    </td>
	                    <td align="right"><span>姓名：</span></td>
	                    <td colspan="1" align="left">
	                        <input name="param.empname" class="nui-textbox"  style="width:204px;" />
	                    </td>
	                    <td align="right"><span>工号：</span></td>
	                    <td colspan="3" align="left">
	                        <input name="param.empcode" class="nui-textbox"  style="width:204px;" />
	                    </td>
	                </tr>
	            </table>
        	</div>
    	</div>
    	<div style="width:100%;">
        	<div class="nui-toolbar" style="border-bottom:0;padding:0px;">
	            <table style="width:100%;">
	            	<tr>
	                    <td style="width:20%;">
				            <a class="nui-button" id="search" iconCls="icon-search" onclick="search()">查询</a>
				            <a class="nui-button" id="reset" iconCls="icon-reload" onclick="reset()">重置</a>
				            <a class="nui-button" onclick="exportCsContStock" iconCls="icon-download" id="exportButton">导出年假数据</a>
				            <a class="nui-button" id="impBtn" iconCls="icon-upload" onclick="impvac()">导入年假数据</a>
				        </td>
	                </tr>
	             </table>           
	        </div>
            <div id="datagrid1" frozenStartColumn="0" frozenEndColumn="2" sizeList="[10,20,50,100]" showPager="true" dataField="vacs" 
            	class="nui-datagrid" style="width:100%;height:370px;" url="com.primeton.eos.common.vactionQuery.queryOmEmployeeVac.biz.ext" 
            	multiSelect="true" allowSortColumn=true>
                <div property="columns">
                	<div field="year" width="70" align="center" headerAlign="center" allowSort="true" >年份</div>
                    <div field="empcode" width="70" align="center" headerAlign="center" allowSort="true" >工号</div>
                    <div field="empname" width="60" align="center" headerAlign="center" allowSort="true" >姓名</div>
                    <div field="indate" dateFormat="yyyy-MM-dd" width="100" align="center" headerAlign="center" allowSort="true" >入职时间</div>
                    <div field="socialstart" dateFormat="yyyy-MM-dd" width="110" align="center" headerAlign="center" allowSort="true" >社会工作起始时间</div>
                    <!-- <div field="countdate" width="100" align="center" headerAlign="center" allowSort="true" >统计截止时间</div> -->
                    <div field="comyears"  width="60" align="center" headerAlign="center" allowSort="true" >司龄</div>
                    <div field="workingdays" name="workingdays" width="100" align="center" headerAlign="center" allowSort="true" >2019年在职天数</div>
                    <div field="workyears" width="100" align="center" headerAlign="center" allowSort="true" >社会工龄</div>
                    <div field="standvac" width="100" align="center" headerAlign="center" allowSort="true" >标准年假天数</div>
                    <div field="vacdays" name="vacdays" width="130" align="center" headerAlign="center" allowSort="true" >2019年可用年假天数</div>
                    <div field="lastrest" name="lastrest" width="100" align="center" headerAlign="center" allowSort="true" >2018年剩余年假</div>
                    <div field="overvac" name="overvac" width="110" align="center" headerAlign="center" allowSort="true" >2019春节统筹休假</div>
                    <div field="daysoff" name="daysoff" width="100" align="center" headerAlign="center" allowSort="true" >2019年已休天数</div>
                    <!-- <div field="lastyeardelay" width="130" align="center" headerAlign="center" allowSort="true" >2018年延期年假(清零)</div> -->
                    <div field="nowrestvac" name="nowrestvac" width="100" align="center" headerAlign="center" allowSort="true" ></div>
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
<script type="text/javascript">
/**年假查询*/
    	nui.parse();
		var form = new nui.Form("#form1");
    	var grid = nui.get("datagrid1");
    	init();
    	function init(){
	    	var nowyear = new Date().getFullYear();
	    	nui.get("year").setValue(nowyear);
    		search();
		}

		function search() {
			var form = new nui.Form("#form1");
			var data = form.getData(); //获取表单JS对象数据
			if(data.param.year == null||data.param.year == ""){
				nui.alert("年份必填！");
				return;
			}
			grid.updateColumn("workingdays", {header: data.param.year+"年在职天数"});
			grid.updateColumn("vacdays", {header: data.param.year+"年可用年假天数"});
			grid.updateColumn("lastrest", {header: (data.param.year-1)+"年剩余年假"});
			grid.updateColumn("overvac", {header: data.param.year+"年春节统筹休假"});
			grid.updateColumn("daysoff", {header: data.param.year+"年已休天数"});
			grid.updateColumn("nowrestvac", {header: data.param.year+"年剩余年假"});
		  	grid.load(data); //datagrid加载数据
		}
		function reset(){
			var form = new nui.Form("#form1");
			form.reset();
			init;
		}
		
		function onOk(){
			search();
		}

//导出合同收入成本记录查询结果（按条件导出）
        function exportCsContStock(){
			if(!confirm("导出年假查询记录？")){
				return;
			}
			var data = form.getData();
			var json =  nui.encode(data);
			nui.ajax({
    			url: "com.primeton.eos.common.vactionQuery.exportOmEmployeeVac.biz.ext",
		        type: "post",
		        data: json,
		        cache: false,
		        contentType: 'text/json',
		        success: function (o) {
		     		nui.unmask();
		     		var filePath = o.downloadFile;
		        	var fileName = "年假查询记录";
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
		
	// 导入
    function impvac(){
		nui.open({
            url: "<%=request.getContextPath() %>/mpcommon/importVac.jsp",
            title: "年假数据导入", 
			width: 700,
            height: 210,
            allowDrag:true,
            ondestroy: function (action) {
                search();//导入成功后重新加载
            }
            
        });
    }
</script>
</body>
</html>
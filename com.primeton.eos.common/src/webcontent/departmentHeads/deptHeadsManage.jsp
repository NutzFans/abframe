<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<!-- 
  - Author(s): zhang-yb
  - Date: 2018-09-04 11:25:44
  - Description:
-->
<head>
<title>部门人头数维护</title>
<script src="<%= request.getContextPath() %>/common/nui/nui.js" type="text/javascript"></script>
<style type="text/css">
    body{
        margin: 0;padding: 0;border: 0;
    }
</style>
</head>
<body>
    <div class="nui-toolbar" style="border-bottom:0;padding:0px;">
        <table style="width:100%;">
        	<tr>
                <td style="width:20%;">
                   	部门人头数维护
                </td>
            </tr>
         </table>           
    </div>
    <div id="form1" class="nui-toolbar" style="border-bottom:0;padding:0px;">
    	<table style="width:100%;">
    		<tr>
    			<td align="right">机构名称：</td>
            	<td align="left" style="width: 200px;">
				   <input name="pararm.orgseq" class="nui-combobox" style="width: 100%" id="orgseq" textField="orgname" valueField="orgseq" dataField = "orgs"  shownullItem="true" onenter="onKeyEnter"
					    allowInput="true" url="com.bos.mp.common.SelectManage.queryAllOrg.biz.ext"/>
				</td>
				<td align="right" style="width: 100px;">年月：</td>
            	<td align="left"  style="width: 200px" >
				   	<input class="nui-monthpicker" id="date"  onvaluechanged="dateSet"/>
		 		 	<input class="nui-hidden" name="pararm.year"  id="year"/>
		 		 	<input class="nui-hidden" name="pararm.month"  id="month"/>
				</td>
				<td align="center" >
    				<a class="nui-button" iconCls="icon-search" onclick="search()">查找</a>
    				<a class="nui-button" iconCls="icon-reload" onclick="reset()">重置</a>
    			</td>
    		</tr>
    	</table>
    </div>
	<div style="width:100%;">
		<div class="nui-toolbar" style="border-bottom:0;padding:0px;">
            <table style="width:100%;">
                <tr>
                    <td style="width:100%;">
                       	<a class="nui-button" id="import" iconCls="icon-upload" onclick="importDept()">导入部门人头数</a>
                    	<a class="nui-button" id="import" iconCls="icon-download" onclick="exportDept()">导出</a>
                    	<a class="nui-button" id="save" iconCls="icon-save" onclick="ok">保存</a>
                    </td>
                </tr>
            </table>           
        </div>
	</div>
	<div id="datagrid1"  class="nui-datagrid" style="width:100%;height:372px;" dataField="listEmpNum" allowCellEdit="true"
		showSummaryRow="true" multiSelect="true" pageSize="300" sizeList="[20,30,50,100,300,500]"allowCellSelect="true" 
		ondrawsummarycell="sumRender"  url='com.primeton.eos.common.expDeal.queryDeptHeads.biz.ext' >
	</div>
	<form name="viewlist1" id="viewlist1" action="com.primeton.eos.ame_common.ameExportCommon.flow" method="post">
		<input type="hidden" name="_eosFlowAction" value="action0" filter="false"/>
		<input type="hidden" name="downloadFile" filter="false"/>
		<input type="hidden" name="fileName" filter="false"/>
	</form>
</body>
<script type="text/javascript">
	nui.parse();
	var form = new nui.Form("form1");//表单信息
	var grid = nui.get("datagrid1"); 
	var year,month;
	var regions;
	
	init();
	function init(){
		var text = formatDateTime('');
		nui.get("date").setText(text.substring(0,7));
		nui.get("year").setValue(parseInt(text.substring(0,4)));
		nui.get("month").setValue(parseInt(text.substring(5,7)));
		year = parseInt(text.substring(0,4));
		month = parseInt(text.substring(5,7));
		var grid_dd = getColumns();
	    grid.set({columns:grid_dd});
		var json = form.getData();
		grid.load(json);
	}
	
	//查询
	function search(){
		var json = form.getData();
		grid.load(json);
	}
	
	//动态获取列
    function getColumns() {
    	var flag = true;
    	var result = [];
		result.push({field:'grpName',width:60,align:'left',headerAlign:'center',header:'一级预算单位'});
		result.push({field:'deptName',width:60,align:'left',headerAlign:'center',header:'二级预算单位'});
		var result_region =[];
		
    	nui.ajax({
            url: "com.primeton.eos.common.expDeal.getRegion.biz.ext",
			type: 'POST',
			async:false,
			contentType: 'text/json',
            success: function (o) {
            	regions =o.regions;
            	if(o.regions.length==0){//没有数值
            		flag=false;
            	}
				for(var i = 0 ; i<o.regions.length; i++){
		    		result_region.push({field:o.regions[i].dictid,width:30,align:'right',headerAlign:'center',summaryType:'sum',numberFormat:'0.0',header:o.regions[i].dictname,editor: { type: "textbox",onvaluechanged:'changeData'}});
				}
            }
        });
        if(flag){
        	result_region.push({field:'xj',width:30,align:'right',headerAlign:'center',header:'小计',summaryType:'sum',numberFormat:'0.0'});
        }
        result.push({headerAlign:'center',header:'人员按区域',columns:result_region});
        return result;
	}
	
	//保存
	function ok(){
		var arr = [];
		var selectRow = grid.getChanges("modified");
		var reg=/^[+]{0,1}(\d+)$|^[+]{0,1}(\d+\.\d+)$/;
		for (var i = 0 ; i < selectRow.length ; i++){
			if(regions.length>0){
				for(var key in selectRow[i]){
					if(key.indexOf('A')!=-1){
						if(reg.test(selectRow[i][key])){
							var obj = {};
							var regionId = key.substring(1);
							obj = createObj(regionId,selectRow[i].deptNo,selectRow[i][key]);
							arr.push(obj);
						}
					}
				}
			}
		}
		save(arr);
	}
	
	function save(data){
		if(data.length == 0){
			return;
		}
		var json = {param:data};
		nui.ajax({
	        url: "com.primeton.eos.common.expDeal.NewsaveDeptEmpNum.biz.ext",
	        type: "post",
	        data: json,
	        success: function (o) {
	        	if(o.result == '1'){
	        		nui.alert("保存成功。","提示",function(e){
	        			search();
	        		})
	        	}else{
	        		nui.alert("保存失败。")
	        	}
	        },
	        error: function () {
	        	alert("error");
	        }
        });
	}
	
	//工厂赋值修改的对象
	function createObj(regionid ,deptno,empnum){
		var o = new Object();
	    o.year = year;
	    o.month = month;
	    o.regionid = regionid;
	    o.deptno = deptno;
	    if(parseFloat(empnum)==0){
	    	o.empnum = null;
	    }else{
	    	o.empnum = parseFloat(empnum);
	    }
	    return o;
	}
	
	//导入
	function importDept(){
		nui.open({
            url: "<%=request.getContextPath() %>/mpcommon/departmentHeads/importDeptHeads.jsp?year="+year+"&month="+month,
            title: "导入部门人头数", 
			width: 660,
            height: 220,
            onload: function () {
            	
            },
            ondestroy: function (action) {
            	if(action == "ok"){
            		grid.reload();
            	}
            }
        });
	}
	
	function changeData(e){
		var reg=/^[+]{0,1}(\d+)$|^[+]{0,1}(\d+\.\d+)$/;
		if(!reg.test(e.value)){
			e.value = "";
			e.cellHtml = "";
			nui.alert("输入非正确字符，请重新输入。");
		}
	}
	
	//导出
	function exportDept(){
		var form = new nui.Form("#form1");
		var json = form.getData();
		grid.loading("操作中，请稍后......");
		nui.ajax({
	        url: "com.primeton.eos.common.expDeal.newExportDeptNum.biz.ext",
	        type: "post",
	        data: json,
	        success: function (o) {
	     		grid.unmask();
	        	var filePath = o.downloadFile;
	        	var fileName = "部门人头数";
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
	
	//设置日期
	function dateSet(e){
		var text = formatDateTime(e.value);
		nui.get("year").setValue(parseInt(text.substring(0,4)));
		nui.get("month").setValue(parseInt(text.substring(5,7)));
		year = parseInt(text.substring(0,4));
		month = parseInt(text.substring(5,7))
	}
	
	var num = 0;
	function sumRender(e){
		if(regions.length>0){
			for(var i=0;i<regions.length;i++){
				if(e.field ==regions[i].dictid){
					e.cellHtml = "<div align='right'><b>" + e.cellHtml.toFixed(1) + "</b></div>";
				}
			}
		}
        
        if(e.column.field != "grpName" && e.column.field != "deptName" && e.column.field != "xj"){
    		num += e.column.summaryValue;
        }
        if (e.field == "xj") {
            e.cellHtml = "<div align='right'><b>" + num.toFixed(1) + "</b></div>";
            num = 0;
        }
		
	}
	
	//重置
    function reset(){
        search();
    }
	
	
	//回车触发事件
    function onKeyEnter(){
    	search();
    }
	
    //格式化日期 and 当期日期
	function formatDateTime(date) {
		if(date == ''){
			date = new Date();
		}
	    var y = date.getFullYear();
	    var m = date.getMonth() + 1;
	    m = m < 10 ? ('0' + m) : m;
	    var d = date.getDate();
	    d = d < 10 ? ('0' + d) : d;
	    var h = date.getHours();
	    h = h < 10 ? ('0' + h) : h;
	    var minute = date.getMinutes();
	    minute = minute < 10 ? ('0' + minute) : minute;
	    return y + '-' + m + '-' + d+' '+h+':'+minute+':00';
    }
</script>
</html>
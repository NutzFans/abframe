	<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>	
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<!-- 
  - Author(s): yaoyi
  - Date: 2017-02-20 11:06:02
  - Description:
-->
<head>
	<title>考勤静态统计查询</title>
	<meta http-equiv="content-type" content="text/html; charset=UTF-8" />
	<script src="<%= request.getContextPath() %>/common/nui/nui.js" type="text/javascript"></script>
</head>
<body>
	<div class="nui-panel" title="考勤静态统计" width="100%">
		   <form id="form1" method="post" style="width:100%">
			<div class="nui-toolbar" >
				<table style="width:100%;">
					<tr>
						<td align="right">考勤年份：</td>
						<td>
							<input name="criteria._expr[1]._value" class="nui-textbox" style="width:100px;" id="nowYear"/>
						    <input class="nui-hidden" name="criteria._expr[1]._property" value="year"/>
						    <input class="nui-hidden" name="criteria._expr[1]._op" value="="/>
						</td>
						<td align="right">考勤月份范围：</td>
						<td>
							<input name="criteria._expr[2]._min" class="nui-textbox" style="width:60px;" onblur="change" id="min"/>
						    <input class="nui-hidden" name="criteria._expr[2]._property" value="month"/>
						    <input class="nui-hidden" name="criteria._expr[2]._op" value="between"/>
							至
							<input name="criteria._expr[2]._max" class="nui-textbox" style="width:60px;" onblur="change" id="max"//>
						    <input class="nui-hidden" name="criteria._expr[2]._property" value="month"/>
						    <input class="nui-hidden" name="criteria._expr[2]._op" value="between"/>
						</td>
						<td align="right">缺失天数范围：</td>
						<td>
							<input name="criteria._expr[8]._min" class="nui-textbox" style="width:60px;"/>
						    <input class="nui-hidden" name="criteria._expr[8]._property" value="updatedays"/>
						    <input class="nui-hidden" name="criteria._expr[8]._op" value="between"/>
							至
							<input name="criteria._expr[8]._max" class="nui-textbox" style="width:60px;"/>
						    <input class="nui-hidden" name="criteria._expr[8]._property" value="updatedays"/>
						    <input class="nui-hidden" name="criteria._expr[8]._op" value="between"/>
						</td>
						<td align="right">供应商：</td>
						<td>
							<input name="criteria._expr[3]._value" class="nui-textbox" style="width:120px;"/>
						    <input class="nui-hidden" name="criteria._expr[3]._property" value="custname"/>
						    <input class="nui-hidden" name="criteria._expr[3]._op" value="like"/>
						    <input class="nui-hidden" name="criteria._expr[3]._likeRule" value="all"/>
						</td>
					</tr>
					<tr>
						<td align="right">外包人员：</td>
						<td>
							<input name="criteria._expr[4]._value" class="nui-textbox" style="width:100px;" id="names"/>
						    <input class="nui-hidden" name="criteria._expr[4]._property" value="outpername"/>
						    <input class="nui-hidden" name="criteria._expr[4]._op" value="like"/>
						    <input class="nui-hidden" name="criteria._expr[4]._likeRule" value="all"/>
						</td>
						<td align="right">项目名称：</td>
						<td>
							<input name="criteria._expr[7]._value" class="nui-textbox" style="width:140px;"/>
						    <input class="nui-hidden" name="criteria._expr[7]._property" value="projectName"/>
						    <input class="nui-hidden" name="criteria._expr[7]._op" value="like"/>
						    <input class="nui-hidden" name="criteria._expr[7]._likeRule" value="all"/>
						</td>
						<td align="right">项目编号：</td>
						<td>
							<input name="criteria._expr[6]._value" class="nui-textbox" style="width:140px;" id = "projectno"/>
						    <input class="nui-hidden" name="criteria._expr[6]._property" value="projectno"/>
						    <input class="nui-hidden" name="criteria._expr[6]._op" value="like"/>
						    <input class="nui-hidden" name="criteria._expr[6]._likeRule" value="all"/>
						</td>
						<td align="right">受益销售：</td>
						<td>
							<input name="criteria._expr[5]._value" class="nui-textbox" style="width:120px;"/>
						    <input class="nui-hidden" name="criteria._expr[5]._property" value="orgname"/>
						    <input class="nui-hidden" name="criteria._expr[5]._op" value="like"/>
						    <input class="nui-hidden" name="criteria._expr[5]._likeRule" value="all"/>
						</td>
						
					</tr>
					<tr>
						<td align="right">受益事业部：</td>
						<td>
							<input name="criteria._expr[0]._value" class="nui-dictcombobox"  shownullItem="true" dictTypeId="CONT_ORG" style="width:100px;"/>
						    <input class="nui-hidden" name="criteria._expr[0]._property" value="syb"/>
						    <input class="nui-hidden" name="criteria._expr[0]._op" value="="/>
						</td>
					</tr>
	            </table> 
	             <table style="width:90%;">
		            <tr>
		                <td align="center" style="width:100%;">
		                    <a class="nui-button" iconCls="icon-search" id="search" onclick="search()" >查询</a>
							<a class="nui-button" iconCls="icon-reload" id="reset" onclick="reset()" >重置</a>
		                </td>
		            </tr>
	        	</table>          
	        </div>
	    </form>
		<!-- 考勤统计信息列表
		-->
		<div style="width:100%;" id="exp1">
	        <div class="nui-toolbar" style="border-bottom:0;padding:0px;">
	            <table style="width:100%;">
	            	<tr>
	            		<td style="width:20%;">
	                        <a class="nui-button" id="updateBtn" iconCls="icon-ga" onclick="updateOutCount()">数据调整</a>
	                        <a class="nui-button" id="deleteWXBtn" iconCls="icon-remove" onclick="deleteOutCount()">删除</a>
	                        <a class="nui-button" id="updateBtn" iconCls="icon-edit" onclick="generateStatistics()">生成外包计提</a>
	                        <a class="nui-button" onclick="exportCsContStock" iconCls="icon-download" id="exportButton">数据导出</a>
	                        <a class="nui-button" id="impBtn" iconCls="icon-upload" onclick="impOutCount()">数据导入</a>
	                    </td>
	                </tr>
                 </table>           
	        </div>
	    </div>
	    <div id="datagrid1" class="nui-datagrid" style="width:100%;height:350px;"  pageSize="10" sizeList="[10,20,50,100,200]" showPager="true"
	    	showSummaryRow="true"  ondrawsummarycell="onDrawSummaryCell" frozenStartColumn="0" frozenEndColumn="7"
	    	url="com.primeton.eos.ame_pur.purOutCount.queryOutCount.biz.ext" dataField="outCounts"  allowSortColumn="true" multiSelect="true">
			<div property="columns">
				<div type="checkcolumn" width="30"></div>
				<div field="attendanceid" width="50" align="center"  headerAlign="center" allowSort="true" visible="false">ID</div>
				<div field="syb" width="100" align="center" renderer="getsyb" headerAlign="center" allowSort="true">受益事业部</div>
				<div field="empname" width="60" align="center"  headerAlign="center" allowSort="true">汇报对象</div>
				<div field="miscustjc" width="120" align="left"  headerAlign="center" allowSort="true">客户(简称)</div>
				<div field="projectName" width="220" align="left"  headerAlign="center" allowSort="true">项目名称</div>
				<div field="projectno" width="90" align="center"  headerAlign="center" allowSort="true">项目编号</div>
				<div field="suppliersname" width="100" align="left"  headerAlign="center" allowSort="true">供应商(简称)</div>
				<div field="outpername" width="50" align="center"  headerAlign="center" allowSort="true" >人员</div>
				<div field="orgname" width="90" align="center"  headerAlign="center" allowSort="true">受益销售</div>
				<div field="year" width="60" align="center" headerAlign="center"  allowSort="true">考勤年份</div>
				<div field="month" width="60" align="center" headerAlign="center"  allowSort="true">考勤月份</div>
				<div field="standarddays" width="80" align="center" headerAlign="center"  allowSort="true">月标准工作日</div>
				<div field="rcdate" width="80" align="center" headerAlign="center"  allowSort="true">入场日期</div>
				<div field="lcdate" width="80" align="center" headerAlign="center"  allowSort="true">离场日期</div>
				<div field="accrueddays" width="100" align="center" headerAlign="center"  allowSort="true">个人项目标准工作日</div>	
				<div field="attendancedays" width="60" align="center" headerAlign="center"  allowSort="true">打卡天数</div>
				<div field="adddays" width="100" align="center" headerAlign="center"  allowSort="true">补充天数</div>
				<div field="totaldays" width="100" align="center" headerAlign="center"  allowSort="true">当月总出勤天数</div>
				<div field="agreeddays" width="120" align="center" headerAlign="center"  allowSort="true">项目认定的出勤天数</div>
				<div field="remark" width="100" align="center" headerAlign="center"  allowSort="true" visible="false">调整说明</div>
				<div field="updatedays" width="100" align="center" headerAlign="center"  allowSort="true">考勤缺失天数</div>
				<div field="latenum" width="60" align="center" headerAlign="center"  allowSort="true">迟到次数</div>
				<div field="leavenum" width="60" align="center" headerAlign="center"  allowSort="true">早退次数</div>
				<div field="signnum" width="70" align="center" headerAlign="center"  allowSort="true">未签到次数</div>
				<div field="signoutnum" width="70" align="center" headerAlign="center"  allowSort="true">未签退次数</div>
				<div field="losedays" width="120" align="center" headerAlign="center"  allowSort="true">单边考勤缺失次数</div>
				<div field="price" width="80" align="right" headerAlign="center"  allowSort="true" >人员单价</div>
				<div field="months" width="120" align="center" headerAlign="center"  allowSort="true" summaryType="sum" dataType="currency">人月数</div>
				<div field="accruedcost" width="120" align="right" headerAlign="center"  allowSort="true" summaryType="sum" dataType="currency">计提成本测算</div>
				<div field="penaltycost" width="120" align="right" headerAlign="center"  allowSort="true" summaryType="sum" dataType="currency" >预计罚款</div>
			</div>
	   </div>	
	</div>
<form name="viewlist1" id="viewlist1" action="com.primeton.eos.ame_common.ameExportCommon.flow" method="post">
	<input type="hidden" name="_eosFlowAction" value="action0" filter="false"/>
	<input type="hidden" name="downloadFile" filter="false"/>
	<input type="hidden" name="fileName" filter="false"/>
</form>	
<script type="text/javascript">
	nui.parse();
	var form = new nui.Form("#form1");
	var grid = nui.get("datagrid1");
	var dataResult = null;
	var d = new Date();
    var  nowYear = d.getFullYear();
    nui.get("nowYear").setValue(nowYear);
    
    
    init();
	function init(){
		var form = new nui.Form("#form1");
		var data = form.getData(); //获取表单JS对象数据
	  	grid.load(data); //datagrid加载数据
	}
	
		
	//考勤查询
	function search(){
		var form = new nui.Form("#form1");
		var data = form.getData(); //获取表单JS对象数据
	  	grid.load(data); //datagrid加载数据
	}
	
	//重置
	function reset(){
		form.reset();
		grid.load();
	}
    
    function getsyb(e){
    	return nui.getDictText('CONT_ORG',e.value);//设置业务字典值
    }
    
    function getWork(e){
    	return nui.getDictText('SERV_NUM_TYPE',e.value);
    }
    
    
	function change(){
		var min = nui.get("min").getValue();
		var max = nui.get("max").getValue();
		if(min.length==1){
			min = "0"+min;
			nui.get("min").setValue(min);
		}
		if(max.length==1){
			max = "0"+max;
			nui.get("max").setValue(max);
		}
	}
    
    
    function generateStatistics(){
		var executeUrl = "<%=request.getContextPath() %>/ame_pur/purOutCount/accruedCCost.jsp";
		window.open(executeUrl, "外包计提", "fullscreen=1");
    }
    
    
    function updateOutCount(){
    	var row = grid.getSelected();
		if (row) {
      		nui.open({
	            url: "<%=request.getContextPath() %>/ame_pur/purOutCount/updateOutCount.jsp",
	            title: "考勤统计",
	            width: 1000,
	            height: 460,
	            onload: function () {
					var iframe = this.getIFrameEl();
					var data = {action: "edit", attendanceid: row.attendanceid };
					iframe.contentWindow.setData(data);
				},
				ondestroy: function (action) {
					if(action=="ok"){
						grid.reload();
	                }
				}
			});
		} else {
			nui.alert("请选中一条记录","提示");
		}
    }
    
    
    function onDrawSummaryCell(e) {
            var result = e.result;
            var grid = e.sender;
            if (e.field == "losedays") {
                e.cellHtml = "<span style='display: block;font-weight: bold;font-size: 12px;text-align: right;'>合计：</span>";
            }
            if (e.field == "months") {
            	e.cellHtml = "<span style='display: block;font-weight: bold;text-align: right;'>" + e.cellHtml + "</span>";
            }
            if (e.field == "accruedcost") {
            	e.cellHtml = "<span style='display: block;font-weight: bold;text-align: right;'>" + e.cellHtml + "</span>";
            }
            if (e.field == "penaltycost") {
            	e.cellHtml = "<span style='display: block;font-weight: bold;text-align: right;'>" + e.cellHtml + "</span>";
            }
        }


//（按条件导出）
        function exportCsContStock(){
			if(!confirm("导出静态考勤统计查询记录？")){
				return;
			}
			var data = form.getData();
			var json =  nui.encode(data);
			nui.ajax({
    			url: "com.primeton.eos.ame_pur.purOutCount.exportOutCount.biz.ext",
		        type: "post",
		        data: json,
		        cache: false,
		        contentType: 'text/json',
		        success: function (o) {
		     		nui.unmask();
		     		var filePath = o.downloadFile;
		        	var fileName = "静态考勤统计查询记录";
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
    function impOutCount(){
		nui.open({
            url: "<%=request.getContextPath() %>/ame_pur/purOutCount/importOutCount.jsp",
            title: "静态考勤统计导入", 
			width: 700,
            height: 230,
            allowDrag:true,
            ondestroy: function (action) {
            	if(action == "ok"){
            		var iframe = this.getIFrameEl();
	            	var data1 = iframe.contentWindow.getData();
	            	if(data1=="0"){
	            		alert("导入成功！");
	            		search();
	            	}else{
	            		alert("导入失败！");
	            	}
            	}
	            		
            }
        });
    }
    
    
    function deleteOutCount(){
    	var rows = grid.getSelecteds();
    	if(rows != "" && rows != null){
    		var titleName = "";
    		var attendanceids="";
			titleName = "确定要删除考勤静态统计数据吗？";
    		nui.confirm(titleName,"操作提示",function(action){
    			if(action == "ok"){
    				for(var j = 0;j < rows.length;j ++){
    					if(j==0){
    						attendanceids = rows[j].attendanceid;
    					}else{
    						attendanceids += ","+rows[j].attendanceid;
    					}
    				}
					nui.get("deleteWXBtn").disable();
	    			var json = nui.encode({"attendanceids": attendanceids});
					form.loading("考勤静态统计数据删除中...");
		    		nui.ajax({
	        			url: "com.primeton.eos.ame_pur.purOutCount.deleteOutCounts.biz.ext",
	                	data: json,
	                	type: 'POST',
	                	cache: false,
	                	contentType: 'text/json',
	                	success: function (o) {
	                		if(o.result == "1"){
     							alert("数据删除失败！");
     							nui.get("deleteWXBtn").enable();
     							form.unmask();
     							return;
     						}else{
     							alert("数据删除成功！");
     							nui.get("deleteWXBtn").enable();
     							form.unmask();
     							search();
     						}
     					},
 						error: function () {
        					alert("error");
        				}
        			});
    			}
    		});
    	}else{
    		nui.alert("请选择记录！");
		}
    }
    
</script>
</body>
</html>
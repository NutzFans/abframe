<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<!-- 
  - Author(s): ganli
  - Date: 2019-05-24 14:55:51
  - Description:
-->
<head>
<title>项目计划变更</title>
	<meta http-equiv="content-type" content="text/html; charset=UTF-8" />
	<script src="<%= request.getContextPath() %>/common/nui/nui.js" type="text/javascript"></script>
	<style type="text/css">
	    body{
	        margin:0;padding:0;border:0;width:100%;height:100%;overflow:hidden;
	    }
    </style>
    
</head>
<body>
	<div title="项目计划">
		<div class="nui-fit">
			<fieldset style="border:solid 1px #aaa;padding:3px;">
			<legend>项目计划</legend>
				<table align="center" border="0" width="100%" class="form_table">
			        <tr>
			          <td class="form_label" align="right">项目编号：</td>
			          <td colspan="1" align="left" style="width: 250px">
			             <label id="show.projectNo" style="display:inline-block;width:250px;"></label>
			          </td>
			          <td class="form_label" align="right">项目名称：</td>
			          <td colspan="1">
			             <label id="show.projectName" style="display:inline-block;width:400px;"></label>
			          </td>
			      	</tr>
			    </table>
			 	<div class="nui-fit" style="padding-left:0px;width:100%;height: 230px;">
					<div id="datagrid1" class="mini-datagrid" style="width:100%;height: 100%;" url="com.primeton.rdmgr.project_plan.projectPlanManager.queryLatestPlanWithCost.biz.ext" 
					     dataField="data" allowResize="true"  showEmptyText="false" showPager="false" 
					     allowAlternating="true" allowCellSelect="true" showSummaryRow="true" ondrawsummarycell="onDrawSummaryCell"  >
						<div property="columns" >
						    <div type="checkcolumn"></div>
							<div field="stage" width="100" headerAlign="center"  align="center" renderer="renderStage" >阶段</div>
							<div field="startTime" width="160" headerAlign="center"  align="center"  renderer="renderDate" >开始时间</div>
							<div field="endTime" width="160" headerAlign="center"  align="center"  renderer="renderDate" >结束时间</div>
							<div field="timeCost" width="100" headerAlign="center"  align="right" dataType="currency" currencyUnit="￥" summaryType="sum">工时成本</div>
							<div field="outCost" width="100" headerAlign="center"  align="right" dataType="currency" currencyUnit="￥" summaryType="sum">外包成本</div>
							<div field="feeCost" width="100" headerAlign="center"  align="right" dataType="currency" currencyUnit="￥" summaryType="sum" >费用成本</div>
							<div field="cost" width="100" headerAlign="center" align="right" dataType="currency" currencyUnit="￥" summaryType="sum" >实际成本</div>
						</div>
					</div>
	    	</fieldset>
	    	
			<table style="table-layout:fixed;width:100%" id="table_file1">
		    		<tr>
						<td align="right"  style="width: 100%" >
							<a href='javascript:void(0)' onclick="showAllWeekly()" title="查看所有的周报" >更多周报</a>
						</td>
					</tr>
				</table>
			<div  style="height: 210px;">
				<fieldset id="show1.tr" style="display: none;border:solid 1px #aaa;padding:3px;">
					<table>
			            <tr>
							<td align="left" style="width:160px">最新周报：</td>
							<td align="left" style="width:250px" class = "asLabel">
								<label id="show1.ptime" style="display:inline-block;width:250px;"></label>
							</td>
							<td align="left" style="width:160px">提交人：</td>
							<td align="left" style="width:250px" class = "asLabel">
								<label id="show1.submitName" style="display:inline-block;width:150px;"></label>
							</td>
						</tr>
						<tr>
							<td align="left" colspan="4" >
								<label id="show1.weeklycont" style="display:inline-block;width:100%;"></label>
							</td>
						</tr>
					</table>
				</fieldset>
				<div style="width: 100%">&nbsp; </div>
				<fieldset id="show2.tr" style="display: none;border:solid 1px #aaa;padding:3px;">
					<table>
						<tr>
							<td align="left" style="width:160px">上次周报：</td>
							<td align="left" style="width:250px" class = "asLabel">
								<label id="show2.ptime" style="display:inline-block;width:250px;"></label>
							</td>
							<td align="left" style="width:160px">提交人：</td>
							<td align="left" style="width:250px" class = "asLabel">
								<label id="show2.submitName" style="display:inline-block;width:150px;"></label>
							</td>	
						</tr>
						<tr>
							<td align="left" colspan="4" >
								<label id="show2.weeklycont" style="display:inline-block;width:100%;"></label>
							</td>
						</tr>
					</table>
				</fieldset>
		</div>
		</div>
		<div style="text-align:center;padding:10px;" class="nui-toolbar">
			<a class="nui-button" onclick="onCancel" style="width:60px;">关闭</a>
		</div>
	</div>
		
</body>
<script type="text/javascript">
    	nui.parse();
    	var grid = nui.get("datagrid1");
    	var projectNo="";
    	
    	function setFormData(data) {
		    data = nui.clone(data);
		    if (data) {
		        projectNo=data.projectNo;
		    	document.getElementById("show.projectNo").innerHTML=data.projectNo;
		    	document.getElementById("show.projectName").innerHTML=data.projectName;
		    	grid.load({"project":{"projectNo":data.projectNo,"projectName":data.projectName}});
		    	
		    	nui.ajax({
		            url: "com.primeton.rdmgr.project_plan.projectPlanManager.query3Weekly.biz.ext",
		            type: 'POST',
		            data: {"projectNo":data.projectNo},
		            contentType: 'text/json',
		            success: function (text) {
		            	var weeklys=text.weeklys;
		            	for(var i=0;i<weeklys.length&&i<2;i++){
		            		var j=i+1;
		            		document.getElementById("show"+j+".tr").style.display="inline";
		            		document.getElementById("show"+j+".ptime").innerHTML=weeklys[i].ptime+" ("+weeklys[i].weekday+")";
		            		document.getElementById("show"+j+".submitName").innerHTML=weeklys[i].submitName;
		            		document.getElementById("show"+j+".weeklycont").innerHTML=weeklys[i].weeklycont;
		            	}
		            }
		        }); 
		    }
	    }
	    
	    //汇总
	    function onDrawSummaryCell(e) {
	    	e.cellStyle = "text-align:right;";
	    
            var grid = e.sender;
            //汇总信息
            if (e.field == "stage") {
                e.cellHtml = "汇总：";
            }
            if (e.field == "cost") {
                e.cellHtml = e.cellHtml;
            }
            if (e.field == "timeCost") {
                e.cellHtml = e.cellHtml;
            }
            if (e.field == "outCost") {
                e.cellHtml = e.cellHtml;
            }
            if (e.field == "feeCost") {
                e.cellHtml = e.cellHtml;
            } 
        }
	    
	    //关闭窗口
    	function onCancel() {
	        if(window.CloseOwnerWindow){
	 			return window.CloseOwnerWindow("Cancel");
	 		}else{
	 			window.close();
	 		} 
	    }
	    
	    function renderStage(e){
	    	return nui.getDictText("AME_PROJECT_STAGE",e.value)
	    }
	    
	    function renderDate(e){
	    	if(e.value)
	    	 return e.value.substring(0,10)
	    } 
	    
	    function showAllWeekly(){
	    	nui.open({
		        url: "<%=request.getContextPath() %>/project_plan/weeklyList.jsp",
		        title: "查看周报",
		        width: 800,
		        height: 510,
		        onload: function () { //弹出页面加载完成
		            var iframe = this.getIFrameEl();
		            iframe.contentWindow.setFormData(projectNo);
		        },
		        ondestroy: function (action) { //弹出页面关闭前
		            //search();
		        }
		    });
	    }
	    
	    function renderDate(e){
	    	
	    	if(e.field=="startTime"){
	    		if(e.row.startTime2&&e.row.startTime2.substring(0,10)!=e.value.substring(0,10)){
	    			e.cellStyle = 'background-color:#FF6347';
	    			return e.value.substring(0,10)+"变更为"+e.row.startTime2.substring(0,10);
	    		}else if(e.value){
		    		return e.value.substring(0,10);
		    	}
	    	}
	    	if(e.field=="endTime"){
	    		if(e.row.endTime2&&e.row.endTime2.substring(0,10)!=e.value.substring(0,10)){
	    			e.cellStyle = 'background-color:#FF6347';
	    			return e.value.substring(0,10)+"变更为"+e.row.endTime2.substring(0,10);
	    		}else if(e.value){
		    		return e.value.substring(0,10);
		    	}
	    	}
	    	
	    }
	</script>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<!-- 
  - Author(s): ganli
  - Date: 2019-05-24 14:55:51
  - Description:
-->
<head>
<title>计划变更一览</title>
	<meta http-equiv="content-type" content="text/html; charset=UTF-8" />
	<script src="<%= request.getContextPath() %>/common/nui/nui.js" type="text/javascript"></script>
	<style type="text/css">
	    body{
	        margin:0;padding:0;border:0;width:100%;height:100%;overflow:hidden;
	    }
    </style>
    
</head>
<body>
	<div class="nui-panel" title="当前计划" style="width:100%;">
		<div id="datagrid0" class="mini-datagrid" style="width:100%;height:170px;" allowCellEdit="false" allowCellSelect="true" showPager="false" >
	    </div>
    </div>
    <div id="hisgrid" class="nui-panel" title="计划变更记录" style="width:100%;display: none;" >
		<div id="datagrid1" class="mini-datagrid" style="width:100%;height:235px;" allowCellEdit="false" allowCellSelect="true" showPager="false" >
	    </div>
    </div>
</body>
<script type="text/javascript">
	nui.parse();
	var grid = nui.get("datagrid1");
	var grid0 = nui.get("datagrid0");
	var collist = [{field: "stage", width: 100, align:"center", headerAlign: "center", allowSort: true, header: "阶段",renderer:"renderStage"}];
	var collist0 = [{field: "stage", width: 200, align:"center", headerAlign: "center", allowSort: true, header: "阶段",renderer:"renderStage"}];
	var rows = [];
	var rows0 = [];
	var stageDef = ["A","B","C","D","E","G"];
	
	function setFormData(d) {
	    var projectno=d;
		nui.ajax({
            url: "com.primeton.rdmgr.project_plan.projectPlanManager.queryPlanList.biz.ext",
            type: 'POST',
            data: {"projectno":projectno},
            contentType: 'text/json',
            success: function (text) {
            	if(text.planLists){
            		if(text.planLists.length>1){
            			document.getElementById("hisgrid").style.display="inline";
            			for(var i=0;i<text.planLists.length;i++){
	            			var plan = text.planLists[i];
	            			var state = renderState(plan.state);
	            			var color="#000000";
	            			if(plan.state==2){
	            				color="#808080";
	            			}else if(plan.state==0){
	            				color="#FFA500";
	            			}
	            			collist.push({header: "第"+(plan.versionNo)+"次("+state+")", headerAlign: "center",columns:[{header: plan.ptime, headerAlign: "center",columns:[{field: "startTime"+i, width: 100, headerAlign: "center", allowSort: true, header: "开始时间"},{field: "endTime"+i, width: 100, headerAlign: "center", allowSort: true, header: "结束时间"}]}]});
	            		    for(var m=0;m<stageDef.length;m++){
	            		    	for(var j=0;j<plan.ameProjectPlanDetails.length;j++){
		            				var stages = plan.ameProjectPlanDetails[j];
		            				if(stageDef[m]==stages.stage){
			            				if(i==0){
					            			rows.push({"stage":stages.stage});
				            			}
			            				param = rows[m];
			            				param["startTime"+i]="<font style='color:"+color+";' >"+stages.startTime+"</font>";
			            				param["endTime"+i]="<font style='color:"+color+";' >"+stages.endTime+"</font>";
			            				rows[m] = param;
		            				}
	            				
	            				}
	            		    }
	            			
	            		}
	            		grid.set({
	            			columns:collist
	            		});
	            		grid.addRows(rows);
            		}
        		}
        		if(text.plans){
            		collist0.push({field: "startTime", width: 200, align:"center",headerAlign: "center", allowSort: true, header: "开始时间"},{field: "endTime", width: 200, align:"center",headerAlign: "center", allowSort: true, header: "结束时间"});
            		for(var j=0;j<text.plans.length;j++){
        				var stages = text.plans[j];
        				rows0.push({"stage":stages.stage,"startTime":stages.startTime.substring(0,10),"endTime":stages.endTime.substring(0,10)});
        			}
        			grid0.set({
            			columns:collist0
            		});
            		grid0.addRows(rows0);
            	}
            }
        }); 
    }
    
    function renderStage(e){
    	return nui.getDictText("AME_PROJECT_STAGE",e.value)
    }
    
    function renderState(v){
    	if(v=="1") return "已确认";
    	if(v=="2") return "已作废";
    	if(v=="0") return "待确认";
    }
</script>
</html>
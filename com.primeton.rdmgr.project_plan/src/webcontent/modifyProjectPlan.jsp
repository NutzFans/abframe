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
			<div class="nui-fit">
				<fieldset style="border:solid 1px #aaa;padding:3px;">
				<legend>项目计划</legend>
					<table align="center" border="0" width="100%" class="form_table">
				        <tr>
				          <td class="form_label" align="left">项目编号:<label id="show.projectNo" style="display:inline-block;"></label></td>
				          <td class="form_label" align="left">开始日期:<label id="show.startdate" style="display:inline-block;"></label></td>
				      	</tr>
				      	 <tr>
				          <td class="form_label" align="left" colspan="2">项目名称:<label id="show.projectName" style="display:inline-block;"></label></td>
				      	</tr>
				    </table>
				    
				    <div id="form1" style="">
    					<table style="width:100%;table-layout:fixed;" >
    						<tr>
            					<td style="width:33%;">
	            					<div class="nui-fit" style="padding-left:0px;width:100%;height: 175px;">
										<div id="datagrid1" class="mini-datagrid" style="width:100%;height: 100%;" allowResize="true"  showEmptyText="false" showPager="false" 
										     allowAlternating="true" allowCellSelect="true" editNextOnEnterKey="true"  >
											<div property="columns" >
											    <div type="checkcolumn"></div>
												<div field="stage" headerAlign="center"  align="center" renderer="renderStage" >阶段</div>
												<div field="startTime" headerAlign="center"  align="center" renderer="renderDate" >开始时间
													<input property="editor" class="nui-datepicker" style="width:80%;" required="true" requiredErrorText="开始时间不能为空"  />
												</div>
												<div field="endTime" headerAlign="center"  align="center" renderer="renderDate" >结束时间
													<input property="editor" class="nui-datepicker" style="width:80%;" required="true" requiredErrorText="结束时间不能为空" />
												</div>
											</div>
										</div>
									</div>
            					 </td>
            				</tr>
    					</table>
    				</div>
    				<table align="center" border="0" width="100%" class="form_table">
				      	 <tr>
				          <td class="form_label" align="left"  ><font color="#FF3030">温馨提示：填写计划时，请确保如下两点：<br>&nbsp;&nbsp;&nbsp;&nbsp;1、连续性。两个相继的计划结束时间需要与下一计划的开始时间相同<br>&nbsp;&nbsp;&nbsp;&nbsp;2、不重复性。计划中的时间段不可重复。如果实际中不存在某一阶段，则这一阶段的时间段仅设置为1天。</font></td>
				      	</tr>
				    </table>
		    	</fieldset>
			</div>
			<div style="text-align:center;padding:10px;" class="nui-toolbar">
				<a class="nui-button" iconCls="icon-edit" id="changeButton" onclick="changePlan" style="width:60px;margin-right:20px;display:inline-block;">变更</a>
				<a class="nui-button" id="appButton"  onclick="commitPlan" style="width:60px;margin-right:20px;display: none;">确定</a>
				<a class="nui-button" onclick="onCancel" style="width:60px;">关闭</a>
			</div>
</body>
<script type="text/javascript">
	nui.parse();
	var form = new nui.Form("#form1");
	var grid = nui.get("datagrid1");
	var proNo;
	var proName;
	var startdate;
	var flag=false;
	var isEdit = false;
	var initrows=new Array();
	
	function addDate(date, days) {
        if (days == undefined || days == '') {
            days = 1;
        }
        var type = typeof date;
        var y,m,d;
        if(type=="string"){
        	y = date.substring(0,4);
	        m = date.substring(5,7);
	        d = date.substring(8,10);
        }else{
	        y = (date.getYear() < 1900) ? (1900 + date.getYear()) : date.getYear();
	        m = getFormatDate(date.getMonth() + 1);
	        d = getFormatDate(date.getDate());
        }
        
        var date2 = new Date(y + '/' + m + '/' + d);
        date2.setDate(date2.getDate() + days);
        var year = (date2.getYear() < 1900) ? (1900 + date2.getYear()) : date2.getYear();
        var month = date2.getMonth() + 1;
        var day = date2.getDate();
        return year + '-' + getFormatDate(month) + '-' + getFormatDate(day);
    }
    
    function formetDate2String(date){
    	var y,m,d;
    	var type = typeof date;
    	if(type=="string"){
        	y = date.substring(0,4);
	        m = date.substring(5,7);
	        d = date.substring(8,10);
        }else{
    		y = (date.getYear() < 1900) ? (1900 + date.getYear()) : date.getYear();
        	m = getFormatDate(date.getMonth() + 1);
        	d = getFormatDate(date.getDate());
        }
        return y+"-"+m+"-"+d;
    }

     // 日期月份/天的显示，如果是1位数，则在前面加上'0'
    function getFormatDate(arg) {
        if (arg == undefined || arg == '') {
            return '';
        }

        var re = arg + '';
        if (re.length < 2) {
            re = '0' + re;
        }

        return re;
    }
	
	grid.on("select",function(e){
		if(isEdit){
			if(e.record._uid>1){
				var row1 = grid.getRowByUID(e.record._uid-1);
				if(row1.endTime!=null&&row1.endTime!=""){
					grid.columns[2].editor.minDate=row1.endTime;
					grid.columns[2].editor.maxDate=row1.endTime;
					grid.columns[3].editor.minDate=addDate(row1.endTime,1);
				}
			}else if(e.record._uid==1){
				grid.columns[2].editor.minDate="";
				grid.columns[2].editor.maxDate="";
				grid.columns[3].editor.minDate="";
				grid.columns[3].editor.maxDate="";
			}
			
			if(e.record.startTime!=null&&e.record.startTime!=""
			 		&&e.record.endTime!=null&&e.record.endTime!=""
			     		&&formetDate2String(e.record.startTime)>=formetDate2String(e.record.endTime)){
				e.record.endTime = addDate(e.record.startTime,1);
			}
			grid.beginEditRow(e.record); 
		}
	})
	
	grid.on("deselect",function(e){
		if(isEdit){
			grid.commitEditRow(e.record);
			var row1 = grid.getRowByUID(e.record._uid+1);
			if(row1&&e.record.endTime!=null&&e.record.endTime!=""){
				row1.startTime=e.record.endTime;
			}
		}
	}) 
	
	function setFormData(data) {
	    data = nui.clone(data);
	    if (data) {
	    	document.getElementById("show.projectNo").innerHTML=data.projectNo;
	    	document.getElementById("show.projectName").innerHTML=data.projectName;
	    	document.getElementById("show.startdate").innerHTML=data.startdate==null?"":data.startdate;
	    	proNo = data.projectNo;
	    	proName = data.projectName;
	    	startdate = data.startdate;
			nui.ajax({
				url: "com.primeton.rdmgr.project_plan.projectPlanManager.queryLatestPlan.biz.ext",
				type: 'POST',
				data: {"project":{"projectNo":data.projectNo,"projectName":data.projectName}},	
				contentType: 'text/json',
		        success: function (text) {
		        	if(text.plans&&text.plans.length>0){
		        		if(text.auditPlans&&text.auditPlans.length>0){
		        			flag=true;
		        		}
		        		var first = false;
		        		for(var i=0;i<text.plans.length;i++){
		        			if(flag){
			            		var newRow={"stage":text.plans[i].stage,"startTime":text.plans[i].startTime,"endTime":text.plans[i].endTime,"startTime2":text.auditPlans[i].startTime,"endTime2":text.auditPlans[i].endTime,"versionNo":text.plans[i].versionNo,"projectNo":data.projectNo,"projectName":data.projectName};
		        			}else{
			            		var newRow={"stage":text.plans[i].stage,"startTime":text.plans[i].startTime,"endTime":text.plans[i].endTime,"versionNo":text.plans[i].versionNo,"projectNo":data.projectNo,"projectName":data.projectName};
		        			}
		        			if(!first&&text.plans[i].endTime==null){
		        				first=true;
		        			}
							grid.addRow(newRow);
			            }
						initrows=text.plans;
			            if(first){
			            	changePlan();
			            }
	            	}
		        }
			});
	    }
    }
    
    function changePlan(){
    	if(flag){
    		nui.alert("计划尚在审核中，不可变更！");
    		return false;
    	}else{
    		document.getElementById("changeButton").style.display="none";
    		document.getElementById("appButton").style.display="inline-block";
    		isEdit=true;
    		var record = grid.getSelected();
    		grid.select(record);
    	}
    }
    
    function commitPlan(){
    	form.validate();
    	if(form.isValid() != false){
    		grid.commitEdit();
        	var rowData = grid.getChanges();
        	
        	var ischanged=false;
        	for(var i=0;i<rowData.length;i++){
        		var row = rowData[i];
        		if(row.startTime==null){
        			alert(nui.getDictText("AME_PROJECT_STAGE",row.stage)+"的开始时间不能为空，请重新选择");
        			grid.beginEditRow(row);
        			return false;
        		}
        		if(row.endTime==null){
        			alert(nui.getDictText("AME_PROJECT_STAGE",row.stage)+"的结束时间不能为空，请重新选择");
        			grid.beginEditRow(row);
        			return false;
        		}
        		if(row.startTime>row.endTime){
        			alert(nui.getDictText("AME_PROJECT_STAGE",row.stage)+"的结束时间小于开始时间，请重新选择");
        			grid.beginEditRow(row);
        			return false;
        		}
        		
    			if(i>0&&rowData[i-1].endTime!=""&&rowData[i-1].endTime!=null&&formetDate2String(rowData[i-1].endTime)!=formetDate2String(row.startTime)){
    				alert(nui.getDictText("AME_PROJECT_STAGE",row.stage)+"的开始时间于上一个阶段的结束时间连续，请重新选择");
    				grid.beginEditRow(row);
    				return false;
    			}
        		
        		if(!ischanged&&(initrows.length==0||initrows[i].startTime==null||initrows[i].endTime==null
        		      ||formetDate2String(row.startTime)!=formetDate2String(initrows[i].startTime)||formetDate2String(row.endTime)!=formetDate2String(initrows[i].endTime))){
        			ischanged=true;
        		}
        	}
        	
        	if(!ischanged){
        		nui.alert("计划未发生变更，请重新编辑，如果不需要变更，请点击关闭，结束编辑并关闭窗口!");
        		return false;
        	}
        	
        	if(startdate>formetDate2String(rowData[0].startTime)){
        		if(!confirm("计划开始日期早于"+startdate+"(项目的开始日期)，请确认所填的开始日期是否正确!")){
        			grid.beginEditRow(rowData[0]);
        			return false;	
        		}
        	}
        	
			nui.get("appButton").disable();
			if (confirm("变更计划将会发起审批流程，请确认当前更改的计划是否是最终的计划？如果第一次维护计划，则不会发起流程。")) {
			 nui.ajax({
				url: "com.primeton.rdmgr.project_plan.projectPlanManager.queryInAuditPlan.biz.ext",
				type: 'POST',
				data: {"project":{"projectNo":proNo,"projectName":proName}},	
				contentType: 'text/json',
				async:false,
		        success: function (text) {
		        	if(text.auditPlans&&text.auditPlans.length>0){
		        		nui.alert("存在待审核的计划，审核结束之后可再次修改！");
		        		nui.get("appButton").enable();
		        		return false;
	            	}else{
	            		var json = nui.encode(rowData);
	            		modifyPlan(json);
	            	}
		        }
			});
			}else{
				nui.get("appButton").enable();
			} 
			
		}else{
			alert("请检查表单的完整性!");
			return;
		}
    }
    
    
    function modifyPlan(json){
    	nui.mask({
            el: document.body,
            cls: 'mini-mask-loading',
            html: '数据处理中...'
        });
		nui.ajax({
			url: "com.primeton.rdmgr.project_plan.projectPlanManager.modifyProjectPlan.biz.ext",
			type: 'POST',
			data: {"plans": json},	
			contentType: 'text/json',
	        success: function (text) {
	        	if(text.result){
	        		nui.unmask();
                	alert("操作成功！");
               		CloseWindow("ok");
            	}else{
            		nui.unmask();
            		alert("操作失败！");
            		nui.get("appButton").enable();
            	}
	        }
		});
    }
    
    //关闭窗口
	function onCancel(e) {
        CloseWindow("cancel");
    }
	    
	//标准方法接口定义
    function CloseWindow(action) {           
        if (window.CloseOwnerWindow) return window.CloseOwnerWindow(action);
        else window.close();
    }
	    
    function renderStage(e){
    	return nui.getDictText("AME_PROJECT_STAGE",e.value)
    }
    
    function renderDate(e){
    	if(e.field=="startTime"){
    		if(e.row.startTime2&&formetDate2String(e.row.startTime2)!=formetDate2String(e.value)){
    			e.cellStyle = 'background-color:#FF6347';
    			return formetDate2String(e.value)+"变更为"+formetDate2String(e.row.startTime2);
    		}else if(e.value){
	    		return formetDate2String(e.value);
	    	}else{
	    		return "<font color='#FF3030'>点击进行编辑</font>";
	    	}	
    	}
    	if(e.field=="endTime"){
    		if(e.row.endTime2&&formetDate2String(e.row.endTime2)!=formetDate2String(e.value)){
    			e.cellStyle = 'background-color:#FF6347';
    			return formetDate2String(e.value)+"变更为"+formetDate2String(e.row.endTime2);
    		}else if(e.value){
	    		return formetDate2String(e.value);
	    	}
    	}
    }
</script>
</html>
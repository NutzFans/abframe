<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@include file="/purchase/common/common.jsp"%>
<html>
<head>
<title>重点任务</title>
	<style type="text/css">
	    body{
	        margin:0;padding:0;border:0;width:100%;height:100%;overflow:hidden;
	    }
    </style>
</head>
<body>
	<div class="nui-fit">
		<fieldset style="border:solid 1px #aaa;padding:3px;">
		<legend>重点任务基本信息</legend>
		 	<form id="form1" method="post" >
	        	<table style="table-layout:fixed;" id="table_file1">
			            <tr>
							<td align="right" style="width:128px">重点任务名称：</td>
							<td  colspan="8";>
								<input class="nui-textbox" name="taskName" id="taskName" style="width:950px" readOnly="readOnly">
							</td>
						</tr>
						<tr>	
							<td align="right" style="width:128px">重点任务方向：</td>
							<td  colspan="2";>
								<input class="nui-textbox" name="taskDirection" id="taskDirection" style="width:220px" required="true" onblur="checkProjectno" readOnly="readOnly">
							</td>	
							<td align="right" style="width:128px">责任单位：</td>
							<td  colspan="2"; style="width: 210px;"><input
									name="orgId" id="orgId"
									class="nui-combobox" required="true"
									url="com.primeton.rdmgr.labor.labormgr.getAllOrgs.biz.ext"
									filterType="like" textField="orgname" valueField="orgid"
									dataField="allorgs" valueFromSelect="true" allowInput="true"
									onvaluechanged="changeOrgForm" style="width: 241px;" readOnly="readOnly" /></td>	
							<td align="right" style="width:128px">年度：</td>
							<td  colspan="2";>
								<input class="nui-textbox"  name="declareYear" id="declareYear" style="width:219px" shownullItem="true" readOnly="readOnly">
							</td>
						</tr>
						<tr>
							<td align="right" style="width:128px"> 计划完成时间：</td>
							<td colspan="2"; style="width: 130px"><input
									name="planCompleteTime" id="planCompleteTime"
									class="nui-datepicker" required="true" style="width: 220px" readOnly="readOnly"/></td>
							<td align="right" style="width:128px"> 实际完成时间：</td>
							<td colspan="2"; style="width: 130px"><input
									name="actualCompleteTime" id="actualCompleteTime"
									class="nui-datepicker" style="width: 241px"/></td>
									
							<td align="right" style="width: 100px">完成状态：</td>
							<td><input id="completeStatus" name="completeStatus"   class="nui-dictcombobox"  dictTypeId="ZH_TASK_STATUS" style="width: 219px"  readOnly="readOnly" required="true"/></td>
						</tr>
						<tr>
							<td align="right" style="width:128px">决策情况：</td>
							<td  colspan="8";>
								<input class="nui-textarea" name="decisionSituation" id="decisionSituation" style="width:950px;height: 40px" shownullItem="true">
							</td>
						</tr>
						<tr>
							<td align="right" style="width:128px">年度目标：</td>
							<td  colspan="8";>
								<input name="yearTarget" id="yearTarget" class="nui-textarea" style="width:950px;height: 40px" showClose="false" allowInput="true" />
								<input name="id" id="keytaskId" class="nui-hidden" style="width:950px;height: 40px" showClose="false" allowInput="true" />
							</td>
						<tr>
							<td align="right" style="width:128px">总体目标：</td>
							<td  colspan="8";>
								<input class="nui-textarea"  name="populationTarget" id="populationTarget" style="width:950px;height: 40px">
							</td>
						</tr>
						<tr>
							<td align="right" style="width:128px">完成情况：</td>
							<td  colspan="8";>
								<input class="nui-textarea" dictTypeId="zh_keytaskstatus" name="completion" id="completion" style="width:950px;height:40px" shownullItem="true">
							</td>
						</tr>

	        	</table>
	        </form>
    	</fieldset>
		<fieldset style="border: solid 1px #aaa;padding: 3px;width: 1080px;">
			    <legend>重点任务月度计划 </legend>
		<div style="width:auto;">
        <div class="nui-toolbar" id="id2" style="border-bottom:0;padding:0px;" >
            <table style="width:auto;">
                <tr>
                    <td style="width:100%;">
                       <a class="nui-button" iconCls="icon-edit" onclick="edit()" plain="true" >编辑</a>
                       <a class="nui-button" iconCls="icon-upload" onclick="uploadFile()" plain="true">导入</a>
                       <a class="nui-button" iconCls="icon-download" onclick="exportMonthPlan()" plain="true">导出</a>
                    </td>
                </tr>
            </table>           
        </div>
	</div> 
	<div id="datagrid2" class="nui-datagrid" style="width:auto;height:auto;" dataField="monthTaskList"  url="com.zhonghe.ame.imptask.keytask.queryMonthTask.biz.ext"
	 allowResize="true" pageSize="20" allowCellEdit="true" allowCellSelect="true" multiSelect="false" editNextOnEnterKey="true" showPager="false">
	    <div property="columns"> 
	    	 <div name="temp123" type="checkcolumn"></div>
		        	<!-- <div type="expandcolumn" width="20"></div> -->
		        	<div field="month" width="40" align="center" headerAlign="center" allowSort="true">月份</div>
		            <div field="monthDescribe" width="120" align="center" headerAlign="center" allowSort="true">月度计划描述</div>
		            <div field="planFinishTime" width="80" align="center" headerAlign="center" allowSort="true" >计划完成时间</div>
		            <div field="actualCompleteTime" width="90" align="center" headerAlign="center" allowSort="true" >实际完成时间</div>
		            <div field="completion" width="80" align="center" headerAlign="center" allowSort="true"  >进展情况</div>
		            <div field="completeRate" width="50" align="center" headerAlign="center" renderer="getRate" onValueChange="getStatus()">完*成率（%）</div>
		            <!--<div field="completeStatus" width="150" align="center" renderer="getValueStatus"headerAlign="center" >完成状态</div>-->
		            <div field="problemMeasures" width="100" align="center" headerAlign="center" allowSort="true">问题及纠偏措施</div>
		           <!--  <div field="filepath" width="80" align="center" headerAlign="center" allowSort="true">附件</div> -->
	    </div>
	</div>
	</fieldset>
</div>
	<div style="text-align:center;padding:10px;" class="nui-toolbar">
		<a class="nui-button" onclick="update()" id="appButton" style="width:60px;margin-right:20px;">更新</a>
		<a class="nui-button" onclick="onCancel('cancel')" style="width:60px;">关闭</a>
	</div>
<form name="viewlist1" id="viewlist1" action="com.primeton.eos.ame_common.ameExportCommon.flow" method="post">
		<input type="hidden" name="_eosFlowAction" value="action0" filter="false"/>
		<input type="hidden" name="downloadFile" filter="false"/>
		<input type="hidden" name="fileName" filter="false"/>
	</form> 
    <script type="text/javascript">
    	
		nui.parse();
    	var form = new nui.Form("form1");
    	var workItemID = <%=request.getParameter("workItemID")%>;
    	var ida = <%=request.getParameter("id")%>;
    	var option = <%=request.getParameter("option")%>;
    	var isUpdate = <%=request.getParameter("isUpdate")%>;
    	var appContext = "<%=request.getContextPath()%>";
    	var grid = nui.get("datagrid2");
    	var keytaskId= nui.get("keytaskId");
    	
    	function getRate(e) {
    		//console.log(grids[0].monthDescribe);
    		//console.log(e.record.monthDescribe);
    		//setCompleteStatus();
    		
    		var grids = grid.getData();
    		var flag = 0;
    		for(var i = 0;i < grids.length;i++) {
	    		if(grids[i].monthDescribe!=null || grids[i].planFinishTime!=null || grids[i].actualCompleteTime!=null || grids[i].completion!=null || grids[i].completeRate!=null || grids[i].problemMeasures!=null) {
	    			if(grids[i].completeRate != 100 && grids[i].completeRate != 1) {
	    				//console.log(grids[i].completeRate);
	    				var flag = 1;
	    			}
	    		}
    		}
    		if(flag == 0) {
    			nui.get("completeStatus").setValue(1);
    		} else {
    			nui.get("completeStatus").setValue(0);
    		}
    		
    		
    		if(e.value != null) {
    			if((e.value*100) >= 100) {
    				return e.value;
    			} else {
    				return e.value*100;
    			}
    		}
    	}
    	
    	
    	function getValueStatus(e){
    		if(e.value==0){
    			return "进行中";
    		}else if(e.value==1){
    			return "已完成";
    		}else{
    			return "";
    		}
    	}
    	
    	//控制完成时间、完成情况只读属性
    	if(option == 2){
    		nui.get("completion").setReadOnly("true");     
    		nui.get("actualCompleteTime").setReadOnly("true");     
    	}
    	
    	function init(){ 
			var data = {workitemid:ida};
			var json = nui.encode(data);
			nui.ajax({		
		        url: "com.zhonghe.ame.imptask.keytask.queryxxbjMngInfo.biz.ext",
		        type: "post",
		        data: json ,
		        contentType:'text/json',
		        success: function (o) {
			            form.setData(o.keyTask);
			            nui.get("decisionSituation").setReadOnly("true");
			            nui.get("yearTarget").setReadOnly("true");
			            nui.get("populationTarget").setReadOnly("true");         			            		            	
			            nui.get("orgId").setText(o.keyTask.orgname);
						grid.load({id:o.keyTask.id});						
			        }
			    });
		 }
		init();
		
		function uploadFile(){
			//console.log(keytaskId.value);
			nui.open({
		        url: "/default/imptask/importKeyTaskMonth.jsp?keytaskId="+keytaskId.value,
		        title: "导入", 
				width: 700,
		        height: 230,
		        allowDrag:true,
		        onload: function () {
					var iframe = this.getIFrameEl();
				}
			});
	    }
		
	    function exportMonthPlan(){
		if(!confirm("是否确认导出？")){
			return;
		}
		
		var json =  nui.encode({"keyId":ida});
		nui.ajax({
			url: "com.zhonghe.ame.imptask.keytask.exportMonthPlan.biz.ext",
	        type: "post",
	        data: json,
	        cache: false,
	        contentType: 'text/json',
	        success: function (o) {
	     		nui.unmask();
	     		var filePath = o.downloadFile;
	        	var fileName = "重点任务-"+nui.get("taskName").getValue()+"月度计划";
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
	    
	    function check(e){
			if(e.row.orgname!==null){
				return "已完成";
			}else{
				return "";
			}
		}
    	//修改投标明细
		function edit(){			
    		var row = grid.getSelecteds();
			if (row.length > 1) {
    			nui.alert("只能选中一条项目记录进行编辑");
    		}else{
	    		var row=row[0];
	    		
	  //  		if(row.monthDescribe=="" ||row.monthDescribe==null ){
	  //  			nui.alert("月度计划描述为空无法修改");
	  //  			return;
	  //  		}
	    		
				if (row) {
					nui.open({
						url: appContext+"/imptask/selfevaluate/editMonthTask1.jsp?keyId="+row.id+"&type="+isUpdate,
						width: 1000,
						height: 320,
						onload: function () {
							var iframe = this.getIFrameEl();
						},
						ondestroy: function (action) {
			            	if(action=="ok"){
			            		grid.reload();
			            	}
			            }
					}) 			
				}else{
					nui.alert("请选中一条记录","提示");
				}		
    		}
		}

	
	function update(){			
		var formData = form.getData();
		formData.id=ida;
		var json = {"keyTaskMng":formData,"id":ida};
    	 nui.ajax({
	  			url: "com.zhonghe.ame.imptask.keytask.updataKeyTaskMng.biz.ext",
				type: "post",
				data: json,
				contentType: "text/json",
				success: function (o){
					nui.unmask(document.body);
					if(o.result == "success"){
			        	nui.alert("修改成功","系统提示",function(){
			        		
			        		CloseWindow("ok");
			        	});
					}else{
						nui.alert("提交失败，请联系信息技术部人员！","系统提示", function(action){
							
						    CloseWindow("ok");
							
						});
					}
				},
				error: function(jqXHR, textStatus, errorThrown){
					alert(jqXHR.responseText);
				}
	  		}) 
		  		
    }
	
	function setCompleteStatus(){
			
	}
	
	
	function saveData(json){
		 mini.mask({
	            el: document.body,
	            cls: 'mini-mask-loading',
	            html: titleText+'中...'
	        }); 
	    	  nui.ajax({
	  			url: "com.zhonghe.ame.imptask.keytask.depAppMonthTask.biz.ext",
				type: "post",
				data: json,
				contentType: "text/json",
				success: function (o){
					nui.unmask(document.body);
					if(o.result == "success"){
			        	nui.alert(titleText + "成功","系统提示",function(){
			        		//nui.get("sureButton").setEnabled(true);
			        		CloseWindow("ok");
			        	});
					}else{
						nui.alert("提交失败，请联系信息技术部人员！","系统提示", function(action){
							//nui.get("sureButton").setEnabled(true);
						    CloseWindow("ok");
							
						});
					}
				},
				error: function(jqXHR, textStatus, errorThrown){
					alert(jqXHR.responseText);
				}
	  		})  
	}
	
	
	function CloseWindow(action) {            
        if (action == "close" && form.isChanged()) {
            if (confirm("是否关闭窗口？")) {
                return false;
            }
        }
        if (window.CloseOwnerWindow) return window.CloseOwnerWindow(action);
        else window.close();            
    }

    function onCancel(e) {
        CloseWindow("cancel");
    }
	

   	</script>
</body>
</html>
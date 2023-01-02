<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<!-- 
  - Author(s): wanglinqiong
  - Date: 2016-05-12 16:17:56
  - Description:
-->
<head>
<title>重点任务编辑-自评页面查看</title>
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
		<fieldset style="border:solid 1px #aaa;padding:3px;width:97%;height: 40%">
		<legend>月度计划详情</legend>
		 	<form id="form1" method="post" >
	        	<table style="table-layout:fixed;" id="table_file1">
			            <tr>
							<td align="right" style="width:128px"><nobr>月份：</nobr></td>
							<td  colspan="2";>
								<input class="nui-textbox" name="month" id="month" style="width:200px" readOnly="readOnly">
							</td>
							<td align="right" style="width:128px"><nobr>月度计划描述：</nobr></td>
							<td  colspan="2";>
								<input class="nui-textbox" name="monthDescribe" id="monthDescribe" style="width:200px"  readOnly="readOnly" >
							</td>	
							<td align="right" style="width:128px"><nobr>责任单位：</nobr></td>
							<td  colspan="2"; style="width: 210px;"><input
									name="orgid" id="orgname"
									class="nui-combobox" required="true"
									url="com.primeton.rdmgr.labor.labormgr.getAllOrgs.biz.ext"
									filterType="like" textField="orgname" valueField="orgid"
									dataField="allorgs" valueFromSelect="true" allowInput="true"
									 style="width: 200px;" readOnly="readOnly"  /></td>			
									
						</tr>
						<tr>
							<td align="right" style="width:128px">计划完成时间：</td>
							<td  colspan="2"; style="width: 130px"><input
									name="planFinishTime" id="planFinishTime"
									class="nui-datepicker"  style="width: 200px"  readOnly="readOnly" /></td> 
											
							<td align="right" style="width:128px"><nobr>实际完成时间：</nobr></td>
							<td colspan="2"; style="width: 130px"><input
									name="actualCompleteTime" id="actualCompleteTime"
									class="nui-datepicker"  style="width: 200px" /></td>
							<td align="right" style="width:128px"><nobr>完成状态：</nobr></td>
							<td  colspan="2"><input class="nui-dictcombobox"
									dictTypeId="ZH_TASK_STATUS"  name="completeStatus" shownullItem="true"
									style="width: 200px;" id="completeStatus" readOnly="readOnly" /> 
						</tr>
						
						<tr>
						
							<td align="right" style="width:128px"><nobr>完成情况：</nobr></td>
							<td colspan="8"; >
								<input class="nui-textarea" name="completion" id="completion" style="width:871px;height: 40px" readOnly="readOnly" >
							</td>
							
							<!-- 下边三个传参渲染都要修改  -->
							<!-- <td align="right" style="width:128px"><nobr>纠偏时间：</nobr></td>
							<td  colspan="2"; style="width: 130px"><input
									name="rectifyingTime" id="rectifyingTime"
									class="nui-datepicker"  style="width: 200px" /></td>  -->
							
						</tr>
						<tr>
							<!-- <td align="right" style="width:128px"><nobr>未完成描述：</nobr></td>
							<td colspan="8"; >
								<input name="unfinishedDescribe" id="unfinishedDescribe" class="nui-textarea" style="width:800px;height: 40px" showClose="false" allowInput="true"  />
							</td> -->
						</tr>
						<tr>
							<td align="right" style="width:128px"><nobr>问题及纠偏措施：</nobr></td>
							<td colspan="8"; >
								<input name="problemMeasures" id="problemMeasures" class="nui-textarea" style="width:871px;height: 40px" showClose="false" allowInput="true" readOnly="readOnly" />
							</td>
						</tr>
						<!-- <tr>
							<td align="right" colspan="8"; style="color:#FF0000"><nobr>如未完成需要填写 纠偏时间 和未完成描述</nobr></td>
						</tr>  -->

	        	</table>
	        </form>
    	</fieldset>
<fieldset style="width: auto">

	<div style="text-align:center;padding:10px;" class="nui-toolbar">
		<a class="nui-button" onclick="submit()" id="appButton" style="width:80px;margin-right:20px;">确认</a>
		<a class="nui-button" onclick="onCancel('cancel')" style="width:80px;">取消</a>
	</div>

    <script type="text/javascript">
		nui.parse();
    	var form = new nui.Form("form1");
    	var id = <%=request.getParameter("keyId")%>;
    	//console.log(workItemID);
    	var grid_cont = nui.get("grid_cont");//项目合同
    	var save = "0";
    	var projectno1;
    	var remindfz = nui.getDictText('AME_SYSCONF',"projectYZ");
    	
    	function init(){
    		
			var data = {"keyId":id};
			var json = nui.encode(data);
			nui.ajax({
		        url: "com.zhonghe.ame.imptask.keytask.queryMonthTask.biz.ext",
		        type: "post",
		        data: json ,
		        contentType:'text/json',
		        success: function (o) {
			            form.setData(o.monthTaskList[0]);
			            var keyTask = o.monthTaskList[0];
			            nui.get("monthDescribe").setValue(keyTask.monthDescribe);
				       /*  nui.get("planFinishTime").setValue(keyTask.planFinishTime); */
				        nui.get("actualCompleteTime").setValue(keyTask.actualCompleteTime);
				        nui.get("completion").setValue(keyTask.completion);
				        nui.get("orgId").setValue(keyTask.orgname);
				        
				        nui.get("rectifyingTime").setValue(keyTask.rectifyingTime);
				        nui.get("unfinishedDescribe").setValue(keyTask.unfinishedDescribe);
				        if(keyTask.completeStatus==1){
				        	nui.get("completeStatus").setText("已完成");
				        }else{
				        	nui.get("completeStatus").setText("未完成");
				        }
				        nui.get("problemMeasures").setValue(keyTask.problemMeasures);
						
			        	
			        }
			    });
		}
		init();
	    	
    	
    	
    	

	//对应类型业务字典
	function dictGetType(e){
		return nui.getDictText('AME_PROCONT',e.value);
	}
	
	function submit(){
	
			var editData = form.getData();
			
			 
			var editDataJson = {"taskMonth":editData,"id":id};
			console.log(editDataJson);
	    	 nui.ajax({
		  			url: "com.zhonghe.ame.imptask.keytask.updateMonthTask.biz.ext",
					type: "post",
					data: editDataJson,
					contentType: "text/json",
					success: function (o){
						nui.unmask(document.body);
						console.log(o)
						if(o.result == "success"){
				        	nui.alert("更新成功","系统提示",function(){
				        		//nui.get("sureButton").setEnabled(true);
				        		CloseWindow("ok");
				        	});
						}else{
							nui.alert("提交失败，请联系信息技术部人员！","系统提示", function(action){
								CloseWindow("ok");
								//nui.get("sureButton").setEnabled(true);
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
            if (confirm("数据被修改了，是否先保存？")) {
                return false;
            }
        }
        if (window.CloseOwnerWindow) return window.CloseOwnerWindow(action);
        else window.close();            
    }

    function onCancel(e) {
        CloseWindow("cancel");
        window.opener.search();
    }
    
    //设置日期格式
	function onDealDate(e){
		if(e.cellHtml){
			return e.cellHtml.substring(0,10);
		}
	}
	
	//单元格开始编辑前，判断对应类型是否合同编号，如果是则允许编辑合同订单，如果不是则不允许编辑合同订单
	function checkOrder(e){
		if(e.field=="contorderno"){
			if(e.record.proconttype=="1"){
				e.cancel = true;
			}
		}
	}
	
	//当项目合同对应类型为项目与合同对应时清空合同订单
	function clearOrder(e){
		if(e.field=="proconttype"){
			if(e.value=="1"){
				var row = e.record;
				var rowData = {"contorderno":""};
				grid_cont.updateRow(row,rowData);
			}
		}
	}
	//预计合同改变 + 预计合同额expcontsum数字验证
	function changeexpcontsum(e){
		var remindfz = nui.get("remindfz").getValue();
		if(!remindfz){//如果为空，则根据预计合同额按比例计算
			calRemindfz();
		}
		//预计合同额expcontsum数字验证
		checkNum1();
	}
	
	//按比例计算阈值
	function calRemindfz(){
		var expcontsum = nui.get("expcontsum").getValue();
		if(!expcontsum){
			nui.alert("请先填写预计合同额！");
			return;
		}else{
			var projectYZRatio = nui.getDictText('AME_SYSCONF','projectYZRatio');//比例
			var remindfz = Math.round(parseFloat(expcontsum)*parseFloat(projectYZRatio));
			nui.get("remindfz").setValue(remindfz);
		}
	}
	
	//是否是数字
  	function IsNumber(num){
		var strRegex = "^\\d+(\\.\\d+)?$";
		var re=new RegExp(strRegex); 
		//re.test()
		if (re.test(num)){
			return (true); 
		}else{ 
			return (false); 
		}
	}
	
	//预计合同额expcontsum数字验证
	function checkNum1(){
		var expcontsum = nui.get("expcontsum").getValue();
		if(IsNumber(expcontsum)==false){
			alert("请输入正确数字格式！");
			nui.get("expcontsum").setValue("");
			return;
		}
	}
	
   	</script>
</body>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@page import="com.eos.data.datacontext.UserObject"%>
<%@page import="commonj.sdo.DataObject"%>
<%@page import="java.util.Map"%>
<%
	String contextPath=request.getContextPath();
 %>
<html>
<!-- 
  - Author(s): 许青倩
  - Date: 2019-08-05 16:35:57
  - Description:
-->
<head>
<title>试用期目标确认</title>
<meta http-equiv="content-type" content="text/html; charset=UTF-8" />
<%@include file="/common/common.jsp"%>
<h:script src='<%="/common/scripts/eos-web.js"%>' />
<script src="<%= request.getContextPath() %>/common/nui/nui.js" type="text/javascript"></script>
<style type="text/css">
    body{
        margin:0;padding:0;border:0;width:100%;height:100%;overflow:hidden;
    }
    .asLabel{border:0;background-color:#F5F5F5;cursor:default;}
</style>
</head>
<body>
<%long workItemID = (Long)request.getAttribute("workItemID"); %>
<div class="nui-fit">
	<jsp:include page="/ame_common/ameFlowOperTips/ameFlowOperTipsInfo.jsp"/>
	<form id="form_Intend" method="post">
		<fieldset id="field1" style="border:solid 1px #aaa;padding:3px;">
			<legend>新员工试用期信息表</legend>
			<div style="padding:5px;">
				<input name="omIntendJoin.intendid" id="intendid"  class="nui-hidden"/>
				<input name="omIntendJoin.processinstid" id="processinstid2"  class="nui-hidden"/>
				<input name="omIntendJoin.fileids" id="fileids" class="nui-hidden"/>
				<input name="omIntendJoin.intendname" class="nui-hidden"/>
				<input name="omIntendJoin.empcode" class="nui-hidden"/>
				<input class="nui-hidden" id="workItemID" value="<%=workItemID %>"/>
				<table style="table-layout:fixed;" id="table_intend1">	
					<tr>
						<td align="right" style="width:130px">姓名：</td>
						<td name="omIntendJoin.intendname" class = "asLabel" id="intendname" style="width:190px"></td>
						<td align="right" style="width:130px">工号：</td>
						<td name="omIntendJoin.empcode" class = "asLabel" id="empcode" style="width:190px"></td>
						<td align="right" style="width:130px">部门：</td>
						<td name="omIntendJoin.inorgid" class = "asLabel" id="inorgid" style="width:190px"></td>
					</tr>
					<tr>
						<td align="right" style="width:130px">职位分类：</td>
						<td name="omIntendJoin.position" class = "asLabel" id="position" style="width:190px"></td>
						<td align="right" style="width:130px">职位名称：</td>
						<td name="omIntendJoin.positionname" class = "asLabel" id="positionname" style="width:190px"></td>
						<td align="right" style="width:130px">直属主管：</td>
						<td name="omIntendJoin.managerid" class = "asLabel" id="managerid" style="width:190px"></td>
					</tr>
					<tr>
					    <td align="right" style="width:130px">入职导师：</td>
						<td name="omIntendJoin.tutorid" class = "asLabel" id="tutorid" style="width:190px"></td>
					</tr>
				</table>
			</div>
		</fieldset>
		<fieldset id="field6" style="border:solid 1px #aaa;padding:3px;">
			<legend>考核目标设定</legend>
			<div><span style="color: red">分值计算规则：“工作阶段划分”权重之和 + “综合素质”权重之和 = 100%，各个阶段目标权重之和 = 100%，总分 = 各考核项目评分乘以权重之和。</span></div>
			
			<fieldset id="field8" style="border:solid 1px #aaa;padding:3px;">
				<legend>一、工作阶段划分</legend>
				<div>
					<table  id="goaltable1" style="table-layout:fixed;border-collapse:collapse" bordercolor="#A8A8A8" border="1" cellspacing="0" cellpadding="1">
						
					</table>
				</div>
			</fieldset>
			<fieldset id="field7" style="border:solid 1px #aaa;padding:3px;">
				<legend>二、综合素质</legend>
				<div>
					<table  id="goaltable_SZ" style="table-layout:fixed;border-collapse:collapse" bordercolor="#A8A8A8" border="1" cellspacing="0" cellpadding="1">
						
					</table>
				</div>
			</fieldset>
			<fieldset id="field9" style="border:solid 1px #aaa;padding:3px;">
				<legend>三、新员工线上培训</legend>
				<div>
					<span>新员工须在试用期内完成新员工线上培训课程及其配套考试，并取得合格的成绩。</span>
				</div>
				<div>
					<span>如果考试成绩未达到合格，设一次补考机会，如补考不合格，则无法按时通过试用期。</span>
				<div>
			</fieldset>
			<fieldset id="field10" style="border:solid 1px #aaa;padding:3px;">
				<legend style="color:red">郑重提醒</legend>
				<div>
					<span style="color:red">试用期期间的考核评估分数的总分为100分，您在试用期期间的考核评估分数达到60分以上（含）将视作符合新员工录用条件之一，请在过程中积极主动与您的导师、主管保持良性沟通并有效进行目标达成。如您的评估分数达到60分，且新员工线上培训考试合格，并满足公司其他试用期考核要求的，视为您通过试用期考核。如您的评估分数未达到60分的，或新员工线上培训补考成绩未合格的，或者存在其他不符合录用条件的，则公司有权解除与您的劳动关系并无需支付任何补偿。</span>
				<div>
			</fieldset>
		</fieldset>
	</form>
	<div style="text-align:center;">
		<table>
			<tr>
				<td align="right" style="width:200px;font-weight:bold;">本人同意以上试用期目标设定</td>
				<td>
					<input class="nui-radiobuttonlist" name="confirmInto" id="confirmInto" repeatItems="2" repeatLayout="table" repeatDirection="Horizontal" textField="text" valueField="id" required="true" style="width:200px;" data="[{'id': 'true','text': '是'},{'id': 'false','text': '否'}]" onValueChanged="setOpinion()">
				</td>
				<td id="printbutton">
					<a class="nui-button" onclick="print()" style="width:130px;margin-right:20px;" id="print" >打印试用期目标</a>
				</td>
			</tr>
			<tr id="opinion">
				<td align="right" style="width:200px;font-weight:bold;">试用期目标意见：
				</td>
				<td  align="left" style="width:745px;font-weight:bold;">
					<input name="opinion" id="opinion" class="nui-textarea" style = "width: 97.5%;height:50px" maxLength="200" required="true"  onValueChanged="setOpinionMessage()">
				</td>
			</tr>
		</table>
		<%--<div id="confirmInto" name="confirmInto" class="nui-checkbox" style="text-align:center;font-weight:bold;">本人同意以上试用期目标设定</div>--%>
	</div>
	<fieldset id="field4" style="border:solid 1px #aaa;padding:3px;display:none;">
		<legend>入职附件</legend>
		<jsp:include page="/ame_common/detailFile.jsp"/>
	</fieldset>
	
    <!-- 审核意见  -->
	<fieldset style="display:none;">
		<jsp:include page="/ame_common/misOpinion.jsp"/>
	</fieldset>
	<fieldset id="field5" style="display:none;border:solid 1px #aaa;padding:3px;">
		<legend>处理意见附件</legend>
		<jsp:include page="/ame_common/addFiles.jsp"/>
	</fieldset>
</div>
<div style="text-align:center;padding:10px;" class="nui-toolbar">
	<a class="nui-button" onclick="onOk()" style="width:60px;margin-right:20px;" id="appButton">提交</a>
	<a class="nui-button"onclick="onCancel" iconCls="icon-close" style="width:60px;">关闭</a>
</div>
</body>
<script type="text/javascript">
	nui.parse();
	var form_Intend = new nui.Form("form_Intend");
	//审核意见的表单
	var opioionform = new nui.Form("#opioionform");
	
	var y = 0;//动态生成考核表单
	var x =[]//动态生成目标
    var z = 0;//阶段结束
	
	initdate();
	function initdate(){
		promptInit({workItemID: <%=workItemID %>});//流程提示信息
		//初始化拟入职人员信息
       	nui.ajax({
            url: "com.primeton.eos.ame_permanage.ame_entry.getProcessEntry.biz.ext",
            data: {intendid:null,workItemID:<%=workItemID %>,processInstID:null},
            type: 'POST',
			contentType: 'text/json',
            success: function (o) {
            	if(o.omIntendJoin){
            		document.getElementById("intendname").innerHTML = o.omIntendJoin.intendname == null ?"":o.omIntendJoin.intendname;
            		document.getElementById("empcode").innerHTML = o.omIntendJoin.empcode == null ?"":o.omIntendJoin.empcode;
            		document.getElementById("inorgid").innerHTML = o.omIntendJoin.inorgname == null ?"":o.omIntendJoin.inorgname;
            		document.getElementById("position").innerHTML = o.omIntendJoin.position == null ?"":nui.getDictText('AME_POSITION_MEMO',o.omIntendJoin.position);
            		document.getElementById("positionname").innerHTML = o.omIntendJoin.positionname == null ?"":o.omIntendJoin.positionname;
            		document.getElementById("managerid").innerHTML = o.omIntendJoin.managername == null ?"":o.omIntendJoin.managername;
            		document.getElementById("tutorid").innerHTML = o.omIntendJoin.tutorname == null ?"":o.omIntendJoin.tutorname;
            		form_Intend.setData(o);
            		document.getElementById('opinion').style.display="none";
            		//加载已有的工作目标
            		if(o.omIntendPeriod.length >0){
            			for(var i=0;i<o.omIntendPeriod.length;i++){
            				y++;
    						x.push(0);
            				var myTable = document.getElementById('goaltable1');
            				//向表格中增加一行
							var myNewRow = myTable.insertRow(myTable.rows.length);//取得表格的总行数
							var aRows=myTable.rows;
							//取得表格的总网格数
							var aCells=myNewRow.cells;
							//向新增行中增加7个网格
							var oCell1_1=aRows[myNewRow.rowIndex].insertCell(aCells.length);
							var oCell1_2=aRows[myNewRow.rowIndex].insertCell(aCells.length);
							var oCell1_3=aRows[myNewRow.rowIndex].insertCell(aCells.length);
							var oCell1_4=aRows[myNewRow.rowIndex].insertCell(aCells.length);
							var oCell1_5=aRows[myNewRow.rowIndex].insertCell(aCells.length);
							var oCell1_6=aRows[myNewRow.rowIndex].insertCell(aCells.length);
							var oCell1_8=aRows[myNewRow.rowIndex].insertCell(aCells.length);
							
							var tempName=y;
							var tempID ="omIntendGoals"+y;
							var tempID2='"'+tempID+'"';
							var name = "omIntendGoals["+(y-1)+"]";
							//var html=myTable.innerHTML+'<tr>';
							//设置网格html
							oCell1_1.innerHTML = "考核阶段：";
							oCell1_2.innerHTML = "<input class='nui-textbox' name='"+name+".goalname' id='goalname"+y+"' width='100%' required='true' value='阶段"+z+"' readOnly='readOnly'/>";
							oCell1_3.innerHTML = "考核区间：";
							oCell1_4.innerHTML = "<input class='nui-datepicker' name='"+name+".goalstartdate' id='goalstartdate"+y+"' style='width:30%' required='true' readOnly='readOnly'/>至<input class='nui-datepicker' name='"+name+".goalenddate' id='goalenddate"+y+"' style='width:30%' required='true' readOnly='readOnly'/>";
							oCell1_5.innerHTML = "考核权重：";
							oCell1_6.innerHTML = "<input class='nui-spinner' name='"+name+".weight' id='weight"+y+"'  style='width:30%' required='true' format='n2' showbutton='false' changeOnMousewheel='false' minValue='0' maxValue='100' readOnly='readOnly'/>%";
							oCell1_8.innerHTML = "<input class='nui-hidden' name='"+name+".checktype' id='checktype"+y+"' value='0'/>" + "<input class='nui-hidden' name='"+name+".goalid' id='goalid"+y+"'/>";
							oCell1_4.style.width	= "380px";
							oCell1_4.colSpan='3';
							oCell1_8.style.display = "none";
							nui.parse();
					    	nui.get("goalname"+y).setValue(o.omIntendPeriod[i].goalname);
					    	nui.get("goalstartdate"+y).setValue(o.omIntendPeriod[i].goalstartdate);
					    	nui.get("goalenddate"+y).setValue(o.omIntendPeriod[i].goalenddate);
					    	nui.get("weight"+y).setValue(o.omIntendPeriod[i].weight*100); 
					    	nui.get("goalid"+y).setValue(o.omIntendPeriod[i].goalid);
					    	
					    	if(o.omIntendPeriod[i].omIntendScores){
								var index = y;
								for(var j=0;j<o.omIntendPeriod[i].omIntendScores.length;j++){
									(x[(index-1)])++;
									var name = "omIntendGoals["+(index-1)+"].omIntendScores["+((x[(index-1)])-1)+"]";
							    	//插入一行
							    	var myNewRow = myTable.insertRow(myTable.rows.length);
							    	//取得表格的总行数
							    	var aRows=myTable.rows;
									//取得表格的总网格数
									var aCells=myNewRow.cells;//向新增行中增加7个网格
									var oCell1_11=aRows[myNewRow.rowIndex].insertCell(aCells.length);
									var oCell1_22=aRows[myNewRow.rowIndex].insertCell(aCells.length);
									var oCell1_33=aRows[myNewRow.rowIndex].insertCell(aCells.length);
									var oCell1_44=aRows[myNewRow.rowIndex].insertCell(aCells.length);
									var oCell1_331=aRows[myNewRow.rowIndex].insertCell(aCells.length);
									var oCell1_441=aRows[myNewRow.rowIndex].insertCell(aCells.length);
									var oCell1_55=aRows[myNewRow.rowIndex].insertCell(aCells.length);
									var oCell1_66=aRows[myNewRow.rowIndex].insertCell(aCells.length);
									var oCell1_77=aRows[myNewRow.rowIndex].insertCell(aCells.length);
									
									oCell1_11.innerHTML = "";
							    	oCell1_22.innerHTML = "";
							    	oCell1_33.innerHTML = "目标"+(x[(index-1)])+":";
							    	oCell1_44.innerHTML = "<input class='nui-textarea' name='"+name+".scorename' id='scorename"+(x[(index-1)])+"' width='100%' required='true' readOnly='readOnly'/>";
							    	oCell1_331.innerHTML = "考核达标结果:";
							    	oCell1_441.innerHTML = "<input class='nui-textarea' name='"+name+".aimscore' id='aimscore"+(x[(index-1)])+"' width='100%' required='false' readOnly='readOnly'/>";
							    	oCell1_55.innerHTML = "目标权重：";
							    	oCell1_66.innerHTML = "<input class='nui-spinner' name='"+name+".weight' id='scoreweight"+(x[(index-1)])+"'  style='width:30%' required='true' format='n2' showbutton='false' changeOnMousewheel='false' minValue='0' maxValue='100' readOnly='readOnly'/>%";
							    	oCell1_77.innerHTML = "<input class='nui-hidden' name='"+name+".scoreid' id='scoreid"+(x[(index-1)])+"'/>";
							    	oCell1_44.style.width	= "190px";
    								oCell1_441.style.width	= "190px";
    								oCell1_77.style.display = "none";
							    	nui.parse();
							    	nui.get("scorename"+(x[(index-1)])).setValue(o.omIntendPeriod[i].omIntendScores[j].scorename);
							    	nui.get("aimscore"+(x[(index-1)])).setValue(o.omIntendPeriod[i].omIntendScores[j].aimscore);
							    	nui.get("scoreweight"+(x[(index-1)])).setValue((o.omIntendPeriod[i].omIntendScores[j].weight*100));
							    	nui.get("scoreid"+(x[(index-1)])).setValue((o.omIntendPeriod[i].omIntendScores[j].scoreid));
							    	oCell1_33.style.backgroundColor = '#FFF68F';
							    	oCell1_55.style.backgroundColor = '#FFF68F';
								}
							}		
            			}
            		}
            		//加载综合素质默认值
            		if(o.omIntendQuality.length >0){
            			for(var i=0;i<o.omIntendQuality.length;i++){
            				y++;
    						x.push(0);
            				var myTable = document.getElementById('goaltable_SZ');
            				//向表格中增加一行
							var myNewRow = myTable.insertRow(myTable.rows.length);//取得表格的总行数
							var aRows=myTable.rows;
							//取得表格的总网格数
							var aCells=myNewRow.cells;
							//向新增行中增加7个网格
							var oCell1_1=aRows[myNewRow.rowIndex].insertCell(aCells.length);
							var oCell1_2=aRows[myNewRow.rowIndex].insertCell(aCells.length);
							var oCell1_3=aRows[myNewRow.rowIndex].insertCell(aCells.length);
							var oCell1_4=aRows[myNewRow.rowIndex].insertCell(aCells.length);
							var oCell1_5=aRows[myNewRow.rowIndex].insertCell(aCells.length);
							var oCell1_6=aRows[myNewRow.rowIndex].insertCell(aCells.length);
							var oCell1_7=aRows[myNewRow.rowIndex].insertCell(aCells.length);
							var tempName=y;
							var tempID ="omIntendGoals"+y;
							var tempID2='"'+tempID+'"';
							var name = "omIntendGoals["+(y-1)+"]";
							
							//设置网格html
							oCell1_1.innerHTML = "综合素质：";
							oCell1_2.innerHTML = "<input class='nui-textbox' name='"+name+".goalname' id='goalname"+y+"' width='100%' required='true' readOnly='readOnly'/>";
							oCell1_3.innerHTML = "达标结果：";
							oCell1_4.innerHTML = "<input class='nui-textarea' name='"+name+".scorename' id='scorename"+y+"' style='width:100%' required='true' readOnly='readOnly'/>";
							oCell1_5.innerHTML = "考核权重：";
							oCell1_6.innerHTML = "<input class='nui-spinner' name='"+name+".weight' id='weight"+y+"'  style='width:30%' required='true' format='n2' showbutton='false' changeOnMousewheel='false' minValue='0' maxValue='100' readOnly='readOnly'/>%";
							oCell1_7.innerHTML = "<input class='nui-hidden' name='"+name+".checktype' id='checktype"+y+"' value='1'/>" + "<input class='nui-hidden' name='"+name+".goalid' id='goalid"+y+"'/>";
							oCell1_4.style.width	= "380px";
							oCell1_7.style.display = "none";
					    	nui.parse();
					    	nui.get("goalname"+y).setValue(o.omIntendQuality[i].goalname);
					    	nui.get("scorename"+y).setValue(o.omIntendQuality[i].scorename);
					    	nui.get("weight"+y).setValue(o.omIntendQuality[i].weight*100);  
					    	nui.get("goalid"+y).setValue(o.omIntendQuality[i].goalid);
					    	//oCell1_4.style.weight="200px";				
            			}
            		}
            		
			    	nui.parse();
            		//附件加载
            		nui.get("grid_0").load({"groupid":"omIntendJoin","relationid":o.omIntendJoin.intendid});
            		//审批意见的流程实例ID
					nui.get("processinstid").setValue(o.omIntendJoin.processinstid);
               		nui.get("auditstatus").setValue("4");
					nui.get("workitemid").setValue(<%=workItemID %>);
               		nui.get("activitydefid").setValue(o.workitem.activityDefID);
					//流程回退路径赋值 
                	nui.get("backTo").setData(o.omIntendJoin.backList);
	                //审核结果设置
					var dataStatus = [{"dictID": 1,"dictName": "通过"},{"dictID": 0,"dictName": "退回"}];
					nui.get("auditstatus").setData(dataStatus);
					nui.get("auditstatus").setValue("1");
					nui.get("auditopinion").setValue("同意。");
					var processinstid = o.omIntendJoin.processinstid;
					var grid = nui.get("datagrid1");
					grid.load({"processInstID": processinstid});
					grid.sortBy("time", "desc");
            	}
        	},
            error: function (jqXHR, textStatus, errorThrown) {
                alert(jqXHR.responseText);
            }
		});
  	}
  	
  	//发起流程还是暂时保存
	function onOk(){
		var filePaths = document.getElementsByName("uploadfile").length;
    	for(var j = 0;j < filePaths;j++){
    		var a = document.getElementsByName("remarkList")[j].value;
    		if(a == null || a == ""){
    			nui.alert("新增附件不可以为空");
    			return false;
    		}
    	}
		var auditstatus = nui.get("auditstatus").getValue();
		if(auditstatus == 1){
    		var confirmInto = nui.get("confirmInto").getValue();
			if(confirmInto == false || confirmInto == 'false'){
				nui.alert("请选择是否本人同意以上试用期目标设定!");
				return false;
			}
    	}
    	var opinion = nui.get("opinion").getValue();
    	if(opinion == "" || opinion == null){
			nui.alert("对试用期目标设定有疑议的情况下，试用期目标意见必填!");
			return false;
    	}
    	if(!form_Intend.validate() && auditstatus!="2"){
			nui.alert("信息录入不完整!");
			return false;
		}else{
			nui.confirm("请确认您是否已打印试用期目标？否则提交之后将无法打印！","提交提示",function(action){
				if(action == "ok"){
					document.getElementById("fileCatalog").value="omIntendJoin";
    				form2.submit();
				}
			});
		}
	}
	
	function SaveData(){
		var json = form_Intend.getData();
		var message = "提交";
		//发起页面的处理信息
		var opioionformData = opioionform.getData();
		json.misOpinion = opioionformData.misOpinion;
		
		json.omIntendJoin.intendname = document.getElementById("intendname").innerHTML;
		var backTo = nui.get("backTo").getValue();
		//回退信息
		if(backTo == 'manualActivity2' || backTo == 'manualActivity21'){
		  json.backflag = "2";
		}
		else if(backTo == 'manualActivity3' || backTo == 'autoActivity'){
		  	json.backflag = "1";
		}
		else if(backTo == 'manualActivity' || backTo == 'manualActivity1' || backTo == 'manualActivity13')
		{
		  json.omIntendJoin.backflag = "3";
		  if(backTo == 'manualActivity' || backTo == 'manualActivity13'){
  	  		json.omIntendJoin.adminBackFlag = "1";
  		  	json.omIntendJoin.otherBackFlag = "0";
		  }	
		}
		nui.confirm("确定要"+message+"新员工入职流程吗？","操作提示",function (action){
			if(action == "ok"){
				nui.get("appButton").setEnabled(false);
				form_Intend.loading("处理中,请稍后...");
	    		nui.ajax({
	    			url:"com.primeton.eos.ame_permanage.ame_entry.EntryProcessReve.biz.ext",
	    			data: json,
	    			type:"post",
	    			contentType:"text/json",
	    			success:function(action){
	    				action = nui.clone(action);
	    				form_Intend.unmask();
	    				if(action.exception == null){
	    					nui.alert(message+"新员工入职流程成功！","系统提示",function(){
				        		CloseWindow("ok");
			    				nui.get("appButton").setEnabled(true);
				        	});
	    				}else if(action.exception == "fallsendmail"){
				        	nui.alert(message+"新员工入职流程成功！提醒邮件发送失败，请手动发送入职提醒邮件！","系统提示",function(){
				        		CloseWindow("ok");
			    				nui.get("appButton").setEnabled(true);
				        	});
	    				}else{
	    					nui.alert("流程提交失败！","系统提示",function (){
			    				nui.get("appButton").setEnabled(true);
	    					});
	    				}
	    			},
	    			error:function(jqXHR, textStatus, errorThrown){
	    				nui.alert("error:" + jqXHR.responseText);
	    			}
	    		});
			}
		});
	}
	
	//关闭
	function onCancel(e) {
    	var data = form_Intend.getData();
    	if(data){
        	nui.showMessageBox({
	            title: "关闭提示",
	            iconCls: "nui-messagebox-question",
	            buttons: ["yes", "no"],
	            message: "是否关闭？",
	            callback: function (action) {
	                if(action=="yes"){
	                	CloseWindow("cancel");
	                }
	            }
	        });
		}else{
			CloseWindow("cancel");
		}
    }
    function CloseWindow(action){
		if (action == "close" && form_Intend.isChanged()){
			if (confirm("数据被修改了，是否先保存？")){
				return false;
			}
		}
		if (window.CloseOwnerWindow) return window.CloseOwnerWindow(action);
		else window.close();
	}
	
	function setOpinion(){
		var confirmInto = nui.get("confirmInto").getValue();
		if(confirmInto == "true"){
			document.getElementById('opinion').style.display="none";
			document.getElementById('printbutton').style.display="";
			nui.get("auditstatus").setValue("1");
			nui.get("opinion").setValue("同意。");
			nui.get("auditopinion").setValue("同意。");
		}else{
			document.getElementById('opinion').style.display="";
			document.getElementById('printbutton').style.display="none";
			nui.get("auditstatus").setValue("0");
			nui.get("opinion").setValue(null);
			nui.get("auditopinion").setValue(null);
			nui.get("backTo").setValue("manualActivity2");
		}
	}
	
	function setOpinionMessage(){
		var opinion = nui.get("opinion").getValue();
		nui.get("auditopinion").setValue(opinion);
	}
	
	function print(){
		executeUrl = "/default/ame_permanage/ame_entry/printGoal.jsp?workItemID=" + "<%=workItemID %>";
		window.open(executeUrl);
	}
</script>
</html>
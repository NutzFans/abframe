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
  - Date: 2019-07-25 16:24:25
  - Description:
-->
<head>
<title>试用期目标设定/审核</title>
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
			<legend>新员工基本信息</legend>
			<div style="padding:5px;">
				<table style="table-layout:fixed;" id="table_intend1">	
					<tr>
						<td align="right" style="width:130px">姓名：</td>
						<td name="omIntendJoin.intendname" class = "asLabel" id="intendname" style="width:190px"></td>
						<td align="right" style="width:130px">员工工号：</td>
						<td name="omIntendJoin.empcode" class = "asLabel" id="empcode" style="width:190px"></td>
						<td align="right" style="width:130px">学历：</td>
						<td name="omIntendJoin.education" class = "asLabel" id="education" style="width:190px"></td>
					</tr>
					<tr>
						<td align="right" style="width:130px">员工属性：</td>
						<td name="omIntendJoin.intendpositiontype" class = "asLabel" id="intendpositiontype" style="width:190px"></td>
						<td align="right" style="width:130px">人员性质：</td>
						<td name="omIntendJoin.intendjobtype" class = "asLabel" id="intendjobtype" style="width:190px"></td>
						<td align="right" style="width:130px">参加工作年月：</td>
						<td name="omIntendJoin.worktime" class = "asLabel" id="worktime" style="width:190px"></td>
					</tr>
					<tr>
						<td align="right" style="width:130px">所属部门：</td>
						<td name="omIntendJoin.inorgid" class = "asLabel" id="inorgid" style="width:190px"></td>
						<td align="right" style="width:130px">工作地点：</td>
						<td name="omIntendJoin.intendworkplace" class = "asLabel" id="intendworkplace" style="width:190px"></td>
						<td align="right" style="width:130px">实际入职日期：</td>
						<td name="omIntendJoin.actdate" class = "asLabel" id="actdate" style="width:190px"></td>
					</tr>
					<tr>
						<td align="right" style="width:130px;">学历验证：</td>
	                	<td name="omIntendJoin.eduverify"  class = "asLabel"  id="eduverify" style="width:190px;" ></td>
						<td align="right" style="width:130px">备注：</td>
						<td name="omIntendJoin.remark" class = "asLabel" id="remark" style="width:190px" colspan="3"></td>
					</tr>
				</table>
			</div>
		</fieldset>
		<fieldset id="field2" style="border:solid 1px #aaa;padding:3px;">
			<legend>试用期考核信息</legend>
			<div style="padding:5px;">
				<input name="omIntendJoin.intendid" id="intendid"  class="nui-hidden"/>
				<input name="omIntendJoin.processinstid" id="processinstid2"  class="nui-hidden"/>
				<input name="omIntendJoin.fileids" id="fileids" class="nui-hidden"/>
				<input name="omIntendJoin.intendname" class="nui-hidden"/>
				<input class="nui-hidden" id="workItemID" value="<%=workItemID %>"/>
				<table style="table-layout:fixed;" id="table_entry1">
					<tr>
						<td align="right" style="width:130px;">职位分类:</td>
                		<td style="width:190px;" align="left">    
                    		<input name="omIntendJoin.position" id="position" class="nui-dictcombobox" shownullItem="true" allowInput="true" dictTypeId="AME_POSITION_MEMO"  width="100%" required="true"/>
                		</td>
                		<td align="right" style="width:80px;">职位名称：</td>
                		<td style="width:190px;" align="left">  
                    		<input name="omIntendJoin.positionname" id="positionname" class="nui-textbox"   width="100%" required="true"/>
                		</td>
                		<td align="right" style="width:130px;">直属主管:</td>
                		<td style="width:190px;" align="left">    
                    		<input name="omIntendJoin.managerid" id="managerid" class="mini-textboxlist" allowInput="false" textField="EMPNAME" valueField="USERID" searchField="name"  url="com.primeton.eos.ame_common.ame_common.queryAllEmpByName.biz.ext"  width="100%" required="true" value="" text="" readOnly="readOnly"/>
                		</td>
					</tr>
					<tr>
					    <td align="right" style="width:130px;">入职导师:</td>
                		<td style="width:190px;" align="left">    
                    		<input name="omIntendJoin.tutorid" id="tutorid" class="mini-textboxlist" allowInput="true" textField="EMPNAME" valueField="USERID" searchField="name"  url="com.primeton.eos.ame_common.ame_common.queryAllEmpByName.biz.ext"  width="100%" required="true"/>
                		</td>
	                	<td align="right" style="width:130px;">试用期开始时间:</td>
						<td style="width:190px;" align="left"> 
							<input class="nui-datepicker" name="omIntendJoin.probationstartdate" id="probationstartdate" style="width:100%" required="true" onvaluechanged="getDateNexThirdMonth('probationstartdate','probation','probationenddate')" readOnly="readOnly"/>
						</td>
						<td align="right" style="width:130px;">试用期期限(月):</td>
						<td style="width:190px;" align="left">
							<input name="omIntendJoin.probation"  id="probation" class="nui-textbox"  onvaluechanged="getDateNexThirdMonth('probationstartdate','probation','probationenddate')" required="true" style="width:100%;" onblur="validate('probation')" value="3" inputStyle="text-align: right;" readOnly="readOnly"/>
						</td>
	                </tr>
					<tr>
					    <td align="right" style="width:130px;">试用期结束时间:</td>
						<td style="width:190px;" align="left"> 
							<input class="nui-datepicker" name="omIntendJoin.probationenddate" id="probationenddate" style="width:100%" required="true" readOnly="readOnly"/>
						</td>
						<td align="right" style="width:150px;" colspan="2"><span style="color: red">提醒：试用期如需修改，请联系人事。</span></td>
					</tr>
					<tr>
						<td align="right" style="width:130px;">试用期工作职责:</td>
						<td style="width:190px;" align="left"  colspan="5"> 
							<input name="omIntendJoin.responsibility" id="responsibility" class="nui-textarea"  width="100%" required="true"/>
						</td>
					</tr>
				</table>
			</div>
		</fieldset>
		
		<fieldset id="field6" style="border:solid 1px #aaa;padding:3px;">
			<div><span style="color: red">提醒：“工作阶段划分”权重之和 + “综合素质”权重之和 = 100%，各个阶段目标权重之和 = 100%，总分 = 各考核项目评分乘以权重之和。</span></div>
			<legend>考核目标设定</legend>
			<fieldset id="field3" style="border:solid 1px #aaa;padding:3px;">
				<legend>一、工作阶段划分</legend>
				<table  id="goaltable1" style="table-layout:fixed;border-collapse:collapse" bordercolor="#A8A8A8" border="1" cellspacing="0" cellpadding="1">
					<tr>
						<a class="nui-button" onclick="addgoal()">增加考核阶段</a>
					</tr>
				</table>
			</fieldset>
			<fieldset id="field7" style="border:solid 1px #aaa;padding:3px;">
				<legend>二、综合素质</legend>
				<table  id="goaltable_SZ" style="table-layout:fixed;border-collapse:collapse" bordercolor="#A8A8A8" border="1" cellspacing="0" cellpadding="1">
					<tr>
						<a class="nui-button" onclick="addgoal_SZ()">增加综合素质</a>
					</tr>
				</table>
			</fieldset>
		</fieldset>
	</form>
	
	<fieldset id="field4" style="border:solid 1px #aaa;padding:3px;">
		<legend>入职附件</legend>
		<jsp:include page="/ame_common/detailFile.jsp"/>
	</fieldset>
	
    <!-- 审核意见  -->
	<jsp:include page="/ame_common/misOpinion.jsp"/>
	<fieldset id="field5" style="border:solid 1px #aaa;padding:3px;">
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
	var x =[];var x1 = [];//动态生成目标
	
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
            		document.getElementById("education").innerHTML = o.omIntendJoin.education == null ?"":nui.getDictText('DEGREE',o.omIntendJoin.education);
            		document.getElementById("intendpositiontype").innerHTML = o.omIntendJoin.intendpositiontype == null ?"":nui.getDictText('EMP_TYPE',o.omIntendJoin.intendpositiontype);
            		document.getElementById("intendjobtype").innerHTML = o.omIntendJoin.intendjobtype == null ?"":nui.getDictText('AME_EMPTYPE2',o.omIntendJoin.intendjobtype);
            		document.getElementById("worktime").innerHTML = o.omIntendJoin.worktime == null ?"":o.omIntendJoin.worktime;
            		document.getElementById("remark").innerHTML = o.omIntendJoin.remark == null ?"":o.omIntendJoin.remark;
            		document.getElementById("intendworkplace").innerHTML = o.omIntendJoin.intendworkplace == null ?"":nui.getDictText('AREA4CLRY',o.omIntendJoin.intendworkplace);
            		document.getElementById("actdate").innerHTML = o.omIntendJoin.actdate == null ?"":o.omIntendJoin.actdate;
            		document.getElementById("inorgid").innerHTML = o.omIntendJoin.inorgname == null ?"":o.omIntendJoin.inorgname;
            		document.getElementById("eduverify").innerHTML = o.omIntendJoin.eduverify == null ?"":nui.getDictText('EDUVERIFY',o.omIntendJoin.eduverify);
            		
            		form_Intend.setData(o);
            		//设置直属主管
            		nui.get("managerid").setText(o.omIntendJoin.managername);
            		nui.get("managerid").setValue(o.omIntendJoin.managerid);
            		
            		//设置入职导师
            		nui.get("tutorid").setText(o.omIntendJoin.tutorname);
            		nui.get("tutorid").setValue(o.omIntendJoin.tutorid);
            		
            		//加载已有的工作目标
            		if(o.omIntendPeriod.length >0){
            			for(var i=0;i<o.omIntendPeriod.length;i++){
            				y++;
            				z++;
    						x.push(0);
    						x1.push(0);
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
							var oCell1_7=aRows[myNewRow.rowIndex].insertCell(aCells.length);
							var oCell1_71=aRows[myNewRow.rowIndex].insertCell(aCells.length);
							var oCell1_8=aRows[myNewRow.rowIndex].insertCell(aCells.length);
							
							var tempName=y;
							var tempID ="omIntendGoals"+y;
							var tempID2='"'+tempID+'"';
							var name = "omIntendGoals["+(y-1)+"]";
							//var html=myTable.innerHTML+'<tr>';
							//设置网格html
							oCell1_1.innerHTML = "考核阶段:";
							oCell1_2.innerHTML = "<input class='nui-textbox' name='"+name+".goalname' id='goalname"+y+"' width='100%' required='true' value='阶段"+z+"'/>";
							oCell1_3.innerHTML = "考核区间:";
							oCell1_4.innerHTML = "<input class='nui-datepicker' name='"+name+".goalstartdate' id='goalstartdate"+y+"' style='width:30%' required='true'/>至<input class='nui-datepicker' name='"+name+".goalenddate' id='goalenddate"+y+"' style='width:30%' required='true'/>";
							oCell1_5.innerHTML = "考核权重:";
							oCell1_6.innerHTML = "<input class='nui-spinner' name='"+name+".weight' id='weight"+y+"'  style='width:30%' required='true' format='n2' showbutton='false' changeOnMousewheel='false' minValue='0' maxValue='100'/>%";
							oCell1_7.innerHTML = "<input type='button' onclick='addscore(this,"+y+");'value='添加目标'/>";
							oCell1_71.innerHTML = "<input type='button' onclick='deleteGoal(1,this,"+y+");'value='阶段删除' style='width:100%'/>";
							oCell1_8.innerHTML = "<input class='nui-hidden' name='"+name+".checktype' id='checktype"+y+"' value='0'/>" + "<input class='nui-hidden' name='"+name+".goalid' id='goalid"+y+"'/>";
							oCell1_4.style.width	= "380px";
							oCell1_4.colSpan='3';
							oCell1_8.style.display="none";
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
									(x1[(index-1)])++;
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
									var oCell1_771=aRows[myNewRow.rowIndex].insertCell(aCells.length);
									
									oCell1_11.innerHTML = "";
							    	oCell1_22.innerHTML = "";
							    	oCell1_33.innerHTML = "目标"+(x[(index-1)])+":";
							    	oCell1_44.innerHTML = "<input class='nui-textarea' name='"+name+".scorename' id='scorename"+(x[(index-1)])+"' width='100%' required='true'/>";
							    	oCell1_331.innerHTML = "考核达标结果:";
							    	oCell1_441.innerHTML = "<input class='nui-textarea' name='"+name+".aimscore' id='aimscore"+(x[(index-1)])+"' width='100%' required='true'/>";
							    	oCell1_55.innerHTML = "目标权重:";
							    	oCell1_66.innerHTML = "<input class='nui-spinner' name='"+name+".weight' id='scoreweight"+(x[(index-1)])+"'  style='width:30%' required='true' format='n2' showbutton='false' changeOnMousewheel='false' minValue='0' maxValue='100'/>%";
							    	oCell1_771.innerHTML = "<input class='nui-hidden' name='"+name+".scoreid' id='"+name+".scoreid"+(x[(index-1)])+"'/>";
							    	oCell1_77.innerHTML = "<input type='button' onclick='deleteScore(this,"+index+","+(x[(index-1)])+");'value='删除目标' style='width:100%'/>";
    								oCell1_44.style.width	= "190px";
    								oCell1_441.style.width	= "190px";
    								oCell1_771.style.display = "none";
    								nui.parse();
							    	nui.get("scorename"+(x[(index-1)])).setValue(o.omIntendPeriod[i].omIntendScores[j].scorename);
							    	nui.get("aimscore"+(x[(index-1)])).setValue(o.omIntendPeriod[i].omIntendScores[j].aimscore);
							    	nui.get("scoreweight"+(x[(index-1)])).setValue((o.omIntendPeriod[i].omIntendScores[j].weight*100));
							    	nui.get(name+".scoreid"+(x[(index-1)])).setValue((o.omIntendPeriod[i].omIntendScores[j].scoreid));
							    	oCell1_33.style.backgroundColor = '#FFF68F';
							    	oCell1_55.style.backgroundColor = '#FFF68F';
							    	oCell1_77.style.backgroundColor = '#FFF68F';
								}
							}		
            			}
            		}else{
            			//考核阶段不存在情况下缺省
            			addgoal();
            		}
            		//加载综合素质默认值
            		if(o.omIntendQuality.length >0){
            			for(var i=0;i<o.omIntendQuality.length;i++){
            				y++;
    						x.push(0);
    						x1.push(0);
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
							var oCell1_71=aRows[myNewRow.rowIndex].insertCell(aCells.length);
							var tempName=y;
							var tempID ="omIntendGoals"+y;
							var tempID2='"'+tempID+'"';
							var name = "omIntendGoals["+(y-1)+"]";
							
							//设置网格html
							oCell1_1.innerHTML = "综合素质:";
							oCell1_2.innerHTML = "<input class='nui-textbox' name='"+name+".goalname' id='goalname"+y+"' width='100%' required='true'/>";
							oCell1_3.innerHTML = "达标结果:";
							oCell1_4.innerHTML = "<input class='nui-textarea' name='"+name+".scorename' id='scorename"+y+"' style='width:100%' required='true'/>";
							oCell1_5.innerHTML = "考核权重:";
							oCell1_6.innerHTML = "<input class='nui-spinner' name='"+name+".weight' id='weight"+y+"'  style='width:30%' required='true' format='n2' showbutton='false' changeOnMousewheel='false' minValue='0' maxValue='100'/>%";
							oCell1_7.innerHTML = "<input class='nui-hidden' name='"+name+".checktype' id='checktype"+y+"' value='1'/>" + "<input class='nui-hidden' name='"+name+".goalid' id='goalid"+y+"'/>";
							oCell1_71.innerHTML = "<input type='button' onclick='deleteGoal(2,this,"+y+");'value='综合素质删除' style='width:100%'/>";
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
  	
    var z = 0;//阶段结束
    function addgoal(){
    	y++;
    	z++;
    	x.push(0);
    	x1.push(0);
		var myTable = document.getElementById('goaltable1');
		//向表格中增加一行
		var myNewRow = myTable.insertRow(myTable.rows.length);//取得表格的总行数
		var aRows=myTable.rows;
		//取得表格的总网格数
		var aCells=myNewRow.cells;
		//向新增行中增加8个网格
		var oCell1_1=aRows[myNewRow.rowIndex].insertCell(aCells.length);
		var oCell1_2=aRows[myNewRow.rowIndex].insertCell(aCells.length);
		var oCell1_3=aRows[myNewRow.rowIndex].insertCell(aCells.length);
		var oCell1_4=aRows[myNewRow.rowIndex].insertCell(aCells.length);
		var oCell1_5=aRows[myNewRow.rowIndex].insertCell(aCells.length);
		var oCell1_6=aRows[myNewRow.rowIndex].insertCell(aCells.length);
		var oCell1_7=aRows[myNewRow.rowIndex].insertCell(aCells.length);
		var oCell1_71=aRows[myNewRow.rowIndex].insertCell(aCells.length);
		var oCell1_8=aRows[myNewRow.rowIndex].insertCell(aCells.length);
		
		var tempName=y;
		var tempID ="omIntendGoals"+y;
		var tempID2='"'+tempID+'"';
		var name = "omIntendGoals["+(y-1)+"]";
		//var html=myTable.innerHTML+'<tr>';
		//设置网格html
		oCell1_1.innerHTML = "考核阶段:";
		oCell1_2.innerHTML = "<input class='nui-textbox' name='"+name+".goalname' id='goalname"+y+"' width='100%' required='true' value='阶段"+z+"'/>";
		oCell1_3.innerHTML = "考核区间:";
		oCell1_4.innerHTML = "<input class='nui-datepicker' name='"+name+".goalstartdate' id='goalstartdate"+y+"' style='width:30%' required='true'/>至<input class='nui-datepicker' name='"+name+".goalenddate' id='goalenddate"+y+"' style='width:30%' required='true'/>";
		oCell1_5.innerHTML = "考核权重:";
		oCell1_6.innerHTML = "<input class='nui-spinner' name='"+name+".weight' id='weight"+y+"'  style='width:30%' required='true' format='n2' showbutton='false' changeOnMousewheel='false' minValue='0' maxValue='100'/>%";
		oCell1_7.innerHTML = "<input type='button' onclick='addscore(this,"+y+");'value='添加目标' style='width:100%'/>";
		oCell1_71.innerHTML = "<input type='button' onclick='deleteGoal(1,this,"+y+");'value='阶段删除' style='width:100%'/>";
		oCell1_8.innerHTML = "<input class='nui-hidden' name='"+name+".checktype' id='checktype"+y+"' value='0'/>";
		oCell1_4.style.width	= "380px";
		oCell1_4.colSpan='3';
		oCell1_8.style.display="none";
    	nui.parse();
    }
    
    //动态生成综合素质表单
    function addgoal_SZ(){
    	y++;
		x.push(0);
    	x1.push(0);
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
		var oCell1_71=aRows[myNewRow.rowIndex].insertCell(aCells.length);
		var tempName=y;
		var tempID ="omIntendGoals"+y;
		var tempID2='"'+tempID+'"';
		var name = "omIntendGoals["+(y-1)+"]";
		
		//设置网格html
		oCell1_1.innerHTML = "综合素质:";
		oCell1_2.innerHTML = "<input class='nui-textbox' name='"+name+".goalname' id='goalname"+y+"' width='100%' required='true' />";
		oCell1_3.innerHTML = "达标结果:";
		oCell1_4.innerHTML = "<input class='nui-textarea' name='"+name+".scorename' id='scorename"+y+"' style='width:100%' required='true'/>";
		oCell1_5.innerHTML = "考核权重:";
		oCell1_6.innerHTML = "<input class='nui-spinner' name='"+name+".weight' id='weight"+y+"'  style='width:30%' required='true' format='n2' showbutton='false' changeOnMousewheel='false' minValue='0' maxValue='100'/>%";
		oCell1_7.innerHTML = "<input class='nui-hidden' name='"+name+".checktype' id='checktype"+y+"' value='1'/>";
		oCell1_71.innerHTML = "<input type='button' onclick='deleteGoal(2,this,"+y+");'value='综合素质删除' style='width:100%'/>";
		oCell1_4.style.width	= "380px";
		oCell1_7.style.display = "none";
    	nui.parse();
    }
    
    
    //删除阶段与综合素质
    function deleteGoal(name,obj,index){
		goaltable = ""
		if(name == "1"){
			goaltable = "goaltable1";
		}else if (name == "2"){
			goaltable = "goaltable_SZ";
		}
		var myTable = document.getElementById(goaltable);
		
    	if(nui.get("goalid"+index) && nui.get("goalid"+index).getValue() != "" && nui.get("goalid"+index).getValue() != null){
    		nui.confirm("该考核项已存入后台，确认永久性删除么？","操作提示",function (action){
    			if(action == "ok"){
					form_Intend.loading("处理中,请稍后...");
    				var goalid = nui.get("goalid"+index).getValue();
    				var json = {"goalid":goalid};
    				nui.ajax({
		    			url:"com.primeton.eos.ame_permanage.ame_entry.deleteGoal.biz.ext",
		    			data: json,
		    			type:"post",
		    			contentType:"text/json",
		    			success:function(action){
	    					form_Intend.unmask();
		    				if(action.result == '1'){
		    					nui.alert("删除成功！");
		    					//目标删除
								for (var i=0;i<x1[(index-1)];i++){
									myTable.deleteRow(obj.parentElement.parentElement.rowIndex+1);
								}
								x1[(index-1)]=0;
								//阶段表删除一行
								var myNewRow = myTable.deleteRow(obj.parentElement.parentElement.rowIndex);
		    				}else{
		    					nui.alert("删除失败！");
		    				}
		    			},
		    			error:function(jqXHR, textStatus, errorThrown){
	    					form_Intend.unmask();
		    				nui.alert("error:" + jqXHR.responseText);
		    			}
		    		});
    			}
    		});
    	}else{
    		//目标删除
			for (var i=0;i<x1[(index-1)];i++){
				myTable.deleteRow(obj.parentElement.parentElement.rowIndex+1);
			}
			x1[(index-1)]=0;
			//阶段表删除一行
			var myNewRow = myTable.deleteRow(obj.parentElement.parentElement.rowIndex);
    	}
    }
    
    function addscore(obj,index){
    	var myTable = document.getElementById('goaltable1');
		//向表格中增加一行
    	(x[(index-1)])++;
    	(x1[(index-1)])++;
    	var name = "omIntendGoals["+(index-1)+"].omIntendScores["+((x[(index-1)])-1)+"]";
    	//插入一行
    	var myNewRow = myTable.insertRow((obj.parentElement.parentElement.rowIndex)+1+((x1[(index-1)])-1));//取得表格的总行数
    	var aRows=myTable.rows;
		//取得表格的总网格数
		var aCells=myNewRow.cells;
		//向新增行中增加7个网格
		var oCell1_1=aRows[myNewRow.rowIndex].insertCell(aCells.length);
		var oCell1_2=aRows[myNewRow.rowIndex].insertCell(aCells.length);
		var oCell1_3=aRows[myNewRow.rowIndex].insertCell(aCells.length);
		var oCell1_4=aRows[myNewRow.rowIndex].insertCell(aCells.length);
		var oCell1_33=aRows[myNewRow.rowIndex].insertCell(aCells.length);
		var oCell1_44=aRows[myNewRow.rowIndex].insertCell(aCells.length);
		var oCell1_5=aRows[myNewRow.rowIndex].insertCell(aCells.length);
		var oCell1_6=aRows[myNewRow.rowIndex].insertCell(aCells.length);
		var oCell1_7=aRows[myNewRow.rowIndex].insertCell(aCells.length);
		var oCell1_71=aRows[myNewRow.rowIndex].insertCell(aCells.length);
		
    	oCell1_1.innerHTML = "";
    	oCell1_2.innerHTML = "";
    	oCell1_3.innerHTML = "目标"+(x[(index-1)])+":";
    	oCell1_4.innerHTML = "<input class='nui-textarea' name='"+name+".scorename' id='scorename"+(x[(index-1)])+"' width='100%' required='true'/>";
    	oCell1_33.innerHTML = "考核达标结果:";
    	oCell1_44.innerHTML = "<input class='nui-textarea' name='"+name+".aimscore' id='aimscore"+(x[(index-1)])+"' width='100%' required='true'/>";
    	oCell1_5.innerHTML = "目标权重:";
    	oCell1_6.innerHTML = "<input class='nui-spinner' name='"+name+".weight' id='scoreweight"+(x[(index-1)])+"'  style='width:30%' required='true' format='n2' showbutton='false' changeOnMousewheel='false' minValue='0' maxValue='100'/>%";
    	oCell1_7.innerHTML = "<input type='button' onclick='deleteScore(this,"+index+","+(x[(index-1)])+");'value='删除目标' style='width:100%'/>";
    	oCell1_71.innerHTML = "";
    	oCell1_4.style.width	= "190px";
    	oCell1_44.style.width	= "190px";
    	nui.parse();
    	oCell1_3.style.backgroundColor = '#FFF68F';
    	oCell1_5.style.backgroundColor = '#FFF68F';
    	oCell1_7.style.backgroundColor = '#FFF68F';
    }
    //删除目标
    function deleteScore(obj,index,num){
    	var name = "omIntendGoals["+(index-1)+"].omIntendScores["+(num-1)+"]"+".scoreid"+num;
    	var myTable = document.getElementById("goaltable1");
    	if(nui.get(name) && nui.get(name).getValue() != "" && nui.get(name).getValue() != null){
    		nui.confirm("该考核目标已存入后台，确认永久性删除么？","操作提示",function (action){
    			if(action == "ok"){
					form_Intend.loading("处理中,请稍后...");
    				var scoreid = nui.get(name).getValue();
    				var json = {"scoreid":scoreid};
    				nui.ajax({
		    			url:"com.primeton.eos.ame_permanage.ame_entry.deleteScore.biz.ext",
		    			data: json,
		    			type:"post",
		    			contentType:"text/json",
		    			success:function(action){
	    					form_Intend.unmask();
		    				if(action.result == '1'){
		    					nui.alert("删除成功！");
								//目标删除一行
								var myNewRow = myTable.deleteRow(obj.parentElement.parentElement.rowIndex);
								x1[(index-1)]--;
		    				}else{
		    					nui.alert("删除失败！");
		    				}
		    			},
		    			error:function(jqXHR, textStatus, errorThrown){
	    					form_Intend.unmask();
		    				nui.alert("error:" + jqXHR.responseText);
		    			}
		    		});
    			}
    		});
    	}else{
			//目标删除一行
			var myNewRow = myTable.deleteRow(obj.parentElement.parentElement.rowIndex);
			x1[(index-1)]--;
    	}
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
    	var tutor = nui.get("tutorid").getValue();
    	if(tutor.indexOf(",")!=-1){
    		nui.alert("入职导师唯一！");
			return false;
    	}
    	var omIntendGoals = form_Intend.getData().omIntendGoals ;
    	var weightall = 0;
    	var isperiod = 0;
		for(var i=0;i<omIntendGoals.length;i++){
			if(nui.encode(omIntendGoals[i]) != "{}"){
				if(omIntendGoals[i].weight == 0){
					nui.alert("考核权重不能为零！");
					return;
				}
				weightall = weightall + omIntendGoals[i].weight;
				if(omIntendGoals[i].checktype == 0 ){
					isperiod = 1;
				}
				if((!omIntendGoals[i].omIntendScores) && omIntendGoals[i].checktype == 0){
					nui.alert("考核阶段必须添加考核目标！");
					return;
				}
				var weightScor = 0;
				if (omIntendGoals[i].omIntendScores){
					for(var j=0;j<omIntendGoals[i].omIntendScores.length;j++){
						if(nui.encode(omIntendGoals[i].omIntendScores[j]) != "{}"){
							if(omIntendGoals[i].omIntendScores[j].weight == 0){
								nui.alert("目标权重不能为零！");
								return;
							}
							weightScor = weightScor + omIntendGoals[i].omIntendScores[j].weight;
						}
					}
					if(weightScor != 100 && omIntendGoals[i].omIntendScores.length>0){
						nui.alert("每一个考核阶段内的目标权重之和要等于100%！");
						return;
					}
				}
			}
		}
		if(weightall != 100){
			nui.alert("“工作阶段划分”权重之和 + “综合素质”权重之和要等于100%！");
			return;
		}
		if(isperiod != 1){
			nui.alert("考核目标设定的工作阶段划分必须添加！");
			return;
		}
		var auditstatus = nui.get("auditstatus").getValue();
    	if(!form_Intend.validate() && auditstatus!="2"){
			nui.alert("信息录入不完整!");
			return;
		}else{
    		document.getElementById("fileCatalog").value="omIntendJoin";
    		form2.submit();
		}
	}
	
	function SaveData(){
		var json = form_Intend.getData();
		var message = "提交";
		//发起页面的处理信息
		var opioionformData = opioionform.getData();
		json.misOpinion = opioionformData.misOpinion;
		var intendpositiontypename = document.getElementById("intendpositiontype").innerHTML;
		json.omIntendJoin.intendpositiontypename  = intendpositiontypename;
		
		json.omIntendJoin.intendname = document.getElementById("intendname").innerHTML;
		
		var backTo = nui.get("backTo").getValue();
		//回退信息
		if(backTo == 'manualActivity13' || backTo == 'manualActivity'){
		  	json.omIntendJoin.adminBackFlag = "1";
  			json.omIntendJoin.otherBackFlag = "0";	
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
	//检查是否为数字
	function validate(e){  
	     var reg = new RegExp("^[0-9]*[1-9][0-9]*$");  
	     var obj = nui.get(e).getValue();
	     if(!reg.test(obj)){  
	     	alert("请输入数字!");
	     	nui.get(e).setValue("");    
	     }  
     }
     
     //自动计算试用期结束日期
	function getDateNexThirdMonth(start,term,end){
		veristart = nui.get(start).getValue()
		veritime = nui.get(term).getValue();
		if(veritime == null || veritime == ''){
			veritime = 3;
		}
		if(term == "laborterm"){
			veritime = veritime * 12;
		}
		if(veristart != null && veristart != ''){
			var json = ({"actdate":veristart,"month":veritime});
			nui.ajax({
	            url: "com.primeton.eos.ame_permanage.ame_entry.getNextMonth.biz.ext",
				type: 'POST',
				data: json,	
	            async:false,
				contentType: 'text/json',
	            success: function (o) {
	            	if(term == "laborterm"){
	            		var enddate = new Date(o.probationenddate);
						if(enddate.getDate() <= 15){
							enddate = new Date(enddate.getFullYear(),enddate.getMonth(),15);
						}else{
							enddate = new Date(enddate.getFullYear(),enddate.getMonth()+1,0);
						}
	            		nui.get(end).setValue(enddate);
	            	}else{
	            		nui.get(end).setValue(o.probationenddate);	
	            	}
	            }
	        });
		}
	}
</script>
</html>
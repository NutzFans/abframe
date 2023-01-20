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
  - Date: 2020-03-17 17:47:55
  - Description:
-->
<head>
<title>HR确认</title>
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
	<form id="form1" method="post">
		<fieldset id="field1" style="border:solid 1px #aaa;padding:3px;">
			<legend>试用期转正评价</legend>
			<div style="padding:5px;">
				<input name="emp.empid" id="empid"  class="nui-hidden"/>
				<input name="emp.userid" id="userid"  class="nui-hidden"/>
				<input name="emp.verirestatue2" id="verirestatue2"  class="nui-hidden"/>
				<input name="ver.processinstid" id="processinstid"  class="nui-hidden"/>
				<input name="ver.empveriid" id="empveriid"  class="nui-hidden"/>
				<table style="table-layout:fixed;" >	
					<tr>
						<td align="right" style="width:130px">姓名：</td>
						<td name="emp.empname" class = "asLabel" id="empname" style="width:190px"></td>
						<td align="right" style="width:130px">员工工号：</td>
						<td name="emp.empcode" class = "asLabel" id="empcode" style="width:190px"></td>
						<td align="right" style="width:130px">所属部门：</td>
						<td name="emp.orgname" class = "asLabel" id="orgname" style="width:190px"></td>
					</tr>
					<tr>
						<td align="right" style="width:130px">职位：</td>
						<td name="emp.positionname" class = "asLabel" id="positionname" style="width:190px"></td>
						<td align="right" style="width:130px">直属主管：</td>
						<td name="emp.majorname" class = "asLabel" id="majorname" style="width:190px"></td>
						<td align="right" style="width:130px">入职导师：</td>
						<td class = "asLabel" style="width:190px">
							<input name="emp.mentor" id="mentor" class="mini-textboxlist" allowInput="true" textField="EMPNAME" valueField="USERID" searchField="name"  url="com.primeton.eos.ame_common.ame_common.queryAllEmpByName.biz.ext"  width="100%" required="true" onvaluechanged="changeAgent"/>
						</td>
					</tr>
					<tr>
						<td align="right" style="width:130px">试用期时间：</td>
						<td name="ver.veristart" class = "asLabel" id="veristart" style="width:190px"></td>
						<td align="right" style="width:130px">学历验证：</td>
						<td name="ver.eduverify" class = "asLabel" id="eduverify" style="width:190px"></td>
					</tr>
				</table>
				<table style="table-layout:fixed;border-collapse:collapse;width:90%" bordercolor="#A8A8A8" border="1" align="center">	
					<tr>
						<td class = "asLabel" colspan="6" align="left" style="font-weight:bold;width:160px">
							一、试用期反馈：评分标准（100分制）
						</td>
					</tr>
					<tr>
						<td align="center" style="width:160px">程度</td>
						<td align="center" style="width:160px">优异/突出</td>
						<td align="center" style="width:160px">优秀</td>
						<td align="center" style="width:160px">良好</td>
						<td align="center" style="width:160px">一般</td>
						<td align="center" style="width:160px">差</td>
					</tr>
					<tr>
						<td align="center" style="width:160px">分值</td>
						<td align="center" style="width:160px">90-100</td>
						<td align="center" style="width:160px">80-90</td>
						<td align="center" style="width:160px">70-80</td>
						<td align="center" style="width:160px">60-70</td>
						<td align="center" style="width:160px">60以下</td>
					</tr>
				</table>
				<table id="goaltable" style="table-layout:fixed;border-collapse:collapse;word-wrap:break-word;;width:90%" bordercolor="#A8A8A8" border="1" align="center">	
					<colgroup>
					    <col style="width:6%"></col>
					    <col style="width:10%"></col>
					    <col style="width:6%"></col>
					    <col style="width:25%"></col>
					    <col style="width:25%"></col>
					    <col style="width:6%"></col>
					    <col style="width:10%"></col>
					    <col style="width:10%"></col>
				  	</colgroup>
					<tr>
						<td class = "asLabel" colspan="8" align="left" style="font-weight:bold;width:160px">
							二、试用期目标评分
						</td>
					</tr>
					<tr>
						<td align="center" style="width:80px">考核维度</td>
						<td align="center" style="width:160px">考核阶段</td>
						<td align="center" style="width:60px">权重</td>
						<td align="center" style="width:250px">考核目标</td>
						<td align="center" style="width:250px">考核达标结果(达标分数>=60)</td>
						<td align="center" style="width:60px">细项权重</td>
						<td align="center" style="width:100px">自评分(百分制)</td>
						<td align="center" style="width:100px">导师评分(百分制)</td>
					</tr>
					<tr>
						<td align="center" colspan="6" style="font-weight:bold;">
						总分=各考核项目评分乘以权重之和</td>
						<td align="center" style="width:100px;font-weight:bold;" id="sumgrade1"></td>
						<td align="center" style="width:100px;font-weight:bold;" id="sumgrade"></td>
					</tr>
					<tr>
						<td align="left" colspan="8">
							<span class = "asLabel" style="font-weight:bold;">
								三、新员工线上培训
							</span><br/>
							<span>考试结果：</span>
							<span id="testresult"></span>
						</td>
					</tr>
					
					<tr>
						<td class = "asLabel" colspan="8" align="left" style="font-weight:bold;width:160px">
							四、员工试用期总体评价
						</td>
					</tr>
					<tr>
						<td align="left" colspan="8" name="ver.veriregoal" id="veriregoal">
							<%--<input name="ver.veriregoal" id="veriregoal" class="nui-textarea" style = "width: 100%;height:100px" maxLength="200" required="true">--%>
						</td>
					</tr>
				</table>
			</div>
		</fieldset>
		<fieldset id="field1" style="border:solid 1px #aaa;padding:3px;display:true">
			<legend>转正意见</legend>
			<span style="color:red;;left:65px; display:block;position:relative;width:950px;" align="left">
				说明：试用期考核评估分数达到60分以上（含），将视作符合新员工录用条件之一。对于学历验证状态是“民教网已验证”、“2000年前学历无法验证”和“非正常学历，转正需注意”的员工，请务必关注其能力是否与岗位要求相匹配，请慎重评估。
			</span>
			<div style="padding:5px;">
				<table style="table-layout:fixed;" >
					<tr>
						<td align="right" style="width:200px">是否同意转正：</td>
						<td  style="width:120px">
							<input name="ver.verirestatue" id="verirestatue" class="nui-dictcombobox" dictTypeId="VERI_STATUS" width="100%" required="true" shownullItem="false" onvaluechanged='changeappraisestatus'/>
							<input class="nui-hidden" name="ver.veriresult" id="veriresult"/>
						</td>
						<td  style="width:250px">
							<table style="display:none;" id="showturn">
								<tr>
									<td align="right" id="setoldDate"></td>
								</tr>
		                	</table>
		                	<table style="display:none;" id="showturn1">
								<tr>
									<td align="right">提前至
										<input name="ver.shoulddate" id="shoulddate" class="nui-datepicker" required="true" style="width: 100px;" ondrawdate="checkDate"/>
										成为正式员工
									</td>
								</tr>
		                	</table>
						</td>
					</tr>
				</table>
			</div>
		</fieldset>
		<fieldset style="border:solid 1px #aaa;padding:3px;display:true">
			<legend>转正审批意见</legend>
			<div id="omAppraises" class="nui-datagrid" style="width:100%;height:auto;" dataField="omAppraises" showPager="false" onrowclick="rowclick"
				allowCellEdit="true" allowCellSelect="true" multiSelect="true" editNextOnEnterKey="true" url="com.primeton.eos.ame_permanage.ame_becomeregulae.getOmAppraises.biz.ext" 
				allowSortColumn="true" allowCellWrap="false">
				<div property="columns">
					<input field="appraiseid" class="nui-hidden" visible="false">
					<div field="appraisertype" width="45" headerAlign="center"  align="center" allowSort="true" renderer="getappraisertype">审批人角色</div>
					<div field="appraiser" displayField="appraisername"width="45" headerAlign="center" align="center" >审批人</div>
					<div field="appraisedtae" width="50" headerAlign="center" align="center" allowSort="true" dateFormat="yyyy-MM-dd H:mm:ss">审批时间</div>
					<div field="appraisestatus" width="45" headerAlign="center"  align="center" allowSort="true" renderer="getappraisestatus">审批意见</div>
					<div field="appraise" width="70" headerAlign="center" align="left">转正评价</div>
				</div>
			</div>
		</fieldset>
		<div id="win1" class="nui-window" title="退回" style="width:350px;height:210px;" 
	    showMaxButton="true" showCollapseButton="true" showShadow="true"
	    showToolbar="false" showFooter="true" showModal="false" allowResize="true" allowDrag="true">
			<fieldset style="border:solid 1px #aaa;padding:3px;display:true">
				<legend><span style="color:red;">退回必填</span></legend>
				<div style="padding:5px;">
					<table style="table-layout:fixed;" >	
						<tr>
							<td align="right" style="width:130px">退回到：</td>
							<td>
								<input name="backTo" id="backTo1" class="nui-combobox" valueField="id" textField="name" style="width:200px" required="false" shownullItem="true"/>
							</td>
						</tr>
						<tr>
							<td align="right" style="width:130px">退回意见：</td>
							<td>
								<input name="auditopinion" id="auditopinion1" class="nui-textarea" style="width:200px" required="false" value="退回"/>
							</td>
						</tr>
					</table>
				</div>
			</fieldset>
			<div style="text-align:center;padding:10px;" class="nui-toolbar">
				<a class="nui-button" iconCls="icon-ok" onclick="onOk('0')" style="width:60px;margin-right:20px;">确定</a> 
				<a class="nui-button" onclick="onCancel1()" style="width:60px;margin-right:20px;">取消</a>  
			</div>
		</div>
		
		<fieldset id="field3" style="border:solid 1px #aaa;padding:3px;display:true">
			<legend>流程审批意见</legend>
			<div id="datagrid2" class="nui-datagrid" style="width:100%;height:auto;" dataField="misOpinions"
			    url="com.primeton.eos.ame_pur.purContractProcess.queryAuditOpinions.biz.ext"  idField="id" allowResize="true"
			    allowAlternating="true" multiSelect="true" showPager="false" allowCellWrap="true">
			    <div property="columns">
			    	<div type="indexcolumn" headerAlign="center" width="30" >编号</div>
			        <div field="operatorname" width="50" headerAlign="center" align="center">处理人</div>
			        <div field="workitemname" width="80" align="center" headerAlign="center">处理环节</div>
			        <div field="auditstatus" renderer="onCheckRenderer" width="80" align="center" headerAlign="center">处理结果</div>
			        <div field="auditopinion" width="150" headerAlign="center">处理意见</div>
			        <div field="time" width="100" headerAlign="center" align="center" dateFormat="yyyy-MM-dd HH:mm:ss">处理时间</div>
			        <div field="orgname" width="100" align="center" headerAlign="center">处理人所在机构</div>
			        <div field="files" renderer="onFileRenderer" width="100" hight="100"  align="center" headerAlign="center">附件</div>
			    </div>
			</div>
		</fieldset>
	</form>
	<!-- 审核意见  -->
	<fieldset style="display:none;" >
		<jsp:include page="/ame_common/misOpinion.jsp"/>
	</fieldset>
</div>
<div style="text-align:center;padding:10px;" class="nui-toolbar">
	<a class="nui-button" onclick="onOk('4')" iconCls="icon-ok" style="width:60px;margin-right:10px;" id="appButton">提交</a>
	<a class="nui-button"onclick="onCancel" iconCls="icon-close" style="width:60px;margin-right:10px;">关闭</a>
	<a class="nui-button" onclick="back" iconCls="icon-undo" style="width:60px;margin-right:10px;" id="appButton1">退回</a>
	<a class="nui-button" onclick="onOk('2')" iconCls="icon-remove" style="width:90px;margin-right:10px;display:none;" id="appButton2">终止流程</a>
</div>
</body>
<script type="text/javascript">
	nui.parse();
	var form1 = new nui.Form("form1");
	var omAppraises = nui.get('omAppraises');
	//审核意见的表单
	//var opioionform = new nui.Form("#opioionform");
	
	var y = 0;//动态生成考核表单
	var data = [];
	var sumgrade1 = 0;
	var sumgrade = 0;
	
	initdate();
  	function initdate(){
  		promptInit({workItemID: <%=workItemID %>});//流程提示信息
  		nui.ajax({
            url: "com.primeton.eos.ame_permanage.ame_becomeregulae.getRegularProcess.biz.ext",
            data: {workItemID:<%=workItemID %>,processInstID:null},
            type: 'POST',
			contentType: 'text/json',
            success: function (o) {
            	data = o;
            	if(data.ver){
            		document.getElementById("empname").innerHTML = o.emp.empname == null ?"":o.emp.empname;
            		document.getElementById("empcode").innerHTML = o.emp.empcode == null ?"":o.emp.empcode;
            		document.getElementById("orgname").innerHTML = o.emp.orgname == null ?"":o.emp.orgname;
            		document.getElementById("positionname").innerHTML = o.emp.positionname == null ?"":nui.getDictText('AME_POSITION_MEMO',o.emp.positionname);
            		document.getElementById("majorname").innerHTML = o.emp.majorname == null ?"":o.emp.majorname;
            		document.getElementById("veristart").innerHTML = (o.ver.veristart == null ?"":o.ver.veristart+'至')+(o.ver.veriend == null ?"":o.ver.veriend);
            		//document.getElementById("mentor").innerHTML = o.emp.mentorname == null ?"":o.emp.mentorname;
            		document.getElementById("veriregoal").innerText = o.ver.veriregoal == null ?"":o.ver.veriregoal;
            		document.getElementById("eduverify").innerHTML = (o.emp.eduverify == null ?"":nui.getDictText('EDUVERIFY',o.emp.eduverify));
            		
            		//设置导师
            		nui.get("mentor").setValue(o.emp.mentor);
            		nui.get("mentor").setText(o.emp.mentorname);
            		
            		createappraisaltable(data.omIntendPeriod,'一、工作目标','Period');
            		createappraisaltable(data.omIntendQuality,'二、综合素质','Quality');
            		form1.setData(data);
            		
            		document.getElementById("setoldDate").innerHTML = o.ver.shoulddate == null?"":(o.ver.shoulddate+"成为正式员工");
            		changeappraisestatus();
            		
            		document.getElementById("testresult").innerHTML= o.emp.test == null?"":(o.emp.test == '1'?"通过":"不通过");
            		
            		omAppraises.load({"criteria": {"_expr[0]": { "empveriid": o.ver.empveriid},"_expr[1]": {"_property": "appraisertype","_op": "<>","_value": '0'}}});
					omAppraises.sortBy("appraisedtae", "asc");
            		
            		//审批意见的流程实例ID
					nui.get("processinstid").setValue(o.ver.processinstid);
               		//nui.get("auditstatus").setValue("4");
					nui.get("workitemid").setValue(<%=workItemID %>);
               		nui.get("activitydefid").setValue(o.workitem.activityDefID);
					//流程回退路径赋值 
                	nui.get("backTo").setData(o.ver.backList);
                	nui.get("backTo1").setData(o.ver.backList);
	                //审核结果设置
					var dataStatus = [{"dictID": 1,"dictName": "处理"},{"dictID": 0,"dictName": "退回"}];
					nui.get("auditstatus").setData(dataStatus);
					nui.get("auditstatus").setValue("4");
					nui.get("auditopinion").setValue("处理。");
					var processinstid = o.ver.processinstid;
					var grid = nui.get("datagrid1");
					grid.load({"processInstID": processinstid});
					grid.sortBy("time", "desc");
					
					var grid1 = nui.get("datagrid2");
					grid1.load({"processInstID": processinstid});
					grid1.sortBy("time", "desc");
        		}
    		},
    		 error: function (jqXHR, textStatus, errorThrown) {
                alert(jqXHR.responseText);
            }
		});	
  	}
  	
  	
	function createappraisaltable(omIntendPeriod,name,type){
		if(omIntendPeriod.length>0){
			var allnum = 0;
			
			for(var i=0;i<omIntendPeriod.length;i++){
				var myTable = document.getElementById('goaltable');
				//向表格中增加一行
				
				var myNewRow = myTable.insertRow(myTable.rows.length-4);//取得表格的总行数
				var aRows=myTable.rows;
				//取得表格的总网格数
				var aCells=myNewRow.cells;
				
				if(allnum == 0){
					var oCell1=aRows[myNewRow.rowIndex].insertCell(aCells.length);
					oCell1.id = type;
					oCell1.align="center";
					oCell1.innerHTML=name;
				}
				
				//向新增行中增加网格
				var nownum = 0;
				var name = "appraisaldets["+(i)+"]";
				var oCell1_1=aRows[myNewRow.rowIndex].insertCell(aCells.length);
				oCell1_1.id = "period"+i;
				oCell1_1.align="center";
				if(type == 'Period'){
					oCell1_1.innerHTML = omIntendPeriod[i].goalname+"("+omIntendPeriod[i].goalstartdate+"至"+omIntendPeriod[i].goalenddate+")";
				}else{
					oCell1_1.innerHTML = omIntendPeriod[i].goalname;
				}
				
				var oCell1_2=aRows[myNewRow.rowIndex].insertCell(aCells.length);
				oCell1_2.id = "periodWeight"+i;
				oCell1_2.align="center";
				oCell1_2.innerHTML = (omIntendPeriod[i].weight*100).toFixed(2)+'%';
				
				if(omIntendPeriod[i].omIntendScores){
					for(var j=0;j<omIntendPeriod[i].omIntendScores.length;j++){
						if(j>0){
							//插入一行
					    	var myNewRow = myTable.insertRow(myTable.rows.length-4);
					    	//取得表格的总行数
					    	var aRows=myTable.rows;
						}
						//取得表格的总网格数
						var aCells=myNewRow.cells;//向新增行中增加网格
						var oCell1_11=aRows[myNewRow.rowIndex].insertCell(aCells.length);
						var oCell1_22=aRows[myNewRow.rowIndex].insertCell(aCells.length);
						var oCell1_33=aRows[myNewRow.rowIndex].insertCell(aCells.length);
						var oCell1_55=aRows[myNewRow.rowIndex].insertCell(aCells.length);
						var oCell1_44=aRows[myNewRow.rowIndex].insertCell(aCells.length);
						oCell1_11.align="left";
						oCell1_22.align="left";
						oCell1_33.align="center";
						oCell1_55.align="center";
						oCell1_44.align="center";
						
						oCell1_11.innerHTML = omIntendPeriod[i].omIntendScores[j].scorename;
				    	oCell1_22.innerHTML = omIntendPeriod[i].omIntendScores[j].aimscore;
				    	oCell1_33.innerHTML = (omIntendPeriod[i].omIntendScores[j].weight*100).toFixed(2)+'%';
				    	oCell1_55.innerHTML = data.omAppraisedet[y].grade;
				    	
				    	sumgrade1 = sumgrade1+data.omAppraisedet[y].grade*omIntendPeriod[i].omIntendScores[j].weight*omIntendPeriod[i].weight;
				    	sumgrade = sumgrade+data.omAppraiseByTutordet[y].grade*omIntendPeriod[i].omIntendScores[j].weight*omIntendPeriod[i].weight;
				    	
				    	oCell1_44.innerHTML = data.omAppraiseByTutordet[y].grade;
				    						<%-- "<input class='nui-spinner' name='omAppraiseByTutordet["+y+"].grade' id='grade"+y+"'  style='width:90%' required='true' format='n2' showbutton='false' changeOnMousewheel='false' minValue='0' maxValue='100' onvaluechanged='changeGrade'/>"
				    						+"<input class='nui-hidden' name='omAppraiseByTutordet["+y+"].scoreid' id='scoreid"+y+"'/>"
											+"<input class='nui-hidden' name='omAppraiseByTutordet["+y+"].goalid' id='goalid"+y+"'/>"
											+"<input class='nui-hidden' name='omAppraiseByTutordet["+y+"].scoreweight' id='scoreweight"+y+"' value='"+omIntendPeriod[i].omIntendScores[j].weight+"'/>"
											+"<input class='nui-hidden' name='omAppraiseByTutordet["+y+"].goalweight' id='goalweight"+y+"' value='"+omIntendPeriod[i].weight+"'/>"
											+"<input class='nui-hidden' name='omAppraiseByTutordet["+y+"].appraisedetid' id='appraisedetid"+y+"'/>";
											
											data.omAppraiseByTutordet[y].scoreweight = omIntendPeriod[i].omIntendScores[j].weight;
											data.omAppraiseByTutordet[y].goalweight = omIntendPeriod[i].weight;--%>
						y++;
						
						nownum++;
					}
				}
				
				if(nownum == 0){
					var oCell1_3=aRows[myNewRow.rowIndex].insertCell(aCells.length);
					oCell1_3.id = "periodScore"+i;
					oCell1_3.align="left";
					oCell1_3.innerHTML = omIntendPeriod[i].scorename;
					document.getElementById("periodScore"+i).colSpan = 2;
					oCell1_3.innerHTML = omIntendPeriod[i].scorename;
					
					var oCell1_4=aRows[myNewRow.rowIndex].insertCell(aCells.length);
					oCell1_4.align="center";
					oCell1_4.innerHTML = (omIntendPeriod[i].weight*100).toFixed(2)+'%';
					
					var oCell1_6=aRows[myNewRow.rowIndex].insertCell(aCells.length);
					oCell1_6.align="center";
					oCell1_6.innerHTML = data.omAppraisedet[y].grade;
					
					sumgrade1 = sumgrade1+data.omAppraisedet[y].grade*omIntendPeriod[i].weight;
					sumgrade = sumgrade+data.omAppraiseByTutordet[y].grade*omIntendPeriod[i].weight;
					
					var oCell1_5=aRows[myNewRow.rowIndex].insertCell(aCells.length);
					oCell1_5.align="center";
					oCell1_5.innerHTML = data.omAppraiseByTutordet[y].grade;
										
										<%--"<input class='nui-spinner' name='omAppraiseByTutordet["+y+"].grade' id='grade"+y+"'  style='width:90%' required='true' format='n2' showbutton='false' changeOnMousewheel='false' minValue='0' maxValue='100' onvaluechanged='changeGrade'/>"
										+"<input class='nui-hidden' name='omAppraiseByTutordet["+y+"].scoreid' id='scoreid"+y+"'/>"
										+"<input class='nui-hidden' name='omAppraiseByTutordet["+y+"].goalid' id='goalid"+y+"'/>"
										+"<input class='nui-hidden' name='omAppraiseByTutordet["+y+"].scoreweight' id='scoreweight"+y+"' value='1'/>"
										+"<input class='nui-hidden' name='omAppraiseByTutordet["+y+"].goalweight' id='goalweight"+y+"' value='"+omIntendPeriod[i].weight+"'/>"
										+"<input class='nui-hidden' name='omAppraiseByTutordet["+y+"].appraisedetid' id='appraisedetid"+y+"'/>";
										
										
										data.omAppraiseByTutordet[y].scoreweight = 1;
										data.omAppraiseByTutordet[y].goalweight = omIntendPeriod[i].weight;--%>
					y++;
					
					allnum++;
				}else{
					document.getElementById("period"+i).rowSpan = nownum;
					document.getElementById("periodWeight"+i).rowSpan = nownum;
					allnum=allnum+nownum;
				}
			}
			if(allnum != 0){
				document.getElementById(type).rowSpan = allnum;
			}
			nui.parse();
			document.getElementById("sumgrade1").innerHTML = sumgrade1.toFixed(2);
			document.getElementById("sumgrade").innerHTML = sumgrade.toFixed(2);
			if(sumgrade.toFixed(2)<60){
				document.getElementById("sumgrade").style.color = 'red';
			}else{
				document.getElementById("sumgrade").style.color = 'black';
			}
			if(sumgrade1.toFixed(2)<60){
				document.getElementById("sumgrade1").style.color = 'red';
			}else{
				document.getElementById("sumgrade1").style.color = 'black';
			}
		}else{
			nui.alert("请先设置使用期目标！");
			nui.get("appButton").setEnabled(false);
		}
	}
	
	function changeGrade(){
		var  omAppraisedets = form1.getData().omAppraiseByTutordet;
		var sumGrade = 0;
		for(var i=0;i<omAppraisedets.length;i++){
			sumGrade = sumGrade + omAppraisedets[i].goalweight * omAppraisedets[i].scoreweight * omAppraisedets[i].grade;
		}
		document.getElementById("sumgrade").innerHTML = sumGrade.toFixed(2);
		if(sumGrade.toFixed(2)<60){
			document.getElementById("sumgrade").style.color = 'red';
		}else{
			document.getElementById("sumgrade").style.color = 'black';
		}
	}
	
	function changeappraisestatus(){
		var verirestatue = nui.get("verirestatue").getValue();
		if(verirestatue == '0' || verirestatue == '1'){
			nui.get("veriresult").setValue("1");
			if(verirestatue == '0'){
				document.getElementById("showturn").style.display = '';
				document.getElementById("showturn1").style.display = 'none';
			}else{
				document.getElementById("showturn").style.display = 'none';
				document.getElementById("showturn1").style.display = '';
			}
		}else if(verirestatue == '2'){
			nui.get("veriresult").setValue("2");
			document.getElementById("showturn").style.display = 'none';
			document.getElementById("showturn1").style.display = 'none';
		}
	}
	
	function back(){
		var win = nui.get("win1");
        win.showAtPos("center", "middle");
	}
	//关闭框
	function onCancel1() {//关闭清空编辑框内已填写的数据
        var win = nui.get("win1");
        win.hide();
    }
    
	var message = "提交";
	function onOk(auditstatus){
    	if(auditstatus=='4'){
    		message = "提交";
    		nui.get("backTo1").setValue(null)
			nui.get("backTo").setValue(null);
    	}else if(auditstatus=='0'){
    		if(nui.get("backTo1").getValue() == null || nui.get("backTo1").getValue() == ''){
    			nui.alert("退回环节必填!");
    			return;
    		}else{
    			message = "退回";
    			nui.get("backTo").setValue(nui.get("backTo1").getValue());
    			nui.get("auditopinion").setValue(nui.get("auditopinion1").getValue());
    		}
    	}else if(auditstatus=='2'){
    		message = "终止";
    		nui.get("backTo1").setValue(null)
			nui.get("backTo").setValue(null);
    	}
    	nui.get("auditstatus").setValue(auditstatus);
    	show();
		if(!form1.validate() && auditstatus!="2" && auditstatus!="0"){
			nui.alert("信息录入不完整!");
			return;
		}else{
    		SaveData();
		}
	}
	
	function SaveData(){
	    nui.get("verirestatue2").setValue(nui.get("verirestatue").getValue());
		var json = form1.getData();
		var opioionformData = opioionform.getData();
		json.misOpinion = opioionformData.misOpinion;
		nui.confirm("确定要"+message+"转正流程吗？","操作提示",function (action){
			if(action == "ok"){
				nui.get("appButton").setEnabled(false);
				nui.get("appButton1").setEnabled(false);
				nui.get("appButton2").setEnabled(false);
				form1.loading("处理中,请稍后...");
				nui.ajax({
	    			url:"com.primeton.eos.ame_permanage.ame_becomeregulae.BecomeProcessReve.biz.ext",
	    			data: json,
	    			type:"post",
	    			contentType:"text/json",
	    			success:function(action){
	    				action = nui.clone(action);
	    				form1.unmask();
	    				if(action.exception == null){
	    					nui.alert(message+"转正流程成功！","系统提示",function(){
				        		CloseWindow("ok");
			    				nui.get("appButton").setEnabled(true);
			    				nui.get("appButton1").setEnabled(true);
			    				nui.get("appButton2").setEnabled(true);
				        	});
	    				}else{
	    					nui.alert("流程提交失败！","系统提示",function (){
			    				nui.get("appButton").setEnabled(true);
			    				nui.get("appButton1").setEnabled(true);
			    				nui.get("appButton2").setEnabled(true);
	    					});
	    				}
	    			},
	    			error:function(jqXHR, teactionatus, errorThrown){
	    				nui.alert("error:" + jqXHR.responseText);
	    			}
	    		});
			}
		});
	}
	
	//关闭
	function onCancel(e) {
    	var data = form1.getData();
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
		if (action == "close" && form1.isChanged()){
			if (confirm("数据被修改了，是否先保存？")){
				return false;
			}
		}
		if (window.CloseOwnerWindow) return window.CloseOwnerWindow(action);
		else window.close();
	}
	
	function getappraisertype(e){
		return nui.getDictText('VERI_APPRAISETYPE',e.value);//设置业务字典值
	}
	function getappraisestatus(e){
		return nui.getDictText('VERI_STATUS',e.value);//设置业务字典值
	}
	
	function checkDate(e){
		var date = e.date;
        var d = new Date(data.ver.shoulddate);
        var s = date.getTime() + 24*60*60*1000;
        if (s >= d.getTime()) {
            e.allowSelect = false;
        }
	}
	
	function changeAgent(e){
        var length = e.value.split(",").length;
        if (length > 1) {
        
            var text = e.sender.getText().split(",")[0];
            var value = e.sender.getValue().split(",")[0];
            setTimeout(function () {
                
                e.sender.setValue(value);
                e.sender.setText(text);
            }, 200)
        }
	}
</script>
</html>
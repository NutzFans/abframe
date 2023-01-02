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
  - Date: 2020-03-12 16:44:54
  - Description:
-->
<head>
<title>员工自评</title>
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
				<input name="emp.empname" id="empname1"  class="nui-hidden"/>
				<input name="emp.major" id="major"  class="nui-hidden"/>
				<input name="emp.orgid" id="orgid"  class="nui-hidden"/>
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
							<input name="emp.mentor" id="mentor" class="mini-textboxlist" allowInput="true" textField="EMPNAME" valueField="USERID" searchField="name"  url="com.primeton.eos.ame_common.ame_common.queryAllEmpByName.biz.ext"  width="60%" required="true" onvaluechanged="changeAgent"/>
							<span style="color:red;">如变动请调整</span>
						</td>
					</tr>
					<tr>
						<td align="right" style="width:130px">试用期时间：</td>
						<td name="ver.veristart" class = "asLabel" id="veristart" style="width:190px" colspan="2"></td>
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
				  	</colgroup>
					<tr>
						<td class = "asLabel" colspan="7" align="left" style="font-weight:bold;width:160px">
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
					</tr>
					<tr>
						<td align="center" colspan="6" style="font-weight:bold;">
						总分=各考核项目评分乘以权重之和<span style="color:red;">说明：试用期考核评估分数达到60分以上（含），将视作符合新员工录用条件之一</span></td>
						<td align="center" style="width:100px;font-weight:bold;" id="sumgrade"></td>
					</tr>
					<tr>
						<td align="left" colspan="7">
							<span class = "asLabel" style="font-weight:bold;">
								三、新员工线上培训
							</span>
							<br/>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
							新员工须在试用期内完成新员工线上培训课程及其配套考试，并取得合格的成绩
							<br/>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
							如果考试成绩未达到合格，设一次补考机会，如补考不合格，则无法按时通过试用期
						</td>
					</tr>
				</table>
			</div>
		</fieldset>
		<fieldset id="field1" style="border:solid 1px #aaa;padding:3px;display:none">
			<legend>转正意见</legend>
			<div style="padding:5px;">
				<input name="omAppraise.appraiseid" id="appraiseid"  class="nui-hidden"/>
				<input name="omAppraise.appraisertype" id="appraisertype"  class="nui-hidden"/>
				<input name="omAppraise.appraiser" id="appraiser"  class="nui-hidden"/>
				<table style="table-layout:fixed;" >	
					<tr>
						<td align="right" style="width:130px">是否同意转正：</td>
						<td >
							<input class="nui-radiobuttonlist" name="omAppraise.appraisestatus" id="appraisestatus" required="false" data="[{'id': '1','text': '是'},{'id': '0','text': '否'}]" onvaluechanged='changeappraisestatus'/>
						</td>
					</tr>
					<tr>
						<td align="right" style="width:130px">转正评价：</td>
						<td >
							<input name="omAppraise.appraise" id="appraise" class="nui-textarea" style = "width: 500px;height:50px" maxLength="200" required="false">
						</td>
					</tr>
				</table>
			</div>
		</fieldset>
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
	<%--<a class="nui-button" onclick="onOk('0')" style="width:60px;margin-right:20px;" id="appButton1">退回</a>--%>
	<a class="nui-button" onclick="onOk('2')" iconCls="icon-remove" style="width:90px;margin-right:10px;" id="appButton2">终止流程</a>
</div>
</body>
<script type="text/javascript">
	nui.parse();
	var form1 = new nui.Form("form1");
	//审核意见的表单
	//var opioionform = new nui.Form("#opioionform");
	
	var y = 0;//动态生成考核表单
	var data = [];
	
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
            		
            		createappraisaltable(data.omIntendPeriod,'一、工作目标','Period');
            		createappraisaltable(data.omIntendQuality,'二、综合素质','Quality');
            		form1.setData(data);
            		changeGrade();
            		nui.get("appraisertype").setValue("0");
            		
            		//设置导师
            		if(o.emp.mentorstatus == 'on'){
	            		nui.get("mentor").setValue(o.emp.mentor);
	            		nui.get("mentor").setText(o.emp.mentorname);
            		}else{
	            		nui.get("mentor").setValue(null);
	            		nui.get("mentor").setText(null);
            		}
            		
            		//审批意见的流程实例ID
					nui.get("processinstid").setValue(o.ver.processinstid);
               		//nui.get("auditstatus").setValue("4");
					nui.get("workitemid").setValue(<%=workItemID %>);
               		nui.get("activitydefid").setValue(o.workitem.activityDefID);
					//流程回退路径赋值 
                	nui.get("backTo").setData(o.ver.backList);
	                //审核结果设置
					var dataStatus = [{"dictID": 4,"dictName": "处理"},{"dictID": 0,"dictName": "退回"}];
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
				
				var myNewRow = myTable.insertRow(myTable.rows.length-2);//取得表格的总行数
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
					    	var myNewRow = myTable.insertRow(myTable.rows.length-2);
					    	//取得表格的总行数
					    	var aRows=myTable.rows;
						}
						//取得表格的总网格数
						var aCells=myNewRow.cells;//向新增行中增加网格
						var oCell1_11=aRows[myNewRow.rowIndex].insertCell(aCells.length);
						var oCell1_22=aRows[myNewRow.rowIndex].insertCell(aCells.length);
						var oCell1_33=aRows[myNewRow.rowIndex].insertCell(aCells.length);
						var oCell1_44=aRows[myNewRow.rowIndex].insertCell(aCells.length);
						oCell1_11.align="left";
						oCell1_22.align="left";
						oCell1_33.align="center";
						oCell1_44.align="center";
						
						oCell1_11.innerHTML = omIntendPeriod[i].omIntendScores[j].scorename;
				    	oCell1_22.innerHTML = omIntendPeriod[i].omIntendScores[j].aimscore;
				    	oCell1_33.innerHTML = (omIntendPeriod[i].omIntendScores[j].weight*100).toFixed(2)+'%';
				    	
				    	oCell1_44.innerHTML = "<input class='nui-spinner' name='omAppraisedet["+y+"].grade' id='grade"+y+"'  style='width:90%' required='true' format='n2' showbutton='false' changeOnMousewheel='false' minValue='0' maxValue='100' onvaluechanged='changeGrade'/>"
				    						+"<input class='nui-hidden' name='omAppraisedet["+y+"].scoreid' id='scoreid"+y+"'/>"
											+"<input class='nui-hidden' name='omAppraisedet["+y+"].goalid' id='goalid"+y+"'/>"
											+"<input class='nui-hidden' name='omAppraisedet["+y+"].scoreweight' id='scoreweight"+y+"' value='"+omIntendPeriod[i].omIntendScores[j].weight+"'/>"
											+"<input class='nui-hidden' name='omAppraisedet["+y+"].goalweight' id='goalweight"+y+"' value='"+omIntendPeriod[i].weight+"'/>"
											+"<input class='nui-hidden' name='omAppraisedet["+y+"].appraisedetid' id='appraisedetid"+y+"'/>";
											
											data.omAppraisedet[y].scoreweight = omIntendPeriod[i].omIntendScores[j].weight;
											data.omAppraisedet[y].goalweight = omIntendPeriod[i].weight;
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
					
					var oCell1_5=aRows[myNewRow.rowIndex].insertCell(aCells.length);
					oCell1_5.align="center";
					oCell1_5.innerHTML = "<input class='nui-spinner' name='omAppraisedet["+y+"].grade' id='grade"+y+"'  style='width:90%' required='true' format='n2' showbutton='false' changeOnMousewheel='false' minValue='0' maxValue='100' onvaluechanged='changeGrade'/>"
										+"<input class='nui-hidden' name='omAppraisedet["+y+"].scoreid' id='scoreid"+y+"'/>"
										+"<input class='nui-hidden' name='omAppraisedet["+y+"].goalid' id='goalid"+y+"'/>"
										+"<input class='nui-hidden' name='omAppraisedet["+y+"].scoreweight' id='scoreweight"+y+"' value='1'/>"
										+"<input class='nui-hidden' name='omAppraisedet["+y+"].goalweight' id='goalweight"+y+"' value='"+omIntendPeriod[i].weight+"'/>"
										+"<input class='nui-hidden' name='omAppraisedet["+y+"].appraisedetid' id='appraisedetid"+y+"'/>";
										
										
										data.omAppraisedet[y].scoreweight = 1;
										data.omAppraisedet[y].goalweight = omIntendPeriod[i].weight;
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
		}else{
			nui.alert("请先设置使用期目标！");
			nui.get("appButton").setEnabled(false);
		}
	}
	
	function changeGrade(){
		var  omAppraisedets = form1.getData().omAppraisedet;
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
		var appraisestatus = nui.get("appraisestatus").getValue();
		if(appraisestatus == '1'){
			nui.get("appraise").setValue("同意转正");
		}else if(appraisestatus == '0'){
			nui.get("appraise").setValue("不同意转正");
		}
	}
	
	var message = "提交";
	function onOk(auditstatus){
    	nui.get("auditstatus").setValue(auditstatus);
    	show();
    	if(auditstatus=='4'){
    		message = "提交";
    	}else if(auditstatus=='0'){
    		message = "退回";
    	}else if(auditstatus=='2'){
    		message = "终止";
    	}
    	var mentor = nui.get("mentor").getValue();
    	if(mentor.indexOf(",")!=-1){
    		nui.alert("导师唯一！");
			return;
    	}
		if(!form1.validate() && auditstatus!="2"){
			nui.alert("信息录入不完整!");
			return;
		}else{
    		SaveData();
		}
	}
	
	function SaveData(){
		var json = form1.getData();
		var opioionformData = opioionform.getData();
		json.misOpinion = opioionformData.misOpinion;
		
		json.ver.guanzhu = 'true';//关注流程
		nui.confirm((message == "终止"?"终止意味着个人放弃转正，":"")+"确定要"+message+"转正流程吗？","操作提示",function (action){
			if(action == "ok"){
				nui.get("appButton").setEnabled(false);
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
			    				nui.get("appButton2").setEnabled(true);
				        	});
	    				}else{
	    					nui.alert("流程提交失败！","系统提示",function (){
			    				nui.get("appButton").setEnabled(true);
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
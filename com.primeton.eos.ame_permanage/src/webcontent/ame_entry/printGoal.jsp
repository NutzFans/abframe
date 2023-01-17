<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@page import="com.eos.data.datacontext.UserObject"%>
<%@page import="commonj.sdo.DataObject"%>
<%@page import="java.util.Map"%>
<html>
<!-- 
  - Author(s): 许青倩
  - Date: 2019-09-16 16:44:25
  - Description:
-->
<head>
<title>打印试用期目标</title>
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
<script src="<%= request.getContextPath() %>/common/nui/nui.js" type="text/javascript"></script>
<script type="text/javascript" src="<%= request.getContextPath() %>/ame_common/js/jquery.qrcode.min.js"></script>
<script type="text/javascript" src="<%= request.getContextPath() %>/ame_common/js/JsBarcode.all.js"></script>
<script type="text/javascript" src="<%= request.getContextPath() %>/ame_common/js/jquery-barcode.js"></script>  
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
<style type="text/css">
    .asLabel{border:0;background-color:#F5F5F5;cursor:default;}
</style>
</head>
<body>
<div style="height: auto">
	<div class="mini-panel" style="width: 788px;height: auto">
		<form id=form_Intend method="post" style="table-layout:fixed;" >
			<div style="text-align:center;"><span style="font-weight:bold;text-align:center;">新员工试用期目标</span></div>
			<fieldset id="field1" style="border:solid 1px #aaa;padding:3px;">
				<legend >员工基本信息</legend>
				<div style="padding:5px;">
					<input name="omIntendJoin.intendid" id="intendid"  class="nui-hidden"/>
					<input name="omIntendJoin.processinstid" id="processinstid2"  class="nui-hidden"/>
					<input name="omIntendJoin.fileids" id="fileids" class="nui-hidden"/>
					<input name="omIntendJoin.intendname" class="nui-hidden"/>
					<input class="nui-hidden" id="workItemID" value="<%=request.getParameter("workItemID")%>"/>
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
							<td align="right" style="width:130px">试用期开始时间：</td>
							<td name="omIntendJoin.probationstartdate" class = "asLabel" id="probationstartdate" style="width:190px"></td>
							<td align="right" style="width:130px;display:none">试用期期限(月)：</td>
							<td name="omIntendJoin.probation" class = "asLabel" id="probation" style="width:190px;display:none"></td>
						    <td align="right" style="width:130px">试用期结束时间：</td>
							<td name="omIntendJoin.probationenddate" class = "asLabel" id="probationenddate" style="width:190px"></td>
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
							<tr>
								<td align="center" style="width:80px">考核维度</td>
								<td align="center" style="width:160px">考核阶段</td>
								<td align="center" style="width:60px">权重</td>
								<td align="center" style="width:250px">考核目标</td>
								<td align="center" style="width:250px">考核达标结果</td>
								<td align="center" style="width:60px">细项权重</td>
							</tr>
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
			
			<fieldset id="field11" style="border:solid 1px #aaa;padding:3px;">
				<legend>审批意见列表</legend>
		    	<div id="datagrid4" class="nui-datagrid" style="width:100%;height:auto;" dataField="misOpinions"
				    url="com.primeton.eos.ame_permanage.ame_entry.queryApprove.biz.ext"  idField="id" allowResize="true"
				    allowAlternating="true" multiSelect="true" showPager="false" allowCellWrap="true">
				    <div property="columns">
				        <div field="operatorname" width="50" headerAlign="center" align="center">处理人</div>
				        <div field="orgname" width="100" align="center" headerAlign="center">处理人所在机构</div>
				        <div field="auditopinion" headerAlign="center" align="center"width="20%">审核结果</div>
				        <div field="max_time" width="120" headerAlign="center" align="center" dateFormat="yyyy-MM-dd HH:mm:ss">处理时间</div>
				    </div>
				</div>
			</fieldset>
			
			<fieldset id="field8" style="border:solid 1px #aaa;padding:3px;">
				<div style="text-align:center;">
					<table>
						<tr>
							<td align="right" style="width:200px;font-weight:bold;">本人同意以上试用期目标设定</td>
						</tr>
					</table>
				</div>
				<div style="text-align:right;margin-right:200px">
					<span >员工签名（手写）：</span>
				</div>
			</fieldset>
		</form>
	</div>
</div>
</body>
<script type="text/javascript">
	nui.parse();
	var form_Intend = new nui.Form("form_Intend");
	var grid4 = nui.get("datagrid4");
	
	var y = 0;//动态生成考核表单
	var x =[]//动态生成目标
    var z = 0;//阶段结束
    
    initdate();
    function initdate(){
		//初始化拟入职人员信息
       	nui.ajax({
            url: "com.primeton.eos.ame_permanage.ame_entry.getProcessEntry.biz.ext",
            data: {intendid:null,workItemID:<%=request.getParameter("workItemID")%>,processInstID:null},
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
            		
            		document.getElementById("probationstartdate").innerHTML = o.omIntendJoin.probationstartdate == null ?"":o.omIntendJoin.probationstartdate;
            		document.getElementById("probation").innerHTML = o.omIntendJoin.probation == null ?"":o.omIntendJoin.probation;
            		document.getElementById("probationenddate").innerHTML = o.omIntendJoin.probationenddate == null ?"":o.omIntendJoin.probationenddate;
            		form_Intend.setData(o);
            		grid4.load({"criteria": 
                                {"_expr[0]": {"processinstid": o.omIntendJoin.processinstid},
                                "_expr[1]": {"_property": "activitydefid","_op": "in","_value": "manualActivity2,manualActivity6"}}});
					grid4.sortBy("time", "desc");
					
					createappraisaltable(o.omIntendPeriod,'一、工作目标','Period');
            		createappraisaltable(o.omIntendQuality,'二、综合素质','Quality');
            		
			    	nui.parse();
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
				var myTable = document.getElementById('goaltable1');
				//向表格中增加一行
				
				var myNewRow = myTable.insertRow(myTable.rows.length);//取得表格的总行数
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
					    	var myNewRow = myTable.insertRow(myTable.rows.length);
					    	//取得表格的总行数
					    	var aRows=myTable.rows;
						}
						//取得表格的总网格数
						var aCells=myNewRow.cells;//向新增行中增加网格
						var oCell1_11=aRows[myNewRow.rowIndex].insertCell(aCells.length);
						var oCell1_22=aRows[myNewRow.rowIndex].insertCell(aCells.length);
						var oCell1_33=aRows[myNewRow.rowIndex].insertCell(aCells.length);
						oCell1_11.align="left";
						oCell1_22.align="left";
						oCell1_33.align="center";
						
						oCell1_11.innerHTML = omIntendPeriod[i].omIntendScores[j].scorename;
				    	oCell1_22.innerHTML = omIntendPeriod[i].omIntendScores[j].aimscore;
				    	oCell1_33.innerHTML = (omIntendPeriod[i].omIntendScores[j].weight*100).toFixed(2)+'%';
				    	
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
</script>
</html>
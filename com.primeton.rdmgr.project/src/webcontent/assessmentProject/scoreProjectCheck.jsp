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
  - Author(s): xuqingqian
  - Date: 2016-10-18 15:01:58
  - Description:
-->
<head>
    <title>项目考核审批流程</title>
    <meta http-equiv="content-type" content="text/html; charset=UTF-8" />
	<script src="<%= request.getContextPath() %>/common/nui/nui.js"
		type="text/javascript"></script>
	<script src="../common/nui/nui.js" type="text/javascript"></script>
	<style type="text/css">
	    body{
	        margin:0;padding:0;border:0;width:100%;height:100%;overflow:hidden;
	    }
	    html, body
	    {
	        font-size:12px;
	        padding:0;
	        margin:0;
	        border:0;
	        height:100%;
	        overflow:hidden;
	    }
	     .myIndex{
	        background:#FFF68F;
	    }
	    .asLabel
	    {
	        border:0;background-color:#F5F5F5;cursor:default;
	    }
	</style>
</head>
<body>
<div class="nui-fit">
    <div class="mini-panel" title="项目考核审批流程" style="width: auto">
        <!-- 提示信息展示 -->
		<jsp:include page="/ame_common/ameFlowOperTips/ameFlowOperTipsInfo.jsp"/>
		<form id="form1" method="post">
			<input name="rdprojcheck.fileids" id="fileids" class="nui-hidden"/>
			<input name="rdprojcheck.projcheckid" id="projcheckid" class="nui-hidden"/>
		     <fieldset id="field2" style="border:solid 1px #aaa;padding:3px;">
		       <legend>基本信息</legend>
		       		<table style="table-layout:fixed;" id="a1">
						<tr>
							<td align="right" style="width:150px;">项目名称：</td>
							<td id="projectname" class="asLabel" colspan="3"></td>
							<td align="right" style="width:150px;">项目编号：</td>
							<td id="projectno" class="asLabel" style="width:150px"></td>
						</tr>
						<tr>
							<td align="right" style="width:150px;">客户：</td>
							<td id="custid" class="asLabel" colspan="3"></td>
							<td align="right" style="width:150px;">合同编号：</td>
							<td id="contnum" class="asLabel" style="width:150px"></td>
						</tr>
						<tr>
							<td align="right" style="width:150px;">项目经理：</td>
							<td id="manager" class="asLabel" style="width:150px"></td>
							<td align="right" style="width:150px;">受益销售：</td>
							<td id="orgid" class="asLabel" style="width:150px"></td>
						</tr>
						<tr>
							<td align="right" style="width:150px;">考核状态：</td>
							<td id="checkstatus" class="asLabel" style="width:150px"></td>
							<td align="right" style="width:150px;">考核方案发起日期：</td>
							<td id="checkstartdate" class="asLabel" style="width:150px"></td>
							<td align="right" style="width:150px;">考核方案确认日期：</td>
							<td id="projcheckdate" class="asLabel" style="width:150px"></td>
						</tr>
					</table>
		     </fieldset>
		     
		     <fieldset id="field3" style="border:solid 1px #aaa;padding:3px;">
		       <legend>预算情况</legend>
					<table style="table-layout:fixed;" id="a2">
						<tr>
							<td align="right" style="width:180px;">产品合同额：</td>
							<td id="prodmon" class="asLabel" style="width:150px"></td>
							<td align="right" style="width:150px;">服务合同额：</td>
							<td id="servmon" class="asLabel" style="width:150px"></td>
							<td align="right" style="width:150px;">合同总额：</td>
							<td id="contmon" class="asLabel" style="width:150px"></td>
						</tr>
						<tr>
							<td align="right" style="width:150px;">产品不含税收入：</td>
							<td id="prodincomenet" class="asLabel" style="width:150px"></td>
							<td align="right" style="width:150px;">服务不含税收入：</td>
							<td id="servincomenet" class="asLabel" style="width:150px"></td>
							<td align="right" style="width:150px;">合同毛收入：</td>
							<td id="grossincome" class="asLabel" style="width:150px"></td>
						</tr>
						<tr>
							<td align="right" style="width:150px;">产品退税：</td>
							<td id="prodtaxback" class="asLabel" style="width:150px"></td>
							<td align="right" style="width:150px;">合同净收入：</td>
							<td id="netincome" class="asLabel" style="width:150px"></td>
						</tr>
						<tr>
							<td align="right" style="width:150px;">预算总成本：</td>
							<td id="budget" class="asLabel" style="width:150px"></td>
							<td align="right" style="width:150px;">项目外部采购：</td>
							<td id="outbuy" class="asLabel" style="width:150px"></td>
							<td align="right" style="width:150px;">预算总成本(不含外购)：</td>
							<td id="budgetcost" class="asLabel" style="width:150px"></td>
						</tr>
						<tr>
							<td align="right" style="width:150px;">预算毛利：</td>
							<td id="projgross" class="asLabel" style="width:150px"></td>
							<td align="right" style="width:150px;">预算毛利率：</td>
							<td id="projgrossrate" class="asLabel" style="width:150px"></td>
							<td align="right" style="width:150px;">预算转换系数：</td>
							<td id="budgetratio" class="asLabel" style="width:150px"></td>
						</tr>
					</table>
		     </fieldset>
		     
		     <fieldset id="field4" style="border:solid 1px #aaa;padding:3px;">
		       <legend>考核方案</legend>
		       		<table style="table-layout:fixed;" id="a3">
						<tr>
							<td align="right" style="width:150px;">项目类型 ：</td>
							<td id="projecttype" class="asLabel" style="width:150px"></td>
							<td align="right" style="width:150px;">考核对应收入确认年月：</td>
							<td id="checkincomeym" class="asLabel" style="width:150px"></td>
							<td align="right" style="width:150px;">节省成本奖金提取比例：</td>
							<td id="bonusrate" class="asLabel" style="width:150px"></td>
						</tr>
						<tr>
							<td align="right" style="width:150px;">项目经理分配比例：</td>
							<td id="managerrate" class="asLabel" style="width:150px"></td>
							<td align="right" style="width:150px;">奖金发放时机：</td>
							<td id="bonustime" class="asLabel" ></td>
							<td align="right" style="width:150px;">目标奖金：</td>
							<td id="targetbonus" class="asLabel" colspan="3"></td>
						</tr>
						<tr>
							<td align="right" style="width:150px;">考核时机及主要约定：</td>
							<td id="checktime" class="asLabel" colspan="5" height=50px></td>
						</tr>
						<tr>
							<td align="right" style="width:150px;">考核其他附加要求：</td>
							<td id="checkmemo" class="asLabel" colspan="5" style="width:auto"></td>
						</tr>
					</table>
		     </fieldset>
		     </form>
	     <div class="nui-tabs" activeIndex="0">
	     	<div title="项目预算与执行损益对照表">
	     		<iframe src="" id="projectSunYi" frameborder="0" scrolling="no" height="650px" width="100%" style="text-align: left;"></iframe>
     		</div>
     		<div title="项目人员工作量投入统计">
	       		<iframe src="" id="workrdport" frameborder="0" scrolling="no" height="600px" width="100%" style="text-align: left;"></iframe>
     		</div>
     		<div title="项目考核附件">
     			<jsp:include page="/ame_common/detailFile.jsp"/>
     		</div>
	     </div>
       	<form id="form55" method="post">
       		<fieldset id="field56" style="border:solid 1px #aaa;padding:3px;">
	        <legend>考核评分</legend>
	        	<div id="datagrid22" class="nui-datagrid" style="width:100%;height:auto;" idField="id" allowResize="true"
				    allowAlternating="true" multiSelect="true" showPager="false" allowCellWrap="true" allowCellEdit="true" allowCellSelect="true">
				    <div property="columns">
				    	<div field="identitytype" width="80" headerAlign="center" align="center" renderer="getIdentity">考核人身份</div>
				        <div field="consult" width="280" headerAlign="center" align="left">评分参考</div>
				        <div field="num" width="80" align="right" headerAlign="center">考核打分(百分制)
				        	<input property="editor" class="nui-spinner" id="num" onvaluechanged="checkNum" format="##" allowLimitValue="false" changeOnMousewheel="false" showbutton="false">
				        </div>
				        <div field="evaluate" width="250" headerAlign="center" align="left">考核评价
				        	<input property="editor" class="nui-textarea" id="evaluate" style="width:600px;height: 40px;" >
				        </div>
				    </div>
				</div>
	        </fieldset>
       	</form>
		<form id="opioionform" method="post">
		    <input name="misOpinion.processinstid" id="processinstid" class="nui-hidden" />
		    <input name="misOpinion.processinstname" id="processinstname" class="nui-hidden" />
		    <input name="misOpinion.activitydefid" id="activitydefid" class="nui-hidden" />
		    <input name="misOpinion.workitemid" id="workitemid" class="nui-hidden" />
		    <input name="misOpinion.workitemname" id="workitemname" class="nui-hidden" />
		    <input name="misOpinion.isshow" id="isshow" class="nui-hidden" />
			<input name="misOpinion.fileids" id="fileids"  class="nui-hidden"/>
			<fieldset style="border:solid 1px #aaa;padding:3px;">
		        <legend>处理意见列表</legend>
		        	<div id="datagrid1" class="nui-datagrid" style="width:100%;height:auto;" dataField="misOpinions"
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
		        <div style="padding:5px;" id="opinionHide">
		            <table style="table-layout:fixed;">
		            	<tr id="salesEdit">
		                    <td style="width:150px;" align="right">审核结果：</td>
		                    <td style="width:250px;">  
								<input name="misOpinion.auditstatus" id="auditstatus" class="mini-dictradiogroup" value="1" style="width:250px;" required="true" dictTypeId="MIS_AUDITSTATUS"  onvaluechanged="show()" />
		                    </td>
		                    <td style="width:366px;" align="right" colspan="2">  
		                    	<a class="nui-button" onclick="doSHZT" style="width:100px;margin-right:20px;">悬挂意见保存</a>
		                    </td>
		                </tr>
		                <tr id="choosehide">
		                    <td  style="width:150px;" align="right">回退到：</td> 
		                    <td style="width:250px;" colspan="3">
		                    	<input name="misOpinion.backTo" id="backTo" class="nui-combobox" valueField="id" textField="name" style="width:200px" required="true" />
		                    </td>
		                </tr>
		                <tr>
		                    <td style="width:150px;height:auto;" align="right">处理意见：</td>
		                    <td colspan="3">
		                        <input name="misOpinion.auditopinion" id="auditopinion" class="nui-textarea" required="false" style="width:600px;height: 40px;"/>
		                    </td>
		                </tr>
		            </table>
		        </div>
		    </fieldset>
	    </form>
    </div>
</div>
<div style="text-align:center;padding:10px;" class="nui-toolbar">  
		<a class="nui-button" onclick="onOk" id="submitReimbProcess" style="width: 60px;margin-right:20px;">提交</a>
		<a class="nui-button" onclick="onCancel('cancel')" id="closeWin" style="width:60px;">关闭</a>
</div>
<form name="viewlist1" id="viewlist1" action="com.primeton.eos.ame_common.ameExportCommon.flow" method="post">
   <input type="hidden" name="_eosFlowAction" value="action0" filter="false"/>
   <input type="hidden" name="downloadFile" filter="false"/>
   <input type="hidden" name="fileName" filter="false"/>
</form> 
	<script type="text/javascript">
		
		nui.parse();
		
		var form = new nui.Form("form1");
		var gaid22 = nui.get("datagrid22");
		var opioionform = new nui.Form("opioionform");
		nui.get("auditopinion").setValue("同意。");
		document.getElementById("choosehide").style.display="none";
		initMisOpinion({auditstatus:"1"});
	  	<%
	  		long workItemID=(Long)request.getAttribute("workItemID");
	   		UserObject user = (UserObject) session.getAttribute("userObject");
	   		String username = user.getUserName();
	   		String userno = user.getUserId();
	    %>
	    var projcheck;
		init();
		function init(){
        	form.mask("数据加载中...");
        	//流程提示信息
			promptInit({workItemID: <%=workItemID %>});
			var json=nui.encode({"workItemID": <%=workItemID %>});
			nui.ajax({
				url: "com.primeton.rdmgr.project.assessmentProject.getProjectCheck.biz.ext",
				type: "post",
				data: json,
				contentType: "text/json",
				success: function (o){
					var form = new nui.Form("form1");
					//加载附件设置参数
            		nui.get("grid_0").load({"groupid":"rdprojcheck","relationid": o.rdprojcheck.projcheckid});
            		
            		projcheck = o.rdprojcheck;
            		var scores = o.scores;
            		var workitem = o.workitem;
            		var report = nui.getDictText('AME_SYSCONF','AMEREPORT');
	        		var ame = nui.getDictText('AME_SYSCONF','AMEPATH');
	        		document.getElementById("projectSunYi").src = ame + "project/rdproject/projectprofit.jsp?projid="+projcheck.projectid;
	        		document.getElementById("workrdport").src = report + "reportJsp/showReport4Proj.jsp?rpx=/rdprojectTJ.rpx&projectno="+projcheck.projectno;
					//基本信息
					nui.get("projcheckid").setValue(projcheck.projcheckid);
					document.getElementById("projectname").innerHTML = projcheck.projectname == null? "":projcheck.projectname;
					document.getElementById("projectno").innerHTML = projcheck.projectno == null? "":projcheck.projectno;
					document.getElementById("contnum").innerHTML = projcheck.contnum == null? "":projcheck.contnum;
					document.getElementById("orgid").innerHTML= projcheck.orgname == null? "":projcheck.orgname;
					document.getElementById("manager").innerHTML= projcheck.managername == null? "":projcheck.managername;
					document.getElementById("custid").innerHTML= projcheck.custname == null? "":projcheck.custname;
					document.getElementById("checkstatus").innerHTML = projcheck.checkstatus == null? "":nui.getDictText('CHECK_STATUS',projcheck.checkstatus);
					document.getElementById("checkstartdate").innerHTML = projcheck.checkstartdate == null? "":projcheck.checkstartdate.substring(0,10);
					document.getElementById("projcheckdate").innerHTML = projcheck.projcheckdate == null? "":projcheck.projcheckdate.substring(0,10);
					nui.get("projcheckid").setValue(projcheck.projcheckid);
                    //预算信息
                    document.getElementById("prodmon").innerHTML = projcheck.prodmon == null? "":formatNumber(projcheck.prodmon);
                    document.getElementById("servmon").innerHTML = projcheck.servmon == null? "":formatNumber(projcheck.servmon);
                    document.getElementById("prodincomenet").innerHTML = projcheck.prodincomenet == null? "":formatNumber(projcheck.prodincomenet);
                    document.getElementById("servincomenet").innerHTML = projcheck.servincomenet == null? "":formatNumber(projcheck.servincomenet);
                    document.getElementById("prodtaxback").innerHTML = projcheck.prodtaxback == null? "":formatNumber(projcheck.prodtaxback);
                    document.getElementById("budget").innerHTML = projcheck.budget == null? "":formatNumber(projcheck.budget);
                    document.getElementById("budgetcost").innerHTML = projcheck.budgetcost == null? "":formatNumber(projcheck.budgetcost);
                    document.getElementById("contmon").innerHTML = projcheck.contmon == null? "":formatNumber(projcheck.contmon);
                    document.getElementById("netincome").innerHTML = projcheck.netincome == null? "":formatNumber(projcheck.netincome);
                    document.getElementById("grossincome").innerHTML = projcheck.grossincome == null? "":formatNumber(projcheck.grossincome);
                   	document.getElementById("projgross").innerHTML = projcheck.projgross == null? "":formatNumber(projcheck.projgross);
                    document.getElementById("projgrossrate").innerHTML = projcheck.projgrossrate == null? "":formatNumber(projcheck.projgrossrate,3);
                    document.getElementById("outbuy").innerHTML = projcheck.outbuy == null? "":formatNumber(projcheck.outbuy);
					//项目考核方案
					document.getElementById("projecttype").innerHTML = projcheck.projecttype == null? "":nui.getDictText('RD_CHECK_TYPE',projcheck.projecttype);
					document.getElementById("checkincomeym").innerHTML = projcheck.checkincomeym == null? "":projcheck.checkincomeym;
					document.getElementById("managerrate").innerHTML = projcheck.managerrate == null? "":projcheck.managerrate;
					document.getElementById("bonusrate").innerHTML = projcheck.bonusrate == null? "":projcheck.bonusrate;
					document.getElementById("bonustime").innerHTML = projcheck.bonustime == null? "":projcheck.bonustime;
					document.getElementById("targetbonus").innerHTML = projcheck.targetbonus == null? "":projcheck.targetbonus;
					document.getElementById("checktime").innerHTML = projcheck.checktime == null? "":projcheck.checktime;
					document.getElementById("checkmemo").innerHTML = projcheck.checkmemo == null? "":projcheck.checkmemo;
					document.getElementById("budgetratio").innerHTML = projcheck.budgetratio == null? "":projcheck.budgetratio;
					
					//考核评分
					var scoress=[];
					if(scores){
						for(var i=0;i<scores.length;i++){
							if('<%=userno %>'==scores[i].userid){
								scoress.push(scores[i]);
							}
						}
					}
					var gaid22 = nui.get("datagrid22");
					gaid22.setData(scoress);
					
					//设置审核意见基本信息
					nui.get("processinstid").setValue(o.workitem.processInstID);
	               	nui.get("processinstname").setValue(o.workitem.processInstName);
	               	nui.get("activitydefid").setValue(o.workitem.activityDefID);
	               	nui.get("workitemname").setValue(o.workitem.workItemName);
					nui.get("workitemid").setValue(<%=workItemID %>);
	               	nui.get("isshow").setValue("1");
	               	nui.get("auditstatus").setValue("1");
	               	nui.get("backTo").setData(o.rdprojcheck.backList);
	            	//查询审核意见
					var grid = nui.get("datagrid1");
					if(o.workitem.processInstID!=null||o.workitem.processInstID!=""){
						grid.sortBy("time", "desc");
						grid.load({processInstID: o.workitem.processInstID},function(){
							form.unmask();
						});
					}
				},
				error: function(){}
			});
        }
		
		//发起流程
		function SaveData(){
			form.mask("流程提交中...");
			//拿到checklist填写的值
			var data_opioion = opioionform.getData();
			var gaid22 = nui.get("datagrid22");
			var score = gaid22.getData();
			var rdprojcheck = projcheck;
			var json = nui.encode({"rdprojcheck":rdprojcheck,"misOpinion": data_opioion.misOpinion,"score":score});
			 nui.ajax({
                url: "com.primeton.rdmgr.project.assessmentProject.leaderSuer.biz.ext",
                data: json,
                type: 'POST',
                cache: false,
                contentType: 'text/json',
                success: function (text) {
                   	var returnJson = nui.decode(text);
	              	if(returnJson.result == "success"){
	              		form.unmask();
    					nui.alert("流程提交成功！");
	                   	CloseWindow("ok");
	              	}else{
                   		form.unmask();
						nui.get("submitReimbProcess").enable();
						nui.get("closeWin").enable();
	                   	nui.alert("流程提交失败！");
	              	}
                },
                error: function (jqXHR, textStatus, errorThrown) {
                    alert(jqXHR.responseText);
                }
            });
		}
		
		function onOk(e){
    		var gaid22 = nui.get("datagrid22");
			var score = gaid22.getData();
			if(score.length>0&&score!=null){
				for(var i=0;i<score.length;i++){
					var num = score[i].num;
					var evaluate = score[i].evaluate;
					if(num==null||num==""){
						alert("考核打分不能为空！");
						return;
					}
					if(evaluate==null||evaluate==""){
						alert("考核评价不能为空！");
						return;
					}
				}
			}
        	nui.confirm("是否提交流程?","操作提示",function(o){
        		if("ok" == o){
					nui.get("submitReimbProcess").disable();
					nui.get("closeWin").disable();
		        	SaveData();
        		}else{
        			
        		}
        	});
	    }
    
        function onCancel(e) {
            var data = form.getData();
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
        
        //标准方法接口定义
	    function CloseWindow(action) {           
	        if (window.CloseOwnerWindow) return window.CloseOwnerWindow(action);
	        else window.close();
	    }
	    
	    function onCheckRenderer(e) {
			return nui.getDictText('MIS_AUDITSTATUS',e.value);//设置业务字典值
		}
		
		function getIdentity(e){
			return nui.getDictText('AME_IDENTITY',e.value);//设置业务字典值
		}
	    
		function initMisOpinion(data){
			//初始化处理意见
			var dataStatus=[{"dictID": 1,"dictName": "通过"},{"dictID": 0,"dictName": "退回"},{"dictID": 2,"dictName": "终止流程"}];
			nui.get("auditstatus").setData(dataStatus);
			nui.get("auditstatus").setValue(data.auditstatus);
		}
	    //审核结果触发
	    function show(){
			var auditopinion = nui.get("auditopinion").getValue().trim();
			var auditstatus = nui.get("auditstatus").getValue();
			if(auditstatus=='0'){
				if(auditopinion=="同意。"){
					nui.get("auditopinion").setValue("");
				}
				chooselink();
			}else if(auditstatus=='1'){
				if(auditopinion==""){
					nui.get("auditopinion").setValue("同意。");
				}
				showNone();
			}else if(auditstatus=='2'){
				if(auditopinion=="同意。"){
					nui.get("auditopinion").setValue("");
				}
				showNone();
			}
		}
		function showNone(){
			nui.get("backTo").setValue("");
			document.getElementById("choosehide").style.display="none";
		}
		function chooselink(){
			document.getElementById("choosehide").style.display="";
		}
		
		//意见附件信息
	     function onFileRenderer(e) {
	        var tempSrc = "";
        	//长度为1，不换行
        	if(e.record.files.length == 1){
	        	tempSrc += "<a href='com.primeton.components.web.fileupload.getfile.flow?fileId=" + e.record.files[0].fileId + "'>" + e.record.files[0].fileName + "</a>";
        	}else{
		        for(var i=0;i<e.record.files.length;i++){
		        	//长度大于1小于长度length换行
		        	if(i< e.record.files.length-1){
		        		tempSrc += "<a href='com.primeton.components.web.fileupload.getfile.flow?fileId=" + e.record.files[i].fileId + "'>" + e.record.files[i].fileName + "</a><br/>&nbsp;&nbsp;";
		        	}
		        	//最后一个不换行
	        		if(i == e.record.files.length-1){
		        		tempSrc += "<a href='com.primeton.components.web.fileupload.getfile.flow?fileId=" + e.record.files[i].fileId + "'>" + e.record.files[i].fileName + "</a>";
		        	}
		        }
        	}
	       	return tempSrc;
	     }
    	function doSHZT(){
    		if(nui.get("auditopinion").getValue().trim() == ""){
    			nui.alert("悬挂时审核意见不可以为空");
        		return false;
    		}else{
    			if (!confirm("是否保存悬挂时的审核意见？")) {
                    return false;
                }else{
		    		var data = opioionform.getData();
		    		data.misOpinion.auditstatus = "5";
		    		var json = nui.encode(data);
		    		nui.ajax({
		    			url:"com.primeton.eos.ame_common.mail.saveMisopinion.biz.ext",
		    			data:json,
		    			type:"post",
		    			contentType:"text/json",
		    			success:function(action){
		    				if(action.exception == null){
					        	nui.alert("提交成功",null,function(){
						        	nui.get("datagrid1").reload();
					        	});
		    				}else{
		    					nui.alert("提交失败，请联系信息技术部人员！","系统提示", function(action){
		    					});
		    				}
		    			},
		    			error:function(jqXHR, textStatus, errorThrown){
		    				nui.alert("error:" + jqXHR.responseText);
		    			}
		    		});
		    	}
    		}
    	}
        
	    function delcommafy(num){
		  num=num.replace(/,/gi,'');
		  return parseFloat(num);
		}
        
        //格式化千分位
		function formatNumber(num,cent) {
			if(cent==null||cent==""){
				cent = 2;
			}
			num = num.toString().replace(/\$|\,/g,'');  
	        // 检查传入数值为数值类型  
	         if(isNaN(num))  
	          num = "0";  
	        // 获取符号(正/负数)  
	        sign = (num == (num = Math.abs(num)));  
	        num = Math.floor(num*Math.pow(10,cent)+0.50000000001); // 把指定的小数位先转换成整数.多余的小数位四舍五入  
	        cents = num%Math.pow(10,cent);       // 求出小数位数值  
	        num = Math.floor(num/Math.pow(10,cent)).toString();  // 求出整数位数值  
	        cents = cents.toString();        // 把小数位转换成字符串,以便求小数位长度  
	       
	        // 补足小数位到指定的位数  
	        while(cents.length<cent)  
	         cents = "0" + cents;  
	         // 对整数部分进行千分位格式化.  
	         for (var i = 0; i < Math.floor((num.length-(1+i))/3); i++)  
	          num = num.substring(0,num.length-(4*i+3))+','+ num.substring(num.length-(4*i+3));  
	        return (((sign)?'':'-') + num + '.' + cents); 
		}
	
		//日期格式化
	    function ondealdate(e){
		    var date = e.substring(0,10);
		    return date;
		}
		
		function checkNum(){
			var num = nui.get("num").getValue();
			if(num>100){
				alert("评分不能大于100");
				nui.get("num").setValue("");
			}else if(num<0){
				alert("评分不能小于0");
				nui.get("num").setValue("");
			}
		}
		
		//黄色
		gaid22.on("drawcell", function (e) {
		    var record = e.record,
		    column = e.column,
		    field = e.field,
		    value = e.value;
		    //设置行样式   
		    if("evaluate" == field || "num" == field){
		    	e.cellStyle = "background: yellow";
		    }
		});
		
	</script>
</body>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@page import="org.gocom.abframe.auth.bizlet.SkinUtil"%>
<html>
<head>
	<title>Title</title>
	<meta http-equiv="content-type" content="text/html; charset=UTF-8" />
	<script src="<%= request.getContextPath() %>/common/nui/nui.js" type="text/javascript"></script>
</head>
<%
 String pstatus = (String)session.getAttribute("pstatus");
 %>
<body>
	<table width="100%" height="500px">
		<tr>
			<td rowspan="2" style="width:14%">
				<div class="nui-panel" title="我的常用菜单" showToolbar="false" style="width:100%;height:504px;">
					<table>
						<tr>
							<td>
								<a href="#" onclick="doOperator('petty','1')">发起费用报销申请</a>
							</td>
						</tr>
						<tr>
							<td>
								<a href="#" onclick="doOperator('petty','2')">我的费用报销</a>
							</td>
						</tr>
						<tr>
							<td>
								<a href="#" onclick="doOperator('petty','3')">发起付款申请</a>
							</td>
						</tr>
						<tr>
							<td>
								<a href="#" onclick="doOperator('petty','4')">我的付款申请</a>
							</td>
						</tr>
<!-- 						<tr>
							<td>
								<a href="#" onclick="doOperator('report','1')">工时填写</a>
							</td>
						</tr>
 -->						<tr>
							<td>
								<a href="#" onclick="doOperator('quickMenu','1')">定制我的快捷菜单</a>
							</td>
						</tr>
						<tr>
							<td>
								<a href="#" onclick="doOperator('feedback','2')">我的意见反馈列表</a>
							</td>
						</tr>
						<tr>
							<td>
								<a href="#" onclick="doOperator('task','1')">我的待办任务</a>
							</td>
						</tr>
						<tr>
							<td>
								<a href="#" onclick="doOperator('task','2')">我的已办任务</a>
							</td>
						</tr>
						<tr>
							<td>
								<a href="#" onclick="doOperator('pswd','1')">密码、手机号设置</a>
							</td>
						</tr>
						<tr>
							<td>
								<a href="#" onclick="doOperator('pswd','2')">企业邮箱密码重置</a>
							</td>
						</tr>
						<tr><td></td></tr>
						<tr><td></td></tr>
						<tr><td></td></tr>
						<tr><td><br/><img src='<%=SkinUtil.getStyleFile("images/abf/ame.jpg",request)%>' border=0></img><br/>
							<a href="#" onclick="doOperator('qyh','1')">扫描关注AME+企业号</a></td></tr>
					</table>
				</div>
			</td>
			<td width="37%">
				<div style="width:100%;">
			        <div class="nui-toolbar" style="border-bottom:0;padding:0px;height: 25px;">
			        	<div style="float: left">&nbsp;&nbsp;公司公告</div><div style="float: right"><a href="#" onclick="doOperator('notice','1')">更多</a></div>
			        </div>
			    </div>
				<div id="noticeListId" class="nui-datagrid bpsDatagrid" style="margin-top:0px;width: 100%;height: 224px;" showPager="false" url="com.primeton.eos.ame_common.ameNotice.noticeList.biz.ext" dataField="ameNotice" pageSize="8">
				    <div property="columns">
				        <div field="noticetitle" renderer="onViewRenderer" headerAlign="center" align="left" width="190px">标题</div>
						<div field="orgname" width="60px" align="center" headerAlign="center">发布部门</div>
				    	<div field="noticedate" dateFormat="yyyy-MM-dd" headerAlign="center" align="center" width="55px">发布日期</div>
				    </div>
				</div>
			</td>
			<td width="49%">
				<div style="width:100%;">
			        <div class="nui-toolbar" style="border-bottom:0;padding:0px;height: 25px;">
			        	<div  style="float: left">&nbsp;&nbsp;我的待办任务列表</div><div style="float: right"><a href="#" onclick="doOperator('task','1')">更多</a></div>
			        </div>
			    </div>
				<div id="taskListId" class="nui-datagrid bpsDatagrid" style="margin-top:0px;width: 100%;height: 224px;" showPager="false" url="org.gocom.bps.wfclient.task.business.task.queryMyTasks.biz.ext" dataField="tasks" pageSize="8">
				    <div property="columns">
				        <div field="workItemName" renderer="onActionRenderer" headerAlign="center" align="left" width="100px">工作项名称</div>
				        <div field="processInstName" headerAlign="center" align="left" width="320px">流程实例名称</div>
				    </div>
				</div>
			</td>
		</tr>
		<tr>
			<td width="37%">
				<div style="width:100%;">
			        <div class="nui-toolbar" style="border-bottom:0;padding:0px;height: 25px;">
			        	<div style="float: left">&nbsp;&nbsp;规章制度</div><div style="float: right"><a href="#" onclick="doOperator('regular','1')">更多</a></div>
			        </div>
			    </div>
				<div id="regularListId" class="nui-datagrid bpsDatagrid" style="margin-top: 0px; width: 100%; height: 224px;" showPager="false"
					url="com.primeton.eos.ame_common.ameRegular.regularList.biz.ext" dataField="ameRegular" pageSize="8">
					<div property="columns">
						<div field="title" renderer="onViewRendererR" headerAlign="center" align="left" width="190px">制度名称</div>
						<div field="orgname" width="60px" align="center" headerAlign="center">发布部门</div>
						<div field="pubdate" dateFormat="yyyy-MM-dd" headerAlign="center" align="center" width="55px">发布日期</div>
					</div>
				</div>
			</td>
			<td width="49%" id="myCont" style="display: none">
				<div style="width:100%;">
			        <div class="nui-toolbar" style="border-bottom:0;padding:0px;height: 25px;">
			        	<div style="float: left">&nbsp;&nbsp;我的销售合同</div><div style="float: right"><a href="#" onclick="doOperator('cont','1')">更多</a></div>
			        </div>
			    </div>
				<div id="contListId" class="nui-datagrid bpsDatagrid" style="margin-top:0px;width: 100%;height: 224px;" 
					showPager="false" url="com.primeton.eos.ame_income.csContract.queryContractByIndex.biz.ext" dataField="csContracts" pageSize="8">
				    <div property="columns">
				        <div field="contnum" renderer="onCsContractRenderer" headerAlign="center" align="left" width="70">合同编号</div>
				        <div field="misCustinfo.custname" headerAlign="center" align="left" width="90">客户名称</div>
				        <div field="projectname" headerAlign="center" align="left" width="90">合同名称</div>
				        <div field="contsum" headerAlign="center" align="right" width="80" numberFormat="#,0">合同金额</div>
				        <div field="recognisedIncome" headerAlign="center" align="right" width="70" numberFormat="#,0">已确认收入</div>
				        <div field="recognizedRevenue" headerAlign="center" align="right" width="70" numberFormat="#,0">待确认收入</div>
				        <div field="gathermon" headerAlign="center" align="right" width="auto" numberFormat="#,0">已收款</div>
				        <!-- <div field="projectPriceSum" headerAlign="center" align="right" width="65px" dataType="currency">目前成本汇总</div> -->
				    </div>
				</div>
			</td>
			<td width="49%" id="myProject" style="display: none">
				<div style="width:100%;">
			        <div class="nui-toolbar" style="border-bottom:0;padding:0px;height: 25px;">
			        	<div style="float: left">&nbsp;&nbsp;我负责的项目</div><div style="float: right"><a href="#" onclick="doOperator('project','1')">更多</a></div>
			        </div>
			    </div>
				<div id="projectListId" class="nui-datagrid bpsDatagrid" style="margin-top:0px;width: 100%;height: 224px;" 
					showPager="false" url="com.primeton.rdmgr.project.benefitToBenefitProject.ConscientiousToProject.biz.ext" dataField="rdprojects" pageSize="8">
				    <div property="columns">
				        <div field="projectName" renderer="onViewRendererP" headerAlign="center" align="left" width="120">项目名称</div>
				        <div field="projectno" headerAlign="center" align="left" width="90">项目编号</div>
				        <div field="custname" headerAlign="center" align="left" width="110">所属客户</div>
				        <div field="pcostsum" headerAlign="center" align="right" width="75" summaryType="sum" renderer="numformat">预算成本</div>
				        <div field="pcostsum1" headerAlign="center" align="right" width="80" summaryType="sum" renderer="numformat">当前总成本</div>
				        <!-- <div field="projectStatus" headerAlign="center" align="right" width="70" renderer="dictGetStatus">内部状态</div>-->
				        <div field="outstatus" headerAlign="center" align="left" width="auto" renderer="dictGetOutStatus">外部状态</div> 
				    </div>
				</div>
			</td>
		</tr>
		<tr>
			<td colspan="2" width="51%" id="myProject1" style="display: none">
				<div style="width:100%;">
			        <div class="nui-toolbar" style="border-bottom:0;padding:0px;height: 25px;">
			        	<div style="float: left">&nbsp;&nbsp;我负责的项目</div><div style="float: right"><a href="#" onclick="doOperator('project','1')">更多</a></div>
			        </div>
			    </div>
				<div id="projectListId1" class="nui-datagrid bpsDatagrid" style="margin-top:0px;width: 100%;height: 224px;" 
					showPager="false" url="com.primeton.rdmgr.project.benefitToBenefitProject.ConscientiousToProject.biz.ext" dataField="rdprojects" pageSize="8">
				    <div property="columns">
				        <div field="projectName" renderer="onViewRendererP1" headerAlign="center" align="left" width="120">项目名称</div>
				        <div field="projectno" headerAlign="center" align="left" width="90">项目编号</div>
				        <div field="custjc" headerAlign="center" align="left" width="110">所属客户</div>
				        <div field="pcostsum" headerAlign="center" align="right" width="75" renderer="numformat">预算成本</div>
				        <div field="pcostsum1" headerAlign="center" align="right" width="80" renderer="numformat">当前总成本</div>
				       <!--  <div field="projectStatus" headerAlign="center" align="right" width="70" renderer="dictGetStatus">内部状态</div>-->
				        <div field="outstatus" headerAlign="center" align="left" width="auto" renderer="dictGetOutStatus">外部状态</div> 
				    </div>
				</div>
			</td>
		</tr>
	</table>
	<script>
		nui.parse();
		init();
		
  		var pstatus  = '<%=pstatus %>';
		if(pstatus==2){
		  	tips();
		}
		function init(){
			nui.ajax({
    			url:"com.primeton.eos.ame_common.sendMail.checkMeIsSale.biz.ext",
    			data: {},
    			type:"post",
    			contentType:"text/json",
    			success:function(o){
    				if(o.isSale == true){//当前登录用户是销售，那么显示我的销售合同
    					document.getElementById("myCont").style.display = "";
    					//还得让grid去load
    					nui.get("contListId").sortBy("contreg","desc");
    					//nui.get("contListId").sortBy("contnum","asc");
    					nui.get("contListId").load();
    					//判断是不是既是销售又是项目经理
    					nui.ajax({
			    			url:"com.primeton.eos.ame_common.sendMail.checkMeIsManager.biz.ext",
			    			data: {},
			    			type:"post",
			    			contentType:"text/json",
			    			success:function(o){
			    				if(o.isManager == true){//当前登录用户是既是销售又是项目经理，那么在下面一行显示我负责的项目
			    					document.getElementById("myProject1").style.display = "";
			    					nui.get("projectListId1").load({"criteria":{"_expr":[{"_property": "outstatus","_value": "5","_op": "<>"}]}}); 
			    				}else{
			    					document.getElementById("myProject1").style.display = "none";
			    				}
			    			}
			    		});
    				}else{
    					document.getElementById("myCont").style.display = "none";
    					//判断用户不是销售的情况下是否是项目经理
    					nui.ajax({
			    			url:"com.primeton.eos.ame_common.sendMail.checkMeIsManager.biz.ext",
			    			data: {},
			    			type:"post",
			    			contentType:"text/json",
			    			success:function(o){
			    				if(o.isManager == true){//当前登录用户是项目经理，那么显示我负责的项目
			    					document.getElementById("myProject").style.display = "";
			    					nui.get("projectListId").load({"criteria":{"_expr":[{"_property": "outstatus","_value": "5","_op": "<>"}]}}); 
			    				}else{
			    					document.getElementById("myProject").style.display = "none";
			    				}
			    			}
			    		});
    				}
    			}
    		}),
			nui.get("taskListId").load();
			var nowdate = new Date();
			nui.get("noticeListId").load({"criteria":{"_expr":[{"_property":"noticestate", "_value":"1"},{"_property":"noticedate","_value":nowdate,"_op":"<="}]}});
			nui.get("noticeListId").sortBy("noticedate","desc");
			var nowdateR = new Date();
			nui.get("regularListId").load({"criteria":{"_expr":[{"_property":"pubstate", "_value":"1"},{"_property":"pubdate","_value":nowdateR,"_op":"<="}]}});
			nui.get("regularListId").sortBy("pubdate","desc");
		}



		function tips(){
			nui.confirm("密码强度不够，请修改密码？", "提示",
	            function (action) {
	                if (action == "ok") {
	                   doOperator('pswd','1');
	                } else {
	                   
	                }
	            }
	        );
		}

		function dictGetStatus(e){
			return nui.getDictText('MIS_PROJSTATUS',e.value);
		}
		function dictGetOutStatus(e){
			return nui.getDictText('MIS_PROJOUTSTATUS',e.value);
		}

		function onActionRenderer(e){
			var s = '<a class="dgBtn" href="javascript:doOperate(' + e.rowIndex + ', false)">' + e.value + '</a> ';
            return s;
		}
		function onViewRenderer(e){
			var s = '<a class="dgBtn" href="javascript:doView(' + e.rowIndex + ')">' + e.value + '</a> ';
            return s;
		}
		function doView(rowIndex){
			var row = nui.get("noticeListId").getRow(rowIndex);
			var url = "<%=request.getContextPath()%>/ame_common/notice/noticeShow.jsp?id=" + row.noticeid;
			var iWidth=1000; //弹出窗口的宽度;
			var iHeight=500; //弹出窗口的高度;
			var iTop = (window.screen.availHeight-30-iHeight)/2; //获得窗口的垂直位置;
			var iLeft = (window.screen.availWidth-10-iWidth)/2; //获得窗口的水平位置;
			window.open(url, "公告详细信息", "height="+iHeight+", width="+iWidth+",top="+iTop+",left="+iLeft+",resizable=yes");
		}
		<%--  添加两个新方法，克隆onViewRenderer()和doView()提供给regular规章制度栏使用 --%>
		function onViewRendererR(e){
			var s = '<a class="dgBtn" href="javascript:doViewR(' + e.rowIndex + ')">' + e.value + '</a> ';
            return s;
		}
		function doViewR(rowIndex){
			var row = nui.get("regularListId").getRow(rowIndex);
			var url = "<%=request.getContextPath()%>/ame_common/regular/regularShow.jsp?id=" + row.regularid;
			var iWidth=1000; //弹出窗口的宽度;
			var iHeight=500; //弹出窗口的高度;
			var iTop = (window.screen.availHeight-30-iHeight)/2; //获得窗口的垂直位置;
			var iLeft = (window.screen.availWidth-10-iWidth)/2; //获得窗口的水平位置;
			window.open(url, "规章制度详细信息", "height="+iHeight+", width="+iWidth+",top="+iTop+",left="+iLeft+",resizable=yes");
		}
		 
		 //添加两个新方法，克隆onViewRenderer()和doView()提供给project我负责的项目使用
		function onViewRendererP(e){
			var s = '<a class="dgBtn" href="javascript:doViewP(' + e.rowIndex + ')">' + e.value + '</a> ';
            return s;
		}
		function doViewP(rowIndex){
			var row = nui.get("projectListId").getRow(rowIndex);
			var url = "<%=request.getContextPath()%>/project/benefitToBenefitProject/projectMessage.jsp?projid=" + row.projectId;
			var iWidth=1000; //弹出窗口的宽度;
			var iHeight=500; //弹出窗口的高度;
			var iTop = (window.screen.availHeight-30-iHeight)/2; //获得窗口的垂直位置;
			var iLeft = (window.screen.availWidth-10-iWidth)/2; //获得窗口的水平位置;
			window.open(url, "规章制度详细信息", "fullscreen=1");
		} 
		 //添加两个新方法，克隆onViewRenderer()和doView()提供给project我负责的项目使用
		function onViewRendererP1(e){
			var s = '<a class="dgBtn" href="javascript:doViewP1(' + e.rowIndex + ')">' + e.value + '</a> ';
            return s;
		}
		
		function doViewP1(rowIndex){
			var row = nui.get("projectListId1").getRow(rowIndex);
			var url = "<%=request.getContextPath()%>/project/benefitToBenefitProject/projectMessage.jsp?projid=" + row.projectId;
			var iWidth=1000; //弹出窗口的宽度;
			var iHeight=500; //弹出窗口的高度;
			var iTop = (window.screen.availHeight-30-iHeight)/2; //获得窗口的垂直位置;
			var iLeft = (window.screen.availWidth-10-iWidth)/2; //获得窗口的水平位置;
			window.open(url, "规章制度详细信息", "fullscreen=1");
		} 
		//执行操作
	    function doOperate(rowIndex, isShowDetail) {
	    	var row = nui.get("taskListId").getRow(rowIndex);
	    	var url = "<%=request.getContextPath()%>/bps/wfclient/task/dispatchTaskExecute.jsp?workItemID="+row.workItemID;
	    	var title = "工作项执行"+"-"+row.workItemName;
	    	var width=1000;
		    nui.open({
				url: url,
				title: title,
				width: width,
				height: 550,
				onload: function () {
					var iframe = this.getIFrameEl();
					if(iframe.contentWindow.initData) {
						alert("111111");
						iframe.contentWindow.initData(row, "self", isShowDetail);
					}	
				},
				ondestroy: function (action){
					if (action == "ok") {
						nui.get("taskListId").load();
					} else if (action == "execute") {  
						doOperate(rowIndex, false);					
					}
				}
			});
	    }
		function doOperator(exptype,operatype){
			if(exptype == "petty" && operatype == "1"){
				window.location.href = "<%=request.getContextPath() %>/ame_fee/ReimbApply/creatReimbProcess.jsp";
			}
			if(exptype == "petty" && operatype == "2"){
				window.location.href = "<%=request.getContextPath() %>/ame_fee/myExpenseReimbursement/myFee.jsp";
			}
			if(exptype == "petty" && operatype == "3"){
				window.location.href = "<%=request.getContextPath() %>/ame_fee/PaymentApply/paymentCreateApply.jsp";
			}
			if(exptype == "petty" && operatype == "4"){
				window.location.href = "<%=request.getContextPath() %>/ame_fee/PaymentApply/queryPayApply.jsp?flag=1";
			}
			/* if(exptype == "report" && operatype == "1"){
				window.location.href = "com.primeton.rdmgr.labor.laborReport.flow";
			}
			if(exptype == "report" && operatype == "2"){
				window.location.href = "com.primeton.rdmgr.labor.LaborQuery.flow";
			} */
			if(exptype == "gzzd" && operatype == "8"){
				window.location.href = "<%=request.getContextPath() %>/ame_permanage/ame_leave/yearEmpvac.jsp";
			}
			if(exptype == "feedback" && operatype == "1"){
				window.location.href = "<%=request.getContextPath() %>/ame_feedback/addFeedback.jsp";
			}
			if(exptype == "feedback" && operatype == "2"){
				window.location.href = "<%=request.getContextPath() %>/ame_feedback/showMyFeedbackList.jsp";
			}
			if(exptype == "task" && operatype == "1"){
				window.location.href = "<%=request.getContextPath() %>/bps/wfclient/task/taskList.jsp?taskType=self";
			}
			if(exptype == "task" && operatype == "2"){
				window.location.href = "<%=request.getContextPath() %>/bps/wfclient/task/taskList.jsp?taskType=finishedSelf";
			}
			if(exptype == "notice" && operatype == "1"){
				window.location.href = "<%=request.getContextPath() %>/ame_common/notice/noticeMyList.jsp";
			}
			if(exptype == "quickMenu" && operatype == "1"){
				window.location.href = "org.gocom.abframe.rights.menu.OpershortcutManager.flow";
			}
			if(exptype == "pswd" && operatype == "1"){
				window.location.href = "org.gocom.abframe.auth.PasswordChange.flow";
			}
			if(exptype == "pswd" && operatype == "2"){
				nui.open({
		            url: "<%=request.getContextPath() %>/abframe/auth/password/maiPassword_change.jsp",
		            title: "重置企业邮箱密码", 
		            width: 630,
		            height: 165
	        	}).show("center",100);
			}
			if(exptype == "qyh" && operatype == "1"){
				nui.open({
		            url: "<%=request.getContextPath() %>/ame_common/notice/noticeShow.jsp?id=241",
		            title: "微信与Ame+系统绑定操作指引", 
		            width: 850,
		            height: 500
	        	}).show("center",20);
			}
			if(exptype == "regular" && operatype == "1"){
				window.location.href = "<%=request.getContextPath() %>/ame_common/regular/regularMyList.jsp";
			}
			//更多销售合同
			if(exptype == "cont" && operatype == "1"){
				window.location.href = "<%=request.getContextPath() %>/ame_income/csContract/csContractList.jsp";
			}
			//更多我负责的项目
			if(exptype == "project" && operatype == "1"){
				window.location.href = "<%=request.getContextPath() %>/project/benefitToBenefitProject/ConscientiousToProject.jsp";
			}
		}
		
		function numformat(e){
			if(e.value==null || e.value==""){
				return 0;
			}else{
				var num = (e.value || 0).toString(), result = '';
				if(num){
					if(num != 0){
						var num2 = num.split(".");
						num = num2[0];
						while (num.length > 3) {
							result = ',' + num.slice(-3) + result;
							num = num.slice(0, num.length - 3);
						}
						if (num) { 
							result = num + result; 
						}
					}else{
						result = 0;
					}
				}else{
					result = 0;
				}
				return result;
			}
		}
		
		//查看销售合同
		function onCsContractRenderer(e) {
			var s = '<a class="dgBtn" href="javascript: doViewCsContract(' + e.record.contractid + ')">' + e.value + '</a> ';
            return s;
		}
		function doViewCsContract(cscontractid){
			window.open("<%=request.getContextPath() %>/contract/contract/contractView.jsp?contractid="+cscontractid,"csContractView","height=600,width=1000,top=0,left=0,toolbar=no,menubar=no,scrollbars=yes,resizable=yes,location=no,status=no");
		}
	</script>
</body>
</html>
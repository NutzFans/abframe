<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@page import="com.eos.data.datacontext.UserObject"%>
<%
	UserObject user = (UserObject) session.getAttribute("userObject");
	String username = user.getUserName();
	String userid = user.getUserId();
	String orgid = user.getUserOrgId();
	String orgname= user.getUserOrgName();
	String contextPath=request.getContextPath();
 %>
<html>
<!--
  - Author(s): wusiru
  - Date: 2017-08-14 11:15:47
  - Description:
-->
<head>
<title>会议日程</title>
    <meta http-equiv="content-type" content="text/html; charset=UTF-8" />

    <!-- 引入表单框架jsp -->
	<%@include file="/common/common.jsp"%>
	<meta http-equiv="content-type" content="text/html; charset=UTF-8" />
	<script src="<%= contextPath %>/common/nui/nui.js" type="text/javascript"></script>

	<link rel="stylesheet" href="<%=contextPath %>/ame_dailyoffice/SealGovern/hygl/hysq/hysp.css" type="text/css" />
    <script src="<%=contextPath %>/ame_dailyoffice/SealGovern/hygl/hysq/hysp.js" type="text/javascript"></script>
	<script src="<%=contextPath %>/ame_dailyoffice/SealGovern/hygl/hysq/selectCh.js" type="text/javascript"></script>
</head>
<body>
<div class="nui-fit">
	<div class="mini-panel" title="会议预约" style="width: auto">
	<!-- 提示信息展示 -->
	<jsp:include page="/ame_common/ameFlowOperTips/ameFlowOperTipsInfo.jsp"/>
		<div class="nui-toolbar">
				<form id="hysqSealUse">
					<!--隐藏域-->
					<!-- hidden域 -->
					<input class="nui-hidden" name="hysq.hysqid" /> <!-- 会议申请id -->
					<input class="nui-hidden" name="hysq.tzfs" /><!-- 通知方式 -->
					<input class="nui-hidden" name="hysq.processinstid" />
					<input class="nui-hidden" name="hysq.spzt" /> <!-- 审批状态 -->
					<input class="nui-hidden" name="hysq.fqrjgid" /> <!-- 发起人机构id -->
					<input class="nui-hidden" name="hysq.hycys[0].hycyid" /> <!-- 会议参与id -->
					<input class="nui-hidden" name="hysq.hycys[0].cyzid" /> <!-- 参会人员id -->
					<input class="nui-hidden" name="hysq.fqrid" /> <!-- 发起人机构id -->
					
					<!-- zhangyuan 2018-4-9  新增会议申请时间input域 -->
					<input class="nui-hidden" name="hysq.hysqsj" />
					
					<div style="padding:5px;">
						<table style="table-layout:fixed;" id="table_file">
							<tr>
								<td align="right" style="width:120px;">会议主题：</td>
								<td style="width:200px;"  colspan="5">
									<input required="true" requiredErrorText="会议主题不能为空" class="nui-textbox" name="hysq.hyzt" 
										    	vtype="maxLength:300" maxLengthErrorText="会议主题不允许超过300字">
								</td>
							</tr>
							<tr>
								<td align="right" style="width:120px;">会议日期：</td>
								<td style="width:200px;">
									<input class="nui-datepicker" ondrawdate="onDrawDate" required="true" requiredErrorText="会议日期不能为空" onfocus="this.blur()" name="hysq.hyrq" onvaluechanged="validHySj()">
								</td>
								<td align="right" style="width:120px">起止时间：</td>
								<td style="width:200px;">
									<input style="width: 45%;float: left;" class="nui-timespinner"  format="H:mm" name="hysq.hykssj" id="hykssj" required="true" requiredErrorText="会议开始时间不能为空" onvalidation="validTime(e)"/>-
									<input style="width: 45%;float: right;" class="nui-timespinner" format="H:mm" name="hysq.hyjssj" required="true" requiredErrorText="会议结束时间不能为空" onvalidation="validJsTime(e)"/>
								</td>
							</tr>
							<tr>	
								<td align="right" style="width:120px">会议类型：</td>
								<td class = "asLabel">
									<input style="width:100%;" class="nui-dictcombobox" value="BMHY" name="hysq.hylx" dictTypeId="HYGL_HYSQ_HYLX" />
								</td>
								<td align="right" style="width:120px">会议室：</td>
								<td style="width:200px;">
									<input style="width:100%;" class="nui-dictcombobox" value="BMHY" name="hysq.hysid"
										 dataField="hysxxList" textField="hysmc" valueField="hysid" url="com.primeton.eos.ame_dailyoffice.Hysxx.queryHysxxList.biz.ext" 
										 required="true" requiredErrorText="会议室不能为空" />
								</td>
							</tr>
							<tr>	
								<td align="right" style="width:120px">主持人：</td>
								<td colspan="5" class = "asLabel">
									<input class="nui-buttonedit" required="true" name="hysq.zcrid" onbuttonclick="selectOmEmployee" allowInput="false" requiredErrorText="主持人不能为空">
								</td>
							</tr>
							<tr>	
								<td align="right" style="width:120px">参会人员：</td>
								<td colspan="5" class = "asLabel">
								<input name="hysq.chryid" id="chryid" class="nui-hidden" />
			                    <input id="chryid1" class="nui-textboxlist"  required="true" requiredErrorText="参会人员不能为空" name="hysq.chryid" searchField="name"   style="width:520px;"
									url="com.primeton.eos.ame_budget.budgetOrgManager.queryUseridByName.biz.ext" value="" text=""
									textField="empname" valueField="userid"  onvaluechanged="getAdminname"/>
	                			</td>
								
							</tr>
							<tr>	
								<td align="right" style="width:120px">外部人员：</td>
								<td colspan="5" class = "asLabel">
									<input class="nui-textbox" name="hysq.wbry" maxlength = "100">
								</td>
							</tr>
							<tr>	
								<td align="right" style="width:120px">会议通知方式：</td>
								<td colspan="5" class = "asLabel">
									<input  class="nui-dictcombobox" dictTypeId="AME_NOTICETYPE" multiSelect="true"  id="tzfs" name="hysq.tzfs" maxlength = "100">
								</td>
							</tr>
							<tr>	
								<td align="right" style="width:120px">是否会议前提醒：</td>
								<td  class = "asLabel">
									<input  class="nui-dictcombobox" dictTypeId="MIS_YN"  name="hysq.sfhyqtx" id="sfhyqtx"  onvaluechanged="sfhyqtxchange(this)"maxlength = "100">
								</td>
								
								<td	class="hyqtx" align="right" style="width:120px ;display:none;">会议前：</td>
								<td class="hyqtx1" style="width:120px;display:none;">
									<input  class="nui-dictcombobox" dictTypeId="AME_HYSTQFZ" name="hysq.tqfz" id="tqfz" required="true"style="width:60px;">
									<span style="width:60px;">分钟提醒。</span>
								</td>
								
					
							
							
							
							<!-- 
					 		<tr class="cfzqTr" style="display:none;">	
								<td align="right" style="width:120px">重复周期：</td>
								<td colspan="5" class = "asLabel">
									<div name="zqlx" class="nui-radiobuttonlist" repeatItems="4" repeatLayout="table" textField="text" valueField="id" url="zqhyJson.txt" required="true" requiredErrorText="周期类型不能为空">
  									</div>
								</td>
							</tr>  -->
					
								<tr class="zqhyTr">	
								<td align="right" style="width:120px" class="opa">周期会议：</td>
								<td colspan="5" class = "asLabel">
									<input class="nui-checkbox" text="周期会议" name="sfzq" onvaluechanged="zqhychange(this)">
								</td>
							
								</tr>
								<tr class="cfzqTr" style="display:none;">	
								<td align="right" style="width:120px;">开始日期：</td>
								<td style="width:200px;">
									<input class="nui-datepicker"  ondrawdate="onDrawDate" required="true" onfocus="this.blur()" name="zqkssj" requiredErrorText="会议开始日期不能为空" onvalidation="validDate(e)">
								</td>
								<td align="right" style="width:120px;">结束日期：</td>
								<td style="width:200px;">
									<input class="nui-datepicker"  ondrawdate="onDrawDate" required="true" onfocus="this.blur()" name="zqjssj" requiredErrorText="会议开始日期不能为空" onvalidation="validDate(e)">
								</td>
								</tr>
								<tr class="cfzqTr" style="display:none;">
									<td align="right" style="width:120px" rowspan="4">重复周期：</td>
									<td align="left" style="170px;border: #F0F9FE solid 1px">
										<div class="nui-radiobuttonlist"  id="action_day" repeatItems="1"  textField="text" valueField="id"
										     data="[{'id': 'day','text': '每日'}]" onvaluechanged="triggerChanged" style="width:50px;margin-left: 10px;">
										</div>
									</td>
									<td colspan="3" style="border: #F0F9FE solid 1px"></td>
								</tr>
								<tr class="cfzqTr" style="display:none;">
									<td align="left" style="170px;border: #F0F9FE solid 1px">
										<div class="nui-radiobuttonlist"  id="action_week" repeatItems="1"  textField="text" valueField="id"
										     data="[{'id': 'week','text': '每周'}]" onvaluechanged="triggerChanged" value="1" style="width:50px;margin-left: 10px;">
										</div>
									</td>
									<td align="left" colspan="3" style="border: #F0F9FE solid 1px">
										<div class="nui-combobox"  id="week"  textField="text" valueField="id" showNullItem="true" 
										allowInput="false" multiSelect="true" style="width: 100%;" dataField="dictweek" value="1">
										</div>
									</td>
								</tr>
								<tr class="cfzqTr" style="display:none;">
									<td align="left" style="170px;border: #F0F9FE solid 1px">
										<div class="nui-radiobuttonlist"  id="action_twoweek" repeatItems="1"  textField="text" valueField="id"
										     data="[{'id': 'week2','text': '每两周'}]" onvaluechanged="triggerChanged" value="1" style="width:100px;margin-left: 10px;">
										</div>
									</td>
									<td align="left" colspan="3" style="border: #F0F9FE solid 1px">
										<div class="nui-combobox"  id="week2"  textField="text" valueField="id" showNullItem="true" 
										allowInput="false" multiSelect="true" style="width: 100%;" dataField="dictweek" value="1">
										</div>
									</td>
								</tr>
								<tr class="cfzqTr" style="display:none;">
									<td align="left" style="170px;border: #F0F9FE solid 1px">
										<div class="nui-radiobuttonlist"  id="action_month" repeatItems="1"  textField="text" valueField="id"
										     data="[{'id': 'month','text': '每月'}]" onvaluechanged="triggerChanged" style="width:50px;margin-left: 10px;">
										</div>
									</td>
									<td colspan="3">
										<div id="month_type" disabled=true>
											<table border="0" width="100%" id="table7" cellspacing="0" cellpadding="0"  style="border: #F0F9FE solid 1px">
												<tr  style="border: #F0F9FE solid 1px">
													<td  style="border: #F0F9FE solid 1px">
														
														<input  type="radio" name="month" id="month1"  style="width: 5%;"  onchange="changeTrime(1)">
														<div class="nui-combobox"  id="month_day"  textField="text" valueField="id" showNullItem="true" 
															allowInput="false"  style="width: 15%;" dataField="dictday" value="1">
														</div>
														
													</td>
												</tr>
												<tr  style="border: #F0F9FE solid 1px">
													<td  style="border: #F0F9FE solid 1px">
														<input type="radio" name="month" id="month2" style="width: 5%;"   onchange="changeTrime(2)">
														<div class="nui-combobox"  id="month_weekOrder"  textField="text" valueField="id" showNullItem="true" 
															allowInput="false"  style="width: 20%;" dataField="dictm" value="1">
														</div>
														<div class="nui-combobox"  id="month_week"  textField="text" valueField="id" showNullItem="true" 
															allowInput="false" style="width: 20%;" dataField="dictweek" value="1" >
														</div>
													</td>
												</tr>
											</table>
										</div>
									</td>
								</tr>
						
							<!-- <tr>	
								<td align="right" style="width:120px">参会人数：</td>
								<td colspan="5" class = "asLabel">
									<input class="nui-textbox" name="hysq.chrs" vtype = "int" intErrorText="请输入整数">
								</td>
							</tr> -->
							<tr>	
								<td align="right" style="width:205px">会议议程安排（面向参会者）：</td>
								<td colspan="5" class = "asLabel">
									<input class="nui-textarea height100" name="hysq.hyycap"  maxlength = "1300"/>
								</td>
							</tr>
							<tr>	
								<td align="right" style="width:205px">会议准备说明（面向会议室管理者）：</td>
								<td colspan="5" class = "asLabel">
									<input class="nui-textarea height100" name="hysq.hyzbsm"  maxlength = "1300"/>
								</td>
							</tr>
							<tr>	
								<td align="right" style="width:120px">发起人：</td>
								<td class = "asLabel">
									<input class="nui-textbox" name="hysq.fqrmc" id="hysq.fqrmc" allowInput="false">
								</td>
								<td align="right" style="width:120px">发起人部门：</td>
								<td style="width:200px;">
									<input class="nui-textbox" name="hysq.fqrjgmc" id="hysq.fqrmc" allowInput="false">
								</td>
							</tr>
								
						</table>
					</div>
				</form>
				</div>
		</div>
	</div>
	<div style="text-align:center;padding:10px;" class="nui-toolbar bottonCon">
		<a class="nui-button" onclick="onOk('0');" name="saveSealUse"style="width:80px;margin-right:20px;">暂时保存</a>
		<a class="nui-button" onclick="onOk('1');" name="submitSealUse"style="width:80px;margin-right:20px;">提交</a>
		<a class="nui-button" onclick="CloseWindow('cancle');" style="width:80px;margin-right:20px;">关闭</a>
	</div>
<script type="text/javascript">
    nui.parse();
    var userid='<%=userid %>';
    var username='<%=username %>';
    var orgid = "";
	var orgname = "";
	var org_data = queryOrgDataByUserid(userid);
	if(org_data){
		orgid = org_data.orgid;
		orgname = org_data.orgname;
	}
    var contextPath = '<%=contextPath %>'
    var form = new nui.Form("hysqSealUse");
    var hysqid='<%=request.getParameter("hysqid") %>';
    var processInstId='<%=request.getParameter("processInstID") %>';
    var workItemID='<%=request.getParameter("workItemID") %>';
    var type='<%=request.getParameter("type") %>';
		var group;
    	var dictweek = [{id: "1",text: "星期日"},{id: "2",text: "星期一"},{id: "3",text: "星期二"},{id: "4",text: "星期三"},{id: "5",text: "星期四"},{id: "6",text: "星期五"},{id: "7",text: "星期六"}];
    	var dictm = [{id: "1",text: "第1个"},{id: "2",text: "第2个"},{id: "3",text: "第3个"},{id: "4",text: "第4个"},{id: "-1",text: "最后1个"}];
    	var dictmonth = [{id: "1",text: "1月"},{id: "2",text: "2月"},{id: "3",text: "3月"},{id: "4",text: "4月"},{id: "5",text: "5月"},{id: "6",text: "6月"},{id: "7",text: "7月"},{id: "8",text: "8月"},{id: "9",text: "9月"},{id: "10",text: "10月"},{id: "11",text: "11月"},{id: "12",text: "12月"}];
    	var dictday = [{id: "1",text: "1日"},
	               		   {id: "2",text: "2日"},
	               		   {id: "3",text: "3日"},
	               		   {id: "4",text: "4日"},
	               		   {id: "5",text: "5日"},
	               		   {id: "6",text: "6日"},
	               		   {id: "7",text: "7日"},
	               		   {id: "8",text: "8日"},
	               		   {id: "9",text: "9日"},
	               		   {id: "10",text: "10日"},
	               		   {id: "11",text: "11日"},
	               		   {id: "12",text: "12日"},
	               		   {id: "13",text: "13日"},
	               		   {id: "14",text: "14日"},
	               		   {id: "15",text: "15日"},
	               		   {id: "16",text: "16日"},
	               		   {id: "17",text: "17日"},
	               		   {id: "18",text: "18日"},
	               		   {id: "19",text: "19日"},
	               		   {id: "20",text: "20日"},
	               		   {id: "21",text: "21日"},
	               		   {id: "22",text: "22日"},
	               		   {id: "23",text: "23日"},
	               		   {id: "24",text: "24日"},
	               		   {id: "25",text: "25日"},
	               		   {id: "26",text: "26日"},
	               		   {id: "27",text: "27日"},
	               		   {id: "28",text: "28日"},
	               		   {id: "29",text: "29日"},
	               		   {id: "30",text: "30日"},
	               		   {id: "31",text: "31日"}];
    	nui.get("week").setData(dictweek);
    	nui.get("week2").setData(dictweek);
    	
    	nui.get("month_day").setData(dictday);
    	nui.get("month_weekOrder").setData(dictm);
    	nui.get("month_week").setData(dictweek);
    	
    	document.getElementById("month1").click();
    	nui.get("action_day").setValue("day");
    	var init = {"value":"day"};
    	triggerChanged(init);
    	
    	
    /**
	 * @author zhengquan
	 * @time 2019年4月11日18点39分
	 * @description 通过userid获取部门信息
	 * @param userid
	 * @returns
	 */
	function queryOrgDataByUserid(userid){
		var org_data = null;
		if(userid){
			var json = {userid:userid};
			nui.ajax({
	            url: "com.primeton.eos.ame_dailyoffice.sealCommon.queryOrgData.biz.ext",
	            data: json,
	            type: 'POST',
	            cache: false,
	            async:false,
	            contentType: 'text/json',
	            success: function (text) {
	            	org_data = text.orgdata;
	            },
	            error: function (jqXHR, textStatus, errorThrown) {
	                alert(jqXHR.responseText);
	            }
	        });
		}
		return org_data;
	}
     //参会人员
	    function getAdminname(){
	    	var adminname = nui.get("chryid1").getText();
	    	nui.get("chryid").setValue(adminname);
	    }
	    
	    
	    
	    
	    
	    	function changeTrime(d){
    		if(d==1){
    			nui.get("month_day").setReadOnly(false);
    			nui.get("month_day").setRequired(true);
    			nui.get("month_weekOrder").setReadOnly(true);
    			nui.get("month_weekOrder").setRequired(false);
    			nui.get("month_week").setReadOnly(true);
    			nui.get("month_week").setRequired(false);
    		}else if(d==2){
    			nui.get("month_day").setReadOnly(true);
    			nui.get("month_day").setRequired(false);
    			nui.get("month_weekOrder").setReadOnly(false);
    			nui.get("month_weekOrder").setRequired(true);
    			nui.get("month_week").setReadOnly(false);
    			nui.get("month_week").setRequired(true);
    		}
    	}
    	
    	function typeChanged(){
    		var triggerType = nui.get("triggerType").getValue();
			var trTime = document.getElementById("trTime");
			var trCircle = document.getElementById("trCircle");
			switch(triggerType) {
				case "1" :
					if(trTime.style.display != "") {
						trTime.style.display = "";
					}
					trCircle.style.display = "none";
					break;
				case "2" :
					trTime.style.display = "none";
					if(trCircle.style.display != "") {
						trCircle.style.display = "";
					}
					break;
			}
    	}
    
    	
    	function triggerChanged(e){
    		if(e.value=="day"){
    			nui.get("week").setReadOnly(true);
    			nui.get("week").setRequired(false);
    			nui.get("week2").setReadOnly(true);
    			nui.get("week2").setRequired(false);
    			nui.get("month_day").setReadOnly(true);
    			nui.get("month_day").setRequired(false);
    			nui.get("month_weekOrder").setReadOnly(true);
    			nui.get("month_weekOrder").setRequired(false);
    			nui.get("month_week").setReadOnly(true);
    			nui.get("month_week").setRequired(false);
    			$("#month1").attr("disabled", true);
    			$("#month2").attr("disabled", true);
    			
    			nui.get("action_twoweek").setValue("");
    			nui.get("action_week").setValue("");
    			nui.get("action_month").setValue("");
    		}else if(e.value=="week"){
    			nui.get("week").setReadOnly(false);
    			nui.get("week").setRequired(true);
    			nui.get("week2").setReadOnly(true);
    			nui.get("week2").setRequired(false);
    			nui.get("month_day").setReadOnly(true);
    			nui.get("month_day").setRequired(false);
    			nui.get("month_weekOrder").setReadOnly(true);
    			nui.get("month_weekOrder").setRequired(false);
    			nui.get("month_week").setReadOnly(true);
    			nui.get("month_week").setRequired(false);
    			
    			$("#month1").attr("disabled", true);
    			$("#month2").attr("disabled", true);
    			
    			nui.get("action_day").setValue("");
    			nui.get("action_month").setValue("");
    			nui.get("action_twoweek").setValue("");
    			
    		}else if(e.value=="week2"){
    			nui.get("week2").setReadOnly(false);
    			nui.get("week2").setRequired(true);
    			nui.get("week").setReadOnly(true);
    			nui.get("week").setRequired(false);
    			nui.get("month_day").setReadOnly(true);
    			nui.get("month_day").setRequired(false);
    			nui.get("month_weekOrder").setReadOnly(true);
    			nui.get("month_weekOrder").setRequired(false);
    			nui.get("month_week").setReadOnly(true);
    			nui.get("month_week").setRequired(false);
    			
    			$("#month1").attr("disabled", true);
    			$("#month2").attr("disabled", true);
    			
    			nui.get("action_day").setValue("");
    			nui.get("action_month").setValue("");
    			nui.get("action_week").setValue("");
    		}
    		
    		else if(e.value=="month"){
    			nui.get("week").setReadOnly(true);
    			nui.get("week").setRequired(false);
    			nui.get("week2").setReadOnly(true);
    			nui.get("week2").setRequired(false);
    			nui.get("month_day").setReadOnly(false);
    			nui.get("month_day").setRequired(true);
    			nui.get("month_weekOrder").setReadOnly(false);
    			nui.get("month_weekOrder").setRequired(true);
    			nui.get("month_week").setReadOnly(false);
    			nui.get("month_week").setRequired(true);
    			
				var radios = document.getElementsByName("month");
				for(var i=0;i<radios.length;i++){
					if(radios[i].checked==true){
						if(i==0){
							changeTrime(1);
						}else{
							changeTrime(2);
						}
					}
				}
    			$("#month1").attr("disabled", false);
    			$("#month2").attr("disabled", false);
    		    nui.get("action_twoweek").setValue("");
    			nui.get("action_day").setValue("");
    			nui.get("action_week").setValue("");
    		}/* else if(e.value=="year"){
    			nui.get("week").setReadOnly(true);
    			nui.get("week").setRequired(false);
    			nui.get("month_day").setReadOnly(true);
    			nui.get("month_day").setRequired(false);
    			nui.get("month_weekOrder").setReadOnly(true);
    			nui.get("month_weekOrder").setRequired(false);
    			nui.get("month_week").setReadOnly(true);
    			nui.get("month_week").setRequired(false);
				for(var i=0;i<radios.length;i++){
					if(radios[i].checked==true){
						if(i==0){
							changeTrime(3);
						}else{
							changeTrime(4);
						}
					}
				}
    			$("#month1").attr("disabled", true);
    			$("#month2").attr("disabled", true);
    			nui.get("action_day").setValue("");
    			nui.get("action_week").setValue("");
    			nui.get("action_month").setValue("");
    		} */
    	}
        
		function changeIsTime(){
			var isNoEndTime = nui.get("isNoEndTime").getValue();
			if(isNoEndTime){
				nui.get("endTime").setReadOnly(true);
				nui.get("endTime").setRequired(false);
			}else{
				nui.get("endTime").setReadOnly(false);
				nui.get("endTime").setRequired(true);
			}
		}
					        
		//日期格式化
        var formatDate = function (date) {
		    var y = date.getFullYear();
		    return y ;
		}
	    
	
	    
	    
	    

</script>
</body>
</html>
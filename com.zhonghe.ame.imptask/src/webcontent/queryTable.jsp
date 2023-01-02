<%@page import="com.eos.data.datacontext.UserObject"%>
<%@page import="com.primeton.bps.web.control.I18nUtil"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@include file="/common/common.jsp"%>
<html>
<!-- 
  - Author(s): yaoyi
  - Date: 2017-02-27 10:10:45
  - Description:
-->
<head>
<title>重点任务报表</title>
	<meta http-equiv="content-type" content="text/html; charset=UTF-8" />
	<script src="<%= request.getContextPath() %>/common/nui/nui.js" type="text/javascript"></script>
	<style type="text/css">
	    html, body{
	        margin:0;padding:0;border:0;width:100%;height:100%;overflow:hidden;
	    } 
	    <!--.nui-radiobuttonlist-item{
	    	float: left;
		    margin-left: 200px;
		    color: pink;
		 }-->
    </style>
</head>
<body>
<div class="nui-panel" title="重点任务报表" style="width: 100%;height: 100%">
    <div  id="form1">
        <div class="nui-toolbar" style="border-bottom:0;padding:0px;">
            <table align="center" border="0" width="100%" class="form_table">
                <!-- 重点任务名称、责任单位、完成状态、完成时间、任务方向 -->
                <tr>

                    <td class="form_label" align = "right">重点任务名称</td>
                    <td colspan="1">
                        <input name="criteria._expr[3]._value" class="nui-textbox" style="width:221px;" />
                        <input class="nui-hidden" name="criteria._expr[3]._property" value="taskName"/>
                        <input class="nui-hidden" name="criteria._expr[3]._op" value="like"/>
                    </td>
                    <td class="form_label" align = "right" id="aa">责任单位</td>
                    <td colspan="1" id="ab">
                        <input name="criteria._expr[4]._value" class="nui-textbox" style="width:221px;" id="orgname"/>
                        <input class="nui-hidden" name="criteria._expr[4]._property" value="orgname"/>
                        <input class="nui-hidden" name="criteria._expr[4]._op" value="like"/>
                        <input class="nui-hidden" name="criteria._expr[4]._likeRule" value="all"/>
                    </td>

                    <td class="form_label" align = "right" id="aa">完成状态</td>
                    <td colspan="1" id="ab">
                        <input name="criteria._expr[12]._value" class="nui-dictcombobox" dictTypeId="ZH_BIDSTATUS"  shownullItem="true" style="width:221px;"/>
                        <input class="nui-hidden" name="criteria._expr[12]._property" value="completeStatus"/>
                        <input class="nui-hidden" name="criteria._expr[12]._op" value="in"/>
                    </td>
                </tr>
                <!--    <tr>
                        <td class="form_label" align = "right">总体目标</td>
                        <td colspan="1">
                          <input name="criteria._expr[7]._value" class="nui-textbox" style="width:221px;" />
                          <input class="nui-hidden" name="criteria._expr[7]._property" value="populationTarget"/>
                          <input class="nui-hidden" name="criteria._expr[7]._op" value="like"/>
                        </td>
                        <td class="form_label" align = "right" id="aa">年度目标</td>
                        <td colspan="1" id="ab">
                          <input name="criteria._expr[8]._value" class="nui-textbox" style="width:221px;" id="yearTarget"/>
                          <input class="nui-hidden" name="criteria._expr[8]._property" value="yearTarget"/>
                          <input class="nui-hidden" name="criteria._expr[8]._op" value="like"/>
                          <input class="nui-hidden" name="criteria._expr[8]._likeRule" value="all"/>
                        </td>
                         <td class="form_label" align = "right">任务方向</td>
                         <td colspan="1">
                           <input name="criteria._expr[9]._value" class="nui-textbox" dictTypeId="ZH_BIDSTATUS"  shownullItem="true" style="width:221px;"/>
                           <input class="nui-hidden" name="criteria._expr[9]._property" value="decisionSituation"/>
                           <input class="nui-hidden" name="criteria._expr[9]._op" value="in"/>
                         </td>
                    </tr>
                    -->
                <tr>
                    <td colspan="9" align="center">
                        <a class="nui-button" id="search" iconCls="icon-search" onclick="search()">查询</a>
                        <a class="nui-button" id="reset" iconCls="icon-reload" onclick="reset()">重置</a>
                    </td>
                </tr>
            </table>
        </div>
    </div>
    <div class="nui-toolbar" style="border-bottom:0;padding:0px;">
        <table style="width:100%;">
            <tr>
                <td style="width:20%;">
                    <a class="nui-button" iconCls="icon-export" onclick="export1()" plain="true">导出</a>
                    <!-- <a class="nui-button" id="checkview" iconCls="icon-new" onclick="sure()">发起月度任务填报</a> -->
                </td>
            </tr>
        </table>
    </div>
    <div class="nui-fit">
        <div id="datagrid1" frozenStartColumn="0"  sizeList="[10,20,50,100]" pageSize="12" showPager="true" dataField="waitTask"
             showSummaryRow="true"  sortMode="client"  ondrawsummarycell="onDrawSummaryCell" frozenStartColumn="0" frozenEndColumn="5"
             class="nui-datagrid" style="width:100%;height:100%;" url="com.zhonghe.ame.imptask.keytask.queryTableList.biz.ext"
             multiSelect="true" allowSortColumn=true onshowrowdetail="onShowRowDetail">
            <div property="columns">
                <div name="temp123" type="checkcolumn"></div>
                <div field="taskDirection" name="taskDirection" width="90" align="center" headerAlign="center" allowSort="true" >重点任务方向</div>
                <div field="taskName" name="taskName" width="90" align="center" headerAlign="center" allowSort="true" >重点任务名称</div>
                <div field="populationTarget" name="populationTarget" width="120" align="center" headerAlign="center" allowSort="true" >总体目标</div>
                <div field="yearTarget" name="yearTarget" width="120" align="center" headerAlign="center" allowSort="true"  >年度目标</div>
                <div field="orgname" name="orgname" width="93" align="center" headerAlign="center" allowSort="true" >责任单位</div>
                <div field="ndxs" name="ndxs" width="60" align="center" headerAlign="center" >难度系数</div>
                <div field="decisionSituation" name="decisionSituation" width="120" align="center" headerAlign="center" >决策情况</div>
                <div field="remark" name="remark" width="120" align="center" headerAlign="center" allowSort="true" >备注</div>
                <div header="月度计划" headerAlign="center">
                    <div property="columns">
                        <!--月份   完成率 备注 需要修改 -->
                        <div field="month" width="120" align="center" headerAlign="center" allowSort="true" >月份</div>
                        <div field="monthDescribe" width="120" align="center" headerAlign="center" allowSort="true" >月度计划描述</div>
                        <div field="monthPlanFinishTime" width="120" align="center" headerAlign="center" allowSort="true" >计划完成时间</div>
                        <div field="monthActualCompleteTime" width="120" align="center" headerAlign="center" allowSort="true" >实际完成时间</div>
                        <div field="monthCompletion" width="120" align="center" headerAlign="center" allowSort="true" >完成情况</div>
                        <div field="monthOrgname" width="120" align="center" headerAlign="center" allowSort="true" >责任单位</div>
                        <!-- 继续修改 -->
                        <div field="monthCompleteRate" width="120" align="center" headerAlign="center" allowSort="true" >完成率(%)</div>
                        <div field="monthCompleteStatus" width="120" align="center" headerAlign="center" renderer="check4" allowSort="true" >完成状态</div>
                        <div field="monthProblemMeasures" width="120" align="center" headerAlign="center" allowSort="true" >备注及纠正措施</div>
                        <!--field="remark"   -->
                        <div width="120" align="center" headerAlign="center" allowSort="true" >备注</div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<div id="detailGrid_Form" style="display:none;width:75%;">
    <div id="reve_grid" class="nui-datagrid" dataField="bidCom" showSummaryRow="true"
         url="com.zhonghe.ame.marketInfo.marketinfo.khxx.commpetior.getBidComInfo.biz.ext" showPager="false" allowCellEdit="true" allowCellSelect="true" multiSelect="true" editNextOnEnterKey="true">
        <div property="columns">
            <div field="custName"  width="80" headerAlign="center" align="center">其他投标部门</div>
            <div field="comBidPrice" width="60" headerAlign="center" align="center" >投标金额</div>
        </div>
    </div>
</div>
<form name="viewlist1" id="viewlist1" action="com.primeton.eos.ame_common.ameExportCommon.flow" method="post" >
    <input type="hidden" name="_eosFlowAction" value="action0" filter="false"/>
    <input type="hidden" name="downloadFile" filter="false"/>
    <input type="hidden" name="fileName" filter="false"/>
</form> 
<% UserObject user = (UserObject)session.getAttribute("userObject");
	String userName=user.getUserName();
	String orgName=user.getUserOrgName();
 %>
<script type="text/javascript">
    	nui.parse();
		var form = new nui.Form("#form1");
    	var grid = nui.get("datagrid1");
    	var type = <%=request.getParameter("type")%>;
		var reve_grid = nui.get("reve_grid");
    	var json=nui.encode({"iden": "1","expseq": null,"feeseq": null,"parentfeetypeid": null});
    	
    	grid.on("load", function () {
            grid.mergeColumns(["taskDirection", "taskName","populationTarget","yearTarget","orgname","ndxs","decisionSituation","remark"]);
        });
    	
    	  
	    function export1(){
		if(!confirm("是否确认导出？")){
				return;
		}
			nui.ajax({
    			url: "com.zhonghe.ame.imptask.keytask.exportKeyTask.biz.ext",
		        type: "post",
		        cache: false,
		        contentType: 'text/json',
		        success: function (o) {
		     		nui.unmask();
		     		var filePath = o.downloadFile;
		        	var fileName = "重点任务报表";
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
    	
    	var taskListDataGridObj = nui.get("datagrid1");
    	init();
    	function init(){
    		grid.load({type:type});
    		grid.sortBy("tbdate","desc");
		}
		function check4(e){
			if(e.value==1){
				return "已完成";
			}else if (e.value==null){
				return "";
			}else{
				return "未完成";
			}
		}
		function check(e){
			if(e.value==1){
			return "是";
			}else{
			return "否";
			}
		}
		
		function check3(e){
			/* 申报状态 0-未下发 1-申报部门填报月度计划 2-经营计划部调整 3 申报部门执行中 4 流程终止 */
			if(e.value==0){
				return "未下发";
			}else  if(e.value==1){
				return "申报部门填报月度计划 ";
			}else  if(e.value==2){
				return "经营计划部调整";
			}else  if(e.value==3){
				return "申报部门执行中";
			}else  if(e.value==4){
				return "流程终止";
			}
		}
		
		function check2(e){
			var d = new Date(e.value);  
			youWant=d.getFullYear() + '-' + (d.getMonth() + 1) + '-' + d.getDate() + ' ' + d.getHours() + ':' + d.getMinutes() + ':' + d.getSeconds();
			youWant=youWant.substr(0,4);
			return  youWant;
		}	
		
		function lookInfo(e) {
			var bidid = e.row.id;
			if(bidid==0 || bidid==null ){
			/* 	nui.alert("查询信息有误"); */
			}else{
				return "<a href='javascript:void(0)' onclick='doView("+ bidid +");' title='点击查看'>" + e.value + "</a>";
			}
		}
	    function doView(reiid){
			var executeUrl = "<%= request.getContextPath() %>/imptask/keyTaskDetail.jsp?id=" + reiid;
			window.open(executeUrl);
	    }
		function dictGetType(e){
			return nui.getDictText('EXP_EXPTYPE',e.value);
		}
		function dictGetStatus(e){
			return nui.getDictText('EXP_CHECKFLAG',e.value);
		}
		function search() {
			var form = new nui.Form("#form1");
			var data = form.getData(); //获取表单JS对象数据
		  	grid.load(data); //datagrid加载数据
		}
		function reset(){
			var form = new nui.Form("#form1");
			form.reset();
			grid.load();
		}
		function onOk(){
			search();
		}
		
		//操作
	function onActionRenderer1(e) {
        var s = "";
       	console.log(e);
        s = s +  '<a class="dgBtn" href="javascript:doOperate(' + e.rowIndex + ', false)"><%=I18nUtil.getMessage(request, "bps.wfclient.myTask.Execute")%></a> ';
        s = s +  '<a class="dgBtn" href="javascript:doReassign(' + e.rowIndex + ', true)"><%=I18nUtil.getMessage(request, "bps.wfclient.myTask.Reassign")%></a> ';
        s = s + '<a class="dgBtn"  href="javascript:doOperate(' + e.rowIndex + ', true)"><%=I18nUtil.getMessage(request, "bps.wfclient.common.View")%></a> ';
       /*  if (taskType == "finishedSelf") {
        	var record = e.record;
        	if (record.id!=null){
        		s = s + '<a class="dgBtn" href="javascript:attention(' + e.rowIndex + ', true);">取消关注</a> ';
        		if(e.row.isPerson == "true"){
        			s = s + '<a class="dgBtn" href="javascript:void(0)" userIDs="' + e.row.userIDs + '" onclick = doThing(this)>催办</a> ';
        		}
        	}else{
        		s = s + '<a class="dgBtn" href="javascript:attention(' + e.rowIndex + ', true);">关注</a> ';
        		if(e.row.isPerson == "true"){
        			s = s + '<a class="dgBtn" href="javascript:void(0)" userIDs="' + e.row.userIDs + '"onclick = doThing(this)>催办</a> ';
        		}
        	}
        }  */
        return s;
    }
		
		
		//修改投标明细

		//改派
    function doReassign(rowIndex, isShowDetail) {
    	var row = taskListDataGridObj.getRow(rowIndex);
    	nui.open({
			url: "<%=request.getContextPath() %>/ame_common/selectEmp.jsp",
			title: "指定改派人员",
			width: 400,
			height: 150,
			onload: function () {
				//var iframe = this.getIFrameEl();
			},
			ondestroy: function (action){
				if (action == "ok") {
					var iframe = this.getIFrameEl();
					var data = iframe.contentWindow.GetData();
					data = nui.clone(data);    //必须
					if (data.userid) {			//data.userid  data.empname
						var json = {workItemID:row.taskExp.workItemID ,personID:data.userid, catalogName:row.catalogName, currentActName:row.workItemName};
						nui.ajax({
				    		url: "org.gocom.bps.wfclient.task.business.task.reassign.biz.ext",
				            data: json,
				            type: 'POST',
				            cache: false,
				            showModal: false,
				            contentType: 'text/json',
				            success: function (o) {
				            	alert("改派成功！");
				            	taskListDataGridObj.reload();
				            },
				            error: function (jqXHR, textStatus, errorThrown) {
				                alert(jqXHR.responseText);
				            }
				    	});
					}else{
						//alert("至少选择一条记录！");
					}
				}
			}
		});
    }
		
		
		
		 //执行操作
    function doOperate(rowIndex, isShowDetail) {
    	var row = taskListDataGridObj.getRow(rowIndex);
 		console.log(row);
 		<%-- var contextPath = <%=request.getContextPath() %> --%>
    	var url = "/default/bps/wfclient/task/dispatchTaskExecute.jsp?workItemID="+row.taskExp.workItemID;
    	var title = "<%=I18nUtil.getMessage(request, "bps.wfclient.myTask.WorkExecu")%>"+"-"+row.taskExp.workItemName;
    	var width=1100;
    	var taskType="self";
    	if (isShowDetail) {
    		url = "/default/bps/wfclient/task/task.jsp";
	    	title = "<%=I18nUtil.getMessage(request, "bps.wfclient.myTask.WorkDetail")%>"+"-"+row.taskExp.workItemName;
	    	//width=800;
    	}else if (taskType == "entrust"){
    		url = "/default/bps/wfclient/task/task.jsp";
    		title = "<%=I18nUtil.getMessage(request, "bps.wfclient.myTask.RecoverWorkItem")%>";
    		//width=800;
    	}
	     nui.open({
	    	allowResize: true,
			url: url,
			title: title,
			width: width,
			height: 600,
			enableDragProxy: false,
			onload: function () {
				var iframe = this.getIFrameEl();
				if(iframe.contentWindow.initData) {
					iframe.contentWindow.initData(row.taskExp, taskType, isShowDetail);
				}	
			},
			ondestroy: function (action){
				if (action == "ok") {
					taskListDataGridObj.reload();
				} else if (action == "execute") {  
					doOperate(rowIndex, false);					
				}
			}
		}); 
    }
		
		
		//展示差旅行程明细
		function onShowRowDetail(e) {
	
		 	var grid = e.sender;
	    	var row = e.record;
	        var td = grid.getRowDetailCellEl(row);
	        td.appendChild(detailGrid_Form);
	        detailGrid_Form.style.display = "block";
	        reve_grid.load({ id: row.id });
		}
		
		//回车触发
		function onKeyEnter(){
			search();
		}
		
		function getExpRei(e){
	    	if(e.value){
	    		return "<a href='javascript:void(0)' onclick='checkExpNo("+ e.value +");' title='点击查看'>" + e.value + "</a>";
	    	}
	    }
	    function checkExpNo(reiid){
			var executeUrl = "<%= request.getContextPath() %>/ame_fee/myExpenseReimbursement/myReiFee.jsp?reiid=" + reiid;
			window.open(executeUrl);
	    }
	    
	    
	    function onActionRenderer(e) {
			var grid = e.sender;
            var record = e.record;
            var uid = record._uid;
        	var processInstID=record.processinstid;
			
			var s = " <a  href='javascript:void(0)' onclick='feeView();' >流程</a>";
			
            return s;
        }
        
        function feeView(){
	        var selectRow = grid.getSelected();
	        var processInstID=selectRow.processinstid;
			var url = "<%=request.getContextPath() %>/bps/wfclient/task/processinstView.jsp";
			var title = "流程图查看";
			var width=1000;
		    nui.open({
				url: url,
				title: title,
				width: width,
				height: 550,
				onload: function () {
					var iframe = this.getIFrameEl();
					if(iframe.contentWindow.initData) {
						iframe.contentWindow.initData({"processInstID": processInstID});
					}
				},
				ondestroy: function (action){
				}
			});
	    }
        
		
	    function checkexpid(){
	    	var selectRow = grid.getSelected();
	    	var expno=selectRow.expReiList.expno;
	    	var exptype=selectRow.expReiList.exptype;
	    	var processinstid=selectRow.processinstid;
	    	if(processinstid==null||processinstid==""){
	    		var t = /^[a-zA-Z][a-zA-Z0-9]*$/.test(expno);
	    		if(t){
	    			var url = "<%=request.getContextPath() %>/marketInfo/bid/editBid.jsp";
					var title = "打印";
				    nui.open({
						url: url,
						title: title,
						width: 659,
						height: 210,
						onload: function () {
							var iframe = this.getIFrameEl();
						},
						ondestroy: function (action){
						}
					}).show("center",100);
	    		}
			}else{
				var url = "<%=request.getContextPath() %>/ame_fee/myExpenseReimbursement/changePrint.jsp?expno="+expno+"&exptype="+exptype+"&processinstid="+processinstid;
				var title = "打印";
			    nui.open({
					url: url,
					title: title,
					width: 659,
					height: 210,
					onload: function () {
						var iframe = this.getIFrameEl();
					},
					ondestroy: function (action){
					}
				}).show("center",100);
			}
	    }
	    
	    
	    function onDrawSummaryCell(e) {
		    var result = e.result;
		    var grid = e.sender;
		    if (e.field == "empname") {
		        e.cellHtml = "<span style='display: block;font-weight: bold;font-size: 12px;text-align: right;'>合计：</span>";
		    }
		    if (e.field == "total") {
		    	e.cellHtml = "<span style='display: block;font-weight: bold;text-align: right;'>" + e.cellHtml + "</span>";
		    }
		    if (e.field == "confamt") {
		    	e.cellHtml = "<span style='display: block;font-weight: bold;text-align: right;'>" + e.cellHtml + "</span>";
		    }
		    if (e.field == "hxamt") {
		    	e.cellHtml = "<span style='display: block;font-weight: bold;text-align: right;'>" + e.cellHtml + "</span>";
		    }
		    if (e.field == "payamt") {
		    	e.cellHtml = "<span style='display: block;font-weight: bold;text-align: right;'>" + e.cellHtml + "</span>";
		    }
		}
		//将中国标准时间格式化为“yyyy-MM-dd HH:mm:ss”
	function ondealdate(e){
		if(e.value){
		  var now  = e.value;
		  var   year=now.getFullYear();     
          var   month=now.getMonth()+1;
          var   day=now.getDate();     
          var   hours=now.getHours();     
          var   minutes=now.getMinutes();     
          var   seconds=now.getSeconds();
          var curDateTime = year;
          if(month>9){
			curDateTime = curDateTime +"-" + month;
		  }else{
		  	curDateTime = curDateTime+"-" + "0" + month;
		  }
    	if(day>9){
			curDateTime = curDateTime+"-" + day;
		}else{
			curDateTime = curDateTime+"-" + "0" + day;
			}
		if(hours>9){
			curDateTime = curDateTime+"   " + hours;
		}else{
			curDateTime = curDateTime+"   " + "0" + hours;
			}
		if(minutes>9){
			curDateTime = curDateTime+":" + minutes;
		}else{
			curDateTime = curDateTime+":" + "0" + minutes;
			}
		if(seconds>9){
			curDateTime = curDateTime+":" + seconds;
		}else{
			curDateTime = curDateTime+":" + "0" + seconds;
			}     
          return   curDateTime;     
		}
	}
	
	function sure(e){
	
			var row = grid.getSelecteds();
			
			if (row.length == 1) {
				
				var mngJsonData = row[0];
				//获取当前客户的其他信息
				var json = nui.encode({id:mngJsonData.id,createUserid:mngJsonData.createUserid});
				
				console.log(json);
				if(!confirm("确定提交该流程？")){
        				return;
        			}else{	
					
				  nui.ajax({
					    url: "com.zhonghe.ame.imptask.keytask.taskMngFillIn.biz.ext",
						type: 'POST',
						data: json,	
						contentType: 'text/json',
					    success: function (o) {
					           if(o.result==1){
		                	 	nui.alert("流程发起成功","系统提示",function(){
				        		//nui.get("sureButton").setEnabled(true);
				        		CloseWindow("ok");
				        	});

		                	 }else{
		                	 
		                	 nui.alert("提交失败，请联系信息技术部人员！","系统提示", function(action){
								//nui.get("sureButton").setEnabled(true);
							});
		                	 
		                	 }
					    }
				}); 
				}
			}else{
				nui.alert("请选中一条记录","提示");
			}
	
	
	
	}
	
	
	/* function add(){
		nui.open({
			url: "/default/marketInfo/bid/creatBid.jsp",
			width: 1000,
			height: 550,
			onload: function () {
				var iframe = this.getIFrameEl();
			},
			ondestroy: function (action){
			reset();
			}
		})
	} */
</script>
</body>
</html>
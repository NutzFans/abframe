<%@page import="com.primeton.bps.web.control.I18nUtil"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@include file="/purchase/common/common.jsp"%>
<html>
<!-- 
  - Author(s): yaoyi
  - Date: 2017-02-27 10:10:45
  - Description:
-->
<head>
<title>月度计划审核</title>
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
	<div class="nui-panel" title="月度计划审核" style="width: 100%;height: 100%">
    <div  id="form1">
        <div class="nui-toolbar" style="border-bottom:0;padding:0px;">
            <table align="center" border="0" width="100%" class="form_table">
                <tr>
                    <td class="form_label" align = "right">申报人</td>
                    <td colspan="1">
                        <input name="criteria._expr[1]._value" class="nui-textbox" style="width:150px;" />
                        <input class="nui-hidden" name="criteria._expr[1]._property" value="empname"/>
                        <input class="nui-hidden" name="criteria._expr[1]._op" value="="/>
                    </td>
                    <td class="form_label" align = "right">重点任务名称</td>
                    <td colspan="1">
                        <input name="criteria._expr[2]._value" class="nui-textbox" style="width:150px;" />
                        <input class="nui-hidden" name="criteria._expr[2]._property" value="taskName"/>
                        <input class="nui-hidden" name="criteria._expr[2]._op" value="like"/>
                    </td>
                    <td class="form_label" align = "right" id="aa">责任单位</td>
                    <td colspan="1" id="ab">
                        <input name="criteria._expr[9]._value" class="nui-textbox" style="width:150px;" id="orgname11"/>
                        <input class="nui-hidden" name="criteria._expr[9]._property" value="orgname"/>
                        <input class="nui-hidden" name="criteria._expr[9]._op" value="like"/>
                        <input class="nui-hidden" name="criteria._expr[9]._likeRule" value="all"/>
                    </td>
                    <td class="form_label" align = "right">申报状态</td>
                    <td colspan="1">
                        <input name="criteria._expr[7]._value" class="nui-dictcombobox" dictTypeId="ZH_BIDSTATUS"  shownullItem="true" style="width:150px;"/>
                        <input class="nui-hidden" name="criteria._expr[7]._property" value="bidstatus"/>
                        <input class="nui-hidden" name="criteria._expr[7]._op" value="in"/>
                    </td>
                </tr>
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
                    <!-- <a class="nui-button" id="checkview" iconCls="icon-edit" onclick="editTaskMng()">编辑重点任务</a> -->
                    <!-- <a class="nui-button" id="checkview" iconCls="icon-new" onclick="sure()">发起月度任务填报</a> -->
                </td>
            </tr>
        </table>
    </div>
    <div class="nui-fit">
        <div id="datagrid1" frozenStartColumn="0"  sizeList="[10,20,50,100]" showPager="true" dataField="waitTask"
                 showSummaryRow="true"  sortMode="client"
                 class="nui-datagrid" style="width:100%;height:100%;" url="com.zhonghe.ame.imptask.keytask.queryMonthPlanAddList.biz.ext"
                 multiSelect="true" allowSortColumn=true >
                <div property="columns">
                    <div name="temp123" type="checkcolumn"></div>
                    <div name="action" headerAlign="center" cellCls="textof_clip" align="center" renderer="onActionRenderer1" width="100"><%=I18nUtil.getMessage(request, "bps.wfclient.common.Operation")%></div>
                    <div field="taskName" width="150" align="center" headerAlign="center" allowSort="true" >任务名称</div>
                    <div field="declareYear" width="120" align="center" headerAlign="center" allowSort="true">申报年度</div>
                    <div field="orgname" width="80" align="center" headerAlign="center" allowSort="true" >责任单位</div>
                    <div field="populationTarget" width="90" align="center" headerAlign="center" allowSort="true" >总体目标</div>
                    <div field="yearTarget" width="80" align="center" headerAlign="center" allowSort="true"  >年度目标</div>
                    <div field="decisionSituation" width="120" align="center" headerAlign="center" >决策情况</div>
                    <div field="planCompleteTime" width="150" align="center" headerAlign="center" >计划完成时间</div>
                    <!-- <div field="actualCompleteTime" width="80" align="right" headerAlign="center" allowSort="true">实际完成时间</div> -->
                    <div field="completeStatus" width="80" align="center" headerAlign="center" allowSort="true" renderer="check">完成状态</div>
                    <div field="empname" width="120" align="center" headerAlign="center" allowSort="true" >申报人</div>
                    <!-- <div field="appStatus" width="80" align="center" headerAlign="center" allowSort="true" >申报状态</div> -->
                    <!-- <div field="remark" width="120" align="center" headerAlign="center" allowSort="true" >备注</div> -->
                </div>
            </div>
    </div>
</div>
<div id="detailGrid_Form" style="display:none;width:75%">
    <div id="reve_grid" class="nui-datagrid" dataField="bidCom" showSummaryRow="true"
         url="com.zhonghe.ame.marketInfo.marketinfo.khxx.commpetior.getBidComInfo.biz.ext" showPager="false" allowCellEdit="true" allowCellSelect="true" multiSelect="true" editNextOnEnterKey="true">
        <div property="columns">
            <div field="custName"  width="80" headerAlign="center" align="center">其他投标部门</div>
            <div field="comBidPrice" width="60" headerAlign="center" align="center" >投标金额</div>
        </div>
    </div>
</div>
<script type="text/javascript">
    	nui.parse();
		var form = new nui.Form("#form1");
    	var grid = nui.get("datagrid1");
    	var type = <%=request.getParameter("type")%>;
		var reve_grid = nui.get("reve_grid");
    	var json=nui.encode({"iden": "1","expseq": null,"feeseq": null,"parentfeetypeid": null});
    	
    	var taskListDataGridObj = nui.get("datagrid1");
    	init();
    	function init(){
    		grid.load({type:type});
    		grid.sortBy("tbdate","desc");
		}
		function check(e){
			if(e.value==1){
			return "是";
			}else{
			return "否";
			}
		}
		
	    function doView(reiid){
			var executeUrl = "<%= request.getContextPath() %>/imptask/keyTaskAudit/keyTaskMngDetail.jsp?id=" + reiid;
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
        s = s +  '<a class="dgBtn" href="javascript:doOperate(' + e.rowIndex + ', false)">填报</a> ';
        s = s +  '<a class="dgBtn" href="javascript:doReassign(' + e.rowIndex + ', true)"><%=I18nUtil.getMessage(request, "bps.wfclient.myTask.Reassign")%></a> ';
        s = s + '<a class="dgBtn"  href="javascript:doOperate(' + e.rowIndex + ', true)"><%=I18nUtil.getMessage(request, "bps.wfclient.common.View")%></a> ';
        return s;
    }
		
		
		//修改投标明细
		function editTaskMng(){
			
    		var row = grid.getSelecteds();
			if (row.length > 1) {
    		nui.alert("只能选中一条项目记录进行编辑");
    		}else{
    		var row=row[0];
			if (row) {
				nui.open({
				
				url: "/default/imptask/mngUpdateMonyear.jsp?workItemID="+row.taskExp.workItemID,
				width: 1123,
				height: 550,
				onload: function () {
					var iframe = this.getIFrameEl();
				},
				ondestroy: function (action) {
	            	if(action=="ok"){
	            		grid.reload();
	            	}
	            }
			})
			
			}else{
				nui.alert("请选中一条记录","提示");
			}
			
    		}
		}
		
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
    	var width=1100;
    	var url;
    	var title;
    	var taskType="self";//entrust, self
    	if (isShowDetail) {
    		url = "<%=request.getContextPath()%>/bps/wfclient/task/task.jsp?workItemID="+row.taskExp.workItemID;
	    	title = "<%=I18nUtil.getMessage(request, "bps.wfclient.myTask.WorkDetail")%>"+"-"+row.taskExp.workItemName;
    	}else{
    		url = "<%=request.getContextPath()%>/bps/wfclient/task/dispatchTaskExecute.jsp?workItemID="+row.taskExp.workItemID;
    		title = "<%=I18nUtil.getMessage(request, "bps.wfclient.myTask.WorkExecu")%>"+"-"+row.taskExp.workItemName;
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
        
	    
	
	function sure(e){
	
			var row = grid.getSelecteds();
			
			if (row.length == 1) {
				
				var mngJsonData = row[0];
				//获取当前客户的其他信息
				var json = nui.encode({id:mngJsonData.id,createUserid:mngJsonData.createUserid});
				
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
	
</script>
</body>
</html>
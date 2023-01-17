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
<title>投标信息</title>
	<meta http-equiv="content-type" content="text/html; charset=UTF-8" />
	<script src="<%= request.getContextPath() %>/common/nui/nui.js" type="text/javascript"></script>
	<style type="text/css">
	    .nui-radiobuttonlist-item{
	    	float: left;
		    margin-left: 200px;
		    color: pink;
		 }
    </style>
</head>
<body>
	<div class="nui-panel" title="重点任务列表" style="width:100%;">
        <div  id="form1">
	        <div class="nui-toolbar" style="border-bottom:0px;padding:0px;">
	        </div>
		  <div class="nui-toolbar" style="border-bottom:0;padding:0px;">
			  <table align="center" border="0" width="100%" class="form_table">
			  
			
		     <tr>
		      
		        
		          <td class="form_label" align = "right">重点任务名称</td>
		          <td colspan="1">
			    	<input name="criteria._expr[3]._value" class="nui-textbox" style="width:221px;" />
				    <input class="nui-hidden" name="criteria._expr[3]._property" value="taskName"/>
				    <input class="nui-hidden" name="criteria._expr[3]._op" value="like"/>
		          </td>		          
		          
		      </tr>
		      
		      </table>
			</div>
</div>
<div >
	<div class="nui-toolbar" style="border-bottom:0;padding:0px;">
        <table style="width:100%;">
        	<tr>
                <td style="width:20%;">
		            <!-- <a class="nui-button" id="checkview" iconCls="icon-edit" onclick="editTaskMng()">进展情况跟踪</a>
		            <a class="nui-button" id="checkview" iconCls="icon-edit" onclick="sure()">月度计划更新</a> -->
		        </td>
            </tr>
        </table>           
    </div>
    <div id="datagrid1" frozenStartColumn="0"  sizeList="[10,20,50,100]" showPager="true" dataField="keyTaskList" 
    	showSummaryRow="true"  sortMode="client" 
    	class="nui-datagrid" style="width:100%;height:350px;" url="com.zhonghe.ame.imptask.keytask.queryTaskList.biz.ext" 
    	multiSelect="true" allowSortColumn=true onshowrowdetail="onShowRowDetail">
        <div property="columns">
        	<div name="temp123" type="checkcolumn"></div>
        	<%-- <div name="action" headerAlign="center" cellCls="textof_clip" align="center" renderer="onActionRenderer1" width="100"><%=I18nUtil.getMessage(request, "bps.wfclient.common.Operation")%></div> --%>                              
        	<div field="taskName" width="150" align="center" headerAlign="center" allowSort="true">重点任务名称</div>
            <div field="declareYear" width="120" align="center" headerAlign="center" allowSort="true" renderer="check2"  >申报年度</div>
            <div field="orgname" width="80" align="center" headerAlign="center" allowSort="true" >责任单位</div>
           <!--  <div field="populationTarget" width="90" align="center" headerAlign="center" allowSort="true" >总体目标</div>
            <div field="yearTarget" width="80" align="center" headerAlign="center" allowSort="true"  >年度目标</div>
            <div field="decisionSituation" width="120" align="center" headerAlign="center" >决策情况</div>
            <div field="planCompleteTime" width="150" align="center" headerAlign="center" >计划完成时间</div>
            <div field="actualCompleteTime" width="80" align="right" headerAlign="center" allowSort="true">实际完成时间</div>
            <div field="completeStatus" width="80" align="center" headerAlign="center" allowSort="true" renderer="check">完成状态</div>
           	<div field="empname" width="120" align="center" headerAlign="center" allowSort="true" >申报人</div> -->
            <!-- <div field="appStatus" width="80" align="center" headerAlign="center" allowSort="true" renderer="check3" >申报状态</div> -->
            <!-- <div field="remark" width="120" align="center" headerAlign="center" allowSort="true" >备注</div> -->
        </div>
        </div>
		</div>
	</div>
	<div class="nui-toolbar" style="text-align:center;padding-top:8px;padding-bottom:8px;" borderStyle="border:0;">
		<a class="nui-button" style="width:60px;" onclick="onOk1()">确定</a>
	    <span style="display:inline-block;width:25px;"></span>
	    <a class="nui-button" style="width:60px;" onclick="onCancel()">关闭</a>
	</div>
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
    	
    	var taskListDataGridObj = nui.get("datagrid1");
    	init();
    	function init(){
    		grid.load({type:'4'});
    		grid.sortBy("tbdate","desc");
		}
		function check(e){
			if(e.value==1){
			return "是";
			}else{
			return "否";
			}
		}
		 function onCancel() {
      	CloseWindow("cancel");
    	}
		
		function onOk1() {
      	var row = grid.getSelected();
      	if (!row) {
        	alert("请选中一条记录");
        	return;
      	}
      	CloseWindow("ok");
    }
    
    
    function CloseWindow(action) {            
        if (action == "close" && form.isChanged()) {
            if (confirm("数据被修改了，是否先保存？")) {
                return false;
            }
        }
        if (window.CloseOwnerWindow) return window.CloseOwnerWindow(action);
        else window.close();            
    }
    
    
    function GetData() {
    	var data = grid.getSelecteds();
		return data;
    }
    
    function CloseWindow(action) {
      	if (window.CloseOwnerWindow) return window.CloseOwnerWindow(action);
      	else window.close();
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
			/* if(e.value==1){
			return "是";
			}else{
			return "否";
			} */
		}	
		
		function lookInfo(e) {
			
			var bidid = e.row.id;
			if(bidid==0 || bidid==null ){
				nui.alert("查询信息有误");
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
			data.type='4';
			console.log(data);
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
		function editTaskMng(){
			
    		var row = grid.getSelected();
    		
    		
    			console.log(row.length);
				if (row.length > 1) {
	    		nui.alert("只能选中一条项目记录进行编辑");
	    		}else{
	    		
				if (row) {
					nui.open({
					url: "/default/imptask/compileydjh.jsp?id="+row.id+"&isUpdate="+row.isUpdate, 
					width: 1123,
					height: 750,
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
	
			var row = grid.getSelected();
    		
    		
    		
				if (row.length > 1) {
	    		nui.alert("只能选中一条项目记录进行编辑");
	    		}else{
	    			
	    			console.log(row.isUpdate);
	    			if(row.isUpdate==0){
	    				nui.alert("暂未授权,请联系经营计划部");
	    			}else{
	    			
	    				if (row) {
						nui.open({
						url: "/default/imptask/compileydjh.jsp?id="+row.id+"&isUpdate="+row.isUpdate, 
						width: 1123,
						height: 750,
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
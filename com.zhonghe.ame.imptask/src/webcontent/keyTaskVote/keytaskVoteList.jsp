 <%@page import="com.eos.data.datacontext.UserObject"%>
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
<title>重点任务投票信息</title>
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
<div class="nui-panel" title="重点任务投票" style="width: 100%;height: 100%">
    <div  id="form1">
        <div class="nui-toolbar" style="border-bottom:0;padding:0px;">
            <table align="center" border="0" width="100%" class="form_table">
                <tr>
                    <td class="form_label" align = "right">投票名称</td>
                    <td >
                        <input name="param1.voteCode" class="nui-textbox" style="width:150px;" />
                        <input class="nui-hidden" name="param1.voteStatus" value="voteCode"/>
                        <input class="nui-hidden" name="criteria._expr[2]._op" value="like"/>
                    </td>
                    <td class="form_label" align = "right">投票状态</td>
                    <td >
                        <input name="param1.voteStatus" class="nui-dictcombobox" dictTypeId="ZH_TPZT"  shownullItem="true" style="width:150px;"/>
                        <input class="nui-hidden" name="criteria._expr[7]._property" value="voteStatus"/>
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
                    <a class="nui-button" id="checkview" iconCls="icon-add" onclick="add()">发起重点任务投票</a>
                    <!-- <a class="nui-button" id="checkview" iconCls="icon-edit" onclick="editTaskMng()">编辑</a> -->
                    <a class="nui-button" id="checkview1" iconCls="icon-remove" onclick="deleteInfo()">删除</a>
                </td>
            </tr>
        </table>
    </div>
    <div class="nui-fit">
        <div id="datagrid1" frozenStartColumn="0"  sizeList="[10,20,50,100]" showPager="true" dataField="taskVote"
             showSummaryRow="true"  sortMode="client"  ondrawsummarycell="onDrawSummaryCell"  multiSelect="false"
             class="nui-datagrid" style="width:100%;height:100%;" url="com.zhonghe.ame.imptask.keyTaskVote.queryKeytaskByNameStatus.biz.ext"
             allowSortColumn=true >
            <div property="columns">
                <div name="temp123" type="checkcolumn"></div>
                <div field="keytaskName" width="100" align="center" headerAlign="center" allowSort="true" renderer="lookInfo">投票名称</div>
                <div field="createuserName" width="100" align="center" headerAlign="center" allowSort="true">投票活动创建人</div>
                <div field="finishtime" width="100" align="center" headerAlign="center" allowSort="true" >投票结束时间</div>
                <div field="keytaskStatus" width="80" align="center" headerAlign="center" allowSort="true"  >状态</div>
                <div field="remake" width="120" align="center" headerAlign="center" >备注</div>
            </div>
        </div>
    </div>
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
    	if(type==1){
    	document.getElementById("checkview").style.display="none";
    	document.getElementById("checkview1").style.display="none";
    	}
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
		
		
		 function detail(){
     		var row = grid.getSelecteds();
			if (row.length == 1) {
				var mngJsonData = row[0];
				//获取当前客户的其他信息
				var json = nui.encode({id:mngJsonData.id,createUserid:mngJsonData.createUserid});
				console.log(json);
				 nui.open({
						url: "/default/imptask/keyTaskVote/voteTaskRank.jsp?id="+mngJsonData.id,
						width: 1000,
						height: 320,
						onload: function () {
							var iframe = this.getIFrameEl();
						},
							ondestroy: function (action){
								reset();
							}
				}) 
			}else{
				nui.alert("请选中一条记录","提示");
			}
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
			var executeUrl = "<%= request.getContextPath() %>/imptask/keyTaskVote/voteTaskRankformx.jsp?id=" + reiid;
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
		
		function deleteInfo(){
    		var row = grid.getSelecteds();
			if (row.length > 1) {
    		nui.alert("只能选中一条项目记录进行删除");
    		}else{
    		var row=row[0];
    		console.log(row);
			if (row) {
				var json = nui.encode({id:row.id});
				nui.ajax({
					    url: "com.zhonghe.ame.imptask.keyTaskVote.deleteTaskVote.biz.ext",
						type: 'POST',
						data: json,	
						contentType: 'text/json',
					    success: function (o) {
					           if(o.result==1){
					           	    nui.showTips({
					           			content:"删除责任单位投票成功",
					           			state: "success",
					           			x:"center",
					           			y:"center",
					           			timeout: 2000.
					           		});
					           		grid.reload();
		                  	   }else{
		                	 		nui.alert("删除失败，请联系信息技术部人员！","系统提示", function(action){
									//nui.get("sureButton").setEnabled(true);
									});
		                	   }
					    }
				}); 
				row.id;
			}else{
				nui.alert("请选中一条记录","提示");
			}
    	 }
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
       
	    
	    function onDrawSummaryCell(e) {
		    var result = e.result;
		    var grid = e.sender;
		    /* if (e.field == "empname") {
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
		    } */
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
	
	
     function add(){
		nui.open({
			url: "/default/imptask/keyTaskVote/addTaskVote.jsp",
			width: 996,
			height: 500,
			title:"&nbsp;",
			onload: function () {
				var iframe = this.getIFrameEl();
			},
			ondestroy: function (action){
			reset();
			}
		})
	}
</script>
</body>
</html>
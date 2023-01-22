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
<title>责任单位投票</title>
	<meta http-equiv="content-type" content="text/html; charset=UTF-8" />
	<script src="<%= request.getContextPath() %>/common/nui/nui.js" type="text/javascript"></script>
</head>
<body style="width:100%;height:100%">
	<div class="nui-panel" title="责任单位投票"  style="width:100%;height: 100%">
        <div  id="form1">
		  <div class="nui-toolbar" style="border-bottom:0;padding:0px;">
			  <table align="center" border="0" width="100%" class="form_table">
		        <tr >
		          <td class="form_label" align = "right">投票名称</td>
		          <td >
			    	<input name="param1.voteCode" class="nui-textbox" style="width:150px;" />
				 <!--   <input class="nui-hidden"  value="voteCode"/>
				    <input class="nui-hidden"  value="like"/>-->
		          </td>
		          <td class="form_label" align = "right">投票状态</td>
		           <td >
					 <input name="param1.voteStatus" class="nui-dictcombobox" dictTypeId="ZH_TPZT"  shownullItem="true" style="width:150px;"/>
				    <!-- <input class="nui-hidden"  value="voteStatus"/>
				     <input class="nui-hidden"  value="like"/>-->
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
                	<a class="nui-button" id="checkview" iconCls="icon-add" onclick="add()">发起责任单位投票</a>
                	<a class="nui-button" id="checkview" iconCls="icon-edit" onclick="detail()">查看投票结果</a>
		            <a class="nui-button" id="checkview1" iconCls="icon-remove" onclick="deleteInfo()">删除</a>
		        </td>
            </tr>
        </table>           
    </div>
    <div class="nui-fit" >
	    <div id="datagrid1" frozenStartColumn="0"  sizeList="[10,20,50,100]" showPager="true" dataField="taskVote" 
	    	showSummaryRow="true"  sortMode="client"  ondrawsummarycell="onDrawSummaryCell"
	    	class="nui-datagrid" style="width:100%;height:100%;" url="com.zhonghe.ame.imptask.keyTaskVote.queryZrdwVotesByOrgIds.biz.ext" 
	    	allowSortColumn=true onshowrowdetail="onShowRowDetail" multiSelect="false" >
	        <div property="columns" multiSelect="false" >
		       <div name="temp123" type="checkcolumn" multiSelect="false" ></div>
	        	<!-- <div type="expandcolumn" width="20"></div> -->
	        	<div field="voteCode" width="100" align="center" headerAlign="center" allowSort="true" renderer="lookInfo" >投票名称</div>
	            <div field="empname" width="100" align="center" headerAlign="center" allowSort="true">投票活动创建人</div>
	            <div field="voteFinshtime" width="100" align="center" headerAlign="center" allowSort="true" >投票结束时间</div>
	            <div field="voteStatus" width="80" align="center" headerAlign="center" allowSort="true"  >状态</div>
	            <div field="remark" width="120" align="center" headerAlign="center" >备注</div>
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
				var customTime=mngJsonData.voteFinshtime+" 00:00:00"
				customTime= customTime.replace("-","/");//替换字符，变成标准格式  
				customTime= new Date(Date.parse(customTime));
				if(customTime > new Date()){
					nui.alert("投票未结束无法查看投票结果");
					return;
		 }
				
				
				
				//获取当前客户的其他信息
				var json = nui.encode({id:mngJsonData.id,createUserid:mngJsonData.createUserid});
				
				console.log(json);
				
				 nui.open({
						url: "/default/imptask/keyTaskVote/voteZrdwRank.jsp?id="+mngJsonData.id,
						width: 996,
						height: 302,
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
			var executeUrl = "<%= request.getContextPath() %>/imptask/keyTaskVote/voteZrdwRankformx.jsp?id=" + reiid;
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
					    url: "com.zhonghe.ame.imptask.keyTaskVote.deletezrdwVote.biz.ext",
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
		                	 nui.alert("删除___失败，请联系信息技术部人员！","系统提示", function(action){
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
			url: "/default/imptask/keyTaskVote/addZrdw.jsp",
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
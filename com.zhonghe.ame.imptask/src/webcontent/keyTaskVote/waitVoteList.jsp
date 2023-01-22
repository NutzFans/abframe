 <%@page import="com.eos.data.datacontext.UserObject"%>
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
<title>重点任务投票信息</title>
	<meta http-equiv="content-type" content="text/html; charset=UTF-8" />
	<script src="<%= request.getContextPath() %>/common/nui/nui.js" type="text/javascript"></script>
	<style type="text/css">
			html, body{
		        margin:0;padding:0;border:0;width:100%;height:100%;overflow:hidden;
		    } 
		  .New_Button{
		        font-size:11px;color:#1B3F91;font-family:Verdana;  
		        margin-right:5px;
		  }
    </style>
</head>
<body >
		<div class="nui-panel" title="重点任务投票" style="width: 100%;height: 100%">
    <div  id="form1">
        <div class="nui-toolbar" style="border-bottom:0;padding:0px;">
            <table align="center" border="0" width="100%" class="form_table">
                <tr >
                    <td class="form_label" align = "right">重点任务投票名称</td>
                    <td >
                        <input name="param1.keytaskName"  class="nui-textbox" style="width:150px;" />
                        <!--<input class="nui-hidden" name="criteria._expr[2]._property" value="voteCode"/>
                        <input class="nui-hidden" name="criteria._expr[2]._op" value="like"/>-->
                    </td>
                    <td>
                        年度: <input class="nui-spinner"  name="year" id="year" value="2021" minValue="2010" maxValue="2080" style="width:90px"
                    />
                    </td>
                    <td class="form_label" align = "right">投票状态</td>
                    <td >
                        <input name="param1.keytaskStatus" class="nui-dictcombobox" dictTypeId="ZH_TPZT"  shownullItem="true" style="width:150px;"/>
                        <input class="nui-hidden"  value="voteStatus"/>
                        <input class="nui-hidden"  value="like"/>
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
    <div class="nui-fit">
        <div id="datagrid1"  dataField="zrdwKeytask"  frozenStartColumn="0"  sizeList="[10,20,50,100]" showPager="true" 
             sortMode="client" 
             class="nui-datagrid" style="width:100%;height:100%;" url="com.zhonghe.ame.imptask.keyTaskVote.queryKeytaskByEmpOrg.biz.ext"
             multiSelect="true" allowSortColumn=true onshowrowdetail="onShowRowDetail" >
            <div property="columns">
                <div name="action" headerAlign="center" cellCls="textof_clip"  align="center" renderer="onActionRenderer1" width="30">操作</div>
                <div field="keytask_name" width="100" align="center" headerAlign="center" allowSort="true" renderer="lookInfo">投票名称</div>
                <!-- <div field="empname" width="100" align="center" headerAlign="center" allowSort="true">投票活动创建人</div>-->
                <div field="finishtime" width="100" align="center" headerAlign="center" allowSort="true" >投票结束时间</div>
                <div field="keytask_status" width="80" align="center" headerAlign="center" allowSort="true"  >状态</div>
                <div field="remake" width="120" align="center" headerAlign="center" >备注</div>
            </div>
        </div>
    </div>
</div>
<script type="text/javascript">
    	nui.parse();
		var form = new nui.Form("#form1");
		var data = form.getData();
    	var grid = nui.get("datagrid1");
    	var type = <%=request.getParameter("type")%>;
		<!--var reve_grid = nui.get("reve_grid");-->
    	var json=nui.encode({"iden": "1","expseq": null,"feeseq": null,"parentfeetypeid": null});
    	if(type==1){
    	document.getElementById("checkview").style.display="none";
    	document.getElementById("checkview1").style.display="none";
    	}
    	init();
    	function init(){
    		grid.load(data);
    		//grid.sortBy("tbdate","desc");
		}
		function check(e){
			if(e.value==1){
				return "是";
			}else{
				return "否";
			}
		}
		
		function onActionRenderer1(e) {
	        var s = "";
	        s = '<a class="New_Button" onclick="vote()">投票</a>';
	        return s;
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
			var data = form.getData();
			grid.load(data);
		}
		
		function onOk(){
			search();
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
	    
	    function onDrawSummaryCell(e) {
		    var result = e.result;
		    var grid = e.sender;
		   
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

     function vote(){
     		var row = grid.getSelected();
     		clog(row)
			if (row) {
				//获取当前客户的其他信息
				var json = nui.encode({id:row.id,createUserid:row.createUserid});	
				nui.open({
						url: "/default/imptask/keyTaskVote/ZrdwKeytask.jsp?id="+row.id,
						width: 1000,
						height: 500,
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
</script>
</body>
</html>
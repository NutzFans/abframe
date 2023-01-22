<%@page import="com.eos.data.datacontext.UserObject"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@include file="/common/common.jsp"%>
<html>

<head>
<title>重点任务自评信息</title>
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
	<div class="nui-panel" title="重点任务自评" style="width: 100%;height: 100%">
    <div  id="form1">
        <div class="nui-toolbar" style="border-bottom:0;padding:0px;">
            <table align="center" border="0" width="100%" class="form_table">
                <tr >
                    <td  align = "right" style="width: 100px;">重点任务名称:</td>
                    <td style="width: 200px;">
                        <input name="criteria._expr[2]._value" class="nui-textbox" style="width:25%;" />
                        <input class="nui-hidden" name="criteria._expr[2]._property" value="taskName"/>
                        <input class="nui-hidden" name="criteria._expr[2]._op" value="like"/>
                    </td>
                    <!--
                    <td align = "right" style="width: 70px;">进展情况:</td>
                    <td style="width: 230px;">
                      <input name="criteria._expr[3]._value" class="nui-textbox" style="width:100%;" />
                      <input class="nui-hidden" name="criteria._expr[3]._property" value="progress"/>
                      <input class="nui-hidden" name="criteria._expr[3]._op" value="like"/>
                    </td>
                    <td class="form_label" align = "right">年度完成情况预测:</td>
                    <td >
                      <input name="criteria._expr[4]._value" class="nui-textbox" style="width:250px;" />
                      <input class="nui-hidden" name="criteria._expr[4]._property" value="annualCompeteForecast"/>
                      <input class="nui-hidden" name="criteria._expr[4]._op" value="like"/>
                    </td>	  -->
                </tr>
                <!--
                  <tr >
                        <td class="form_label" align = "right">年度得分预测(分):</td>
                        <td >
                               <input class="nui-spinner"  name="criteria._expr[5]._min" style="width:90px"/>   至
                               <input class="nui-spinner" name="criteria._expr[5]._max" style="width:90px"/>
                          <input class="nui-hidden" name="criteria._expr[5]._property" value="annualFractionForecast"/>
                          <input class="nui-hidden" name="criteria._expr[5]._op" value="between"/>
                       </td>
                      <td class="form_label" align = "right">完成率:</td>
                      <td >
                          <input class="nui-spinner"  name="criteria._expr[5]._min" style="width:95px"/>%至
                             <input class="nui-spinner" name="criteria._expr[5]._max" style="width:95px"/>%
                          <input class="nui-hidden" name="criteria._expr[5]._property" value="completeRate"/>
                          <input class="nui-hidden" name="criteria._expr[5]._op" value="between"/>
                      </td>
                      <td class="form_label" align = "right">备注:</td>
                      <td >
                          <input name="criteria._expr[7]._value" class="nui-textbox" style="width:250px;" />
                          <input class="nui-hidden" name="criteria._expr[7]._property" value="remark"/>
                          <input class="nui-hidden" name="criteria._expr[7]._op" value="like"/>
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
                    <a class="nui-button" id="checkview" iconCls="icon-edit" onclick="editTaskMng()">编辑</a>
                    <a class="nui-button" id="checkview23" iconCls="icon-close" onclick="black()">退回</a>
                </td>
            </tr>
        </table>
    </div>
    <div class="nui-fit">
        <div id="datagrid1" frozenStartColumn="0"  sizeList="[10,20,50,100]" showPager="true" dataField="selfValuater"
             showSummaryRow="true"  sortMode="client"  ondrawsummarycell="onDrawSummaryCell"
             class="nui-datagrid" style="width:100%;height:100%;" url="com.zhonghe.ame.imptask.selfValuater.querySelfValuate.biz.ext"
             multiSelect="false" allowSortColumn=true onshowrowdetail="onShowRowDetail">
            <div property="columns">
                <div name="temp123" type="checkcolumn"></div>
                <div field="taskName" width="150" align="left" headerAlign="center" allowSort="true" renderer="lookInfo">重点任务名称</div>
                <div field="progress" width="120" align="left" headerAlign="center" allowSort="true">进展情况</div>
                <div field="annualCompeteForecast" width="90" align="center" headerAlign="center" allowSort="true" >年度完成情况预测</div>
                <div field="annualFractionForecast" width="80" align="center" headerAlign="center" allowSort="true" >年度得分预测</div>
                <div field="completeRate" width="60" align="center" headerAlign="center" allowSort="true"  >完成率</div>
                <div field="remark" width="150" align="left" headerAlign="center" >备注</div>
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
		
		function lookInfo(e) {
			var bidid = e.row.id;
			if(bidid==0 || bidid==null ){
				nui.alert("查询信息有误");
			}else{
				return "<a href='javascript:void(0)' onclick='doView("+ bidid +");' title='点击查看'>" + e.value + "</a>";
			}
		}
		
		
		function black(){
			var row = grid.getSelecteds();
			if(row.length ==1){
				var json = nui.encode({id:row[0].id,"status":0});
				nui.ajax({
						    url: "com.zhonghe.ame.imptask.selfValuater.updateSelfValuateStatus.biz.ext",
							type: 'POST',
							data: json,	
							contentType: 'text/json',
						    success: function (o) {
						           if(o.result==1){
			                	 	nui.alert("退回成功","系统提示",function(){
					        		grid.reload();
					        		});
	
			                	 }else{
			                	 	nui.alert("删除失败，请联系信息技术部人员！","系统提示", function(action){
			                	 	
									});
			                	 }
						    }
					}); 
			}
			
		}
		
	    function doView(reiid){
			var executeUrl = "<%= request.getContextPath() %>/imptask/selfevaluate/selfValuateDetailforzp.jsp?id=" + reiid;
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
		
		//修改投标明细
		function editTaskMng(){
    		var row = grid.getSelecteds();
			if (row.length > 1) {
    		nui.alert("只能选中一条项目记录进行编辑");
    		}else{
		    		var row=row[0];
		    		console.log(row.status);
		    		if(row.status==1){
		    			nui.alert("已提交无法修改");
		    			return ;
		    		}
					if (row) {
						nui.open({
						url: "/default/imptask/selfevaluate/editSelfValuateforzp.jsp?id="+row.id+"&keytaskId="+row.keytaskId,
						width: 1100,
						height: 700,
						onload: function () {
							var iframe = this.getIFrameEl();
						},
						ondestroy: function (action){
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
		
		function deleteInfo(){
    		var row = grid.getSelecteds();
			if (row.length > 1) {
    		nui.alert("只能选中一条项目记录进行删除");
    		}else{
    		var row=row[0];
			if (row) {
				var json = nui.encode({id:row.id,"keytaskId":row.keytaskId});
				nui.ajax({
					    url: "com.zhonghe.ame.imptask.selfValuater.deleteSelfValuate.biz.ext",
						type: 'POST',
						data: json,	
						contentType: 'text/json',
					    success: function (o) {
					           if(o.result==1){
		                	 	nui.alert("自评删除成功","系统提示",function(){
				        		grid.reload();
				        	});

		                	 }else{
		                	 
		                	 nui.alert("删除失败，请联系信息技术部人员！","系统提示", function(action){
								
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
		   /*  if (e.field == "empname") {
		        e.cellHtml = "<span style='display: block;font-weight: bold;font-size: 12px;text-align: right;'>合计：</span>";
		    }
		    */
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
		
			url: "/default/imptask/selfevaluate/addSelfValuateforzp.jsp",
			width: 1100,
			height: 434,
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
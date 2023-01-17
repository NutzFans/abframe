<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@include file="/purchase/common/common.jsp"%>
<html>
<head>
<title>重点任务</title>
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
	<div class="nui-panel" title="重点任务信息" style="width: 100%;height: 100%">
    <div  id="form1">
        <div class="nui-toolbar" style="border-bottom:0;padding:0px;">
            <table align="center" border="0" width="100%" class="form_table">
                <tr>
                    <!--
                        <td class="form_label" align = "right" style="width: 5%">申报人</td>
                        <td style="width: 10%">
                            <input name="criteria._expr[2]._value" class="nui-textbox" style="width:100%;" />
                            <input class="nui-hidden" name="criteria._expr[2]._property" value="empname"/>
                            <input class="nui-hidden" name="criteria._expr[2]._op" value="like"/>
                        </td>
                     -->
                    <td class="form_label" align = "center" >重点任务名称

                        <input name="criteria._expr[3]._value" class="nui-textbox" style="width:17%;" />
                        <input class="nui-hidden" name="criteria._expr[3]._property" value="taskName"/>
                        <input class="nui-hidden" name="criteria._expr[3]._op" value="like"/>
                    </td>
                    <!--
                    <td class="form_label" align = "right" id="aa" style="width: 5%">决策情况</td>
                    <td style="width: 20%" id="ab">
                        <input name="criteria._expr[8]._value" class="nui-textbox" style="width:100%;" id="decisionSituation"/>
                        <input class="nui-hidden" name="criteria._expr[8]._property" value="decisionSituation"/>
                        <input class="nui-hidden" name="criteria._expr[8]._op" value="like"/>
                        <input class="nui-hidden" name="criteria._expr[8]._likeRule" value="all"/>
                    </td>

                    <td class="form_label" align = "right" style="width: 7%">申报年度</td>
                      <td colspan="1">
                         <input class="nui-hidden" name="criteria._expr[5]._op" value="between" />
                        <input class="nui-hidden" name="criteria._expr[5]._property" value="declareYear" />
                        <input class="nui-textbox"  id = "min" value="" name="criteria._expr[5]._min" style="width:108px;"/>
                        <span style="border-spacing: 0px; padding-left: 0.2em;padding-right: 0.2em;">至</span>
                        <input class="nui-textbox"   id = "max" name="criteria._expr[5]._max" value="" style="width:108px;"/>
                      </td>
                     -->
                    <!--
                    <td class="form_label" align = "right" id="aa">责任单位</td>
                    <td colspan="1" id="ab">
                        <input name="criteria._expr[4]._value" class="nui-textbox" style="width:25%;" id="orgname"/>
                        <input class="nui-hidden" name="criteria._expr[4]._property" value="orgname"/>
                        <input class="nui-hidden" name="criteria._expr[4]._op" value="like"/>
                        <input class="nui-hidden" name="criteria._expr[4]._likeRule" value="all"/>
                    </td>

                    <!--
                    <td class="form_label" align = "right">年度目标</td>
                    <td colspan="1">
                        <input name="criteria._expr[7]._value" class="nui-textbox" style="width:100%;" />
                        <input class="nui-hidden" name="criteria._expr[7]._property" value="yearTarget"/>
                        <input class="nui-hidden" name="criteria._expr[7]._op" value="like"/>
                    </td>
                    <td class="form_label" align = "right">备注</td>
                    <td colspan="1">
                        <input name="criteria._expr[11]._value" class="nui-textbox" style="width:100%;" />
                        <input class="nui-hidden" name="criteria._expr[11]._property" value="remark"/>
                        <input class="nui-hidden" name="criteria._expr[11]._op" value="like"/>
                    </td>
                    <td class="form_label" align = "right">计划完成时间</td>
                    <td colspan="1">
                        <input class="nui-hidden" name="criteria._expr[9]._op" value="between" />
                        <input class="nui-hidden" name="criteria._expr[9]._pattern" value="yyyy-MM-dd" />
                        <input class="nui-hidden" name="criteria._expr[9]._property" value="planCompleteTime" />
                        <input class="nui-datepicker" style="width: 44%;"  name="criteria._expr[9]._min" />
                        <span style="border-spacing: 0px; padding-left: 0.2em;padding-right: 0.2em;">至</span>
                        <input class="nui-datepicker" style="width: 44%;"  name="criteria._expr[9]._max" />
                    </td>
                 </tr>
                <tr>
                    <td class="form_label" align = "right">完成状态</td>
                    <td colspan="1">
                        <input name="criteria._expr[10]._value" class="nui-dictcombobox" dictTypeId="ZH_WCZT"  shownullItem="true" style="width:100%;"/>
                        <input class="nui-hidden" name="criteria._expr[10]._property" value="completeStatus"/>
                        <input class="nui-hidden" name="criteria._expr[10]._op" value="in"/>
                    </td>
                    <td class="form_label" align = "right">总体目标</td>
                    <td colspan="1">
                        <input name="criteria._expr[6]._value" class="nui-textbox" style="width:100%;" />
                        <input class="nui-hidden" name="criteria._expr[6]._property" value="populationTarget"/>
                        <input class="nui-hidden" name="criteria._expr[6]._op" value="="/>
                    </td>
                     -->
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
    <div >
        <div class="nui-toolbar" style="border-bottom:0;padding:0px;">
            <table style="width:100%;">
                <tr>
                    <td style="width:20%;">
                        <a class="nui-button" id="checkview" iconCls="icon-edit" onclick="editTaskMng()">编辑重点任务</a>
                        <a class="nui-button" id="checkview1" iconCls="icon-new" onclick="sure()">发起月度任务填报</a>
                    </td>
                </tr>
            </table>
        </div>
        <div class="nui-toolbar" style="border-bottom:0;padding:0px;">
            <table style="width:100%;">
                <tr>
                    <td style="width:20%;">
                        <a class="nui-button" id="ydjhxg"  iconCls="icon-unlock" onclick="is_update(1)">月度计划修改权限授权</a>
                        <a class="nui-button" id="noydjhxg" iconCls="icon-lock" onclick="is_update(0)">取消月度计划修改权限</a>
                        <a class="nui-button" id="checkview2" iconCls="icon-new" onclick="sure()">发起月度任务填报</a>
                        <a class="nui-button" id="checkview3" iconCls="icon-redo" onclick="lanuchSelfVote()">发起重点任务自评</a>
                    </td>
                </tr>
            </table>
        </div>
    </div>
    <div class="nui-fit">
        <div id="datagrid1" frozenStartColumn="0"  sizeList="[10,20,50,100]" showPager="true" dataField="keyTaskList"
             showSummaryRow="true"  sortMode="client"
             class="nui-datagrid" style="width:100%;height:100%;" url="com.zhonghe.ame.imptask.keytask.queryTaskList.biz.ext"
             multiSelect="true" allowSortColumn=true >
            <div property="columns">
                <div name="temp123" type="checkcolumn"></div>
                <div field="taskCode" width="100" align="center" headerAlign="center" allowSort="true" renderer="lookInfo">任务编号</div>
                <div field="taskName" width="150" align="center" headerAlign="center" allowSort="true">重点任务名称</div>
                <div field="declareYear" width="55" align="center" headerAlign="center" allowSort="true" >申报年度</div>
                <div field="orgname" width="90" align="center" headerAlign="center" allowSort="true" >责任单位</div>
                <div field="populationTarget" width="140" align="center" headerAlign="center" allowSort="true" >总体目标</div>
                <div field="yearTarget" width="140" align="center" headerAlign="center" allowSort="true"  >年度目标</div>
                <div field="decisionSituation" width="120" align="center" headerAlign="center" >决策情况</div>
                <div field="planCompleteTime" width="80" align="center" headerAlign="center" >计划完成时间</div>
                <div field="completeStatus" width="55" align="center" headerAlign="center" allowSort="true" renderer="check">完成状态</div>
                <div field="empname" width="60" align="center" headerAlign="center" allowSort="true" >申报人</div>
                <div field="isUpdate" width="60" align="center" headerAlign="center" renderer="getIsUpdate" allowSort="true" >是否授权</div>
                <div field="appStatus" width="140" align="center" headerAlign="center" allowSort="true"  renderer="getValue">状态</div>
            </div>
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
    	if(type==1){
	    	document.getElementById("checkview").style.display="none";
	    	document.getElementById("checkview1").style.display="none";
	    	document.getElementById("checkview2").style.display="none";      	
	    	document.getElementById("ydjhxg").style.display="none";
	    	document.getElementById("noydjhxg").style.display="none";
    	}else if (type==3){
	    	document.getElementById("checkview1").style.display="none";
	    	document.getElementById("checkview").style.display="none";
    	}
    	init();
    	function init(){
    		grid.load({type:type});
    		grid.sortBy("tbdate","desc");
    		//search()
		}
		
		function getIsUpdate(e){
			if(e.value==0){
				return "否";
			}else if(e.value==1){
				return "是";
			}else{
				return "";
			}
		}
		
		function getValue(e){
			if(e.value==0){
				return "未下发";
			}else if(e.value==1){
				return "月度计划填报中";
			}else if(e.value==2){
				return "月度计划审核中";
			}else if(e.value==3){
				return "申报部门执行中";
			}else if(e.value==4){
				return "作废";
			}else if(e.value==5){
				return "已下发";
			}else if(e.value==6){
				return "退回";
			}
		}
		
		function lanuchSelfVote(e){
			var row = grid.getSelecteds();
			//var json = nui.encode(row);
			//console.log(row[0].completeStatus);
			if (row.length == 0){
				showTips
				("请选中一条记录","提示");
			} 
			for(var i = 0;i < row.length;i++) {
				if(row[i].appStatus != 3 || row[i].isSelfValuate != 0 ) {
					showTips
					("所选数据不符合重点任务自评要求","提示");
				}
				if(row.length != 0 && row[i].appStatus == 3 && row[i].isSelfValuate == 0) {
					var json = nui.encode({id:row[i].id});
					ajaxCommon({
						
						 url: "com.zhonghe.ame.imptask.keyTaskVote.lanuchSelfVote.biz.ext",
						 data: json,
						 success: function(data) {
						 	if(data.result == 1){
					        	showTips("发起成功")
			        			CloseWindow("ok");
							}else{
								showTips("发起失败，请联系信息技术部人员")
								CloseWindow("ok");
							}
						}
					});
				}
			}
		}
		
		//发起月度计划填报
		function sure(e){
			var row = grid.getSelecteds();
			var params = [],count = 0;
			if (row.length != 0) {
				for(var i = 0 ;i<row.length;i++){
					var mngJsonData = row[i];
					if(mngJsonData.appStatus==5){
						params.push({id:mngJsonData.id,createUserid:mngJsonData.createUserid})
					}
				}
				count = params.length;
				if(count==0){
					showTips("无可发起数据，请检查所选数据状态是否为已下发");
					grid.reload();
					return;
				}
				var json = nui.encode({"params":params});
				 ajaxCommon({
					"url": "com.zhonghe.ame.imptask.IssueKeyTask.InitiatingTaskFilling.biz.ext",
					"data": json,
					"success": function(data) {
						if(data.result == 1){
							showTips("发起成功"+count+"条");
							grid.reload();
	                	 }
					}
				});	
			}else{
				showTips
				("请选中一条记录","提示");
			}
		}
		
		function check(e){
			if(e.value == 1){
				return "已完成";
			}else{
				return "未完成";
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
			var executeUrl = "<%= request.getContextPath() %>/imptask/keyTaskAudit/keyTaskMngDetail.jsp?id=" + reiid;
			window.open(executeUrl);
	    }
		function search() {
			var form = new nui.Form("#form1");
			var data = form.getData(); //获取表单JS对象数据
			data.type=type;
		  	grid.load(data); //datagrid加载数据
		}
		function reset(){
			var form = new nui.Form("#form1");
			form.reset();
			grid.load();
		}
		
		
		
		
		function is_update(e){
			console.log(e);
			var row = grid.getSelecteds();
			if (row.length != 0) {
				var ids = "";
				for(var i=0;i<row.length;i++){
					if(ids==""){
						ids = row[i].id;
					}else{
						ids = ids+","+row[i].id;
					}
				}
				if(ids == ""){
					return;
				}
				var mngJsonData = row[0];
				var json = nui.encode({"ids":ids,"status":e});
				var msg = ""
				if(e==1){
					msg="确定授权？"
				}else{
					msg="确定取消授权?"
				}
				console.log(json);
				if(!confirm(msg)){
        				return;
    			}else{
    				ajaxCommon({
						"url": "com.zhonghe.ame.imptask.keytask.isupdate.biz.ext",
						"data": json,
						"success": function(data) {
							showTips("操作成功")
							grid.reload();
						}
					});	
				}
			}else{
				nui.alert("请选中一条记录","提示");
			}
			
		}
		
		//修改
		function editTaskMng(){
    		var row = grid.getSelecteds();
			if (row.length > 1) {
    		showTips("只能选中一条项目记录进行编辑");
    		}else{
	    		var row=row[0];
				if (row) {
					nui.open({
						url: "/default/imptask/editKeyTask.jsp?id="+row.id,
						width: 1115,
						height: 522,
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
		//回车触发
		function onKeyEnter(){
			search();
		}
		
</script>
</body>
</html>
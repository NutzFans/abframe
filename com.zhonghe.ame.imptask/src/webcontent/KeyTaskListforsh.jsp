<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@include file="/purchase/common/common.jsp"%>
<html>
<head>
<title>重点任务审核</title>
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
                    <td class="form_label" align = "right">申报状态</td>
                    <td colspan="1">
                        <input name="criteria._expr[6].appStatus" class="nui-combobox" id="appStatus" textField="text" valueField="id"  showNullItem="true" style="width:100px;" />
                        <input class="nui-hidden" name="criteria._expr[6]._op" value="="/>
                    </td>
                    <td class="form_label" align = "right">申报人</td>
                    <td colspan="1">
                        <input name="criteria._expr[1]._value" class="nui-textbox" style="width:80px;" />
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
                    <td class="form_label" align = "right">申报年度:</td>
                    <td colspan="1">
                        <input class="nui-hidden" name="criteria._expr[5]._op" value="between" />
                        <input class="nui-hidden" name="criteria._expr[5]._property" value="declareYear" />
                        <input class="nui-textbox"  id = "min" value="" name="criteria._expr[5]._min" style="width:108px;"/>
                        <span style="border-spacing: 0px; padding-left: 0.2em;padding-right: 0.2em;">至</span>
                        <input class="nui-textbox"   id = "max" name="criteria._expr[5]._max" value="" style="width:108px;"/>
                    </td>
                    <!-- <td class="form_label" align = "right">申报状态</td>
                    <td colspan="1">
                      <input name="criteria._expr[7]._value" class="nui-dictcombobox" dictTypeId="ZH_BIDSTATUS"  shownullItem="true" style="width:150px;"/>
                      <input class="nui-hidden" name="criteria._expr[7]._property" value="bidstatus"/>
                      <input class="nui-hidden" name="criteria._expr[7]._op" value="in"/>
                    </td> -->
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
                        <a class="nui-button" id="zdrwsh_xz" iconCls="icon-add" onclick="add()">新增重点任务</a>
                        <a class="nui-button" id="zdrwsh_bj" iconCls="icon-edit" onclick="editTaskMng()">编辑重点任务</a>
                        <a class="nui-button" id="zdrwsh_xf" iconCls="icon-download" onclick="updateAppStatus()">下发</a>
                        <a class="nui-button" id="zdrwsh_th" iconCls="icon-no" onclick="return1()">退回</a>
                        <a class="nui-button" id="zdrwsh_th" iconCls="icon-undo" onclick="recover()">恢复原始申报数据</a>
                    </td>
                </tr>
            </table>
        </div>
    <div class="nui-fit">
        <div id="datagrid1" frozenStartColumn="0"  sizeList="[10,20,50,100]" showPager="true" dataField="data"
             sortMode="client"
             class="nui-datagrid" style="width:100%;height:100%;" url="com.zhonghe.ame.imptask.newKeytaskMng.queryKeytaskMngs.biz.ext"
             multiSelect="true" allowSortColumn="true" >
            <div property="columns">
                <div name="temp123" type="checkcolumn"></div>
                <div field="taskName" width="150" align="center" headerAlign="center" allowSort="true" renderer="lookInfo">任务名称</div>
                <div field="declareYear" width="70" align="center" headerAlign="center" allowSort="true" >申报年度</div>
                <div field="orgname" width="80" align="center" headerAlign="center" allowSort="true" >责任单位</div>
                <div field="populationTarget" width="90" align="center" headerAlign="center" allowSort="true" >总体目标</div>
                <div field="yearTarget" width="80" align="center" headerAlign="center" allowSort="true"  >年度目标</div>
                <div field="decisionSituation" width="120" align="center" headerAlign="center" >决策情况</div>
                <div field="planCompleteTime" width="150" align="center" headerAlign="center" >计划完成时间</div>
                <div field="ischange" width="150" align="center" headerAlign="center" renderer="ischange">是否变更</div>
                <div field="completeStatus" width="80" align="center" headerAlign="center" allowSort="true" renderer="check">完成状态</div>
                <div field="empname" width="120" align="center" headerAlign="center" allowSort="true" >申报人</div>
                <div field="appStatus" width="120" align="center" headerAlign="center" allowSort="true" renderer="getValue" >申报状态</div>
                <!--  <div field="remark" width="120" align="center" headerAlign="center" allowSort="true" >备注</div> -->
            </div>
        </div>
    </div>
</div>
<script type="text/javascript">
    	nui.parse();
		var form = new nui.Form("#form1");
    	var grid = nui.get("datagrid1");
    	var newYear = nui.formatDate(new Date(),"yyyy");
    	var statusData = [{ id: 0, text: '未下发' },{ id:5, text: '已下发' },{ id: 6, text: '退回' },{ id: 1, text: '申报部门填报月度计划' }, { id: 2, text: '审核月度计划'}, { id: 3, text: '申报部门执行中'}, { id: 4, text: '流程终止'}];
    	
		nui.get("appStatus").setData(statusData);
    	init()
    	function init(){
    		nui.get("min").setValue(newYear);
    		nui.get("max").setValue(newYear);
    		//按钮权限的控制
	    	getOpeatorButtonAuth("zdrwsh_xz,zdrwsh_bj,zdrwsh_th,zdrwsh_xf");//操作按钮权限初始化
    		//code:对应功能编码，map：对于机构的查询条件
			var json = {"code":"zdrwsh","map":{"property":"status","op":"=","value":"running"}};
			search();
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
		
		//下发 更新appStatus 状态为5
		function updateAppStatus(){
			var newRows=[],keyTask=[];
			var rows = grid.getSelecteds();
			if(rows.length>0){
				for(var i = 0;i<rows.length;i++){
					if(rows[i].appStatus==0||rows[i].appStatus==2){
						newRows.push({"id":rows[i].id,"appStatus":"5","completeStatus":"2"})
						keyTask.push({"id":rows[i].pid,"completeStatus":"2"})
					}
				}
				if(newRows.length<1){
					showTips("所选数据中无可恢复数据,请重试")		
					return
	            }else{	
					var json = nui.encode({"param":newRows,"keyTask":keyTask});
					clog(json);
					ajaxCommon({
						"url": "com.zhonghe.ame.imptask.newKeytaskMng.updataKeyTaskMngAppstatus.biz.ext",
						"data": json,
						"success": function(data) {
							showTips("下发成功")
							grid.reload();
						}
					});
				}
			}else{
				showTips("请选择至少一条数据");	
			}
		}
		
		//退回appStatus 状态为6 
		function return1(){
			var newRows=[],keyTask=[];
			var rows = grid.getSelecteds();
			if(rows.length>0){
				for(var i = 0;i<rows.length;i++){
					if(rows[i].appStatus==0){
						newRows.push({"id":rows[i].id,"appStatus":"4","completeStatus":"1"})
						keyTask.push({"id":rows[i].pid,"appStatus":"2","completeStatus":"1"})
					}
				}
				if(newRows.length<1){
					showTips("所选数据中无可退回数据,请重试")		
					return
	            }else{	
					var json = nui.encode({"param":newRows,"keyTask":keyTask});
					clog(json);
					ajaxCommon({
						"url": "com.zhonghe.ame.imptask.newKeytaskMng.updataKeyTaskMngAppstatus.biz.ext",
						"data": json,
						"success": function(data) {
							showTips("下发成功")
							grid.reload();
						}
					});
				}
			}else{
				showTips("请选择至少一条数据");	
			}
		}
		//恢复原始申报数据
		function recover(){
			var rows = grid.getSelecteds();
			var newRows=[];
			if(rows.length>0){
				for(var i = 0;i<rows.length;i++){
					if(rows[i].appStatus==0){
						newRows.push({"id":rows[i].id})
					}
				}
				if(newRows.length<1){
					showTips("所选数据中无可恢复数据,请重试")		
					return
	            }else{
	            var json = nui.encode({"param":newRows});
	            	ajaxCommon({
						"url": "com.zhonghe.ame.imptask.newKeytaskMng.recoverKeyTaskMng.biz.ext",
						"data": json,
						"success": function(data) {
							showTips("恢复成功")
							grid.reload();
						}
					});
	            }
			}else{
				showTips("请选中一条记录");
			}
		}
		
		
		function check(e){
			if(e.value==1){
				return "未开始";
			}else if(e.value==2){
				return "进行中";
			}else if(e.value==0){
				return "已完成";
			}
		}
		function ischange(e){
			if(e.value=="0"){
				return "未变更";
			}else if(e.value=="1"){
				return "已变更";
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
			clog(data)
		  	grid.load(data); //datagrid加载数据
		}
		function reset(){
			var form = new nui.Form("#form1");
			form.reset();
			init();
		}
		//修改
		function editTaskMng(){
    		var row = grid.getSelecteds();
    		if(row.length>0){
    			if (row.length > 1) {
    			showtips("只能选中一条项目记录进行编辑");
	    		}else{
	    		var row=row[0];
				if (row) {
					if(row.appStatus=="0"){
						nui.open({
							url: "/default/imptask/editKeyTask.jsp?id="+row.id,
							width: "80%",
							height: 540,
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
						showTips("只有未下发状态才能编辑");
					}
				
				}
				
	    		}
    		}else{
    			nui.alert("请选中一条记录","提示");
    		}
			
		}
	 function add(){
		nui.open({
			url: "/default/imptask/addimptask2.jsp",
			width: "70%",
			height: "50%",
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
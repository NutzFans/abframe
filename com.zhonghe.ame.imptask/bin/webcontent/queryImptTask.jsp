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
    </style>
</head>
<body>
	<div class="nui-panel" title="重点任务信息列表" style="width:100%; height: 100%">
        <div  id="form1">
	        <div class="nui-toolbar" style="border-bottom:0px;padding:0px;">
	        </div>
		  <div class="nui-toolbar" style="border-bottom:0;padding:0px;">
			  <table align="center" border="0" width="100%" class="form_table">
		        <tr>
		        <td class="form_label" align = "right">申报状态</td>
		          <td colspan="1">
			    	<input name="criteria._expr[6].appStatus" class="nui-combobox" id="appStatus" textField="text" valueField="id"  showNullItem="true" style="width:70px;" />
				    <input class="nui-hidden" name="criteria._expr[6]._op" value="="/>
		          </td>	
		        <td class="form_label" align = "right">申报人</td>
		          <td colspan="1">
			    	<input name="criteria._expr[1]._value" class="nui-textbox" style="width:80px;" id="createname"/>
				    <input class="nui-hidden" name="criteria._expr[1]._property" value="empname"/>
				    <input class="nui-hidden" name="criteria._expr[1]._op" value="="/>
				     <input name="criteria._expr[4]._value" class="nui-hidden" id="createUserid"/>
				    <input class="nui-hidden" name="criteria._expr[4]._property" value="createUserid"/>
		          </td>
		          <td class="form_label" align = "right">重点任务名称</td>
		          <td colspan="1">
			    	<input name="criteria._expr[2]._value" class="nui-textbox" style="width:120px;" />
				    <input class="nui-hidden" name="criteria._expr[2]._property" value="taskName"/>
				    <input class="nui-hidden" name="criteria._expr[2]._op" value="like"/>
		          </td>		
		          <td class="form_label" align = "right">申报年度:</td>
		          <td colspan="1">
             	    <input class="nui-hidden" name="criteria._expr[5]._op" value="between" />
                    <input class="nui-hidden" name="criteria._expr[5]._property" value="declareYear" />
                    <input class="nui-textbox"  id = "min" value="" name="criteria._expr[5]._min" style="width:70px;"/>
                    <span style="border-spacing: 0px; padding-left: 0.2em;padding-right: 0.2em;">至</span>
                    <input class="nui-textbox"   id = "max" name="criteria._expr[5]._max" value="" style="width:70px;"/>
		          </td>	
		                    
		          <td class="form_label" align = "right" id="aa">责任单位</td>
		          <td colspan="1" id="ab">
				     <input id="orgid2"  name="criteria._ref[0]._expr[0]._value" style="width:200px;" class="nui-combobox" 
					textField="orgname" valueField="orgseq" dataField="orgs" showNullItem="true" allowInput="true"/>
            		<input class="nui-hidden" name="criteria._expr[0]._property" value="orgId"/>
			        <input class="nui-hidden" name="criteria._expr[0]._op" value="in" id="tempCond1"/>
			        <input class="nui-hidden" name="criteria._expr[0]._ref" value="1" id="tempCond2"/>
			        <input class="nui-hidden" name="criteria._ref[0]._id" value="1"/>
			        <input class="nui-hidden" name="criteria._ref[0]._entity" value="org.gocom.abframe.dataset.organization.OmOrganization"/>
			        <input class="nui-hidden" name="criteria._ref[0]._select._field[0]" value="orgid"/>
			        <input class="nui-hidden" name="criteria._ref[0]._expr[0]._property" value="orgseq"/>
			        <input class="nui-hidden" name="criteria._ref[0]._expr[0]._op" value="like"/>
			        <input class="nui-hidden" name="criteria._ref[0]._expr[0]._likeRule" value="end"/>
			        <input class="nui-hidden" name="criteria._expr[3]._property" value="orgId"/>
			        <input class="nui-hidden" name="criteria._expr[3]._op" value="in"/>
			        <input class="nui-hidden" name="criteria._expr[3]._value" id="orgids2"/>
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
	<div class="nui-toolbar" style="border-bottom:0;padding:0px;">
        <table style="width:100%;">
        	<tr>
                <td style="width:20%;">
                	 <a class="nui-button" id=zdrwsbcx_add iconCls="icon-add" onclick="add()">新增</a>
		            <a class="nui-button" id="zdrwsbcx_edit" iconCls="icon-edit" onclick="editTaskMng()">编辑</a>
		            <a class="nui-button" id="zdrwsbcx_submit" iconCls="icon-ok" onclick="sure()">提交</a>
		        </td>
            </tr>
        </table>           
    </div>
    <div id="datagrid1" frozenStartColumn="0" showPager="true" dataField="keyTaskList" 
    	sortMode="client" 
    	class="nui-datagrid" style="width:100%;height:100%;" url="com.zhonghe.ame.imptask.keytask.queryDeclaredTask.biz.ext" 
    	multiSelect="true" allowSortColumn=true>
        <div property="columns">
       		<div name="temp123" type="checkcolumn"></div>
        	<div field="taskName" width="150" align="center" headerAlign="center" allowSort="true" renderer="lookInfo">任务名称</div>
            <div field="declareYear" width="120" align="center" headerAlign="center" allowSort="true" >申报年度</div>
            <div field="orgname" width="80" align="center" headerAlign="center" allowSort="true" >责任单位</div>
            <div field="populationTarget" width="90" align="center" headerAlign="center" allowSort="true" >总体目标</div>
            <div field="yearTarget" width="80" align="center" headerAlign="center" allowSort="true"  >年度目标</div>
            <div field="decisionSituation" width="120" align="center" headerAlign="center" >决策情况</div>
            <div field="planCompleteTime" width="150" align="center" headerAlign="center" >计划完成时间</div>
            <div field="completeStatus" width="80" align="center" headerAlign="center" allowSort="true" renderer="check">完成状态</div>
           	<div field="empname" width="120" align="center" headerAlign="center" allowSort="true" >申报人</div>
            <div field="appStatus" width="80" align="center" headerAlign="center" allowSort="true" renderer="getValue">申报状态</div> 
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
    	var newYear = nui.formatDate(new Date(),"yyyy");
    	var statusData = [{ id: 1, text: '已提交' }, { id: 2, text: '退回'}, { id: 3, text: '未提交'}];
		nui.get("appStatus").setData(statusData);
    	init();
    	function init(){
    		nui.get("min").setValue(newYear);
    		nui.get("max").setValue(newYear);
    		//按钮权限的控制
	    	getOpeatorButtonAuth("zdrwsbcx_add,zdrwsbcx_edit,zdrwsbcx_submit");//操作按钮权限初始化
    		//code:对应功能编码，map：对于机构的查询条件
			var json = {"code":"zdrwsbcx","map":{"property":"status","op":"=","value":"running"}};
    		ajaxCommon({
				"url": "com.primeton.eos.ame_auth.ame_auth.getownorg1.biz.ext",
				"data": json,
				"success": function(data) {
					if(data.orgs){
						if(data.orgs.length==0){
							//当没有有权的机构时将申请人设置为登陆人
							nui.get("createUserid").setValue(userId);
							nui.get("createname").setValue(userName);
							nui.get("createname").setReadOnly(true);
						}
						//根据情况选择一种
						nui.get("orgid2").setData(data.orgs);
						nui.get("orgids2").setValue(data.orgids);
					}else{
						//当没有有权的机构时将申请人设置为登陆人
							nui.get("createUserid").setValue(userId);
							nui.get("createname").setValue(userName);
							nui.get("createname").setReadOnly(true);
					}
					search();
				}
			});	
		}
		function getValue(e){
			if(e.value==1){
				return "已提交";
			}else if(e.value==2){
				return "退回";
			}else if(e.value==5){
				return "已提交";
			}else if(e.value==3){
				return "未提交";
			}else if(e.value==0) {
				return "未下发";
			}
		}
		function check(e){
			if(e.value==1){
				return "未开始";
			}else if(e.value==2){
				return "进行中";
			}else if(e.value==3){
				return "已完成";
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
				nui.alert("查询信息有误");
			}else{
				return "<a href='javascript:void(0)' onclick='doView("+ bidid +");' title='点击查看'>" + e.value + "</a>";
			}
		}
	    function doView(reiid){
			var executeUrl = "<%= request.getContextPath() %>/imptask/keyTaskDetail.jsp?id=" + reiid;
			window.open(executeUrl);
	    }
		function search() {
			var form = new nui.Form("#form1");
			var data = form.getData(); //获取表单JS对象数据
		  	grid.load(data); //datagrid加载数据
		}
		function reset(){
			form.reset();
			init();
		}
		
		//修改
		function editTaskMng(){
    		var rows = grid.getSelecteds();
			if (rows.length > 0) {
    			var row=rows[0];
    			if(row.appStatus!=1){
					nui.open({
						url: "/default/imptask/keyTaskVote/editKeyTask1.jsp?id="+row.id,
						width: "70%",
						height: "60%",
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
					showTips("已提交无法编辑");
    			}
			}else{
    			showTips("请选中一条项目记录进行编辑");
    		}
		}
		
	function sure(e){	
		var row = grid.getSelecteds();
		clog(row);
		var newRows=[];
		if (row.length != 0) {
			for(var i = 0;i<row.length;i++){
				if(row[i].appStatus==3){
					newRows.push({"id":row[i].id})
				}
			}
			if(newRows.length<1){
				showTips("无可提交数据，请重试")		
				return
			}else{
				var json = nui.encode({"param":newRows});
				clog(json);
				ajaxCommon({
					"url": "com.zhonghe.ame.imptask.newKeytask.submitKeyTasks.biz.ext",
					"data": json,
					"success": function(data) {
						showTips("提交成功")
						grid.reload();
					}
				});	
			}								
		}else{
			nui.alert("请选中一条记录","提示");
		}
	}
	
	
	 function add(){
		nui.open({
			url: "/default/imptask/addimptask.jsp",
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
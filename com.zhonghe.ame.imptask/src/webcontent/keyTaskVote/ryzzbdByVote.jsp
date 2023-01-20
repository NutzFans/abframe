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
<title>人员组织绑定</title>
	<meta http-equiv="content-type" content="text/html; charset=UTF-8" />
	<script src="<%= request.getContextPath() %>/common/nui/nui.js" type="text/javascript"></script>
	<style type="text/css">
	    .nui-radiobuttonlist-item{
	    	float: left;
		    margin-left: 200px;
		    color: pink;
		 }
		  .New_Button{
		        font-size:11px;color:#1B3F91;font-family:Verdana;  
		        margin-right:5px;
		 }
    </style>
</head>
<body>
<div id = "formQ">
	<div class="nui-panel" title="人员组织绑定" style="width:100%;">
        <div id="form1">
	        <div class="nui-toolbar" style="border-bottom:0px;padding:0px;">
	        <table align="center" border="0" width="100%" class="form_table">
		      <tr>
		          <td class="form_label" align = "right">人员名称:</td>
		          <td >
			    	<input name="param.EMPNAME" value="" align="right"  class="nui-textbox" style="width:150px;" />
		          </td>
		          <td class="form_label" align = "right">人员部门:</td>
		           <td >
					 <input name="param.ORGID"  class="nui-dictcombobox" textField="orgname" valueField="orgid" emptyText="请选择..." dataField="Orgs" url="com.zhonghe.ame.imptask.keyTaskVote.queryOrganizationOrgid.biz.ext"  shownullItem="true" style="width:150px;"/>
		           </td>		          
		      </tr>
			  <tr>
		          <td colspan="9" align="center">
			          <a class="nui-button" id="search" iconCls="icon-search" onclick="query()">查询</a>
			          <a class="nui-button" id="reset" iconCls="icon-reload" onclick="reset()">重置</a>
			      </td>
		      </tr>
		    </table>
	        </div>
		  <div class="nui-toolbar" style="border-bottom:0;padding:0px;">
		  
			  <table align="center" border="0" width="100%" class="form_table">
			  <tr>
		            <td colspan="9" align="left">
		                <a class="nui-button" id="checkview" iconCls="icon-add" onclick="add()">添加人员组织</a>
		            	<a class="nui-button" id="resets" iconCls="icon-remove" onclick="removeEmp()">删除人员组织</a>
			        </td>
		        </tr>
		      </table>
			</div>
</div>
<div >
    <div id="datagrid1" frozenStartColumn="0"  sizeList="[10,20,50,100]" showPager="true" dataField="EmpOrgs" 
    	showSummaryRow="true"  sortMode="client"  ondrawsummarycell="onDrawSummaryCell"
    	class="nui-datagrid" style="width:100%;height:500px;" url="com.zhonghe.ame.imptask.keytask.queryOrgEmpbyCond.biz.ext" 
    	multiSelect="false" allowSortColumn=true onshowrowdetail="onShowRowDetail" >
        <div property="columns"> 
        	<div name="temp123" type="checkcolumn" width="10"></div>
            <div field="EMPNAME" width="110" align="center" headerAlign="center" allowSort="true">人员名字</div>
            <div field="ORGNAME" width="120" align="center" headerAlign="center" >已绑定部门</div>
            <div field="ORGID"   width="120" align="center" headerAlign="center" >部门ID</div>
            <div field="USERID"   width="120" align="center" headerAlign="center" >人员ID</div>
        </div>
        </div>
		</div>
	</div>
</div>
<script type="text/javascript">
    	nui.parse();
    	//var formQ = new nui.Form("formQ");
		var form = new nui.Form("#form1");
		var data = form.getData();
    	var grid = nui.get("datagrid1");
    	var om = nui.get("queryOM");
    	var type = <%=request.getParameter("type")%>;
		<!--var reve_grid = nui.get("reve_grid");-->
    	var json=nui.encode({"iden": "1","expseq": null,"feeseq": null,"parentfeetypeid": null});
    	
    	$(function(){
    		grid.load();
    	});
    	
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
		function addEmpOrg() {
			if(obj == null || obj1 == null) {
				nui.alert("选项不能为空");
			}
		}
		
		function query() {
			var eos = form.getData();
			var json = nui.encode(eos);
			//console.log(json);
			grid.load(eos);
		}
		
		function removeEmp() {
			var row = grid.getSelecteds();
	
	    		var row=row[0];
	    		console.log(row);
				if (row) {
					var json = nui.encode({USERID:row.USERID,ORGID:row.ORGID});
					nui.ajax({
						    url: "com.zhonghe.ame.imptask.keytask.deleteOrgEmp.biz.ext",
							type: 'POST',
							data: json,	
							contentType: 'text/json',
						    success: function (o) {
						           if(o.result==1){
						           		nui.showTips({
						           			content:"删除人员组织绑定成功",
						           			state: "success",
						           			x:"center",
						           			y:"center",
						           			timeout: 2000.
						           		});
						           		grid.reload();
			                	 }else{
			                	 nui.alert("删除人员组织绑定失败，请联系信息技术部人员！","系统提示", function(action){
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
		
		function getValue() {
            if(obj.getValue() == "" || obj1.getValue() == "") {
				nui.alert("选项不能为空");
			} else {
				var json = nui.encode({"userId":obj.getValue(),"orgId":obj1.getValue()});
				clog(json)
				nui.ajax({
					url:"com.zhonghe.ame.imptask.keyTaskVote.addOrgEmp.biz.ext",
					type: 'post',
					data: json,	
					contentType: 'text/json',
					success: function (o) {
						if(o.result==1){
		                	nui.alert("添加组织成功","系统提示",function(){
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
		
		function lookInfo(e) {
			
			var bidid = e.row.id;
			if(bidid==0 || bidid==null ){
				nui.alert("查询信息有误");
			}else{
				return "<a href='javascript:void(0)' onclick='doView("+ bidid +");' title='点击查看'>" + e.value + "</a>";
			}
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
		
	
		//回车触发
		function onKeyEnter(){
			search();
		}
		
		function getExpRei(e){
	    	if(e.value){
	    		return "<a href='javascript:void(0)' onclick='checkExpNo("+ e.value +");' title='点击查看'>" + e.value + "</a>";
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
	
	function add(){
		nui.open({
			url: "/default/imptask/keyTaskVote/addRyzz.jsp",
			width: 500,
			height: 250,
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
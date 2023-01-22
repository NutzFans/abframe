<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@include file="/common/common.jsp"%>
<%@include file="/common/skins/skin0/component.jsp" %>
<%@ page import="com.eos.data.datacontext.UserObject"%>
<%@page import="commonj.sdo.DataObject"%>
<%@page import="java.util.Map"%>
<html>
<!-- 
  - Author(s): 李鹏程
  - Date: 2020-04-09 10:55:20
  - Description:
-->
<head>
<title>员工导师关系信息查询</title>
<script src="<%= request.getContextPath() %>/common/nui/nui.js" type="text/javascript"></script>
</head>
<body>
<div style="width:100%;height:100%;padding:0px;margin:0px;" >
	<div style="width:100%;">
        <div class="nui-toolbar" style="border-bottom:0;padding:0px;">
            <table style="width:100%;">
            	<tr>
                    <td style="width:20%;">
                       	员工导师关系信息查询	
                    </td>
                </tr>
             </table>           
        </div>
    </div>
    <div id="form1" class="nui-toolbar" style="border-bottom:0;padding:0px;">
    	<input 	class="nui-hidden" name="emptutor._entity" value="org.gocom.abframe.dataset.organization.QueryEmpTutor"/>
    	<input   class="nui-hidden"  id=userid/>
    	<input   class="nui-hidden" id=tutorid/>
    	
    	<table style="width:100%;">
    		<tr>
			 	<td align="right" style="width: 90px">员工姓名：</td>
			 	<td>
			 		<input class="nui-textbox" name="emptutor._expr[0]._value" id = "empname" onenter="onKeyEnter" style="width: 195px"/>
		 		 	<input class="nui-hidden" name="emptutor._expr[0]._property" value="empname"/>
                    <input class="nui-hidden" name="emptutor._expr[0]._op" value="like"/>
			    </td>
			    <td align="right" style="width: 120px">导师姓名：</td>
            	<td>
			 		<input class="nui-textbox" name="emptutor._expr[1]._value" id = "tutorempname" onenter="onKeyEnter" style="width: 195px"/>
		 		 	<input class="nui-hidden" name="emptutor._expr[1]._property" value="tutorempname"/>
                    <input class="nui-hidden" name="emptutor._expr[1]._op" value="like"/>
			    </td>
			    <td align="right">有效开始时间：</td>
            	<td align="left">
				    <input class="nui-datepicker" id="min1" name="emptutor._expr[2]._min" style="width:95px" onenter="onKeyEnter"/>-<input class="nui-datepicker" id="max1" name="emptutor._expr[2]._max" onenter="onKeyEnter" style="width:95px"/>
		 		 	<input class="nui-hidden" name="emptutor._expr[2]._property" value="effectstarttime"/>
                    <input class="nui-hidden" name="emptutor._expr[2]._op" value="between"/>
				</td>
    	   </tr>
    	   <tr>
    	       
    	        <td align="right" >有效结束时间：</td>
	            <td align="left" >
					    <input class="nui-datepicker" id="min1" name="emptutor._expr[3]._min" style="width:95px" onenter="onKeyEnter"/>-<input class="nui-datepicker" id="max1" name="emptutor._expr[3]._max" style="width:100px" onenter="onKeyEnter"/>
			 		 	<input class="nui-hidden" name="emptutor._expr[3]._property" value="effectendtime"/>
	                    <input class="nui-hidden" name="emptutor._expr[3]._op" value="between"/>
				</td>
				<td align="right">记录写入时间：</td>
	        	<td align="left">
				    <input class="nui-datepicker" id="min1" name="emptutor._expr[4]._min" style="width:95px" onenter="onKeyEnter"/>-<input class="nui-datepicker" id="max1" name="emptutor._expr[4]._max" style="width:95px" onenter="onKeyEnter"/>
		 		 	<input class="nui-hidden" name="emptutor._expr[4]._property" value="recordtime"/>
	                <input class="nui-hidden" name="emptutor._expr[4]._op" value="between"/>
				</td>
				<td align="right" >最后修改时间：</td>
	            <td align="left">
					    <input class="nui-datepicker" id="min1" name="emptutor._expr[5]._min" style="width:95px" onenter="onKeyEnter"/>-<input class="nui-datepicker" id="max1" name="emptutor._expr[5]._max" style="width:100px" onenter="onKeyEnter"/>
			 		 	<input class="nui-hidden" name="emptutor._expr[5]._property" value="lastchangetime"/>
	                    <input class="nui-hidden" name="emptutor._expr[5]._op" value="between"/>
				</td>
		   </tr> 
		   <tr>
		        <td align="right" style="width: 120px">记录写入人：</td>
            	<td>
			 		<input class="nui-textbox" name="emptutor._expr[6]._value" id = "recordwriter" onenter="onKeyEnter" style="width: 195px"/>
		 		 	<input class="nui-hidden" name="emptutor._expr[6]._property" value="recordwriter"/>
                    <input class="nui-hidden" name="emptutor._expr[6]._op" value="like"/>
			    </td>
			 	<td align="right" style="width: 120px">最终修改用户：</td>
            	<td>
			 		<input class="nui-textbox" name="emptutor._expr[7]._value" id = "lastchanger" onenter="onKeyEnter" style="width: 195px"/>
		 		 	<input class="nui-hidden" name="emptutor._expr[7]._property" value="lastchanger"/>
                    <input class="nui-hidden" name="emptutor._expr[7]._op" value="like"/>
			    </td>
			    
			    <td align="right" style="width: 120px">员工部门：</td>
            	<td>
			 		<input class="nui-treeselect" expandOnLoad="0"
							textField="orgname" valueField="orgid" parentField="parentorgid" dataField="orgs" showTreeIcon="true" valueFromSelect="true" id="syb"
							showNullItem="true" multiSelect="true" checkRecursive = "true" showFolderCheckBox="true"
							name="emptutor._expr[8]._value" style="width:220px;"  nullItemText=""/>
							<input class="nui-hidden" name="emptutor._expr[8]._property" value="orgid"/>
							<input class="nui-hidden" name="emptutor._expr[8]._op" id="tempCond81" value="in"/>
							<input class="nui-hidden" name="emptutor._expr[9]._property" value="orgid"/>
							<input class="nui-hidden" name="emptutor._expr[9]._op" id="tempCond82" value="in"/>
							<input class="nui-hidden" name="emptutor._expr[9]._value" id="syb1"/>
			    </td>
		   </tr> 
		   <tr> 
		   		<td align="center" colspan="6">
    				<a class="nui-button" id="search" iconCls="icon-search" onclick="search()">查找</a>
                    <a class="nui-button" id="reset" iconCls="icon-reload" onclick="reset()">重置</a>
                    <a class="nui-button" id="EmpTutorList_exportEmpTutor"  iconCls="icon-download" onclick="exportempTutor()">导出</a>
                    
    			</td>
    		</tr>	
    	</table>
    </div>
	<div style="width:100%;">
	    <div class="nui-toolbar" id="toolbars" style="border-bottom:0;padding:0px;">
	        <table style="width:100%;">
	            <tr>
	                    <td style="width:20%;">
				            <a class="nui-button" id="EmpTutorList_addEmpTutor"  iconCls="icon-add" onclick="addEmpTutor()">新增</a>
				            <a class="nui-button" id="EmpTutorList_updateEmpTutor"  iconCls="icon-edit" onclick="updateEmpTutor()">修改</a>
			                <a class="nui-button" id="EmpTutorList_deleteEmpTutor"  iconCls="icon-remove" onclick="deleteEmpTutor()">删除</a>
				        </td>
	                </tr>
	        </table>
	    </div>
	</div>
	<div id="datagrid1"  class="nui-datagrid" style="width:100%;height:372px;" allowResize="true"
	    dataField="emptutor1" multiSelect="true" pageSize="20" sizeList="[10,20,30,50]" allowAlternating="true"
	    url='org.gocom.abframe.org.employee.EmpManager.queryEmpTutor.biz.ext'>
	    <div property="columns">
	    	<div type="checkcolumn"></div>
	    	<div field="yjbm" width="70" headerAlign="center" align="left" >一级部门</div>
	    	<div field="ejbm" width="80" headerAlign="center" align="left" >二级部门</div>
	    	<div field="bjbm" width="100" headerAlign="center" align="left" >所在部门</div>
	    	<div field="username" width="60" headerAlign="center" align="center"   renderer="detailReturn">员工姓名</div>
	    	<div field="tutorname" width="60" headerAlign="center" align="center" allowSort="true">导师姓名</div>
	    	<div field="effectstarttime" width="80" headerAlign="center" align="center" allowSort="true">有效开始时间</div>
	    	<div field="effectendtime" width="80" headerAlign="center" align="center" allowSort="true">有效结束时间</div>
	    	<div field="recordwriter" width="70" headerAlign="center" align="center" allowSort="true">记录写入人</div>  
        	<div field="recordtime"  width="80" headerAlign="center"  align="center" allowSort="true" >记录写入时间</div>
        	<div field="lastchanger"  width="80" headerAlign="center"  align="center" allowSort="true" >最后修改用户</div>
	    	<div field="lastchangetime" width="80" headerAlign="center" align="center" allowSort="true">最后修改时间</div>
	    	
	    </div>
	</div>
	<form name="viewlist1" id="viewlist1" action="com.primeton.eos.ame_common.ameExportCommon.flow" method="post">
		<input type="hidden" name="_eosFlowAction" value="action0" filter="false"/>
		<input type="hidden" name="downloadFile" filter="false"/>
		<input type="hidden" name="fileName" filter="false"/>
	</form>
</div>
</body>
<script type="text/javascript">
	nui.parse();
	var form = new nui.Form("#form1");
	var grid = nui.get('datagrid1');
	<% 
		UserObject user = (UserObject)session.getAttribute("userObject");
		String nowuserid = user.getUserId();
		String nowusername = user.getUserName();
	%>
	var nowuserid = "<%=nowuserid %>";
	var nowusername = "<%=nowusername %>";
	
	//search();
	init()
	function init(){
		//机构权限初始化
		//code:对应功能编码，map：对于机构的查询条件
		json = {"code":"empTutorQuery","map":{"property":"status","op":"=","value":"running"}};
		nui.ajax({
			url:"com.primeton.eos.ame_auth.ame_auth.getownorg.biz.ext",
			data:json,
			type:'POST',
			contentType:'text/json',
			success:function(text){
				if(text.orgs){
					if(text.orgs.length==0){
						// 没有有权的机构时没有权限
						nui.get("empname").setValue(nowusername)
						nui.get("empname").setReadOnly(true)
						
						
					}else{
						nui.get("syb").loadList(text.orgs, "orgid", "parentorgid");
						
						if(text.orgids){
							
							var isall;
							for(var i=0;i<text.orgs.length;i++){
							if(text.orgs[i].orgid == "1"){
							isall = "1";
							break;
							}
						}
						//如果拥有全公司的权限就取消部门限制
						if(isall == "1"){
								nui.get("tempCond81").setValue("=");
        						nui.get("tempCond82").setValue("=");
        						nui.get("syb").setValue("");
        						nui.get("syb1").setValue(""); 
        						
        					/* 	console.log("quanbu")
        						nui.get("syb1").setValue(text.orgids); */
        						
						}else{
							nui.get("syb1").setValue(text.orgids);
							
							
						}
						
						}else{
						nui.get("empname").setValue(nowusername)
						
						}
					}
				}else{
						nui.get("empname").setValue(nowusername)
					}
				//初始化页面
				search();
            },
            error: function () {
            }
		});
	}
	//查询功能列表
	function search(){
		if(!(nui.get("syb").getValue()==""||nui.get("syb").getValue()==null)){
			nui.get("tempCond81").setValue("in");
			nui.get("tempCond82").setValue("in");
		}
        var data = form.getData();
		grid.load(data);
		grid.sortBy("recordtime","desc");
		getOpeatorButtonAuth("EmpTutorList_addEmpTutor,EmpTutorList_updateEmpTutor,EmpTutorList_deleteEmpTutor");//操作按钮权限初始化
		
	}
	//重置
	function reset(){
		form.reset();
        init();
	}
	//回车触发事件
    function onKeyEnter(){
    	search();
    }
 
	
	function getempstatus(e){
		return nui.getDictText('ABF_EMPSTATUS',e.value);
	}
	
	
	
	function addEmpTutor() {        	
        nui.open({
            url: "<%=request.getContextPath() %>/abframe/org/newOrganization/modifyEmpTutor.jsp",
            title: "新增员工导师关系信息", 
			width: 650,
            height: 350,
            onload: function () {
           	
                var iframe = this.getIFrameEl();
                var data = { action: "new"};
                iframe.contentWindow.SetData(data);
            },
            ondestroy: function (action) {
                grid.reload();
            }
        });
    }
    
    function deleteEmpTutor() {
    	//删除权限
    
	    var rows = grid.getSelecteds();   //获取所有选中的行对象
	    var data = {emptutor:rows};
	    var json = nui.encode(data);     //序列化成json字符串
		if (rows.length> 0) {
        	if (confirm("确定删除选中记录？")) {
                grid.loading("操作中，请稍后......");
                nui.ajax({
	                url: "org.gocom.abframe.org.employee.EmpManager.deleteEmpTurtor.biz.ext",
	                type: "post",
	                data: json, 
	                cache: false,
	                contentType: 'text/json',
	                success: function (text) {
	                	grid.reload();
	                },
	                error: function () {
                    }
               });
            }
        } else {
            alert("请至少选中一条记录");
        }
    }
    
    function updateEmpTutor() {
		var row = grid.getSelecteds();
		if (row.length > 1) {
    		nui.alert("只能选中一条项目记录进行编辑");
    		}else{
    		var row=row[0];
		if (row) {
      		nui.open({
	            url: "<%=request.getContextPath() %>/abframe/org/newOrganization/modifyEmpTutor.jsp",
	            title: "编辑员工导师关系信息",
	            width: 650,
	            height: 260,
	            onload: function () {
	              var iframe = this.getIFrameEl();
	              var data = {action: "edit", emptutorid: row.emptutorid };
	              iframe.contentWindow.SetData(data);
	            },
	            ondestroy: function (action) {
	                  grid.reload();
	            }
            });
        } else {
          nui.alert("请选中一条记录","提示");
        }
        }
    }
	
	
	
	 //导师反馈信息详情
        function detailReturn(e){
        	return "<a href='javascript:void(0)' onclick='detailReturn1();' title='点击查看合同信息'>" + e.value + "</a>";
        }
	
	
	  function detailReturn1(){
	 		var selectRow = grid.getSelected();
			var executeUrl = "<%=request.getContextPath() %>/abframe/org/newOrganization/tutorReturnDetail.jsp?id=" + selectRow.userid;
			window.open(executeUrl, "导师反馈记录查看", "fullscreen=1");
	    }
	
	
	
	
	//导出
		function exportempTutor(){
			if(!confirm("是否确认导出？")){
				return;
			}
			var data = form.getData();
			var json =  nui.encode(data);
			nui.ajax({
    			url: "org.gocom.abframe.org.employee.EmpManager.exportEmpTutor.biz.ext",
		        type: "post",
		        data: json,
		        cache: false,
		        contentType: 'text/json',
		        success: function (o) {
		     		nui.unmask();
		     		var filePath = o.downloadFile;
		        	var fileName = "emptutor";
		        	var myDate = new Date();
		        	var year = myDate.getFullYear();
		        	var month = myDate.getMonth()+1;
		        	var day = myDate.getDate();
		        	var hours = myDate.getHours();
		        	var minutes = myDate.getMinutes();
		        	var seconds = myDate.getSeconds();
		        	var curDateTime = year;
		        	if(month>9){
						curDateTime = curDateTime + "" + month;
					}else{
						curDateTime = curDateTime + "0" + month;
						}
		        	if(day>9){
						curDateTime = curDateTime + day;
					}else{
						curDateTime = curDateTime + "0" + day;
						}
					if(hours>9){
						curDateTime = curDateTime + hours;
					}else{
						curDateTime = curDateTime + "0" + hours;
						}
					if(minutes>9){
						curDateTime = curDateTime + minutes;
					}else{
						curDateTime = curDateTime + "0" + minutes;
						}
					if(seconds>9){
						curDateTime = curDateTime + seconds;
					}else{
						curDateTime = curDateTime + "0" + seconds;
					}
					fileName = fileName + "_" + curDateTime + ".xls";
					var frm = document.getElementById("viewlist1");
		        	frm.elements["downloadFile"].value = filePath;
		        	frm.elements["fileName"].value = fileName;
				    frm.submit();
		        },
		        error: function () {
		        	alert("error");
		        }
			});
		}
	
		function evaluatetype(e) {
		return nui.getDictText('AME_EVALUATETYPE',e.value);//设置业务字典值
	}
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
</script>
</html>


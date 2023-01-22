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
  - Date: 2020-04-13 14:36:32
  - Description:
-->
<head>
<title>导师反馈信息查询</title>
<script src="<%= request.getContextPath() %>/common/nui/nui.js" type="text/javascript"></script>
</head>
<body>
<div style="width:100%;height:100%;padding:0px;margin:0px;" >
	<div style="width:100%;">
        <div class="nui-toolbar" style="border-bottom:0;padding:0px;">
            <table style="width:100%;">
            	<tr>
                    <td style="width:20%;">
                       	导师反馈信息查询	
                    </td>
                </tr>
             </table>           
        </div>
    </div>
    <div id="form1" class="nui-toolbar" style="border-bottom:0;padding:0px;">
    	<input class="nui-hidden" name="tutorReturn._entity" value="org.gocom.abframe.dataset.organization.QueryTutorReturn"/>
    	<input   class="nui-hidden" id=tutorid/>
    	<table style="width:100%;">
    		<tr>
			 	<td align="right" style="width: 90px">员工姓名：</td>
			 	<td>
			 		<input class="nui-textbox" name="tutorReturn._expr[0]._value" id = "empname" onenter="onKeyEnter" style="width: 120px"/>
		 		 	<input class="nui-hidden" name="tutorReturn._expr[0]._property" value="empname"/>
                    <input class="nui-hidden" name="tutorReturn._expr[0]._op" value="like"/>
			    </td>
			    <td align="right" style="width: 90px">导师姓名：</td>
            	<td>
			 		<input class="nui-textbox" name="tutorReturn._expr[1]._value" id = "tutorempname" onenter="onKeyEnter" style="width: 120px"/>
		 		 	<input class="nui-hidden" name="tutorReturn._expr[1]._property" value="tutorempname"/>
                    <input class="nui-hidden" name="tutorReturn._expr[1]._op" value="like"/>
			    </td>
			    <td align="right">评价年月：</td>
            	<td align="left">
				    <input class="nui-monthpicker" id="min1" name="tutorReturn._expr[2]._min" style="width:120px" onenter="onKeyEnter" format="yyyy-MM" />-<input class="nui-monthpicker" id="max1" name="tutorReturn._expr[2]._max" onenter="onKeyEnter"  format="yyyy-MM" style="width:120px"/>
		 		 	<input class="nui-hidden" name="tutorReturn._expr[2]._property" value="evaluatetime"/>
                    <input class="nui-hidden" name="tutorReturn._expr[2]._op" value="between"/>
				</td>
				 <td align="right" >员工部门：</td>
            	<td>
			 		<input class="nui-treeselect" expandOnLoad="0"
							textField="orgname" valueField="orgid" parentField="parentorgid" dataField="orgs" showTreeIcon="true" valueFromSelect="true" id="syb"
							showNullItem="true" multiSelect="true" checkRecursive = "true" showFolderCheckBox="true"
							name="tutorReturn._expr[3]._value" style="width:220px;"  nullItemText=""/>
							<input class="nui-hidden" name="tutorReturn._expr[3]._property" value="orgid"/>
							<input class="nui-hidden" name="tutorReturn._expr[3]._op" id="tempCond81" value="in"/>
							<input class="nui-hidden" name="tutorReturn._expr[4]._property" value="orgid"/>
							<input class="nui-hidden" name="tutorReturn._expr[4]._op" id="tempCond82" value="in"/>
							<input class="nui-hidden" name="tutorReturn._expr[4]._value" id="syb1"/>
			    </td>
    	   </tr>
		   <tr> 
		   		<td align="center" colspan="8">
    				<a class="nui-button" id="search" iconCls="icon-search" onclick="search()">查找</a>
                    <a class="nui-button" id="reset" iconCls="icon-reload" onclick="reset()">重置</a>
                    <a class="nui-button" id="export-tutorReturn"  iconCls="icon-download" onclick="exporttutorReturn()">导出</a>
                    
    			</td>
    		</tr>	
    	</table>
    </div>
	<div style="width:100%;">
	    <div class="nui-toolbar" id="toolbars" style="border-bottom:0;padding:0px;">
	        <table style="width:100%;">
	            <tr>
	                    <td style="width:20%;">
				            <a class="nui-button" id="TutorReturnList_addTutorReturn"  iconCls="icon-add" onclick="addTutorReturn()">反馈</a>
				            <a class="nui-button" id="TutorReturnList_updateTutorReturn"  iconCls="icon-edit" onclick="updateTutorReturn()">修改</a>
			                <a class="nui-button" id="TutorReturnList_deleteTutorReturn"  iconCls="icon-remove" onclick="deleteTutorReturn()">删除</a>
				        </td>
	                </tr>
	        </table>
	    </div>
	</div>
	<div id="datagrid1"  class="nui-datagrid" style="width:100%;height:372px;" allowResize="true"
	    dataField="tutorReturn1" multiSelect="true" pageSize="20" sizeList="[10,20,30,50]" allowAlternating="true"
	    url='org.gocom.abframe.org.employee.EmpManager.tutorReturnQuery.biz.ext'>
	    <div property="columns">
	    	<div type="checkcolumn"></div>
	    	<div field="yjbm" width="50" headerAlign="center" align="left" >一级部门</div>
	    	<div field="ejbm" width="60" headerAlign="center" align="left" >二级部门</div>
	    	<div field="bjbm" width="80" headerAlign="center" align="left" >本级部门</div>
	    	<div field="empname" width="40" headerAlign="center" align="center" >员工姓名</div>
	    	<div field="tutorempname" width="40" headerAlign="center" align="center" allowSort="true">导师姓名</div>
	    	<div field="evaluatetime" width="40" headerAlign="center" align="center" allowSort="true" format="yyyy-mm">评价年月</div>
	    	<div field="evaluatetype" width="50" headerAlign="center" align="center" allowSort="true" renderer="evaluatetype">工作满意度</div>
	    	<div field="monthlyachievement"  width="120" headerAlign="center"  align="center" allowSort="true" >本月目标达成情况</div>
	    	<div field="nextplan" width="120" headerAlign="center" align="center" allowSort="true">下一阶段改进计划</div>  
        	<div field="evaluatelastchangetime"  width="85" headerAlign="center" dateFormat="yyyy-MM-dd HH:mm:ss" align="center" allowSort="true" >评价最后修改日期</div>
	    </div>
	</div>
</div>
	<form name="viewlist1" id="viewlist1" action="com.primeton.eos.ame_common.ameExportCommon.flow" method="post">
		<input type="hidden" name="_eosFlowAction" value="action0" filter="false"/>
		<input type="hidden" name="downloadFile" filter="false"/>
		<input type="hidden" name="fileName" filter="false"/>
	</form>
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
	var nowusername="<%=nowusername %>";
	//search();
	init()
	function init(){
		//机构权限初始化
		//code:对应功能编码，map：对于机构的查询条件
		json = {"code":"tutorReturnQuery","map":{"property":"status","op":"=","value":"running"}};
		nui.ajax({
			url:"com.primeton.eos.ame_auth.ame_auth.getownorg.biz.ext",
			data:json,
			type:'POST',
			contentType:'text/json',
			success:function(text){
				if(text.orgs){
					if(text.orgs.length==0){
						// 没有有权的机构时没有权限
						nui.get("tutorempname").setValue(nowusername)
						nui.get("tutorempname").setReadOnly(true)
						
						
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
						nui.get("tutorempname").setValue(nowusername)
						
						}
					}
				}else{
						nui.get("tutorempname").setValue(nowusername)
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
		var min = nui.get("min1").getValue();
		if(min!=null&&min!=""){
			min = nui.formatDate(min,"yyyy-MM");
			data.tutorReturn._expr[2]._min = min;
		}
		var max = nui.get("max1").getValue();
		if(max!=null&&max!=""){
			max = nui.formatDate(max,"yyyy-MM");
			data.tutorReturn._expr[2]._min = max;
		}
		grid.load(data);
		grid.sortBy("evaluatetime","desc");
		getOpeatorButtonAuth("TutorReturnList_addTutorReturn,TutorReturnList_updateTutorReturn,TutorReturnList_deleteTutorReturn,export-tutorReturn");//操作按钮权限初始化
		
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
	
	
	
	function addTutorReturn() {        	
			var t=new Date();
			var day=t.getDate();
			
			var ReturnDate=	 nui.getDictText('AME_TUTORRETURN_DATE','1');
		
    		if(day<ReturnDate){
    		nui.alert("每月22日至本月末才可以反馈当月情况!")
    		return;
    		}
        nui.open({
            url: "<%=request.getContextPath() %>/abframe/org/newOrganization/modifyTutorReturn.jsp",
            title: "新增导师反馈信息", 
			width: 700,
            height: 440,
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
    
    function deleteTutorReturn() {
    	//删除权限
    
	    var rows = grid.getSelecteds();   //获取所有选中的行对象
	    var data = {tutorReturn:rows};
	    var json = nui.encode(data);     //序列化成json字符串
		if (rows.length> 0) {
        	if (confirm("确定删除选中记录？")) {
                grid.loading("操作中，请稍后......");
                nui.ajax({
	                url: "org.gocom.abframe.org.employee.EmpManager.deleteTutorReturn.biz.ext",
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
    
    function updateTutorReturn() {
    	/* 	var t=new Date();
			var day=t.getDate();
			
			var ReturnDate=	 nui.getDictText('AME_TUTORRETURN_DATE','1');
		
    		if(day<ReturnDate){
    		nui.alert("每月22日至本月末才可以反馈当月情况!")
    		return;
    		} */
		var row = grid.getSelecteds();
		if (row.length > 1) {
    		nui.alert("只能选中一条项目记录进行编辑");
    		}else{
    		var row=row[0];
		if (row) {
			var t=new Date();
			var month=nui.formatDate(t,"yyyy-MM");
			if(row.tutorid != nowuserid || row.evaluatetime != month){
				nui.alert("只能修改导师等于自己的且当月的反馈信息！");
				return;
			}
      		nui.open({
	            url: "<%=request.getContextPath() %>/abframe/org/newOrganization/modifyTutorReturn.jsp",
	            title: "编辑导师反馈信息",
	            width: 700,
	            height: 320,
	            onload: function () {
	              var iframe = this.getIFrameEl();
	              var data = {action: "edit", tutorreturnid: row.tutorreturnid };
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
	
	
	
	//导出
		function exporttutorReturn(){
		if(!confirm("是否确认导出？")){
			return;
		}
		var data = form.getData();
		var min = nui.get("min1").getValue();
		if(min!=null&&min!=""){
			min = nui.formatDate(min,"yyyy-MM");
			data.tutorReturn._expr[2]._min = min;
		}
		var max = nui.get("max1").getValue();
		if(max!=null&&max!=""){
			max = nui.formatDate(max,"yyyy-MM");
			data.tutorReturn._expr[2]._min = max;
		}
		var json =  data;
		nui.ajax({
			url: "org.gocom.abframe.org.employee.EmpManager.exportTutorReturn.biz.ext",
	        type: "post",
	        data: json,
	        cache: false,
	        contentType: 'text/json',
	        success: function (o) {
	     		nui.unmask();
	     		var filePath = o.downloadFile;
	        	var fileName = "tutorReturn";
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



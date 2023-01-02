<%@page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@include file="/common/common.jsp"%>
<%@include file="/nui/common.jsp"%>
<%@page import="com.eos.data.datacontext.UserObject"%>
<%@page import="commonj.sdo.DataObject"%>
<%@page import="java.util.Map"%>
<html>
<!-- 
  - Author(s): zhuhx
  - Date: 2016-05-27 14:17:51
  - Description:
-->
<head>
<title>项目实施内部人力成本明细</title>
	<meta http-equiv="content-type" content="text/html; charset=UTF-8" />
	<link href="../demo.css" rel="stylesheet" type="text/css" />
	<script>
		$(function(){
			nui.context='/default'
		})
	</script>
    <style type="text/css">
    html, body
    {
        font-size:12px;
        padding:0;
        margin:0;
        border:0;
        height:100%;
        overflow:hidden;
    }
    </style>
</head>
<body style="width:100%;height:100%;padding:0px;margin:0px;">
	<div class="nui-fit">
	 	<form id="form1" method="post" >
	 		<input id="projectid"  class="nui-hidden"  name="criteria._expr[0]._value" />
	 		<input id="budgetratio"  class="nui-hidden"  name="budgetratio" />
	 		<input class="nui-hidden" name="criteria._expr[0]._property" value="projectId" />
	        <input class="nui-hidden" name="criteria._expr[0]._op" value="in"/>
	        <input id="contnum"  class="nui-hidden"  name="criteria._expr[3]._value" />
	 		<input class="nui-hidden" name="criteria._expr[3]._property" value="contnum" />
	        <input class="nui-hidden" name="criteria._expr[3]._op" value="="/>
	        <input id="min_f"  class="nui-hidden"  name="criteria._expr[4]._min" />
	        <input id="max_f"  class="nui-hidden"  name="criteria._expr[4]._max" />
	 		<input class="nui-hidden" name="criteria._expr[4]._property" value="fincostdate" />
	        <input class="nui-hidden" name="criteria._expr[4]._op" value="between"/>
 			<div class="nui-toolbar" style="border-bottom:0;padding:0px;">
				<table style="width:100%;">
					<tr>
						<td align="right" width="200px"><span>员工姓名：</span></td>
		            	<td align="left" width="400px">
		            		<input id="lookup2"  class="nui-textboxlist"  searchField="name" 
        						url="com.primeton.eos.ame_budget.budgetOrgManager.queryEmpByName.biz.ext" 
        						textField="EMPNAME" valueField="USERID" name="criteria._expr[1]._value" style="width:400px;"/>
					        <input class="nui-hidden" name="criteria._expr[1]._property" value="userId" />
					        <input class="nui-hidden" name="criteria._expr[1]._op" value="in" id="a1"/>
						</td>
						<td align="right"><span>工时日期范围：</span></td>
		            	<td align="left">
						  	<input class="nui-datepicker" id="min2" name="criteria._expr[2]._min" style="width:150px"/>-<input class="nui-datepicker" id="max2" name="criteria._expr[2]._max" style="width:150px"/>
						    <input class="nui-hidden" name="criteria._expr[2]._property" value="laborDate"/>
						    <input class="nui-hidden" name="criteria._expr[2]._op" value="between"/>
						    <input class="nui-hidden" name="criteria._expr[2]._pattern" value="yyyy-MM-dd"/>
						</td>
					</tr>
				    <tr>
		    			<td align="center" colspan="4">
                            <a class="nui-button" id="search" iconCls="icon-search" onclick="search">查找</a>
                            <a class="nui-button" id="exportCurrentExcel" iconCls="icon-download" onclick="exportCurrent">导出明细表</a> 
                       </td>
		            </tr>
				</table>
			</div>
		</form>
	            <div id="grid_1" class="nui-datagrid" style="width:100%;height:100%;" showPager="true" sizeList="[20,50,100,500]" pageSize="20"
	            	url="com.primeton.rdmgr.project.assessmentProject.getPemp.biz.ext" 
	             	sortMode="client"dataField="pemps" showSummaryRow="true" ondrawsummarycell="onDrawSummaryCell" >
	            <div property="columns">
	              <div field="laborDate" width="25px" headerAlign="center">工时日期</div>
	              <div field="userId" width="20px" headerAlign="center">人员工号</div>  
	              <div field="userName" width="20px" headerAlign="center">人员姓名</div>
	              <div field="gradename" width="20px" headerAlign="center">人员等级</div>
	              <div field="actHours" width="20px" align="right" headerAlign="center" summaryType="sum">工作时间</div>
	              <div field="standcost" width="30px" align="right" dataType="currency" summaryType="sum" headerAlign="center">工时定额成本</div>
	              <div field="cost" width="30px" align="right" dataType="currency" summaryType="sum" headerAlign="center">定额结算成本</div>
	              <div field="conratio" width="20px" align="right" dataType="currency"  headerAlign="center">转换系数</div>
	              <div field="budgetratio" width="20px" align="right" dataType="currency"  headerAlign="center">预算转换系数</div>
	              <div field="concost" width="30px" align="right" dataType="currency" summaryType="sum" headerAlign="center">工时转换成本</div>
	              <div field="labordiffcost" width="30px" align="right" dataType="currency" summaryType="sum" headerAlign="center">工时系数调差成本</div>    
	              <div field="deptname" width="30px" headerAlign="center">人员所在部门</div>
	              <div field="salesName" width="25px" headerAlign="center">受益部门</div>
	              <div field="insertdate" dateFormat="yyyy-MM-dd" width="25px" headerAlign="center">填报日期</div>
	            </div>
	          </div>
		</div>
		<div style="text-align:center;padding:10px;border-width:1px 0px 0px 0px;" id="temp1" class="nui-toolbar">
	    	<a class="nui-button" onclick="onCancel" style="width:60px;">关闭</a>
		</div> 
		<form name="viewlist1" id="viewlist1" action="com.primeton.eos.ame_common.ameExportCommon.flow" method="post">
			<input type="hidden" name="_eosFlowAction" value="action0" filter="false"/>
			<input type="hidden" name="downloadFile" filter="false"/>
			<input type="hidden" name="fileName" filter="false"/>
		</form> 
	    <script type="text/javascript">
	    
	    	nui.parse();
	    	var form = new nui.Form("form1");
	    	var grid = nui.get("grid_1");
	    	var projectid = getUrlParam("id");
	    	var contnum = getUrlParam("contnum");
	    	var userId = getUrlParam("userId");
	    	var empname = '<%=request.getParameter("empname")%>';
	    	var startdate= getUrlParam("startdate");
	    	var enddate= getUrlParam("enddate");
	    	var startdate_f= getUrlParam("startdate_f");
	    	var enddate_f= getUrlParam("enddate_f");
	    	if(projectid!=null&&projectid!=""){
	    		nui.get("projectid").setValue(projectid);
	    	}
	    	if(contnum!=null&& contnum!=""){
	    		nui.get("contnum").setValue(contnum);
	    	}
	    	if(userId!=null&&userId!=""){
	    		nui.get("lookup2").setValue(userId);
	    		nui.get("lookup2").setText(empname);
	    		nui.get("lookup2").setReadOnly(true);
	    	}
	    	if(startdate!=null&&startdate!=""){
	    		nui.get("min2").setValue(startdate);
	    		nui.get("min2").setReadOnly(true);
	    		nui.get("max2").setReadOnly(true);
	    	}
	    	if(enddate!=null&&enddate!=""){
	    		nui.get("max2").setValue(enddate);
	    		nui.get("min2").setReadOnly(true);
	    		nui.get("max2").setReadOnly(true);
	    	}
	    	if(startdate_f!=null&&startdate_f!=""){
	    		nui.get("min_f").setValue(startdate_f);
	    	}
	    	if(enddate_f!=null&&enddate_f!=""){
	    		nui.get("max_f").setValue(enddate_f);
	    	}
	    	var budgetratio= getUrlParam("budgetratio");//预算转换系数
	    	nui.get("budgetratio").setValue(budgetratio);
			search();
			function getUrlParam(name) { 
				var reg = new RegExp("(^|&)" + name + "=([^&]*)(&|$)"); 
				var r = window.location.search.substr(1).match(reg); 
				if (r != null) 
				return unescape(r[2]); 
				return null; 
			} 	
			
			//查询
			function search() {
				var userid = nui.get("lookup2").getValue();
				if(userid==null||userid==""){
					nui.get("a1").setValue("=")
				}else{
					nui.get("a1").setValue("in")
				}
				var form = new nui.Form("#form1");
				var data = form.getData(); //获取表单JS对象数据
			  	grid.load(data); //datagrid加载数据
			}
					
	        function toggleFieldSet(ck, id) {
	            var dom = document.getElementById(id);
	            dom.className = !ck.checked ? "hideFieldset" : "";
	        }  
		
		function onCancel(e) {
			if (window.CloseOwnerWindow) return window.CloseOwnerWindow(action);
	        else window.close();  
	    }
	    //汇总值处理
	    function onDrawSummaryCell(e) {
	    	if(e.field=='standcost'){
	    		e.cellHtml = "<div align='right'><b>" + e.cellHtml + "</b></div>";
	    	}
            if(e.field=='cost'){
            	e.cellHtml = "<div align='right'><b>" + e.cellHtml + "</b></div>";
            }
            if(e.field=='concost'){
            	e.cellHtml = "<div align='right'><b>" + e.cellHtml + "</b></div>";
            }
            if(e.field=='actHours'){
            	var actDays = (parseFloat(e.value)/8).toFixed(2);
            	e.cellHtml = "<div align='right'><b>" + actDays+"人天"+ "</b></div>";
            }
            if(e.field=="labordiffcost"){
            	e.cellHtml = "<div align='right'><b>" + e.cellHtml + "</b></div>";
            }
        }
        function exportCurrent(){
        	var userid = nui.get("lookup2").getValue();
			if(userid==null||userid==""){
				nui.get("a1").setValue("=")
			}else{
				nui.get("a1").setValue("in")
			}
			var form = new nui.Form("#form1");
			var data = form.getData(); //获取表单JS对象数据
        	var json = data;
			nui.ajax({
                url: "com.primeton.eos.ame_budget.ame_budget.exportPemp.biz.ext",
                type: "post",
                data: json,
                cache: false,
                contentType: 'text/json',
                success: function (o) {
             		nui.unmask();
                	var filePath = o.downloadFile;
                	var fileName = "人力成本明细";
                	var myDate = new Date();
                	var year = myDate.getYear();
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
    
    //人员等级
	function getGrade(e) {
		var degreename = "";
		var json = ({"criteria": 
	                    {"_expr[0]": {"degree": e.value},
	                    "_expr[1]": {"_property": "startdate","_op": "<=","_value":e.record.laborDate},
	                    "_expr[2]": {"_property": "enddate","_op": ">=","_value":e.record.laborDate},
	                    "_expr[0]": {"userid": e.record.userId}}
                   ,"sortField":"degree","sortOrder":"desc"});
         nui.ajax({
            type:'get',
            data:json,
            cache: false,
            showModal: false,
            async :false,
            contentType: 'text/json',
            url:'com.primeton.rdmgr.labor.mispricebiz.queryEmplevel.biz.ext',
            success:function(result){
            	degreename = result.emplevels[0].degreename
            }
        });
		return degreename;//设置人员等级
	}
	
	    </script>
</body>
</html>
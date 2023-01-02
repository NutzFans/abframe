<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>	
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@page import="com.eos.data.datacontext.UserObject"%>
<%@page import="commonj.sdo.DataObject"%>
<%@page import="java.util.Map"%>
<%@ page import="java.util.HashMap" %>
<%@ page import="java.util.List" %>
<%@ page import="java.util.ArrayList" %>
<html>
<!-- 
  - Author(s): 王可
  - Date: 2017-09-20 11:42:57
  - Description:
-->
<head>
<title>工时填报及时性统计</title>
<meta http-equiv="content-type" content="text/html; charset=UTF-8" />
<script src="<%= request.getContextPath() %>/common/nui/nui.js" type="text/javascript"></script>
</head>
<body>
	<div class="nui-panel" title="工时填报及时性统计" style="width:100%;">
		<div style="width:100%;height:100%;padding:0px;margin:0px;" id="form1">
			<div class="nui-toolbar" style="border-bottom:0;padding:0px;">
				<table style="width:100%;">
					<tr>
						<td align="right" width="110px"><span>财务年月：</span></td>
						<td>
							<input class="nui-monthpicker" format="yyyy-MM" id="finYM" style="width:100px" onvaluechanged="watchfinYM"/>
						</td>
						<td align="right" width="76px"><span>员工姓名：</span></td>
		            	<td align="left">
		            		<input class="nui-textbox" name="criteria._expr[1]._value" style="width:86px;"/>
					        <input class="nui-hidden" name="criteria._expr[1]._property" value="empname" />
					        <input class="nui-hidden" name="criteria._expr[1]._op" value="like"/>
					        <input class="nui-hidden" name="criteria._expr[1]._rule" value="all"/>
						</td>
						<td align="right"><span>入职日期范围：</span></td>
		            	<td align="left">
						  	<input class="nui-datepicker" id="min2" name="criteria._expr[4]._min" style="width:98px"/>-<input class="nui-datepicker" id="max2" name="criteria._expr[4]._max" style="width:98px"/>
						    <input class="nui-hidden" name="criteria._expr[4]._property" value="indate"/>
						    <input class="nui-hidden" name="criteria._expr[4]._op" value="between"/>
						    <input class="nui-hidden" name="criteria._expr[4]._pattern" value="yyyy-MM-dd"/>
						</td>
					</tr>
					<tr>
						<td align="right" width="110px"><span>日期范围：</span></td>
		            	<td align="left">
						  	<input class="nui-datepicker"  id="min1" name="criteria._expr[0]._min" style="width:100px"/>-<input class="nui-datepicker" id="max1" name="criteria._expr[0]._max" style="width:100px"/>
						    <input class="nui-hidden" name="criteria._expr[0]._property" value="laborDate"/>
						    <input class="nui-hidden" name="criteria._expr[0]._op" value="between"/>
						    <input class="nui-hidden" name="criteria._expr[0]._pattern" value="yyyy-MM-dd"/>
						</td>
						<td align="right" width="76px"><span>员工状态：</span></td>
						<td align="left">
						    <input name="criteria._expr[3]._value" class="nui-dictcombobox"   dictTypeId="ABF_EMPSTATUS"  multiSelect="true" style="width:86px;" />
						    <input class="nui-hidden" name="criteria._expr[3]._property" value="empstatus"/>
		            		<input class="nui-hidden" name="criteria._expr[3]._op" value="in"/>
						</td>
						<td align="right"><span>离职日期范围：</span></td>
		            	<td align="left">
						  	<input class="nui-datepicker" id="min3" name = "min3" style="width:96px"/>-<input class="nui-datepicker" id="max3" name = "max3" style="width:96px"/>
						   <!--  <input class="nui-hidden" name="criteria._expr[5]._property" value="outdate"/>
						    <input class="nui-hidden" name="criteria._expr[5]._op" value="between"/>
						    <input class="nui-hidden" name="criteria._expr[5]._pattern" value="yyyy-MM-dd"/> -->
						</td>
				    </tr>
				    <tr>
				    	<td align="right" width="110px"><span>部门：</span></td>
						<td align="left">
						    <input name="criteria._expr[2]._value" class="nui-treeselect"expandOnLoad="0" url="com.bos.mp.common.SelectManage.queryAllOrg.biz.ext" 
		           		   textField="orgname" valueField="orgid" parentField="parentorgid" dataField="orgs" showTreeIcon="true" valueFromSelect="true"
						   showNullItem="true" multiSelect="true" checkRecursive = "true" showFolderCheckBox="true" style="width:203px;" />
						    <input class="nui-hidden" name="criteria._expr[2]._property" value="orgid"/>
						    <input class="nui-hidden" name="criteria._expr[2]._op" value="in"/>
						</td>
				    </tr>
				    <tr>
			    			<td align="center" colspan="6">
	                            <a class="nui-button" id="search" iconCls="icon-search" onclick="search()">查找</a>
	                            <a class="nui-button" id="reset" iconCls="icon-reload" onclick="reset">重置</a>	
	                            <a class="nui-button" onclick="exportRdLabors" iconCls="icon-download"  id="exportButton">导出</a>
	                            <form name="viewlist1" id="viewlist1" action="com.primeton.eos.ame_common.ameExportCommon.flow" method="post">
									<input type="hidden" name="_eosFlowAction" value="action0" filter="false"/>
									<input type="hidden" name="downloadFile" filter="false"/>
									<input type="hidden" name="fileName" filter="false"/>
								</form>	
	                       </td>
		            </tr>
				</table>
			</div>
		</div>
		
		<div id="datagrid1" class="nui-datagrid" style="width:100%;height:350px;" allowResize="true" pageSize="10"  showSummaryRow="true"
	        url="com.primeton.rdmgr.labor.queryRdLaborDetail.queryRdLaborCount.biz.ext" dataField="rdlaborcount"  multiSelect="false" >
	        <div property="columns">
	        	<div field="userId" width="30"  headerAlign="center" align="center" visible="false">用户id</div>
	        	<div field="pxnum" width="30" type="indexcolumn" headerAlign="center" align="center">排序编号</div> 
	        	<div field="firstdept" width="60" renderer="dept" headerAlign="center" allowSort="true" align="center">一级部门</div>  
	        	<div field="orgname" width="60" headerAlign="center" allowSort="true" align="center">所属部门</div>
	        	<div field="empname" width="60" headerAlign="center" allowSort="true" align="center" renderer="laborDetailRenderer">员工姓名</div>
	        	<div field="sum_tbsum" width="60" headerAlign="center" allowSort="true" align="center">填报条数</div>
	        	<div field="sum_tbpc" width="60" headerAlign="center" allowSort="true" align="center">偏差天数</div>
	        	<div field="empstatus" width="60" headerAlign="center" allowSort="true" renderer="status" align="center">员工状态</div>
	        	<div field="indate" width="60" headerAlign="center" allowSort="true" align="center">入职日期</div> 
	        	<div field="outdate" width="60" headerAlign="center" allowSort="true" align="center">离职日期</div> 
	       </div>
	    </div>
   	</div> 
	<script type="text/javascript">
		nui.parse();
		
	    var grid = nui.get("datagrid1");
	    init();
	    function init(){
	    	var currentMonth =getFormatDate();
		    nui.get("finYM").setValue(currentMonth);
		    watchfinYM();
		    var form = new nui.Form("#form1"); 
		    var data = form.getData(); //获取表单JS对象数据
			grid.load(data); //datagrid加载数据
			grid.sortBy("sum_tbpc","desc");
	    }
	     
		 
		//在职状态业务字典
		function status(e){
			return nui.getDictText('ABF_EMPSTATUS',e.value);
		}
		
		//事业部业务字典 
		function dept(e){
			return nui.getDictText('CONT_ORG',e.value);
		}
		
		//点击员工姓名查看 
		function laborDetailRenderer(e) {
			return "<a href='javascript:void(0)' onclick='doView();' title='点击查看'>" + e.value + "</a>";
		}
		function doView(){
			var row = grid.getSelected();
			var startdate = nui.get("min1").getValue();
			startdate = startdate.substring(0,10).replace(/-/g,"/");
			var enddate = nui.get("max1").getValue(); 
			enddate = enddate.substring(0,10).replace(/-/g,"/");
			var executeUrl = "<%=request.getContextPath()%>/ame_budget/detailPempcost.jsp?userId="+row.userId+"&&empname="+row.empname+"&&startdate="+startdate+"&&enddate="+enddate;		
			window.open(executeUrl, "工时查看", "fullscreen=1");
		}
		
		//查询
		function search() {	     		
			var form = new nui.Form("#form1");
			var data = form.getData(); //获取表单JS对象数据
		  	grid.load(data); //datagrid加载数据
		  	grid.sortBy("sum_tbpc","desc");
		}
		//重置
		function reset(){
			var form = new nui.Form("#form1");
			form.reset();
		}
	
		 //获取当月日期         
	    function getFormatDate() {
			var date = new Date();
			var seperator1 = "-";
			var year = date.getFullYear();
			var month = date.getMonth() + 1;
			if (month >= 1 && month <= 9) {
			     month = "0" + month;
			    }
			var currentMonth = year + seperator1 + month;
				 return currentMonth;
		       } 
		
		//导出
		function exportRdLabors(){
	    	nui.confirm("是否确认导出工时填报统计数据吗 ？", "确定？",
	        function (action) {
	        	if(action=='ok'){
	        		grid.loading("正在导出，请稍后!");
	        		var form = new nui.Form("#form1");
	        		var json = form.getData();
					nui.ajax({
		    			url: "com.primeton.rdmgr.labor.queryRdLaborDetail.exportRdLaborCount.biz.ext",
				        type: "post",
				        data: json,
				        cache: false,
				        contentType: 'text/json',
				        success: function (o) {
				     		grid.unmask();
				     		var filePath = o.downloadFile;
				        	var fileName = "工时统计记录";
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
				            grid.unmask();
				        	alert("error");
				        }
					});
	        		
	        	}
	        });
		}
		
		//财务年月控制
		function watchfinYM(){
			var finYM = nui.get("finYM").getValue();
			var year = finYM.getFullYear();
	  		var month = finYM.getMonth()+1;
			var json = ({"criteria":{"_entity":"com.primeton.eos.common.newdataset.MisFinperiod",
									 "_expr[0]":{"_property":"finyear","_op":"=","_value":year},
									 "_expr[1]":{"_property":"finmonth","_op":"=","_value":month}
									}});
			nui.ajax({
		        type:'get',
		        data:json,
		        cache: false,
		        showModal: false,
		        async :false,
		        contentType: 'text/json',
		        url:'com.primeton.rdmgr.labor.misfinperiodbiz.queryMisFinperiods.biz.ext',
		        success:function(result){
		            if(result.misfinperiods.length>0){
		            	nui.get("min1").setValue(result.misfinperiods[0].startdate);
		            	nui.get("max1").setValue(result.misfinperiods[0].enddate);
		            }else{
		            	nui.get("min1").setValue('');
		            	nui.get("max1").setValue('');
		            }
		        },
		        error:function(jqXHR, textStatus, errorThrown){
		            nui.alert("error:" + jqXHR.responseText);
		        }
		    })
		}
		
	</script>
</body>
</html>
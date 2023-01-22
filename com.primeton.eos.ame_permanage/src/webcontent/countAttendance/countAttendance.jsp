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
  - Author(s): 朱海翔
  - Date: 2019-06-14 11:42:57
  - Description:
-->
<head>
<title>考勤动态统计</title>
<meta http-equiv="content-type" content="text/html; charset=UTF-8" />
<script src="<%= request.getContextPath() %>/common/nui/nui.js" type="text/javascript"></script>
</head>
<body>
	<div class="nui-panel" title="考勤动态统计" style="width:100%;">
		<div style="width:100%;height:100%;padding:0px;margin:0px;" id="form1">
			<div class="nui-toolbar" style="border-bottom:0;padding:0px;">
				<table style="width:100%;">
					<tr>
						<td align="right"><span>财务年月：</span></td>
						<td>
							<input class="nui-monthpicker" format="yyyy-MM" id="finYM" style="width:120px" onvaluechanged=""/>
						</td>
						<td align="right" ><span>日期范围：</span></td>
		            	<td align="left">
						  	<input class="nui-datepicker"  id="min1" name="startdate" style="width:100px"/>-<input class="nui-datepicker" id="max1" name="enddate" style="width:100px"/>
						</td>
						<td align = "right" >HR确认日期:</td>
			         	<td align="left" >
			         	    <input class="nui-datepicker"  id="min2" name="confirdate_min" style="width:100px"/>-<input class="nui-datepicker" id="max2" name="confirdate_max" style="width:100px"/>
			          	</td>
					</tr>
					<tr>
						<td align="right" ><span>员工姓名：</span></td>
		            	<td align="left">
		            		<input class="nui-textbox" name="criteria._expr[0]._value" style="width:120px;" id="emp"/>
					        <input class="nui-hidden" name="criteria._expr[0]._property" value="empname" />
					        <input class="nui-hidden" name="criteria._expr[0]._op" value="like"/>
					        <input class="nui-hidden" name="criteria._expr[0]._rule" value="all"/>
						</td>
						<td align="right" ><span>部门：</span></td>
						<td align="left">
						     <input name="criteria._ref[0]._expr[0]._value" class="nui-combobox" style="width: 205px" id="orgseq" textField="orgname" valueField="orgseq" dataField = "orgs"  shownullItem="true" 
							    allowInput="true" />
							<input class="nui-hidden" name="criteria._expr[1]._property" value="orgid"/>
				 		 	<input class="nui-hidden" name="criteria._expr[1]._op" value="in"/>
		                    <input class="nui-hidden" name="criteria._expr[1]._ref" value="1" id="tempCond1"/>
					        <input class="nui-hidden" name="criteria._ref[0]._id" value="1" id="tempCond2"/>
					        <input class="nui-hidden" name="criteria._ref[0]._entity" value="org.gocom.abframe.dataset.organization.OmOrganization"/>
					        <input class="nui-hidden" name="criteria._ref[0]._select._field[0]" value="orgid"/>
					        <input class="nui-hidden" name="criteria._ref[0]._expr[0]._property" value="orgseq"/>
					        <input class="nui-hidden" name="criteria._ref[0]._expr[0]._op" value="like"/>
					        <input class="nui-hidden" name="criteria._ref[0]._expr[0]._likeRule" value="end"/>
		                    
		                    <input class="nui-hidden" name="criteria._expr[2]._property" value="orgid"/>
					        <input class="nui-hidden" name="criteria._expr[2]._op" value="in"/>
					        <input class="nui-hidden" name="criteria._expr[2]._value" id="orgids"/>
						</td>
						<td align="right"><span>请假状态：</span></td>
						<td>
							<input class="nui-dictcombobox" dictTypeId="AME_LEAVESTATUS" name="status" multiSelect="true" style="width:200px" value='2'/>
					    </td>
					</tr>
					
				    <tr>
		    			<td align="center" colspan="8">
                            <a class="nui-button" id="search" iconCls="icon-search" onclick="search()">查找</a>
                            <a class="nui-button" id="reset" iconCls="icon-reload" onclick="reset()">重置</a>
                            <a class="nui-button" onclick="exportAtt" iconCls="icon-download"  id="exportButton">导出</a>
                       </td>
		            </tr>
				</table>
			</div>
		</div>
		
		<div id="datagrid1" class="nui-datagrid" style="width:100%;height:350px;" allowResize="true" pageSize="10"  allowSortColumn="false"
		url="com.primeton.eos.ame_permanage.ame_leaveQuery.countAttendance.biz.ext" dataField="emps"  multiSelect="false" >
	        <div property="columns">
	        	<div field="empcode" width="40"  headerAlign="center" align="center" >员工工号</div>
	        	<div field="empname" width="40"  headerAlign="center" align="center">姓名</div> 
	        	<div field="emptype" width="60"  headerAlign="center" renderer="getDictType" align="center">员工属性</div> 
	        	<div field="company" width="60"  headerAlign="center" renderer="getDictCom" align="center">所属公司</div> 
	        	<div field="calstart" width="60" dateFormat="yyyy-MM-dd" headerAlign="center" allowSort="true" align="center">开始日期</div>  
	        	<div field="calend" width="60" dateFormat="yyyy-MM-dd" headerAlign="center" allowSort="true" align="center">结束日期</div>
	        	<div field="vacdays" width="60" headerAlign="center" allowSort="true" align="center" >年假天数</div>
	        	<div field="sickdays" width="60" headerAlign="center" allowSort="true" align="center">病假天数</div>
	        	<div field="comdays" width="60" headerAlign="center" allowSort="true" align="center">事假天数</div>
	        	<div field="otherdays" width="60" headerAlign="center" allowSort="true" align="center">其他假</div>
	        	<div field="totaldays" width="60" headerAlign="center" allowSort="true" align="center">总请假天数</div> 
	        	<div field="workdays" width="60" headerAlign="center" allowSort="true" align="center">工作日天数</div> 
	        	<div field="attdays" width="60" headerAlign="center" allowSort="true" align="center">出勤天数</div>
	       </div>
	    </div>
	    <form name="viewlist1" id="viewlist1" action="com.primeton.eos.ame_common.ameExportCommon.flow" method="post">
			<input type="hidden" name="_eosFlowAction" value="action0" filter="false"/>
			<input type="hidden" name="downloadFile" filter="false"/>
			<input type="hidden" name="fileName" filter="false"/>
		</form>	
   	</div> 
	<script type="text/javascript">
		nui.parse();
		<% 
			UserObject user = (UserObject)session.getAttribute("userObject");
			String nowuserid = user.getUserId();
			String nowusername = user.getUserName();
		%>
	    var grid = nui.get("datagrid1");
	    init();
	    function init(){
	    	var currentMonth =getFormatDate();
		    nui.get("finYM").setValue(currentMonth);
		    watchfinYM();
	    	var json = {"code":"countAttendance","map":{"property":"status","op":"=","value":"running"}};
	    	nui.ajax({
				url:"com.primeton.eos.ame_auth.ame_auth.getownorg1.biz.ext",
				data:json,
				type:'POST',
				contentType:'text/json',
				success:function(text){
					if(text.orgs){
						if(text.orgs.length==0){
							// 没有有权的机构时只能查项目负责人为自己的数据
							nui.get("emp").setValue('<%=nowusername %>');
							nui.get("emp").setReadOnly(true);
						}
						var isall;//是否拥有全公司的权限
						for(var i=0;i<text.orgs.length;i++){
							if(text.orgs[i].orgid == "1"){
								isall = "1";
								break;
							}
						}
						//如果拥有全公司的权限就取消部门限制
						if(isall == "1"){
							nui.getbyName("criteria._expr[2]._op").setValue("=");
	        				nui.getbyName("criteria._expr[2]._value").setValue("");
						}else{
							nui.get("orgids").setValue(text.orgids);
						}
						nui.get("orgseq").setData(text.orgs);
					}else{
						// 没有有权的机构时只能查项目负责人为自己的数据
							nui.get("emp").setValue('<%=nowusername %>');
							nui.get("emp").setReadOnly(true);
					}
					search();
				}
			});
	    }
	     
		//查询
		function search() {	     		
			var form = new nui.Form("#form1");
			var data = form.getData(); //获取表单JS对象数据
			if(data.startdate==null||data.startdate==""||data.enddate==null||data.enddate==""){
				nui.alert("日期范围不能为空，请填写后查询！");
				return;
			}
		  	grid.load(data); //datagrid加载数据
		  	grid.sortBy("empid","desc");
		}
	    function reset(){
	     var form = new nui.Form("#form1");
		 form.reset();
		 init();
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
		function exportAtt(){
	    	nui.confirm("是否确认导出考勤统计数据吗 ？", "确定？",
	        function (action) {
	        	if(action=='ok'){
	        		grid.loading("正在导出，请稍后!");
	        		var form = new nui.Form("#form1");
					var data = form.getData(); //获取表单JS对象数据
					if(data.startdate==null||data.startdate==""||data.enddate==null||data.enddate==""){
						nui.alert("日期范围不能为空，请填写后查询！");
						return;
					}
					nui.ajax({
		    			url: "com.primeton.eos.ame_permanage.ame_leaveQuery.exportCountAtt.biz.ext",
				        type: "post",
				        data: data,
				        cache: false,
				        contentType: 'text/json',
				        success: function (o) {
				     		grid.unmask();
				     		var filePath = o.downloadFile;
				        	var fileName = "员工考勤统计记录";
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
		
		function getDictCom(e){
			return nui.getDictText("company",e.value);
		}
		function getDictType(e){
			return nui.getDictText("EMP_TYPE",e.value);
		}
	</script>
</body>
</html>
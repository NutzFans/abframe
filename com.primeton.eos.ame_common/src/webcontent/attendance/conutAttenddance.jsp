<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="com.eos.data.datacontext.UserObject"%>
<%@page import="java.util.Map"%>
<%@page import="commonj.sdo.DataObject"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<!-- 
  - Author(s): zhuhx
  - Date: 2017-02-20 11:06:02
  - Description:
-->
<head>
	<title>考勤动态统计</title>
	<meta http-equiv="content-type" content="text/html; charset=UTF-8" />
	<script src="<%= request.getContextPath() %>/common/nui/nui.js" type="text/javascript"></script>
</head>
<body>
	<div class="nui-panel" title="考勤动态统计" width="100%">
		   <form id="form1" method="post" style="width:100%">
			<div class="nui-toolbar" >
				<table style="width:100%;">
					<tr>
						<td align="right">考勤年份：</td>
						<td>
							<input name="criteria._expr[1]._value" class="nui-textbox" style="width:150px;" id="nowYear"/>
						    <input class="nui-hidden" name="criteria._expr[1]._property" value="year"/>
						    <input class="nui-hidden" name="criteria._expr[1]._op" value="="/>
						</td>
						<td align="right">考勤月份范围：</td>
						<td>
							<input name="criteria._expr[2]._min" class="nui-textbox" style="width:60px;" id = "aaa"/>
						    <input class="nui-hidden" name="criteria._expr[2]._property" value="month"/>
						    <input class="nui-hidden" name="criteria._expr[2]._op" value="between"/>
							至
							<input name="criteria._expr[2]._max" class="nui-textbox" style="width:60px;" id = "bbb"/>
						    <input class="nui-hidden" name="criteria._expr[2]._property" value="month"/>
						    <input class="nui-hidden" name="criteria._expr[2]._op" value="between"/>
						</td>
						<td align="right">供应商：</td>
						<td>
							<input name="criteria._expr[3]._value" class="nui-textbox" style="width:150px;"/>
						    <input class="nui-hidden" name="criteria._expr[3]._property" value="custname"/>
						    <input class="nui-hidden" name="criteria._expr[3]._op" value="like"/>
						    <input class="nui-hidden" name="criteria._expr[3]._likeRule" value="all"/>
						</td>
						<td align="right">受益事业部：</td>
						<td>
							<input name="criteria._expr[0]._value" class="nui-dictcombobox"  shownullItem="true" dictTypeId="CONT_ORG" style="width:150px;" id="sybs"/>
						    <input class="nui-hidden" name="criteria._expr[0]._property" value="sybid"/>
						    <input class="nui-hidden" name="criteria._expr[0]._op" value="="/>
						</td>
					</tr>
					<tr>
						<td align="right">外包人员：</td>
						<td>
							<input name="criteria._expr[4]._value" class="nui-textbox" style="width:150px;" id="names"/>
						    <input class="nui-hidden" name="criteria._expr[4]._property" value="operatorname"/>
						    <input class="nui-hidden" name="criteria._expr[4]._op" value="like"/>
						    <input class="nui-hidden" name="criteria._expr[4]._likeRule" value="all"/>
						</td>
						<td align="right">项目名称：</td>
						<td>
							<input name="criteria._expr[7]._value" class="nui-textbox" style="width:150px;"/>
						    <input class="nui-hidden" name="criteria._expr[7]._property" value="projectName"/>
						    <input class="nui-hidden" name="criteria._expr[7]._op" value="like"/>
						    <input class="nui-hidden" name="criteria._expr[7]._likeRule" value="all"/>
						</td>
						<td align="right">项目编号：</td>
						<td>
							<input name="criteria._expr[6]._value" class="nui-textbox" style="width:150px;" id = "projectno"/>
						    <input class="nui-hidden" name="criteria._expr[6]._property" value="projectNo"/>
						    <input class="nui-hidden" name="criteria._expr[6]._op" value="like"/>
						    <input class="nui-hidden" name="criteria._expr[6]._likeRule" value="all"/>
						</td>
						<td align="right">受益销售：</td>
						<td>
							<input name="criteria._expr[5]._value" class="nui-textbox" style="width:150px;"/>
						    <input class="nui-hidden" name="criteria._expr[5]._property" value="orgname"/>
						    <input class="nui-hidden" name="criteria._expr[5]._op" value="like"/>
						    <input class="nui-hidden" name="criteria._expr[5]._likeRule" value="all"/>
						</td>
					</tr>
	            </table> 
	             <table style="width:90%;">
		            <tr>
		                <td align="center" style="width:100%;">
		                    <a class="nui-button" iconCls="icon-search" id="search" onclick="search()" >查询</a>
							<a class="nui-button" iconCls="icon-reload" id="reset" onclick="reset()" >重置</a>
							<a class="nui-button" id="exportAtt" iconCls="icon-download" onclick="exportAtt">导出</a>  
		                </td>
		            </tr>
	        	</table>          
	        </div>
	    </form>
		<!-- 考勤统计信息列表
		-->
		<div style="width:100%;" id="exp1">
	        <div class="nui-toolbar" style="border-bottom:0;padding:0px;">
	            <table style="width:100%;">
	            	<tr>
	                    <td style="width:20%;">
	                        <a class="nui-button" id="updateBtn" iconCls="icon-edit" onclick="generateStatistics()" >生成考勤静态统计</a>
	                    </td>
	                </tr>
                 </table>           
	        </div>
	    </div>
	    <div id="datagrid1" class="nui-datagrid" style="width:100%;height:330px;"
	    url="com.primeton.eos.ame_common.ameAttendance.countAttendance.biz.ext" dataField="datas"
	     sortMode="client" dataField="datas" pageSize="10" sizeList="[10,20,50,100]" showPager="true">
			<div property="columns">
				<div field="operatorname" width="50" align="center"  headerAlign="center" allowSort="true" renderer="getDetail">人员</div>
				<div field="suppliersname" width="100" align="center"  headerAlign="center" allowSort="true">供应商(简称)</div>
				<div field="projectName" width="100" align="center"  headerAlign="center" allowSort="true">项目名称</div>
				<div field="projectNo" width="90" align="center"  headerAlign="center" allowSort="true">项目编号</div>
				<div field="sybid" width="100" align="center" renderer="getsyb" headerAlign="center" allowSort="true">受益事业部</div>
				<div field="orgname" width="90" align="center"  headerAlign="center" allowSort="true">受益销售</div>
				<div field="empname" width="60" align="center"  headerAlign="center" allowSort="true">汇报对象</div>
				<div field="year" width="60" align="center" headerAlign="center"  allowSort="true">考勤年份</div>
				<div field="month" width="60" align="center" headerAlign="center"  allowSort="true">考勤月份</div>
				<div field="stddays" width="60" align="center" headerAlign="center"  allowSort="true">标准天数</div>
				<div field="days" width="60" align="center" headerAlign="center"  allowSort="true">出勤天数</div>
				<div field="cdnum" width="60" align="center" headerAlign="center"  allowSort="true">迟到次数</div>
				<div field="ztnum" width="60" align="center" headerAlign="center"  allowSort="true">早退次数</div>
				<div field="wqdnum" width="70" align="center" headerAlign="center"  allowSort="true">未签到次数</div>
				<div field="wqtnum" width="70" align="center" headerAlign="center"  allowSort="true">未签退次数</div>
				<div field="rcdate" width="80" align="center" headerAlign="center"  allowSort="true">入场日期</div>
				<div field="lcdate" width="80" align="center" headerAlign="center"  allowSort="true">离场日期</div>	
			</div>
	   </div>	
	</div>
	<form name="viewlist1" id="viewlist1" action="com.primeton.eos.ame_common.ameExportCommon.flow" method="post">
		<input type="hidden" name="_eosFlowAction" value="action0" filter="false"/>
		<input type="hidden" name="downloadFile" filter="false"/>
		<input type="hidden" name="fileName" filter="false"/>
	</form>  

<script type="text/javascript">
	nui.parse();
	var form = new nui.Form("#form1");
	var grid = nui.get("datagrid1");
	var names = '<%=request.getParameter("names") %>';
	var projectno = '<%=request.getParameter("projectno") %>';
	var state = '<%=request.getParameter("state") %>';
	if(state==1){
		document.getElementById("updateBtn").style.display = "none";
	}
	var dataResult = null;
	<% 
		UserObject user = (UserObject)session.getAttribute("userObject");
		boolean isPMO=false;
		Map attr = user.getAttributes();
		DataObject[] roles = (DataObject[]) attr.get("roles");
		for(int i=0;i<roles.length;i++){
			String rolesTemp = roles[i].getString("roleid");
			if(rolesTemp.equals("PMO")){
				isPMO=true;
			}
		}
	%>
	var isPMO = <%= isPMO %>;
	if(isPMO==true){
		document.getElementById("exp1").style.display="";
	}else{
		document.getElementById("exp1").style.display="none";
	}
	init();
	function init(){
		grid.loading("查询中...");
		if(names != null && names != "" && names != "null"){
			//考勤统计详细页面传参
			nui.get("names").setValue(names);
			nui.get("projectno").setValue(projectno);
			var data = form.getData();
			document.getElementById('form1').style.display='none';
			grid.load(data);
		}else{
			 //默认当前年份
		    var d = new Date();
	        var  nowYear = d.getFullYear();
	        var  nowMonth = d.getMonth()+1;
	        nui.get("nowYear").setValue(nowYear);
	        nui.get("aaa").setValue(nowMonth);
	        nui.get("bbb").setValue(nowMonth);
			var json = {};
		    json = nui.decode(json);
    		nui.ajax({
    			url:"com.primeton.eos.ame_common.sendMail.getMySYB.biz.ext",
    			data:json,
    			type:"post",
    			contentType:"text/json",
    			success:function(action){
    				if(action.syb.length > 0){
	    				var sybdata = [];
	    				for(var i = 0;i < action.syb.length;i ++){
	    					sybdata[i] = {"dictID": action.syb[i].dictid,"dictName": action.syb[i].dictname};
	    				}
	    				nui.get("sybs").setData(sybdata);
	    				nui.get("sybs").setShowNullItem(false);
	    				nui.get("sybs").setValue(action.syb[0].dictid);
    				}else{
    					nui.get("sybs").setShowNullItem(true);
    				}
					var data = form.getData(); 
					grid.load(data);
    			},
    			error:function(jqXHR, textStatus, errorThrown){
    				nui.alert("error:" + jqXHR.responseText);
    			}
    		});
		}
	}
		
	//考勤查询
	function search(){
		var data = form.getData(); 
		grid.loading("查询中...");
		grid.load(data);
	}
	
	//重置
	function reset(){
		form.reset();
		grid.load();
	}
	function getDetail(e){
		if(e.value){
    		return "<a href='javascript:void(0)' onclick='checkDetail();' title='点击查看'>" + e.value + "</a>";
    	}
    }
    function checkDetail(){
 		var selectRow = grid.getSelected();
		var executeUrl = "/default/ame_common/attendance/queryAttendance.jsp?names=" + selectRow.operatorname+"&month="+selectRow.month+"&projectno="+selectRow.projectNo+"&year="+selectRow.year+"&suppliersname="+selectRow.suppliersname;
		window.open(executeUrl, "考勤记录明细", "fullscreen=1");
    }
    function exportAtt(){
		 var form = new nui.Form("#form1");
         form.loading("操作中，请稍后......");
         var json = form.getData();
			nui.ajax({
                url: "com.primeton.eos.ame_common.ameAttendance.exportAtt.biz.ext",
                type: "post",
                data: json,
                cache: false,
                contentType: 'text/json',
                success: function (o) {
             		form.unmask();
                	var filePath = o.downloadFile;
                	var fileName = "考勤统计";
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
						alert(curDateTime);
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
    function getsyb(e){
    	return nui.getDictText('CONT_ORG',e.value);//设置业务字典值
    }
    
    
    function generateStatistics(){
		var url = "<%=request.getContextPath() %>/ame_common/attendance/generateStatistics.jsp";
		var title = "生成考勤统计";
		var width=550;
	    nui.open({
			url: url,
			title: title,
			width: width,
			height: 240,
			onload: function () {
				var iframe = this.getIFrameEl();
			},
			ondestroy: function (action){
			}
		});
    }

    
</script>
</body>
</html>
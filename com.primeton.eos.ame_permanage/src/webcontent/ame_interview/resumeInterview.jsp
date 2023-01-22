<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>	
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@page import="com.eos.data.datacontext.UserObject"%>
<%@page import="commonj.sdo.DataObject"%>
<%@page import="java.util.Map"%>
<html>
<!-- 
  - Author(s): 许青倩
  - Date: 2019-11-13 10:25:06
  - Description:
-->
<head>
<title>面试情况</title>
	<meta http-equiv="content-type" content="text/html; charset=UTF-8" />
	<script src="<%= request.getContextPath() %>/common/nui/nui.js" type="text/javascript"></script>
	<style type="text/css">
    body{
        margin:0;padding:0;border:0;width:100%;height:100%;overflow:hidden;
    }
    </style>
</head>
<body>
<div class="nui-fit">
	<div title="面试情况" id = "interview" name = "interview">
		<div style="width:140px;">
	        <div class="nui-toolbar" style="border-bottom:0;padding:0px;">
	            <table style="width:100%;">
	                <tr>
	                    <td style="width:100%;">
	                        <a class="nui-button" iconCls="icon-add" id="add2" onclick="addRow1()">增加</a>
	                        <a class="nui-button" iconCls="icon-remove" id="delete2" onclick="removeRow1()">删除</a>
	                    </td>
	                </tr>
	            </table>           
	        </div>
	    </div>
		<div style="width:100%;">
	        <div class="nui-toolbar" style="border-bottom:0;padding:0px;">
	            <table style="width:100%;">
	            	<tr>
	                    <td style="width:20%;">
	                       	<%=request.getParameter("empname")+"面试安排"%>
	                    </td>
	                </tr>
	             </table>           
	        </div>
	    </div>
	    <div id="grid_interview_<%=request.getParameter("resumeid")%>" class="nui-datagrid" style="width:100%;height:auto;" dataField="resumInterviews"
	        showPager="false" allowCellEdit="true" allowCellSelect="true" multiSelect="true" editNextOnEnterKey="true"
	        url="com.primeton.eos.ame_permanage.ame_resum.getInterview.biz.ext" allowSortColumn="true" allowCellWrap="true">			            
	        <div property="columns">
	        	<div type="checkcolumn" width="20px"></div>
	        	<input field="interviewid" class="nui-hidden" visible="false">
	        	<div field="interviewdtae" width="40" headerAlign="center" align="left" allowSort="true" dateFormat="yyyy-MM-dd" renderer="onDealDate">面试时间
	            	<input property="editor" class="nui-datepicker" showTodayButton="false" style="width:100%;"  dateFormat="yyyy-MM-dd"/>
	            </div>
	            <div field="interviewer" displayField="empname"width="40" headerAlign="center" align="left" >面试人
					<input property="editor" class="nui-buttonedit" onbuttonclick="showEmployee" showClose="false" required="true" allowInput="false"/>
				</div>
	            <div field="applyoccupation" width="80" headerAlign="center" align="left">面试岗位
	            	<input property="editor" class="nui-textbox" vtype="float" inputStyle="text-align: left" maxLength="255"/>
	            </div>
	            <div field="feedback" width="200" headerAlign="center" align="left">面试反馈
	            	<input property="editor" class="nui-textarea" style="width: 200px" minWidth="200" minHeight="80" maxLength="255"/>
	            </div>
	    	</div>
		</div>
	</div>
</div>
</body>
<script type="text/javascript">
	nui.parse();
	var resumeid = <%=request.getParameter("resumeid")%>;
	var grid_interview = nui.get('grid_interview_'+'<%=request.getParameter("resumeid")%>');
	
	init();
	function init(){
		grid_interview.load({"criteria": {"_expr[0]": { "ameResume.resumeid": resumeid}}});
		grid_interview.sortBy("interviewdtae", "desc");
	}
	
	function addRow1(){
		var newRow = { name: "New Row",status: "0" };
        grid_interview.addRow(newRow, 0);
	}
	
	function removeRow1(){
        var rows = grid_interview.getSelecteds();
        var num = rows.length;
        if (rows.length > 0) {
        	if(confirm("确定删除"+num+"条记录吗？")){
        		grid_interview.removeRows(rows, false);
        	}else{
        		return false;
        	}
        }else{
			alert("请选择一条记录！"); 
        }
	}
</script>
</html>
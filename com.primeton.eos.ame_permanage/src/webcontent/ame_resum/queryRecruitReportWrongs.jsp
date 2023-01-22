<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@page import="com.eos.data.datacontext.UserObject"%>
<%@page import="commonj.sdo.DataObject"%>
<%@page import="java.util.Map"%>
<html>
<!-- 
  - Author(s): xupc
  - Date: 2020-03-04 
  - Description:
-->
<head>
<title>招聘报表问题检查</title>
<meta http-equiv="content-type" content="text/html; charset=UTF-8" />
<script src="<%= request.getContextPath() %>/common/nui/nui.js" type="text/javascript"></script>
</head>
<body style="width: 98%" class="body-font">
	<div style="width:100%;height:100%;padding:0px;margin:0px;">
		<div class="nui-toolbar" style="border-bottom:0;padding:0px;">
			<legend>招聘报表问题检查</legend>
			<div class="nui-toolbar" line-height="30px;" borderStyle="border:0;" id="form1">
			    <table id="table1" style="width: 100%;height:32px;font-size:12px;" align="center" >
		        	<tr>
		        		<td align="right" style="width:350px;">检查项 :</td>
		        		<td align="left" nowrap="nowrap">
						   <input name="checktype" class="nui-combobox" valueField="id" textField="text"  id = "checktype" showNullItem="true" 
						   data=[{"id":'1',"text":'拟入职库中没有员工属性的人员统计'},{"id":'2',"text":'拟入职人员中对应的部门不是今年的组织架构的人员统计'},{"id":'3',"text":'已入职的拟入职人员中员工登录名为空的人员统计'},{"id":'4',"text":'通过内推的人员其所在需求不支持内推的人员统计'},{"id":'5',"text":'转正人员中属于两个部门的人员统计'},{"id":'6',"text":'入职人员所在需求部门和实际需求部门不一致的人员统计'},{"id":'7',"text":'（拟）入职人员直接在拟入职库中增加，未走面试流程的人员统计'}]
						   style="width:550px;"/>
		        		</td>
					</tr>
					<tr>
					   <td align="center" colspan="15">
		            	<a class="nui-button" iconCls="icon-search" onclick="search()">查询</a>
		            	<a class="nui-button" id="reset" iconCls="icon-reload" onclick="reset()">重置</a>
		     		   </td>
                    </tr>
	            </table>  
	         </div>
		    <div id="RecruitReportWrongs" class="nui-datagrid"  allowResize="true" showSummaryRow="true"
				 style="margin-top:0px;width: 100%;height:410px;" dataField="queryRecruitReportWrongs" sizeList="[10,20,50,100,200,500]" 
				url="com.primeton.eos.ame_permanage.ame_resum.queryRecruitReportWrongs.biz.ext" 
				allowAlternating="true" pageSize="20" showPager="true" >
					<div property="columns">
					<div field="empname" headerAlign="center" align="center" width="50">姓名</div>
					<div field="orgname" headerAlign="center" align="center" width="80">入职部门</div>
					<div field="recruitno" headerAlign="center" align="center" width="80"  renderer="getDetail">招聘需求</div>
					<div field="interdate" headerAlign="center" align="center" width="80" dateFormat="yyyy-MM-dd" >拟入职日期</div>
				</div>
			</div>
		</div>	
   </div>  
</body>
<script type="text/javascript">
	nui.parse();
	var grid=nui.get("RecruitReportWrongs");
	var form = new nui.Form("#form1"); 
	search();
	function search(){
	    var checktype = nui.get("checktype").getValue();
	    var data = {checktype:checktype};
	    grid.load(data);
        
	}
	function reset(){
		form.reset();
		search();
	}
	function getDetail(e){
    	if(e.value){
    		return "<a href='javascript:void(0)' onclick='getOmRecruitDetail();' title='点击查看'>" + e.value + "</a>";
    	}
    }
    function getOmRecruitDetail(){
    	var selectRow = grid.getSelected();
		var executeUrl = "/default/abframe/org/recruit/omRecruitDetail.jsp?recruitid=" + selectRow.recruitid;
		window.open(executeUrl);
    }
    
</script>
</html>
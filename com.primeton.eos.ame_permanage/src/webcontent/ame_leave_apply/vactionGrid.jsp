<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>	
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<!-- 
  - Author(s): mengyy
  - Date: 2019-09-04 19:31:10
  - Description:
-->
<head>
<title>年假信息</title>
</head>
<body>
    <div id="vaction_grid" class="nui-datagrid" style="width: 100%;height: auto;" allowCellSelect="true" 
		 url="com.primeton.eos.ame_permanage.ame_leavepro.getEmpVac.biz.ext" dataField="vacs"
		 showPager="false" allowCellEdit="true" multiSelect="true">
        <div property="columns">
            <!-- <div field="empname" width="60" align="center" headerAlign="center" allowSort="true" >姓名</div> -->
            <div field="indate" dateFormat="yyyy-MM-dd" width="80" align="center" headerAlign="center" >入职日期 </div>
            <div field="socialstart" dateFormat="yyyy-MM-dd" width="100" align="center" headerAlign="center" >社会工作起始时间 </div>
            <div field="workyears" width="50" align="center" headerAlign="center" >社会工龄 </div>
            <div field="comyears" width="40" align="center" headerAlign="center" >司龄 </div>
            <div field="workingdays" width="80" align="center" headerAlign="center" >当年在职天数</div>
            <div field="standvac" width="80" align="center" headerAlign="center" >标准年假天数 </div>
            <div field="vacdays" width="50" align="center" headerAlign="center" >当年可用</div>
            <div field="lastrest" width="50" align="center" headerAlign="center" >上年剩余 </div>
            <div field="overvac" width="90" align="center" headerAlign="center" >当年春节统筹休假</div> 
            <div field="daysoff" width="80" align="center" headerAlign="center" >当年已休</div> 
            <div field="leavetotaldays" width="80" align="center" headerAlign="center" >当前申请中年假 </div>  
            <div field="nowrestvac" width="80" align="center" headerAlign="center" >当前可休年假 </div>
        </div>
    </div>
    <table style="table-layout:fixed;" id="vacdeal">
    <tr>
		<td style="width:105px;" align="right">年假处理方式：</td>
        <td style="width:150px;">    
            <input class="nui-dictcombobox" name="omLeaveApply.vacdealtype" id="vacdealtype" required="true" valueField="dictid" textField="dictname" emptyText="请选择" onvaluechanged="changevactype" />
        </td>
    </tr>
    </table>
    <div id="formvac" style="display: none;" >
	    <table style="table-layout:fixed;" id="table_file">
			<input name="leavedetail.leavedetailid" class="nui-hidden"/>
			<input name="leavedetail.leaveid" class="nui-hidden"/>
	    	<tr>
	        	<td width="120px" align="right">年假开始时间：</td>
	            <td width="150px">    
					<input name="leavedetail.startdate" class="nui-datepicker" id="startdate"  required="true" onvaluechanged="changgevac"/>
	            </td>
	    		<td style="width:120px;" align="right">开始时段：</td>
	            <td style="width:150px;">    
	                <input class="nui-dictcombobox" name="leavedetail.sptype" id="sptype" onvaluechanged="changgevac" dictTypeId="AME_TIMEPERIOD" required="true" emptyText="请选择" allowInput="true"/>
	            </td>
	            <td style="width:120px;" align="right">年假结束时间：</td>
	            <td style="width:150px;">    
	                <input name="leavedetail.enddate" class="nui-datepicker" id="enddate" required="true" onvaluechanged="changgevac"/>
	            </td>
	            <td style="width:120px;" align="right">结束时段：</td>
	            <td style="width:150px;">    
	                <input class="nui-dictcombobox" name="leavedetail.eptype" id="eptype" onvaluechanged="changgevac" dictTypeId="AME_TIMEPERIOD" required="true" emptyText="请选择" allowInput="true" />
	            </td>
	    	</tr>
	    	<tr>
	            <td style="width:120px;" align="right">离职日期：</td>
	            <td style="width:150px;">    
	                <input class="nui-datepicker" name="leavedetail.actoutdate" id="actoutdate" required="true"/>
	            </td>
	            <td style="width:120px;" align="right">请假天数：</td>
	            <td style="width:150px;">    
	                <input class="nui-spinner"name="leavedetail.days" id="days" readonly="readonly"/>
	            </td>
	    	</tr>
	    </table>
    </div>
</body>
</html>
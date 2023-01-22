<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@include file="/common/common.jsp"%>
<%@ page import="com.eos.data.datacontext.UserObject"%>
<html>
<!-- 
  - Author(s): xpc
  - Date: 2019-09-24 13:40:07
  - Description:
-->
<head>
<title>机构查询</title>
<script src="<%= request.getContextPath() %>/common/nui/nui.js" type="text/javascript"></script>

</head>
<body>
<div style="width:100%;height:100%;padding:0px;margin:0px;" >
	<div style="width:100%;">
        <div class="nui-toolbar" style="border-bottom:0;padding:0px;">
            <table style="width:100%;">
            	<tr>
                    <td style="width:20%;">
                       	员工全量信息查询
                    </td>
                </tr>
             </table>           
        </div>
    </div>
    <div id="form1" class="nui-toolbar" style="border-bottom:0;padding:0px;">
    	<input class="nui-hidden" name="ctOrgEmpQry._entity" value="org.gocom.abframe.dataset.organization.OmAllPeople"/>
    	<table style="width:100%;">
    		<tr>
			 	<td align="right" nowrap="nowrap" style="width: 90px">人员姓名：</td>
			 	<td>
			 		<input class="nui-textbox" name="ctOrgEmpQry._expr[0]._value" style="width: 100px" id = "emp" onenter="onKeyEnter"/>
		 		 	<input class="nui-hidden" name="ctOrgEmpQry._expr[0]._property" value="empname"/>
                    <input class="nui-hidden" name="ctOrgEmpQry._expr[0]._op" value="like"/>
			    </td>
				<td align="right" style="width: 60px">员工工号：</td>
            	<td align="left">
				    <input class="nui-textbox" name="ctOrgEmpQry._expr[1]._value" style="width: 100px" onenter="onKeyEnter"/>
		 		 	<input class="nui-hidden" name="ctOrgEmpQry._expr[1]._property" value="empcode"/>
                    <input class="nui-hidden" name="ctOrgEmpQry._expr[1]._op" value="like"/>
				</td>
				<td align="right" >登录名：</td>
            	<td align="left">
				    <input class="nui-textbox" name="ctOrgEmpQry._expr[2]._value" style="width: 100px" onenter="onKeyEnter"/>
		 		 	<input class="nui-hidden" name="ctOrgEmpQry._expr[2]._property" value="userid"/>
                    <input class="nui-hidden" name="ctOrgEmpQry._expr[2]._op" value="like"/>
				</td>
				<td align="right" >出生日期：</td>
            	<td align="left">
            		<input class="nui-datepicker" id="min1" name="ctOrgEmpQry._expr[3]._min" style="width:95px" onenter="onKeyEnter"/>-<input class="nui-datepicker" name="ctOrgEmpQry._expr[3]._max" style="width:95px" onenter="onKeyEnter"/>
		 		 	<input class="nui-hidden" name="ctOrgEmpQry._expr[3]._property" value="birthdate"/>
		 		 	<input class="nui-hidden" name="ctOrgEmpQry._expr[3]._op" value="between"/>
				</td>
    		</tr>
    		<tr>
			 	<td align="right" nowrap="nowrap">员工状态：</td>
			 	<td>
			 		<input class="nui-dictcombobox" name="ctOrgEmpQry._expr[4]._value" style="width: 100px" value="on" dictTypeId="ABF_EMPSTATUS" shownullItem="true" onenter="onKeyEnter" multiSelect="true"/>
		 		 	<input class="nui-hidden" name="ctOrgEmpQry._expr[4]._property" value="empstatus"/>
                    <input class="nui-hidden" name="ctOrgEmpQry._expr[4]._op" value="in"/>
			    </td>
				<td align="right">办公邮件：</td>
            	<td align="left" >
				    <input class="nui-textbox" name="ctOrgEmpQry._expr[5]._value" style="width: 100px" onenter="onKeyEnter"/>
		 		 	<input class="nui-hidden" name="ctOrgEmpQry._expr[5]._property" value="oemail"/>
                    <input class="nui-hidden" name="ctOrgEmpQry._expr[5]._op" value="like"/>
				</td>
				<td align="right" style="width: 100px">人员成本属性：</td>
			 	<td>
			 		<input class="nui-dictcombobox"  name="ctOrgEmpQry._expr[6]._value"  style="width: 100px" dictTypeId="AME_EMPTYPE2" onenter="onKeyEnter" multiSelect="true" shownullItem="true"/>
		 		 	<input class="nui-hidden" name="ctOrgEmpQry._expr[6]._property" value="degree"/>
                    <input class="nui-hidden" name="ctOrgEmpQry._expr[6]._op" value="in"/>
			    </td>
				<td align="right">入职日期：</td>
            	<td align="left">
				    <input class="nui-datepicker" name="ctOrgEmpQry._expr[7]._min" style="width:95px" onenter="onKeyEnter"/>-<input class="nui-datepicker"  name="ctOrgEmpQry._expr[7]._max" onenter="onKeyEnter" style="width:95px"/>
		 		 	<input class="nui-hidden" name="ctOrgEmpQry._expr[7]._property" value="indate"/>
                    <input class="nui-hidden" name="ctOrgEmpQry._expr[7]._op" value="between"/>
				</td>
    		</tr>
    		<tr>
			 	<td align="right">所属公司：</td>
            	<td align="left" >
				   	<input class="nui-dictcombobox"  name="ctOrgEmpQry._expr[8]._value"  style="width: 100px" dictTypeId="company" onenter="onKeyEnter"/>
		 		 	<input class="nui-hidden" name="ctOrgEmpQry._expr[8]._property" value="company"/>
                    <input class="nui-hidden" name="ctOrgEmpQry._expr[8]._op" value="="/>
				</td>
            	<td align="right">职位级别：</td>
            	<td align="left" >
                    <input class="nui-dictcombobox"  name="ctOrgEmpQry._expr[9]._value"  style="width: 100px" dictTypeId="AME_TECH" onenter="onKeyEnter" multiSelect="true" shownullItem="true"/>
		 		 	<input class="nui-hidden" name="ctOrgEmpQry._expr[9]._property" value="joblevel"/>
                    <input class="nui-hidden" name="ctOrgEmpQry._expr[9]._op" value="in"/>
				</td>
				<td align="right">人员性质：</td>
            	<td align="left" >
                    <input class="nui-dictcombobox"  name="ctOrgEmpQry._expr[10]._value"  style="width: 100px" dictTypeId="AME_EMPTYPE2" onenter="onKeyEnter" multiSelect="true" shownullItem="true"/>
		 		 	<input class="nui-hidden" name="ctOrgEmpQry._expr[10]._property" value="nature"/>
                    <input class="nui-hidden" name="ctOrgEmpQry._expr[10]._op" value="in"/>
				</td>
				<td align="right">离职日期：</td>
            	<td align="left">
				    <input class="nui-datepicker"  name="ctOrgEmpQry._expr[11]._min" style="width:95px" onenter="onKeyEnter"/>-<input class="nui-datepicker"  name="ctOrgEmpQry._expr[11]._max" style="width:95px" onenter="onKeyEnter"/>
		 		 	<input class="nui-hidden" name="ctOrgEmpQry._expr[11]._property" value="outdate"/>
                    <input class="nui-hidden" name="ctOrgEmpQry._expr[11]._op" value="between"/>
				</td>
    		</tr>
    		<tr>
    		    <td align="right" nowrap="nowrap">直属上级：</td>
			 	<td>
                    <input class="nui-hidden" name="ctOrgEmpQry._expr[12]._property" value="empid"/>
			        <input class="nui-hidden" name="ctOrgEmpQry._expr[12]._op" value="in" id="tempcond1"/>
			        <input class="nui-hidden" name="ctOrgEmpQry._expr[12]._ref" value="" id="tempcond2"/>
			        <input class="nui-hidden" name="ctOrgEmpQry._ref[0]._id" value="1"/>					        
			        <input class="nui-hidden" name="ctOrgEmpQry._ref[0]._entity" value="org.gocom.abframe.dataset.organization.Querymanager"/>
			        <input class="nui-hidden" name="ctOrgEmpQry._ref[0]._select._field[0]" value="empid"/>
			        <input class="nui-hidden" name="ctOrgEmpQry._ref[0]._expr[0]._property" value="managerid"/>
			        <input class="nui-hidden" name="ctOrgEmpQry._ref[0]._expr[0]._op" value="="/>
			        <input name="ctOrgEmpQry._ref[0]._expr[0]._value"  style="width:100px;" class="nui-textboxlist" url="com.primeton.eos.ame_budget.budgetOrgManager.queryEmpByName.biz.ext" 
					 searchField="name" textField="EMPNAME" valueField="EMPID"  showNullItem="true" allowInput="true"  onvaluechanged="changeOrg" onenter="onKeyEnter" />
			    </td>
				<td align="right">员工属性：</td>
            	<td align="left" >
                    <input class="nui-dictcombobox"  name="ctOrgEmpQry._expr[13]._value"  style="width: 100px" dictTypeId="EMP_TYPE" onenter="onKeyEnter" multiSelect="true" shownullItem="true"/>
		 		 	<input class="nui-hidden" name="ctOrgEmpQry._expr[13]._property" value="emptype"/>
                    <input class="nui-hidden" name="ctOrgEmpQry._expr[13]._op" value="in"/>
				</td>
            	<td align="right">手机号：</td>
            	<td align="left" >
				    <input class="nui-textbox" name="ctOrgEmpQry._expr[14]._value" style="width: 100px" onenter="onKeyEnter"/>
		 		 	<input class="nui-hidden" name="ctOrgEmpQry._expr[14]._property" value="mobileno"/>
                    <input class="nui-hidden" name="ctOrgEmpQry._expr[14]._op" value="like"/>
				</td>
				<td align="right">调动日期：</td>
            	<td align="left">
				    <input class="nui-datepicker"  name="ctOrgEmpQry._expr[15]._min" style="width:95px" onenter="onKeyEnter"/>-<input class="nui-datepicker" name="ctOrgEmpQry._expr[15]._max" style="width:95px" onenter="onKeyEnter"/>
		 		 	<input class="nui-hidden" name="ctOrgEmpQry._expr[15]._property" value="movetime"/>
                    <input class="nui-hidden" name="ctOrgEmpQry._expr[15]._op" value="between"/>
				</td>
    		</tr>
    		<tr>
	    		<td align="right" >工作地：</td>
			 	<td>
			 		<input class="nui-dictcombobox" name="ctOrgEmpQry._expr[16]._value" style="width: 100px" dictTypeId="AREA4CLRY" shownullItem="true" onenter="onKeyEnter" multiSelect="true"/>
		 		 	<input class="nui-hidden" name="ctOrgEmpQry._expr[16]._property" value="workplace"/>
	                <input class="nui-hidden" name="ctOrgEmpQry._expr[16]._op" value="in"/>
			    </td>
			    <td align="right"  >员工标签：</td>
            	<td align="left" >
                    <input class="nui-dictcombobox"  name="ctOrgEmpQry._expr[33].tag"  style="width: 100px" dictTypeId="EMP_TAG"  multiSelect="true" shownullItem="true"/>
                    <input class="nui-hidden" name="ctOrgEmpQry._expr[33]._op" value="="/>
				</td>
			</tr>
			<tr>
				<td align="right"  >历史工作单位：</td>
    		    <td align="left" >
			 		<input class="nui-hidden" name="ctOrgEmpQry._expr[32]._property" value="workcompanyname" />
			        <input class="nui-hidden" name="ctOrgEmpQry._expr[32]._op" value="like"/>
			        <input class="nui-textbox" name="ctOrgEmpQry._expr[32]._value" style="width:200px;" id="workcompanyname" onenter="onKeyEnter"/>
					<input class="nui-hidden" name="ctOrgEmpQry._expr[32]._likeRule" value="all"/>
			    </td>
				<td align="right" colspan="2">应转正日期：</td>
	            <td align="left" colspan="2">
					    <input class="nui-datepicker" name="ctOrgEmpQry._expr[17]._min" style="width:100px" onenter="onKeyEnter"/>-<input class="nui-datepicker"  name="ctOrgEmpQry._expr[17]._max" style="width:100px" onenter="onKeyEnter"/>
			 		 	<input class="nui-hidden" name="ctOrgEmpQry._expr[17]._property" value="shoulddate"/>
	                    <input class="nui-hidden" name="ctOrgEmpQry._expr[17]._op" value="between"/>
				</td>
				<td align="right">实际转正日期：</td>
	        	<td align="left">
				    <input class="nui-datepicker" name="ctOrgEmpQry._expr[18]._min" style="width:95px" onenter="onKeyEnter"/>-<input class="nui-datepicker"  name="ctOrgEmpQry._expr[18]._max" style="width:95px" onenter="onKeyEnter"/>
		 		 	<input class="nui-hidden" name="ctOrgEmpQry._expr[18]._property" value="realdate"/>
	                <input class="nui-hidden" name="ctOrgEmpQry._expr[18]._op" value="between"/>
				</td>	
			</tr>
			<tr>
			    <td align="right">是否参与PCF：</td>
            	<td align="left" colspan="2">
                    <input class="nui-dictcombobox"  name="ctOrgEmpQry._expr[19]._value" dictTypeId="MIS_YN" style="width: 200px" onenter="onKeyEnter"  style="width:100px;"/>
		 		 	<input class="nui-hidden" name="ctOrgEmpQry._expr[19]._property" value="isjoinpcf"/>
                    <input class="nui-hidden" name="ctOrgEmpQry._expr[19]._op" value="in"/>
				</td>
				 <td align="right" >PCF开始日期：</td>
            	<td align="left" colspan="2">
				    <input class="nui-datepicker"  name="ctOrgEmpQry._expr[20]._min" style="width:100px" onenter="onKeyEnter"/>-<input class="nui-datepicker" name="ctOrgEmpQry._expr[20]._max" style="width:100px" onenter="onKeyEnter"/>
		 		 	<input class="nui-hidden" name="ctOrgEmpQry._expr[20]._property" value="pcfstartdate"/>
                    <input class="nui-hidden" name="ctOrgEmpQry._expr[20]._op" value="between"/>
				</td>
				<td align="right">PCF结束日期：</td>
	        	<td align="left">
				    <input class="nui-datepicker" name="ctOrgEmpQry._expr[21]._min" style="width:95px" onenter="onKeyEnter"/>-<input class="nui-datepicker" name="ctOrgEmpQry._expr[21]._max" style="width:95px" onenter="onKeyEnter"/>
		 		 	<input class="nui-hidden" name="ctOrgEmpQry._expr[21]._property" value="pcfenddate"/>
	                <input class="nui-hidden" name="ctOrgEmpQry._expr[21]._op" value="between"/>
				</td> 
			</tr>
		    <tr>
			    <td align="right">是否自带电脑：</td>
            	<td align="left" colspan="2">
                    <input class="nui-dictcombobox"  name="ctOrgEmpQry._expr[22]._value" dictTypeId="MIS_YN" style="width: 200px" onenter="onKeyEnter"  style="width:100px;"/>
		 		 	<input class="nui-hidden" name="ctOrgEmpQry._expr[22]._property" value="istakepc"/>
                    <input class="nui-hidden" name="ctOrgEmpQry._expr[22]._op" value="in"/>
				</td>
				<td align="right" >自带电脑开始日期：</td>
            	<td align="left" colspan="2">
				    <input class="nui-datepicker"  name="ctOrgEmpQry._expr[23]._min" style="width:100px" onenter="onKeyEnter"/>-<input class="nui-datepicker" name="ctOrgEmpQry._expr[23]._max" style="width:100px" onenter="onKeyEnter"/>
		 		 	<input class="nui-hidden" name="ctOrgEmpQry._expr[23]._property" value="takepcdate"/>
                    <input class="nui-hidden" name="ctOrgEmpQry._expr[23]._op" value="between"/>
				</td>
				<td align="right">自带电脑结束日期：</td>
	        	<td align="left">
				    <input class="nui-datepicker" name="ctOrgEmpQry._expr[24]._min" style="width:95px" onenter="onKeyEnter"/>-<input class="nui-datepicker" name="ctOrgEmpQry._expr[24]._max" style="width:95px" onenter="onKeyEnter"/>
		 		 	<input class="nui-hidden" name="ctOrgEmpQry._expr[24]._property" value="takepcenddate"/>
	                <input class="nui-hidden" name="ctOrgEmpQry._expr[24]._op" value="between"/>
				</td>
			</tr>
			<tr>
			    <td align="right">所属机构：</td>
	        	<td align="left"  colspan="2">
				   <input name="ctOrgEmpQry._expr[25]._value" class="nui-combobox" style="width: 200px" id="orgseq" textField="orgname" valueField="orgseq" dataField = "orgs"  shownullItem="true" onenter="onKeyEnter"
					    allowInput="true" />
					<input class="nui-hidden" name="ctOrgEmpQry._expr[25]._property" value="orgseq"/>
		 		 	<input class="nui-hidden" name="ctOrgEmpQry._expr[25]._op" value="like"/>
	                <input class="nui-hidden" name="ctOrgEmpQry._expr[25]._likeRule" value="end"/>
	                
	                <input class="nui-hidden" name="ctOrgEmpQry._expr[26]._property" value="orgid"/>
			        <input class="nui-hidden" name="ctOrgEmpQry._expr[26]._op" value="in"/>
			        <input class="nui-hidden" name="ctOrgEmpQry._expr[26]._value" id="orgids"/>
				</td>
			    <td align="right">证件号码：</td>
            	<td align="left" colspan="2">
				    <input class="nui-textbox" name="ctOrgEmpQry._expr[27]._value"  onenter="onKeyEnter" style="width: 204px"/>
		 		 	<input class="nui-hidden" name="ctOrgEmpQry._expr[27]._property" value="cardno"/>
                    <input class="nui-hidden" name="ctOrgEmpQry._expr[27]._op" value="like"/>
				</td>
				<td align="right">招聘渠道：</td>
            	<td align="left" colspan="2">
                    <input class="nui-dictcombobox"  name="ctOrgEmpQry._expr[28]._value" dictTypeId="RECRUIT_WAY" style="width: 200px" onenter="onKeyEnter"   multiSelect="true"/>
		 		 	<input class="nui-hidden" name="ctOrgEmpQry._expr[28]._property" value="recruitsour"/>
                    <input class="nui-hidden" name="ctOrgEmpQry._expr[28]._op" value="in"/>
				</td>
			</tr>
			<tr>
			    <td align="right">招聘经办人：</td>
            	<td align="left" colspan="2">
                    <input class="nui-textbox" name="ctOrgEmpQry._expr[29]._value"  style="width: 200px" onenter="onKeyEnter"  style="width:100px;"/>
		 		 	<input class="nui-hidden" name="ctOrgEmpQry._expr[29]._property" value="recruitopername1"/>
                    <input class="nui-hidden" name="ctOrgEmpQry._expr[29]._op" value="like"/>
                    <input class="nui-hidden" name="ctOrgEmpQry._expr[29]._likeRule" value="all"/>
				</td>
				<td align="right" >司龄起算日期：</td>
            	<td align="left" colspan="2">
				    <input class="nui-datepicker"  name="ctOrgEmpQry._expr[30]._min" style="width:100px" onenter="onKeyEnter"/>-<input class="nui-datepicker" name="ctOrgEmpQry._expr[30]._max" style="width:100px" onenter="onKeyEnter"/>
		 		 	<input class="nui-hidden" name="ctOrgEmpQry._expr[30]._property" value="compmstartday"/>
                    <input class="nui-hidden" name="ctOrgEmpQry._expr[30]._op" value="between"/>
				</td>
				<td align="right"  >直属主管：</td>
    		    <td align="left" >
			 		<input class="nui-hidden" name="ctOrgEmpQry._expr[31]._property" value="majorname" />
			        <input class="nui-hidden" name="ctOrgEmpQry._expr[31]._op" value="like"/>
			        <input class="nui-textbox" name="ctOrgEmpQry._expr[31]._value" style="width:200px;" id="major" onenter="onKeyEnter"/>
					<input class="nui-hidden" name="ctOrgEmpQry._expr[31]._likeRule" value="all"/>
			    </td>
			</tr>
		
    		<tr>
    			<td align="center" colspan="8">
    				<a class="nui-button" id="search" iconCls="icon-search" onclick="search()">查找</a>
                    <a class="nui-button" id="reset" iconCls="icon-reload" onclick="reset()">重置</a>
                    <a class="nui-button" id="export" iconCls="icon-download" onclick="exportPeople()">导出员工信息</a>
    			</td>
    		</tr>
    	</table>
    </div>
</div>
<div id="datagrid1"  class="nui-datagrid" style="width:100%;height:372px;" allowResize="true" frozenStartColumn="0" frozenEndColumn="4" 
    dataField="omAllpeople" multiSelect="true" pageSize="20" sizeList="[10,20,30,50]" allowAlternating="true"
    url='org.gocom.abframe.org.employee.EmpManager.queryAllPeople.biz.ext' >
    <div property="columns">
    	<div name="temp123" type="checkcolumn"></div>
        <div field="company" width="100" headerAlign="center" align="center" renderer="company" allowSort="true">所属公司</div>
        <div field="emptype" width="60" headerAlign="center" align="center" renderer="emptype" allowSort="true">员工属性</div> 
        <div field="empcode" width="60" headerAlign="center" align="left" allowSort="true">员工工号</div>
    	<div field="empname" width="60" headerAlign="center" align="left" renderer="getEmpDetail" allowSort="true">人员姓名</div>
    	<div field="gender" width="40" headerAlign="center" align="center" renderer="gender" allowSort="true">性别</div>
    	<div field="indate" width="75" headerAlign="center" align="center" allowSort="true">入职日期</div> 
    	<div field="compmstartday" width="75" headerAlign="center" align="center" allowSort="true">司龄起算日期</div> 
    	<div field="mobileno" width="90" align="center" headerAlign="center" >手机号码</div>
    	<div field="syqname" width="130" headerAlign="center" align="center" allowSort="true">一级部门</div>
    	<div field="sybname" width="130" headerAlign="center" align="center" allowSort="true">二级部门</div>
    	<div field="ywdyname" width="130" headerAlign="center" align="center" allowSort="true">三级部门</div>
    	<div field="ywdzname" width="130" headerAlign="center" align="center" allowSort="true">四级部门</div>
    	<div field="inorgname" width="130" headerAlign="center" align="center" allowSort="true">所属部门</div>
    	<div field="positionname" width="120" headerAlign="center" align="center" allowSort="true" renderer="getPosition">职位分类</div>
    	<div field="positioncall" width="120" headerAlign="center" align="center" allowSort="true" >职位名称</div>
    	<!-- <div field="managername" width="70" align="center" headerAlign="center" >直属上级</div> -->
    	<div field="majorname" width="70" align="center" headerAlign="center" >直属主管</div>
    	<div field="workplace" width="60" headerAlign="center" align="center" renderer="workplace" allowSort="true">工作地</div>
        <div field="oemail" width="150" headerAlign="center" align="center" allowSort="true">办公邮件</div>
        <div field="nature" width="60" headerAlign="center" align="center" renderer="getEmptype" allowSort="true">人员性质</div>
        <div field="leavel"  width="70" headerAlign="center"  align="center" allowSort="true" >人员级别</div>
        <div field="recruitopername1" width="80" align="center" headerAlign="center" >招聘经办人</div> 
    	<div field="recruitsour" width="70" align="center" headerAlign="center" renderer="getRecruit">招聘渠道</div>
    	<div field="shoulddate" width="90" headerAlign="center" align="center" allowSort="true" >应转正日期</div> 
    	<div field="realdate" width="90" headerAlign="center" align="center" allowSort="true">实际转正日期</div>
        <div field="veriresult"  width="80" headerAlign="center"  align="center" allowSort="true" renderer="getturnregularstatus">转正状态</div>
    	<div field="mentorname" width="60" align="center" headerAlign="center" >导师</div> 
    	<div field="movetime" width="100" headerAlign="center" align="center" allowSort="true">调动日期</div> 
    	<div field="outorgname" width="120" headerAlign="center"  align="center">调出部门</div> 
    	<div field="outposi" width="100" headerAlign="center" align="center" renderer="getPosition">调出职位</div>
    	<div field="outdate" width="100" headerAlign="center" align="center" allowSort="true">离职日期</div>
    	<div field="outtype" width="100" align="center" headerAlign="center" renderer="getOuttype">离职性质</div>
    	<div field="outreason" width="100" align="center" headerAlign="center" renderer="getOutreason">离职原因</div>
    	<div field="outmemo" width="100" align="center" headerAlign="center" >离职说明</div>
    	<div field="highestlen" width="100" align="center" headerAlign="center" renderer="getDegree">最高学历</div> 
    	
    	<div field="graduschool" width="140" align="center" headerAlign="center">毕业学校</div> 
    	<div field="profession" width="140" align="center" headerAlign="center" >专业</div> 
    	<div field="welfareplace" width="100" align="center" headerAlign="center" renderer="workplace">福利缴纳地</div> 
    	<div field="resiproperty" width="100" align="center" headerAlign="center" renderer="resiproperty">户籍性质</div> 
    	<div field="residence" width="100" align="center" headerAlign="center" renderer="getCity">户口所在省市</div> 
    	<div field="resiaddress" width="150" align="left" headerAlign="center" >户口所在地址</div>
    	<div field="cardno" width="150" align="center" headerAlign="center" >证件号码</div>
    	<div field="birthdate" width="100" headerAlign="center" align="center"  allowSort="true">出生日期</div> 
    	<div field="highestindate" width="100" align="center" headerAlign="center" >最高学历入学</div> 
    	<div field="highestoutdate" width="100" align="center" headerAlign="center" >最高学历毕业</div> 
    	<div field="socialstart" width="100" align="center" headerAlign="center" >社会工作时间</div>
    	<div field="contstart" width="90" headerAlign="center" align="center">合同开始日期</div>
    	<div field="contend" width="90" headerAlign="center" align="center">合同结束日期 </div>
    	<div field="eduverify" width="100" align="center" headerAlign="center" renderer="getEduverify">学历验证</div>
    	
    	
        <div field="realname" width="80" headerAlign="center" align="center"  allowSort="true">昵称</div>
    	<div field="empstatus" width="90" headerAlign="center" align="center" renderer="empstatus" allowSort="true">人员状态</div>   
        <div field="userid" width="80" headerAlign="center" align="center" allowSort="true">用户登录</div>
    	<div field="nation" width="70" align="center" headerAlign="center" >民族</div>   
    	 <div field="birthplace" width="100" align="center" headerAlign="center" >籍贯</div> 
    	<div field="liveplace" width="90" align="center" headerAlign="center" renderer="getCity">居住地省市</div> 
    	<div field="cardtype" width="90" align="center" headerAlign="center" renderer="cardtype">证件类型</div>
    	
    	<div field="emergency" width="90" align="center" headerAlign="center" >紧急联系人</div> 
    	<div field="emerelation" width="90" align="center" headerAlign="center" renderer="emerelation">与员工关系</div> 
    	<div field="emelink" width="95" align="center" headerAlign="center" >联系人电话</div> 
    	
    	<div field="party" width="80" align="center" headerAlign="center" renderer="party">政治面貌</div> 
    	<div field="msn" width="90" align="center" headerAlign="center" >微信号</div> 
    	<div field="pemail" width="140" align="center" headerAlign="center" >私人邮箱</div> 
    	
    	<div field="htel" width="130" align="center" headerAlign="center" >家庭电话</div> 
    	<div field="hzipcode" width="80" align="center" headerAlign="center" >家庭邮编</div> 
    	<div field="haddress" width="250" align="left" headerAlign="center" >家庭地址</div> 
    	
    	<div field="filesaveorg" width="140" align="center" headerAlign="center" >档案保管机构</div> 
    	<div field="filecity" width="90" align="center" headerAlign="center" renderer="getCity">档案所在省市</div> 
    	<div field="fileaddress" width="200" align="center" headerAlign="center" >档案所在地址</div>
    	
    	<div field="marristatus" width="100" align="center" headerAlign="center" renderer="getMarry">婚姻状况</div> 
    	<div field="resilimit" width="100" align="center" headerAlign="center" >居住证年限</div>
    	<div field="ishaveresi" width="100" align="center" headerAlign="center" renderer="getResi">居住证类型</div> 
    	<div field="resistartdate" width="100" align="center" headerAlign="center" >居住证开始时间</div> 
    	<div field="resienddate" width="100" align="center" headerAlign="center" >居住证结束时间</div>
    	
    	<div field="fundno" width="140" align="center" headerAlign="center" >公积金帐号</div> 
    	<div field="addfundno" width="140" align="center" headerAlign="center" >补充公积金帐号</div> 
    	<div field="residealorg" width="120" align="center" headerAlign="center" >办理单位名称</div>
    	
    	<div field="nonagename" width="100" align="center" headerAlign="center" >未成年子女姓名</div> 
    	<div field="nonagesex" width="100" align="center" headerAlign="center" renderer="gender">未成年子女性别</div> 
    	<div field="nonagebirth" width="120" align="center" headerAlign="center" >未成年子女出生年月</div>
    	
    	<div field="joblevel" width="80" align="center" headerAlign="center" renderer="getJoblevel">职位级别</div> 
    	<div field="degree" width="90" align="center" headerAlign="center" renderer="getEmptype">人员成本属性</div> 
    	<div field="innerrecname" width="90" align="center" headerAlign="center" >内部推荐人</div> 
    	<div field="otel" width="120" align="center" headerAlign="center" >办公电话</div> 
    	
    	<div field="ozipcode" width="100" align="center" headerAlign="center" >办公邮编</div> 
    	<div field="bankname" width="120" align="center" headerAlign="center" >开户行名称</div> 
    	<div field="bankacct" width="130" align="center" headerAlign="center" >开户行帐号</div> 
    	<div field="faxno" width="100" align="center" headerAlign="center" >传真号码</div> 
    	<div field="isjoinpcf" width="80" align="center" headerAlign="center"  renderer="getYN">PCF</div> 
    	<div field="pcfstartdate" width="100" align="center" headerAlign="center" >PCF开始日期</div> 
    	<div field="pcfenddate" width="100" align="center" headerAlign="center" >PCF结束日期</div> -->
    	<div field="pcfamount" width="100" align="center" headerAlign="center"  >PCF捐款金额</div>
        <div field="istakepc" width="80" align="center" headerAlign="center"  renderer="getYN">是否自带电脑</div>
    	<div field="takepcdate" width="110" align="center" headerAlign="center" >自带电脑开始日期</div> 
    	<div field="takepcenddate" width="110" align="center" headerAlign="center" >自带电脑结束日期</div>   
    	<div field="outto" width="120" align="left" headerAlign="center" >离职去向</div>
    	<div field="outmakeup" width="100" align="center" headerAlign="center" >离职补偿</div>
    	<div field="oaddress" width="200" align="left" headerAlign="center" >办公地址</div>
    	<div field="workexp" width="200" align="left" headerAlign="center" >工作描述</div>
    	<div field="workstartdate" width="110" align="center" headerAlign="center" >历史工作开始日期</div>
    	<div field="workenddate" width="110" align="center" headerAlign="center" >历史工作结束日期</div>
    	<div field="workcompanyname" width="100" align="left" headerAlign="center" >历史工作单位</div>
    	<div field="wworkduty" width="100" align="left" headerAlign="center" >历史工作职位</div>
    	<div field="tag" width="200" align="left" headerAlign="center"  renderer="dictTypeTag">员工标签</div>
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
	init();
	function init(){
		//机构权限初始化
		//code:对应功能编码，map：对于机构的查询条件
					
		var json = {"code":"queryAllPeople","map":{"property":"status","op":"=","value":"running"}};
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
						nui.getbyName("ctOrgEmpQry._expr[26]._op").setValue("=");
        				nui.getbyName("ctOrgEmpQry._expr[26]._value").setValue("");
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
	//查询功能列表
	function search(){
        var data = form.getData();
		grid.load(data);
		grid.sortBy("indate","desc");
	}
	
	function exportPeople(){
		if(!confirm("是否确认根据查询条件导出？")){
			return;
		}
		var data = form.getData();
		var json =  nui.encode(data);
		nui.ajax({
			url: "org.gocom.abframe.org.employee.EmpManager.exportAllpeople.biz.ext",
	        type: "post",
	        data: json,
	        cache: false,
	        contentType: 'text/json',
	        success: function (o) {
	     		nui.unmask();
	     		var filePath = o.downloadFile;
	        	var fileName = "员工全量信息";
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
	//人员详情展示
	function getEmpDetail(e){
		return "<a href='javascript:void(0)' onclick='checkDetail();' title='点击查看'>" + e.value + "</a>";
	}
    function checkDetail(){
    	var selectRow = grid.getSelected();
    	console
		var executeUrl = "<%=request.getContextPath() %>/abframe/org/newOrganization/empDetail.jsp?empid=" + selectRow.empid + "&empname=" + selectRow.empname;
		window.open(executeUrl);
    }
	//重置
	function reset(){
		var form = new nui.Form("#form1");
		form.reset();
        init();
	}
	
	//回车触发事件
    function onKeyEnter(){
    	search();
    }
	
	//人员状态
	function empstatus(e){
		return nui.getDictText('ABF_EMPSTATUS',e.value);
	}
	
	//类型，人员性质
	function getEmptype(e){
		return nui.getDictText('AME_EMPTYPE2',e.value);
	}
	//学历
	function getDegree(e){
		return nui.getDictText('DEGREE',e.value);
	}
	//员工属性
	function emptype(e){
		return nui.getDictText('EMP_TYPE',e.value);
	}
	
	//性别
	function gender(e){
		return nui.getDictText('ABF_GENDER',e.value);
	}
	
	//所属公司
	function company(e){
		return nui.getDictText('company',e.value);
	}
	
	//职位级别
	function joblevel(e){
		return nui.getDictText('AME_TECH',e.value);
	}
	//工作地
	function workplace(e){
		return nui.getDictText('AREA4CLRY',e.value);
	}
	//户口所在省市、居住地省市\档案所在省市
	function getCity(e){
		return nui.getDictText('MIS_AREA',e.value);
	}
	//证件类型
	function cardtype(e){
		return nui.getDictText('ABF_CARDTYPE',e.value);
	}
	//户籍性质
	function resiproperty(e){
		return nui.getDictText('ABF_BIRTHTYPE',e.value);
	}
	//与员工关系
	function emerelation(e){
		return nui.getDictText('EMP_RELATION',e.value);
	}
	//政治面貌
	function party(e){
		return nui.getDictText('ABF_PARTYVISAGE',e.value);
	}
	//婚姻状况
	function getMarry(e){
		return nui.getDictText('ABF_MARRITYPE',e.value);
	}
	//居住证类型
	function getResi(e){
		return nui.getDictText('AME_RESIDENCE',e.value);
	}
	//招聘渠道
	function getRecruit(e){
		return nui.getDictText('RECRUIT_WAY',e.value);
	}
	//招聘渠道
	function getEduverify(e){
		return nui.getDictText('EDUVERIFY',e.value);
	}
	//pcf
	function getYN(e){
		return nui.getDictText('MIS_YN',e.value);
	}
	//职位级别
	function getJoblevel(e){
		return nui.getDictText('AME_TECH',e.value);
	}
	//离职性质
	function getOuttype(e){
		return nui.getDictText('OUT_TYPE',e.value);
	}
	//离职原因
	function getOutreason(e){
		return nui.getDictText('OUT_REASON',e.value);
	}
	//职位类型
	function getPosition(e){
		return nui.getDictText('AME_POSITION_MEMO',e.value);
	}
	//职位级别
	function changeOrg(e){
		if(e.value==null || e.value==""){
			nui.get("tempcond1").setValue("=");
			nui.get("tempcond2").setValue("");
		}else{
			nui.get("tempcond1").setValue("in");
			nui.get("tempcond2").setValue("1");
		}
	}
	function getturnregularstatus(e){
		return nui.getDictText('VERI_RESULT',e.value);
	}
	function dictTypeTag(e) {
		return nui.getDictText('EMP_TAG',e.value);
	}
</script>
</html>
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
  - Author(s): 许青倩
  - Date: 2017-09-04 10:39:31
  - Description:
-->
<head>
<title>工时查询</title>
<meta http-equiv="content-type" content="text/html; charset=UTF-8" />
<script src="<%= request.getContextPath() %>/common/nui/nui.js" type="text/javascript"></script>
</head>
<body>
	<div style="width:100%;height:100%;padding:0px;margin:0px;" id="form1">
		<div style="width:100%;">
	        <div class="nui-toolbar" style="border-bottom:0;padding:0px;">
	            <table style="width:100%;">
	            	<tr>
	                    <td style="width:20%;">
	                       	工时查询
	                    </td>
	                </tr>
                 </table>           
	        </div>
	    </div>
		<div class="nui-toolbar" style="border-bottom:0;padding:0px;">
			<table style="width:100%;">
				<tr>
					<td align="right" width="90px"><span>财务年月：</span></td>
					<td>
						<input class="nui-monthpicker" format="yyyy-MM" id="finYM" style="width:100px" onvaluechanged="watchfinYM"/>
					</td>
					<td align="right" width="120px"><span>工时日期：</span></td>
	            	<td align="left" nowrap="nowrap">
					  	<input class="nui-datepicker" id="min1" name="criteria._expr[0]._min" style="width:100px"/>-<input class="nui-datepicker" id="max1" name="criteria._expr[0]._max" style="width:100px"/>
					    <input class="nui-hidden" name="criteria._expr[0]._property" value="laborDate"/>
					    <input class="nui-hidden" name="criteria._expr[0]._op" value="between"/>
					    <input class="nui-hidden" name="criteria._expr[0]._pattern" value="yyyy-MM-dd"/>
					</td>
					<td align="right" width="80px"><span>员工：</span></td>
	            	<td align="left">
					    <input name="criteria._expr[1]._value" class="mini-textboxlist" <%--onbuttonclick="showEmployee" --%>id="userid" allowInput="true" textField="EMPNAME" valueField="USERID" searchField="name" style="width:160px;" url="com.primeton.eos.ame_budget.budgetOrgManager.queryAllEmpByName.biz.ext"/>
					    <input class="nui-hidden" name="criteria._expr[1]._property" value="userId"/>
					    <input class="nui-hidden" name="criteria._expr[1]._op" value="in"/>
					</td>
					<td align="right" width="80px" nowrap="nowrap"><span>员工所属部门：</span></td>
					<td align="left">
					    <input name="criteria._expr[2]._value" class="nui-combobox"  id="orgseq" textField="orgname" valueField="orgseq" dataField = "orgs" shownullItem="true"
					     allowInput="true" style="width:160px;" />
					    <input class="nui-hidden" name="criteria._expr[2]._property" value="orgseq"/>
					    <input class="nui-hidden" name="criteria._expr[2]._op" value="like"/>
					    <input class="nui-hidden" name="criteria._expr[2]._likeRule" value="end"/>
					</td>
				</tr>
				<tr>
					<td align="right" width="95px"><span>客户简称：</span></td>
	            	<td align="left">
	            		<input class="nui-textbox" name="criteria._expr[3]._value" style="width:100px"/>
				        <input class="nui-hidden" name="criteria._expr[3]._property" value="custjc"/>
				        <input class="nui-hidden" name="criteria._expr[3]._op" value="like"/>
				        <input class="nui-hidden" name="criteria._expr[3]._likeRule" value="all"/>
				    </td>
			    	<td align="right" width="100px" nowrap="nowrap"><span>受益确认日期：</span></td>
	            	<td align="left" nowrap="nowrap">
					  	<input class="nui-datepicker" id="min" name="criteria._expr[8]._min" style="width:100px"/>-<input class="nui-datepicker" id="max" name="criteria._expr[8]._max" style="width:100px"/>
					    <input class="nui-hidden" name="criteria._expr[8]._property" value="benefconftime"/>
					    <input class="nui-hidden" name="criteria._expr[8]._op" value="between"/>
					    <input class="nui-hidden" name="criteria._expr[8]._pattern" value="yyyy-MM-dd HH:mm:ss"/>
					</td>
					<td align="right" width="95px" nowrap="nowrap"><span>项目编号：</span></td>
	            	<td align="left">
	            		<input class="nui-textbox" name="criteria._expr[5]._value" style="width:160px;"/>
				        <input class="nui-hidden" name="criteria._expr[5]._property" value="projectno"/>
				        <input class="nui-hidden" name="criteria._expr[5]._op" value="like"/>
				        <input class="nui-hidden" name="criteria._expr[5]._likeRule" value="all"/>
				    </td> 
				 	<td align="right" width="115px" nowrap="nowrap"><span>项目所属部门：</span></td>
				 	<td>
	            		<input class="nui-treeselect" name="criteria._expr[6]._value" expandOnLoad="0" url="com.bos.mp.common.SelectManage.queryAllOrg.biz.ext"
							textField="orgname" valueField="orgid" parentField="parentorgid" dataField="orgs" showTreeIcon="true" valueFromSelect="true"
								showNullItem="true" multiSelect="true" checkRecursive = "true" showFolderCheckBox="true" style="width: 160px;" id="dyassetnum1"/>
	            		<input class="nui-hidden" name="criteria._expr[6]._property" value="finUnitId"/>
	            		<input class="nui-hidden" name="criteria._expr[6]._op" value="in"/>
				    </td>
			    </tr>
			    <tr>
					<td align="right" style="width:100px;">工时类型：</td>
					<td style="width:200px;">    
                       <input property="editor" class="nui-combobox" name="criteria._expr[19]._value" id ="type19"  data="typedata1"  style="width:100px;" multiSelect="true" onvaluechanged="watchtype"/>
                       <input class="nui-hidden" name="criteria._expr[19]._property" value="laborType"/>
					   <input class="nui-hidden" name="criteria._expr[19]._op"  value="in"/>
                    </td>
					<td align="right" width="100px" nowrap="nowrap"><span>PMO确认日期：</span></td>
	            	<td align="left" nowrap="nowrap">
					  	<input class="nui-datepicker" id="min" name="criteria._expr[12]._min" style="width:100px"/>-<input class="nui-datepicker" id="max" name="criteria._expr[12]._max" style="width:100px"/>
					    <input class="nui-hidden" name="criteria._expr[12]._property" value="pmoconftime"/>
					    <input class="nui-hidden" name="criteria._expr[12]._op" value="between"/>
					    <input class="nui-hidden" name="criteria._expr[12]._pattern" value="yyyy-MM-dd HH:mm:ss"/>
					</td>
					<td align="right" width="95px" nowrap="nowrap"><span>项目名称：</span></td>
					<td align="left">
					    <input name="criteria._expr[4]._value" class="nui-textbox"  id="projectid" style="width:160px;" />
					    <input class="nui-hidden" name="criteria._expr[4]._property" value="projectName"/>
					    <input class="nui-hidden" name="criteria._expr[4]._op" value="like"/>
				        <input class="nui-hidden" name="criteria._expr[4]._likeRule" value="all"/>
					</td>
				    <td align="right" width="110px" nowrap="nowrap"><span>项目活动：</span></td>
					<td align="left">
					    <input name="criteria._expr[7]._value" class="nui-combobox"  id="tasklist"
					    url="com.primeton.rdmgr.labor.input.rdlabordetailbiz.getRdTasklists.biz.ext" textField="taskname" valueField="tasklist" dataField = "tasklists" shownullItem="true"
					    allowInput="true" style="width:160px;" />
					    <input class="nui-hidden" name="criteria._expr[7]._property" value="tasklist"/>
					    <input class="nui-hidden" name="criteria._expr[7]._op" value="="/>
					</td>
			    </tr>
			    <tr>
				    <td align="right" width="100px"><span>工时状态：</span></td>
	            	<td>
	            		<input class="nui-dictcombobox" name="criteria._expr[10]._value" dictTypeId="AME_LABOR_STATUS" multiSelect="true" style="width: 100px;"/>
	            		<input class="nui-hidden" name="criteria._expr[10]._property" value="status"/>
	            		<input class="nui-hidden" name="criteria._expr[10]._op" value="in"/>
				    </td>
					<td align="right" width="100px" nowrap="nowrap"><span>财务操作日期：</span></td>
	            	<td align="left" nowrap="nowrap">
					  	<input class="nui-datepicker" id="min" name="criteria._expr[14]._min" style="width:100px"/>-<input class="nui-datepicker" id="max" name="criteria._expr[14]._max" style="width:100px"/>
					    <input class="nui-hidden" name="criteria._expr[14]._property" value="finconftime"/>
					    <input class="nui-hidden" name="criteria._expr[14]._op" value="between"/>
					    <input class="nui-hidden" name="criteria._expr[14]._pattern" value="yyyy-MM-dd HH:mm:ss"/>
					    
				        <input class="nui-hidden" name="criteria._expr[15]._value" id = "orgids" value=""/>
				        <input class="nui-hidden" name="criteria._expr[15]._property" value="orgid"/>
					    <input class="nui-hidden" name="criteria._expr[15]._op" value="in"/>
				        
				        <input class="nui-hidden" name="criteria._expr[16]._value" id = "syorgids" value=""/>
				        <input class="nui-hidden" name="criteria._expr[16]._property" value="syorgid"/>
					    <input class="nui-hidden" name="criteria._expr[16]._op" value="in"/>
					</td>
					<td align="right" width="95px" nowrap="nowrap"><span>受益部门：</span></td>
	            	<td align="left">
	            		<input class="nui-combobox" name="criteria._expr[9]._value" style="width:160px" id="salesname" textField="orgname" valueField="orgseq" dataField = "orgs" 
	            		shownullItem="true"  allowInput="true"/>
				        <input class="nui-hidden" name="criteria._expr[9]._property" value="syorgseq"/>
				        <input class="nui-hidden" name="criteria._expr[9]._op" value="like"/>
				        
				        <input class="nui-hidden" name="criteria._expr[9]._likeRule" value="end"/>
				    </td>
					<td align="right" nowrap="nowrap"><span>工作内容：</span></td>
	            	<td align="left">
	            		<input class="nui-textbox" name="criteria._expr[11]._value" style="width:160px"/>
				        <input class="nui-hidden" name="criteria._expr[11]._property" value="repContent"/>
				        <input class="nui-hidden" name="criteria._expr[11]._op" value="like"/>
				        <input class="nui-hidden" name="criteria._expr[11]._likeRule" value="all"/>
				    </td>
				</tr>
				<tr>
				    <td align="right" width="100px" nowrap="nowrap"><span>计价是否空：</span></td>
	            	<td align="left">
					    <input class="nui-dictcombobox" dictTypeId="ABF_YESORNO" id="a" shownullItem="true" style="width:100px;" onvaluechanged="watchcost"/>
					    <input class="nui-hidden" name="criteria._expr[17]._property" value="cost"/>
					    <input class="nui-hidden" name="criteria._expr[17]._op" id="b" value="="/>
					</td>
					<td align="right" width="100px" nowrap="nowrap"><span>财务成本日期：</span></td>
	            	<td align="left"  nowrap="nowrap">
					  	<input class="nui-datepicker" id="min" name="criteria._expr[13]._min" style="width:100px"/>-<input class="nui-datepicker" id="max" name="criteria._expr[13]._max" style="width:100px"/>
					    <input class="nui-hidden" name="criteria._expr[13]._property" value="fincostdate"/>
					    <input class="nui-hidden" name="criteria._expr[13]._op" value="between"/>
					    <input class="nui-hidden" name="criteria._expr[13]._pattern" value="yyyy-MM-dd"/>
					</td> 
					<td align="right" width="100px"><span>人员等级：</span></td>
	            	<td align="left">
					    <input name="criteria._expr[18]._value" class="nui-buttonedit" id="grade" allowInput="false" onbuttonclick="selectGrade" oncloseclick="clearGrade" showClose="true"  style="width:160px;" />
					    <input class="nui-hidden" name="criteria._expr[18]._property" value="grade"/>
					    <input class="nui-hidden" name="criteria._expr[18]._op" value="="/>
					</td>
                    <td align="right" width="110px" nowrap="nowrap"><span>限定条件：</span></td>
					<td>
						<input property="editor" class="nui-combobox" id="term"  data="termdata" onvaluechanged="watchterm"/>
					</td> 
                </tr>
                <tr>
                	<td align="right" width="100px"><span>调休状态：</span></td>
	            	<td>
	            		<input class="nui-dictcombobox" name="criteria._expr[20]._value" dictTypeId="AME_LABOR_ISDAYSOFF" multiSelect="true" style="width: 100px;"/>
	            		<input class="nui-hidden" name="criteria._expr[20]._property" value="isdaysoff"/>
	            		<input class="nui-hidden" name="criteria._expr[20]._op" value="in"/>
				    </td>
			    	<td align="right" width="100px" nowrap="nowrap"><span>填报时间：</span></td>
	            	<td align="left" nowrap="nowrap">
					  	<input class="nui-datepicker" id="min" name="criteria._expr[22]._min" style="width:100px"/>-<input class="nui-datepicker" id="max" name="criteria._expr[22]._max" style="width:100px" />
					    <input class="nui-hidden" name="criteria._expr[22]._property" value="insertdate"/>
					    <input class="nui-hidden" name="criteria._expr[22]._op" value="between"/>
					    <input class="nui-hidden" name="criteria._expr[22]._pattern" value="yyyy-MM-dd HH:mm:ss"/>
					</td>
				    <td align="right" width="100px" nowrap="nowrap"><span>加班时间：</span></td>
	            	<td align="left"  nowrap="nowrap">
				    	<input class="nui-textbox"  name="criteria._expr[21]._min" style="width:75px"/>-<input class="nui-textbox" name="criteria._expr[21]._max" style="width:75px"/>
					    <input class="nui-hidden" name="criteria._expr[21]._property" value="otwHours"/>
					    <input class="nui-hidden" name="criteria._expr[21]._op" value="between"/>
                	</td>
                	<td align="center" colspan="2"  id="toolbars1">
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
	
	<div style="width:100%;">
        <div class="nui-toolbar" id="toolbars" style="border-bottom:0;padding:0px;">
            <table style="width:100%;">
                <tr>
                    <td style="width:10%;">
	                    <a class="nui-button" onclick="importData" iconCls="icon-upload" id="importData">工时导入</a>
                        <a class="nui-button" id="editBtn" iconCls="labor-edit" onclick="edit()">编辑</a>
                        <a class="nui-button" id="checkBtn" iconCls="labor-checklack" onclick="checkBtn()">工时检查</a>
                        <a class="nui-button" id="changeBtn" iconCls="labor-change" onclick="changeBtn()">工时变更</a>
                        <a class="nui-button" iconCls="labor-recount" id="recal" onclick="recal()">重新计算</a>    
                        <a class="nui-button" iconCls="labor-trans" id="transCostCal" onclick="transCostCal()">工时转换成本计算</a>
                        <a class="nui-button" id="confirm" iconCls="labor-syc" onclick="confirmRdLaborDetail('confirm')">受益确认</a>  
                        <a class="nui-button" id="PMOconfirm" iconCls="labor-pmo" onclick="confirmPF('pmo')">PMO审核确认</a> 
                        <a class="nui-button" id="FINconfirm" iconCls="labor-fin" onclick="confirmPF('fin')">财务审核确认</a>      
                    </td>
                </tr>
            </table>           
        </div>
    </div>
	
	<div id="datagrid1" class="nui-datagrid" style="width:100%;height:340px;" allowResize="true" pageSize="20"  showSummaryRow="true"
        url="com.primeton.rdmgr.labor.input.rdlabordetailbiz.queryRdLaborDetails.biz.ext" dataField="rdlabordetails" frozenStartColumn="0" frozenEndColumn="7" multiSelect="true"
    	ondrawcell="ondrawCsGatherFcGridcell" ondrawsummarycell="doCountSum" sizeList="[10,20,50,100,200,500]" onheadercellclick="search">
        <div property="columns">
	    	<div name="temp123" type="checkcolumn"></div>
        	<div field="laborDate" width="75" headerAlign="center" align="center" allowSort="true" renderer="onTitleRenderer">工时日期</div>    
            <div field="custjc" width="100" headerAlign="center" align="center" allowSort="true">客户简称</div> 
            <div field="projectName" width="100" headerAlign="center" allowSort="true" align="center">项目</div> 
            <div field="salesName" width="100" headerAlign="center" allowSort="true" align="center">受益部门</div>     
            <div field="yjbm" width="80" headerAlign="center" allowSort="true" align="center">受益一级部门</div>    
            <div field="ejbm" width="80" headerAlign="center" allowSort="true" align="center">受益二级部门</div>
            <div field="userName" width="60" headerAlign="center" allowSort="true" align="center">人员姓名</div>
            <div field="gradename" <%--renderer="getGrade"--%> width="60" headerAlign="center" allowSort="true" align="center">人员等级</div> 
            <div field="actHours" width="65" headerAlign="center" summaryType="sum" allowSort="true" align="center">总工时</div>   
            <div field="otwHours" width="65" headerAlign="center" summaryType="sum" allowSort="true" align="center">其中加班</div>
            <div field="standcost" width="80" headerAlign="center" summaryType="sum" allowSort="true" align="right">原始定额成本</div>
            <div field="cost" width="80" headerAlign="center" summaryType="sum" allowSort="true" align="right">定额结算成本</div>
            <div field="conratio" width="60" headerAlign="center" allowSort="true" align="right">转换系数</div>
            <div field="concost" width="80" headerAlign="center" summaryType="sum" allowSort="true" align="right">工时转换成本</div> 
            <div field="taskname" width="70" headerAlign="center" allowSort="true" align="center">项目活动</div>
            <div field="repContent" width="160" headerAlign="center" allowSort="true" align="left">工作内容</div>
            <div field="orgname" width="100" headerAlign="center" allowSort="true" align="center">人员所属部门</div> 
            <div field="useryjbm" width="100" headerAlign="center" allowSort="true" align="center">人员所属一级部门</div>  
            <div field="userejbm" width="100" headerAlign="center" allowSort="true" align="center">人员所属二级部门</div>   
            <div field="projectno" width="90" headerAlign="center" allowSort="true" align="center">项目代码</div>
            <div field="insertdate" width="125" headerAlign="center" allowSort="true" align="center" renderer = "ondealdate">填写时间</div> 
            <div field="status" width="85" headerAlign="center" allowSort="true" renderer="laborStatus" align="center">工时状态</div> 
        	<div field="benefconftime" width="125" headerAlign="center"  allowSort="true" align="center" renderer = "ondealdate">受益确认时间</div> 
            <div field="benefconfer" width="75" headerAlign="center" allowSort="true" align="center">受益确认人</div>
        	<div field="pmoconftime" width="125" headerAlign="center"  allowSort="true" align="center" renderer = "ondealdate">PMO确认时间</div>  
        	<div field="fincostdate" width="90" headerAlign="center"  allowSort="true" align="center">财务成本日期</div>  
        	<div field="finconftime" width="125" headerAlign="center"  allowSort="true" align="center" renderer = "ondealdate">财务操作时间</div> 
        	<div field="costremark" width="160" headerAlign="center" allowSort="true" align="center">变更说明</div> 
        	<div field="isdaysoff" width="80" headerAlign="center" allowSort="true" align="center" renderer="laborIsDaysOff">是否预留调休</div>
        </div>
    </div>
        
    <div id="win1" class="nui-window" title="财务确认成本日期" style="width:180px;height:120px;" 
	    showMaxButton="true" showCollapseButton="true" showShadow="true"
	    showToolbar="false" showFooter="true" showModal="false" allowResize="true" allowDrag="true">
    	<div style="padding:5px;">
    		<input  id="fincostdate" class="nui-datePicker" style="width: 100px;margin-left: 10px;"/>
    	</div>
	    <div property="footbar" style="padding:5px;margin-left: 10px;">
	        <input type='button' value='确定' onclick="sureDate('fin')" style="vertical-align: bottom;"/>
	        <input type='button' value='关闭' onclick="hideWindow()" style="vertical-align: bottom;margin-left: 20px"/>
	    </div>
	</div>
	
	<div id="win2" class="nui-window" title="工时变更" style="width:580px;height:270px;" 
	    showMaxButton="true" showCollapseButton="true" showShadow="true"
	    showToolbar="false" showFooter="true" showModal="false" allowResize="true" allowDrag="true">
    	<div style="padding:5px;" id="form2">
    		<table>
    			<tr>
    				<td align="right" style="width:80px;">变更类型：</td>
					<td style="width:200px;">    
                       <input property="editor" class="nui-radiobuttonlist"  id="type" name="changeRd.type"  data="typedata"  required="true"  style="width:100%;" />
                    </td>
    			<tr>
    			<tr>
                    <td align="right" style="width:80px;">项目名称：</td>
					<td style="width:200px;">    
                       <input property="editor" class="nui-buttonedit" id="projectId1" name="changeRd.projectid" onbuttonclick="selectProject" oncloseclick="clearproject" required="false"   showClose="true"  allowInput="false" style="width:100%;"/>
                    </td>
                    <td align="right" style="width:100px;">项目活动：</td>
					<td style="width:200px;">    
                       <input property="editor" class="nui-combobox" id="tasklist1" name="changeRd.tasklist" required="false"  allowInput="true" style="width:100%;" shownullItem="true"/>
                    </td>
    			</tr>
    			<tr>
    				<td align="right" style="width:80px;">客户：</td>
					<td style="width:200px;">    
                       <input property="editor" class="nui-buttonedit" id="custid" name="changeRd.custid" required="false" readOnly="readOnly"   showClose="true" onbuttonclick="onButtonEdit" oncloseclick="clearproject" allowInput="false" style="width:100%;"/>
                    </td>
                    <td align="right" style="width:100px;">受益部门：</td>
					<td style="width:200px;">    
                       <input property="editor" class="nui-combobox" id="salesid" name="changeRd.salesid" required="false" url="com.primeton.rdmgr.labor.labormgr.getAllOrgs.biz.ext" oncloseclick="clearproject" showClose="true" filterType="like" textField="orgname" valueField="orgid" dataField="allorgs" valueFromSelect="true" allowInput="true"   readOnly="readOnly"   allowInput="false"  style="width:100%;"/>
                    </td>
    			</tr>
    			<tr>
                    <td align="right" style="width:100px;">填报部门：</td>
					<td style="width:200px;" colspan="3">    
                       <input property="editor" class="nui-combobox" id="userOrgId" name="changeRd.userOrgId" required="false" url="com.primeton.rdmgr.labor.labormgr.getAllOrgs.biz.ext" oncloseclick="clearproject" showClose="true" filterType="like" textField="orgname" valueField="orgid" dataField="allorgs" valueFromSelect="true" allowInput="true"  style="width:39%;"/>
                    </td>
    			</tr>
    			<tr>
                    <td align="right" style="width:80px;">工时定额成本</td>
					<td style="width:200px;" align="left">    
                       <input property="editor" class="nui-combobox" id="operators" name="changeRd.operators" required="false"   allowInput="true"  style="width:55%;text-align:center;" emptyText="请选择操作符"/>
                       <input class="nui-textbox" id="operating" name="changeRd.operating" required="false"   showClose="true"  style="width:40%;text-align:center;" emptyText="请输入操作值" format="n2" onblur="changetransconf"/>
                    </td>
                    <td align="left" style="width:100px;"> = 结算定额成本</td>
    			</tr>
    			<tr>
    				<td align="right" style="width:80px;">变更说明：</td>
                    <td style="width:200px;" colspan="3">  
                    	<input class="nui-textarea" vtype="rangeLength:0,100" name="changeRd.costremark" id="costremark" required="true" style="width:95%;"/>
					</td>
    			</tr>
    		</table>
    	</div>
	    <div property="footbar" style="padding:5px;margin-left:250px;">
	        <input type='button' value='确定' onclick="change()" style="vertical-align: bottom;"/>
	        <input type='button' value='关闭' onclick="hideWindow2()" style="vertical-align: bottom;margin-left: 20px"/>
	    </div>
	</div>
</body>
<script type="text/javascript">
	nui.parse();
    var grid = nui.get("datagrid1");
    var form = new nui.Form("form1");
    var form2 = new nui.Form("form2"); 
	var userid='';//登陆账号
	var username='';//登陆人名
	var termdata = [{id: "orgid",text: "限定填报部门"},
	               {id: "syorgid",text: "限定受益部门"}];//权限限定条件
    var typedata = [{id: "Direct",text: "直接变更"},
	               {id: "WriteOff",text: "冲销变更"}];//变更类型---工时变更用
   	var typedata1 = [{id: "Pro",text: "项目"},
		               {id: "nonPro",text: "非立项"},
		               {id: "orgLevel",text: "组织级"}];//工时类型
   	var operatorsdata = [{id: "*",text: "*"},
   						{id: "/",text: "/"},
   						{id: "+",text: "+"},
   						{id: "-",text: "-"},
   						{id: "=",text: "="}];//变更操作符---工时变更用
	var isSYBAssistant = false;	//以事业部助理身份登陆将默认限定填报部门，有编辑权限
	var isPMO = false;//以pmo身份登陆，有编辑、工时变更、重新计算、公式转换成本计算、受益确认和pmo确认的权限
	var isFin = false ;//以财务身份登陆，有财务确认的权限
	
	//页面初始化---控制权限
	init();
	function init(){
		<% 
    		UserObject user = (UserObject)session.getAttribute("userObject");
    		String nowuserid = user.getUserId();
    		String nowusername = user.getUserName();
    		Map attr = user.getAttributes();
    		Boolean rolesroleids = false;	//是否是事业部助理
    		Boolean isPMO = false; //是否PMO
    		Boolean isFin = false; //是否财务
    		//角色
    		DataObject[] roles = (DataObject[])attr.get("roles");
			for(int i=0;i < roles.length;i++){
				if(roles[i].getString("roleid").equals("assistant") || 
					roles[i].getString("roleid").equals("HDJRZL") ){
					rolesroleids = true;
				}
				if(roles[i].getString("roleid").equals("PMO")){
					isPMO = true;
				}
			   	if(roles[i].getString("roleid").equals("finance")){
					isFin = true;
				}
			}
    	%>
    	userid = "<%=nowuserid %>";
    	username = "<%=nowusername %>"
    	var rolesroleids = "<%=rolesroleids %>";
    	var ispmos="<%=isPMO %>";
    	var isFins = "<%=isFin %>";
    	
    	if(rolesroleids == "true"){
    		isSYBAssistant = true;//助理按照受益人管理权限 
    	}
    	if(ispmos == "true"){
    		isPMO=true;
    	}
    	if(isFins == "true"){
    		isFin=isFins;
    	}
    	if(isSYBAssistant == true){
    		nui.get("term").setValue("orgid");
    		changeterm("orgid");
    	}else{
    		nui.get("term").setValue("syorgid");
    		changeterm("syorgid");
    	}
    	/*if(isSYBAssistant == false &&　isPMO==false){
    		nui.get("editBtn").disable();
    	}else{
       		nui.get("editBtn").enable();
    	}
    	if(isPMO==false){
    		nui.get("PMOconfirm").disable();
    		nui.get("confirm").disable();
    		nui.get("changeBtn").disable();
    		nui.get("recal").disable();
    		nui.get("transCostCal").disable();
    		nui.get("importData").disable();
    	}else{
    		nui.get("importData").enable();
    		nui.get("PMOconfirm").enable();
    		nui.get("confirm").enable();
    		nui.get("changeBtn").enable();
    		nui.get("recal").enable();
    		nui.get("transCostCal").enable();
    	}
    	if(isFin==false){
    		nui.get("FINconfirm").disable();
    	}else{
    		nui.get("FINconfirm").enable();
    	}*/
    	
    	//按钮权限的控制
    	getOpeatorButtonAuth("editBtn,PMOconfirm,confirm,changeBtn,recal,transCostCal,importData,FINconfirm");//操作按钮权限初始化
		
    	
		//设置动态下拉框
		nui.get("term").setData(termdata);
		nui.get("type").setData(typedata);
		nui.get("type19").setData(typedata1);
		nui.get("operators").setData(operatorsdata);
		//设置动态下拉框
		
		//根据项目动态生成项目活动下拉框，如无项目全部展示
		tasklistdata(null);
		
		//查询
		var form = new nui.Form("#form1"); 
	    var data = form.getData(); //获取表单JS对象数据
		grid.load(data); //datagrid加载数据
	}
	
	//查询
	function search(e) {	    		
		var form = new nui.Form("#form1");
		var data = form.getData(); //获取表单JS对象数据
		if(e){
			if(e.column.name=='temp123'){
				return;
			}
		}
		
		//日期精确到时分秒
		if(data.criteria._expr[22]._max != null && data.criteria._expr[22]._max !=''){	
			data.criteria._expr[22]._max=data.criteria._expr[22]._max.substring(0,10) + " 23:59:59";
		}
		if(data.criteria._expr[14]._max != null && data.criteria._expr[14]._max !=''){
			data.criteria._expr[14]._max=data.criteria._expr[14]._max.substring(0,10) + " 23:59:59";
		}
		if(data.criteria._expr[12]._max != null && data.criteria._expr[12]._max !=''){
			data.criteria._expr[12]._max=data.criteria._expr[12]._max.substring(0,10) + " 23:59:59";
		}
		if(data.criteria._expr[8]._max != null && data.criteria._expr[8]._max !=''){
			data.criteria._expr[8]._max=data.criteria._expr[8]._max.substring(0,10) + " 23:59:59";
		}
	  	grid.load(data); //datagrid加载数据
	}
	
	//重置
	function reset(){
		var form = new nui.Form("#form1");
		form.reset();
		authorgs = null;
		authorgids = null;
		allorgs = null;
		init();
	}
	
	
	/**
	 *批量导入工时
	 */
	function importData(){
		nui.open({
            url: "<%=request.getContextPath() %>/labor/queryRdLaborDetail/importRdLaborExcel.jsp",
            title: "工时导入", 
			width: 700,
            height: 210,
            allowDrag:true,
            ondestroy: function (action) {
            	if(action=="ok"){
            		grid.reload();
            	}
            }
        });
	}  
	//项目查询按钮
	function selectProject(){
		var btnEdit = this;
		var projectid='';
	    nui.open({
	        url:"<%=request.getContextPath() %>/ame_common/SelectProject.jsp",
	                title: "选择项目名称",
	                width: 750,
	                height: 480,
	        		async :false,
	                ondestroy: function (action) {
	                    if (action == "ok") {
	                        var iframe = this.getIFrameEl();
	                        var data = iframe.contentWindow.GetData();
	                        data = nui.clone(data);    //必须
	                        if (data) {
	                        	//alert(nui.encode(data));
	                            btnEdit.setValue(data.projectId);
	                            btnEdit.setText(data.projectName);
	                            projectid = data.projectId;
	                            if(btnEdit.getId() == "projectId1"){
	                            	//项目活动
						    		tasklistdata(projectid);
			                        //受益部门
			                        if(projectid == '1'){//组织级项目得客户必须为普元，受益部门可另选
			                        	//组织级
			                        	nui.get("custid").setReadOnly(true);
			                        	nui.get("salesid").setReadOnly(false);
			                        	//客户
					                	nui.get("custid").setValue("1926");
		    							nui.get("custid").setText("普元信息技术股份有限公司");
		    							//受益部门
					                	nui.get("salesid").setValue('');
		    							nui.get("salesid").setText('');
			                        	
			                        }else if (projectid == '2'){//非立项项目客户和受益部门均可另选
			                        	//非立项
			                        	nui.get("custid").setReadOnly(false);
			                        	nui.get("salesid").setReadOnly(false);
			                        	//客户
					                	nui.get("custid").setValue('');
		    							nui.get("custid").setText('');
		    							//受益部门
					                	nui.get("salesid").setValue('');
		    							nui.get("salesid").setText('');
			                        }else {//立项项目受益部门和客户均为项目的受益部门和客户
			                        	//立项
			                        	nui.get("custid").setReadOnly(true);
			                        	nui.get("salesid").setReadOnly(true);
				    					nui.get("salesid").setValue(data.finUnitId);
				    					nui.get("salesid").setText(data.orgname);
				    					//客户
					                	nui.get("custid").setValue(data.custid);
		    							nui.get("custid").setText(data.custname);
			                        }
			                        
						    	}
	                        }
                    	}
	
                	}
            	});
    }
    
    //项目选框点叉号调用---清除
	function clearproject(){
		var btnEdit = this;
		btnEdit.setValue("");
		btnEdit.setText("");
		if(btnEdit.getId() == "projectId1"){
        	//项目活动
    		tasklistdata(null);
            //受益部门
			nui.get("salesid").setValue('');
			nui.get("salesid").setText('');
			//客户
        	nui.get("custid").setValue('');
			nui.get("custid").setText('');
    	}
	}
	
	//工时记录导出
	function exportRdLabors(){
    	nui.confirm("确认导出工时记录？", "确定？",
        function (action) {
        	if(action=='ok'){
        		var json = form.getData();	
        		
        		//日期细化到时分秒
				if(json.criteria._expr[22]._max != null && json.criteria._expr[22]._max !=''){	
					json.criteria._expr[22]._max=json.criteria._expr[22]._max.substring(0,10) + " 23:59:59";
				}
				if(json.criteria._expr[14]._max != null && json.criteria._expr[14]._max !=''){
					json.criteria._expr[14]._max=json.criteria._expr[14]._max.substring(0,10) + " 23:59:59";
				}
				if(json.criteria._expr[12]._max != null && json.criteria._expr[12]._max !=''){
					json.criteria._expr[12]._max=json.criteria._expr[12]._max.substring(0,10) + " 23:59:59";
				}
				if(json.criteria._expr[8]._max != null && json.criteria._expr[8]._max !=''){
					json.criteria._expr[8]._max=json.criteria._expr[8]._max.substring(0,10) + " 23:59:59";
				}
				
				grid.loading("操作中，请稍后......");
				nui.ajax({
	    			url: "com.primeton.rdmgr.labor.queryRdLaborDetail.exportRdLaborDetail.biz.ext",
			        type: "post",
			        data: json,
			        cache: false,
			        contentType: 'text/json',
			        success: function (o) {
			     		grid.unmask();
			     		var filePath = o.downloadFile;
			        	var fileName = "工时记录";
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
	
	//点击日期查看工时详情的链接
	function onTitleRenderer(e) {
		return "<a href='javascript:void(0)' onclick='doView("+e.record.laborDetailId+");' title='点击查看'>" + e.value + "</a>";
	}
	function doView(laborDetailId){
		var executeUrl = "<%=request.getContextPath() %>/labor/queryRdLaborDetail/checkRdLaborDetail.jsp?laborDetailId=" + laborDetailId;
		window.open(executeUrl, "工时查看", "height=600,width=1000,top=0,left=0,toolbar=no,menubar=no,scrollbars=yes,resizable=yes,location=no,status=no");
	}
	
	//编辑工时
	function edit(){
		var rdLaborDetail=grid.getSelecteds();
		if(rdLaborDetail.length>1 || rdLaborDetail.length<=0){
			nui.alert("请选中一条工时信息进行编辑操作！");
			return;
		}
		nui.open({
  			// 编辑界面  
            url: "<%=request.getContextPath() %>/labor/queryRdLaborDetail/editRdLaborDetail.jsp?laborDetailId="+rdLaborDetail[0].laborDetailId ,
            title: "工时编辑 ",
            width: 1098,
            height: 480,
            onload: function () {
              var iframe = this.getIFrameEl();
              // <!--var data = {action: "edit", emplevelid: row.emplevelid };-->
              var data = {action: "edit", laborDetailId: rdLaborDetail[0].laborDetailId };
              //iframe.contentWindow.SetData(data);
            },
            ondestroy: function (action) {
            	if(action == "ok"){
		            grid.reload();
            	}
       	 	}
		});
        
	}
	
	//疑问工时背景标红
	function ondrawCsGatherFcGridcell(e){
		var record = e.record,
	        column = e.column,
	        field = e.field,
	        value = e.value;
        if(record.status == '2'){
        	e.rowStyle = "background-color: #FF99CC";
        }
	}
	
	//改变查询的限定条件
	function watchterm(){
		var ter = nui.get("term").getValue();
		changeterm(ter);
	}
	
	//控制权限
	var authorgs;//有权的机构，定义为全局变量，只查一遍
	var authorgids;//有权的机构，定义为全局变量，只查一遍
	var allorgs;//所有的机构，定义为全局变量，只查一遍
	function changeterm(e){
		//根据限定条件来调整权限控制
		var name;
		var name1;
		var ids;
		var ids1;
		if(e=="orgid"){
			name = "orgseq";
			name1 = "salesname";
			ids="orgids";
			ids1="syorgids";
		}else{
			name = "salesname";
			name1 = "orgseq";
			ids="syorgids";
			ids1="orgids";
		}
		
		if(authorgs){
			nui.get(name).setData(authorgs);
			nui.get(ids).setValue(authorgids);
			nui.get(name1).setData(allorgs);
    		nui.get(ids1).setValue("");
		}else{
			var json = {"code":"LABOR_QRY","map":{"property":"status","op":"=","value":"running"}};
			nui.ajax({
				url:"com.primeton.eos.ame_auth.ame_auth.getownorg1.biz.ext",
				data:json,
				type:'POST',
                async:false,
				contentType:'text/json',
				success:function(text){
					if(text.orgs){
						if(text.orgs.length==0){
							nui.get("userid").setValue(userid);
							nui.get("userid").setText(username);
							nui.get("userid").setReadOnly(true);
							nui.ajax({
					            url: "com.bos.mp.common.SelectManage.queryAllOrg.biz.ext",
					            type: "post",
					            data: '',
					            cache: false,
               					async:false,
					            contentType: 'text/json',
					            success: function (text) {
						    		allorgs = text.orgs;
						    		nui.get(name1).setData(allorgs);
						    		nui.get(ids1).setValue("");
						    		authorgs=text.orgs;
						    		authorgids = text.orgids;
						    		nui.get(name).setData(authorgs);
									nui.get(ids).setValue("");
					    		}
					    	});
					    	return;
						}
						authorgs=text.orgs;
			    		authorgids = text.orgids;
			    		var isall;
						for(var i=0;i<text.orgs.length;i++){
							if(text.orgs[i].orgid == "1"){
								isall = "1";
								break;
							}
						}
						//如果拥有全公司的权限就取消部门限制
						if(isall == "1"){
							nui.get(ids).setValue("");
							authorgids = "";
						}else{
							nui.get(ids).setValue(authorgids);
						}
			    		nui.get(name).setData(authorgs);
						
					}else{
						nui.get("userid").setValue(userid);
						nui.get("userid").setText(username);
						nui.get("userid").setReadOnly(true);
						nui.ajax({
				            url: "com.bos.mp.common.SelectManage.queryAllOrg.biz.ext",
				            type: "post",
				            data: '',
				            cache: false,
                			async:false,
				            contentType: 'text/json',
				            success: function (text) {
					    		allorgs = text.orgs;
					    		nui.get(name1).setData(allorgs);
					    		nui.get(ids1).setValue("");
					    		authorgids = text.orgids;
					    		nui.get(name).setData(authorgs);
								nui.get(ids).setValue("");
				    		}
				    	});
					}
				}
			});
	    	nui.ajax({
	            url: "com.bos.mp.common.SelectManage.queryAllOrg.biz.ext",
	            type: "post",
	            data: '',
	            cache: false,
                async:false,
	            contentType: 'text/json',
	            success: function (text) {
		    		allorgs = text.orgs;
		    		nui.get(name1).setData(allorgs);
		    		nui.get(ids1).setValue("");
	    		}
	    	});
		}
	}
	
	//财务成本确认日期编辑框--财务确认需要选择财务成本确认日期
    function showAtPos() {
        var win = nui.get("win1");
        win.showAtPos("center", "middle");
    }
    function hideWindow() {
        var win = nui.get("win1");
        win.hide();
    }
    
	//工时变更
	function changeBtn(){
		showchangeBtn();
	}
	
    //工时变更编辑框
    function showchangeBtn() {
        var win = nui.get("win2");
        win.showAtPos("center", "middle");
    }
    function hideWindow2() {//关闭工时变更编辑框需要清空编辑框内已填写的数据
    	nui.get("type").setValue(null);
    	nui.get("projectId1").setValue(null);
    	nui.get("projectId1").setText(null);
    	nui.get("tasklist1").setValue(null);
    	nui.get("custid").setValue(null);
    	nui.get("custid").setText(null);
    	nui.get("salesid").setValue(null);
    	nui.get("operators").setValue(null);
    	nui.get("operating").setValue(null);
    	nui.get("costremark").setValue(null);
    	nui.get("userOrgId").setValue(null);
        var win = nui.get("win2");
        win.hide();
    }
    
    //工时确认编辑框点确认
   	function change(){
   		var data = form2.getData(); //获取表单JS对象数据
   		var data1 = form.getData(); //获取表单JS对象数据
		if(data1.criteria._expr[22]._max != null && data1.criteria._expr[22]._max !=''){	
			data1.criteria._expr[22]._max=data1.criteria._expr[22]._max.substring(0,10) + " 23:59:59";
		}
		if(data1.criteria._expr[14]._max != null && data1.criteria._expr[14]._max !=''){
			data1.criteria._expr[14]._max=data1.criteria._expr[14]._max.substring(0,10) + " 23:59:59";
		}
		if(data1.criteria._expr[12]._max != null && data1.criteria._expr[12]._max !=''){
			data1.criteria._expr[12]._max=data1.criteria._expr[12]._max.substring(0,10) + " 23:59:59";
		}
		if(data1.criteria._expr[8]._max != null && data1.criteria._expr[8]._max !=''){
			data1.criteria._expr[8]._max=data1.criteria._expr[8]._max.substring(0,10) + " 23:59:59";
		}
   		if(data.changeRd.operators == '/' && data.changeRd.operating == 0){
   			nui.alert("被除数不能为0！请修改操作符和操作数。");
   			return;
   		}
   		var message = '';
   		data.criteria = data1.criteria;
   		if(form2.validate()){
   			if(data.changeRd.type == "Direct"){
   				message = "直接变更";
   			}else{
   				message = "冲销变更";
   			}
   			nui.confirm("本操作将"+message+"符合查询条件的所有工时记录，请确认是否操作？", "确定？",function (action) {
   				if (action == "ok"){
   					grid.loading("操作中，请稍后......");
					nui.ajax({
			            type:'get',
			            data:data,
			            cache: false,
			            showModal: false,
			            async :false,
			            contentType: 'text/json',
			            url:'com.primeton.rdmgr.labor.queryRdLaborDetail.changeRdLaborDetail.biz.ext',
			            success:function(result){
                 			grid.unmask ( );
			            	if(result.exception == null){
			                	hideWindow2();
			                    nui.alert("变更成功！本次操作"+message+"了"+result.total+"条数据。","系统提示",function(){
			                        grid.reload();
			                    });
			                }else{	
			                	hideWindow2();
			                    nui.alert("变更失败！请联系信息技术部人员。")
			                }
			            },
			            error:function(jqXHR, textStatus, errorThrown){
                 			grid.unmask ( );
			                nui.alert("error:" + jqXHR.responseText);
			            }
	            	})
            	}
   			})
   		}
   	}
   	
   	//工时变更操作数必须为数字
   	function changetransconf(){
   		var operating = nui.get("operating").getValue();
   		if(isNaN(operating)){
    		nui.alert("操作值请输入数字！");
    		nui.get("operating").setValue(0);
    		return;
    	}
    	if(operating == null || operating == ""){
    		operating = 0;
    		nui.get("sybjtcb").setValue(0);
    	}
   	}
   	
   	//工时变更客户选项
   	function onButtonEdit(){
   		var btnEdit = this;
        nui.open({
            url:"<%=request.getContextPath() %>/contract/contract/MisCustinfo_lookup.jsp",
            title: "选择开票单位",
            width: 850,
            height: 410,
            ondestroy: function (action) {
                if (action == "ok") {
                	var iframe = this.getIFrameEl();
                    var data = iframe.contentWindow.GetData();
                    data = nui.clone(data);	//72100-中国联合网络通信有限公司
                    nui.get("custid").setValue(data.id);
                    nui.get("custid").setText(data.text);
                }
            }
        });
   	}
    
	//PMO和财务确认
	function confirmPF(e){
		var status = nui.getbyName("criteria._expr[10]._value").getValue();
		if(status == null || status== ''){
			nui.alert("查询条件里的工时状态必选！");
			return;
		}
		if(status != '1' && e == 'pmo'){
			nui.alert("PMO审核确认只能操作工时状态为'受益部门确认'的数据！");
			return;
		}
		if(status != '3' && e == 'fin'){
			nui.alert("财务审核确认只能操作工时状态为'PMO审核确认'的数据！");
			return;
		}
		if(e == 'fin'){
			nui.get("fincostdate").setValue(new Date());
			showAtPos();
			return;
		}
		sureDate(e);
	}
	
	//财务和pmo确认
	function sureDate(e){
		var form = new nui.Form("#form1");
		var data = form.getData(); //获取表单JS对象数据
		if(data.criteria._expr[22]._max != null && data.criteria._expr[22]._max !=''){	
			data.criteria._expr[22]._max=data.criteria._expr[22]._max.substring(0,10) + " 23:59:59";
		}
		if(data.criteria._expr[14]._max != null && data.criteria._expr[14]._max !=''){
			data.criteria._expr[14]._max=data.criteria._expr[14]._max.substring(0,10) + " 23:59:59";
		}
		if(data.criteria._expr[12]._max != null && data.criteria._expr[12]._max !=''){
			data.criteria._expr[12]._max=data.criteria._expr[12]._max.substring(0,10) + " 23:59:59";
		}
		if(data.criteria._expr[8]._max != null && data.criteria._expr[8]._max !=''){
			data.criteria._expr[8]._max=data.criteria._expr[8]._max.substring(0,10) + " 23:59:59";
		}
		data.type = e;
		if(e == 'fin'){
			var fincostdate = nui.get("fincostdate").getValue();
			if(fincostdate == null || fincostdate == ''){
				nui.alert("财务确认成本日期必填！");
				return;
			}
			data.fincostdate = nui.get("fincostdate").getValue();
		}
		nui.confirm("本操作将确认符合查询条件的所有工时记录，请确认是否操作。", "确定？",function (action) {
			if (action == "ok"){
				grid.loading("操作中，请稍后......");
				nui.ajax({
		            type:'get',
		            data:data,
		            cache: false,
		            showModal: false,
		            async :false,
		            contentType: 'text/json',
		            url:'com.primeton.rdmgr.labor.queryRdLaborDetail.confirmRdLaborDetails.biz.ext',
		            success:function(result){
                 		grid.unmask ( );
		                if(result.exception == null){
		                	hideWindow();
		                    nui.alert("确认成功！本次操作确认了"+result.total+"条数据。","系统提示",function(){
		                        grid.reload();
		                    });
		                }else{	
		                	hideWindow();
		                    nui.alert("确认失败！请联系信息技术部人员。")
		                }
		                
		            },
		            error:function(jqXHR, textStatus, errorThrown){
                 		grid.unmask ( );
		                nui.alert("error:" + jqXHR.responseText);
		            }
		        })
			}
		});
		
	}
	
	//设置合计行样式---数字靠右等
	function doCountSum(e){
		if (e.field == "actHours") {
            e.cellHtml = "<div align='center'><b>" + e.cellHtml + "</b></div>";
        }
        if (e.field == "otwHours") {
            e.cellHtml = "<div align='center'><b>" + e.cellHtml + "</b></div>";
        }
        if (e.field == "cost") {
            e.cellHtml = "<div align='right'><b>" + e.cellHtml + "</b></div>";
        }
        if (e.field == "concost") {
            e.cellHtml = "<div align='right'><b>" + e.cellHtml + "</b></div>";
        }
        if (e.field == "standcost") {
            e.cellHtml = "<div align='right'><b>" + e.cellHtml + "</b></div>";
        }
	}
	
	//财务年月控制---根据系统数据得到财务年月的日期区间
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
	
   	//项目活动下拉框---根据projectid动态生成对应的项目活动下拉框，projectid为null查出全部
   	function tasklistdata(projectid){
   		//项目活动
   		var tasklist = [];
   		if(projectid != null){
   			var json = ({"projectid":projectid});
            $.ajax({
                type:'get',
                data:json,
                async:false,
                url:'com.primeton.eos.ame_common.wx_worktime.querytasklist.biz.ext',
                success:function(result){
                    for(var i = 0;i<result.tasklists.length;i++){
                        tasklist.push({id:result.tasklists[i].tasklist,text:result.tasklists[i].taskname});
                    }
                }
            })
   		}else{
   			var json = ({"project":[]});
   			$.ajax({
                type:'get',
                data:json,
                async:false,
                url:'com.primeton.rdmgr.labor.input.rdlabordetailbiz.getRdTasklists.biz.ext',
                success:function(result){
                    for(var i = 0;i<result.tasklists.length;i++){
                        tasklist.push({id:result.tasklists[i].tasklist,text:result.tasklists[i].taskname});
                    }
                }
            })
   		}
        nui.get("tasklist1").setData(tasklist);
   	}
   	
   	//重新计算
   	function recal() {
    	var a=grid.getData();
    	if(a.length==0){
    		alert("工时记录为空!");
    		return;
    	}
        if (confirm("本次操作将重新计算符合查询条件的所有非项目激励工作项的工时,是否重新计算?")) {
        	nui.get("recal").disable();
        	grid.loading("操作中，请稍后......");
            var o = form.getData();
            if(o.criteria._expr[22]._max != null && o.criteria._expr[22]._max !=''){	
				o.criteria._expr[22]._max=o.criteria._expr[22]._max.substring(0,10) + " 23:59:59";
			}
			if(o.criteria._expr[14]._max != null && o.criteria._expr[14]._max !=''){
				o.criteria._expr[14]._max=o.criteria._expr[14]._max.substring(0,10) + " 23:59:59";
			}
			if(o.criteria._expr[12]._max != null && o.criteria._expr[12]._max !=''){
				o.criteria._expr[12]._max=o.criteria._expr[12]._max.substring(0,10) + " 23:59:59";
			}
			if(o.criteria._expr[8]._max != null && o.criteria._expr[8]._max !=''){
				o.criteria._expr[8]._max=o.criteria._expr[8]._max.substring(0,10) + " 23:59:59";
			}
            var json = nui.encode(o);
   			grid.loading("操作中，请稍后......");
        	nui.ajax({
        		url: "com.primeton.rdmgr.labor.labormgr.laborCal.biz.ext",
                data: json,
                type: 'POST',
                cache: false,
                contentType: 'text/json',
                success: function (o) {
                   grid.unmask ( );
                   grid.reload();
                   alert("工时成本数据重新计算成功!");
                   nui.get("recal").enable();
                },
                error: function (jqXHR, textStatus, errorThrown) {
                 	grid.unmask ( );
                    alert(jqXHR.responseText);
                }
        	});
        	//问题: 是否需要同步进行工时成本转换计算 ? 
        	
    	}
    }
    
    //工时转换成本计算
    function transCostCal(){
    	var a=grid.getData();
    	if(a.length==0){
    		alert("工时记录为空!");
    		return;
    	}
        if (confirm("本次操作将重新计算符合查询条件的除了项目活动为项目激励的所有工时转换成本,请确认本次操作。")) {
        	nui.get("transCostCal").disable();
        	grid.loading("操作中，请稍后......");
            var o = form.getData();
            if(o.criteria._expr[22]._max != null && o.criteria._expr[22]._max !=''){	
				o.criteria._expr[22]._max=o.criteria._expr[22]._max.substring(0,10) + " 23:59:59";
			}
			if(o.criteria._expr[14]._max != null && o.criteria._expr[14]._max !=''){
				o.criteria._expr[14]._max=o.criteria._expr[14]._max.substring(0,10) + " 23:59:59";
			}
			if(o.criteria._expr[12]._max != null && o.criteria._expr[12]._max !=''){
				o.criteria._expr[12]._max=o.criteria._expr[12]._max.substring(0,10) + " 23:59:59";
			}
			if(o.criteria._expr[8]._max != null && o.criteria._expr[8]._max !=''){
				o.criteria._expr[8]._max=o.criteria._expr[8]._max.substring(0,10) + " 23:59:59";
			}
            var json = nui.encode(o);
            grid.loading("操作中，请稍后......");
        	nui.ajax({
        		url: "com.primeton.rdmgr.labor.labormgr.rdLaborDetails.biz.ext",
                data: json,
                type: 'POST',
                cache: false,
                contentType: 'text/json',
                success: function (o) {
                   grid.unmask ( );
                   grid.reload();
                   alert("工时转换成本计算成功!");
                   nui.get("transCostCal").enable();
                },
                error: function (jqXHR, textStatus, errorThrown) {
                	grid.unmask ( );
                    alert(jqXHR.responseText);
                    CloseWindow();
                }
        	});
    	}
    }
    
    //工时计价
    function watchcost(){
    	var a=nui.get("a").getValue();
		if(a=="y"){
			nui.get("b").setValue("null");
		}else if(a=="n"){
			nui.get("b").setValue("notnull");
		}else{
			nui.get("b").setValue("=")
		}
    }
    
    //日期格式化---时分秒的格式化
    function ondealdate(e){
		if(e.value){
		  var now  = e.value;
		  var   year=now.getFullYear();     
          var   month=now.getMonth()+1;
          var   day=now.getDate();     
          var   hours=now.getHours();     
          var   minutes=now.getMinutes();     
          var   seconds=now.getSeconds();
          var curDateTime = year;
          if(month>9){
			curDateTime = curDateTime +"-" + month;
		  }else{
		  	curDateTime = curDateTime+"-" + "0" + month;
		  }
    	if(day>9){
			curDateTime = curDateTime+"-" + day;
		}else{
			curDateTime = curDateTime+"-" + "0" + day;
			}
		if(hours>9){
			curDateTime = curDateTime+"   " + hours;
		}else{
			curDateTime = curDateTime+"   " + "0" + hours;
			}
		if(minutes>9){
			curDateTime = curDateTime+":" + minutes;
		}else{
			curDateTime = curDateTime+":" + "0" + minutes;
			}
		if(seconds>9){
			curDateTime = curDateTime+":" + seconds;
		}else{
			curDateTime = curDateTime+":" + "0" + seconds;
			}     
          return   curDateTime;     
		}
	}
	
	//受益确认
	function confirmRdLaborDetail(e){
		var rdLaborDetails=grid.getSelecteds();
		var status = ''
		if(e == "confirm"){
			status = '1';
		}else if(e == "doubt"){
			status = '2';
		}else {
			nui.alert("方法调用错误，请联系管理员！");
			return;
		}
		if(rdLaborDetails.length<1 && e == "doubt"){
			nui.alert("进行受益疑问时,请选择至少一条的工时信息执行本操作！");
			return;
		}
		var status1 = nui.getbyName("criteria._expr[10]._value").getValue();
		if((status1 == null || status1== '') && e == "confirm"){
			nui.alert("进行受益确认操作时，查询条件里的工时状态必选！");
			return;
		}
		if(status1!= '0' && status1!= '2' && status1!= '0,2' && status1!= '2,0' && e == "confirm"){
			nui.alert("只能对状态为新增和受益部门疑问的工时数据进行受益确认操作！");
			return;
		}
		if(e == "doubt"){
			for(var i = 0;i < rdLaborDetails.length; i++){
				if((rdLaborDetails[i].status == '0' || rdLaborDetails[i].status == '2') && (status == '1' || status == '2')){
					
				}else {
					nui.alert("只能对工时状态为新增和受益疑问的工时信息进行受益疑问操作，请按照规则勾选！");
					return;
				}
			}
		}
		
		if(status == '2'){
			showAtPos();
		}else if (status == '1'){
			nui.confirm("本操作将确认符合查询条件的所有工时记录，请确认是否操作。", "确定？",function (action) {
				if (action == "ok"){
					sureDate_benef("confirm");
				}
			});
		}
	}
	function sureDate_benef(e){
		var rdLaborDetails=grid.getSelecteds();
		var status = ''
		var benefconfq = '';
		if(e == "doubt") {
			benefconfq = nui.get("benefconfq").getValue();
		}
		var message = '';
		if(e == "confirm"){
			status = '1';
			message = "确认";
		}else if(e == "doubt"){
			status = '2';
			message = "疑问";
		}
		if((benefconfq == '' || benefconfq == null) && status == '2'){
			nui.alert("受益疑问请填写受益疑问信息！");
			return;
		}
		if(status == '2'){
			document.getElementById("sureDate1").disabled=true;
			document.getElementById("closeDate").disabled=true;
		}else{
			nui.get("confirm").disable();
			nui.get("PMOconfirm").disable();
			nui.get("FINconfirm").disable();
		}
		for(var i = 0;i < rdLaborDetails.length; i++){
			if((rdLaborDetails[i].status == '0' || rdLaborDetails[i].status == '2') && (status == '1' || status == '2')){
				rdLaborDetails[i].status = status;
			}
			if(status == '2'){
				rdLaborDetails[i].benefconfq=benefconfq;
			}
		}
		var json = '';
		var url = '';
		if(e == "doubt"){
			json = {"updateEntities":rdLaborDetails,"style":"syr"};
			url= 'com.primeton.eos.ame_common.wx_worktime.changeLaborStatus.biz.ext';
		}else if (e == "confirm"){
			json = form.getData();
			if(json.criteria._expr[22]._max != null && json.criteria._expr[22]._max !=''){	
				json.criteria._expr[22]._max=json.criteria._expr[22]._max.substring(0,10) + " 23:59:59";
			}
			if(json.criteria._expr[14]._max != null && json.criteria._expr[14]._max !=''){
				json.criteria._expr[14]._max=json.criteria._expr[14]._max.substring(0,10) + " 23:59:59";
			}
			if(json.criteria._expr[12]._max != null && json.criteria._expr[12]._max !=''){
				json.criteria._expr[12]._max=json.criteria._expr[12]._max.substring(0,10) + " 23:59:59";
			}
			if(json.criteria._expr[8]._max != null && json.criteria._expr[8]._max !=''){
				json.criteria._expr[8]._max=json.criteria._expr[8]._max.substring(0,10) + " 23:59:59";
			}
			json.type="syr";
			url= 'com.primeton.rdmgr.labor.queryRdLaborDetail.confirmRdLaborDetails.biz.ext';
		}
		grid.loading("操作中，请稍后......");
		nui.ajax({
            type:'get',
            data:json,
            cache: false,
            contentType: 'text/json',
            url:url,
            success:function(result){
            	grid.unmask ( );
                if(result.exception == null){
                	hideWindow();
                	var alertmessage = '';
                	if(status == '2'){
                		alertmessage = "操作成功！本次操作将"+rdLaborDetails.length+"条工时数据的状态改为受益疑问。";
                	}else if(status == '1'){
                		alertmessage = "操作成功！本次操作"+message+"了"+result.total+"条数据。";
                	}
                    nui.alert(alertmessage,"系统提示",function(){
                        search();
                    });
                }else{	
                	hideWindow();
                    nui.alert("操作失败！请联系信息技术部人员。")
                }
                if(status == '2'){
					document.getElementById("sureDate1").disabled=false;
					document.getElementById("closeDate").disabled=false;
				}else{
					nui.get("confirm").enable();
					nui.get("PMOconfirm").enable();
					nui.get("FINconfirm").enable();
				}
                
            },
            error:function(jqXHR, textStatus, errorThrown){
            	grid.unmask ( );
                nui.alert("error:" + jqXHR.responseText);
            }
        })
	}
	
	//工时检查
	function checkBtn(){
		var json = form.getData();
		if(json.criteria._expr[0]._min == null || json.criteria._expr[0]._min == ''){
			nui.alert("请选择工时日期的开始日期后再执行检查操作！");
			return;
		}
		if(json.criteria._expr[0]._max == null || json.criteria._expr[0]._max == ''){
			nui.alert("请选择工时日期的结束日期后再执行检查操作！");
			return;
		}		
		if(json.criteria._expr[22]._max != null && json.criteria._expr[22]._max !=''){	
			json.criteria._expr[22]._max=json.criteria._expr[22]._max.substring(0,10) + " 23:59:59";
		}
		if(json.criteria._expr[14]._max != null && json.criteria._expr[14]._max !=''){
			json.criteria._expr[14]._max=json.criteria._expr[14]._max.substring(0,10) + " 23:59:59";
		}
		if(json.criteria._expr[12]._max != null && json.criteria._expr[12]._max !=''){
			json.criteria._expr[12]._max=json.criteria._expr[12]._max.substring(0,10) + " 23:59:59";
		}
		if(json.criteria._expr[8]._max != null && json.criteria._expr[8]._max !=''){
			json.criteria._expr[8]._max=json.criteria._expr[8]._max.substring(0,10) + " 23:59:59";
		}
		sessionStorage.setItem("json",nui.encode(json));
		nui.open({
  			// 编辑界面  
            url: "<%=request.getContextPath() %>/labor/queryRdLaborDetail/inspectRdLaborDetail.jsp?",
            title: "工时检查 ",
            width: 1098,
            height: 480,
            onload: function () {
            },
            ondestroy: function (action) {
            	if(action == "ok"){
		            grid.reload();
            	}
       	 	}
		});
	}
	
	//人员级别弹框
	function selectGrade(){
		var btnEdit = this;
        nui.open({
            url:"<%=request.getContextPath() %>/labor/queryRdLaborDetail/selectEmpGrades.jsp",
                title: "选择人员",
                width: 650,
                height: 400,
                ondestroy: function (action) {
                    if (action == "ok") {
                        var iframe = this.getIFrameEl();
                        var data = iframe.contentWindow.GetData();
                        data = nui.clone(data);    //必须
                        if (data) {
	                    	btnEdit.setValue(data.degree);
	                    	btnEdit.setText(data.degreename);
                        }
                    }

                }
            });
	}
	
	//工时状态业务字典
	function laborStatus(e){
		return nui.getDictText('AME_LABOR_STATUS',e.value);
	}
	//预留调休
	function laborIsDaysOff(e){
		return nui.getDictText('AME_LABOR_ISDAYSOFF',e.value);
	}
	//项目活动业务字典
	function getGrade(e) {
		var degreename = "";
		var json = ({"criteria": 
	                    {"_expr[0]": {"degree": e.value},
	                    "_expr[1]": {"_property": "startdate","_op": "<=","_value":e.record.laborDate},
	                    "_expr[2]": {"_property": "enddate","_op": ">=","_value":e.record.laborDate},
	                    "_expr[3]": {"userid": e.record.userId}}
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
            	if(result.emplevels.length <=0){
            		degreename = e.value;
            	}else{
            		degreename = result.emplevels[0].degreename;
            	}
            }
        });
		return degreename;//设置业务字典值
	}
	
	//清空人员等级
	function clearGrade(){
		nui.get("grade").setValue("");
		nui.get("grade").setText("");
	}
</script>
</html>
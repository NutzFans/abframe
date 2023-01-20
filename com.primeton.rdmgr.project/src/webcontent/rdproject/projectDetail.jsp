<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@page import="com.eos.data.datacontext.UserObject"%>
<%@page import="commonj.sdo.DataObject"%>
<%@page import="java.util.Map"%>
<html>
<!-- 
  - Author(s): wanglinqiong
  - Date: 2016-05-12 16:17:56
  - Description:
-->
<head>
<title>项目详细信息</title>
<%@include file="/common/skins/skin0/component.jsp" %>
<meta http-equiv="content-type" content="text/html; charset=UTF-8" />
<script src="<%= request.getContextPath() %>/common/nui/nui.js" type="text/javascript"></script>
	<style type="text/css">
	    body{
	        margin:0;padding:0;border:0;width:100%;height:100%;overflow:hidden;
	    }
	    .asLabel
	    {
	        border:0;background-color:#F5F5F5;cursor:default;    
	    }
    </style>
</head>
<body>
<div class="nui-fit">
<div id="tabs1" class="nui-tabs" activeIndex="0" style="width:auto;height:100%">
	<div title="项目基本信息">
		<div class="nui-fit">
		 	<div id="form1" method="post" >
		 		<input class="nui-hidden" id="fileids">
		        <fieldset style="border:solid 1px #aaa;padding:3px;">
		        	<legend>基本信息</legend>
		        	<table style="table-layout:fixed;" id="table_file1">
				            <tr>
								<td align="right" style="width:160px">项目名称：</td>
								<td id="rdproject.projectName" style="width:250px" class = "asLabel"></td>
								<td align="right" style="width:160px">项目编号：</td>
								<td id="rdproject.projectno" style="width:250px" class = "asLabel"></td>	
								<td align="right" style="width:160px">项目类型：</td>
								<td id="rdproject.projectType" style="width:250px" class = "asLabel"></td>
								
							</tr>
							<tr>
								<td align="right" style="width:160px">对应客户：</td>
								<td id="rdproject.custname" style="width:250px" class = "asLabel"></td>
								<td align="right" style="width:160px"> 受益部门：</td>
								<td id="omOrganization.orgname" style="width:250px" class = "asLabel"></td>
								<td align="right" style="width:160px">预计合同额：</td>
								<td id="rdproject.expcontsum" style="width:250px" class = "asLabel"></td>
							</tr>
							<tr>
								<td align="right" style="width:160px">实施责任部门：</td>
								<td id="rdproject.managerdept" style="width:250px" class = "asLabel"></td>
								<td align="right" style="width:160px">项目负责人：</td>
								<td id="rdproject.manager" style="width:250px" class = "asLabel"></td>
								<td align="right" style="width:160px">是否延续性项目：</td>
								<td id="rdproject.isconproj" style="width:250px" class = "asLabel"></td>
							</tr>
							<tr>
								<td align="right" style="width:160px">项目操作状态：</td>
								<td id="rdproject.projectStatus" style="width:250px" class = "asLabel"></td>
								<td align="right" style="width:160px">项目商务状态：</td>
								<td  style="width:250px" id="rdproject.outstatus" class = "asLabel"></td>
								<td align="right" style="width:160px">创建日期：</td>
								<td id="rdproject.createdate" style="width:250px" class = "asLabel"></td>
							</tr>
							<tr>
								<td align="right" style="width:160px">项目开始日期：</td>
								<td id="rdproject.startdate" style="width:250px" class = "asLabel"></td>
								<td align="right" style="width:160px">预计结束日期：</td>
								<td id="rdproject.expenddate" style="width:250px" class = "asLabel"></td>
								<td align="right" style="width:160px">项目结束日期：</td>
								<td id="rdproject.enddate" style="width:250px" class = "asLabel"></td>
							</tr>
							<tr>
								<td align="right" style="width:160px">项目成本类型：</td>
								<td id="rdproject.pcosttype" style="width:250px" class = "asLabel"></td>
								<td align="right" style="width:160px">外部成本开始日期：</td>
								<td id="rdproject.ocstartdate" style="width:250px" class = "asLabel"></td>
								<td align="right" style="width:160px">外部成本结束日期：</td>
								<td id="rdproject.ocenddate" style="width:250px" class = "asLabel"></td>
							</tr>
							<tr>
								<td align="right" style="width:160px">成本跟踪阈值：</td>
								<td id="rdproject.remindfz"  style="width:250px" class = "asLabel"></td>
								<td align="right" style="width:160px">是否超阈值：</td>
								<td id="rdproject.ispassfz"  style="width:250px" class = "asLabel"></td>
								<td align="right" style="width:160px">是否发送超阈值邮件：</td>
								<td id="rdproject.issendfzmail" style="width:250px" class = "asLabel"></td>
							</tr>
							<tr>
								<td align="right" style="width:160px">当前预算版本号：</td>
								<td id="rdproject.cbversion" style="width:250px" class = "asLabel"></td>
								<td align="right" style="width:160px">预算状态：</td>
								<td id="rdproject.ispassbud"  style="width:250px" class = "asLabel"></td>
								<td align="right" style="width:160px">是否发送超预算邮件：</td>
								<td id="rdproject.issendbudmail"  style="width:250px" class = "asLabel"></td>
							</tr>
							<tr>
								<td align="right" style="width:160px">项目考勤规则：</td>
								<td id="rdproject.rulename"  style="width:250px" class = "asLabel"></td>
								<td align="right" style="width:160px">项目创建申请人：</td>
								<td id="rdproject.createapplicant" style="width:250px" class = "asLabel"></td>
								<td align="right" style="width:160px">关闭日期：</td>
								<td id="rdproject.closedate" style="width:250px" class = "asLabel"></td>
							</tr>
							<tr>
								<td align="right" style="width:160px">实施城市：</td>
								<td id="rdproject.implemnetcity" style="width:250px" class = "asLabel"></td>
								<td align="right" style="width:160px">考核状态：</td>
								<td id="rdproject.checkstatus" style="width:250px" class = "asLabel"></td>
								<td align="right" style="width:160px">商机来源：</td>
								<td id="rdproject.bosource" style="width:250px" class = "asLabel"></td>
							</tr>
							<tr>
								<td align="right" style="width:160px" id="2">项目办公位置：</td>
								<td id="rdproject.checkplace" colspan="3" class = "asLabel" onclick="chooseplace()">
									<input class="nui-hidden" id="longitude" name="longitude"/>
		 							<input class="nui-hidden" id="latitude" name="latitude"/>
								</td>
							</tr>
							<tr>
								<td align="right" style="width:160px">备注：</td>
								<td id="rdproject.remark" colspan="5" style="width:auto" class = "asLabel"></td>
							</tr>
		        	</table>
		        </fieldset>
		        </br>
		        <div class="nui-tabs" activeIndex="0" id="tab1">
		        	<div title="项目有权的人员">
		        		<div class="nui-toolbar" id="id2" style="border-bottom:0;padding:0px;" >
						    <table style="width:auto;" >
						        <tr>
						            <td style="width:100%;">
						                <a class="nui-button" iconCls="icon-add" onclick="addRow()" plain="true">增加</a>
						                <a class="nui-button" iconCls="icon-remove" onclick="removeRow()" plain="true">删除</a>
						                <a class="nui-button" iconCls="icon-add" onclick="saveRow()" plain="true">保存</a>
					                </td>
					            </tr>
					        </table>           
					    </div>
				        <div id="datagrid22" class="nui-datagrid" style="width:auto;height:auto;" dataField="rdEmpProjs"  url="com.primeton.rdmgr.project.createApplication.queryRdEmpProjsInit.biz.ext"
		 				allowResize="true" pageSize="20" allowCellEdit="true" allowCellSelect="true" multiSelect="true" editNextOnEnterKey="false" showPager="false">
			    			<div property="columns"> 
			    				<div type="checkcolumn"></div>           
			        			<div field="userid" displayField="empname" width="100" headerAlign="center">员工姓名
			        				<input property="editor" name="RdEmpProj.userid" id="userid" class="nui-buttonedit" onbuttonclick="showEmployee" showClose="false" required="true" allowInput="false"/>
			        			</div>
			        			<div field="pricetype" width="40" allowSort="true"  headerAlign="center" renderer="getPriceType">计价模式</div>                          
			        			<div field="projRole" width="100" headerAlign="center" renderer="dictprojRole">角色
			        				<input property="editor" name="RdEmpProj.projRole" id="projRole" property="editor" class="nui-dictcombobox" style="width:100%;" dictTypeId="PRD_ROLE"/>
			        			</div>
			        			<div field="beginDate" width="100" allowSort="true" dateFormat="yyyy-MM-dd" renderer="onDealDate" headerAlign="center">进入时间
			        				<input property="editor" name="RdEmpProj.beginDate" id="beginDate" property="editor" class="nui-datepicker" style="width:100px"/>
			        			</div>
			        			<div field="endDate" width="100" allowSort="true" dateFormat="yyyy-MM-dd" renderer="onDealDate" headerAlign="center">退出时间
			        				<input property="editor" name="RdEmpProj.endDate" id="endDate" property="editor" class="nui-datepicker" style="width:100px;"/>
			        			</div>
			        			<div field="isAdd" width="0"  visible="false"></div>
			    			</div>
						</div>  
		        	</div>
		        	<div title="项目外包人员">
		        		<div id="datagrid55" class="nui-datagrid" style="width:auto;height:auto;" showPager="false"  sortMode="client"  multiSelect="true" allowSortColumn="true">
			    			<div property="columns">
			                    <div field="outper.outpername" width="60" align="center"headerAlign="center" allowSort="true" fixed="true" renderer="getOutperDetail">人员</div>
			                    <div field="outper.suppliersname" width="70" align="left"headerAlign="center" allowSort="true" fixed="true" >供应商</div>
			                    <div field="startdate" width="100" align="center"headerAlign="center" allowSort="true" fixed="true">服务开始日期</div>
			                    <div field="expenddate" width="100" align="center"headerAlign="center" allowSort="true" >预计服务结束日期</div>
			                    <div field="inputratio" width="100" align="center"headerAlign="center" allowSort="true" numberFormat="p0">投入比重</div>
			                    <div field="currentstatus" width="150" align="center"headerAlign="center" allowSort="true" renderer="getType">服务状态</div>
			                    <div field="actenddate" width="150" align="center"headerAlign="center" allowSort="true" >实际服务结束日期</div>
			                    <div field="outper.degree" width="150" align="center"headerAlign="center" allowSort="true" fixed="true" renderer="dictGetDegree">学历</div>
			                    <div field="outper.gradudate" width="100" align="center" headerAlign="center" allowSort="true" >毕业时间</div>
			                    <div field="outper.linktel" width="150" align="center" headerAlign="center" allowSort="true" >联系电话</div>
			                    <div field="empname" width="150" align="center"headerAlign="center" allowSort="true" >汇报对象</div>
			                </div>
						</div> 
		        	</div>
					<div title = "项目合同">
						<div id="grid_cont" showPager="false" dataField="projConts" class="nui-datagrid" url="com.primeton.rdmgr.project.rdProject.queryProContByProid.biz.ext" 
		            	 allowSortColumn=true>
			                <div property="columns">
			                    <div field="proconttype" width="80" align="center" headerAlign="center" allowSort="true" renderer="dictGetType">对应类型</div>
			                    <div field="contnum" width="110" align="center" headerAlign="center" allowSort="true" >合同编号</div>
			                    <div field="contorderno" width="80" align="center" headerAlign="center" allowSort="true" renderer="getContDetail">合同订单编号</div>
			                    <div field="contracttype" width="120" align="center" headerAlign="center" allowSort="true" renderer="dictGetContType">合同类型</div>
			                    <div field="contcustname" width="180" align="center"headerAlign="center" allowSort="true" >合同所属客户</div>
			                    <div field="salename" width="80" align="center" headerAlign="center" allowSort="true" >合同销售</div>
			                    <div field="isforbid" width="80" align="center" headerAlign="center" allowSort="true" renderer="getIsforbid">禁止分包外包</div>
			                </div>
			            </div>
					</div>
		        	<div title="项目日志">
		        		<jsp:include page="/ame_common/operatLog.jsp?groupid=RD_PROJECT">
		        			<jsp:param name="relationid" value="<%=request.getParameter("projid")%>"/>
		        		</jsp:include>
		        	</div>
		        	<div title="项目附件" id="filetab">
		        		<jsp:include page="/ame_common/inputFile1.jsp"/>
		        	</div>
		        </div>
	        </div>
		</div>
	</div>
	<div title="项目损益查询">
		<form id="form2" method="post" >
       	<fieldset id="field1" style="border:solid 1px #aaa;padding:8px;">
	    <legend>项目基本信息</legend>         
	   		<div style="padding:8px;">
            	<table style="table-layout:fixed;">
					<tr>
	               	 	<td style="width:105px" align="right">项目名称:</td>
	               	 	<td style="width:280px" id="projectName" class = "asLabel"></td>
	                    <td style="width:90px" align="right">项目编号:</td>
	                    <td style="width:140px" id="projectno" class = "asLabel"></td>
	                    <td style="width:105px" align="right">当前阶段:</td>
	                    <td style="width:200px" id="outstatus" class = "asLabel"></td>
	                    <td style="width:90px" align="right">项目创建日期:</td>
	                    <td style="width:140px" id="createdate" class = "asLabel"></td>         
	                </tr>                  
	                 <tr>
	                	<td style="width:105px" align="right">所属客户:</td>
						<td style="width:200px" id="custname" class = "asLabel"></td>
						 <td style="width:90px" align="right">受益销售:</td>
	                    <td style="width:140px" id="sybm" class = "asLabel"></td>
	                    <td style="width:105px" align="right">当前预算版本号:</td>
						<td style="width:200px" id="versionid" class = "asLabel"></td>  
						<td style="width:90px" align="right">预算评估日期:</td>
	                    <td style="width:140px" id="budgetdate" class = "asLabel"></td>  
	                </tr>
			        <tr>
	                    <td style="width:105px" align="right" id = "qddate1"></td>
	                    <td style="width:140px" id="qddate" class = "asLabel"></td>
	                    <td  style="width:105px" align="right">项目开始日期:</td>
	                    <td style="width:200px" id="startdate" class = "asLabel"></td>
	                    <td style="width:90px" align="right">计划结束日期:</td>
	                    <td style="width:140px" id="expenddate" class = "asLabel"></td>
	                    <td style="width:90px" align="right">项目负责人:</td>
	                    <td style="width:140px" id="manager" class = "asLabel"></td>                                                                                                                                                                    
	                </tr>
				</table>
        	</div>
	    </fieldset> 
      	<fieldset id="fieldCont" style="border:solid 1px #aaa;padding:8px;display: none;">
	    <legend>项目对应合同信息</legend>         
	   		<div style="padding:8px;">
				<div id="grid_cont1" showPager="false" dataField="proconts" style="width: 100%;"
				class="nui-datagrid" url="com.primeton.rdmgr.project.rdProject.getProContInfo.biz.ext">
	                <div property="columns">
	                    <div field="contnum" width="140" align="center" headerAlign="center">关联合同编号</div>
	                    <div field="contorderno" width="120" align="center" headerAlign="center">关联订单编号</div>
	                    <div field="prodmon" width="80" align="right" numberFormat="n2" headerAlign="center">产品金额</div>
	                    <div field="servmon" width="80" align="right" numberFormat="n2" headerAlign="center">服务金额</div>
	                    <div field="masum" width="80" align="right" numberFormat="n2" headerAlign="center">MA金额</div>
	                    <div field="contsum" width="80" align="right" numberFormat="n2" headerAlign="center">合同总金额</div>
	                    <div field="contracttype" width="120" align="center" headerAlign="center" renderer="dictGetContType">合同类型</div>
	                    <div field="yqrsr" width="100" align="right" numberFormat="n2" headerAlign="center" >已确认收入</div>
	                    <div field="srpratio" width="100" align="center" numberFormat = "p2" headerAlign="center" >已确认比例</div>
	                    <div field="confirmdate" width="120" align="center" dateFormat="yyyy-MM-dd" headerAlign="center">合同最近确认日期</div>
	                    <div field="ysk" width="100" align="right" numberFormat="n2" headerAlign="center" >已收款金额</div>
	                </div>
	            </div>
        	</div> 
	    </fieldset>  
        <fieldset id="field2" style="border:solid 1px #aaa;padding:8px;">
            <legend>项目预算与执行损益对照表</legend>                       
            <div style="padding:8px;">
            	<jsp:include page="/project/rdproject/projectprofit.jsp"/>
        	</div>
        </fieldset>    
    </form>        
    </div>
	</div>
</div>
<script type="text/javascript" src="<%= request.getContextPath() %>/ame_common/js/jquery.min.js"></script>
    <script type="text/javascript">
		nui.parse();
    	var form = new nui.Form("form1");
    	var form2 = new nui.Form("form2");
    	var projectid = <%=request.getParameter("projid")%>;
    	var projorgid;
    	var groupid = 'RD_PROJECT';
    	var gaid22 = nui.get("datagrid22");
    	var gaid55 = nui.get("datagrid55");
    	var grid_cont = nui.get("grid_cont");//项目合同列表
    	var expenddate;
    	var sybm;
    	var custname;
    	var projorgid;
		gaid22.load({"projectid":projectid});
		setData(projectid);
		setMesg(projectid);
		
		<%
	 	UserObject user = (UserObject) session.getAttribute("userObject");
		Map attr = user.getAttributes();
		DataObject[] roles = (DataObject[]) attr.get("roles");
		Boolean isBudget = false;
		for(int i=0;i<roles.length;i++){
			String rolesTemp = roles[i].getString("roleid");
			if(rolesTemp.equals("PMO")||rolesTemp.equals("eosadmin")){
				isBudget = true;
			}
		}
		%>
		
		//外包人员考勤统计
        function getOutperDetail(e){
			if(e.value){
	    		return "<a href='javascript:void(0)' onclick='checkDetaila();' title='点击查看'>" + e.value + "</a>";
	    	}
	    }
	    function checkDetaila(){
	 		var selectRow = gaid55.getSelected();
	 		var outpername = selectRow.outper.outpername;
	 		var projectno = selectRow.projectno;
			var executeUrl = "<%= request.getContextPath() %>/ame_common/attendance/conutAttenddance.jsp?names=" + outpername+"&projectno="+projectno;
			window.open(executeUrl, "考勤统计明细", "fullscreen=1");
	    }
		
		function setMesg(projectid){
			var json = nui.encode({projectid:projectid});
        	nui.ajax({
	            url: "com.primeton.rdmgr.project.benefitToBenefitProject.getProjOutper.biz.ext",
				type: 'POST',
				data: json,	
				contentType: 'text/json',
	            success: function (o) {
	            	gaid55.setData(o.projouts);
				}
	     	});
		}
		
		
		function getPriceType(e){
			return nui.getDictText('MIS_PRICETYPE',e.value);
		}
		
		function getType(e){
			return nui.getDictText('AME_OUTPERSTATUS',e.value);
		}
		
		function dictprojRole(e){
			return nui.getDictText('PRD_ROLE',e.value);
		}	
		
		function dictGetDegree(e) {
			return nui.getDictText('DEGREE',e.value);
		}
		
		//对应类型业务字典
		function dictGetType(e){
			return nui.getDictText('AME_PROCONT',e.value);
		}
		
		//合同类型业务字典
		function dictGetContType(e){
			return nui.getDictText('MIS_CONTRACTTYPE',e.value);
		}
		
		//是否禁止分包外包
		function getIsforbid(e){
			return nui.getDictText('MIS_YN',e.value);
		}
		
		<!--基本信息	-->										  
        function setData(projectid){        
        	var json = nui.encode({projid:projectid});
        	nui.ajax({
	            url: "com.primeton.rdmgr.project.benefitToBenefitProject.getProjectMessage.biz.ext",
				type: 'POST',
				data: json,	
				contentType: 'text/json',
	            success: function (o) {
	            	nui.get("grid_0").load({"groupid":"rdproject","relationid":o.rdproject.projectId});
	            	nui.get("grid_001").load({"groupid":groupid,"relationid":o.rdproject.projectId});
	            	grid_cont.load({"projectid":o.rdproject.projectId});
	            	grid_cont.sortBy("contnum","asc");
	            	o = nui.decode(o);
	                form.setData(o);
	                form.setChanged(false);
	                projectname = o.rdproject.projectName;
	                startdate = o.rdproject.startdate;
	                expenddate = o.rdproject.expenddate;
	                sybm = o.rdproject.finUnitId;
	                custname = o.rdproject.custname;
	                projorgid = o.rdproject.finUnitId;
	                document.getElementById("rdproject.projectName").innerHTML = o.rdproject.projectName == null ?"":o.rdproject.projectName;
	                document.getElementById("rdproject.projectno").innerHTML = o.rdproject.projectno == null ?"":o.rdproject.projectno;
	                document.getElementById("omOrganization.orgname").innerHTML = o.rdproject.orgname == null ?"":o.rdproject.orgname;
	                document.getElementById("rdproject.projectType").innerHTML = nui.getDictText('PROJECT_TYPE',o.rdproject.projectType);
	                document.getElementById("rdproject.projectStatus").innerHTML = nui.getDictText('MIS_PROJSTATUS',o.rdproject.projectStatus);
	                document.getElementById("rdproject.outstatus").innerHTML = nui.getDictText('MIS_PROJOUTSTATUS',o.rdproject.outstatus);
	                document.getElementById("rdproject.custname").innerHTML = o.rdproject.custname == null ?"":o.rdproject.custname;
	                document.getElementById("custname").innerHTML = o.rdproject.custname == null ?"":o.rdproject.custname;
	                document.getElementById("rdproject.remindfz").innerHTML = o.rdproject.remindfz == null ?"":o.rdproject.remindfz+'元';
	                document.getElementById("rdproject.startdate").innerHTML = o.rdproject.startdate == null ?"":o.rdproject.startdate;
	                document.getElementById("rdproject.expenddate").innerHTML = o.rdproject.expenddate == null ?"":o.rdproject.expenddate;
	                document.getElementById("rdproject.enddate").innerHTML = o.rdproject.enddate == null ?"":o.rdproject.enddate;
	                document.getElementById("rdproject.ispassfz").innerHTML = o.rdproject.ispassfz == null ?"":nui.getDictText('ABF_YESORNO',o.rdproject.ispassfz);
	                document.getElementById("rdproject.issendfzmail").innerHTML = o.rdproject.issendfzmail == null ?"":nui.getDictText('ABF_YESORNO',o.rdproject.issendfzmail);
	                document.getElementById("rdproject.ispassbud").innerHTML = o.rdproject.ispassbud == null ?"":nui.getDictText('AME_ISPASSBUD',o.rdproject.ispassbud);
	                document.getElementById("rdproject.issendbudmail").innerHTML = o.rdproject.issendbudmail == null ?"":nui.getDictText('ABF_YESORNO',o.rdproject.issendbudmail);
	                document.getElementById("rdproject.cbversion").innerHTML = o.rdproject.cbversion == null ?"":o.rdproject.cbversion;
	                document.getElementById("rdproject.pcosttype").innerHTML = nui.getDictText('AME_PCOSTTYPE',o.rdproject.pcosttype);
	                document.getElementById("rdproject.bosource").innerHTML = nui.getDictText('AME_BOSOURCE',o.rdproject.bosource);
	                document.getElementById("rdproject.expcontsum").innerHTML = o.rdproject.expcontsum == null ?"":o.rdproject.expcontsum;
	                //document.getElementById("rdproject.contnum").innerHTML = o.rdproject.contnum == null ?"":o.rdproject.contnum;
	                document.getElementById("rdproject.rulename").innerHTML = o.rdproject.rulename == null ?"":o.rdproject.rulename;
	                document.getElementById("rdproject.remark").innerHTML = o.rdproject.remark == null ?"":o.rdproject.remark;
	                document.getElementById("rdproject.createdate").innerHTML = o.rdproject.createdate == null ?"":o.rdproject.createdate;
	                document.getElementById("rdproject.closedate").innerHTML = o.rdproject.closedate == null ?"":o.rdproject.closedate;
					document.getElementById("rdproject.checkplace").innerHTML = o.rdproject.checkplace == null ?"":o.rdproject.checkplace;
					document.getElementById("rdproject.implemnetcity").innerHTML = o.rdproject.implementcity == null ?"":nui.getDictText('AREA4CLRY',o.rdproject.implementcity);
					document.getElementById("rdproject.managerdept").innerHTML = o.rdproject.managerdeptname == null ?"":o.rdproject.managerdeptname;
					document.getElementById("rdproject.manager").innerHTML = o.rdproject.managername == null ?"":o.rdproject.managername;
					document.getElementById("manager").innerHTML = o.rdproject.managername == null ?"":o.rdproject.managername;
					document.getElementById("rdproject.isconproj").innerHTML = nui.getDictText('MIS_YN',o.rdproject.isconproj);
					document.getElementById("rdproject.ocstartdate").innerHTML = o.rdproject.ocstartdate == null ?"":o.rdproject.ocstartdate;
					document.getElementById("rdproject.ocenddate").innerHTML = o.rdproject.ocenddate == null ?"":o.rdproject.ocenddate;
					document.getElementById("rdproject.checkstatus").innerHTML = o.rdproject.checkstatus == null ?"":nui.getDictText('PROJ_CHECK',o.rdproject.checkstatus);
					document.getElementById("rdproject.createapplicant").innerHTML = o.rdproject.createapplicantname == null ?"":o.rdproject.createapplicantname;
					nui.get("longitude").setValue(o.rdproject.longitude);
					nui.get("latitude").setValue(o.rdproject.latitude);
					
					
					var projectno= o.rdproject.projectno;
					var startdate= o.rdproject.startdate;
					var projectName= o.rdproject.projectName;
					var custname= o.rdproject.custname;
					var orgname= o.rdproject.orgname
					//项目成本跟踪
					var tabs1 =nui.get("tabs1");
					var tab_bb = {name: "tab_service", id: "tab_service", title: "项目成本执行跟踪",url:"<%=request.getContextPath() %>/ame_budget/prjWeekCost.jsp?projectId="+projectid+"&projectno="+projectno+"&startdate="+startdate+"&projectName="+projectName+"&custname="+custname+"&orgname="+orgname};//服务成本页面
					tabs1.addTab(tab_bb,3);
					//项目损益基本信息
	        		document.getElementById("startdate").innerHTML = o.rdproject.startdate == null ? "" : o.rdproject.startdate;
	        		document.getElementById("sybm").innerHTML = o.rdproject.orgname == null ? "" : o.rdproject.orgname;
	            	document.getElementById("expenddate").innerHTML = o.rdproject.expenddate == null ? "" : o.rdproject.expenddate;
	            	document.getElementById("projectName").innerHTML = o.rdproject.projectName == null ? "" : o.rdproject.projectName;
	            	document.getElementById("createdate").innerHTML = o.rdproject.createdate == null ? "" : o.rdproject.createdate;
	            	document.getElementById("projectno").innerHTML = o.rdproject.projectno == null ? "" : o.rdproject.projectno;
	            	document.getElementById("outstatus").innerHTML = o.rdproject.outstatus == null ? "" : nui.getDictText('MIS_PROJOUTSTATUS',o.rdproject.outstatus);
	            	document.getElementById("budgetdate").innerHTML = o.rdproject.budgetdate == null ? "" : o.rdproject.budgetdate;
	            	document.getElementById("versionid").innerHTML = o.rdproject.cbversion == null ? "" : o.rdproject.cbversion;
	            	if(o.rdproject.ishavecont=="true"){
	            		document.getElementById("qddate1").style.display = "none";
	            		document.getElementById("qddate").style.display = "none";
	            		document.getElementById("fieldCont").style.display = "block";
	            		var grid_cont1 = nui.get("grid_cont1");
	            		grid_cont1.load({"projectno":o.rdproject.projectno});
	            	}else{
	            		document.getElementById("qddate1").innerHTML = "合同预计签订日期:";
	            		document.getElementById("qddate").innerHTML = o.rdproject.contplandate == null ? "" : o.rdproject.contplandate;
	            	} 
				}
	     });
	}	
	
	
	function returnMap(ret){
		nui.get("checkplace").setValue(ret.suggestId);
		nui.get("longitude").setValue(ret.longitude);
		nui.get("latitude").setValue(ret.latitude);
	}
	
	//选择项目负责人
	function showEmployee(e) {
        var btnEdit = this;
        nui.open({
			url:"<%=request.getContextPath() %>/machine/SelectEmployee.jsp",
			title: "选择列表",
			width: 600,
			height: 400,
			ondestroy: function (action) {
				if (action == "ok") {
					var iframe = this.getIFrameEl();
					var data = iframe.contentWindow.GetData();
					data = nui.clone(data);    //必须
					if (data) {
		                btnEdit.setValue(data.userid);
		                btnEdit.setText(data.empname);	
		                var orgseq = data.omOrganization.orgseq;//人员seq
		                var orgname = data.orgname;//人员所属部门
		                var orgid = data.orgid;//人员所属部门
		                var json = nui.encode({"projorgid":projorgid,"orgid":orgid});
			        	nui.ajax({
				            url: "com.primeton.rdmgr.project.rdProject.checkPice.biz.ext",
							type: 'POST',
							data: json,	
							contentType: 'text/json',
				            success: function (o) {
    							if(o.result !=null ){
				            		var result = o.result;
				            		//内部价
				            		if(result == '0'){
					                	var updateRow = {
				                        pricetype : '0'
				                        };
					                }else{//外部价
					                	var updateRow = {
				                       	pricetype : '1'
				                        };
					                }
					                var projectEmp = nui.get("datagrid22");
			                        var row = projectEmp.getSelected();
				                  	projectEmp.updateRow(row,updateRow);
				            	}
							}
				     	});
					}
				}
			}
		});
	}
	
	
	function addRow() {          
	    var newRow = { name: "New Row" };
	    gaid22.addRow(newRow, 0);
	}
	function removeRow() {
	    var rows = gaid22.getSelecteds();
	    if (rows.length > 0) {
	        gaid22.removeRows(rows, true);
	    }
	}
	
	function saveRow(){
		if(!checkTime()){
			return;
		}else{
			var RdEmpProj = gaid22.getData();
			var isCf;
			for(var i = 0 ; i<RdEmpProj.length;i++){
				for( var l = i+1 ; l<RdEmpProj.length; l++){
					var useridA = RdEmpProj[i].userid;
					var useridB = RdEmpProj[l].userid;
					if(useridA == useridB){
						isCf = '1';
					}
				}
				if(RdEmpProj[i].pricetype ==null || RdEmpProj[i].pricetype == " "){
					alert("项目计价模式为空，请确认后再保存!");
					return;
				}
			}
			if(isCf == '1'){
				alert("项目有权人员有重复，请确认后再保存!");
				return;
			}
			var json = {"RdEmpProj":gaid22.getData(),"projectid":projectid};
			var json1 = nui.encode(json);
			nui.ajax({
		        url: "com.primeton.rdmgr.project.createApplication.savePowerPerson.biz.ext",
				type: 'POST',
				data: json1,	
				contentType: 'text/json',
		        success: function (o) {
		        	if(o.result == '1'||o.result == 1){
		        		alert("保存失败！");
		        	}else{
		        		alert("保存成功！");
		        		gaid22.reload();
		        	}
			    }
			});
		}
	}
	
	
	//grid2的表单验证
	function checkTime(){
			var start="";
			var end="";
			var rows = gaid22.getChanges();
			if(rows){
				for(var i = 0;i < rows.length;i ++){
			     	if(!rows[i].userid){
			     		alert("相关人员的员工姓名不能为空!")
			     		return false
			     	}else{
			     		if(rows[i].beginDate){
			     			if(rows[i].endDate){
			     				start = rows[i].beginDate.substring(0,4) + rows[i].beginDate.substring(5,7) + rows[i].beginDate.substring(8,10);
			     				end = rows[i].endDate.substring(0,4) + rows[i].endDate.substring(5,7) + rows[i].endDate.substring(8,10);
			     				if(start > end){
				        			alert("进入日期:" + rows[i].beginDate.substring(0,10) + "不能大于退出日期:" + rows[i].endDate.substring(0,10));
				        			return false;
				        		}
			     			}
			     		}
			     	}
				}
			}
		return true;
	} 	
	
	
		
	function dictpurtype(e) {
		return nui.getDictText('AME_CONTYPE',e.value);//设置业务字典值
	}
	function dictpurstatus(e) {
		return nui.getDictText('AME_ORDERSTATUS',e.value);//设置业务字典值
	}
	function dictorderstatus(e) {
		return nui.getDictText('AME_ORDERSTATUS',e.value);//设置业务字典值
	}
	
	<!--项目成本汇总-->
	
	function dictstatus(e) {
		return nui.getDictText('MIS_BUDSTATUS',e.value);//设置业务字典值
	}
	function dictversion(e) {
		return nui.getDictText('MIS_YN',e.value);//设置业务字典值
	}
	
	
	saveDate();
	function saveDate(){
		var isBudget=<%=isBudget %>;
		var tabs1 =nui.get("tabs1");
		var tab_bb = {name: "tab_service", id: "tab_service", title: "项目预算明细",url:"<%=request.getContextPath() %>/ame_budget/budgetModify.jsp?projectId="+projectid+"&projectName="+projectName+"&startdate="+startdate+"&expenddate="+expenddate+"&sybm="+sybm};//服务成本页面
		tabs1.addTab(tab_bb,1);
	}
	
	function chooseplace(){
		var checkplace = document.getElementById("rdproject.checkplace").innerHTML;
		var longitude=nui.get("longitude").getValue();
		var latitude=nui.get("latitude").getValue();
		var state = "1";
		nui.open({
			url:"<%=request.getContextPath() %>/ame_common/attendance/baiduMap.jsp?longitude="+longitude+"&latitude="+latitude+"&suggestId="+checkplace+"&state="+state,
			title: "地图信息",
			width: 700,
			height: 450,
			ondestroy: function (action) {
				if (action == "ok") {
					var iframe = this.getIFrameEl();
					var data = iframe.contentWindow.GetData();
					data = nui.clone(data);    //必须
					if (data) {
						nui.get("checkplace").setValue(data.suggestId);
		                nui.get("longitude").setValue(data.longitude);
		                nui.get("latitude").setValue(data.latitude);
		                
					}
				}
			}
		});
	}
	
	function SaveData(){
		var fileids = nui.get("fileids").getValue();
		var json = {fileids:fileids,groupid:"rdproject",relationid:projectid};
		nui.ajax({
	        url: "com.primeton.eos.ame_common.file.updateFile.biz.ext",
			type: 'POST',
			data: json,	
			contentType: 'text/json',
	        success: function (o) {
	        	nui.get("grid_0").load({"groupid":"rdproject","relationid":projectid});
	        	$("#filetable tbody").html("");
		    }
		});
	}
   	</script>
</body>
</html>
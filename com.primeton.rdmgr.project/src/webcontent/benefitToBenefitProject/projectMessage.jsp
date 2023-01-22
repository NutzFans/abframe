<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<!-- 
  - Author(s): wanglinqiong
  - Date: 2016-05-12 16:17:56
  - Description:
-->
<head>
<title>项目详细信息</title>
<%@include file="/common/common.jsp"%>
<%@include file="/common/skins/skin0/component.jsp" %>
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
<div id="tabs1" class="nui-tabs" activeIndex="0" style="width:auto;height:100%">
	<div title="项目基本信息">
		<div class="nui-fit">
		 	<form id="form1" method="post" >
		 		<input class="nui-hidden" id="fileids">
		        <fieldset style="border:solid 1px #aaa;padding:3px;">
		        	<legend>基本信息</legend>
		        	<table style="table-layout:fixed;" id="table_file1">
				            <tr>
								<td align="right" style="width:160px">项目名称：</td>
								<td id="rdproject.projectName" style="width:250px"></td>
								<td align="right" style="width:160px">项目编号：</td>
								<td id="rdproject.projectno" style="width:250px" ></td>	
								<td align="right" style="width:160px">项目类型：</td>
								<td id="rdproject.projectType" style="width:250px"></td>
								
							</tr>
							<tr>
								<td align="right" style="width:160px">对应客户：</td>
								<td id="rdproject.custname" style="width:250px"></td>
								<td align="right" style="width:160px">受益部门：</td>
								<td id="omOrganization.orgname" style="width:250px"></td>
								<td align="right" style="width:160px">项目负责人：</td>
								<td id="rdproject.managername" style="width:250px"></td>
							</tr>
							<tr>
								<td align="right" style="width:160px">项目开始日期：</td>
								<td id="rdproject.startdate" style="width:250px"></td>
								<td align="right" style="width:160px">预计结束日期：</td>
								<td id="rdproject.expenddate" style="width:250px"></td>
								<td align="right" style="width:160px">项目结束日期：</td>
								<td id="rdproject.enddate" style="width:250px"></td>
							</tr>
							<tr>
								<td align="right" style="width:160px">项目内部状态：</td>
								<td id="rdproject.projectStatus" style="width:250px"></td>
								<td align="right" style="width:160px"> 项目外部状态：</td>
								<td  style="width:250px">
									<input class="nui-dictcombobox" dictTypeId="MIS_PROJOUTSTATUS"  style="width:90%" id="rdproject.outstatus" name="outstatus"/>
								</td>
								<td align="right" style="width:160px">对应商务合同编号：</td>
								<td id="rdproject.contnum" style="width:250px"></td>
							</tr>
							<tr>
								<td align="right" style="width:160px">项目成本类型：</td>
								<td id="rdproject.pcosttype" style="width:250px"></td>
								<td align="right" style="width:160px">外部成本开始日期：</td>
								<td id="rdproject.ocstartdate" style="width:250px"></td>
								<td align="right" style="width:160px">外部成本结束日期：</td>
								<td id="rdproject.ocenddate" style="width:250px"></td>
							</tr>
							
							<tr>
								<td align="right" style="width:160px">成本跟踪阈值：</td>
								<td id="rdproject.remindfz"  style="width:250px"></td>
								<td align="right" style="width:160px">是否超阈值：</td>
								<td id="rdproject.ispassfz"  style="width:250px"></td>
								<td align="right" style="width:160px">是否发送超阈值邮件：</td>
								<td id="rdproject.issendfzmail" style="width:250px"></td>
							</tr>
							<tr>
								<td align="right" style="width:160px">是否超预算：</td>
								<td id="rdproject.ispassbud"  style="width:250px"></td>
								<td align="right" style="width:160px">是否发送超预算邮件：</td>
								<td id="rdproject.issendbudmail"  style="width:250px"></td>
								<td align="right" style="width:160px">是否公共项目：</td>
								<td id="rdproject.isPublic" style="width:250px"></td>
							</tr>
							<tr>
								<td align="right" style="width:160px">当前预算版本号：</td>
								<td id="rdproject.cbversion" style="width:250px"></td>
								<td align="right" style="width:160px">项目创建申请人：</td>
								<td id="rdproject.createapplicant" style="width:250px"></td>
								<td align="right" style="width:160px">创建日期：</td>
								<td id="rdproject.createdate" style="width:250px"></td>
							</tr>
							<tr>
								<td align="right" style="width:160px">项目考勤规则：</td>
								<td id="rdproject.rulename"  style="width:250px"></td>
								<td align="right" style="width:160px" id="2">项目办公位置：</td>
								<td id="rdproject.checkplace" style="width:auto">
									<input class="nui-textbox" name="checkplace" id="checkplace" style="width:99%" onclick="chooseplace" allowInput="false"/>
									<input class="nui-hidden" id="longitude" name="longitude"/>
		 							<input class="nui-hidden" id="latitude" name="latitude"/>
								</td>
								<td align="right" style="width:160px">考核状态：</td>
								<td id="rdproject.checkstatus" style="width:250px" class = "asLabel"></td>
							</tr>
							<tr>
								<td align="right" style="width:160px">备注：</td>
								<td id="rdproject.remark" colspan="5" style="width:auto"><input class="nui-textarea" name="remark" id="remark" style="width:90%;height:50px"/></td>
							</tr>
		        	</table>
		        	<table style="width:100%;">
	            		<tr>
	                    	<td style="width:20%;" align="center">
				            	<a class="nui-button"  iconCls="icon-add" onclick="updateRdproject()" plain="true">保存</a>
				        	</td>
	                	</tr>
	             	</table>  
		        </fieldset>
	        </form>
	        </br>
	        <div class="nui-tabs" activeIndex="0">
	        	 <div title="项目有权的人员">
				<div class="nui-toolbar" id="id2" style="border-bottom:0;padding:0px;" >
				    <table style="width:auto;" >
				        <tr>
				            <td style="width:100%;">
				                <a class="nui-button" iconCls="icon-add" onclick="addRow()" plain="true">增加</a>
				                <a class="nui-button" iconCls="icon-add" onclick="saveRow()" plain="true">保存</a>
				                <a class="nui-button" iconCls="icon-remove" onclick="removeRow()" plain="true">删除</a>
			                </td>
			            </tr>
			        </table>           
			    </div>
		        <div id="datagrid22" class="nui-datagrid" style="width:auto;height:auto;" dataField="rdEmpProjs"  url="com.primeton.rdmgr.project.createApplication.queryRdEmpProjsInit.biz.ext"
 				allowResize="true" pageSize="20" allowCellEdit="true" allowCellSelect="true" multiSelect="true" editNextOnEnterKey="true" showPager="false">
	    			<div property="columns"> 
	    				<div type="checkcolumn"></div>           
	        			<div field="userid" displayField="empname" width="100" headerAlign="center">员工姓名
	        				<input property="editor" name="RdEmpProj.userid" id="userid" class="nui-buttonedit" onbuttonclick="showEmployee" showClose="false" required="true" allowInput="false"/>
	        			</div>                          
	        			<div field="projRole" width="100" headerAlign="center" renderer="dictprojRole">角色
	        				<input property="editor" name="RdEmpProj.projRole" id="projRole" property="editor" class="nui-dictcombobox" style="width:100%;" dictTypeId="PRD_ROLE"/>
	        			</div>
	        			<div field="beginDate" width="100" allowSort="true" dateFormat="yyyy-MM-dd" renderer="onDealDate" headerAlign="center">进入时间
	        				<input property="editor" name="RdEmpProj.beginDate" id="beginDate" property="editor" class="nui-datepicker" style="width:100px"/>
	        			</div>
	        			<div field="endDate" width="100" allowSort="true" dateFormat="yyyy-MM-dd" renderer="onDealDate" headerAlign="center">退出时间
	        				<input property="editor" name="RdEmpProj.endDate" id="endDate" property="editor" class="nui-datepicker" style="width:100px;"/>
	        			</div>
	        			<div field="pricetype" width="40" allowSort="true"  headerAlign="center" renderer="getPriceType">计价模式</div>
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
		        <div title="项目日志">
	        		<jsp:include page="/ame_common/operatLog.jsp?groupid=RD_PROJECT">
	        			<jsp:param name="relationid" value="<%=request.getParameter("projid")%>"/>
	        		</jsp:include>
	        	</div>
	        	<div title="项目附件">
	        		<jsp:include page="/ame_common/inputFile1.jsp"/>
	        	</div>
	        </div>
		</div>
	</div>
	<div title="项目损益查询">
		<form id="form2" method="post" >
       	<fieldset id="field1" style="border:solid 1px #aaa;padding:8px;">
	    <legend>项目基本信息</legend>         
	   		<div style="padding:8px;">
            	<table >
					<tr>
               	 	<td style="width:90px" align="right">项目名称:</td>
               	 	<td style="width:300px" id="projectName"></td>
                    <td style="width:90px" align="right">项目编号:</td>
                    <td style="width:140px" id="projectno"></td>
                    <td style="width:90px" align="right">当前阶段:</td>
                    <td style="width:200px" id="outstatus"></td>
                </tr>                  
                 <tr>
                	<td style="width:90px" align="right">所属客户:</td>
					<td style="width:300px" id="custname"></td>
					<td style="width:90px" align="right">受益销售:</td>
                    <td style="width:140px" id="sybm"></td>
					<td style="width:90px" align="right">合同编号:</td>
                    <td style="width:140px" id="contnum"></td>      
                </tr>
                <tr>
                    <td  style="width:90px" align="right">开始日期:</td>
                    <td style="width:300px" id="startdate"></td>
                    <td style="width:90px" align="right">计划结束日期:</td>
                    <td style="width:140px" id="expenddate"></td>
                    <td style="width:90px" align="right">项目创建日期:</td>
                    <td style="width:140px" id="createdate"></td>
                </tr>
                <tr>
                    <td style="width:90px" align="right">当前预算版本号:</td>
					<td style="width:300px" id="cbversion"></td>
					<td style="width:90px" align="right">预算评估日期:</td>
                    <td style="width:140px" id="budgetdate"></td>
					<td></td>
                </tr>
				</table>
        	</div>
	    </fieldset> 
	        <fieldset id="field2" style="border:solid 1px #aaa;padding:8px;">
            <legend>项目预算与执行损益对照表</legend>                       
            <div style="padding:8px;">
            <table style="table-layout:fixed;" style="border-collapse:collapse" bordercolor="#A8A8A8" border="1" cellspacing="0" id="table_file">
                <tr class="nui-toolbar">
               	 	<td style="padding-left:0px;width:140px">指标项</td>
                    <td style="width:160px" align="center">项目预算</td>          
					<td style="width:160px" align="center">项目执行</td>	
					<td style="width:160px" align="center">差异(执行-预算)</td>	            
                </tr>                  
                <tr >
                    <td style="padding-left:0px;width:140px">1.项目立项前已发生成本</td>
                    <td style="width:160px" align="right" id="pcosts"></td>
                    <td style="width:160px" align="right" id="pcosts1"></td>
                    <td style="width:160px" align="right" id="pcosts2"></td>
				</tr>
	            <tr >
                    <td style="padding-left:0px;width:140px">2.项目实施内部人力成本</td>
                    <td style="width:160px" align="right" id="pempcost"></td>
                    <td style="width:160px" align="right" id="pempcost1"></td>
                    <td style="width:160px" align="right" id="pempcost2"></td>
	            </tr>
	            <tr >
                    <td style="padding-left:0px;width:140px">3.项目实施直接费用成本</td>
                    <td style="width:160px" align="right" id="pdircost"></td>
                    <td style="width:160px" align="right" id="pdircost1"></td>
                    <td style="width:160px" align="right" id="pdircost2"></td>
	            </tr>
	             <tr >
                    <td style="padding-left:0px;width:140px">4.项目实施外包成本</td>
                    <td style="width:160px" align="right" id="poutcost"></td>
                    <td style="width:160px" align="right" id="poutcost1"></td>
                    <td style="width:160px" align="right" id="poutcost2"></td>
	            </tr>
	            <tr >
                    <td style="padding-left:0px;width:140px">5.项目外部采购</td>
                    <td style="width:160px" align="right" id="pconsultfee"></td>
                    <td style="width:160px" align="right" id="pconsultfee1"></td>
                    <td style="width:160px" align="right" id="pconsultfee2"></td>
	            </tr>
	             <tr >
                    <td style="padding-left:0px;width:140px">6.预计免费维护期成本</td>
                    <td style="width:160px" align="right" id="expfmaincost"></td>
                    <td style="width:160px" align="right" id="expfmaincost1"></td>
                    <td style="width:160px" align="right" id="expfmaincost2"></td>
	            </tr>
	             <tr >
                    <td style="padding-left:0px;width:140px">7.其他</td>
                    <td style="width:160px" align="right" id="othfee"></td>
                    <td style="width:160px" align="right" id="othfee1"></td>
                    <td style="width:160px" align="right" id="othfee2"></td>
	            </tr>
	            <tr>
                    <td style="padding-left:0px;width:140px">项目成本汇总</td>
                    <td style="width:160px" align="right" id="pcostsum"></td>
                    <td style="width:160px" align="right" id="pcostsum1"></td>
                    <td style="width:160px" align="right" id="pcostsum2"></td>
	            </tr>
            </table>
        	</div>
        </fieldset>   
    </form>        
    </div>
	</div>
</div>
    <script type="text/javascript">
		nui.parse();
    	var form = new nui.Form("form1");
    	var form2 = new nui.Form("form2");
    	var projectid = <%=request.getParameter("projid")%>;
    	var projorgid;
    	var groupid = 'RD_PROJECT';
    	var gaid22 = nui.get("datagrid22");
    	var gaid55 = nui.get("datagrid55");
		gaid22.load({"projectid":projectid});
		setData(projectid);
		setMesg(projectid);
		
		function getUrlParam(name) { 
			var reg = new RegExp("(^|&)" + name + "=([^&]*)(&|$)"); 
			var r = window.location.search.substr(1).match(reg); 
			if (r != null) 
			return unescape(r[2]); 
			return null; 
		}
		
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
	            	o = nui.decode(o);
	                form.setData(o);
	                form.setChanged(false);
	                projorgid = o.rdproject.finUnitId;
	                document.getElementById("rdproject.projectName").innerHTML = o.rdproject.projectName == null ?"":o.rdproject.projectName;
	                document.getElementById("rdproject.projectno").innerHTML = o.rdproject.projectno == null ?"":o.rdproject.projectno;
	                document.getElementById("omOrganization.orgname").innerHTML = o.rdproject.orgname == null ?"":o.rdproject.orgname;
	                document.getElementById("rdproject.projectType").innerHTML = nui.getDictText('PROJECT_TYPE',o.rdproject.projectType);
	                document.getElementById("rdproject.projectStatus").innerHTML = nui.getDictText('MIS_PROJSTATUS',o.rdproject.projectStatus);
	                document.getElementById("rdproject.custname").innerHTML = o.rdproject.custname == null ?"":o.rdproject.custname;
	                document.getElementById("rdproject.managername").innerHTML = o.rdproject.managername == null ?"":o.rdproject.managername;
	                document.getElementById("custname").innerHTML = o.rdproject.custname == null ?"":o.rdproject.custname;
	                document.getElementById("rdproject.remindfz").innerHTML = o.rdproject.remindfz == null ?"":o.rdproject.remindfz+'元';
	                document.getElementById("rdproject.startdate").innerHTML = o.rdproject.startdate == null ?"":o.rdproject.startdate;
	                document.getElementById("rdproject.expenddate").innerHTML = o.rdproject.expenddate == null ?"":o.rdproject.expenddate;
	                document.getElementById("rdproject.enddate").innerHTML = o.rdproject.enddate == null ?"":o.rdproject.enddate;
	                document.getElementById("rdproject.isPublic").innerHTML = nui.getDictText('ABF_YESORNO',o.rdproject.isPublic);
	                document.getElementById("rdproject.ispassfz").innerHTML = o.rdproject.ispassfz == null ?"":nui.getDictText('ABF_YESORNO',o.rdproject.ispassfz);;
	                document.getElementById("rdproject.issendfzmail").innerHTML = o.rdproject.issendfzmail == null ?"":nui.getDictText('ABF_YESORNO',o.rdproject.issendfzmail);;
	                document.getElementById("rdproject.ispassbud").innerHTML = o.rdproject.ispassbud == null ?"":nui.getDictText('ABF_YESORNO',o.rdproject.ispassbud);;
	                document.getElementById("rdproject.issendbudmail").innerHTML = o.rdproject.issendbudmail == null ?"":nui.getDictText('ABF_YESORNO',o.rdproject.issendbudmail);;
	                document.getElementById("rdproject.cbversion").innerHTML = o.rdproject.cbversion == null ?"":o.rdproject.cbversion;
	                document.getElementById("rdproject.pcosttype").innerHTML = nui.getDictText('AME_PCOSTTYPE',o.rdproject.pcosttype);
	                document.getElementById("rdproject.contnum").innerHTML = o.rdproject.contnum == null ?"":o.rdproject.contnum;
	                document.getElementById("rdproject.rulename").innerHTML = o.rdproject.rulename == null ?"":o.rdproject.rulename;
	                document.getElementById("rdproject.checkstatus").innerHTML = o.rdproject.checkstatus == null ?"":nui.getDictText('PROJ_CHECK',o.rdproject.checkstatus);
	                document.getElementById("rdproject.createdate").innerHTML = o.rdproject.createdate == null ?"":o.rdproject.createdate;
	                document.getElementById("contnum").innerHTML = o.rdproject.contnum == null ?"":o.rdproject.contnum;
	                nui.get('checkplace').setValue(o.rdproject.checkplace);
	                nui.get('longitude').setValue(o.rdproject.longitude);
	                nui.get('latitude').setValue(o.rdproject.latitude);
	                nui.get('remark').setValue(o.rdproject.remark);
	                nui.get('rdproject.outstatus').setValue(o.rdproject.outstatus);
	                
	                var orgname = o.rdproject.orgname;
	                var custname = o.rdproject.custname;
	                var projectName = o.rdproject.projectName;
	                var startdate = o.rdproject.startdate;
	                var projectId = o.rdproject.projectId; 
	                var projectno = o.rdproject.projectno;
	                //项目成本
	                var tabs1 =nui.get("tabs1");
					var tab_bb = {name: "tab_service", id: "tab_service", title: "项目成本执行跟踪",url:"<%=request.getContextPath() %>/ame_budget/prjWeekCost.jsp?projectId="+projectId+"&projectno="+projectno+"&startdate="+startdate+"&projectName="+projectName+"&custname="+custname+"&orgname="+orgname};//服务成本页面

					if(!tabs1.getTab("tab_service")){
						tabs1.addTab(tab_bb,2);
					}
					var json = "";
					json = nui.encode({projectid: projectid});
					form2.loading("数据加载中...");
			    	nui.ajax({
			            url: "com.primeton.eos.ame_budget.ame_budget.getPropl.biz.ext",
						type: 'POST',
						data: json,	
						contentType: 'text/json',
			            success: function (o) {
			            	form2.unmask();
			            	var pnetincomeTemp="";
			            	var pconsultfeeTemp="";
			            	var psubfeeTemp="";
			            	var projectno="";
			        		document.getElementById("startdate").innerHTML = o.rdProject.startdate == null ? "" : o.rdProject.startdate;
			        		document.getElementById("sybm").innerHTML = o.rdProject.omOrganization.orgname == null ? "" : o.rdProject.omOrganization.orgname;
			        		document.getElementById("cbversion").innerHTML = o.rdProject.cbversion == null ? "" : o.rdProject.cbversion;
			        		document.getElementById("expenddate").innerHTML = o.rdProject.expenddate == null ? "" : o.rdProject.expenddate;
			        		document.getElementById("budgetdate").innerHTML = o.rdProject.budgetdate == null ? "" : o.rdProject.budgetdate;
			            	document.getElementById("expenddate").innerHTML = o.rdProject.expenddate == null ? "" : o.rdProject.expenddate;
			            	document.getElementById("projectName").innerHTML = o.rdProject.projectName == null ? "" : o.rdProject.projectName;
			            	document.getElementById("createdate").innerHTML = o.rdProject.createdate == null ? "" : o.rdProject.createdate;
			            	document.getElementById("projectno").innerHTML = o.rdProject.projectno == null ? "" : o.rdProject.projectno;
			            	projectno = o.rdProject.projectno == null ? "" : o.rdProject.projectno;
			            	document.getElementById("outstatus").innerHTML = o.rdProject.outstatus == null ? "" : nui.getDictText('MIS_PROJOUTSTATUS',o.rdProject.outstatus);
							if(o.budget1.pcostsum){
								document.getElementById("pcostsum1").innerHTML = formatNumber(o.budget1.pcostsum,'#,##');
							}else{
								document.getElementById("pcostsum1").innerHTML = 0;
							}
							if(o.budget1.pcosts){
								document.getElementById("pcosts1").innerHTML = formatNumber(o.budget1.pcosts,'#,##');
							}else{
								document.getElementById("pcosts1").innerHTML = 0;
							}
							if(o.budget1.pempcost){
								document.getElementById("pempcost1").innerHTML = "<a href='javascript:void(0)' onclick='checkDetail1();' title='点击查看'>"+ formatNumber(o.budget1.pempcost,'#,##') +"</a>";
							}else{
								document.getElementById("pempcost1").innerHTML = 0;
							}
							if(o.budget1.pdircost){
								document.getElementById("pdircost1").innerHTML = "<a href='javascript:void(0)' onclick='checkDetail4();' title='点击查看'>"+ formatNumber(o.budget1.pdircost,'#,##') +"</a>";
							}else{
								document.getElementById("pdircost1").innerHTML = 0;
							}
							if(o.budget1.poutcost){
								document.getElementById("poutcost1").innerHTML = "<a href='javascript:void(0)' onclick='checkDetail2();' title='点击查看'>"+ formatNumber(o.budget1.poutcost,'#,##') +"</a>";
								/* document.getElementById("poutcost1").innerHTML = formatNumber(o.budget1.poutcost,'#,##'); */
							}else{
								document.getElementById("poutcost1").innerHTML = 0;
							}
							if(o.budget1.pconsultfee){
								pconsultfeeTemp=o.budget1.pconsultfee;
								document.getElementById("pconsultfee1").innerHTML = "<a href='javascript:void(0)' onclick='checkDetail3();' title='点击查看'>"+ formatNumber(pconsultfeeTemp,'#,##') +"</a>";
							}else{
								document.getElementById("pconsultfee1").innerHTML = 0;
								pconsultfeeTemp=0;
							}
							if(o.budget1.expfmaincost){
								document.getElementById("expfmaincost1").innerHTML = formatNumber(o.budget1.expfmaincost,'#,##');
							}else{
								document.getElementById("expfmaincost1").innerHTML = 0;
							}
							if(o.budget1.othfee){
								document.getElementById("othfee1").innerHTML = formatNumber(o.budget1.othfee,'#,##');
							}else{
								document.getElementById("othfee1").innerHTML = 0;
							}
							document.getElementById("pcostsum").innerHTML = o.budget.pcostsum == null ?"":formatNumber(o.budget.pcostsum,'#,##');
							document.getElementById("pcosts").innerHTML = o.budget.pcosts == null ?"":formatNumber(o.budget.pcosts,'#,##');
							document.getElementById("pempcost").innerHTML = o.budget.pempcost == null ?"":formatNumber(o.budget.pempcost,'#,##');
							document.getElementById("pdircost").innerHTML = o.budget.pdircost == null ?"":formatNumber(o.budget.pdircost,'#,##');
							document.getElementById("pconsultfee").innerHTML = o.budget.pconsultfee == null ?"":formatNumber(o.budget.pconsultfee,'#,##');
							document.getElementById("poutcost").innerHTML = o.budget.poutcost == null ?"":formatNumber(o.budget.poutcost,'#,##');
							document.getElementById("expfmaincost").innerHTML = o.budget.expfmaincost == null ?"":formatNumber(o.budget.expfmaincost,'#,##');
							document.getElementById("othfee").innerHTML = o.budget.othfee == null ?"":formatNumber(o.budget.othfee,'#,##');
							var pcostsum1=o.budget1.pcostsum == null ?"0":o.budget1.pcostsum;
							var pcostsum=o.budget.pcostsum ==null ?"0":o.budget.pcostsum;
							var pcostsum2=parseInt(pcostsum1)-parseInt(pcostsum);
							
							var pcosts1=o.budget1.pcosts == null ?"0":o.budget1.pcosts;
							var pcosts=o.budget.pcosts ==null ?"0":o.budget.pcosts;
							var pcosts2=parseInt(pcosts1)-parseInt(pcosts);
							
							var pempcost1=o.budget1.pempcost == null ?"0":o.budget1.pempcost;
							var pempcost=o.budget.pempcost ==null ?"0":o.budget.pempcost;
							var pempcost2=parseInt(pempcost1)-parseInt(pempcost);
							
							var pdircost1=o.budget1.pdircost == null ?"0":o.budget1.pdircost;
							var pdircost=o.budget.pdircost ==null ?"0":o.budget.pdircost;
							var pdircost2=parseInt(pdircost1)-parseInt(pdircost);
							
							var poutcost1=o.budget1.poutcost == null ?"0":o.budget1.poutcost;
							var poutcost=o.budget.poutcost ==null ?"0":o.budget.poutcost;
							var poutcost2=parseInt(poutcost1)-parseInt(poutcost);
							
							var pconsultfee1=o.budget1.pconsultfee == null ?"0":o.budget1.pconsultfee;
							var pconsultfee=o.budget.pconsultfee ==null ?"0":o.budget.pconsultfee;
							var pconsultfee2=parseInt(pconsultfee1)-parseInt(pconsultfee);
							
							var expfmaincost1=o.budget1.expfmaincost == null ?"0":o.budget1.expfmaincost;
							var expfmaincost=o.budget.expfmaincost ==null ?"0":o.budget.expfmaincost;
							var expfmaincost2=parseInt(expfmaincost1)-parseInt(expfmaincost);
							
							var othfee1=o.budget1.othfee == null ?"0":o.budget1.othfee;
							var othfee=o.budget.othfee ==null ?"0":o.budget.othfee;
							var othfee2=parseInt(othfee1)-parseInt(othfee);
							
							document.getElementById("pcostsum2").innerHTML = pcostsum2 == null ?"":formatNumber(pcostsum2,'#,##');
							document.getElementById("pcosts2").innerHTML = pcosts2 == null ?"":formatNumber(pcosts2,'#,##');
							document.getElementById("pempcost2").innerHTML = pempcost2 == null ?"":formatNumber(pempcost2,'#,##');
							document.getElementById("pdircost2").innerHTML = pdircost2 == null ?"":formatNumber(pdircost2,'#,##');
							document.getElementById("poutcost2").innerHTML = poutcost2 == null ?"":formatNumber(poutcost2,'#,##');
							document.getElementById("pconsultfee2").innerHTML = pconsultfee2 == null ?"":formatNumber(pconsultfee2,'#,##');
							document.getElementById("expfmaincost2").innerHTML = expfmaincost2 == null ?"":formatNumber(expfmaincost2,'#,##');
							document.getElementById("othfee2").innerHTML = othfee2 == null ?"":formatNumber(othfee2,'#,##');
						}
					});
				}
	     });
	}	
	
	function chooseplace(){
		var checkplace=nui.get("checkplace").getValue();
		var longitude=nui.get("longitude").getValue();
		var latitude=nui.get("latitude").getValue();
		nui.open({
			url:"<%=request.getContextPath() %>/ame_common/attendance/baiduMap.jsp?longitude="+longitude+"&latitude="+latitude+"&suggestId="+checkplace,
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
	
	
	function updateRdproject(){
		var checkplace = nui.get('checkplace').getValue();
		var longitude = nui.get("longitude").getValue();
        var latitude = nui.get("latitude").getValue();
		var remark = nui.get('remark').getValue();
		var outstatus = nui.get('rdproject.outstatus').getValue();
		var json = nui.encode({rdproject:{projectId:projectid,longitude:longitude,latitude:latitude,checkplace:checkplace,remark:remark,outstatus:outstatus}});
		nui.ajax({
			url: "com.primeton.rdmgr.project.benefitToBenefitProject.updateRdProjectById.biz.ext",
			type: 'POST',
			data: json,	
			contentType: 'text/json',
            success: function (o) {
            	if(o.result == "1"){
            		alert("保存失败！");
            	}else{
            		alert("保存成功！");
            		//setData(projectid);
            	}
            }
		});
	
	}
	
	
	
	<!--项目成本汇总-->
	
	
	//合同列表点击金额赋值项目Id
	
	function dictstatus(e) {
		return nui.getDictText('MIS_BUDSTATUS',e.value);//设置业务字典值
	}
	function dictversion(e) {
		return nui.getDictText('MIS_YN',e.value);//设置业务字典值
	}
	function checkDetail4(){
		var executeUrl = "/default/ame_budget/detailPdircost.jsp?id=" + projectid;
		window.open(executeUrl, "应用详细信息", "fullscreen=1");
    }
    function checkDetail1(){
		var executeUrl = "/default/ame_budget/detailPempcost.jsp?id=" + projectid;
		window.open(executeUrl, "应用详细信息", "fullscreen=1");
    }
    function checkDetail2(){
    	projectno = document.getElementById("rdproject.projectno").innerHTML;
		var executeUrl = "/default/ame_budget/detailPoutcost.jsp?id=" + projectno+"&costtype="+1;
		window.open(executeUrl, "应用详细信息", "width=900px,height=700px","resizable=yes");
    }
    function checkDetail3(){
    	projectno = document.getElementById("rdproject.projectno").innerHTML;
		var executeUrl = "/default/ame_budget/detailPoutcost.jsp?id=" + projectno+"&costtype="+0;
		window.open(executeUrl, "应用详细信息", "width=900,height=700","resizable=yes");
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
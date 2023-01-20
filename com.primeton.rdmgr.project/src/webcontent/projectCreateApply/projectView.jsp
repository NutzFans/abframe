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
 	<form id="form1" method="post" >
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
						<td align="right" style="width:160px">对应商务合同编号：</td>
						<td id="rdproject.contnum" style="width:250px" class = "asLabel"></td>
					</tr>
					<tr>
						<td align="right" style="width:160px">实施责任部门：</td>
						<td id="rdproject.managerdept" style="width:250px" class = "asLabel"></td>
						<td align="right" style="width:160px">项目经理：</td>
						<td id="rdproject.manager" style="width:250px" class = "asLabel"></td>
						<td align="right" style="width:160px">是否延续性项目：</td>
						<td id="rdproject.isconproj" style="width:250px" class = "asLabel"></td>
					</tr>
					<tr>
						<td align="right" style="width:160px">项目操作状态：</td>
						<td id="rdproject.projectStatus" style="width:250px" class = "asLabel"></td>
						<td align="right" style="width:160px"> 项目商务状态：</td>
						<td  style="width:250px" id="rdproject.outstatus" class = "asLabel"></td>
						<td align="right" style="width:160px"> 项目交付状态：</td>
						<td  style="width:250px" id="rdproject.projectDestatus" class = "asLabel"></td>
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
						<td align="right" style="width:160px">创建日期：</td>
						<td id="rdproject.createdate" style="width:250px" class = "asLabel"></td>
						
					</tr>
					<tr>
						<td align="right" style="width:160px">预计合同金额：</td>
						<td id="rdproject.expcontsum"  style="width:250px" class = "asLabel"></td>
						<td align="right" style="width:160px">商机来源：</td>
						<td id="rdproject.bosource"  style="width:250px" class = "asLabel"></td>
						<td align="right" style="width:160px">合同预计签订日期：</td>
						<td id="rdproject.contplandate"  style="width:250px" class = "asLabel"></td>
					</tr>
					<tr>
						<td align="right" style="width:160px">实施城市：</td>
						<td id="rdproject.implemnetcity" style="width:250px" class = "asLabel"></td>
						<td align="right" style="width:160px">考核状态：</td>
						<td id="rdproject.checkstatus" style="width:250px" class = "asLabel"></td>
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
        
        <fieldset style="border:solid 1px #aaa;padding:3px;" >
	        <legend>项目有权的人员</legend>
	        <div id="datagrid22" class="nui-datagrid" style="width:auto;height:auto;" dataField="rdEmpProjs"  url="com.primeton.rdmgr.project.createApplication.queryRdEmpProjsInit.biz.ext"
	 			allowResize="true" pageSize="20" allowCellEdit="true" allowCellSelect="true" multiSelect="true" editNextOnEnterKey="false" showPager="false">
		    	<div property="columns"> 
		        	<div field="userid" displayField="empname" width="100" headerAlign="center">员工姓名</div>
		        	<div field="pricetype" width="40" allowSort="true"  headerAlign="center" renderer="getPriceType">计价模式</div>                          
		        	<div field="projRole" width="100" headerAlign="center" renderer="dictprojRole">角色</div>
	    			<div field="beginDate" width="100" allowSort="true" dateFormat="yyyy-MM-dd" headerAlign="center">进入时间</div>
	    			<div field="endDate" width="100" allowSort="true" dateFormat="yyyy-MM-dd" headerAlign="center">退出时间</div>
				</div>
			</div>
        </fieldset>
        
        <fieldset style="border:solid 1px #aaa;padding:3px;" >
	        <legend>审批意见列表</legend>
        	<div id="datagrid1" class="nui-datagrid" style="width:100%;height:auto;" dataField="misOpinions"
			    url="com.primeton.eos.ame_pur.purContractProcess.queryAuditOpinions.biz.ext"  idField="id" allowResize="true"
			    allowAlternating="true" multiSelect="true" showPager="false" allowCellWrap="true">
			    <div property="columns">
			    	<div type="indexcolumn" headerAlign="center" width="30" >编号</div>
			        <div field="operatorname" width="50" headerAlign="center" align="center">处理人</div>
			        <div field="workitemname" width="80" align="center" headerAlign="center">处理环节</div>
			        <div field="auditstatus" renderer="onCheckRenderer" width="80" align="center" headerAlign="center">处理结果</div>
			        <div field="auditopinion" width="150" headerAlign="center">处理意见</div>
			        <div field="time" width="100" headerAlign="center" align="center" dateFormat="yyyy-MM-dd HH:mm:ss">处理时间</div>
			        <div field="orgname" width="100" align="center" headerAlign="center">处理人所在机构</div>
			    </div>
			</div>
	    </fieldset>
    </form>
</div>
    <script type="text/javascript">
		nui.parse();
    	var form = new nui.Form("form1");
    	var gaid22 = nui.get("datagrid22");
    	var processInstID = <%=request.getParameter("processInstID")%>;
		setData();
	    
	    function onCheckRenderer(e) {
			return nui.getDictText('MIS_AUDITSTATUS',e.value);
		}
		function getPriceType(e){
			return nui.getDictText('MIS_PRICETYPE',e.value);
		}
		function dictprojRole(e){
			return nui.getDictText('PRD_ROLE',e.value);
		}
		
		<!--基本信息	-->										  
        function setData(){        
        	var json = nui.encode({processinstid:processInstID});
        	nui.ajax({
	            url: "com.primeton.rdmgr.project.benefitToBenefitProject.getProjectMessage.biz.ext",
				type: 'POST',
				data: json,	
				contentType: 'text/json',
	            success: function (o) {
	            	o = nui.decode(o);
	                form.setData(o);
	                form.setChanged(false);
	                document.getElementById("rdproject.projectName").innerHTML = o.rdproject.projectName == null ?"":o.rdproject.projectName;
	                document.getElementById("rdproject.projectno").innerHTML = o.rdproject.projectno == null ?"":o.rdproject.projectno;
	                document.getElementById("omOrganization.orgname").innerHTML = o.rdproject.orgname == null ?"":o.rdproject.orgname;
	                document.getElementById("rdproject.projectType").innerHTML = nui.getDictText('PROJECT_TYPE',o.rdproject.projectType);
	                document.getElementById("rdproject.projectStatus").innerHTML = nui.getDictText('MIS_PROJSTATUS',o.rdproject.projectStatus);
	                document.getElementById("rdproject.outstatus").innerHTML = nui.getDictText('MIS_PROJOUTSTATUS',o.rdproject.outstatus);
	                document.getElementById("rdproject.custname").innerHTML = o.rdproject.custname == null ?"":o.rdproject.custname;
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
	                document.getElementById("rdproject.contnum").innerHTML = o.rdproject.contnum == null ?"":o.rdproject.contnum;
	                document.getElementById("rdproject.rulename").innerHTML = o.rdproject.rulename == null ?"":o.rdproject.rulename;
	                document.getElementById("rdproject.remark").innerHTML = o.rdproject.remark == null ?"":o.rdproject.remark;
	                document.getElementById("rdproject.createdate").innerHTML = o.rdproject.createdate == null ?"":o.rdproject.createdate;
					document.getElementById("rdproject.checkplace").innerHTML = o.rdproject.checkplace == null ?"":o.rdproject.checkplace;
					document.getElementById("rdproject.implemnetcity").innerHTML = o.rdproject.implemnetcity == null ?"":nui.getDictText('AREA4CLRY',o.rdproject.implemnetcity);
					document.getElementById("rdproject.managerdept").innerHTML = o.rdproject.managerdeptname == null ?"":o.rdproject.managerdeptname;
					document.getElementById("rdproject.manager").innerHTML = o.rdproject.managername == null ?"":o.rdproject.managername;
					document.getElementById("rdproject.isconproj").innerHTML = nui.getDictText('MIS_YN',o.rdproject.isconproj);
					document.getElementById("rdproject.ocstartdate").innerHTML = o.rdproject.ocstartdate == null ?"":o.rdproject.ocstartdate;
					document.getElementById("rdproject.ocenddate").innerHTML = o.rdproject.ocenddate == null ?"":o.rdproject.ocenddate;
					document.getElementById("rdproject.checkstatus").innerHTML = o.rdproject.checkstatus == null ?"":nui.getDictText('PROJ_CHECK',o.rdproject.checkstatus);
					document.getElementById("rdproject.createapplicant").innerHTML = o.rdproject.createapplicantname == null ?"":o.rdproject.createapplicantname;
					document.getElementById("rdproject.expcontsum").innerHTML = o.rdproject.expcontsum == null ?"":o.rdproject.expcontsum;
					document.getElementById("rdproject.bosource").innerHTML = o.rdproject.bosource == null ?"":nui.getDictText('AME_BOSOURCE',o.rdproject.bosource);
					document.getElementById("rdproject.projectDestatus").innerHTML = o.rdproject.projectDestatus == null ?"":nui.getDictText('MIS_PROJDESTATUS',o.rdproject.projectDestatus);
					document.getElementById("rdproject.contplandate").innerHTML = o.rdproject.contplandate == null ?"":o.rdproject.contplandate;
					
					var grid = nui.get("datagrid1");
					if(o.rdproject.processinstid!=null&&o.rdproject.processinstid!=""){
						grid.load({processInstID:o.rdproject.processinstid});
						grid.sortBy("time", "desc");
					}
					gaid22.load({"projectid":o.rdproject.projectId});
				}
	     });
	}	
	
   	</script>
</body>
</html>
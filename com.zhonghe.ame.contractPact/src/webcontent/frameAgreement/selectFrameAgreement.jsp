<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
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
 	<form id="form1" method="post">
					<input name="files" id="fileids" class="nui-hidden"/>
					<input name="id" id="id" class="nui-hidden"/>
<!-- 					<input name="expusername" id="expusername" class="nui-hidden"/> -->
<!-- 					<input name="senderusername" id="senderusername" class="nui-hidden"/> -->
<!-- 					<input id="empid" class="nui-hidden" /> -->
					<div style="padding: 5px;">
						<table style="table-layout: fixed;">
							<tr>
								<td class="form_label" align = "right"> 申请人</td>
									<td>
										<input name="createUserid" id="createUserid" class="nui-hidden" style="width: 200px"/>
										<input id="createUsername" class="nui-textbox" enabled="false" style="width: 200px" required="true"/>
									</td>
								<td align="right" style="width: 160px">合同实施部门：</td>
									<td >   
										<input name="implementOrg" id="implementOrg" shownullItem=ture class="nui-treeselect" textField="orgname" valueField="orgid" parentField="omOrganization.orgid" dataField="orgs" showTreeIcon="true" valueFromSelect="true" style="width:100%;" 
								     	url="com.zhonghe.ame.imptask.keytask.getAllRunOrgsforzdrw.biz.ext" allowInput="true" required="true" onvaluechanged="changeOrgForm(e)"
								     	multiSelect="false" checkRecursive = "false" enabled="false" expandOnLoad="0" showFolderCheckBox="true"/>
									</td>
									<td align="right" style="width:160px">申请日期：</td>
									<td><input id="createTime" name="createTime"  class="nui-datepicker" enabled="false" style="width: 200px"/></td>
							</tr>
							<tr>
								<td align="right" style="width: 160px">合同名称：</td>
									<td><input id="contractName" name="contractName" enabled="false" class="nui-textbox" style="width: 200px"/></td>
								<td align="right" style="width: 100px">协议金额（元）：</td>
									<td><input id="contractSum" name="contractSum" enabled="false" class="nui-textbox" style="width: 200px" /></td>	
									<td align="right" style="width: 160px">实施地点：</td>
									<td><input id="projectLocal" name="projectLocal" enabled="false" class="nui-textbox" style="width: 200px"/></td>
							</tr>
							<tr>
								<td align="right" style="width: 160px">签约方：</td>
									<td><input id="signatoryname" name="signatoryname" enabled="false" class="nui-textbox" style="width: 200px"/></td>
									<!-- <td><input id="signatory" name="signatory" enabled="false" class="nui-textbox" style="width: 200px"/></td> -->
								<td align="right" style="width: 160px">合同签约主体：</td>
								<td > 
									<input name="contractSubject" id="contractSubject" class="nui-dictcombobox" dictTypeId="ZH_INVOICE_NAME_TYPE" enabled="false" style="width: 200px;" />
								</td>
								
									<td align="right" style="width: 160px">标的规模：</td>
									<td><input id="projectSize" name="projectSize" enabled="false" class="nui-textbox" style="width: 200px"/></td>
							</tr>
							<tr>
								<td align="right" style="width:160px">合同起始日期：</td>
									<td><input id="startTime" name="startTime" enabled="false" class="nui-datepicker" style="width: 200px"/></td>
								<td align="right" style="width:160px">合同结束日期：</td>
									<td><input id="endTime" name="endTime" enabled="false" class="nui-datepicker" style="width: 200px"/></td>	
								
							</tr>
							<tr>
								
								<td align="right" style="width: 14%;">分公司会签部门领导：</td>
							    <td  >
									<input name="fDeptCountersignName" enabled="false"  id="fDeptCountersignName"  class="nui-textbox" width="100%"/>
								</td>
								<td align="right" style="width: 14%;">本部会签部门领导：</td>
								<td>
									<input name="zDeptCountersignName"  enabled="false" id="zDeptCountersignName"  class="nui-textbox" style="width: 200px"/>
								</td>
							</tr>
						</table>
					</div>
				</form>
				<div title="相关附件">
					<jsp:include page="/ame_common/detailFile.jsp"/>
				</div>
		</div>



	
	<script type="text/javascript">
         nui.parse();
    	var form = new nui.Form("#form1");
   		var processid = <%=request.getParameter("processInstID")%>;

		 setData();
		 function setData(){ 
		 	 
		 	var data = {processid:processid};            
        	var json = nui.encode(data);        	
        	nui.ajax({
	            url: "com.zhonghe.ame.contractPact.frameAgreement.getFrameAgreementMessage.biz.ext",
				type: 'POST',
				data: json,	
				contentType: 'text/json',
	            success: function (o) {
	            	o = nui.decode(o);
	                form.setData(o.frameAgreement);
	                console.log(o);
	                console.log(o.empname);
	                nui.get("createUsername").setValue(o.frameAgreement.empname);
	                var grid_0 = nui.get("grid_0");
        				grid_0.load({"groupid":"ZH_CONTRACTFEAME","relationid":o.frameAgreement.id});
						grid_0.sortBy("fileTime","desc");
				},
				error: function (jqXHR, textStatus, errorThrown) {
				        alert(jqXHR.responseText);
			    }
	     });
	}

        
         


    </script>
  </body>
</html>

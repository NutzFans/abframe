<%@page pageEncoding="UTF-8"%>
<%@include file="/common.jsp"%>
<%
	//获取标签中使用的国际化资源信息
	String pnHave=com.eos.foundation.eoscommon.ResourcesMessageUtil.getI18nResourceMessage("orgSubMaintain_l_title_pnHave");
	String pnHavenot=com.eos.foundation.eoscommon.ResourcesMessageUtil.getI18nResourceMessage("orgSubMaintain_l_title_pnHavenot");

	String pnHave_acRole_roleid=com.eos.foundation.eoscommon.ResourcesMessageUtil.getI18nResourceMessage("orgSubMaintain_pnHave.acRole.roleid");
	String pnHave_acRole_rolename=com.eos.foundation.eoscommon.ResourcesMessageUtil.getI18nResourceMessage("orgSubMaintain_pnHave.acRole.rolename");
	String pnHave_acRole_appname=com.eos.foundation.eoscommon.ResourcesMessageUtil.getI18nResourceMessage("orgSubMaintain_pnHave.acRole.appname");

	String pnHavenot_roleid=com.eos.foundation.eoscommon.ResourcesMessageUtil.getI18nResourceMessage("orgSubMaintain_pnHavenot.roleid");
	String pnHavenot_rolename=com.eos.foundation.eoscommon.ResourcesMessageUtil.getI18nResourceMessage("orgSubMaintain_pnHavenot.rolename");
	String pnHavenot_appname=com.eos.foundation.eoscommon.ResourcesMessageUtil.getI18nResourceMessage("orgSubMaintain_pnHavenot.appname");
%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<title>Title</title>
<script>
	function custInit(){
		registerEvent();
	}	
	function registerEvent() {	
		//1.
		$id("dcHave").beforeDel = function(row){
			return window.confirm("<b:message key='orgSubMaintain_l_m_alert_isRmvCurRow' />");
		}
		$id("dcHave").afterDel = function(){
			$id("dcHave").submit();
		}
		$id("dcHave").afterSubmit = function(){
			$id("dcHavenot").reload();
		}	
	
		//2.
		$id("dcHavenot").beforeDel = function(row){
			return window.confirm("<b:message key='orgSubMaintain_l_m_alert_isRmvCurRow' />");
		}
		$id("dcHavenot").afterDel = function(){
			$id("dcHavenot").submit();
		}	
		$id("dcHavenot").afterSubmit = function(){
			$id("dcHave").reload();
		}
	}
	function rtnSelectVal() {
		var len = $id("dcHave").table.tBodies[0].rows.length;
		var sroleid="";
		var srolename="";
		var cell;
		var value="";	
		for (var r=0; r<len; r++){
			cell = $id("dcHave").getCell(r,0); //行号，列号都从0开始, 但列也可写单元格的name名称"acRole/roleid"
			value=$id("dcHave").getCellValue(cell);
			sroleid += value+",";
			cell = $id("dcHave").getCell(r,1); 
			value=$id("dcHave").getCellValue(cell);			
			srolename += value+",";
        }
		sroleid = sroleid.substr(0, (sroleid.length-1)); 
		srolename = srolename.substr(0, (srolename.length-1));
		returnValue = [ sroleid,srolename ];
		window.close();
	}		
 
</script>

</head>
<body>

<table align="left" border="0" height="100%" width="100%">
	<tr>
		<td width="100%" valign="top">
			<w:panel id="pnHave" title="<%=pnHave %>">
				<h:form id="qfHave">
					<input type="hidden" name="oOperrole/acOperator/operatorid" value='<b:write property="lOperatorid" propertyType="parameter"/>'/>			 
					<h:hidden name="oEmp/empid" property="userObject/attributes/empid" scope="s"/>
				</h:form> 
				<r:datacell id="dcHave" rowStyleClass="rowclass2" rowEvenStyleClass="rowclass1" showIndex="false"
					queryAction="org.gocom.abframe.org.party.PartyManager.queryEmployeeRole.biz" paramFormId="qfHave"
					xpath="oaOperrole" submitXpath="oOperrole" width="100%" height="100" pageSize="10" pageSizeList="10,20,30" 
					submitAction="org.gocom.abframe.org.party.PartyManager.saveOperrole.biz" >

					<r:toolbar tools="nav,edit:del reload,info" location="top" />
					<r:field fieldName="acRole/roleid" label="<%=pnHave_acRole_roleid%>" sortAt="client" width="0" /> 
					<r:field fieldName="acRole/rolename" label="<%=pnHave_acRole_rolename%>" /> 
					<r:field fieldName="appname" label="<%=pnHave_acRole_appname%>" /> 
				</r:datacell>
			</w:panel>
		</td>
	</tr>
	<tr>			
		<td width="100%" valign="top">
			<w:panel id="pnHavenot" title="<%=pnHavenot %>">
				<h:form id="qfHavenot">
					<input type="hidden" name="oPartyroleHavenot/partyid" value='<b:write property="emp/empid" propertyType="parameter"/>' />	
					<h:hidden name="oPartyroleHavenot/partytype" value="employee"/>
					<h:hidden name="user/empid" property="userObject/attributes/empid" scope="s"/>				
					<h:hidden name="user/operatorid" property="userObject/attributes/operatorid" scope="s"/>				
					<h:hidden name="user/userid" property="userObject/userId" scope="s"/>
				</h:form>  
				<r:datacell id="dcHavenot" rowStyleClass="rowclass2" rowEvenStyleClass="rowclass1" showIndex="false"
					queryAction="org.gocom.abframe.org.party.PartyManager.queryOperroleHavenot.biz" paramFormId="qfHavenot"
					xpath="oaPartyroleHavenot" width="100%" height="100" pageSize="10" pageSizeList="10,20,30" 
					submitAction="org.gocom.abframe.org.party.PartyManager.savePartyroleHavenot.biz" >

					<r:toolbar tools="nav,edit:del reload,info" location="top" />
					<r:field fieldName="roleid" label="<%=pnHavenot_roleid%>" sortAt="client" width="0" /> 
					<r:field fieldName="rolename" label="<%=pnHavenot_rolename%>" /> 
					<r:field fieldName="appname" label="<%=pnHavenot_appname%>" /> 
				</r:datacell> 
			
			</w:panel>
		</td>
	</tr>

	<tr class="form_bottom">
        <td colspan="1">
          <input type="button" class="button" value="<b:message key="l_close" />" onclick="javascript:rtnSelectVal();">
        </td>
	</tr>
					
</table>
</body>
</html>

<script>
	eventManager.add(window,"load",custInit);		
</script>
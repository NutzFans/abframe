<%@page pageEncoding="UTF-8"%>
<%@include file="/common.jsp"%>

<html>
<body leftmargin="0" topmargin="0" rightmargin="0">
<%
	String defaultTab="orgEdit";
	if(com.eos.foundation.data.DataContextUtil.getBoolean("isQuerySelected")){
	defaultTab="orgQuery";
	};	
	if("true".equals(com.eos.foundation.data.DataContextUtil.getString("isBusidomain"))){
	defaultTab="busidomainEdit";
	};	
	
	//获取标签中使用的国际化资源信息
	String theBusiorg=com.eos.foundation.eoscommon.ResourcesMessageUtil.getI18nResourceMessage("bizOrgManager_l_the_busiorg");
	String theBusidomain=com.eos.foundation.eoscommon.ResourcesMessageUtil.getI18nResourceMessage("bizOrgManager_l_the_busidomain");
	String subBusiorg=com.eos.foundation.eoscommon.ResourcesMessageUtil.getI18nResourceMessage("bizOrgManager_l_sub_busiorg");

 %>
<w:tabPanel bodyStyle="" defaultTab="<%=defaultTab%>" height="100%" id="orgInfo" titleStyle="" width="100%">
  
<l:equal property="isBusidomain" targetValue="false" compareType="string"  >  
  <w:tabPage cache="false" id="orgEdit" tabType="iframe" title="<%=theBusiorg%>" url="org.gocom.abframe.org.busiorg.BusiOrgManager.flow"><!--本业务机构 -->
   <h:param name="_eosFlowAction" value="updateBusiorg"/>
   <h:param name="org/busiorgid" property="org/busiorgid"/>
  </w:tabPage>
</l:equal>  

<l:equal property="isBusidomain" targetValue="true" compareType="string"  >  
  <w:tabPage cache="false" id="busidomainEdit" tabType="iframe" title="<%=theBusidomain%>" url="org.gocom.abframe.org.busiorg.BusiOrgManager.flow"><!--本业务套别 -->
   <h:param name="_eosFlowAction" value="updateBusidomain"/>
   <h:param name="org/busiorgid" property="org/busiorgid"/>
  </w:tabPage>
</l:equal> 
  
  
  <w:tabPage cache="false" id="orgQuery" tabType="iframe" title="<%=subBusiorg%>" url="org.gocom.abframe.org.busiorg.BusiOrgManager.flow"><!--下级业务机构 -->
  	<h:param name="_eosFlowAction" value="querySubBusiorg"/>
  	<h:param name="org/busiorgid" property="org/busiorgid"/>	
  </w:tabPage>

</w:tabPanel>

</body>
</html>
<%@page pageEncoding="UTF-8"%>
<%@include file="/common.jsp"%>

<html>
<head>
<title></title>

<%
    //配置业务日志
	String configLog = com.eos.foundation.eoscommon.ResourcesMessageUtil.getI18nResourceMessage("configManager_l_title_configLog");
	//请选择
	String pleaseSelect = com.eos.foundation.eoscommon.ResourcesMessageUtil.getI18nResourceMessage("l_pleaseSelect");
	//功能名称
	String funcname = com.eos.foundation.eoscommon.ResourcesMessageUtil.getI18nResourceMessage("portalManager_AcFunction.funcname");
	//选择功能
	String selectFunc = com.eos.foundation.eoscommon.ResourcesMessageUtil.getI18nResourceMessage("configManager_l_title_selectFunc");
	//应用名称
    String appname = com.eos.foundation.eoscommon.ResourcesMessageUtil.getI18nResourceMessage("configManager_AcApplication.appname");
    //输出类型
	String outputtype = com.eos.foundation.eoscommon.ResourcesMessageUtil.getI18nResourceMessage("configManager_atOperlogconfig.outputtype");
	//是否记录
	String islog = com.eos.foundation.eoscommon.ResourcesMessageUtil.getI18nResourceMessage("configManager_atOperlogconfig.islog");
	//调用类型
	String logevent = com.eos.foundation.eoscommon.ResourcesMessageUtil.getI18nResourceMessage("configManager_atOperlogconfig.logevent");
	//日志类型
	String logtype= com.eos.foundation.eoscommon.ResourcesMessageUtil.getI18nResourceMessage("configManager_atOperlogconfig.logtype");
%>

</head>
<body topmargin="0" leftmargin="0" style="overflow: auto;">
    <w:panel id="panel1" width="100%" title="<%=configLog %>">
        <table align="center" border="0" width="100%" class="form_table" cellpadding="0" cellspacing="0">
            <h:form id="queryForm">
            <tr>
	            <td class="form_label">
	               <b:message key="configManager_atOperlogconfig.logevent"></b:message><b:message key="l_colon"></b:message>
	            </td>
	            <td class="form_table">
	                 <d:select property="atOperlogconfig/logevent" style="width:130" dictTypeId="ABF_TRIGER_TIME" nullLabel="<%=pleaseSelect %>"></d:select>
	                 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
	                 <input type="button" class="button" value='<b:message key="l_query"/>' onclick="javascript:querySubmit();"/>
	            </td>
            </tr>
            </h:form>
        </table>
    </w:panel>
    <table border="0" width="100%" height="90%" cellpadding="0" cellspacing="0">
		<tr height="4%">
			<td class="eos-panel-title">&nbsp;&nbsp;<b:message key="configManager_l_title_logList"></b:message></td> 
		</tr>
		<tr>
			<td width="30%" height="100%" valign="top" class="eos-panel-body">
			    <r:datacell id="logConfig"
				    queryAction="org.gocom.abframe.tools.LogManager.queryAllLogConfig.biz"
				    xpath="configs"
				    width="100%"
				    height="100%"
				    pageSize="10"
				    pageSizeList="10,20,30" submitAction="org.gocom.abframe.tools.LogManager.saveLogConfig.biz" paramFormId="queryForm">
				    
				    <r:field fieldName="funcname" editId="lookupID" label="<%=funcname %>" width="155">			    
				        <w:lookup id="lookupID" validateAttr="allowNull=false" width="350" height="430" lookupUrl="/abframe/rights/application/app_tree.jsp"  dialogTitle="<%=selectFunc %>" readonly="true" onReturnFunc="returnFuncFir">
					    </w:lookup> 
				    </r:field>
				    <r:field fieldName="funccode" width="0" >
				    </r:field>
				    <r:field fieldName="appname" label="<%=appname %>" allowModify="false"  width="155">
				    </r:field>
				    <r:field fieldName="appid" width="0"></r:field>
				    <r:field fieldName="logtype" label="<%=logtype %>">
				        <d:select dictTypeId="ABF_LOG_TYPE" nullLabel="<%=pleaseSelect %>"></d:select>
				    </r:field>
				    <r:field fieldName="outputtype" label="<%=outputtype %>">
				        <d:select dictTypeId="ABF_OUTPUTTYPE" nullLabel="<%=pleaseSelect %>" ></d:select>
				    </r:field>
				    <r:field fieldName="islog" label="<%=islog %>" >
				        <d:select dictTypeId="ABF_YESORNO" nullLabel="<%=pleaseSelect %>"></d:select>
				    </r:field>
				    <r:field fieldName="logevent" label="<%=logevent %>">
				        <d:select dictTypeId="ABF_TRIGER_TIME" nullLabel="<%=pleaseSelect %>"></d:select>
				    </r:field>
				    <r:toolbar tools="nav,pagesize,edit" location="top" />
				</r:datacell>
			</td>
		</tr>
	</table>
	<script>
	    var datacell = null;
	    
	    /*
	     * 提交之后获取逻辑流返回值
	     */
	    function initAfterSubmit(){
	    	datacell.afterSubmit = function( ajax ) {
		        var value = ajax.getValue("root/data/retCode");
		         
		        if( value = "1" ) {
		            alert( '<b:message key="l_m_save_success"/>' );  <!--  保存成功 -->
		        } else {
		            alert( '<b:message key="l_m_save_fail"/>' );         <!-- 保存失败 --> 
		        }
	        }
	    }	    
	    
	    /*
	     * 获得当前活动行，把lookUp返回值设置到datacell的单元格中
	     */
		function returnFuncFir(arg){    
		    var lookup = $id("lookupID");
			lookup.value = arg[1];
			lookup.displayValue = arg[1];
		
			var row = datacell.getActiveRow();
			var entity = datacell.getEntity(row);
			entity.setProperty("funccode",arg[0]);
			entity.setProperty("funcname",arg[1]);
			entity.setProperty("appid", arg[2]);
			entity.setProperty("appname", arg[3]);
			datacell.refreshRow(row);
			
			return false;
		}
		/*
		 * 查询后重新加载datacell
		 */
	    function querySubmit() {
	        datacell.reload();
	    }
	    /*
         * 自定义初始化按钮样式
         */
	    function custInit(){
	    	datacell = $id("logConfig");
	    	initAfterSubmit();
	    }
	</script>
</body>
</html>

<script language="javascript">
     eventManager.add(window,"load",custInit); 
</script>
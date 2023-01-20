<%@page pageEncoding="UTF-8"%>
<%@include file="/common.jsp"%>
<html>
<head>
<title></title>
<%
	//请选择
	String pleaseSelect = com.eos.foundation.eoscommon.ResourcesMessageUtil.getI18nResourceMessage("l_pleaseSelect");
	//查询条件
	String queryCond = com.eos.foundation.eoscommon.ResourcesMessageUtil.getI18nResourceMessage("restrictManager_l_queryCond");
	//约束关系列表
	String restrictList = com.eos.foundation.eoscommon.ResourcesMessageUtil.getI18nResourceMessage("restrictManager_l_restrictList");
	//约束名称
	String restrictname = com.eos.foundation.eoscommon.ResourcesMessageUtil.getI18nResourceMessage("restrictManager_AtRestriction.restrictname");
	//首资源名称
	String firresname = com.eos.foundation.eoscommon.ResourcesMessageUtil.getI18nResourceMessage("restrictManager_AtRestriction.firresname");
	//首资源类型
	String firrestype = com.eos.foundation.eoscommon.ResourcesMessageUtil.getI18nResourceMessage("restrictManager_AtRestriction.firrestype");
	//首资源编号
	String firresource = com.eos.foundation.eoscommon.ResourcesMessageUtil.getI18nResourceMessage("restrictManager_AtRestriction.firresource");
	//次资源名称
	String secresname = com.eos.foundation.eoscommon.ResourcesMessageUtil.getI18nResourceMessage("restrictManager_AtRestriction.secresname");
	//次资源类型
	String secrestype = com.eos.foundation.eoscommon.ResourcesMessageUtil.getI18nResourceMessage("restrictManager_AtRestriction.secrestype");
	//此资源编号
	String secresource = com.eos.foundation.eoscommon.ResourcesMessageUtil.getI18nResourceMessage("restrictManager_AtRestriction.secresource");
	//约束关系
	String restriction = com.eos.foundation.eoscommon.ResourcesMessageUtil.getI18nResourceMessage("restrictManager_AtRestriction.restriction");
%>
</head>
<body leftmargin="0" topmargin="0">
  <w:panel id="panel1" width="100%" title="<%=queryCond %>">
    <table align="center" border="0" width="100%" class="form_table">
      <h:form id="queryForm">
      <tr>
        <td class="form_label"> <!--  首资源名称 -->
          <b:message key="restrictManager_AtRestriction.firresname"/><b:message key="l_colon"></b:message>
        </td>
        <td>
          <h:text property="rest/firresname" /></td>
        <td class="form_label"><!--  首资源类型 -->
          <b:message key="restrictManager_AtRestriction.firrestype"/><b:message key="l_colon"></b:message>
        </td>
        <td>
          <d:select dictTypeId="ABF_RESTYPE" property="rest/firrestype" style="WIDTH:133;" nullLabel="<%=pleaseSelect %>"/>
        </td>
      </tr>
      <tr>
        <td class="form_label"><!--  次资源名称 -->
          <b:message key="restrictManager_AtRestriction.secresname"/><b:message key="l_colon"></b:message>
        </td>
		<td>
          <h:text property="rest/secresname"/>
        </td>
        <td class="form_label"><!--  次资源类型 -->
          <b:message key="restrictManager_AtRestriction.secrestype"/><b:message key="l_colon"></b:message>
        </td>
        <td>
          <d:select dictTypeId="ABF_RESTYPE" property="rest/secrestype" style="WIDTH:133;" nullLabel="<%=pleaseSelect %>"/>
        </td>
      </tr>
      <tr>
        <td class="form_label"><!--  约束关系 -->
          <b:message key="restrictManager_AtRestriction.restriction"/><b:message key="l_colon"></b:message>
        </td>
        <td>
          <d:select dictTypeId="ABF_RESTRICTTYPE" property="rest/restriction" style="WIDTH:133;" nullLabel="<%=pleaseSelect %>"/>
        </td>
        <td colspan="2"></td>
      </tr>
      <tr class="form_bottom">
            <td colspan="6" class="form_bottom">
          <input type="button" class="button" value="<b:message key="l_query"/>" onclick="javascript:querySubmit();"/>
          <input type="button" class="button" value='<b:message key="l_reset"/>' onclick="javascript:reset();">
        </td>
      </tr>
    </h:form>
    </table>
</w:panel>

<table border="0" width="100%" height="70%" cellpadding="0" cellspacing="0" bgcolor="red">
			<tr height="4%">
				<td class="eos-panel-title">&nbsp;&nbsp;<%=restrictList%></td>
			</tr>
			<tr>
			<td width="25%" height="100%" valign="top" class="eos-panel-body">
			<r:datacell
			    height="330"
			    id="RestrictCell"
			    allowAdd="true"
			    allowDel="true"
			    isCount="true"
			    pageSize="10"
			    pageSizeList="10,20,30"
			    queryAction="org.gocom.abframe.rights.RestrictManager.queryRestrict.biz"
			    readonly="false"
			    showIndex="true"
			    submitAction="org.gocom.abframe.rights.RestrictManager.saveRestriction.biz"
			    width="100%" 
			    xpath="restrictList"
			    paramFormId="queryForm">
			  <r:toolbar location="bottom" tools="nav,pagesize,edit,custom,info"/>
			  <r:field align="left" allowModify="true" allowResize="true" fieldName="restrictname" label="<%=restrictname %>">	<!--约束名称  -->
			    <h:text validateAttr="allowNull=false"/>
			  </r:field>
			  <r:field align="left" allowModify="true" align="center" allowResize="true" fieldName="firrestype" label="<%=firrestype %>" >	  <!--首资源类型  -->
			    <d:select  id="selectType" dictTypeId="ABF_RESTYPE" property="firrestype" nullLabel="<%=pleaseSelect %>" onchange="javascript:returnTypeFir();"></d:select>
			  </r:field>
			  <r:field align="left" allowModify="true" allowResize="true" fieldName="firresname" label="<%=firresname %>">	 <!--首资源名称  -->
			    <w:lookup id="lookupID"  height="420" dialogTitle="首资源列表" readonly="true" onReturnFunc="returnFuncFir">
			    </w:lookup>
			  </r:field>
			  <r:field align="left" fieldName="firresource" label="<%=firresource %>" sortAt="none" width="0">	<!--首资源编号  -->
			    <h:text validateAttr="allowNull=false"/>
			  </r:field>
			  <r:field align="left" allowModify="true" align="center" allowResize="true" fieldName="secrestype" label="<%=secrestype %>">	<!--次资源类型  -->
			    <d:select dictTypeId="ABF_RESTYPE" property="secrestype" nullLabel="<%=pleaseSelect %>" onchange="javascript:returnTypeSec();"></d:select>
			  </r:field>
			  <r:field align="left" allowModify="true" allowResize="true" fieldName="secresname" label="<%=secresname %>">	<!--次资源名称  -->
			    <w:lookup id="lookupID2"  height="420" dialogTitle="次资源列表" readonly="true" onReturnFunc="returnFuncSec">
			    </w:lookup>
			  </r:field>
			  <r:field align="left" fieldName="secresource" label="<%=secresource %>" sortAt="none" width="0">	 <!--次资源编号  -->
			    <h:text />
			  </r:field>
			  <r:field align="left" allowModify="true" align="center" allowResize="true" fieldName="restriction" label="<%=restriction %>">	  <!--约束关系  -->
			    <d:select id="relationSelect" dictTypeId="ABF_RESTRICTTYPE"  property="restriction" nullLabel="<%=pleaseSelect %>"></d:select>
			  </r:field>
			</r:datacell>
 		</td>
			</tr>
	    </table>
        </td>
    </tr>
  </table>
</body>
</html>
<script type="text/javascript">
	var datacell = null;
	var type = "";
	var lookup = null;
	var lookup2 = null;
	var url = "";
	/*
	 * 重新加载datacell
	 */
	function querySubmit() {
	    datacell.reload();
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
		entity.setProperty("firresource",arg[0]);
		entity.setProperty("firresname",arg[1]);
		datacell.refreshRow(row);
		return false;
	}
	/*
	 * 获得当前选中行的资源类型
	 */
	function returnTypeFir(){
		var entity = datacell.copyRow();
        type = entity.getPropertyByFieldName("firrestype");

	}

	/*
	 * 根据首资源类型弹出的LookUp窗口
	 */
	function initLookUpFir(){
		lookup.show = function(){
	    this.refreshValue();
	    returnTypeFir();

		if(type == null || type == ""){
        	alert('<b:message key="restrictManager_l_pleaseSelectResType"/>');	<!--请选择资源类型！  -->
        	return;
        }else{
        	//重新定义LookUp的url和width
        	url = "org.gocom.abframe.rights.RestrictManager.flow?_eosFlowAction=lookup&type=";
			url += type;
			url += '&_ts='+(new Date()).getTime();

			if( type == "role"  ) {
			    this.width = 500;
			} else {
			    this.width = 350;
			}

	    	this.lookupUrl = url;
        }

		var urlStr = this.getParamURL();
		var argument = [this.value,this.displayValue];
		var lookup = this;
		function callBack(returnValue){
			try{
				if(lookup.onReturnFunc){
					var func = lookup.onReturnFunc + "(returnValue)";
					if(eval(func)){
						lookup.value = returnValue[0];
						lookup.displayValue = returnValue[1];
					}
				}else{
					lookup.value = returnValue[0];
					lookup.displayValue = returnValue[1];
				}
			}catch(e){
				$handle(e);
				$error("returnValue of dialog is not a array");
			}
			lookup.refreshInput();
		}
		if(this.useIeModel){
			var retValue = window.showModalDialog(urlStr,argument,"width:" + this.width + ";" + "height:" + this.height + ";" + "left:" + this.left + ";" + "top:" + this.top + ";");

			callBack(retValue);
		}else{
			showModal(urlStr,argument,callBack,this.width,this.height,this.left||"",this.top||"",this.dialogTitle);

		}
	}
	}

	/*
	 * 获得当前活动行，把lookUp返回值设置到datacell的单元格中
	 */
	function returnFuncSec(arg){

		var lookup = $id("lookupID2");
		lookup.value = arg[1];
		lookup.displayValue = arg[1];

		var row = datacell.getActiveRow();
		var entity = datacell.getEntity(row);
		entity.setProperty("secresource",arg[0]);
		entity.setProperty("secresname",arg[1]);
		datacell.refreshRow(row);
		return false;

	}
	/*
	 * 获得当前活动行的次资源类型
	 */
	function returnTypeSec(){
		var entity = datacell.copyRow();
        type = entity.getPropertyByFieldName("secrestype");
	}
	/*
	 * 根据次资源类型弹出的LookUp窗口
	 */
	function initLookUpSec(){
		lookup2.show = function() {
	    this.refreshValue();
	    returnTypeSec();
		if(type == null || type == ""){
        	alert('<b:message key="restrictManager_l_pleaseSelectResType"/>');	<!--请选择资源类型！  -->
        	return;
        }else{
        	//重新定义LookUp的url
        	url = "org.gocom.abframe.rights.RestrictManager.flow?_eosFlowAction=lookup&type=";
			url += type;
			url += '&_ts='+(new Date()).getTime();
			if( type == "role"  ) {
			    this.width = 500;
			} else {
			    this.width = 350;
			}
	    	this.lookupUrl = url;
        }
		var urlStr = this.getParamURL();
		var argument = [this.value,this.displayValue];
		var lookup = this;
		function callBack(returnValue){
			try{
				if(lookup.onReturnFunc){
					var func = lookup.onReturnFunc + "(returnValue)";
					if(eval(func)){
						lookup.value = returnValue[0];
						lookup.displayValue = returnValue[1];
					}
				}else{
					lookup.value = returnValue[0];
					lookup.displayValue = returnValue[1];
				}
			}catch(e){
				$handle(e);
				$error("returnValue of dialog is not a array");
			}
			lookup.refreshInput();
		}
		if(this.useIeModel){
			var retValue = window.showModalDialog(urlStr,argument,"width:" + this.width + ";" + "height:" + this.height + ";" + "left:" + this.left + ";" + "top:" + this.top + ";");

			callBack(retValue);
		}else{
			showModal(urlStr,argument,callBack,this.width,this.height,this.left||"",this.top||"",this.dialogTitle);

		}
	}
	}

	/*
	 * 提交之后获取逻辑流返回值
	 */
    function initDatacellAfterSubmit() {
	    datacell.afterSubmit = function( ajax ) {
	        var retCode = ajax.getValue("root/data/retCode");
	        if( retCode == "1" ) {
	            alert( '<b:message key="l_m_save_success"/>' );  <!--  保存成功 -->
	        } else {
	            alert( '<b:message key="l_m_save_fail"/>' );         <!-- 保存失败 -->
	        }
	    }
    }
	/*
     *自定义初始化按钮样式
     */
	function custInit(){
		datacell = $id("RestrictCell");
		lookup = $id("lookupID");
		lookup2 = $id("lookupID2");

		initDatacellAfterSubmit();
		initLookUpFir();
		initLookUpSec();
	}
	
	
	
	//以下脚本对datacell中的约束关系下拉框进行非空校验
	$id("RestrictCell").afterInit=function(){
		$id("relationSelect").validate=function(){
			if(this.getValue()=="") {
				f_alert(this,'<b:message key="restrictManager_l_pleaseSelect"/>'); return false;
			}else{ 
				f_alert_hidden_message(this); return true;
			}
		}
		$id("relationSelect").onchange=function(){
			f_alert_hidden_message(this);
		}
	}	 
	
	$id("RestrictCell").beforeEdit=function(cell,colIndex,rowIndex){
		if(colIndex==7){
			this.editing=true;
			this.showCellEditor(this.activeValue , this.activeEntity);
			this.activeEditor.validate();
			return false; 
		}	 
	}
	
	
	
</script>
<script language="javascript">
    //初始化页面按钮样式
     eventManager.add(window,"load",custInit);
     eventManager.add(window,"load",iframeAutoFit);
</script>
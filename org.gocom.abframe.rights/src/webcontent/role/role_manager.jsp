<%@page pageEncoding="UTF-8"%>
<%
	//角色查询条件
	String role_queryCond = com.eos.foundation.eoscommon.ResourcesMessageUtil.getI18nResourceMessage("roleManager_l_title_role")
	                      + com.eos.foundation.eoscommon.ResourcesMessageUtil.getI18nResourceMessage("roleManager_l_queryCond");
	//请选择
	String pleaseSelect = com.eos.foundation.eoscommon.ResourcesMessageUtil.getI18nResourceMessage("l_pleaseSelect");
	//角色查询结果
	String roleList = com.eos.foundation.eoscommon.ResourcesMessageUtil.getI18nResourceMessage("roleManager_l_title_role")
					+ com.eos.foundation.eoscommon.ResourcesMessageUtil.getI18nResourceMessage("l_query_result");
	//角色编号
	String roleid = com.eos.foundation.eoscommon.ResourcesMessageUtil.getI18nResourceMessage("roleManager_AcRole.roleid");
	//String roledesc = com.eos.foundation.eoscommon.ResourcesMessageUtil.getI18nResourceMessage("roleManager_AcRole.roledesc");
	//角色名称
	String rolename = com.eos.foundation.eoscommon.ResourcesMessageUtil.getI18nResourceMessage("roleManager_AcRole.rolename");
	//角色类别
	String roletype = com.eos.foundation.eoscommon.ResourcesMessageUtil.getI18nResourceMessage("roleManager_AcRole.roletype");
	//所属应用
	String appid = com.eos.foundation.eoscommon.ResourcesMessageUtil.getI18nResourceMessage("roleManager_AcRole.appid(appname)");
	//操作
	String operation = com.eos.foundation.eoscommon.ResourcesMessageUtil.getI18nResourceMessage("roleManager_l_operation");
%>
<%@include file="/common.jsp"%>
<html>
<head>
<title></title>
<script>
var isFirst = true;
var currentTab = "func";
</script>
</head>
<body leftmargin="0" topmargin="0" style="overflow: auto;">
<TABLE border="0" width="100%" height="100%" cellpadding="0" cellspacing="0">
	<TR>
		<TD valign="top" width="48%" height="100%">
			<w:panel id="roleQuery" title="<%=role_queryCond %>">
				<table border="0" width="100%" class="form_table" cellpadding="0" cellspacing="0">
					<tr>
						<td class="form_label"><b:message key="roleManager_AcRole.rolename" /></td>
						<!-- 角色名称 -->
						<td><input id="roleName" type="text"></td>
						<td class="form_label"><b:message key="roleManager_AcRole.roletype" /></td>
						<!-- 角色类别 -->
						<td><d:select id="roleType" style="WIDTH:133;"
							dictTypeId="ABF_ROLETYPE" nullLabel="<%=pleaseSelect %>" /></td>
						<td><input type="button" class="button" style="width:40" value="<b:message key="l_query"/>"
							onclick="javascript:queryRole('roleListCell')"></td>
					</tr>
				</table>
			</w:panel>
			<table border="0" width="100%" height="100%" cellpadding="0" cellspacing="0">
				<tr height="4%">
					<td class="eos-panel-title">&nbsp;&nbsp;<%=roleList%></td>
				</tr>
				<tr>
				<td width="25%" height="100%" valign="top" class="eos-panel-body">
				<r:datacell id="roleListCell"  allowAdd="true" allowDel="true"   
					readonly="false" showIndex="true" isCount="true"
					pageSize="15" pageSizeList="10,15,20,30" freezeNumber="0"
					entityType="org.gocom.abframe.dataset.privilege.AcRole" width="100%"
					height="450px"
					queryAction="org.gocom.abframe.rights.role.RoleManager.queryRole.biz"
					xpath="roleList"
					submitAction="org.gocom.abframe.rights.role.RoleManager.updateRole.biz"
					submitXpath="" initParamFunc="initRoleListCell">
					<r:toolbar location="bottom" tools="nav:first prev next last goto,edit:add del save reload,pagesize,custom"/>
					<r:field align="left" width="100" allowModify="false" allowResize="true" 
						fieldName="roleid" label="<%=roleid %>">
						<!-- 角色编号 -->
						<h:text name="roleid" 
							validateAttr="allowNull=false;message=该输入项是必输项"/>
					</r:field>
					<r:field align="left" width="130" allowModify="true" allowResize="true"
						fieldName="rolename" label="<%=rolename %>">
						<!-- 角色名称 -->
						<h:text name="rolename"
							validateAttr="allowNull=false;message=该输入项是必输项" />
					</r:field>
					<r:field align="left" width="60" allowModify="true" allowResize="true" fieldName="roletype" label="<%=roletype %>">
						<!-- 角色类别 -->
						<d:select id="roleType" style="WIDTH:100;"
							dictTypeId="ABF_ROLETYPE" />
					</r:field>
					<%--<r:field align="left" allowModify="true" allowResize="true" fieldName="roledesc" label="<%=roledesc %>">    <!-- 角色描述 -->
	      				<h:text/>
	    			</r:field>--%>
					<r:field align="left" width="100" allowModify="true" allowResize="true"
						fieldName="appid" label="<%=appid %>">
						<!-- 所属应用 -->
						<h:select id="appSelect" property="appList">
						    <option value=""><%=pleaseSelect %></option>
							<h:options labelField="appname" valueField="appid"
								property="appList" />
						</h:select>
					</r:field>
					<r:field align="center" width="40" allowModify="true" allowResize="true" 
						fieldName="function" label="<%=operation %>"
						onRefreshFunc="showOperation" >
						<!-- 操作 -->
					</r:field>
				</r:datacell>
				</td>
				</tr>
			</table>
		</TD>
		<TD width="52%" height="100%" valign="top">
			<iframe frameBorder="0" style="width:100%;height:100%" scrolling="no" src="about:blank" name="privilegeTab"> </iframe>
		</TD>
	</TR>
</TABLE>
<script type="text/javascript" id="roleListCell_script">
    
	/*
	 * 刷新datacell
	 */
	function queryRole(datacellId){
		var resultDatacell=$id(datacellId);
		resultDatacell.reload(); //重载datacell
	}
	/* 
	 * datacell的初始化查询条件
	 */
	function initRoleListCell(){	
		var queryCond="";		
		queryCond = queryCond+"<roleCriteria>";
		queryCond = queryCond+"<_expr __index='0'><rolename>"+$id("roleName").value+"</rolename><_op>like</_op><_likeRule>all</_likeRule></_expr>";
		queryCond = queryCond+"<_expr __index='1'><roletype>"+$id("roleType").value+"</roletype><_op>=</_op></_expr>";
		queryCond = queryCond+"</roleCriteria>";
		return queryCond;
	}
	
	
	
	/*
	 * 在页面上显示编辑按钮
	 */
	function showOperation(value,entity,rno,cno,datacell){
		if(entity.status == Entity.STATUS_NEW){
			return "";
		}else{		    		    
			return "<input style='margin-top:-4' type='button' class='button'  value='<b:message key="roleManager_l_edit"/>' onclick='javascript:modifyRole("+rno+");'>";
	   }		
	}	
	/*
	 * 点击编辑按钮时
	 */	
	function modifyRole(rowno){
	    var datacell = $id("roleListCell");
	    var row = datacell.getRow(rowno);
        var entity = datacell.getEntity(row);
        var roleid = entity.getProperty('roleid');
		var appid = entity.getProperty('appid');
        var url ="org.gocom.abframe.rights.role.PrivilegeTab.flow?acRole/roleid="+roleid;
		if(isNotNullStr(appid)){
  		  url += "&acRole/appid="+appid;
		}
		url += "&currentTab=" + currentTab; 
		
		$name("privilegeTab").src = url;
	}	
	/*
	 * 验证当前页面输入的值是否有重复
	 */
	function checkInputValue(datacell,value ){	
		var tmpValue = "";		
		var len = datacell.getCurrentRowCount();  //获取当前页的有效行数		
		var tmpRow = null;		
		for (var r = 0; r < len; r++){
		    tmpRow = datacell.getRow( r );
		    var row = datacell.getActiveRow();
		    
		    //排除编辑的行和自身进行比较
  	        if( tmpRow.rowIndex != row.rowIndex ) {		    	
    		  var cell = datacell.getCell(r,0); //行号，列号都从0开始, 但列也可写单元格的name名称
    		  tmpValue = datacell.getCellValue( cell );                
       		  if( value == tmpValue && value != "" ) {
       		     alert('<b:message key="roleManager_l_m_alert_roleidExist"/>');   <!-- 该角色编号已经存在! -->
				 var entity = datacell.getEntity(row);
				 entity.setProperty("roleid","");    <!-- 角色编号存在时清空单元格! -->
       		   	 return false;
       		  }   
       		}
        }			
		return true;
	}
	/*
	 * 查询输入的角色编号是否和数据库的记录重复
	 */
    function checkDBValue(datacell,activeCellValue) {
        var myAjax = new Ajax("org.gocom.abframe.rights.role.RoleManager.queryRoleAll.biz");
		myAjax.addParam("role/roleid",activeCellValue);
		
		myAjax.submit();
		var returnNode = myAjax.getResponseXMLDom();
		if( returnNode ) {
		    if( myAjax.getValue("root/data/retCode") == "0" ) {
		        return true;
		    } else {
		    	alert('<b:message key="roleManager_l_m_alert_roleidExist"/>');   <!-- 该角色编号已经存在! -->
		    	row = datacell.getActiveRow();
				var entity = datacell.getEntity(row);
				entity.setProperty("roleid","");
		        return false;
		    }
		}
    } 
    /*
	 * 提交之后获取逻辑流返回值
	 */
    function initDatacellAfterSubmit(datacell) {
	    datacell.afterSubmit = function( ajax ) {
	        var retCode = ajax.getValue("root/data/retCode");
	        if( retCode == "1" ) {
	            alert( '<b:message key="l_m_save_success"/>' );  <!--  保存成功 -->
	        } else {
	            alert( '<b:message key="l_m_save_fail"/>' );         <!-- 保存失败 --> 
	        }	        
	    };
	    /*
		 * 验证角色编号时候有重复记录
		 */
		datacell.afterEdit = function () {
		    var activeCell = this.getActiveCell();//获取活动单元格
		    activeCellValue = this.getCellValue( activeCell );//获取活动单元格的值
		    
		    if( activeCell != null  ) {
			    var cellIndex = activeCell.cellIndex;
			    if( cellIndex == 0  ) {
			        if( checkInputValue(this,activeCellValue) && checkDBValue(this,activeCellValue)  )  {
			            return true;
			        } else {
			            return false;
			        }
			    } 
		    }
		};
    }
    /*
     * 初始化按钮样式以及调用各初始化函数
     */ 
    function custInit() { 
        var datacell = $id("roleListCell");       
        initDatacellAfterSubmit(datacell);
        modifyRole(0);	
    }

     eventManager.add(window,"load",custInit); 
</script>
</body>
</html>

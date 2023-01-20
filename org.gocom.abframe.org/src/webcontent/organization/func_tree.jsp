<%@page pageEncoding="UTF-8"%>
<%@include file="/common.jsp"%>
<%
	String pnOperfunc_acFunction_funcname=com.eos.foundation.eoscommon.ResourcesMessageUtil.getI18nResourceMessage("orgSubMaintain_pnOperfunc.acFunction.funcname");
	String pnOperfunc_funcgroupname=com.eos.foundation.eoscommon.ResourcesMessageUtil.getI18nResourceMessage("orgSubMaintain_pnOperfunc.funcgroupname");
	String pnOperfunc_appname=com.eos.foundation.eoscommon.ResourcesMessageUtil.getI18nResourceMessage("orgSubMaintain_pnOperfunc.appname");
	String pnOperfunc_authtype=com.eos.foundation.eoscommon.ResourcesMessageUtil.getI18nResourceMessage("orgSubMaintain_pnOperfunc.authtype");
	String pnOperfunc_startdate=com.eos.foundation.eoscommon.ResourcesMessageUtil.getI18nResourceMessage("orgSubMaintain_pnOperfunc.startdate");
	String pnOperfunc_enddate=com.eos.foundation.eoscommon.ResourcesMessageUtil.getI18nResourceMessage("orgSubMaintain_pnOperfunc.enddate");

%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
<title></title>
<script>
	function custInit(){
		//增加"直接授予的权限"Datacell定制BUTTON
		$id("dcOperfunc").setCustomTool("<input type='button' value='返回' onclick='h_confirm()'>");
	}	
	
	//双击树的功能节点，往DATACELL增加一条记录	
	function dblClickFunc(node){  
	   var entity = new Entity("oaOperfunc"); //创建实体，实体名为datacell的xpath="oaOperfunc"中的名字
		entity.setProperty("acFunction/funccode", node.getProperty("acFunction.funccode"));//功能名称

		entity.setProperty("acFunction/funcname", node.getProperty("funcname"));//功能名称
        entity.setProperty("funcgroupid", node.getProperty("funcgroupid")); //功能组ID
        entity.setProperty("funcgroupname", node.getProperty("funcgroupname")); //功能组名称
        entity.setProperty("appid", node.getProperty("appid")); //应用ID
        entity.setProperty("appname", node.getProperty("appname")); //应用名称
         //取缺省生效日期，失效日期
        var dt,day1="",day2="";
        dt = new Date();
        day1 += dt.getFullYear()+"-";
        day2 += (dt.getFullYear()+1)+"-";
        if ((dt.getMonth() + 1)<10) {
        	day1 += "0"+(dt.getMonth() + 1)+"-";
        	day2 += "0"+(dt.getMonth() + 1)+"-";
        }else{
        	day1 += (dt.getMonth() + 1)+"-";
        	day2 += (dt.getMonth() + 1)+"-";
        }
        if (dt.getDate()<10 ){
        	day1 += "0"+dt.getDate();
        	day2 += "0"+dt.getDate();
        }else{
        	day1 += dt.getDate();
        	day2 += dt.getDate();
        }

        entity.setProperty("startdate", day1); //生效日期
        entity.setProperty("enddate", day2); //失效日期
        entity.setProperty("acOperator/operatorid",'<b:write property="oEmp/operatorid"/>'); //操作员ID
       
        	    
 	    var rows = $id("dcOperfunc").getAllRows(true);
 	    var lines = new Array();
 	    for(var i=0;i<rows.length;i++){
 	       var e = $id("dcOperfunc").getEntity(rows[i]);
 	       if(   e.getProperty("acFunction/funccode")==entity.getProperty("acFunction/funccode")
 	          && e.getProperty("acOperator/operatorid")==entity.getProperty("acOperator/operatorid")
 	          ){
 	           	          lines.push(e.getProperty("authtype"));
 	            }
 	    }
 	    if(lines.length==0){//未添加过此功能
 	             entity.setProperty("authtype", "y"); //授权标志
 	             $id("dcOperfunc").insertRow(entity);
 	    }else{
 	        alert('<b:message key="empPowerMaintain_l_authnote" />');<%-- 功能已在授权列表中，如果想修改授权类型请在右侧的列表中维护 --%>
 	    }
 	    		
	}
</script>
</head>
<body >
<table align="left" border="0" height="100%" width="100%">
  <tr>
	<td class="eos-panel-table" width="50%" valign="top">
	<w:tree id="funcTree" hasRoot="false">
		<w:treeRoot display="公司">
		</w:treeRoot>

		<w:treeNode nodeType="oApp" showField="appname" xpath="oaApp"
			icon='<%=SkinUtil.getStyleFileForTag("images/abf/application_xp.png",request)%>'>
			<w:treeRelation parentNodeType="root" field="" />
		</w:treeNode>
		<w:treeNode nodeType="oFuncgrp" showField="funcgroupname" xpath="oaFuncgrp"
			icon='<%=SkinUtil.getStyleFileForTag("images/abf/bricks.png",request)%>'>
			<w:treeRelation parentNodeType="oApp" parentField="appid" field="appid" />
		</w:treeNode>
		<w:treeNode nodeType="oFunc" showField="funcname" xpath="oaFunc"
			onClickFunc="dblClickFunc"
			icon='<%=SkinUtil.getStyleFileForTag("images/abf/application_form.png",request)%>'> <%--acFunction/funccode--%>
			<w:treeRelation parentNodeType="oFuncgrp" parentField="funcgroupid" field="funcgroupid" />
		</w:treeNode>
	</w:tree>
	</td>
	<td rowspan="2" width="50%" valign="top">
		<h:form id="qfOperfunc">
			<h:hidden name="oOperfunc/acOperator/operatorid" property="oEmp/operatorid" />
		</h:form>
		<r:datacell id="dcOperfunc" rowStyleClass="rowclass2" rowEvenStyleClass="rowclass1" showIndex="false"
			queryAction="org.gocom.abframe.org.party.PartyManager.queryOperfunc.biz" paramFormId="qfOperfunc"
			
			xpath="oaOperfunc" width="100%" height="350" pageSize="10" pageSizeList="10,20,30"
			submitAction="org.gocom.abframe.org.organization.FuncAssign.saveOperfunc.biz" >

			<r:toolbar tools="nav,edit:del save reload,custom" location="botton" />  
			<r:field fieldName="authtype" label="<%=pnOperfunc_authtype%>" ><d:select dictTypeId="ABF_FUNCAUTHTYPE"/></r:field>
			<r:field fieldName="acFunction/funcname" label="<%=pnOperfunc_acFunction_funcname%>" />
			<r:field fieldName="funcgroupname" label="<%=pnOperfunc_funcgroupname%>" />
			<r:field fieldName="appname" label="<%=pnOperfunc_appname%>" />			
			<r:field fieldName="startdate" label="<%=pnOperfunc_startdate%>" ><w:date id="date1"/></r:field>
			<r:field fieldName="enddate" label="<%=pnOperfunc_enddate%>" ><w:date id="date2"/></r:field>
		</r:datacell>
	</td>
  </tr>
</table>
</body>
</html>
<script>
	var insertRow = 0;//新增行数
	var dc = $id("dcOperfunc");//datacell
	
	
	dc.afterAdd=function(){
		insertRow++;
	}
	dc.afterDel=function(){
		insertRow--;
	}
	dc.afterSubmit=function(){
		insertRow=0;
	}
	
	//点击返回按钮，若没有保存在询问用户是否保存
	function h_confirm(){
		if(insertRow>0){
			if(confirm("<b:message key='orgcode_save_confirm'/>")){
				dc.submit();
			}
		}
		window.close();
	}
	
</script>
<script>
	eventManager.add(window,"load",custInit);
</script>


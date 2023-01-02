<%@page pageEncoding="UTF-8"%>
<%@include file="/common.jsp"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
<title></title>

<%
	//获取标签中使用的国际化资源信息
	String posi_tree=com.eos.foundation.eoscommon.ResourcesMessageUtil.getI18nResourceMessage("PositionTree_title");
%>
</head>
<body  leftmargin="0" topmargin="0" bottommargin="0" rightmargin="0">
    
    <TABLE border="0" width="100%" height="100%" cellpadding="0" cellspacing="0">
	<TR>
	    <TD width="100%" height="370" valign="top" class="eos-panel-table">
	    <r:rtree id="orgTree" height="100%" width="100%">
			<r:treeRoot childEntities="oaOrg" display="<%=posi_tree%>" initParamFunc="getInitParam"
				icon='<%=SkinUtil.getStyleFileForTag("images/abf/arrow_merge.png",request)%>'
				onClickFunc="queryCondOrg"
				action="org.gocom.abframe.org.organization.OrgManager.queryMngorgOfLogon.biz" >				
			</r:treeRoot>
			<r:treeNode preload="true" nodeType="oaOrg" showField="orgname" childEntities="oaOrg;oaPosi"
				icon='<%=SkinUtil.getStyleFileForTag("images/abf/chart_organization.png",request)%>'
				submitXpath="oParentOrg" 
 				action="org.gocom.abframe.org.position.PositionManager.queryChildNodeOfOrg.biz" >
			</r:treeNode>
			<r:treeNode preload="true" nodeType="oaPosi" showField="posiname" childEntities="oaPosi" 
			    icon='<%=SkinUtil.getStyleFileForTag("images/abf/group.png",request)%>'
				submitXpath="oParentPosi"	onDblclickFunc="dbClickNode" onClickFunc="clickNode"
				action="org.gocom.abframe.org.position.PositionManager.queryChileNodeOfPosi.biz" >			
		    </r:treeNode>			
		</r:rtree>
		</TD>
	</TR>
	<TR>
	    <TD nowrap>
		   <b:message key="l_selectValueIs"></b:message> <input type="text" name="posiname" readonly="readonly" value=""/> 
		   <input type="hidden" name="positionid" value=""/>
		   <input type="button" class="button" value='<b:message key="l_cofirm"/>' onclick="javascript:ok();"/>
		   <input type="button" class="button" value='<b:message key="l_empty"/>' onclick="javascript:closeWin('','','','');"/>
		   <input type="button" class="button" value='<b:message key="l_close"/>' onclick="javascript:window.close();"/>
		</TD>
	</TR>
	</TABLE>
	
</body>
</html>
<script>
    /* 
     *  树查询数据时初始化参数
     */
    function getParam() {
        return "<queryPosi><postionid>0</postionid></queryPosi>";
    }
    
    //岗位ID、岗位名称、岗位类型、状态
    var positionid = "";
    var posiname = "";
    var positype ="";
    var status ="";
    
    /* 双击树节点，相当于单击并返回值
    *  param0: node 树当前选中节点
    */
    function dbClickNode( node ) {
        setReturnValue( node );        
        returnValue = [positionid, posiname];
        window.close();
    }
    
    /*
    *  单击树节点，给选择框赋值
    *  param0: node 树当前选中节点
    */
    function clickNode( node ) {
        setReturnValue( node );
    }
    
    /*
     *  设置树返回的值
     *  param0: node 树当前选中的节点
     */
    function setReturnValue( node ) {
        positionid = node.getProperty("positionid");
        posiname   = node.getProperty("posiname");
        positype = node.getProperty("positype");
        status   = node.getProperty("status");            
        
        $name("posiname").value = posiname;
        $name("positionid").value = positionid;
       
    }
    /*  
     *  给弹出窗口赋返回值，并关闭窗口
     */  
    function closeWin( idValue1, nameValue2,idValue3, nameValue4 ) {
        returnValue = [ idValue1, nameValue2,idValue3, nameValue4 ];
        window.close();
    }
    /*  
     *  确定按钮，如果没选择值，提示是否关闭，是退出，否取消
     */
    function ok() {
        if( positionid == "" || positionid == null || posiname == "" || posiname == null ) {
            if( confirm( '<b:message key="l_m_alert_notSelectValueExit"/>' ) ) {
                closeWin( positionid, posiname,positype,status );    
            }
        } else {
            closeWin( positionid, posiname,positype,status );    
        }  
    } 
    function getInitParam(){
		return '<oEmp><userid><b:write property="userObject/userId" scope="s" /></userid><operatorid><b:write property="userObject/attributes/operatorid" scope="s" /></operatorid><empid><b:write property="userObject/attributes/empid" scope="s" /></empid></oEmp>'; //
	}
	//--初始化树的高度-自定义初始化按钮样式------------------------------------
	function custInit(){
        var height = document.body.clientHeight - 22;
		$id("orgTree").style.height =height;
		getInitParam();
	}
</script>
<script language="javascript">
    //初始化页面按钮样式
     eventManager.add(window,"load",custInit); 
</script>
<%@page pageEncoding="UTF-8"%>
<%@include file="/common.jsp"%>

<%@page import="org.gocom.abframe.auth.bizlet.SkinUtil"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
<title></title>

<%
	//职务管理
	String duty_manager = com.eos.foundation.eoscommon.ResourcesMessageUtil.getI18nResourceMessage("dutyManager_l_title_duty_manager");
	//职务树
	String duty_tree = com.eos.foundation.eoscommon.ResourcesMessageUtil.getI18nResourceMessage("dutyManager_l_duty_tree");
%>

</head>
<body leftmargin="0" topmargin="0" bottommargin="0" rightmargin="0">

    <body>
<script>
    /*
     *  树查询初始化参数
     */ 
    function getParam() {
        return "<queryDuty><dutytype>0</dutytype></queryDuty>";
    }
    var dutyid = "";      //职务ID
    var dutyname = "";    //职务名称
    var dutytype = "";    //职务套别
    
    /*
     *  双击树节点，相当于单击并返回值
     */
    function dbClickNode( node ) {
        setReturnValue( node );
        
        var tmpNode = getDutytypeValue( node );
        dutytype = tmpNode.getProperty("dutytype");
        returnValue = [dutyid, dutyname, dutytype];
        
        window.close();
    }
    
    /*
     * 得到职务套别
     */
    function getDutytypeValue( node ) {
        if( node.getParent().isRootNode()  ) {
            return node;
        }else{
        	return getDutytypeValue(node.getParent());
        }
    }
    
    /*
     *  单击树节点，给选择框赋值
     */
    function clickNode( node ) {
        var tmpNode = getDutytypeValue( node );
        dutytype = tmpNode.getProperty("dutytype");
     
        setReturnValue( node );
    }
    
    /* 
     *  赋值函数
     */
    function setReturnValue( node ) {
        dutyid = node.getProperty("dutyid");
        dutyname   = node.getProperty("dutyname");
        
        $name("dutyname").value = dutyname;
        $name("dutyid").value = dutyid;
    }
    
   /*
    *  给弹出窗口赋返回值，并关闭窗口,返回值为：职务ID，职务名称，职务套别
    */
    function closeWin( idValue, nameValue, dutyTypeValue ) {
        returnValue = [ idValue, nameValue, dutyTypeValue ];
        window.close();
    }
    
    /*
     *  确定按钮，如果没选择值，提示是否关闭，是退出，否取消
     */
    function ok() {
        if( dutyid == "" || dutyid == null || dutyname == "" || dutyname == null ) {
            if( confirm( '<b:message key="l_m_alert_notSelectValueExit"/>' ) ) {
                closeWin( dutyid, dutyname, dutytype );    
            }
        } else {
            closeWin( dutyid, dutyname, dutytype );    
        }
    } 
    
</script>
    <TABLE border="0" width="100%" height="100%" cellpadding="0" cellspacing="0">
	<TR>
	    <TD width="346" height="370" valign="top" class="eos-panel-table">
		    <r:rtree id="tree1" width="346" height="370" >
		        <r:treeRoot icon='<%=SkinUtil.getStyleFileForTag("images/abf/folder_user.png",request)%>' action="org.gocom.abframe.org.duty.DutyManager.queryRootDuty.biz" childEntities="duty" display="<%=duty_tree %>" initParamFunc="getParam">
		        </r:treeRoot>
		        <r:treeNode  preload="true" nodeType="duty" submitXpath="queryDuty"  showField="dutyname" childEntities="dutys" action="org.gocom.abframe.org.duty.DutyManager.querySubDuty.biz" 
		              icon='<%=SkinUtil.getStyleFileForTag("images/abf/group.png",request)%>'>
		        </r:treeNode>
		        <r:treeNode preload="true" nodeType="dutys" submitXpath="queryDuty" showField="dutyname" childEntities="dutys" action="org.gocom.abframe.org.duty.DutyManager.querySubDutyByTemplate.biz"
		         onDblclickFunc="dbClickNode" onClickFunc="clickNode" icon='<%=SkinUtil.getStyleFileForTag("images/abf/user_green.png",request)%>'>
		        </r:treeNode>
		    </r:rtree>
		</TD>
	</TR>
	<TR>
	    <TD>
		   <b:message key="l_selectValueIs"></b:message><input type="text" name="dutyname" readonly="readonly" value=""/> 
		   <input type="hidden" name="dutyid" value=""/>
		   <input type="button" class="button" value='<b:message key="l_cofirm"/>' onclick="javascript:ok();"/>
		   <input type="button" class="button" value='<b:message key="l_empty"/>' onclick="javascript:closeWin('','');"/>
		   <input type="button" class="button" value='<b:message key="l_close"/>' onclick="javascript:window.close();"/>
		</TD>
	</TR>
	</TABLE>
</body>
</html>
<%@page pageEncoding="UTF-8"%>
<%@include file="/common.jsp"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
<title></title>
<%  //组织机构树
	String tree_title = com.eos.foundation.eoscommon.ResourcesMessageUtil.getI18nResourceMessage("OrganizationTree_title");
%>

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

</script>

</head>
<body  leftmargin="0" topmargin="0" bottommargin="0" rightmargin="0">
    
    <TABLE border="0" width="100%" height="100%" cellpadding="0" cellspacing="0">
	<TR>
	    <TD width="346" height="370" valign="top" class="eos-panel-table">
		    <r:rtree id="tree1" width="346" height="370" >
		        <r:treeRoot  action="org.gocom.abframe.org.party.PartyManager.queryPartyForTree.biz" 
		           childEntities="org,pos,emp,group" display="<%=tree_title%>"/>		           
		        <r:treeNode nodeType="pos" submitXpath="queryPosi"  showField="posiname" 
		           childEntities="pos,emp" action="org.gocom.abframe.org.position.PositionManager.querySubPosition.biz" 
                 onDblclickFunc="dbClickNode" onClickFunc="clickNode">
		        </r:treeNode>
		        <r:treeNode nodeType="org" submitXpath="queryOrg"  showField="orgname" childEntities="org,pos" action="org.gocom.abframe.org.party.PartyManager.queryPartyForTree.biz" 
		         onDblclickFunc="dbClickNode" onClickFunc="clickNode">
		        </r:treeNode>
		        <r:treeNode nodeType="group" submitXpath=""  showField="orgname" childEntities="group,pos,emp" action="org.gocom.abframe.org.party.PartyManager.queryPartyForTree.biz" 
		         onDblclickFunc="dbClickNode" onClickFunc="clickNode">
		        </r:treeNode>
		        <r:treeNode nodeType="emp" submitXpath="queryOrg"  showField="orgname" childEntities="group,pos,emp" action="org.gocom.abframe.org.party.PartyManager.queryPartyForTree.biz" 
		         onDblclickFunc="dbClickNode" onClickFunc="clickNode">
		        </r:treeNode>
		    </r:rtree>
		</TD>
	</TR>
	<TR>
	    <TD>
		   <b:message key="l_selectValueIs"></b:message> <input type="text" name="posiname" readonly="readonly" value=""/> 
		   <input type="hidden" name="positionid" value=""/>
		   <input type="button" class="button" value='<b:message key="l_cofirm"/>' onclick="javascript:ok();"/>
		   <input type="button" class="button" value='<b:message key="l_empty"/>' onclick="javascript:closeWin('','','','');"/>
		</TD>
	</TR>
	</TABLE>
	
</body>
</html>
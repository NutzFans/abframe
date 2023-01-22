<%@page pageEncoding="UTF-8"%>
<%@page import="com.eos.foundation.eoscommon.ResourcesMessageUtil"%>
<%@include file="/common.jsp"%>
<%
	//获取标签中使用的国际化资源信息
	String orgMng = ResourcesMessageUtil.getI18nResourceMessage("orgSubMaintain_l_title_orgMng");
	String orgEmpTree = ResourcesMessageUtil.getI18nResourceMessage("orgSubMaintain_l_title_orgEmpTree");
	String removeSelfOrg = ResourcesMessageUtil.getI18nResourceMessage("orgSubMaintain_l_menu_removeSelfOrg");
	String addSubOrg = ResourcesMessageUtil.getI18nResourceMessage("orgSubMaintain_l_menu_addSubOrg");
	String addSubPosi = ResourcesMessageUtil.getI18nResourceMessage("orgSubMaintain_l_menu_addSubPosi");
	String addEmpOprOrg = ResourcesMessageUtil.getI18nResourceMessage("orgSubMaintain_l_menu_addEmpOprOrg");
	String maintainPowerOrg2 = ResourcesMessageUtil.getI18nResourceMessage("orgSubMaintain_l_menu_maintainPowerOrg2");
	String removeSelfPosi = ResourcesMessageUtil.getI18nResourceMessage("orgSubMaintain_l_menu_removeSelfPosi");
	String addEmpOprPosi = ResourcesMessageUtil.getI18nResourceMessage("orgSubMaintain_l_menu_addEmpOprPosi");
	String maintainPowerPosi2 = ResourcesMessageUtil.getI18nResourceMessage("orgSubMaintain_l_menu_maintainPowerPosi2");
	String refresh = ResourcesMessageUtil.getI18nResourceMessage("l_refresh");

	String maintainPowerEmp2 = ResourcesMessageUtil
			.getI18nResourceMessage("orgSubMaintain_l_menu_maintainPowerEmp2");

	String select_dialogJspStr = request.getContextPath()
			+ "/abframe/org/organization/select_dialog.jsp";
	String select_dialogJspStrold = request.getContextPath()
			+ "/abframe/org/organization/select_dialogold.jsp";
%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<title><b:message key="orgSubMaintain_l_title_orgTree" /></title>
<script type="text/javascript" src="jquery.js"></script>
<!-- 实现页面遮罩效果 -->
	<style type="text/css">
		#bg{ display: none; position: absolute; top: 0%; left: 0%; width: 100%; height: 100%; background-color: #ccc; z-index:1001; -moz-opacity: 0.7; opacity:.70; filter: alpha(opacity=70);}
		.blue { 
			color: #d9eef7; 
			border: solid 1px #0076a3; 
			background: #0095cd; 
			background: -webkit-gradient(linear, left top, left bottom, from(#00adee), to(#0078a5)); 
			background: -moz-linear-gradient(top, #00adee, #0078a5); 
			filter: progid:DXImageTransform.Microsoft.gradient(startColorstr='#00adee', endColorstr='#0078a5'); 
		} 
		.blue:hover { 
			background: #007ead; 
			background: -webkit-gradient(linear, left top, left bottom, from(#0095cc), to(#00678e)); 
			background: -moz-linear-gradient(top, #0095cc, #00678e); 
			filter: progid:DXImageTransform.Microsoft.gradient(startColorstr='#0095cc', endColorstr='#00678e'); 
		} 
		.blue:active { 
			color: #80bed6; 
			background: -webkit-gradient(linear, left top, left bottom, from(#0078a5), to(#00adee)); 
			background: -moz-linear-gradient(top, #0078a5, #00adee); 
			filter: progid:DXImageTransform.Microsoft.gradient(startColorstr='#0078a5', endColorstr='#00adee'); 
		} 
	</style>
</head>
<body leftmargin="0" topmargin="0" rightmargin="0">
 <div id=mengban style="background-color:white;position:absolute;z-index:999;width:100%;height:100%;display: none">
	<table width=100% height=100%>
		<tr><td width=100% style="text-align:center;vertical-align:middle"><img src="images/loading.gif"><br>同步中，请稍候......</td></tr>
	</table>
</div>
<table border="0" width="100%" height="100%" cellpadding="0" id = "table1"
	cellspacing="0">
	<tr>
		<td width="25%" height="100%" valign="top">
		<table border="0" width="100%" height="100%" cellpadding="0"
			cellspacing="0">
			<tr height="4%">
				<td class="eos-panel-title">&nbsp;<%=orgMng%></td>
			</tr>
		<tr>
		<td>
		<h:radio id = "iszz" onclick = "clickradio('2')"/>在职&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<h:radio id = "islz" onclick = "clickradio('3')"/>离职&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<h:radio id = "isall" onclick = "clickradio('1')"/>全部
		</td>
		</tr>
			<tr>
				<td width="25%" height="100%" valign="top" class="eos-panel-body">
				<r:rtree id="orgTree" width="100%" expandLevel="2">
					<r:treeRoot childEntities="oaOrg" display="<%=orgEmpTree%>"
						initParamFunc="getInitParam"
						icon='<%=SkinUtil.getStyleFileForTag("images/abf/org-tree.png",request)%>'
						onClickFunc="queryCondOrg"
						action="org.gocom.abframe.org.organization.OrgManager.queryMngorgOfLogon.biz">
						<r:treeMenu>
							<r:treeMenuItem display="<%=addSubOrg%>" onClickFunc="addSubOrg" />
							<r:treeMenuItem display="<%=refresh%>"
								onClickFunc="refreshSubnode" />
							<!--刷新 -->
						</r:treeMenu>
					</r:treeRoot>
					<%-- <r:treeNode preload="false" nodeType="oaPyOrg" showField="orgname"
						childEntities="oaOrg;oaPosi;oaEmp"
						initParamFunc="getInitParam1"
						icon='<%=SkinUtil.getStyleFileForTag("images/abf/org-org.png",request)%>'
						submitXpath="oParentOrg" onRefreshFunc=""
						onClickFunc="modifySelfOrg"
						action="org.gocom.abframe.org.organization.OrgManager.queryChildNodeOfOrg.biz">
						<r:treeMenu>
							<r:treeMenuItem display="<%=addSubOrg%>" onClickFunc="addSubOrg" />
							<r:treeMenuItem display="<%=addSubPosi%>"
								onClickFunc="addOrgSubPosi" />
							<r:treeMenuItem display="<%=addEmpOprOrg%>"
								onClickFunc="addEmpOprOrg" />
							<r:treeMenuItem display="<%=maintainPowerOrg2%>"
								onClickFunc="maintainPowerOrg2" />
							<r:treeMenuItem display="<%=removeSelfOrg%>"
								onClickFunc="removeSelfOrg" />
							<r:treeMenuItem display="<%=refresh%>"
								onClickFunc="refreshSubnode" />
								<r:treeMenuItem display="同步微信人员"
								onClickFunc="updateWechat" />
							<!--刷新 -->
						</r:treeMenu>
					</r:treeNode> --%>
					<r:treeNode preload="false" nodeType="oaOrg" showField="orgname"
						childEntities="oaOrg;oaPosi;oaEmp"
						initParamFunc="getInitParam1"
						icon='<%=SkinUtil.getStyleFileForTag("images/abf/org-org.png",request)%>'
						submitXpath="oParentOrg" onRefreshFunc=""
						onClickFunc="modifySelfOrg"
						action="org.gocom.abframe.org.organization.OrgManager.queryChildNodeOfOrg.biz">

						<r:treeMove toNode="oaOrg" initParamFunc="getMoveInitParam"
							action="org.gocom.abframe.org.organization.OrgManager.copyOrMoveOrgFromOrgToOrg.biz" />
						<r:treeMenu>
							<r:treeMenuItem display="<%=addSubOrg%>" onClickFunc="addSubOrg" />
							<r:treeMenuItem display="<%=addSubPosi%>"
								onClickFunc="addOrgSubPosi" />
							<r:treeMenuItem display="<%=addEmpOprOrg%>"
								onClickFunc="addEmpOprOrg" />
							<r:treeMenuItem display="<%=maintainPowerOrg2%>"
								onClickFunc="maintainPowerOrg2" />
							<r:treeMenuItem display="<%=removeSelfOrg%>"
								onClickFunc="removeSelfOrg" />
							<r:treeMenuItem display="<%=refresh%>"
								onClickFunc="refreshSubnode" />
							<!--刷新 -->
						</r:treeMenu>
					</r:treeNode>
					<r:treeNode preload="false" nodeType="oaPosi" showField="posiname"
						childEntities="oaPosi,oaEmp" icon='<%=SkinUtil.getStyleFileForTag("images/abf/group.png",request)%>'
						submitXpath="oParentPosi" onClickFunc="modifySelfPosi"
						action="org.gocom.abframe.org.organization.OrgManager.queryChileNodeOfPosi.biz">
						<r:treeMenu>
							<r:treeMenuItem display="<%=addSubPosi%>"
								onClickFunc="addPosiSubPosi" />
							<r:treeMenuItem display="<%=addEmpOprPosi%>"
								onClickFunc="addEmpOprPosi" />
							<r:treeMenuItem display="<%=maintainPowerPosi2%>"
								onClickFunc="maintainPowerPosi2" />
							<r:treeMenuItem display="<%=removeSelfPosi%>"
								onClickFunc="removeSelfPosi" />
							<r:treeMenuItem display="<%=refresh%>"
								onClickFunc="refreshSubnode" />
							<!--刷新 -->
						</r:treeMenu>
					</r:treeNode>
					<r:treeNode nodeType="oaEmp" showField="empname"
						icon='<%=SkinUtil.getStyleFileForTag("images/abf/user.png",request)%>' submitXpath="oEmp"
						onClickFunc="modifyEmpOpr" onRefreshFunc="empListRefresh">
						<r:treeMove toNode="oaOrg" initParamFunc="getMoveInitParam"
							action="org.gocom.abframe.org.organization.OrgManager.moveEmpToOrg.biz" />
						<r:treeMove toNode="oaPosi" initParamFunc="getMoveInitParam"
							action="org.gocom.abframe.org.organization.OrgManager.moveEmpToPosi.biz" />
						<r:treeMenu>
							<r:treeMenuItem display="<%=maintainPowerEmp2%>"
								onClickFunc="maintainPowerEmp2" />
							<r:treeMenuItem display="设置离职信息"
								onClickFunc="updateLeave" />
						</r:treeMenu>
					</r:treeNode>
				</r:rtree></td>
			</tr>
		</table>
		<td width="75%" height="100%" valign="top"><iframe id="tab"
			style="width:100%;height:100%" frameBorder="0" scrolling="no">
		</iframe></td>
	</tr>
</table>
</body>
</html>
<script>
	var mngorgs = new Array();
    function getMonorgs(){
     var myajax = new Ajax("org.gocom.abframe.org.party.PartyManager.queryManagedOrgs.biz");
     myajax.addParam('operatorid','<b:write property="userObject/attributes/operatorid" scope="s" />');
     myajax.submit();
     var ret = myajax.getResponseXMLDom();
     if(ret){
        mngorgs =myajax.getValues("root/data/orgs/orgseq");
    }
    }	
    //判断用户是否有权操作机构
    function checkAuth(orgseq){
      for(var i=0;i<mngorgs.length;i++){
          if(mngorgs[i].test(orgseq)||orgseq.test(mngorgs[i])){//mngorgs[i]==orgid
             return true;
          }
      }
      alert('<b:message key="mngorg_no_permission" />');
      return false;
    }
    function checkAuthInclude(node){
    if(!node.isRootNode()){      
     var orgseq = node.getProperty("orgseq");
     if(orgseq!=null &&orgseq!=""&&orgseq!=undefined){//如果是机构
        for(var i=0;i<mngorgs.length;i++){
          if(orgseq.test('^'+mngorgs[i])){          
             return true;
          }              
          }        
       alert('<b:message key="mngorg_no_permission" />');
       return false;   
     }else{//不是机构判断父节点是否是
        return checkAuthInclude(node.getParent());
     }   
     }else{
      return true;
     }  
    }
    //
    function treeAuthCheck(node){
      if(!node.isRootNode()){      
	      var orgseq = node.getProperty("orgseq");
	      if(orgseq!=null &&orgseq!=""&&orgseq!=undefined){	        
	        return checkAuth(orgseq);      
	      }else{	        
	        return checkAuthInclude(node.getParent());
	      }
      }else{
           return true;
      }
    }
    
	//刷新人员节点根据不同性别区分图片
	function empListRefresh(node)
	{
		var empstatus = node.getProperty("empstatus");
		var gender = node.getProperty("gender");
		if(empstatus == 'on'){
			if(gender == 'm'){
				node.setIcon('<%=SkinUtil.getStyleFileForTag("images/abf/on-man.png",request)%>');
			}else{
				node.setIcon('<%=SkinUtil.getStyleFileForTag("images/abf/on-women.png",request)%>');	
			}
		}else{
			if(gender == 'm'){
				node.setIcon('<%=SkinUtil.getStyleFileForTag("images/abf/leave-man.png",request)%>');
			}else{
				node.setIcon('<%=SkinUtil.getStyleFileForTag("images/abf/leave-women.png",request)%>');	
			}
		}
	}


	 var isMoveOrCopy = "move";
	 var m;
	 var mt;
	 var newempprop = '0';
	 var indatea;
	 //刷新
	function refreshSubnode(node){
		node.reloadChild();
	} 
	     
	 /*  
      *  初始化树移动前的方法
      */
     function initTreeBeforeMove() {
         $id("orgTree").beforeMove = function(movenode, toNode) {
		     //return confirm('<b:message key="l_m_alert_confirmWill"/>' + movenode.getText() + '<b:message key="l_m_alert_moveTo"/>' + toNode.getText() + '<b:message key="l_m_alert_belowIt"/>');
		     m = movenode;
             mt = toNode;
		     if(m.getProperty("empid")!=null&&m.getProperty("empid")!=""){
	     		 var orgid = m.getProperty("orgid");
			     var empid = m.getProperty("empid");
			     var myajax = new Ajax("org.gocom.abframe.org.employee.EmpManager.getEmpprop.biz");
			     myajax.addParam('empid',empid);
			     myajax.addParam('orgid',orgid);
			     myajax.submit();
			     var ret = myajax.getResponseXMLDom();
			     if(ret){
			        oldempprop =myajax.getValues("root/data/empprop");
			     }
		     	 var url = "<%=select_dialogJspStr %>";
			     url += '?empprop='+oldempprop;
			     url += '&_ts='+(new Date()).getTime();   //防止IE缓存，在每次打开时加个时间差的参数
		     }else{
		     	 var url = "<%=select_dialogJspStrold %>";
	     		 url += '?_ts='+(new Date()).getTime();   //防止IE缓存，在每次打开时加个时间差的参数
		     }
		     showModalCenter(url, "", nodeMoveCallBack, 280, 220, '<b:message key="l_title_select_oper"/>'); 		     
		     return false;
	    }
     }
     
     /*
     *  移动树节点的回调函数
     *  param0: arg lookup返回的值
     */
    function nodeMoveCallBack( arg ) {
    	indatea = arg.indatea;
        //如果选择取消，则退出
        if( arg.opertion == "cancel" ) {
           return ;
        }else{
        	if(m.getProperty("empid")!=null&&m.getProperty("empid")!=""){
        		isMoveOrCopy = arg.opertion;
	           	if(arg.opertion=='copy'){
	           		newempprop = arg.newEmpprop;
	           	}
        	}else{
        		 isMoveOrCopy = arg;
        	}
            $id("orgTree").moveNode(m, mt);
        }
    }
    
    
    /*  
     *  树移动的初始参数
     */
    function getMoveInitParam()
	{
		if(newempprop.length==1){
			newempprop = '0.00';
		}
		if(newempprop.length==3){
			newempprop = newempprop+'0';
		}
		isMoveOrCopy = isMoveOrCopy + indatea + newempprop;
	    return "<isMoveOrCopy>" + isMoveOrCopy + "</isMoveOrCopy>";
	}
     
	//--节点的点击事件-------------------------------------
	function queryCondOrg(node){
		var param="&sNodetype=rootorg&sDeftab=queryCondOrg";
		try{
		$id("tab").src="org.gocom.abframe.org.organization.OrgManager.flow?_eosFlowAction=orgmain"+param;
		}catch(e){
		 alert("queryCondOrg error!");            
		}
		
	}
	function modifySelfOrg(node){
	    if(treeAuthCheck(node)){
		var param="&sNodetype=org&oOrg/orgid="+node.getProperty("orgid")
		        +"&oOrg/orgname="+node.getProperty("orgname")
		        +"&oOrg/orglevel="+node.getProperty("orglevel")
		        +"&oOrg/orgseq="+node.getProperty("orgseq")
		        +"&sDeftab=modifySelfOrg";
		        try{
		$id("tab").src="org.gocom.abframe.org.organization.OrgManager.flow?_eosFlowAction=orgmain"+param;
		}catch(e){
		 alert("modifySelfOrg error!");            
		}
		}
	}
	function modifySelfPosi(node){
	 	    if(treeAuthCheck(node)){
	   try{
	    var param="&position/positionid="+node.getProperty("positionid")
	             +"&position/omOrganization/orgid="+node.getProperty("omOrganization/orgid")
	             +"&position/omPosition/positionid="+node.getProperty("positionid")
	             +"&position/omDuty/dutyid="+nullToBlank(node.getProperty("omDuty/dutyid"))
	             +"&position/positype="+node.getProperty("positype");	
		$id("tab").src="org.gocom.abframe.org.organization.OrgManager.flow?_eosFlowAction=posiinfo"+param;
		}catch(e){
		 alert("modifySelfPosi error!");            
		}		
		}
	}
	function modifyEmpOpr(node){
		    if(treeAuthCheck(node)){
		var param= "&sNodetype=emp&emp/empid="+node.getProperty("empid");
		//         + "&emp/operatorid="+node.getProperty("operatorid")+"&emp/orgid="+node.getProperty("orgid")+"&emp/position="+node.getProperty("position")+"&sDeftab=modifyEmpOpr";
		try{
		$id("tab").src="org.gocom.abframe.org.organization.OrgManager.flow?_eosFlowAction=empinfo"+param;
		}catch(e){
		 alert("modifyEmpOpr error!");            
		}
		}
	}
		
	//--机构鼠标右键新增事件-------------------------------------
	function removeSelfOrg(node){
	    if(treeAuthCheck(node)){
	   		if(confirm('<b:message key='l_del_confirm' />')){
		        var ajax = new Ajax("org.gocom.abframe.org.organization.OrgManager.removeOrg.biz");
		        ajax.addParam("oRmvOrg/orgid", node.getProperty("orgid") );
		        ajax.addParam("oRmvOrg/orgseq", node.getProperty("orgseq") );
		        ajax.submit();
		        var rtnNode = ajax.getResponseXMLDom();
		        if( rtnNode ) {
		            if( ajax.getValue("root/data/iRtn") == 0 )
		                alert( "<b:message key='l_m_delete_success' />" );
		            else {
		                alert( "<b:message key='l_m_delete_fail' />" );
		            }
		        } else {
		            alert("<b:message key='l_m_delete_fail' />");
		        }		        
		        node.getParent().reloadChild();
	        }
        }
	}
	function addSubOrg(node){
	    if(treeAuthCheck(node)){
	        var sUrl="org.gocom.abframe.org.organization.OrganizationInfo.flow?_eosFlowAction=";
		    if(!node.isRootNode()){	    
		       sUrl=sUrl+"orgAdd&porg/orgid="+node.getProperty("orgid");           
		       sUrl +='&_ts='+(new Date()).getTime();   //防止IE缓存，在每次打开时加个时间差的参数,并且作为判断是否弹出窗口的标志
		       showModalCenter(sUrl,window,callBack,570,400,"<b:message key='orgSubMaintain_l_menu_addSubOrg'/>");
	   		}else{
	   		   sUrl=sUrl+"orgTopAdd";
	   		   sUrl +='&_ts='+(new Date()).getTime();   //防止IE缓存，在每次打开时加个时间差的参数,并且作为判断是否弹出窗口的标志
		       showModalCenter(sUrl,window,callBack,570,400,"<b:message key='orgSubMaintain_l_menu_addSubOrg'/>");
	   		}	   		
	   		
	   }
	}
	function addOrgSubPosi(node){
	    if(treeAuthCheck(node)){
    	var sUrl="org.gocom.abframe.org.position.PositionMaintain.flow?_eosFlowAction=baseinfo";
    	    sUrl+="&position/omOrganization/orgid="+node.getProperty("orgid");
    	    sUrl+="&position/positype=organization";
            sUrl+="&_ts="+(new Date()).getTime();   //防止IE缓存，在每次打开时加个时间差的参数,并且作为判断是否弹出窗口的标志
    	showModalCenter(sUrl,window,callBack,570,200,"<b:message key='orgSubMaintain_l_menu_addSubPosi'/>");
    	}
	}
	function addEmpOprOrg(node){
	    if(treeAuthCheck(node)){
	    var sUrl="org.gocom.abframe.org.employee.EmployeeManager.flow?_eosFlowAction=baseinfo";
	       sUrl+='&emp/orgid='+node.getProperty("orgid");
           sUrl+='&_ts='+(new Date()).getTime();   //防止IE缓存，在每次打开时加个时间差的参数,并且作为判断是否弹出窗口的标志
    	showModalCenter(sUrl,window,callBack,1000,800,"<b:message key='orgSubMaintain_l_menu_addEmpOprOrg'/>");
    	}
    }    	
	//--岗位鼠标右键权限事件-------------------------------------
    function maintainPowerOrg2(node){
	   alert("s");
	    if(treeAuthCheck(node)){
    	var sUrl=contextPath+"/org.gocom.abframe.org.organization.OrganizationInfo.flow?_eosFlowAction=right";
    	    sUrl=sUrl+"&oPartyrole/partytype=organization";
    	    sUrl=sUrl+"&oPartyrole/partyid="+node.getProperty("orgid");
        sUrl +='&_ts='+(new Date()).getTime();   //防止IE缓存，在每次打开时加个时间差的参数,并且作为判断是否弹出窗口的标志    	    
    	showModalCenter(sUrl,window,callBack,570,450,"<b:message key='orgSubMaintain_l_menu_maintainPowerOrg2'/>");
    	}
    }
    function addEmpOprPosi(node){
   	if(treeAuthCheck(node)){
    	var url = "org.gocom.abframe.org.position.PositionEmp.flow";
            url += "?_eosFlowAction=pageQuery";
            url += "&emppos/omPosition/positionid="+node.getProperty("positionid");
            url += '&_ts='+(new Date()).getTime();   //防止IE缓存，在每次打开时加个时间差的参数
	        showModalCenter(url, "", callBack, 550, 420, '<b:message key="positionEmp_l_title_addPositionEmp"/>');
	    }
    }
    function addPosiSubPosi(node){
    	    if(treeAuthCheck(node)){
    	var sUrl="org.gocom.abframe.org.position.PositionMaintain.flow?_eosFlowAction=baseinfo"
     	        +"&position/omOrganization/orgid="+node.getProperty("omOrganization/orgid")
	            +"&position/omPosition/positionid="+node.getProperty("positionid")
	            //+"&position/omDuty/dutyid="+nullToBlank(node.getProperty("omDuty/dutyid"))
                +"&position/positype=organization";
        sUrl +='&_ts='+(new Date()).getTime();   //防止IE缓存，在每次打开时加个时间差的参数,并且作为判断是否弹出窗口的标志
    	showModalCenter(sUrl,window,callBack,570,200,"<b:message key='orgSubMaintain_l_menu_addSubPosi'/>");
    	}
	}
    function maintainPowerPosi2(node){
    	    if(treeAuthCheck(node)){
    	var sUrl=contextPath+"/org.gocom.abframe.org.organization.OrganizationInfo.flow?_eosFlowAction=right";
    	    sUrl=sUrl+"&oPartyrole/partytype=position";
    	    sUrl=sUrl+"&oPartyrole/partyid="+node.getProperty("positionid");
        sUrl +='&_ts='+(new Date()).getTime();   //防止IE缓存，在每次打开时加个时间差的参数,并且作为判断是否弹出窗口的标志    	    
    	showModalCenter(sUrl,window,callBack,570,450,"<b:message key='orgSubMaintain_l_menu_maintainPowerPosi2'/>");
    	}
    }
    function removeSelfPosi(node){
    	if(treeAuthCheck(node)){
	        if(confirm('<b:message key='l_del_confirm' />')){
		        var ajax = new Ajax("org.gocom.abframe.org.organization.OrgManager.removePosition.biz");
		        ajax.addParam("oaPosi[1]/positionid", node.getProperty("positionid"));
		        ajax.submit();        
		        var rtnNode = ajax.getResponseXMLDom();
		        if( rtnNode ) {
		           alert( "<b:message key='l_m_delete_success' />" );
		           node.getParent().reloadChild();
		        } else {
		           alert("<b:message key='l_m_delete_fail' />");
		        }
	        }
        }
	}
    //人员右键菜单事件
    function maintainPowerEmp2(node){
    	    if(treeAuthCheck(node)){
    	var sUrl=contextPath+"/org.gocom.abframe.org.organization.OrganizationInfo.flow?_eosFlowAction=right";
    	    sUrl=sUrl+"&oPartyrole/partytype=employee";
    	    sUrl=sUrl+'&oPartyrole/partyid='+node.getProperty("empid");
        sUrl +='&_ts='+(new Date()).getTime();   //防止IE缓存，在每次打开时加个时间差的参数,并且作为判断是否弹出窗口的标志
    	showModalCenter(sUrl,window,callBack,570,450,"<b:message key='orgSubMaintain_l_menu_maintainPowerEmp2'/>");
    	}
    }
    function updateLeave(node){
    	var emnpid = node.getProperty("empid");
    	var url = contextPath + "/abframe/org/emp/updateLeave.jsp";
    	url += "?empid=" + emnpid;
    	showModalCenter(url,window,callBack,700,550," ");
    	
    }    
    //回调函数，用于弹出窗口修改过数据后的树的更新
	function callBack(returnValue){
         getMonorgs();	  
  	     $id("orgTree").getSelectNode().reloadChild();
	}
	
	function getInitParam(){
	    var ret = '<oEmp>'
	            + '<orgid><b:write property="userObject/userOrgId" scope="s" /></orgid>'
	            + '<userid><b:write property="userObject/userId" scope="s" /></userid>'
	            + '<operatorid><b:write property="userObject/attributes/operatorid" scope="s" /></operatorid>'
	            + '<empid><b:write property="userObject/attributes/empid" scope="s" /></empid>'
	            + '</oEmp>'; 
		return ret ;
	}
	function getInitParam1(){
	  if($("iszz").checked==true){
		   var empstatus = 'on'; 
	  }
	  if($("isall").checked==true){
		   var empstatus = ""; 
	   }
	   if($("islz").checked==true){
		   var empstatus = 'leave'; 
	   }
		var ret = '<empstatus>' + empstatus+ '</empstatus>'; 
		return ret ; 
	}
	function clickradio(e){
		if(e=="1"){
			$("isall").checked=true;
			$("islz").checked=false;
			$("iszz").checked=false;
		}
		if(e=="2"){
			$("isall").checked=false;
			$("islz").checked=false;
			$("iszz").checked=true;
		}
		if(e=="3"){
			$("isall").checked=false;
			$("islz").checked=true;
			$("iszz").checked=false;
		}
		var treeEntry = $id("orgTree");  
		var node = treeEntry.getRootNode();
		node.reloadChild();
		treeEntry.expandLevel("2",node) 
	}
	/******************************************** 
	  由于动态树的展开是异步的，因此定位操作也是异步的
	  由三大步骤组成：
	  1、设置需要定位的序列号
	  2、定义异步定位调用
	  3、单次定位操作调用
	 *********************************************/
	//判断节点类型
    var orgtypes = {'ORGTYPE':0,'POSITYPE':1,'EMPTYPE':2};
	function checknodetype(node,type){
	    var ret =false;
	    if(!node.isRootNode()){	
		    switch(type){
		       case orgtypes.ORGTYPE:
		          ret =isNotNullStr(node.getProperty("orgseq"));
		          break;
		       case orgtypes.POSITYPE:
		          ret=isNotNullStr(node.getProperty("positionid"));
		          break;
		       case orgtypes.EMPTYPE:
		          ret=isNotNullStr(node.getProperty("empid"));
		          break;
		       default:
		          break;	             
		    }
	    }
	    return ret;
	} 
	var locate_config={'type':null,'seq':null,'clickflag':false};
    var locate_step = 0;
	function loc(node){
	   locate(locate_config,node);
	}
	function getSeqValue(node){
       if(checknodetype(node,orgtypes.ORGTYPE)){
          return node.getProperty("orgseq");
       }if(checknodetype(node,orgtypes.POSITYPE)){
          return node.getProperty("positionseq");
       }if(checknodetype(node,orgtypes.EMPTYPE)){
          return node.getProperty("empid");
       }else{
       }
	}	
	function locate(config,curnode){
	   if(curnode==null){
	      curnode = $id("orgTree").getRootNode();	     
	   }
	   if(config!=null){
	      locate_config = config; //设置当前的定位序列号
	   }	   
	   var seq = config.seq[locate_step];
        var nodes = curnode.getChildren();
        if(nodes!=null){
           for(var i=0;i<nodes.length;i++){            
               var node = nodes[i];
               if(checknodetype(node,locate_step)){
	               var tmpseq = getSeqValue(node);
	               var hqjtmpseq;
	               var hqjseq;
	               if(tmpseq == null || tmpseq == ""){
	               		hqjtmpseq = "";
	               }else{
	               		hqjtmpseq = tmpseq.replace(/\./g,'A');
	               }
	               if(seq == null || seq == ""){
	               		hqjseq = "";
	               }else{
	               		hqjseq = seq.replace(/\./g,'A');
	               }  
	                if(tmpseq == seq){                    
	                    if(checknodetype(node,config.type)){
	                        node.select();
	                        if(config.clickflag){                       
	                           node.cell.click();
	                        }
	                        locate_config = null;//找到结束寻找
	                        locate_step = 0;
	                    }else{//寻找下一级别
	                        //该人员所在岗位为空，就跳过去，直接找人
							if(config.seq[1] == "" || config.seq[1] == null){
								locate_step = locate_step + 2;
							}else{
	                        	locate_step++;								
							}
	                        if(!node.isExpanded()){
	                          node.expandNode(loc);  //展开要定位的节点所在的上级节点，后续定位操作由展开后的触发事件来调用。                    
	                        }else{                      
	                          locate(config,node);
	                        } 
	                    }                     
	                    break;
	                }else if(hqjseq.test(hqjtmpseq)){    
	                    if(!node.isExpanded()){
	                      node.expandNode(loc);  //展开要定位的节点所在的上级节点，后续定位操作由展开后的触发事件来调用。                    
	                    }else{                      
	                      locate(config,node);
	                    }                    
	                    break;
	               }  
              }            
           }
        }         
	}
	
	function locate_emp(empid,orgseq,posiseq){
	   locate_seq=orgseq;
	   locate_execute = false;
	   locate(orgseq);
	   
	}
	//--初始化树的高度-------------------------------------
	function custInit(){
        $("iszz").checked=true;//默认选中在职
        var height = document.body.clientHeight - 22;
        var tree = $id("orgTree");
		tree.style.height =height;
		tree.beforeExpand=treeAuthCheck;
		getInitParam1();
		queryCondOrg();		
		initTreeBeforeMove();
		getMonorgs();
		/* var aa = tree.getRootNode(); */
		/* var child = tree.getChildren();
		console.log(child); */
	}
	custInit();
   // eventManager.add(window,"load",custInit);
   function updateWechat(){
	    document.getElementById( "mengban" ).style.display = "";
     if(confirm("是否确认将该机构下的所有人员同步到微信企业号中？")){
	     var ajax = new Ajax("com.primeton.eos.ame_common.weChatPlatform.updateWxUsers.biz");
	     ajax.submit();
	     var info = "";
	     var rtnNode = ajax.getException();
	     var retCode = ajax.getValues("root/data/maps");
	     if(rtnNode){
	     	alert("微信组织机构人员同步失败！")
	     }else{
		     if(retCode.length ==0){
		     	alert("微信组织机构人员同步成功！");
		     	unMaskWindow();
		     }else{
			    for(var i=0;i<retCode.length;i++){
			    	j=i+1;
			    	info = info + '\n'+j+"、"+retCode[i];
			    }
			    var info1 = "微信组织机构人员同步成功！但仍有以下工号人员未能成功同步,请根据错误信息核查修改完毕之后再次同步:"
			    alert(info1+info);
		     }
	     }
	     document.getElementById( "mengban" ).style.display = "none";

     }else{
     document.getElementById( "mengban" ).style.display = "none";
     }	
  }
  
  
  function updateEmpLeave(){
	    document.getElementById( "mengban" ).style.display = "";
     if(confirm("是否确认将该机构下的所有人员同步到微信企业号中？")){
	     var ajax = new Ajax("com.primeton.eos.ame_common.weChatPlatform.updateWxUsers.biz");
	     ajax.submit();
	     var info = "";
	     var rtnNode = ajax.getException();
	     var retCode = ajax.getValues("root/data/maps");
	     if(rtnNode){
	     	alert("微信组织机构人员同步失败！")
	     }else{
		     if(retCode.length ==0){
		     	alert("微信组织机构人员同步成功！");
		     	unMaskWindow();
		     }else{
			    for(var i=0;i<retCode.length;i++){
			    	j=i+1;
			    	info = info + '\n'+j+"、"+retCode[i];
			    }
			    var info1 = "微信组织机构人员同步成功！但仍有以下工号人员未能成功同步,请根据错误信息核查修改完毕之后再次同步:"
			    alert(info1+info);
		     }
	     }
	     document.getElementById( "mengban" ).style.display = "none";

     }else{
     document.getElementById( "mengban" ).style.display = "none";
     }	
  }
   
</script>

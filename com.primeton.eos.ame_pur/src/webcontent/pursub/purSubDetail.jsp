<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>	
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<!-- 
  - Author(s): mengyy
  - Date: 2020-04-26 11:05:30
  - Description:
-->
<head>
	<title>采购分包报备详情</title>
	<meta http-equiv="content-type" content="text/html; charset=UTF-8" />
	<link id="css_skin" rel="stylesheet" type="text/css" href="/default/coframe/tools/skins/skin1/style.css" />
	<script src="<%= request.getContextPath() %>/common/nui/nui.js" type="text/javascript"></script>
	<%@include file="/common/common.jsp"%>
	<h:script src='<%="/common/scripts/eos-web.js"%>' />
	<style type="text/css">
	    body{
	        margin:0;padding:0;border:0;width:100%;height:100%;overflow:hidden;
	    }
    </style>
</head>
<body>
	<div class="nui-fit">
		<!-- 提示信息展示  -->
		<jsp:include page="/ame_common/ameFlowOperTips/ameFlowOperTipsInfo.jsp"/>
		<jsp:include page="//ame_pur/pursub/purSubForm.jsp"/>
		<fieldset  id="field6" style="border:solid 1px #aaa;padding:3px;width: 99%;">
        	<legend>附件</legend>
			<jsp:include page="/ame_common/detailFile.jsp"/>
        </fieldset>
		<jsp:include page="/ame_common/misOpinion.jsp"/>
	</div>
</body>
<script type="text/javascript">
	nui.parse();
	
	var formPurSubCont = new nui.Form("#form_purSubCont");//合同信息
  	var opioionform = new nui.Form("opioionform");//审核意见
  	
	
	var processInstID = <%=request.getParameter("processInstID") %>;
  	var subcontid = <%=request.getParameter("subcontid") %>;
	
	var paths = "<%= request.getContextPath() %>"; //默认路径，js文件不能直接取，定义全局变量
	
	init();
	
	var purSubCont;
	
	function init(){
		formPurSubCont.mask("数据加载中...");
		var data={"subcontid":subcontid,"processInstID":processInstID};
		var json=nui.encode(data);
  		nui.ajax({
      		url: "com.primeton.eos.ame_pur.purSub.getPurSubCont.biz.ext",
	      	type: 'POST',
          	data: json,
      		success: function (o){
      			formPurSubCont.unmask();
       	  		formPurSubCont.setData(o);
       	  		purSubCont = o.purSubCont;
       	  		nui.get("custid").setText(purSubCont.custname);
       	  		nui.get("projectno").setText(purSubCont.projectName);
  				var processInstID = purSubCont.processinstid;
  				
  				var grid_0 = nui.get("grid_0");
				grid_0.load({"groupid":"PUR_SUB_CONT","relationid":purSubCont.subcontid});
				grid_0.sortBy("fileTime","desc");
				
				document.getElementById("project1").style.display="";
				document.getElementById("project2").style.display="";
				setToText();
  				//查询审核意见
				var grid = nui.get("datagrid1");
				grid.sortBy("time", "desc");
				grid.load({processInstID:processInstID});
				
				$("#opinionHide").hide();
				
          	},
	      	error: function (jqXHR, textStatus, errorThrown) {
	        	alert(jqXHR.responseText);
	      	}
    	});
	}
</script>
<script src="<%=request.getContextPath() %>/ame_pur/pursub/js/pursub.js" type="text/javascript"></script>
</html>
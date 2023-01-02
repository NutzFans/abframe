<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>	
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<!-- 
  - Author(s): mengyy
  - Date: 2020-04-26 11:05:30
  - Description:
-->
<head>
	<title>正式申请详情</title>
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
		<!--合同基本信息展示  -->
		<jsp:include page="/contract/csLicense/csContDetail.jsp"/>
		<div id="cslicsend">
			<jsp:include page="/contract/csLicense/csLicenseForm.jsp"/>
			<fieldset  id="field6" style="border:solid 1px #aaa;padding:3px;width: 99%;">
	        	<legend>附件</legend>
				<jsp:include page="/ame_common/detailFile.jsp"/>
	        </fieldset>
		</div>
		<div id="cslicgrid">
			<!--合同产品授权列表  -->
			<jsp:include page="/contract/csLicense/csLicenseGrid.jsp"/>
			<!--申请授权产品  -->
			<jsp:include page="/contract/csLicense/csLicProdGrid.jsp"/>
		</div>
		<jsp:include page="/ame_common/misOpinion.jsp"/>
	</div>
</body>
<script type="text/javascript">
	nui.parse();
	
	var formCont = new nui.Form("#form_cont");//合同信息
  	var csLiceSendForm = new nui.Form("#form_csLiceSend");//申请信息
	var csContLicense_grid = nui.get("csContLicense_grid");//合同授权清单
	var csLicProd_grid = nui.get("csLicProd_grid");//申请授权产品
  	var opioionform = new nui.Form("opioionform");//审核意见
	
	var processInstID = <%=request.getParameter("processInstID") %>;
  	var sendid = <%=request.getParameter("sendid") %>;
	
	var paths = "<%= request.getContextPath() %>"; //默认路径，js文件不能直接取，定义全局变量
	
	init();
	
	var csLiceSend;
	var cscontract;
	
	function init(){
		csLiceSendForm.mask("数据加载中...");
		var data={"sendid":sendid,"processInstID":processInstID};
		var json=nui.encode(data);
  		nui.ajax({
      		url: "com.primeton.mis.contract.csLicense.getCsLiceSend.biz.ext",
	      	type: 'POST',
          	data: json,
      		success: function (o){
      			csLiceSendForm.unmask();
       	  		nui.get("projectid").setData(o.csLiceSend.list);
       	  		csLiceSendForm.setData(o);
       	  		csLiceSend = o.csLiceSend;
       	  		cscontract = o.csLiceSend.cscontract;
       	  		
  				nui.get("projectname").setValue(cscontract.projectname);
  				nui.get("projectname").setText(cscontract.projectname);
  				nui.get("projectname").setReadOnly(true);
	            nui.get("projectid").setReadOnly(true);
  				nui.get("senddate").setReadOnly(true);
  				nui.get("inceptperson").setReadOnly(true);
  				nui.get("remark").setReadOnly(true);
  				
	            document.getElementById("contnum").innerHTML = cscontract.contnum == null ?"":cscontract.contnum;
            	document.getElementById("contsum").innerHTML = cscontract.contsum == null ?"":formatNumber(cscontract.contsum,'#,##.##');
            	
            	document.getElementById("salename").innerHTML = cscontract.salename == null ?"":cscontract.salename;
            	document.getElementById("custname").innerHTML = cscontract.misCustinfo==null?"": cscontract.misCustinfo.custname == null ?"":cscontract.misCustinfo.custname;
            	document.getElementById("contreg").innerHTML = cscontract.contreg == null ?"":cscontract.contreg;
  				
  				nui.get("inceptperson").setText(csLiceSend.inceptperson);
  				
  				var grid_0 = nui.get("grid_0");
				grid_0.load({"groupid":"CS_LICE_SEND","relationid":csLiceSend.sendid});
				grid_0.sortBy("fileTime","desc");
				
  				csContLicense_grid.sortBy("contlicid","asc");
				csContLicense_grid.load({contnum: cscontract.contnum},function(e){
					csContLicense_grid.hideColumn (0);
					csLicProd_grid.load({contractid:cscontract.contractid,sendid:csLiceSend.sendid});
					csLicProd_grid.setFrozenStartColumn(0);
					csLicProd_grid.setFrozenEndColumn(4);
					
				});
				
  				//查询审核意见
				var grid = nui.get("datagrid1");
				grid.sortBy("time", "desc");
				grid.load({processInstID: csLiceSend.processinstid});
				
				$("#opinionHide").hide();
				
          	},
	      	error: function (jqXHR, textStatus, errorThrown) {
	        	alert(jqXHR.responseText);
	      	}
    	});
	}
</script>
<script src="<%=request.getContextPath() %>/contract/csLicense/js/csLicense.js" type="text/javascript"></script>
</html>
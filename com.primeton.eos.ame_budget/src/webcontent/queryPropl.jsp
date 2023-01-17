<%@page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@include file="/common/common.jsp"%>
<%@include file="/nui/common.jsp"%>
<h:script src='<%="/common/scripts/eos-web.js"%>' />
<link id="css_skin" rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/coframe/tools/skins/skin1/style.css" />
<%@page import="com.eos.data.datacontext.UserObject"%>
<%@page import="java.util.Map"%>
<%@page import="commonj.sdo.DataObject"%>

<head>
	<title>项目预算与执行损益对照表</title>
	<meta http-equiv="content-type" content="text/html; charset=UTF-8" />
	<script src="<%= request.getContextPath() %>/common/nui/nui.js" type="text/javascript"></script>
	<style type="text/css">
	    body{
	        margin:0;padding:0;border:0;width:100%;height:100%;overflow:hidden;
	    }
	     .mybox, .mybox .mini-textbox-input
    {
            background:#FFB90F;
    }
    </style>
    
</head>
<body>
<div class="nui-fit">
	     
       <form id="form2" method="post" >
       	<fieldset id="field1" style="border:solid 1px #aaa;padding:8px;">
	    <legend>项目基本信息</legend>         
	   		<div style="padding:8px;">
            	<table style="table-layout:fixed;">
					<tr>
               	 	<td style="width:105px" align="right">项目名称:</td>
               	 	<td style="width:200px" id="projectName"></td>
                    <td style="width:90px" align="right">项目编号:</td>
                    <td style="width:140px" id="projectno"></td>
                    <td style="width:105px" align="right">当前阶段:</td>
                    <td style="width:200px" id="outstatus"></td>
                    <td style="width:90px" align="right">项目创建日期:</td>
                    <td style="width:140px" id="createdate"></td>         
                </tr>                  
                 <tr>
                	<td style="width:105px" align="right">所属客户:</td>
					<td style="width:200px" id="custname"></td>
					 <td style="width:90px" align="right">受益销售:</td>
                    <td style="width:140px" id="sybm"></td>
                    <td style="width:105px" align="right">当前预算版本号:</td>
					<td style="width:200px" id="versionid"></td>  
					<td style="width:90px" align="right">预算评估日期:</td>
                    <td style="width:140px" id="budgetdate"></td>  
                </tr>
                 <tr>
                	<td style="width:105px" align="right" id = "qddate1"></td>
                    <td style="width:140px" id="qddate" ></td>
                	<td style="width:90px" align="right">合同编号:</td>
                    <td style="width:140px" id="contnum"></td>    
                	<td style="width:105px" align="right">收入确认比例:</td>
					<td style="width:200px" id="srpratio"></td>
                    <td style="width:90px" align="right">最近确认日期:</td>
					<td style="width:200px" id="confirmdate"></td>
                </tr>
                <tr>
                    <td  style="width:105px" align="right">项目开始日期:</td>
                    <td style="width:200px" id="startdate"></td>
                    <td style="width:90px" align="right">计划结束日期:</td>
                    <td style="width:140px" id="expenddate"></td>
                    <td></td><td></td>   
                    <td></td><td></td>                                                                                                                                                                       
                </tr>
				</table>
        	</div>
	    </fieldset> 
        <fieldset id="field2" style="border:solid 1px #aaa;padding:8px;">
            <legend>项目预算与执行损益对照表</legend>                       
            <div style="padding:8px;">
            <table style="table-layout:fixed;" style="border-collapse:collapse" bordercolor="#A8A8A8" border="1" cellspacing="0" id="table_file">
                <tr class="nui-toolbar">
               	 	<td style="padding-left:50px;width:160px">指标项</td>
                    <td style="width:160px" align="center">项目预算</td>          
					<td style="width:160px" align="center">项目执行</td>		                 
                
                </tr>                  
                <tr>
                    <td style="width:140px">一、项目合同额</td>
                    <td  style="width:160px" align="right" id="contamt"></td>
                    
                    <td style="width:160px" align="right"  id="contamt1"></td>                                                                                                                                                                          
                </tr>
                <tr>
                    <td style="padding-left:50px";width:140px" id="cpht1">1.产品合同额</td>
                    <td style="width:160px" align="right" id="pcontamt"></td>
                    <td style="width:160px" align="right" id="pcontamt1"></td>                       
                </tr>
                <tr>
                    <td style="padding-left:50px;width:140px">2.服务合同额</td>
                    <td style="width:160px" align="right" id="scontamt"></td>
                    <td style="width:160px" align="right" id="scontamt1"></td>                   
                </tr>
                <tr>
                    <td style="padding-left:50px;width:140px">3.MA合同额</td>
                    <td style="width:160px" align="right" id="mcontamt"></td>
                    <td style="width:160px" align="right" id="mcontamt1"></td>                     
                </tr>
                
                <tr>
                    <td style="width:140px">二、项目毛收入</td>
                    <td style="width:160px" align="right" id="pnetincome"></td>
                    <td style="width:160px" align="right" id="pnetincome1"></td>                     
                </tr>
                <tr >
                    <td style="padding-left:50px;width:140px">1.产品不含税收入</td>
                    <td style="width:160px" align="right" id="pntaxincome"></td>
                    <td style="width:160px" align="right" id="pntaxincome1"></td>
				</tr>
                 <tr >
                    <td style="padding-left:50px;width:140px">2.服务不含税收入</td>
                    <td style="width:160px" align="right" id="sntaxincome"></td>
                    <td style="width:160px" align="right" id="sntaxincome1"></td>
				</tr>
				<tr >
                    <td style="padding-left:50px;width:140px">3.MA不含税收入</td>
                    <td style="width:160px" align="right" id="mntaxincome"></td>
                    <td style="width:160px" align="right" id="mntaxincome1"></td>
				</tr>
                <tr >
                    <td style="padding-left:50px;width:140px">4.产品退税</td>
                    <td style="width:160px" align="right" id="ppayback"></td>
                    <td style="width:160px" align="right" id="ppayback1"></td>
                </tr>
                <!--  <tr >
                    <td style="padding-left:50px;width:140px">减：外包2</td>
                    <td style="width:160px" align="right" id="pconsultfee"></td>
                    <td style="width:160px" align="right" id="pconsultfee1"></td>
                </tr> -->
                <tr>
                    <td style="width:140px">三、项目总成本 </td>
                    <td style="width:160px" align="right" id="pcostsum"></td>
                    <td style="width:160px" align="right" id="pcostsum1"></td>
	            </tr>
                <tr >
                    <td style="padding-left:50px;width:140px">1.项目立项前已发生成本</td>
                    <td style="width:160px" align="right" id="pcosts"></td>
                    <td style="width:160px" align="right" id="pcosts1"></td>
				</tr>
	            <tr >
                    <td style="padding-left:50px;width:140px">2.项目实施内部人力成本</td>
                    <td style="width:160px" align="right" id="pempcost"></td>
                    <td style="width:160px" align="right" id="pempcost1"></td>
	            </tr>
	            <tr >
                    <td style="padding-left:50px;width:140px">3.项目实施直接费用成本</td>
                    <td style="width:160px" align="right" id="pdircost"></td>
                    <td style="width:160px" align="right" id="pdircost1"></td>
	            </tr>
	             <tr >
                    <td style="padding-left:50px;width:160px">4.项目实施外包成本(不含税)</td>
                    <td style="width:160px" align="right" id="poutcost"></td>
                    <td style="width:160px" align="right" id="poutcost1"></td>
	            </tr>
	            <tr >
                    <td style="padding-left:50px;width:160px">5：项目外部采购(不含税)</td>
                    <td style="width:160px" align="right" id="pconsultfee"></td>
                    <td style="width:160px" align="right" id="pconsultfee1"></td>	
                </tr>
	             <tr >
                    <td style="padding-left:50px;width:140px">6.预计免费维护期成本</td>
                    <td style="width:160px" align="right" id="expfmaincost"></td>
                    <td style="width:160px" align="right" id="expfmaincost1"></td>
	            </tr>
	             <tr >
                    <td style="padding-left:50px;width:140px">7.其他</td>
                    <td style="width:160px" align="right" id="othfee"></td>
                    <td style="width:160px" align="right" id="othfee1"></td>
	            </tr>
	            <tr >
                    <td style="padding-left:50px;width:140px">减：第三方分摊成本</td>
                    <td style="width:160px" align="right" id="expthirdpay"></td>
                    <td style="width:160px" align="right" id="expthirdpay1"></td>
	            </tr>
	            <tr>
                    <td style="width:140px">五、项目毛利</td>
                    <td style="width:160px" align="right" id="pgrossprofit"></td>
                    <td style="width:160px" align="right" id="pgrossprofit1"></td>
	            </tr>
	            <tr>
                    <td style="width:140px">六、项目毛利率</td>
                    <td style="width:160px" align="right" id="pgprate"></td>
                    <td style="width:160px" align="right" id="pgprate1"></td>
            </table>
        	</div>
        </fieldset>   
    </form>        
</div>
<script type="text/javascript">
	nui.parse();
	var form = new nui.Form("form2");
	var projectid="<b:write property='projectId'/>";
	var projectname="<b:write property='projectName'/>";
	var projectno="<b:write property='projectno'/>";
	var outstatus="<b:write property='outstatus'/>";
	var createdate="<b:write property='createdate'/>";
	var startdate="<b:write property='startdate'/>";
	var expenddate="<b:write property='expenddate'/>";
	var sybm="<b:write property='sybm'/>";
	var custname="<b:write property='custname'/>";
	var contnum="<b:write property='contnum'/>";
	var flag="<b:write property='flag'/>";
        
	function getUrlParam(name) { 
		var reg = new RegExp("(^|&)" + name + "=([^&]*)(&|$)"); 
		var r = window.location.search.substr(1).match(reg); 
		if (r != null) 
		return unescape(r[2]); 
		return null; 
	}
	//合同列表点击金额赋值项目Id
	var projectId = getUrlParam("projectId");
	var flag = getUrlParam("flag");
	init();
	function init(){
		var json = "";
		if(flag == "1"){
			json = nui.encode({projectid: projectId});
		}else{
			json = nui.encode({budget:{projectid: projectid}});
		}
		form.loading("数据加载中...");
    	nui.ajax({
            url: "com.primeton.eos.ame_budget.ame_budget.getPropl.biz.ext",
			type: 'POST',
			data: json,	
			contentType: 'text/json',
            success: function (o) {
            	form.unmask();
            	var pnetincomeTemp="";
            	var pconsultfeeTemp="";
            	var psubfeeTemp="";
            	var poutcostTemp="";
            	if(flag == "1"){
            		document.getElementById("startdate").innerHTML = o.rdProject.startdate == null ? "" : o.rdProject.startdate;
	            	document.getElementById("expenddate").innerHTML = o.rdProject.expenddate == null ? "" : o.rdProject.expenddate;
	            	document.getElementById("projectName").innerHTML = o.rdProject.projectName == null ? "" : o.rdProject.projectName;
	            	document.getElementById("createdate").innerHTML = o.rdProject.createdate == null ? "" : o.rdProject.createdate;
	            	document.getElementById("projectno").innerHTML = o.rdProject.projectno == null ? "" : o.rdProject.projectno;
	            	projectno = o.rdProject.projectno == null ? "" : o.rdProject.projectno;
	            	document.getElementById("outstatus").innerHTML = o.rdProject.outstatus == null ? "" : nui.getDictText('MIS_PROJOUTSTATUS',outstatus);
            	}else{
	            	document.getElementById("startdate").innerHTML =startdate;
	            	document.getElementById("expenddate").innerHTML =expenddate;
	            	document.getElementById("projectName").innerHTML =projectname;
	            	document.getElementById("createdate").innerHTML =createdate;
	            	document.getElementById("projectno").innerHTML =projectno;
	            	document.getElementById("outstatus").innerHTML =nui.getDictText('MIS_PROJOUTSTATUS',outstatus);
	            	document.getElementById("sybm").innerHTML =sybm;
	            	document.getElementById("custname").innerHTML =custname;
	            	document.getElementById("contnum").innerHTML =contnum;
            	}
            	document.getElementById("confirmdate").innerHTML =o.budget.confirmdate == null ?"":o.budget.confirmdate;
            	document.getElementById("qddate").innerHTML =o.budget.qddate == null ?"":o.budget.qddate;
            	
            	if(o.budget.srpratio){
	            	document.getElementById("srpratio").innerHTML =((o.budget.srpratio)*100).toFixed(0)+"%" == 0 ?"":((o.budget.srpratio)*100).toFixed(0)+"%";
            	}
            	if(contnum){
            		document.getElementById("qddate1").innerHTML = "合同登记日期:";
            	}else{
            		document.getElementById("qddate1").innerHTML = "合同预计签订日期:";
            	}
            	if(o.budget.budgetdate){
					document.getElementById("budgetdate").innerHTML = o.budget.budgetdate;
				}
				if(o.budget.versionid){
					document.getElementById("versionid").innerHTML = "版本V"+o.budget.versionid;
				}
				if(o.budget1.contamt){
					document.getElementById("contamt1").innerHTML = formatNumber(o.budget1.contamt,'#,##');
				}else{
					document.getElementById("contamt1").innerHTML = 0;
				}
				if(o.budget1.pcontamt){
					document.getElementById("pcontamt1").innerHTML = formatNumber(o.budget1.pcontamt,'#,##');
				}else{
					document.getElementById("pcontamt1").innerHTML = 0;
				}
				if(o.budget1.scontamt){
					document.getElementById("scontamt1").innerHTML = formatNumber(o.budget1.scontamt,'#,##');
				}else{
					document.getElementById("scontamt1").innerHTML = 0;
				}
				if(o.budget1.mcontamt){
					document.getElementById("mcontamt1").innerHTML = formatNumber(o.budget1.mcontamt,'#,##');
				}else{
					document.getElementById("mcontamt1").innerHTML = 0;
				}
				if(o.budget1.pnetincome){
					document.getElementById("pnetincome1").innerHTML = formatNumber(o.budget1.pnetincome,'#,##');
					pnetincomeTemp=o.budget1.pnetincome;
				}else{
					document.getElementById("pnetincome1").innerHTML = 0;
					pnetincomeTemp=0;
				}
				if(o.budget1.pntaxincome){
					document.getElementById("pntaxincome1").innerHTML = formatNumber(o.budget1.pntaxincome,'#,##');
				}else{
					document.getElementById("pntaxincome1").innerHTML = 0;
				}
				if(o.budget1.sntaxincome){
					document.getElementById("sntaxincome1").innerHTML = formatNumber(o.budget1.sntaxincome,'#,##');
				}else{
					document.getElementById("sntaxincome1").innerHTML = 0;
				}
				if(o.budget1.mntaxincome){
					document.getElementById("mntaxincome1").innerHTML = formatNumber(o.budget1.mntaxincome,'#,##');
				}else{
					document.getElementById("mntaxincome1").innerHTML = 0;
				}
				if(o.budget1.ppayback){
					document.getElementById("ppayback1").innerHTML = formatNumber(o.budget1.ppayback,'#,##');
				}else{
					document.getElementById("ppayback1").innerHTML = 0;
				}
				if(o.budget1.psubfee){
					psubfeeTemp=o.budget1.psubfee;
				}else{
					psubfeeTemp=0;
				} 
				if(o.budget1.pconsultfee){
					pconsultfeeTemp=o.budget1.pconsultfee;
					document.getElementById("pconsultfee1").innerHTML = "<a href='javascript:void(0)' onclick='checkDetail3();' title='点击查看'>"+ formatNumber(pconsultfeeTemp,'#,##') +"</a>";
				}else{
					document.getElementById("pconsultfee1").innerHTML = 0;
					pconsultfeeTemp=0;
				}
				if(o.budget1.pcostsum){
					document.getElementById("pcostsum1").innerHTML = formatNumber(o.budget1.pcostsum,'#,##');
				}else{
					document.getElementById("pcostsum1").innerHTML = 0;
				}
				if(o.budget1.pcosts){
					document.getElementById("pcosts1").innerHTML = formatNumber(o.budget1.pcosts,'#,##');
				}else{
					document.getElementById("pcosts1").innerHTML = 0;
				}
				if(o.budget1.pempcost){
					document.getElementById("pempcost1").innerHTML = "<a href='javascript:void(0)' onclick='checkDetail1();' title='点击查看'>"+ formatNumber(o.budget1.pempcost,'#,##') +"</a>";
				}else{
					document.getElementById("pempcost1").innerHTML = 0;
				}
				if(o.budget1.pdircost){
					document.getElementById("pdircost1").innerHTML = "<a href='javascript:void(0)' onclick='checkDetail();' title='点击查看'>"+ formatNumber(o.budget1.pdircost,'#,##') +"</a>";
				}else{
					document.getElementById("pdircost1").innerHTML = 0;
				}
				if(o.budget1.poutcost){
					poutcostTemp =o.budget1.poutcost;
					document.getElementById("poutcost1").innerHTML = "<a href='javascript:void(0)' onclick='checkDetail2();' title='点击查看'>"+ formatNumber(poutcostTemp,'#,##') +"</a>";
					/* document.getElementById("poutcost1").innerHTML = formatNumber(o.budget1.poutcost,'#,##'); */
				}else{
					document.getElementById("poutcost1").innerHTML = 0;
				}
				if(o.budget1.expfmaincost){
					document.getElementById("expfmaincost1").innerHTML = formatNumber(o.budget1.expfmaincost,'#,##');
				}else{
					document.getElementById("expfmaincost1").innerHTML = 0;
				}
				if(o.budget1.othfee){
					document.getElementById("othfee1").innerHTML = formatNumber(o.budget1.othfee,'#,##');
				}else{
					document.getElementById("othfee1").innerHTML = 0;
				}
				if(o.budget1.expthirdpay){
					document.getElementById("expthirdpay1").innerHTML = formatNumber(o.budget1.expthirdpay,'#,##');
				}else{
					document.getElementById("expthirdpay1").innerHTML = 0;
				}
				if(o.budget1.pgrossprofit){
					document.getElementById("pgrossprofit1").innerHTML = formatNumber(o.budget1.pgrossprofit,'#,##');
				}else{
					document.getElementById("pgrossprofit1").innerHTML = 0;
				}
				if(pnetincomeTemp+pconsultfeeTemp!=0){
            		var pgprate1=(o.budget1.pgrossprofit/(o.budget1.pnetincome+o.budget1.pconsultfee)*100).toFixed(1)+"%";
            		document.getElementById("pgprate1").innerHTML = pgprate1;
            	}else {
            		var pgprate1=0;
            		document.getElementById("pgprate1").innerHTML = pgprate1;
            	}
				document.getElementById("contamt").innerHTML =o.budget.contamt == null ?"":formatNumber(o.budget.contamt,'#,##');
				document.getElementById("pcontamt").innerHTML =o.budget.pcontamt == null ?"":formatNumber(o.budget.pcontamt,'#,##');
				document.getElementById("scontamt").innerHTML = o.budget.scontamt == null ?"":formatNumber(o.budget.scontamt,'#,##');
				document.getElementById("mcontamt").innerHTML = o.budget.mcontamt == null ?"":formatNumber(o.budget.mcontamt,'#,##');
				document.getElementById("pnetincome").innerHTML = o.budget.pnetincome == null ?"":formatNumber(o.budget.pnetincome,'#,##');
				document.getElementById("pntaxincome").innerHTML = o.budget.pntaxincome == null ?"":formatNumber(o.budget.pntaxincome,'#,##');
				document.getElementById("sntaxincome").innerHTML = o.budget.sntaxincome == null ?"":formatNumber(o.budget.sntaxincome,'#,##');
				document.getElementById("mntaxincome").innerHTML = o.budget.mntaxincome == null ?"":formatNumber(o.budget.mntaxincome,'#,##');
				document.getElementById("ppayback").innerHTML = o.budget.ppayback == null ?"":formatNumber(o.budget.ppayback,'#,##');
				//document.getElementById("pconsultfee").innerHTML = o.budget.pconsultfee == null ?"":formatNumber(o.budget.pconsultfee,'#,##');
				document.getElementById("pconsultfee").innerHTML = o.budget.pconsultfee == null ?"":formatNumber(o.budget.pconsultfee,'#,##');
				document.getElementById("pcostsum").innerHTML = o.budget.pcostsum == null ?"":formatNumber(o.budget.pcostsum,'#,##');
				document.getElementById("pcosts").innerHTML = o.budget.pcosts == null ?"":formatNumber(o.budget.pcosts,'#,##');
				document.getElementById("pempcost").innerHTML = o.budget.pempcost == null ?"":formatNumber(o.budget.pempcost,'#,##');
				document.getElementById("pdircost").innerHTML = o.budget.pdircost == null ?"":formatNumber(o.budget.pdircost,'#,##');
				document.getElementById("poutcost").innerHTML = o.budget.poutcost == null ?"":formatNumber(o.budget.poutcost,'#,##');
				document.getElementById("expfmaincost").innerHTML = o.budget.expfmaincost == null ?"":formatNumber(o.budget.expfmaincost,'#,##');
				document.getElementById("othfee").innerHTML = o.budget.othfee == null ?"":formatNumber(o.budget.othfee,'#,##');
				document.getElementById("expthirdpay").innerHTML = o.budget.expthirdpay == null ?"":formatNumber(o.budget.expthirdpay,'#,##');
				document.getElementById("pgrossprofit").innerHTML = o.budget.pgrossprofit == null ?"":formatNumber(o.budget.pgrossprofit,'#,##');
				document.getElementById("pgprate").innerHTML = o.budget.pgprate == null ?"":o.budget.pgprate;
			}
		});
	}
	
	function dictstatus(e) {
		return nui.getDictText('MIS_BUDSTATUS',e.value);//设置业务字典值
	}
	function dictversion(e) {
		return nui.getDictText('MIS_YN',e.value);//设置业务字典值
	}
	function checkDetail(){
		var executeUrl = "/default/ame_budget/detailPdircost.jsp?id=" + projectid;
		window.open(executeUrl, "应用详细信息", "fullscreen=1");
    }
    function checkDetail1(){
		var executeUrl = "/default/ame_budget/detailPempcost.jsp?id=" + projectid;
		window.open(executeUrl, "应用详细信息", "fullscreen=1");
    }
    function checkDetail2(){
		var executeUrl = "/default/ame_budget/detailPoutcost.jsp?id=" + projectno+"&costtype="+1;
		window.open(executeUrl, "应用详细信息", "width=900px,height=700px","resizable=yes");
    }
    function checkDetail3(){
		var executeUrl = "/default/ame_budget/detailPoutcost.jsp?id=" + projectno+"&costtype="+0;
		window.open(executeUrl, "应用详细信息", "width=900,height=700","resizable=yes");
    }
</script>
</body>
</html>
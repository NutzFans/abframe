<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@include file="/common/common.jsp"%>
<%@include file="/common/skins/skin0/component.jsp" %>
<html>
<!-- 
  - Author(s): mengyy
  - Date: 2018-02-28 14:08:52
  - Description:
-->
<head>
<title>项目损益</title>
<%@include file="/common/skins/skin0/component.jsp" %>
<meta http-equiv="content-type" content="text/html; charset=UTF-8" />
<script src="<%= request.getContextPath() %>/common/nui/nui.js" type="text/javascript"></script>
</head>
<body>
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
            <td style="width:140px">三、产品退税</td>
            <td style="width:160px" align="right" id="ppayback"></td>
            <td style="width:160px" align="right" id="ppayback1"></td>
        </tr>
        <!--  <tr >
            <td style="padding-left:50px;width:140px">减：外包2</td>
            <td style="width:160px" align="right" id="pconsultfee"></td>
            <td style="width:160px" align="right" id="pconsultfee1"></td>
        </tr> -->
        <tr>
            <td style="width:140px">四、项目总成本 </td>
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
            <td style="padding-left:50px;width:160px">5.项目外部采购(不含税)</td>
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
        </tr>
        <tr>
            <td style="width:140px;">内部人力投入人月数</td>
            <td style="width:160px" align="right" id="empmonth"></td>
            <td style="width:160px" align="right" id="empmonth1"></td>
        </tr>
        <tr>
            <td style="width:140px;">外包人力投入人月数</td>
            <td style="width:160px" align="right" id="outmonth"></td>
            <td style="width:160px" align="right" id="outmonth1"></td>
        </tr>
         <tr class="nui-toolbar">
       	 	<td style="width:160px;" align="left" colspan="3">
	       	 	<input id="labortype" class="nui-radiobuttonlist" valueField="id" textField="text" 
					data="[{'id': '0','text': '按工时转换成本统计'},{'id': '1','text': '按工时结算成本统计'}]" value="0"
					 onvaluechanged="changeLaborType">
			</td>
        
        </tr> 
    </table>
<script type="text/javascript">
	nui.parse();
	
    var projectid = '<%=request.getParameter("projid")%>';
    var projectno;
    var pnetincome,ppayback;//全局化这些数据以便切换人力成本类型时计算
    var pgrossprofit,pcostsum,pempcost;//全局化这些数据以便切换人力成本类型时展示--转换工时成本
    var pgrossprofit1,pcostsum1,pempcost1;//全局化这些数据以便切换人力成本类型时展示--结算工时成本
    init();
	function init(){
		var json = "";
		json = nui.encode({projectid: projectid});
    	nui.ajax({
            url: "com.primeton.eos.ame_budget.ame_budget.getPropl.biz.ext",
			type: 'POST',
			data: json,	
			contentType: 'text/json',
            success: function (o) {
            	var pnetincomeTemp="";
            	var pconsultfeeTemp="";
            	var psubfeeTemp="";
            	var poutcostTemp="";
            	pgrossprofit=o.budget1.pgrossprofit;
            	pgrossprofit1=o.budget1.pgrossprofit1;
            	pcostsum1=o.budget1.pcostsum1;
            	pcostsum=o.budget1.pcostsum;
            	pempcost1=o.budget1.pempcost1;
            	pempcost=o.budget1.pempcost;
            	pgprate=o.budget1.pgprate;
            	pgprate1=o.budget1.pgprate1;
            	pnetincome=o.budget1.pnetincome;
            	ppayback=o.budget1.ppayback;
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
					document.getElementById("pdircost1").innerHTML = "<a href='javascript:void(0)' onclick='checkDetail4();' title='点击查看'>"+ formatNumber(o.budget1.pdircost,'#,##') +"</a>";
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
				
        		document.getElementById("pgprate1").innerHTML = pgprate;
            	document.getElementById("outmonth1").innerHTML =o.budget1.outmonth == null ?"":o.budget1.outmonth;
            	document.getElementById("outmonth").innerHTML =o.budget.outmonth == null ?"":o.budget.outmonth;
            	document.getElementById("empmonth1").innerHTML =o.budget1.empmonth == null ?"":o.budget1.empmonth;
            	document.getElementById("empmonth").innerHTML =o.budget.empmonth == null ?"":o.budget.empmonth;
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
				projectno = o.rdProject.projectno == null ?"":o.rdProject.projectno;
			}
		});
	}
	
	function checkDetail4(){
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
    
    //切换工时成本统计类型时触发的方法
    function changeLaborType(e){
    	if(e.value=="0"){
    		if(pcostsum){
	    		document.getElementById("pcostsum1").innerHTML = formatNumber(pcostsum,'#,##');
    		}else{
    			document.getElementById("pcostsum1").innerHTML = 0;
    		}
    		if(pempcost){
	    		document.getElementById("pempcost1").innerHTML = "<a href='javascript:void(0)' onclick='checkDetail1();' title='点击查看'>"+ formatNumber(pempcost,'#,##') +"</a>";
    		}else{
	    		document.getElementById("pempcost1").innerHTML = 0;
    		}
    		if(pgrossprofit){
	    		document.getElementById("pgrossprofit1").innerHTML = formatNumber(pgrossprofit,'#,##');
    		}else{
    			document.getElementById("pgrossprofit1").innerHTML = 0;
    		}
    		if(pgprate){
        		document.getElementById("pgprate1").innerHTML = pgprate;
        	}else {
        		document.getElementById("pgprate1").innerHTML = 0;
        	}
    	}else{
    		if(pcostsum1){
	    		document.getElementById("pcostsum1").innerHTML = formatNumber(pcostsum1,'#,##');
    		}else{
    			document.getElementById("pcostsum1").innerHTML = 0;
    		}
    		if(pempcost1){
	    		document.getElementById("pempcost1").innerHTML = "<a href='javascript:void(0)' onclick='checkDetail1();' title='点击查看'>"+ formatNumber(pempcost1,'#,##') +"</a>";
    		}else{
	    		document.getElementById("pempcost1").innerHTML = 0;
    		}
    		if(pgrossprofit1){
	    		document.getElementById("pgrossprofit1").innerHTML = formatNumber(pgrossprofit1,'#,##');
    		}else{
    			document.getElementById("pgrossprofit1").innerHTML = 0;
    		}
    		if(pgprate1){
        		document.getElementById("pgprate1").innerHTML = pgprate1;
        	}else {
        		document.getElementById("pgprate1").innerHTML = 0;
        	}
    	}
    }
</script>
</body>
</html>
<%@page pageEncoding="UTF-8"%>
<%@include file="/common/common.jsp"%>
<%@include file="/common/skins/skin0/component.jsp" %>

<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib uri="/WEB-INF/runqianReport4.tld" prefix="report"%>

<h:css href="/css/style1/style-custom.css"/>
<html>
<!-- 
  - Author(s): huangqj
  - Date: 2013-07-01 14:17:30
  - Description:
-->
<head>
<title>绩效报表条件页面</title>
</head>
<body>
<table align="center" border="0" width="100%" class="form_table">
	<tr>
		<td class="form_label" width="10%">第一级部门：</td>
		<td id="firstBM"></td>
	</tr>
	<tr>
		<td class="form_label" width="10%">第二级部门：</td>
		<td id="secondBM"></td>
	</tr>
	<tr>
		<td class="form_label" width="10%">第三级部门：</td>
		<td id="ThirdBM"></td>
	</tr>
</table>

<!-- 
<report:param name="jxcParam" paramFileName="rpt_test_unit_arg.raq"/>
<report:group groupFileName="rpt_test_unit.rpg" needPrint='yes' needSaveAsExcel='yes' needSaveAsPdf='yes'  needSaveAsWord='yes'/>
 -->


</body>
</html>
<script>
doSelectFirst();
function doSelectFirst(){
	document.getElementById("secondBM").innerHTML = "";
	document.getElementById("ThirdBM").innerHTML = "";
	//调用业务流
	var myAjax = new Ajax("com.bos.mp.common.performance.getFirstBM.biz");
	//添加参数, 第一个为参数名, 第二个为参数值
	myAjax.addParam("orgid", "");
	//还支持其他形式的参数,如entity,form等,详见参考手册.
	//开始调用
	myAjax.submit();
	//取得调用后的结果
	var orgnames =myAjax.getValues("/root/data/oaOrg/deptname");
	var orgids =myAjax.getValues("/root/data/oaOrg/deptno");
	var orgseqs =myAjax.getValues("/root/data/oaOrg/bgtunitno");
	var tempStr = "";
	for(var i=0;i<orgids.length;i++){
		tempStr += "<a href='#' onmouseover='doSelectSecond(" + orgids[i] + ");' onclick=doPerformance('" + orgids[i] + "','" + orgnames[i] + "','" + orgseqs[i] + "');>"+orgnames[i]+"</a>&nbsp;&nbsp;&nbsp;&nbsp;";
		if(i==0){
			doSelectSecond(orgids[i]);
		}
	}
	document.getElementById("firstBM").innerHTML = tempStr;
}
function doSelectSecond(parentorgid){
	document.getElementById("ThirdBM").innerHTML = "";
	var myAjax = new Ajax("com.bos.mp.common.performance.queryOrgByParent.biz");
	//添加参数, 第一个为参数名, 第二个为参数值
	myAjax.addParam("oParentOrg/deptno", parentorgid);
	myAjax.submit();
	//取得调用后的结果
	var orgnames =myAjax.getValues("/root/data/oaOrg/deptname");
	var orgids =myAjax.getValues("/root/data/oaOrg/deptno");
	var orgseqs =myAjax.getValues("/root/data/oaOrg/bgtunitno");
	var tempStr = "";
	for(var i=0;i<orgids.length;i++){
		tempStr += "<a href='#' onmouseover='doSelectThird(" + orgids[i] + ");' onclick=doPerformance('" + orgids[i] + "','" + orgnames[i] + "','" + orgseqs[i] + "');>"+orgnames[i]+"</a>&nbsp;&nbsp;&nbsp;&nbsp;";
		if(i==0){
			doSelectThird(orgids[i]);
		}
	}
	document.getElementById("secondBM").innerHTML = tempStr;
}
function doSelectThird(parentorgid){
	var myAjax = new Ajax("com.bos.mp.common.performance.queryOrgByParent.biz");
	//添加参数, 第一个为参数名, 第二个为参数值
	myAjax.addParam("oParentOrg/deptno", parentorgid);
	myAjax.submit();
	//取得调用后的结果
	var orgnames =myAjax.getValues("/root/data/oaOrg/deptname");
	var orgids =myAjax.getValues("/root/data/oaOrg/deptno");
	var orgseqs =myAjax.getValues("/root/data/oaOrg/bgtunitno");
	var tempStr = "";
	for(var i=0;i<orgids.length;i++){
		tempStr += "<a href='#' onclick=doPerformance('" + orgids[i] + "','" + orgnames[i] + "','" + orgseqs[i] + "');>"+orgnames[i]+"</a>&nbsp;&nbsp;&nbsp;&nbsp;";
	}
	document.getElementById("ThirdBM").innerHTML = tempStr;
}
function doPerformance(orgid,orgname,orgseq){
	alert(orgid+orgname+ orgseq+"这里是调你的报表！");
	window.location.reload();
}
</script>
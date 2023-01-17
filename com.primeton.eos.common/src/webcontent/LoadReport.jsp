<%@page pageEncoding="UTF-8"%>
<%@include file="/common/common.jsp"%>
<%@include file="/common/skins/skin0/component.jsp" %>
<h:css href="/css/style1/style-custom.css"/>
<html>
<!-- 
  - Author(s): huangqj
  - Date: 2013-09-11 13:59:47
  - Description:
-->
<head>
<title>Title</title>
</head>
<body>
	<h:form  name="query_form" action="com.primeton.eos.common.loadReport.flow" checkType="blur" target="_self" method="post" onsubmit="return checkForm(this);">
        <input type="hidden" name="_eosFlowAction" value="load"/>
        <input type="hidden" name="temp/isupdate" id="isupdate"/>
        <w:panel id="panel1" width="100%" title="报表数据月加载：">
          <table align="center" border="0" width="100%" class="form_table">
            <tr>
              <td class="form_label">数据加载内容</td>
              <td colspan="1">
				<h:select property="temp/splName">
					<h:option value="sp_erprpt_manualLoadMon" label="全部费用"/>
					<h:option value="sp_erprpt_loadCommExpMon" label="公共费用"/>
					<h:option value="sp_erprpt_loadDeptExpMon_NEW" label="部门费用"/>
					<%-- <h:option value="sp_erprpt_loadPesonExpMon" label="个人费用"/>
					<h:option value="sp_erprpt_loadPrjExpMon" label="项目费用"/> --%>
				</h:select>
              </td>
              <td class="form_label">年份</td>
              <td colspan="1">
				<h:select property="temp/year">
					<h:option value="2013" label="2013"/>
					<h:option value="2014" label="2014"/>
					<h:option value="2015" label="2015"/>
					<h:option value="2016" label="2016"/>
					<h:option value="2017" label="2017"/>
					<h:option value="2018" label="2018"/>
					<h:option value="2019" label="2019"/>
					<h:option value="2020" label="2020"/>
					<h:option value="2021" label="2021"/>
					<h:option value="2022" label="2022"/>
					<h:option value="2023" label="2023"/>
					<h:option value="2024" label="2024"/>
					<h:option value="2025" label="2025"/>
				</h:select>
              </td>
              <td class="form_label">月份</td>
              <td colspan="1">
                <h:select property="temp/month">
                	<h:option value="1" label="1"/>
                	<h:option value="2" label="2"/>
                	<h:option value="3" label="3"/>
                	<h:option value="4" label="4"/>
                	<h:option value="5" label="5"/>
                	<h:option value="6" label="6"/>
                	<h:option value="7" label="7"/>
                	<h:option value="8" label="8"/>
                	<h:option value="9" label="9"/>
                	<h:option value="10" label="10"/>
                	<h:option value="11" label="11"/>
                	<h:option value="12" label="12"/>
                </h:select>
              </td>
            </tr>
            <tr>
            	<td align="center" colspan="6" style="color: red;">注意：报表数据每月加载一次，加载会覆盖当月已修改数据，请慎重执行！！！</td>
            </tr>
            <tr class="form_bottom">
              <td colspan="6" class="form_bottom">
                <input type="button" id="bt1" name="bt1" onclick="javascript:doSubmit();" value="更新加载数据" class="button">
                <input type="button" id="bt2" name="bt2" onclick="javascript:doSubmit1();" value="删除加载数据" class="button">
              </td>
            </tr>
          </table>
        </w:panel>
      </h:form>
</body>
</html>
<script>
function doSubmit(){
	if(checkForm($name("query_form")) && confirm("确认更新加载数据吗？")){
		document.getElementById("bt1").disabled = "true";
		document.getElementById("isupdate").value = "update";
		query_form.submit();
	}
}
function doSubmit1(){
	if(checkForm($name("query_form")) && confirm("确认删除加载数据吗？")){
		document.getElementById("bt2").disabled = "true";
		document.getElementById("isupdate").value = "delete";
		query_form.submit();
	}
}
init();
function init(){
	var result = "<b:write property='result'/>";
	if(result == "1"){
		alert("报表数据加载成功！");
	}else if(result == "0"){
		alert("报表数据加载失败！");
	}
}
</script>
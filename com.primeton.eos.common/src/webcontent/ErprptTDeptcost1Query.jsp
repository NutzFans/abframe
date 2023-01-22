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
	<h:form  name="query_form" action="com.primeton.eos.common.ErprptTDeptcost1Maintain.flow" checkType="blur" target="_self" method="post" onsubmit="return checkForm(this);" enctype="multipart/form-data">
        <input type="hidden" name="_eosFlowAction" value="query"/>
        <w:panel id="panel1" width="100%" title="工资福利分摊查询条件：">
          <table align="center" border="0" width="100%" class="form_table">
            <tr>
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
            	<td class="form_label" colspan="2">请选择要导入的部门薪资福利奖金文件：</td>
            	<td colspan="2"><input type='file' name="uploadFile" size='40' unselectable="on"></td>
            </tr>
            <tr class="form_bottom">
              <td colspan="4" class="form_bottom">
                <input name="bt1" type="button" class="button" value="查询" onclick="doQuery();">
                <input name="bt2" type="button" class="button" value='导入部门薪资数' onclick="saveFileload();">
                <input name="bt4" type="button" class="button" value="导出" onclick="doExport();">
              </td>
            </tr>
          </table>
        </w:panel>
      </h:form>
      <h:form name="page_form" action="com.primeton.eos.common.ErprptTDeptcost1Maintain.flow" method="post">
      	<h:hiddendata property="temp"/>
      	<input type="hidden" name="_eosFlowAction" value="update" >
      	<w:panel id="list_panel" width="100%" title="工资福利分摊">
      		<table align="center" border="0" width="100%" class="form_table">
      			<tr><td align="center" class="form_label" colspan="7"><b:write property="temp/year"/>年<b:write property="temp/month"/>月的工资福利分摊表</th></tr>
      			<tr>
      				<td class="form_label" align="center" width="20%">一级分摊单位</td>
      				<td class="form_label" align="center" width="20%">二级分摊单位</td>
      				<td class="form_label" align="center" width="6%"></td>
      				<td colspan="4" class="form_label" align="center">费用类型</td>
      			</tr>
      			<tr>
      				<td class="form_label" align="center" width="20%">单位名称(代号)</td>
      				<td class="form_label" align="center" width="20%">单位名称(代号)</td>
      				<td class="form_label" align="center" width="6%">人数</td>
      				<td class="form_label" align="center" width="13%">工资</td>
      				<td class="form_label" align="center" width="13%">福利</td>
      				<td class="form_label" align="center" width="13%">奖金</td>
      				<td class="form_label" align="center" width="15%">合计</td>
      				<h:hidden name="list[0]/costtypeid" value="11"/>
      				<h:hidden name="list[1]/costtypeid" value="12"/>
      				<h:hidden name="list[2]/costtypeid" value="13"/>
      			</tr>
      			<%int i = 0; %>
      			<l:iterate id="empnum" property="listDeptCost">
      			<%
  					String deptno0 = "list[0]/deptCosts["+i+"]/deptno";
  					String deptno1 = "list[1]/deptCosts["+i+"]/deptno";
  					String deptno2 = "list[2]/deptCosts["+i+"]/deptno";
  					String amt0 = "list[0]/deptCosts["+i+"]/amt";
  					String amt1 = "list[1]/deptCosts["+i+"]/amt";
  					String amt2 = "list[2]/deptCosts["+i+"]/amt";
  					String deptnum = "deptnum["+i+"]";
      			%>
      			<tr>
      				<h:hidden name="<%=deptno0 %>" iterateId="empnum" property="deptNo"/>
      				<h:hidden name="<%=deptno1 %>" iterateId="empnum" property="deptNo"/>
      				<h:hidden name="<%=deptno2 %>" iterateId="empnum" property="deptNo"/>
      				<td align="center"><b:write iterateId="empnum" property="grpName"/></td>
      				<td align="center"><b:write iterateId="empnum" property="deptName"/></td>
      				<td align="center"><b:write iterateId="empnum" property="empNum"/><h:hidden name="<%=deptnum %>" iterateId="empnum" property="empNum"/></td>
      				<td align="center"><h:text name="<%=amt0 %>" iterateId="empnum" property="salary" size="8" validateAttr="type=float;" onblur="check_num(this)"/></td>
      				<td align="center"><h:text name="<%=amt1 %>" iterateId="empnum" property="welfare" size="8" validateAttr="type=float;" onblur="check_num(this)"/></td>
      				<td align="center"><h:text name="<%=amt2 %>" iterateId="empnum" property="bonus" size="8" validateAttr="type=float;" onblur="check_num(this)"/></td>
      				<td align="right" id="sum<b:write iterateId='empnum' property='deptNo'/>"></td>
      			</tr>
	          	<%i++; %>
      			</l:iterate>
	          	<tr align="center">
	          	  	<td class="form_label" colspan="2" width="44%">合计</td>
	          	  	<td class="form_label" width="8%" id="div_totalemp"></td>
	          	  	<td class="form_label" align="right" width="8%" id="div_totalday0"></td>
	          	  	<td class="form_label" align="right" width="8%" id="div_totalday1"></td>
	          	  	<td class="form_label" align="right" width="8%" id="div_totalday2"></td>
	          	  	<td class="form_label" align="right" width="8%" id="div_totalday3"></td>
	            </tr>
      			<tr class="form_bottom">
		          <td colspan="9">
		            <input name="bt3" type="button" value="保存" onclick="javascript:doSubmit();" class="button">
		          </td>
		        </tr>
      		</table>
      	</w:panel>
      </h:form>
</body>
</html>
<script>
function doSubmit(){
	if(checkForm($name("page_form")) && confirm("确认保存吗？")){
		$name("bt1").disabled = true;
		$name("bt2").disabled = true;
		$name("bt3").disabled = true;
		$name("bt4").disabled = true;
		page_form.submit();
	}
}
function doQuery(){
	query_form.elements["_eosFlowAction"].value = "query";
	query_form.submit();
}
function doExport(){
	query_form.elements["_eosFlowAction"].value = "export";
	query_form.submit();
}
function saveFileload(){
	if($name("uploadFile").value == ""){
		alert("请选择存有部门薪资福利奖金数据的Excel文件！");
		return;
	}
	var year = $name("temp/year").value;
	var month = $name("temp/month").value;
	if(!confirm("您确认当前部门薪资福利奖金是"+year+"年"+month+"月的数据吗？该操作会先删除该月的数据，请谨慎使用！")){
		return;
	}else{
		query_form.elements["_eosFlowAction"].value = "importEmp";
		$name("bt1").disabled = true;
		$name("bt2").disabled = true;
		$name("bt3").disabled = true;
		$name("bt4").disabled = true;
		query_form.submit();
	}
}
function check_num(obj){ 
	var amt = obj.value.trim();
	if(amt != null && amt != ""){
		var reg=/^-?\d+(\.\d+)?$/;
		if(!reg.test(amt)){
			alert("输入非法，请重新输入！");
			obj.value = "";
	        obj.focus();
		}else{
			obj.value = amt;
		}
	}	
	cal_subTotal();
}
//将浮点数金额按指定小数位数显示(四舍五入),precision=0时只显示整数值
function format_num(num,precision){
	var fh=1;
	if(parseFloat(num)==0) return "";
	if(parseFloat(num)<0){
		fh=-1;
		num=parseInt(fh)*parseFloat(num);
	}
	var pow=Math.pow(10,precision);
	var tmpstr= ""+parseInt(fh)*parseInt((parseFloat(num)+0.5/pow)*pow)/pow;
	var len = tmpstr.length;
	var dotpos = tmpstr.indexOf('.');
	if(dotpos == -1){
		if(parseInt(precision)>0) tmpstr+=".";
		for(var i=0;i<precision;i++) tmpstr+="0";
	}
	else{
		if(parseInt(precision)>0)
			for(var i=1;i<=precision-len+dotpos+1;i++){  tmpstr+="0"; }
	}
	return tmpstr;
}
cal_subTotal();
function cal_subTotal(){
	var frm=document.page_form;
	var deptno = new Array();		//from 0
	var daytotal = new Array();		//every day detail fare total: from 1 to 7
	var subTotal1 = new Array();	//every expTypeID detail fare total
	var empNum=0;
	var empTotal=0;
    <l:iterate id="empnum" property="listDeptCost" > 
		deptno[empNum++]='<b:write iterateId="empnum" property="deptNo"/>';
	</l:iterate>
	//计算明细部分的小计
	for(var j=0;j<=3;j++){
		daytotal[j]=0;
	}
	for(var i=0;i<deptno.length;i++){
		subTotal1[i]=0;
		for(var j=0;j<=2;j++){
			var tempName = "list["+j+"]/deptCosts["+i+"]/amt";
			if(frm.elements[tempName].value.trim() != ""){
				  tmpAmt=parseFloat(frm.elements[tempName].value);
				  subTotal1[i]+=tmpAmt;
				  daytotal[j]+=tmpAmt;
			}
		}
		daytotal[3]+=subTotal1[i];
		var tempName = "sum"+deptno[i];
		if(subTotal1[i]!=0){
			eval("sum"+deptno[i]).innerHTML=format_num(subTotal1[i],2);
		}else{
			eval("sum"+deptno[i]).innerHTML="";
		}
		var tempName = "deptnum["+i+"]";
		if(frm.elements[tempName].value.trim() != ""){
			empTotal+=parseFloat(frm.elements[tempName].value);
		}
	}
	eval("div_totalemp").innerHTML=empTotal;
	for(var j=0;j<=3;j++){
		if(daytotal[j]!=0){
			eval("div_totalday"+j).innerHTML=format_num(daytotal[j],2);
		}
		else{
			eval("div_totalday"+j).innerHTML="";
		}
	}
}
</script>
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
	<h:form name="query_form" action="com.primeton.eos.common.ErporgTDeptempnumMaintain.flow" checkType="blur" target="_self" method="post" onsubmit="return checkForm(this);" enctype="multipart/form-data">
        <input type="hidden" name="_eosFlowAction" value="query"/>
        <w:panel id="panel1" width="100%" title="部门人头数维护查询条件：">
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
            	<td class="form_label" colspan="2">请选择要导入的部门人头数文件：</td>
            	<td colspan="2"><input type='file' name="uploadFile" size='40' unselectable="on"></td>
            </tr>
            <tr class="form_bottom">
              <td colspan="4" class="form_bottom">
                <input name="bt1" type="button" class="button" value="查询" onclick="doQuery();">
                <input name="bt2" type="button" class="button" value='导入部门人头数' onclick="saveFileload();">
                <input name="bt4" type="button" class="button" value="导出" onclick="doExport();">
              </td>
            </tr>
          </table>
        </w:panel>
      </h:form>
      <h:form name="page_form" action="com.primeton.eos.common.ErporgTDeptempnumMaintain.flow" method="post">
      	<h:hiddendata property="temp"/>
      	<input type="hidden" name="_eosFlowAction" value="update" >
      	<w:panel id="list_panel" width="100%" title="部门人头数维护">
      		<table align="center" border="0" width="100%" class="form_table">
      			<tr><td align="center" class="form_label" colspan="13"><b:write property="temp/year"/>年<b:write property="temp/month"/>月的部门人头数维护表</th></tr>
      			<tr><td class="form_label" align="center" width="17%">一级预算单位</td><td class="form_label" align="center" width="17%">二级预算单位</td><td colspan="11" class="form_label" align="center">人员按区域</td></tr>
      			<tr><td class="form_label" align="center" width="17%">单位名称(代号)</td><td class="form_label" align="center" width="17%">单位名称(代号)</td>
      			<%int regioni = 0; %>
      				<l:iterate id="region" property="listRegion">
		      			<%String tempName = "list[" + regioni + "]/regionid";
		          	  	%>
      					<td class="form_label" align="center"><b:write iterateId="region" property="dictName"/></td>
      					<h:hidden name="<%=tempName %>" iterateId="region" property="dictID"/>
          	  		<%regioni++; %>
      				</l:iterate>
      				<td class="form_label" align="center">小计</td>
      			</tr>
      			<%int i = 0; %>
      			<l:iterate id="empnum" property="listEmpNum">
      			<%
  					String deptno0 = "list[0]/deptNums["+i+"]/deptno";
  					String deptno1 = "list[1]/deptNums["+i+"]/deptno";
  					String deptno2 = "list[2]/deptNums["+i+"]/deptno";
  					String deptno3 = "list[3]/deptNums["+i+"]/deptno";
  					String deptno4 = "list[4]/deptNums["+i+"]/deptno";
  					String deptno5 = "list[5]/deptNums["+i+"]/deptno";
  					String deptno6 = "list[6]/deptNums["+i+"]/deptno";
  					String deptno7 = "list[7]/deptNums["+i+"]/deptno";
  					String deptno8 = "list[8]/deptNums["+i+"]/deptno";
  					String deptno9 = "list[9]/deptNums["+i+"]/deptno";
  					String empnum0 = "list[0]/deptNums["+i+"]/empnum";
  					String empnum1 = "list[1]/deptNums["+i+"]/empnum";
  					String empnum2 = "list[2]/deptNums["+i+"]/empnum";
  					String empnum3 = "list[3]/deptNums["+i+"]/empnum";
  					String empnum4 = "list[4]/deptNums["+i+"]/empnum";
  					String empnum5 = "list[5]/deptNums["+i+"]/empnum";
  					String empnum6 = "list[6]/deptNums["+i+"]/empnum";
  					String empnum7 = "list[7]/deptNums["+i+"]/empnum";
  					String empnum8 = "list[8]/deptNums["+i+"]/empnum";
  					String empnum9 = "list[9]/deptNums["+i+"]/empnum";
      			%>
      			<tr>
      				<h:hidden name="<%=deptno0 %>" iterateId="empnum" property="deptNo"/>
      				<h:hidden name="<%=deptno1 %>" iterateId="empnum" property="deptNo"/>
      				<h:hidden name="<%=deptno2 %>" iterateId="empnum" property="deptNo"/>
      				<h:hidden name="<%=deptno3 %>" iterateId="empnum" property="deptNo"/>
      				<h:hidden name="<%=deptno4 %>" iterateId="empnum" property="deptNo"/>
      				<h:hidden name="<%=deptno5 %>" iterateId="empnum" property="deptNo"/>
      				<h:hidden name="<%=deptno6 %>" iterateId="empnum" property="deptNo"/>
      				<h:hidden name="<%=deptno7 %>" iterateId="empnum" property="deptNo"/>
      				<h:hidden name="<%=deptno8 %>" iterateId="empnum" property="deptNo"/>
      				<h:hidden name="<%=deptno9 %>" iterateId="empnum" property="deptNo"/>
      				<td align="center"><b:write iterateId="empnum" property="grpName"/></td>
      				<td align="center"><b:write iterateId="empnum" property="deptName"/></td>
      				<td align="center"><h:text name="<%=empnum0 %>" iterateId="empnum" property="BJempNum" size="3" validateAttr="type=float;" onblur="check_num(this)"/></td>
      				<td align="center"><h:text name="<%=empnum1 %>" iterateId="empnum" property="SHempNum" size="3" validateAttr="type=float;" onblur="check_num(this)"/></td>
      				<td align="center"><h:text name="<%=empnum2 %>" iterateId="empnum" property="GZempNum" size="3" validateAttr="type=float;" onblur="check_num(this)"/></td>
      				<td align="center"><h:text name="<%=empnum3 %>" iterateId="empnum" property="XAempNum" size="3" validateAttr="type=float;" onblur="check_num(this)"/></td>
      				<td align="center"><h:text name="<%=empnum4 %>" iterateId="empnum" property="CDempNum" size="3" validateAttr="type=float;" onblur="check_num(this)"/></td>
      				<td align="center"><h:text name="<%=empnum5 %>" iterateId="empnum" property="WHempNum" size="3" validateAttr="type=float;" onblur="check_num(this)"/></td>
      				<td align="center"><h:text name="<%=empnum6 %>" iterateId="empnum" property="NJempNum" size="3" validateAttr="type=float;" onblur="check_num(this)"/></td>
      				<td align="center"><h:text name="<%=empnum7 %>" iterateId="empnum" property="JNempNum" size="3" validateAttr="type=float;" onblur="check_num(this)"/></td>
      				<td align="center"><h:text name="<%=empnum8 %>" iterateId="empnum" property="SZempNum" size="3" validateAttr="type=float;" onblur="check_num(this)"/></td>
      				<td align="center"><h:text name="<%=empnum9 %>" iterateId="empnum" property="NJZQempNum" size="3" validateAttr="type=float;" onblur="check_num(this)"/></td>
      				<td align="center" id="sum<b:write iterateId='empnum' property='deptNo'/>"></td>
      			</tr>
	          	<%i++; %>
      			</l:iterate>
	          	<tr align="center">
	          	  	<td class="form_label" colspan="2" width="34%">合计</td>
	          	  	<td class="form_label" width="6%" id="div_totalday0"></td>
	          	  	<td class="form_label" width="6%" id="div_totalday1"></td>
	          	  	<td class="form_label" width="6%" id="div_totalday2"></td>
	          	  	<td class="form_label" width="6%" id="div_totalday3"></td>
	          	  	<td class="form_label" width="6%" id="div_totalday4"></td>
	          	  	<td class="form_label" width="6%" id="div_totalday5"></td>
	          	  	<td class="form_label" width="6%" id="div_totalday6"></td>
	          	  	<td class="form_label" width="6%" id="div_totalday7"></td>
	          	  	<td class="form_label" width="6%" id="div_totalday8"></td>
	          	  	<td class="form_label" width="6%" id="div_totalday9"></td>
	          	  	<td class="form_label" width="6%" id="div_totalday10"></td>
	            </tr>
      			<tr class="form_bottom">
		          <td colspan="12">
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
		alert("请选择存有部门人头数的Excel文件！");
		return;
	}
	var year = $name("temp/year").value;
	var month = $name("temp/month").value;
	if(!confirm("您确认当前部门人头数是"+year+"年"+month+"月的数据吗？该操作会先删除该月的数据，请谨慎使用！")){
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
		var reg=/^(([1-9][0-9]*)|(([0]\.\d{1}|[1-9][0-9]*\.\d{1})))$/;
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
cal_subTotal();
function cal_subTotal(){
	var frm=document.page_form;
	var deptno = new Array();		//from 0
	var daytotal = new Array();		//every day detail fare total: from 1 to 7
	var subTotal1 = new Array();	//every expTypeID detail fare total
	var empNum=0;	
    <l:iterate id="empnum" property="listEmpNum" > 
		deptno[empNum++]='<b:write iterateId="empnum" property="deptNo"/>';
	</l:iterate>
	//计算明细部分的小计
	for(var j=0;j<=10;j++){
		daytotal[j]=0;
	}
	for(var i=0;i<deptno.length;i++){
		subTotal1[i]=0;
		for(var j=0;j<=9;j++){
			var tempName = "list["+j+"]/deptNums["+i+"]/empnum";
			if(frm.elements[tempName].value.trim() != ""){
				  tmpAmt=parseFloat(frm.elements[tempName].value);
				  subTotal1[i]+=tmpAmt;
				  daytotal[j]+=tmpAmt;
			}
		}
		daytotal[10]+=subTotal1[i];
		var tempName = "sum"+deptno[i];
		if(subTotal1[i]!=0){
			eval("sum"+deptno[i]).innerHTML=subTotal1[i];
		}else{
			eval("sum"+deptno[i]).innerHTML="";
		}
	}
	for(var j=0;j<=10;j++){
		if(daytotal[j]!=0){
			eval("div_totalday"+j).innerHTML=daytotal[j];
		}
		else{
			eval("div_totalday"+j).innerHTML="";
		}
	}
}
</script>
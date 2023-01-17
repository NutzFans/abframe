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
	<h:form  name="query_form" action="com.primeton.eos.common.ErprptTDeptcostregionMaintain.flow" checkType="blur" target="_self" method="post" onsubmit="return checkForm(this);">
        <input type="hidden" name="_eosFlowAction" value="query"/>
        <w:panel id="panel1" width="100%" title="区域级公共费用分摊查询条件：">
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
              <td class="form_label">区域</td>
              <td colspan="1">
				<d:select dictTypeId="EXP_REGION" property="temp/regionid" filterField="dictid" filterOp="!=" filterStr="0"></d:select>
              </td>
            </tr>
            <tr class="form_bottom">
              <td colspan="6" class="form_bottom">
                <input type="submit" value="查询" class="button">
              </td>
            </tr>
          </table>
        </w:panel>
      </h:form>
      <h:form name="page_form" action="com.primeton.eos.common.ErprptTDeptcostregionMaintain.flow" method="post">
      	<h:hidden property="temp/year"/>
      	<h:hidden property="temp/month"/>
      	<h:hidden property="temp/regionid"/>
      	<input type="hidden" name="_eosFlowAction" value="update" >
      	<h:hidden name="temp/totalempnum"/>
      	<w:panel id="list_panel" width="100%" title="区域级公共费用分摊">
      		<table align="center" border="0" width="100%" class="form_table">
      			<tr><td align="center" class="form_label" colspan="11"><b:write property="temp/year"/>年<b:write property="temp/month"/>月<d:write dictTypeId="EXP_REGION" property="temp/regionid"/>区域的区域级公共费用分摊表</th></tr>
      			<tr>
      				<td class="form_label" align="center" width="13%">一级分摊单位</td>
      				<td class="form_label" align="center" width="13%">二级分摊单位</td>
      				<td class="form_label" align="center" width="4%"></td>
      				<td colspan="8" class="form_label" align="center">费用类型</td>
      			</tr>
      			<tr>
      				<td class="form_label" align="center" width="11%">单位名称(代号)</td>
      				<td class="form_label" align="center" width="11%">单位名称(代号)</td>
      				<td class="form_label" align="center" width="4%">人数</td>
      				<td class="form_label" align="center" width="9%">区域固定资产原值</td>
      				<td class="form_label" align="center" width="9%">区域折旧分摊</td>
      				<td class="form_label" align="center" width="9%">装修摊销</td>
      				<td class="form_label" align="center" width="9%">房租</td>
      				<td class="form_label" align="center" width="9%">物业</td>
      				<td class="form_label" align="center" width="9%">水电费</td>
      				<td class="form_label" align="center" width="9%">其他公共费用</td>
      				<td class="form_label" align="center" width="10%">合计</td>
      			</tr>
      			<%int i = 0; %>
      			<l:iterate id="empnum" property="listDeptCostRegion">
      			<%
  					String amt0 = "list[0]/deptCosts["+i+"]/amt";
  					String amt1 = "list[1]/deptCosts["+i+"]/amt";
  					String amt2 = "list[2]/deptCosts["+i+"]/amt";
  					String amt3 = "list[3]/deptCosts["+i+"]/amt";
  					String amt4 = "list[4]/deptCosts["+i+"]/amt";
  					String amt5 = "list[5]/deptCosts["+i+"]/amt";
  					String amt6 = "list[6]/deptCosts["+i+"]/amt";
  					String deptno = "list1["+i+"]/deptno";
  					String deptnum = "list1["+i+"]/deptnum";
      			%>
      			<tr>
      				<td align="center"><b:write iterateId="empnum" property="grpName"/></td>
      				<td align="center"><b:write iterateId="empnum" property="deptName"/></td>
      				<td align="center"><b:write iterateId="empnum" property="empNum"/><h:hidden name="<%=deptno %>" iterateId="empnum" property="deptNo"/><h:hidden name="<%=deptnum %>" iterateId="empnum" property="empNum"/></td>
      				<td align="right"><b:write iterateId="empnum" property="qygdzcyz" formatPattern="#.##"/><h:hidden name="<%=amt0 %>" iterateId="empnum" property="qygdzcyz"/></td>
      				<td align="right"><b:write iterateId="empnum" property="qyzjft" formatPattern="#.##"/><h:hidden name="<%=amt1 %>" iterateId="empnum" property="qyzjft"/></td>
      				<td align="right"><b:write iterateId="empnum" property="zxtx" formatPattern="#.##"/><h:hidden name="<%=amt2 %>" iterateId="empnum" property="zxtx"/></td>
      				<td align="right"><b:write iterateId="empnum" property="fzwy" formatPattern="#.##"/><h:hidden name="<%=amt3 %>" iterateId="empnum" property="fzwy"/></td>
      				<td align="right"><b:write iterateId="empnum" property="wy" formatPattern="#.##"/><h:hidden name="<%=amt4 %>" iterateId="empnum" property="wy"/></td>
      				<td align="right"><b:write iterateId="empnum" property="sdf" formatPattern="#.##"/><h:hidden name="<%=amt5 %>" iterateId="empnum" property="sdf"/></td>
      				<td align="right"><b:write iterateId="empnum" property="qtggfy" formatPattern="#.##"/><h:hidden name="<%=amt6 %>" iterateId="empnum" property="qtggfy"/></td>
      				<td align="right" id="sum<b:write iterateId='empnum' property='deptNo'/>"></td>
      			</tr>
	          	<%i++; %>
      			</l:iterate>
	          	<tr align="center">
	          	  	<td class="form_label" colspan="2" width="24%">合计</td>
	          	  	<td class="form_label" width="4%" id="div_totalemp"></td>
	          	  	<td class="form_label" align="center" width="8%"><h:text id="div_totalday0" name="temp/qygdzcyz" value="" size="10" validateAttr="type=float;" onblur="check_num(this)"/></td>
	          	  	<td class="form_label" align="center" width="8%"><h:text id="div_totalday1" name="temp/qyzjft" value="" size="10" validateAttr="type=float;" onblur="check_num(this)"/></td>
	          	  	<td class="form_label" align="center" width="8%"><h:text id="div_totalday2" name="temp/zxtx" value="" size="10" validateAttr="type=float;" onblur="check_num(this)"/></td>
	          	  	<td class="form_label" align="center" width="8%"><h:text id="div_totalday3" name="temp/fzwy" value="" size="10" validateAttr="type=float;" onblur="check_num(this)"/></td>
	          	  	<td class="form_label" align="center" width="8%"><h:text id="div_totalday4" name="temp/wy" value="" size="10" validateAttr="type=float;" onblur="check_num(this)"/></td>
	          	  	<td class="form_label" align="center" width="8%"><h:text id="div_totalday5" name="temp/sdf" value="" size="10" validateAttr="type=float;" onblur="check_num(this)"/></td>
	          	  	<td class="form_label" align="right" width="8%"><b:write property="listQtggfy[1]/qtggfy" formatPattern="#.##"/><h:hidden name="temp/qtggfy" property="listQtggfy[1]/qtggfy"/></td>
	          	  	<td class="form_label" align="right" width="8%" id="div_totalday7"></td>
	            </tr>
      			<tr class="form_bottom">
		          <td colspan="11">
		            <input type="button" value="保存" onclick="javascript:doSubmit();" class="button">
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
		page_form.submit();
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
    <l:iterate id="empnum" property="listDeptCostRegion" > 
		deptno[empNum++]='<b:write iterateId="empnum" property="deptNo"/>';
	</l:iterate>
	//计算明细部分的小计
	for(var j=0;j<=7;j++){
		daytotal[j]=0;
	}
	for(var i=0;i<deptno.length;i++){
		subTotal1[i]=0;
		for(var j=0;j<=6;j++){
			var tempName = "list["+j+"]/deptCosts["+i+"]/amt";
			if(frm.elements[tempName].value.trim() != ""){
				  tmpAmt=parseFloat(frm.elements[tempName].value);
				  if(j!=0){
				  	subTotal1[i]+=tmpAmt;
				  }
				  daytotal[j]+=tmpAmt;
			}
		}
		daytotal[7]+=subTotal1[i];
		var tempName = "sum"+deptno[i];
		if(subTotal1[i]!=0){
			eval("sum"+deptno[i]).innerHTML=format_num(subTotal1[i],2);
		}else{
			eval("sum"+deptno[i]).innerHTML="";
		}
		var tempName = "list1["+i+"]/deptnum";
		if(frm.elements[tempName].value.trim() != ""){
			empTotal+=parseFloat(frm.elements[tempName].value);
		}
	}
	eval("div_totalemp").innerHTML=empTotal;
	$name("temp/totalempnum").value = empTotal;
	for(var j=0;j<=7;j++){
		if(daytotal[j]!=0){
			if(j<6){
				document.getElementById("div_totalday"+j).value = format_num(daytotal[j],2);
			}else if(j==6){
				//其他公共费用不取统计值，取xpath上面的值
			}else{
				eval("div_totalday"+j).innerHTML=format_num(daytotal[j],2);
			}
		}
		else{
			if(j<6){
				document.getElementById("div_totalday"+j).value = "";
			}else if(j==6){
				//其他公共费用不取统计值，取xpath上面的值
			}else{
				eval("div_totalday"+j).innerHTML="";
			}
		}
	}
}
</script>
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
<%
	String role = (String) request.getParameter("temp/role");
	String title1 = "";
	String title2 = "";
	if(role.equals("H")){
		title1 = "部门薪酬查询条件：";
		title2 = "部门薪酬数据";
	}else{
		title1 = "部门费用查询条件：";
		title2 = "部门费用数据";
	}
%>
	<h:form name="query_form" action="com.primeton.eos.common.AdjustDeptBudget.flow" checkType="blur" target="_self" method="post" onsubmit="return checkForm(this);">
        <input type="hidden" name="_eosFlowAction" value="query"/>
        <h:hidden property="temp/companyid"/>
        <h:hidden property="temp/role"/>
        <w:panel id="panel1" width="100%" title="<%=title1 %>">
          <table align="center" border="0" width="100%" class="form_table">
            <tr>
              <td class="form_label">选择最小部门</td>
              <td colspan="1">
				<h:text property="temp/deptname" readonly="true" validateAttr="allowNull=false;"/>
                <h:hidden property="temp/deptno" />
                <INPUT value="选择" class="button" type="button" onclick="javascript:select_org_single();" name="select_org_btn">
              </td>
              <td class="form_label">财年</td>
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
            </tr>
            <tr class="form_bottom">
              <td colspan="4" class="form_bottom">
                <input type="submit" value="查询" class="button">
              </td>
            </tr>
          </table>
        </w:panel>
      </h:form>
      <h:form name="adjustForm" action="com.primeton.eos.common.AdjustDeptBudget.flow" checkType="blur" target="_self" method="post" onsubmit="return checkForm(this);">
      	<h:hidden property="temp/deptno"/>
      	<h:hidden property="temp/deptname"/>
      	<h:hidden property="temp/year"/>
      	<h:hidden property="temp/companyid"/>
      	<h:hidden property="temp/role"/>
      	<input type="hidden" name="_eosFlowAction" value="adjust"/>
      	<w:panel id="panel2" width="100%" title="费用调整(增/减金额)">
          <table align="center" border="0" width="100%" class="form_table">
            <tr>
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
              <td class="form_label">费用类型</td>
              <td colspan="1">
                <r:comboSelect id="com11" property="temp/deptgrouptypeid" queryAction="com.primeton.eos.common.expDeal.getAllDeptGroupType.biz" textField="deptgrouptypename" valueField="deptgrouptypeid" xpath="listDeptGroup" submitXpath="deptGroup">
					<l:equal property="temp/role" targetValue="H">
						<h:param name="deptgrouptypeid" value="1"/>
					</l:equal>
					<l:equal property="temp/role" targetValue="F">
						<h:param name="deptgrouptypeid" value="2"/>
					</l:equal>
				</r:comboSelect>
			  	<r:comboSelect linkId="com11" id="com12" property="temp/deptexptypeid" queryAction="com.primeton.eos.common.expDeal.getDeptExpTypeByDeptGroupType.biz" textField="deptexptypename" valueField="deptexptypeid" xpath="listDeptExpType">
				</r:comboSelect>
              </td>
              <td class="form_label">调整金额</td>
              <td colspan="1">
              	<h:text property="temp/addamt" validateAttr="type=float;allowNull=false;" size="8"/>
              </td>
              <td class="form_label">说明</td>
              <td colspan="1">
              	<h:text property="temp/memo" size="50"/>
              </td>
            </tr>
            <tr class="form_bottom">
              <td colspan="8" class="form_bottom">
                <input type="button" value="调整费用" onclick="doSubmit();" class="button">
              </td>
            </tr>
          </table>
        </w:panel>
      </h:form>
      <h:form name="page_form" action="com.primeton.eos.common.AdjustDeptBudget.flow" method="post">
      	<w:panel id="list_panel" width="100%" title="<%=title2 %>">
      		<table align="center" border="0" width="100%" class="form_table">
      			<tr><td align="center" class="form_label" colspan="15"><b:write property="temp/year"/>年部门费用执行表<l:equal property="temp/role" targetValue="H">_薪酬部分</l:equal></th></tr>
      			<tr>
      				<td class="form_label" align="center" colspan="2">月份</td>
      				<td colspan="1" class="form_label" align="center">1</td>
      				<td colspan="1" class="form_label" align="center">2</td>
      				<td colspan="1" class="form_label" align="center">3</td>
      				<td colspan="1" class="form_label" align="center">4</td>
      				<td colspan="1" class="form_label" align="center">5</td>
      				<td colspan="1" class="form_label" align="center">6</td>
      				<td colspan="1" class="form_label" align="center">7</td>
      				<td colspan="1" class="form_label" align="center">8</td>
      				<td colspan="1" class="form_label" align="center">9</td>
      				<td colspan="1" class="form_label" align="center">10</td>
      				<td colspan="1" class="form_label" align="center">11</td>
      				<td colspan="1" class="form_label" align="center">12</td>
      				<td colspan="1" class="form_label" align="center">小计</td>
      			</tr>
      			<%int i = 0; %>
        		<script>
        			var tempexpgroupname = "";
        			var role = "<b:write property='temp/role'/>";
        			var tempIndex = 1;
        			if(role == "H"){
        				tempIndex = 1;
        			}else{
        				tempIndex = 2;
        			}
        		</script>
      			<l:iterate id="empnum" property="listDept">
      			<%
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
  					String empnum10 = "list[10]/deptNums["+i+"]/empnum";
  					String empnum11 = "list[11]/deptNums["+i+"]/empnum";
      			%>
      			<tr>
	            	<td class="form_label" align="center">
	            		<script>
	            			var expgroupname = "<b:write iterateId='empnum' property='deptGroupTypeName'/>";
	            			if(tempexpgroupname != expgroupname){
	            				document.write(tempIndex + "." + expgroupname);
	            				tempexpgroupname = expgroupname;
	            				tempIndex++;
	            			}
	            		</script>
	            	</td>
      				<td class="form_label" align="center"><b:write iterateId="empnum" property="deptExpTypeName"/></td>
      				<td align="right"><b:write iterateId="empnum" property="actAmt1" formatPattern="#,###,###.####"/><h:hidden name="<%=empnum0 %>" iterateId="empnum" property="actAmt1"/></td>
      				<td align="right"><b:write iterateId="empnum" property="actAmt2" formatPattern="#,###.###"/><h:hidden name="<%=empnum1 %>" iterateId="empnum" property="actAmt2"/></td>
      				<td align="right"><b:write iterateId="empnum" property="actAmt3" formatPattern="#,###.###"/><h:hidden name="<%=empnum2 %>" iterateId="empnum" property="actAmt3"/></td>
      				<td align="right"><b:write iterateId="empnum" property="actAmt4" formatPattern="#,###.###"/><h:hidden name="<%=empnum3 %>" iterateId="empnum" property="actAmt4"/></td>
      				<td align="right"><b:write iterateId="empnum" property="actAmt5" formatPattern="#,###.###"/><h:hidden name="<%=empnum4 %>" iterateId="empnum" property="actAmt5"/></td>
      				<td align="right"><b:write iterateId="empnum" property="actAmt6" formatPattern="#,###.###"/><h:hidden name="<%=empnum5 %>" iterateId="empnum" property="actAmt6"/></td>
      				<td align="right"><b:write iterateId="empnum" property="actAmt7" formatPattern="#,###.###"/><h:hidden name="<%=empnum6 %>" iterateId="empnum" property="actAmt7"/></td>
      				<td align="right"><b:write iterateId="empnum" property="actAmt8" formatPattern="#,###.###"/><h:hidden name="<%=empnum7 %>" iterateId="empnum" property="actAmt8"/></td>
      				<td align="right"><b:write iterateId="empnum" property="actAmt9" formatPattern="#,###.###"/><h:hidden name="<%=empnum8 %>" iterateId="empnum" property="actAmt9"/></td>
      				<td align="right"><b:write iterateId="empnum" property="actAmt10" formatPattern="#,###.###"/><h:hidden name="<%=empnum9 %>" iterateId="empnum" property="actAmt10"/></td>
      				<td align="right"><b:write iterateId="empnum" property="actAmt11" formatPattern="#,###.###"/><h:hidden name="<%=empnum10 %>" iterateId="empnum" property="actAmt11"/></td>
      				<td align="right"><b:write iterateId="empnum" property="actAmt12" formatPattern="#,###.###"/><h:hidden name="<%=empnum11 %>" iterateId="empnum" property="actAmt12"/></td>
      				<td align="right" id="sum<b:write iterateId='empnum' property='deptExpTypeID'/>"></td>
      			</tr>
	          	<%i++; %>
      			</l:iterate>
	          	<tr align="center">
	          	  	<td class="form_label" colspan="2" width="22%">合计</td>
	          	  	<td class="form_label" width="6%" id="div_totalday0" align="right"></td>
	          	  	<td class="form_label" width="6%" id="div_totalday1" align="right"></td>
	          	  	<td class="form_label" width="6%" id="div_totalday2" align="right"></td>
	          	  	<td class="form_label" width="6%" id="div_totalday3" align="right"></td>
	          	  	<td class="form_label" width="6%" id="div_totalday4" align="right"></td>
	          	  	<td class="form_label" width="6%" id="div_totalday5" align="right"></td>
	          	  	<td class="form_label" width="6%" id="div_totalday6" align="right"></td>
	          	  	<td class="form_label" width="6%" id="div_totalday7" align="right"></td>
	          	  	<td class="form_label" width="6%" id="div_totalday8" align="right"></td>
	          	  	<td class="form_label" width="6%" id="div_totalday9" align="right"></td>
	          	  	<td class="form_label" width="6%" id="div_totalday10" align="right"></td>
	          	  	<td class="form_label" width="6%" id="div_totalday11" align="right"></td>
	          	  	<td class="form_label" width="6%" id="div_totalday12" align="right"></td>
	            </tr>
      		</table>
      	</w:panel>
      </h:form>
      <h:form name="deleteForm" action="com.primeton.eos.common.AdjustDeptBudget.flow" target="_self" method="post">
      	<h:hidden property="temp/deptno"/>
      	<h:hidden property="temp/deptname"/>
      	<h:hidden property="temp/year"/>
      	<h:hidden property="temp/companyid"/>
      	<h:hidden property="temp/role"/>
      	<h:hidden name="temp/itmno"/>
      	<input type="hidden" name="_eosFlowAction" value="delete"/>
      	<w:panel id="list_panel1" width="100%" title="费用调整记录">
          <table align="center" border="0" width="100%" class="EOS_table">
            <tr>
              <th align="center">调整时间</th>
              <th>年份</th>
              <th>月份</th>
              <th>费用大类</th>
              <th>费用类型</th>
              <th>调整金额</th>
              <th>调整说明</th>
              <th>操作</th>
            </tr>
              <l:iterate property="listDeptChange" id="id1">
                <tr class="<l:output evenOutput='EOS_table_row' />">
                  <td>
                    <b:write iterateId="id1" property="changetime" formatPattern="yyyy-MM-dd HH:mm:ss"/>
                  </td>
                  <td>
                    <b:write iterateId="id1" property="year"/>
                  </td>
                  <td>
                    <b:write iterateId="id1" property="month"/>
                  </td>
                  <td>
                    <b:write iterateId="id1" property="erprptTDeptexptype/erprptTDeptgrouptype/deptgrouptypename"/>
                  </td>
                  <td>
                  	<b:write iterateId="id1" property="erprptTDeptexptype/deptexptypename"/>
                  </td>
                  <td>
                    <b:write iterateId="id1" property="addamt" formatPattern="#.##"/>
                  </td>
                  <td>
                    <b:write iterateId="id1" property="memo"/>
                  </td>
                  <td>
                    <a href="#" onclick="doDeleteCommChange(<b:write iterateId='id1' property='itmno'/>);">删除</a>
                  </td>
                </tr>
              </l:iterate>
          </table>
        </w:panel>
      </h:form>
</body>
</html>
<script>
//机构选择，单选
function select_org_single(){
	showModalCenter("com.bos.mp.common.Select.flow?_eosFlowAction=singleOrg&rootOrgID=","",callback_select_org_single , 350, 430,"机构选择（单选）");
}
//设置机构，单选
function callback_select_org_single(value){
	var ret = value;
	if (!ret) {
		// 返回值为空，返回
		return;
	} else{
		//返回值赋值
		$name("temp/deptno").value = ret[0];
		$name("temp/deptname").value = ret[1];
	}
}
function doSubmit(){
	if(checkForm($name("adjustForm")) && confirm("确认调整费用吗？")){
		adjustForm.submit();
	}
}
function doDeleteCommChange(itmno){
	if(checkForm($name("deleteForm")) && confirm("确认删除调整费用数据吗？")){
		deleteForm.elements["temp/itmno"].value = itmno;
		deleteForm.submit();
	}
}
function check_num(obj){ 
	var amt = obj.value.trim();
	if(amt != null && amt != ""){
		var reg=/^[1-9]\d*|0$/;
		if(!reg.test(amt)){
			alert("输入非法，请重新输入！");
			obj.value = "";
	        obj.focus();
		}else{
			obj.value = format_num(amt,2);
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
    <l:iterate id="empnum" property="listDept" > 
		deptno[empNum++]='<b:write iterateId="empnum" property="deptExpTypeID"/>';
	</l:iterate>
	//计算明细部分的小计
	for(var j=0;j<=12;j++){
		daytotal[j]=0;
	}
	for(var i=0;i<deptno.length;i++){
		subTotal1[i]=0;
		for(var j=0;j<=11;j++){
			var tempName = "list["+j+"]/deptNums["+i+"]/empnum";
			if(frm.elements[tempName].value.trim() != ""){
				  tmpAmt=parseFloat(frm.elements[tempName].value);
				  subTotal1[i]+=tmpAmt;
				  daytotal[j]+=tmpAmt;
			}
		}
		daytotal[12]+=subTotal1[i];
		var tempName = "sum"+deptno[i];
		if(subTotal1[i]!=0){
			eval("sum"+deptno[i]).innerHTML=format_num(subTotal1[i],2);
		}else{
			eval("sum"+deptno[i]).innerHTML="";
		}
	}
	for(var j=0;j<=12;j++){
		if(daytotal[j]!=0){
			eval("div_totalday"+j).innerHTML=format_num(daytotal[j],2);
		}
		else{
			eval("div_totalday"+j).innerHTML="";
		}
	}
}
</script>
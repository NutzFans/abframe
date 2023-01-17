<%@page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8" %>
<%@include file="/common/common.jsp"%>
<%@include file="/common/skins/skin0/component.jsp" %>
<h:css href="/css/style1/style-custom.css"/>
<%--
- Author(s): huangqj
- Date: 2015-06-09 15:51:08
- Description:
--%>
<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
    <title>
      OmEmployeeExp录入
    </title>
  </head>
  <body>
    <e:datasource name="omemployeeexp" type="entity" path="com.bos.mp.common.performance.OmEmployeeExp" />
    <h:form name="data_form" action="com.primeton.eos.common.OmEmployeeExpMaintain.flow" method="post" onsubmit="return checkForm(this);">
      <l:equal property="_eosLastAccessAction" targetValue="update">
        <input type="hidden" name="_eosFlowAction" value="updateSubmit" >
      </l:equal>
      <l:equal property="_eosLastAccessAction" targetValue="insert">
        <input type="hidden" name="_eosFlowAction" value="insertSubmit" >
      </l:equal>
      <h:hiddendata property="criteria" />
      <h:hidden property="page/begin"/>
      <h:hidden property="page/length"/>
      <h:hidden property="page/isCount"/>
      <dataform id= "00546072-950a-494a-84e2-5d8adec3262e">
        <w:panel id="panel1" width="100%" title="员工补贴信息录入">
          <table align="center" border="0" width="100%" class="form_table">
            <tr>
              <td class="form_label">员工姓名</td>
              <td colspan="1">
              	<l:equal property="_eosLastAccessAction" targetValue="update">
              		<h:hidden property="omemployeeexp/empid"/>
              		<b:write property="omemployeeexp/empname"/>
			    </l:equal>
			    <l:equal property="_eosLastAccessAction" targetValue="insert">
		          <r:comboSelect id="empList" property="omemployeeexp/empid" validateAttr="allowNull=false;" 
					queryAction="com.primeton.eos.common.omemployeeexpbiz.queryEmpByTemplate.biz" 
					textField="empname" valueField="empid" xpath="oaEmp" width="150" 		
				  />
      			</l:equal>
              </td>
               <td class="form_label">审批人</td>
               <td colspan="1">
               	
		          <r:comboSelect id="empList1" property="omemployeeexp/appempid" validateAttr="allowNull=false;"
					queryAction="com.primeton.eos.common.omemployeeexpbiz.queryEmpByTemplate.biz" 
					textField="empname" valueField="empid" xpath="oaEmp" width="150"			
				  />
			  	 
              </td>
               <td class="form_label">工作地点</td>
              <td colspan="1">
                <d:select dictTypeId="EXP_REGION" property="omemployeeexp/workarea" id="workarea"/>
              </td>
          </tr>
      	  <tr>
              <td class="form_label">是否有领取补贴权限</td>
              <td colspan="1">
                <d:select dictTypeId="ABF_YESORNO" property="omemployeeexp/ishaveauth" id="ishaveauth"/>
              </td>
              <td class="form_label">自购机使用登记日期</td>
              <td colspan="1">
                <w:date property="omemployeeexp/startusedate" id="startusedate"/>
              </td>
              <td class="form_label" id="temp1">补贴到年</td>
              <td colspan="1">
                <h:select property="omemployeeexp/expyear" id="expyear">
                	<h:option label="" value=""/>
                	<h:option label="2014" value="2014"/>
                	<h:option label="2015" value="2015"/>
                	<h:option label="2016" value="2016"/>
                	<h:option label="2017" value="2017"/>
                	<h:option label="2018" value="2018"/>
                	<h:option label="2019" value="2019"/>
                	<h:option label="2020" value="2020"/>
                	<h:option label="2021" value="2021"/>
                	<h:option label="2022" value="2022"/>
                	<h:option label="2023" value="2023"/>
                	<h:option label="2024" value="2024"/>
                	<h:option label="2025" value="2025"/>
                </h:select>
              </td>            
          </tr>
  		  <tr>
  		      <td class="form_label">备注</td> 
              <td colspan="1">
                <h:text property="omemployeeexp/remark" id="remark"/>
              </td>
              <td class="form_label">补贴停止时间</td>
              <td colspan="1">
                <w:date property="omemployeeexp/stopdate" id="stopdate"/>
              </td>
              <td class="form_label" id="temp2">补贴到月</td>
              <td colspan="1">
                <h:select property="omemployeeexp/expmonth" id="expmonth">
                	<h:option label="" value=""/>
                	<h:option label="1" value="1"/>
                	<h:option label="2" value="2"/>
                	<h:option label="3" value="3"/>
                	<h:option label="4" value="4"/>
                	<h:option label="5" value="5"/>
                	<h:option label="6" value="6"/>
                	<h:option label="7" value="7"/>
                	<h:option label="8" value="8"/>
                	<h:option label="9" value="9"/>
                	<h:option label="10" value="10"/>
                	<h:option label="11" value="11"/>
                	<h:option label="12" value="12"/>
                </h:select>
              </td>
            </tr>
            <tr class="form_bottom">
              <td colspan="6">
                <input type="submit" value="保存" class="button">
                <input type="button" value="返回" onclick="javascript:history.go(-1);" class="button">
              </td>
            </tr>
          </table>
        </w:panel>
      </dataform>
    </h:form>
    <script>
    	init();
      	function init(){
      		var lastAct = "<b:write property='_eosLastAccessAction'/>";
      		if(lastAct == "insert"){
      		document.getElementById("expyear").style.display = "none";
			document.getElementById("temp1").style.display = "none";
			document.getElementById("expmonth").style.display = "none";
			document.getElementById("temp2").style.display = "none";
			}
			if(lastAct == "update"){
					var isAdmin = false;
					var isFinance = false;
					<l:iterate id="roles" property="userObject/attributes/roles" scope="session">
						var roleid = "<b:write iterateId='roles' property='roleid'/>";
						if(roleid == "admin"){
							isAdmin = true;
						} else if(roleid == "finance"){
							isFinance = true;
						}
					</l:iterate>
					if(isFinance == false){	
						document.getElementById("expyear").disabled = true;
						document.getElementById("expmonth").disabled = true;
					}
					if(isAdmin == false){					
						$id("workarea").disabled = true;
						$id("ishaveauth").disabled = true;
						$id("remark").disabled = true;
						$id("startusedate").setDisabled(true);
						$id("stopdate").setDisabled(true);
						$id("empList1").setDisabled(true);
					}
			}
		}
    </script>
  </body>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@include file="/common/common.jsp"%>
<html>
<!-- 
  - Author(s): jisx
  - Date: 2017-07-18 17:02:40
  - Description:
-->
<head>
<title><%=request.getParameter("empname") %>-人员信息</title>
<meta http-equiv="content-type" content="text/html; charset=UTF-8" />
<script src="<%= request.getContextPath() %>/common/nui/nui.js" type="text/javascript"></script>
<style type="text/css">
	body{margin: 0;padding: 0;width: 100%;height: 100%;overflow: hidden;}
	.asLabel
	    {
	        border:0;background-color:#F5F5F5;cursor:default;    
	    }
</style>
</head>
<body>
	<%--民族、籍贯、户口所在省市、居住地省市、紧急联系人、与员工关系、
紧急联系人联系方式、社会工作时间、员工属性（正式员工、实习生、其他）、
职位、工作地、福利缴纳地、招聘渠道、内部推荐人、招聘经办人、
离职性质（主动离职、被动离职）、离职原因、离职去向、离职补偿、离职说明--%>
	<div class="nui-fit" id="form1">
		<div class="nui-panel" title="人员信息" style="width: 100%;">
			<fieldset style="border:solid 1px #aaa;padding:3px;">
			<input name="emp.empid" id="empid" class="nui-hidden">
			<input name="emp.orgid" id="orgid" class="nui-hidden">
				<legend >基本个人信息</legend>
				<div style="padding:5px;">
					<table style="width:100%;" id="emptable">
						<tr>
							<td align="right" style="width:80px;">员工工号:</td>
	                		<td style="width:140px;" align="left" id="empcode" class="asLabel"></td>
						</tr>
						<tr>
							<td align="right" style="width:80px;">姓名:</td>
	                		<td style="width:140px;" align="left" id="empname" class="asLabel"></td>
	                		<td align="right" style="width:80px;">昵称:</td>
	                		<td style="width:140px;" align="left" id="realname" class="asLabel"></td>
	                		<td align="right" style="width:80px;">性别:</td>
	                		<td style="width:140px;" align="left" id="gender" class="asLabel"></td>
						</tr>
						<tr>
							<td align="right" style="width:80px;">民族:</td>
	                		<td style="width:140px;" align="left" class="asLabel" id="nation"></td>
							<td align="right" style="width:80px;">出生年月:</td>
	                		<td style="width:140px;" class="asLabel" id="birthdate"></td>
	                		<td align="right" style="width:80px;">手机号码:</td>
	                		<td style="width:140px;" align="left" class="asLabel" id="mobileno"></td>
						</tr>
						<tr>
							<td align="right" style="width:80px;">证件类型:</td>
	                		<td style="width:140px;" align="left" class="asLabel" id="cardtype"></td>
							<td align="right" style="width:80px;">证件号码:</td>
	                		<td style="width:140px;" align="left" class="asLabel" id="cardno"></td>
	                		<td align="right" style="width:80px;">社会工作时间:</td>
	                		<td style="width:100px;" align="left" class="asLabel" id="socialstart"></td>
						</tr>
						<tr>
							<td align="right" style="width:80px;">最高学历:</td>
	                		<td style="width:140px;" align="left" class="asLabel" id="highestlen"></td>
							<td align="right" style="width:80px;">入学时间:</td>
	                		<td style="width:140px;" align="left" class="asLabel" id="highestindate"></td>
	                		<td align="right" style="width:80px;">毕业时间:</td>
	                		<td style="width:100px;" align="left" class="asLabel" id="highestoutdate"></td>
						</tr>
						<tr>
							<td align="right" style="width:80px;">学历验证:</td>
	                		<td style="width:100px;" align="left" class="asLabel" id="eduverify"></td>
							<td align="right" style="width:80px;">籍贯:</td>
	                		<td style="width:100px;" align="left" class="asLabel" id="birthplace"></td>
	                		<td align="right" style="width:80px;">户籍性质:</td>
	                		<td style="width:100px;" align="left" class="asLabel" id="resiproperty"></td>
						</tr>
						<tr>
							<td align="right" style="width:80px;">户口所在省市:</td>
	                		<td style="width:140px;" align="left" class="asLabel" id="residende"></td>
	                		<td align="right" style="width:80px;">户口所在地址:</td>
	                		<td style="width:140px;" align="left" class="asLabel" id="resiaddress"></td>
	                		<td align="right" style="width:80px;">居住地省市:</td>
	                		<td style="width:140px;" align="left" class="asLabel" id="liveplace"></td>
						</tr>
						<tr>
							<td align="right" style="width:80px;">家庭电话:</td>
	                		<td style="width:100px;" align="left" class="asLabel" id="htel"></td>
	                		<td align="right" style="width:80px;">家庭邮编:</td>
	                		<td style="width:140px;" align="left" class="asLabel" id="hzipcode"></td>
	                		<td align="right" style="width:80px;">家庭地址:</td>
	                		<td style="width:140px;" align="left" class="asLabel" id="haddress"></td>
						</tr>
						<tr>
							<td align="right" style="width:80px;">紧急联系人:</td>
	                		<td style="width:140px;" align="left" class="asLabel" id="emergency"></td>
							<td align="right" style="width:80px;">与员工关系:</td>
	                		<td style="width:100px;" align="left" class="asLabel" id="emerelation"></td>
	                		<td align="right" style="width:80px;">联系人电话:</td>
	                		<td style="width:140px;" align="left" class="asLabel" id="emelink"></td>
						</tr>
						<tr>
							<td align="right" style="width:80px;">政治面貌:</td>
	                		<td style="width:140px;" align="left" class="asLabel" id="party"></td>
							<td align="right" style="width:80px;">微信号:</td>
	                		<td style="width:140px;" align="left" class="asLabel" id="msn"></td>
	                		<td align="right" style="width:80px;">私人邮箱:</td>
	                		<td style="width:100px;" align="left" class="asLabel" id="pemail"></td>
						</tr>
						<tr>
							<td align="right" style="width:80px;">档案保管机构:</td>
	                		<td style="width:140px;" align="left" class="asLabel" id="filesaveorg"></td>
							<td align="right" style="width:80px;">档案所在省市:</td>
	                		<td style="width:140px;" align="left" class="asLabel" id="filecity"></td>
	                		<td align="right" style="width:80px;">档案所在地址:</td>
	                		<td style="width:100px;" align="left" class="asLabel" id="fileaddress"></td>
						</tr>
						<tr>
	                		<td align="right" style="width:80px;">居住证类型:</td>
	                		<td style="width:140px;" align="left" class="asLabel" id="ishaveresi"></td>
							<td align="right" style="width:80px;">居住证办理单位:</td>
	                		<td style="width:140px;" align="left" class="asLabel" id="residealorg"></td>
	                		<td align="right" style="width:80px;">居住证年限:</td>
	                		<td style="width:140px;" align="left" class="asLabel" id="resilimit"></td>
						</tr>
						<tr>
							<td align="right" style="width:80px;">居住证开始时间:</td>
	                		<td style="width:140px;" align="left" class="asLabel" id="resistartdate"></td>
							<td align="right" style="width:80px;">居住证结束时间:</td>
	                		<td style="width:100px;" align="left" class="asLabel" id="resienddate"></td>
							<td align="right" style="width:80px;">公积金帐号:</td>
	                		<td style="width:100px;" align="left" class="asLabel" id="fundno"></td>
						</tr>
						<tr>
	                		<td align="right" style="width:80px;">补充公积金帐号:</td>
	                		<td style="width:140px;" align="left" class="asLabel" id="addfundno"></td>
							<td align="right" style="width:80px;">婚姻状况:</td>
	                		<td style="width:140px;" align="left" class="asLabel" id="marristatus"></td>
							<td align="right" style="width:80px;">未成年子女姓名:</td>
	                		<td style="width:100px;" align="left" class="asLabel" id="nonagename"></td>
						</tr>
						<tr>
	                		<td align="right" style="width:80px;">未成年子女性别:</td>
	                		<td style="width:140px;" align="left" class="asLabel" id="nonagesex"></td>
	                		<td align="right" style="width:80px;">未成年子女出生年月:</td>
	                		<td style="width:140px;" align="left" class="asLabel" id="nonagebirth"></td>
						</tr>
					</table>
				</div>
			</fieldset>
			<fieldset style="border:solid 1px #aaa;padding:3px;">
				<legend>基本公司信息</legend>
				<div style="width:100%;">
		            <table style="width:100%;" id="emptable1">
		                <tr>
		                	<td align="right" style="font-size:12px;width:80px;">人员状态:</td>
	                		<td style="width:140px;" align="left" class="asLabel" id="empstatus" ></td>
							<td align="right" style="font-size:12px;width:80px;">员工属性:</td>
	                		<td style="width:140px;" align="left" class="asLabel" id="emptype"></td>
	                		<td align="right" style="font-size:12px;width:80px;">人员性质:</td>
	                		<td style="width:140px;" align="left" class="asLabel" id="nature"></td>
						</tr>
						<tr>
							<td align="right" style="width:80px;">入职日期:</td>
	                		<td style="width:140px;" align="left" class="asLabel" id="indate"></td>
	                		<td align="right" style="width:80px;">职位分类:</td>
	            			<td style="width:140px;" align="left" class="asLabel" id="positionname"></td>
	            			<td align="right" style="width:80px;">职位名称:</td>
	            			<td style="width:140px;" align="left" class="asLabel" id="positioncall"></td>
						</tr>
						<tr>
							<td align="right" style="width:80px;">司龄起算日期:</td>
	                		<td style="width:140px;" align="left" class="asLabel" id="compmstartday"></td>
							<td align="right" style="width:80px;">工作地:</td>
	            			<td style="width:140px;" align="left" class="asLabel" id="workplace"></td>
						</tr>
						<tr>
						    <td align="right" style="width:80px;">职位级别:</td>
	                		<td style="width:140px;" align="left" class="asLabel" id="joblevel"></td>
	                		<td align="right" style="width:80px;">人员成本属性:</td>
	                		<td style="width:140px;" align="left" class="asLabel" id="degree"></td>
	                		<td align="right" style="width:80px;">直接主管:</td>
	                		<td style="width:140px;" align="left" class="asLabel" id="major"></td>
	                		
						</tr>
						<tr>
						    <td align="right" style="width:80px;">导师:</td>
						    <td style="width:140px;" align="left" class="asLabel" id="mentor"></td>
							<td align="right" style="width:80px;">所属公司:</td>
	            			<td style="width:140px;" align="left" class="asLabel" id="company"></td>
	            			<td align="right" style="width:80px;">办公地址:</td>
	            			<td style="width:140px;" align="left" class="asLabel" id="oaddress"></td>
						</tr>
						<tr>
						    <td align="right" style="width:80px;">PCF:</td>
	            			<td style="width:140px;" align="left" class="asLabel" id="isjoinpcf"></td>
							<td align="right" style="width:80px;">PCF金额:</td>
	            			<td style="width:140px;" align="left" class="asLabel" id="pcfamount"></td>
	            			<td align="right" style="width:80px;">PCF开始日期:</td>
	            			<td style="width:140px;" align="left" class="asLabel" id="pcfstartdate"></td>
						</tr>
						<tr>
						    <td align="right" style="width:80px;">PCF结束日期:</td>
	            			<td style="width:140px;" align="left" class="asLabel" id="pcfenddate"></td>
							<td align="right" style="width:80px;">员工是否自备电脑:</td>
	            			<td style="width:140px;" align="left" class="asLabel" id="istakepc"></td>
	            			<td align="right" style="width:80px;">自备电脑开始日期:</td>
	            			<td style="width:140px;" align="left" class="asLabel" id="takepcdate"></td>
						</tr>
						<tr>
						    <td align="right" style="width:80px;">自备电脑结束日期:</td>
	            			<td style="width:140px;" align="left" class="asLabel" id="takepcenddate"></td>
							<td align="right" style="width:80px;">内部推荐人:</td>
	                		<td style="width:140px;" align="left" class="asLabel" id="innerrec"></td>
							<td align="right" style="width:80px;">招聘经办人:</td>
	                		<td style="width:100px;" align="left" class="asLabel" id="recruitoper"></td>
						</tr>
						<tr>
						    <td align="right" style="width:80px;">招聘渠道:</td>
	            			<td style="width:140px;" align="left" class="asLabel" id="recruitsour"></td>	
							<td align="right" style="width:80px;">办公电话:</td>
	                		<td style="width:140px;" align="left" class="asLabel" id="otel"></td>
							<td align="right" style="width:80px;">办公邮编:</td>
	                		<td style="width:140px;" align="left" class="asLabel" id="ozipcode"></td>
						</tr>
						<tr>
						    <td align="right" style="width:80px;">办公邮箱:</td>
	                		<td style="width:140px;" align="left" class="asLabel" id="oemail"></td>
							<td align="right" style="width:80px;">开户行名称:</td>
	                		<td style="width:140px;" align="left" class="asLabel" id="bankname"></td>
							<td align="right" style="width:80px;">开户行帐号:</td>
	                		<td style="width:100px;" align="left" class="asLabel" id="bankacct"></td>
						</tr>
						<tr>
						    <td align="right" style="width:80px;">传真号码:</td>
	                		<td style="width:140px;" align="left" class="asLabel" id="faxno"></td>
						    <td align="right" style="width:80px;">银行名称:</td>
	                		<td style="width:140px;" align="left" class="asLabel" id="banknamedict"></td>
							<td align="right" style="width:80px;">银行账号类型:</td>
	                		<td style="width:100px;" align="left" class="asLabel" id="banktype"></td>
						</tr>
						<tr>
							<td align="right" style="width:80px;">工作描述:</td>
	                		<td align="left" colspan="3" class="asLabel" id="workexp"></td>
							<td align="right" style="width:80px;">福利缴纳地:</td>
	                		<td style="width:100px;" align="left" class="asLabel" id="welfareplace"></td>
						</tr>
						<tr>
							<td align="right" style="width:80px;">备注:</td>
	                		<td  align="left" colspan="5" class="asLabel" id="remark"></td>
						</tr>
						<tr>
							<td align="right" style="width:80px;">员工标签:</td>
	                		<td  align="left" colspan="5" class="asLabel" id="tag"></td>
						</tr>
		            </table>           
			    </div>
			</fieldset>
			<fieldset style="border:solid 1px #aaa;padding:3px;" id="leave">
				<legend>离职信息</legend>
				<div style="width:100%;">
		            <table style="width:100%;" id="emptable2">
		                <tr>
		                	<td align="right" style="width:80px;">离职日期:</td>
	                		<td style="width:140px;" align="left" class="asLabel" id="outdate"></td>
							<td align="right" style="width:80px;">离职性质:</td>
	                		<td style="width:140px;" align="left" class="asLabel" id="outtype" ></td>
	                		<td align="right" style="width:80px;">离职原因:</td>
	                		<td style="width:140px;" align="left" class="asLabel" id="outreason" ></td>
						</tr>
						<tr>
							<td align="right" style="width:80px;" >离职去向:</td>
	                		<td colspan="3" align="left" id="outto" class="asLabel"></td>
	                		<td align="right" style="width:80px;" >离职补偿:</td>
	                		<td style="width:140px;" align="left" class="asLabel" id="outmakeup"></td>
						</tr>
						<tr>
							<td align="right" style="width:80px;">离职说明:</td>
	                		<td colspan="5" align="left" class="asLabel" id="outmemo"></td>
						</tr>
		            </table>           
			    </div>
			</fieldset>
			<fieldset style="border:solid 1px #aaa;padding:3px;">
				<legend>操作员信息</legend>
				<div style="width:100%;">
				<input name="oOpr.operatorid" id="operatorid" class="nui-hidden">
		            <table style="width:100%;" id="orgtable">
		                <tr>
							<td align="right" style="width:120px;">用户登录名:</td>
	                		<td style="width:140px;" align="left" class="asLabel" id="userid"></td>
							<td align="right" style="width:120px;">操作员状态:</td>
	                		<td style="width:140px;" align="left" class="asLabel" id="status"></td>
	                		<td align="right" style="width:120px;">可管理机构:</td>
	                		<td style="width:140px;" align="left" class="asLabel" id="orgidlist"></td>
						</tr>
						<tr>
							<td align="right" style="width:120px;">已授权角色:</td>
	                		<td colspan="5" align="left" class="asLabel" id="rolename"></td>
						</tr>
						<tr>
	                		<td align="right" style="width:120px;">可授权角色:</td>
	                		<td colspan="5" align="left" class="asLabel" id="specialty"></td>
                		</tr>
                		<tr>
	                		<td align="right" style="width:120px;">认证模式:</td>
	                		<td style="width:140px;" align="left" class="asLabel" id="authmode"></td>
	                		<td align="right" style="width:120px;">菜单风格:</td>
	                		<td style="width:140px;" align="left" class="asLabel" id="menutype"></td>
	                		<td align="right" style="width:120px;">密码失效日:</td>
	                		<td style="width:140px;" align="left" class="asLabel" id="invaldate"></td>
						</tr>
						<tr>
	                		<td align="right" style="width:120px;">生效日期:</td>
	                		<td style="width:140px;" align="left" class="asLabel" id="startdate"></td>
							<td align="right" style="width:120px;">失效日期:</td>
	                		<td style="width:140px;" align="left" class="asLabel" id="enddate"></td>
						</tr>
		            </table>           
			    </div>
			</fieldset>
			
			<fieldset style="border:solid 1px #aaa;padding:3px;" id="banks">
				<legend >人员银行账号信息</legend>
			    <!-- 人员银行账号信息-->
			    <div id="bank" class="nui-datagrid" dataField="omemployeeaccts" showPager="false" sortMode="client" allowCellSelect="true" allowCellWrap="true" style="width:100%;height:auto;" 
		        	url="com.primeton.eos.ame_pur.settlePay.queryBankInfo.biz.ext" editNextOnEnterKey="true" allowSortColumn="true" ondrawcell="isDefalut">
		            <div property="columns">
		                <div field="empid" headerAlign="center" allowSort="true" visible="false">empid</div>
		                <div field="username" headerAlign="center" allowSort="true" >单位/个人名称</div>
		                <div field="banknamedict" headerAlign="center" allowSort="true" width="60" align="center" renderer="banknameDict">银行名称</div>
		                <div field="bankacct" headerAlign="center" allowSort="true" >银行帐号</div>
		                <div field="banktype" width="80" align="center" headerAlign="center" renderer="banktypeDict">账户类型</div>
		                <div field="bankname" width="100" align="left" headerAlign="center"  >账户开户行</div>
		                <div field="isdefault" width="60" headerAlign="center" align="center"allowSort="true" >是否默认</div>
		            </div>
		        </div>
			</fieldset>
			
			<fieldset style="border:solid 1px #aaa;padding:3px;" id="levels">
				<legend >人员机构关系</legend>
			    <!-- 人员级别信息 -->
			    <div id="datagrid1" showPager="false" sortMode="client" class="nui-datagrid"  allowCellEdit="true"
            	url="org.gocom.abframe.org.employee.EmpManager.queryEmpOrg.biz.ext" dataField="emporgs"
            	editNextOnEnterKey="true" allowCellSelect="true" allowCellWrap="true" style="width:100%;height:auto;"  allowSortColumn="true">
	                <div property="columns">
	                    <div field="orgname" width="120" align="center" headerAlign="center" allowSort="true" >机构名称</div>
	                    <div field="ismain" width="120" align="center" headerAlign="center" allowSort="true" renderer="getYN">是主机构</div>
	                    <div field="orgtype" id="orgtype" width="110" align="center" headerAlign="center" allowSort="true" renderer="getOrgType">机构类型</div>
	                    <div field="empprop" width="110" align="center" headerAlign="center" allowSort="true">占比数</div>
	                </div>
            	</div>
			</fieldset>
			
			<fieldset style="border:solid 1px #aaa;padding:3px;" id="levels">
				<legend >人员级别信息</legend>
			    <!-- 人员级别信息 -->
			    <div id="level" class="nui-datagrid" style="width:100%;height:auto;" 
		            showPager="false" allowCellEdit="true" allowCellSelect="true"  editNextOnEnterKey="true"
		             allowSortColumn="true" allowCellWrap="true">			            
		            <div property="columns">
		            	<input field="empeducid" class="nui-hidden" visible="false">
		            	<input field="percostid" class="nui-hidden" visible="false">
		            	<div field="startdate" width="80" headerAlign="center"  align="left" dateFormat="yyyy-MM-dd" renderer="dealdate">有效开始日期</div>
		                <div field="enddate" width="80" headerAlign="center" align="left" dateFormat="yyyy-MM-dd" renderer="dealdate">有效截止日期</div>
		            	<div field="degree" displayField="degreename" width="80" headerAlign="center"  align="left" allowSort="true" >人员级别</div>
		                <div field="isworkrate" width="80" headerAlign="center" align="left" allowCellWrap="true" renderer="getIsworkrate">是否统计工时率</div>
		                <div field="currentstate" width="80" headerAlign="center" align="left" allowCellWrap="true" renderer="getCurrentstate">有效状态</div>
		            </div>
		        </div>
			</fieldset>
			
			<fieldset style="border:solid 1px #aaa;padding:3px;">
				<legend >人员专项费用额度</legend>
				<div id="upSpeQuo" class="nui-datagrid" style="width:100%;height:auto;" allowResize="true" frozenStartColumn="0" frozenEndColumn="3"
	   					url="org.gocom.abframe.org.organization.newOrgEmp.querySpeQuoInfo.biz.ext" dataField="speQuo" showPager="false" >
				    <div property="columns">
				        <div field="userid" width="0" headerAlign="center" align="center"></div>
				        <div field="empname" width="0" headerAlign="center" align="center">员工</div>  
				        <div field="year" width="80" headerAlign="center" align="center">年份</div>  
				        <div field="quotype" width="110" headerAlign="center" renderer="quoType"align="center">专项费用类型</div> 
				       	<div field="quota1" width="60" headerAlign="center" currencyUnit="￥" align="center" renderer="getDetail1">一月</div>
				        <div field="quota2" width="60" headerAlign="center" currencyUnit="￥" align="center" renderer="getDetail1">二月</div>
				        <div field="quota3" width="60" headerAlign="center" currencyUnit="￥" align="center" renderer="getDetail1">三月</div>
		                <div field="quota4" width="60" headerAlign="center" currencyUnit="￥" align="center" renderer="getDetail1">四月</div>
		                <div field="quota5" width="60" headerAlign="center" currencyUnit="￥" align="center" renderer="getDetail1">五月</div>
		                <div field="quota6" width="60" headerAlign="center" currencyUnit="￥" align="center" renderer="getDetail1">六月</div>
		                <div field="quota7" width="60" headerAlign="center" currencyUnit="￥" align="center" renderer="getDetail1">七月</div>
		                <div field="quota8" width="60" headerAlign="center" currencyUnit="￥" align="center" renderer="getDetail1">八月</div>
		                <div field="quota9" width="60" headerAlign="center" currencyUnit="￥" align="center" renderer="getDetail1">九月</div>
		                <div field="quota10" width="60" headerAlign="center" currencyUnit="￥" align="center" renderer="getDetail1">十月</div>
		                <div field="quota11" width="60" headerAlign="center" currencyUnit="￥" align="center" renderer="getDetail1">十一月</div>
		                <div field="quota12" width="60" headerAlign="center" currencyUnit="￥" align="center" renderer="getDetail1">十二月</div>
				    </div>
				</div>
			</fieldset>
			
			<fieldset style="border:solid 1px #aaa;padding:3px;">
				<legend >学历信息</legend>
			    <!-- 学历、毕业学校、专业、学校属性 -->
			    <div id="Education" class="nui-datagrid" style="width:100%;height:auto;" dataField="edus"
		            showPager="false" allowCellEdit="true" allowCellSelect="true"  editNextOnEnterKey="true"
		            url="org.gocom.abframe.org.employee.Education.getEducationByName.biz.ext" allowSortColumn="true" allowCellWrap="true">			            
		            <div property="columns">
		            	<input field="empeducid" class="nui-hidden" visible="false">
		            	<div field="startdate" width="30" headerAlign="center"  align="center" dateFormat="yyyy-MM-dd" renderer="dealdate">开始时间</div>
		                <div field="enddate" width="30" headerAlign="center"  align="center" dateFormat="yyyy-MM-dd" renderer="dealdate">截止时间</div>
		            	<div field="degree" width="55" headerAlign="center"  align="center" allowSort="true" renderer="getDegree">学历</div>
		                <div field="graduschool" width="70" headerAlign="center"  align="left">毕业学校</div>
		                <div field="profession" width="85" headerAlign="center" align="left">专业</div>
		            </div>
		        </div>
			</fieldset>
			
			<fieldset style="border: solid 1px #aaa; padding: 3px;" id = "workinfo">
				<legend>工作经历</legend>	
				 <div id="grid_workDetail" class="nui-datagrid" style="width: 100%; height: auto;" dataField="workExp" allowCellSelect="true" 
					  showPager="false" allowCellEdit="true" multiSelect="true" editNextOnEnterKey="true" allowSortColumn="true" allowCellWrap="true"
					  url="com.primeton.eos.ame_resume.resumeManage.getWorkExp.biz.ext">
						<div property="columns">
							<div field="startdate" width="30" align="center" headerAlign="center" dateFormat="yyyy-MM">开始时间 </div>
							<div field="enddate" width="30" align="center" headerAlign="center" dateFormat="yyyy-MM">终止时间 </div>
							<div field="companyname" width="55" align="left" headerAlign="center">工作单位</div>
							<div field="duty" width="70" align="left"  headerAlign="center">职务 </div>
							<div field="workdescription" width="85" align="left" headerAlign="center">主要职责 </div>
					</div>
				</div>
			</fieldset>
			
			<fieldset style="border:solid 1px #aaa;padding:3px;">
				<legend >合同信息 </legend>
			    <!-- 合同属性（劳动合同、实习协议、其他协议）、合同性质（固定期限合同、无固定期限合同）、合同期限、合同开始日期、合同结束日期、职位；允许上传附件； -->
			    <div id="Contract" class="nui-datagrid" style="width:100%;height:auto;" dataField="cons"
		            showPager="false" allowCellEdit="true" allowCellSelect="true"  editNextOnEnterKey="true"
		            url="org.gocom.abframe.org.employee.EmpContract.getEmpContractByName.biz.ext" allowSortColumn="true" allowCellWrap="true">			            
		            <div property="columns">
		            	<input field="empcontid" class="nui-hidden" visible="false">
		            	<div field="conttype" width="80" headerAlign="center" align="center"allowSort="true" renderer="getConttype">合同属性</div>
		                <div field="contprop" width="100" headerAlign="center" align="center"renderer="getContprop">合同性质</div>
		                <div field="conttime" width="70" headerAlign="center" align="left">合同期限(年)</div>
		                <div field="contstart" width="80" headerAlign="center" align="left">合同开始日期</div>
		                <div field="contend" width="80" headerAlign="center" align="left">合同结束日期</div>
		                <div field="position" width="80" headerAlign="center" align="center" renderer="getPosition">职位</div>
				        <div field="contuserid"  width="60" headerAlign="center"  align="center" allowSort="true" >签署工号</div>
				        <div field="contcompany"  width="60" headerAlign="center"  align="center" renderer="company" allowSort="true" >签署公司</div>
				        <div field="contworkplace"  width="60" headerAlign="center"  align="center" renderer="workplace" allowSort="true" >工作地</div>
				        <div field="contstatus"  width="60" headerAlign="center"  align="center" renderer="contstatus" allowSort="true" >签署状态</div>
				        <div field="remark"  width="60" headerAlign="center"  align="center" allowSort="true" >备注</div>
		                <div field="agentname" width="80"  headerAlign="center" align="center">经办人</div>
		                <div field="files" renderer="onFileRenderer" width="200" hight="100"  align="left" headerAlign="center">附件</div>
		                <div field="fileid" displayField="filename" width="200" headerAlign="center" align="left" visible="false">附件</div>
	            	</div>
	        	</div>
			</fieldset>
			
			<fieldset style="border:solid 1px #aaa;padding:3px;">
				<legend>转正信息</legend>
			    <!-- 包含字段：试用期期限、试用期开始日期、试用期结束日期、转正结果、转正日期、转正评价、转正评价人；允许上传附件； -->
			    <div id="Verify" class="nui-datagrid" style="width:100%;height:auto;" dataField="vers"
		            showPager="false" allowCellEdit="true" allowCellSelect="true"  editNextOnEnterKey="true"
		            url="org.gocom.abframe.org.employee.Verify.getVerifyByName.biz.ext" allowCellWrap="true">			            
		            <div property="columns">
		            	<input field="empveriid" class="nui-hidden" visible="false">
		                <div field="veritime" width="90" headerAlign="center" align="left">试用期期限(月)</div>
		                <div field="veristart" width="90" headerAlign="center" dateFormat="yyyy-MM-dd" renderer="dealdate" align="left">试用期开始日期</div>
		                <div field="veriend" width="90" headerAlign="center" dateFormat="yyyy-MM-dd" renderer="dealdate" align="left">试用期结束日期</div>
		                <div field="veriresult" width="80" headerAlign="center"  align="left" renderer="getVeriresult">转正结果</div>
		                <div field="shoulddate" width="80" headerAlign="center" dateFormat="yyyy-MM-dd" renderer="dealdate" align="left">应转正日期</div>
		                <div field="realdate" width="80" headerAlign="center" dateFormat="yyyy-MM-dd" renderer="dealdate" align="left">实际转正日期</div>
		                <div field="verijudge" width="80" headerAlign="center"  align="left">转正评价</div>
		                <div field="verijudgorname" width="80" headerAlign="center"  align="left" >转正评价人</div>
		                <div field="agentname" width="80" headerAlign="center" align="left"  >经办人</div>
		                <div field="files" renderer="onFileRenderer" width="170" hight="100"  align="left" headerAlign="center">附件</div>
		                <div field="fileid" displayField="filename" width="170" headerAlign="center" align="left" visible="false">附件</div>
	            	</div>
	        	</div>
		    </fieldset>
		    
		    <fieldset style="border:solid 1px #aaa;padding:3px;">
				<legend >调动信息</legend>
			    <!--包含字段：调动日期、调出部门、调出职位、调入部门、调入职位 -->
			    <div id="OrgChange" class="nui-datagrid" style="width:100%;height:auto;" dataField="changes"
		            showPager="false" allowCellEdit="true" allowCellSelect="true"  editNextOnEnterKey="true"
		            url="org.gocom.abframe.org.employee.EmpOrgChange.getEmpOrgChange.biz.ext" allowSortColumn="true" allowCellWrap="true">			            
		            <div property="columns">
		            	<input field="emporgid" class="nui-hidden" visible="false">
		            	<div field="changedate" width="80" headerAlign="center" dateFormat="yyyy-MM-dd" renderer="dealdate" align="left">调动日期</div>
		                <div field="outorgid" width="80" headerAlign="center"  align="left" displayField="outorgname">调出部门</div>
		                <div field="outposi" width="80" headerAlign="center" align="left" renderer="getPosition">调出职位</div>
		                 <div field="outplace" width="80" headerAlign="center" align="left" renderer="getPlace">调出工作地</div>
		                <div field="inorgid" width="80" headerAlign="center" align="left" allowCellWrap="true" displayField="inorgname">调入部门</div>
		                <div field="inposi" width="80" headerAlign="center" align="left" allowCellWrap="true" renderer="getPosition">调入职位</div>
		                 <div field="inplace" width="80" headerAlign="center" align="left" renderer="getPlace">调入工作地</div>
		                <div field="manager" width="80" headerAlign="center" align="left" displayField="managername">直属上级</div>
		            </div>
		        </div>
			</fieldset>
		</div>
	</div>
	<div style="text-align: center;padding: 10px;" class="nui-toolbar">
		<a class="nui-button" onclick="onCancel('cancel')" id="closeResume" iconCls="icon-cancel" style="width: 60px;margin-right: 20px;">关闭</a>
	</div>
</body>
<script type="text/javascript">
	nui.parse();
	var form = new nui.Form("form1");
	var verify = nui.get("Verify");
	var contract = nui.get("Contract");
	var orgChange = nui.get("OrgChange");
	var education = nui.get("Education");
	var upSpeQuo = nui.get("upSpeQuo");
	var grid = nui.get("datagrid1");
	var level = nui.get("level");
	var bank = nui.get("bank");
	var grid_workDetail = nui.get("grid_workDetail");//人员工作信息
	var empid = '<%=request.getParameter("empid") %>';
	SetData(empid);
	
	function SetData(data){
		var empid = data;
    	var json = nui.encode({"empid":empid});
    	nui.ajax({
    		url: "org.gocom.abframe.org.organization.newOrgEmp.queryMyEmp.biz.ext",
    		data: json,
    		type: 'POST',
			cache: false,
			contentType: 'text/json',
			success: function(text){
				form.setData(text);
				var oOpr = text.oOpr;
				var emp = text.emp;
				setTable("emptable",emp);
				setTable("emptable1",emp);
				setTable("emptable2",emp);
				setTable("orgtable",oOpr);
				setTable("orgtable",emp);
				level.setData(text.emp.oEmplevels);
				var innerrecname = text.emp.innerrecname;
				var recruitopername = text.emp.recruitopername;
				var majorname = text.emp.majorname;
				var orgnames = text.emp.orgnames;
				var empstatus = text.emp.empstatus;
				var mentorname = text.emp.mentorname;
				if(empstatus=='on'){
					document.getElementById("leave").style.display="none";
				}
				document.getElementById("innerrec").innerHTML=innerrecname==null ? "":innerrecname;
	            document.getElementById("recruitoper").innerHTML=recruitopername==null ? "":recruitopername;
	            document.getElementById("major").innerHTML=majorname==null ? "":majorname;
	            document.getElementById("mentor").innerHTML=mentorname==null ? "":mentorname;
	            document.getElementById("orgidlist").innerHTML=orgnames==null ? "":orgnames;
	            document.getElementById("rolename").innerHTML=text.emp.rolename==null ? "":text.emp.rolename;
	            document.getElementById("gender").innerHTML = emp.gender == null ?"":nui.getDictText('ABF_GENDER',emp.gender);
	            document.getElementById("residende").innerHTML = emp.residende == null ?"":nui.getDictText('MIS_AREA',emp.residende);
	            document.getElementById("liveplace").innerHTML = emp.liveplace == null ?"":nui.getDictText('MIS_AREA',emp.liveplace);
	            document.getElementById("cardtype").innerHTML = emp.cardtype == null ?"":nui.getDictText('ABF_CARDTYPE',emp.cardtype);
	            document.getElementById("resiproperty").innerHTML = emp.resiproperty == null ?"":nui.getDictText('ABF_BIRTHTYPE',emp.resiproperty);
	            document.getElementById("emerelation").innerHTML = emp.emerelation == null ?"":nui.getDictText('EMP_RELATION',emp.emerelation);
	            document.getElementById("party").innerHTML = emp.party == null ?"":nui.getDictText('ABF_PARTYVISAGE',emp.party);
	            document.getElementById("filecity").innerHTML = emp.filecity == null ?"":nui.getDictText('MIS_AREA',emp.filecity);
	            document.getElementById("marristatus").innerHTML = emp.marristatus == null ?"":nui.getDictText('ABF_MARRITYPE',emp.marristatus);
	            document.getElementById("ishaveresi").innerHTML = emp.ishaveresi == null ?"":nui.getDictText('AME_RESIDENCE',emp.ishaveresi);
	            document.getElementById("nonagesex").innerHTML = emp.nonagesex == null ?"":nui.getDictText('ABF_GENDER',emp.nonagesex);
	            document.getElementById("empstatus").innerHTML = emp.empstatus == null ?"":nui.getDictText('ABF_EMPSTATUS',emp.empstatus);
	            document.getElementById("emptype").innerHTML = emp.emptype == null ?"":nui.getDictText('EMP_TYPE',emp.emptype);
	            document.getElementById("nature").innerHTML = emp.nature == null ?"":nui.getDictText('AME_EMPTYPE2',emp.nature);
	            document.getElementById("joblevel").innerHTML = emp.joblevel == null ?"":nui.getDictText('AME_TECH',emp.joblevel);
	            document.getElementById("degree").innerHTML = emp.degree == null ?"":nui.getDictText('AME_EMPTYPE2',emp.degree);
	            document.getElementById("workplace").innerHTML = emp.workplace == null ?"":nui.getDictText('AREA4CLRY',emp.workplace);
	            document.getElementById("company").innerHTML = emp.company == null ?"":nui.getDictText('company',emp.company);
	            document.getElementById("recruitsour").innerHTML = emp.recruitsour == null ?"":nui.getDictText('RECRUIT_WAY',emp.recruitsour);
	            document.getElementById("welfareplace").innerHTML = emp.welfareplace == null ?"":nui.getDictText('AREA4CLRY',emp.welfareplace);
	            document.getElementById("isjoinpcf").innerHTML = emp.isjoinpcf == null ?"":nui.getDictText('MIS_YN',emp.isjoinpcf);
	            document.getElementById("istakepc").innerHTML = emp.istakepc == null ?"":nui.getDictText('MIS_YN',emp.istakepc);
	            document.getElementById("outtype").innerHTML = emp.outtype == null ?"":nui.getDictText('OUT_TYPE',emp.outtype);
	            document.getElementById("outreason").innerHTML = emp.outreason == null ?"":nui.getDictText('OUT_REASON',emp.outreason);
	            document.getElementById("highestlen").innerHTML = emp.highestlen == null ?"":nui.getDictText('DEGREE',emp.highestlen);
	            document.getElementById("eduverify").innerHTML = emp.eduverify == null ?"":nui.getDictText('EDUVERIFY',emp.eduverify);
	            document.getElementById("positionname").innerHTML = emp.positionname == null ?"":nui.getDictText('AME_POSITION_MEMO',emp.positionname);
	            document.getElementById("banknamedict").innerHTML = emp.banknamedict == null ?"":nui.getDictText('BANKNAME',emp.banknamedict);
	            document.getElementById("banktype").innerHTML = emp.banktype == null ?"":nui.getDictText('BANKACCTTYPE',emp.banktype); 
	            document.getElementById("status").innerHTML = oOpr.status == null ?"":nui.getDictText('ABF_OPERSTATUS',oOpr.status);
	            document.getElementById("authmode").innerHTML = oOpr.authmode == null ?"":nui.getDictText('ABF_AUTHMODE',oOpr.authmode);
	            document.getElementById("menutype").innerHTML = oOpr.menutype == null ?"":nui.getDictText('ABF_SKINLAYOUT',oOpr.menutype);
	            document.getElementById("tag").innerHTML = emp.tag == null ?"":nui.getDictText('EMP_TAG',emp.tag);
	            verify.load({empid: empid});
	            contract.load({empid: empid});
	            orgChange.load({empid: empid});
	            education.load({empid: empid});
	            bank.load({empid: empid});
	            grid.load({empid: empid});
	            //获取当前的年份
	            if(typeof(text.oOpr.userid) != "undefined"){
	            	upSpeQuo.load({userid: text.oOpr.userid});
	            }
	            if(text.resume.resumeid != null && text.resume.resumeid != ''){
	            	grid_workDetail.load({resumeid:text.resume.resumeid});
		            grid_workDetail.sortBy("startdate", "desc");
	            }
			},
			error: function(jqXHR, textStatus, errorThrown){
			}
    	});
	}
	
	function getPlace(e){
		return nui.getDictText('AREA4CLRY',e.value);
	}
	function getConttype(e){
		return nui.getDictText('CONT_TYPE',e.value);
	}
	function getContprop(e){
		return nui.getDictText('CONT_PROP',e.value);
	}
	function getVeriresult(e){
		return nui.getDictText('VERI_RESULT',e.value);
	}
	function getDegree(e){
		return nui.getDictText('DEGREE',e.value);
	}
	
	function getSchooltype(e){
		return nui.getDictText('SCHOOL_TYPE',e.value);
	}
	function getCurrentstate(e){
		return nui.getDictText('ABF_STATUS',e.value);
	}
	function getIsworkrate(e){
		return nui.getDictText('MIS_YN',e.value);
	}
	function onCertTypeRenderer(e){
		return nui.getDictText('AME_CERTTYPE',e.value);//设置业务字典值
	}
	
	//额度类型业务字典
    function quoType(e) {
		return nui.getDictText('AME_SPEQUOTYPE',e.value);//设置业务字典值
	}
	
	//专项报销类型
	function feetype(e){
		return nui.getDictText('AME_SPEFEETYPE',e.value);//设置业务字典值
	}
	
	//部门类型
	function getOrgType(e){
		return nui.getDictText('ABF_ORGTYPE',e.value);
	}
	
	function getYN(e){
		return nui.getDictText('ABF_YESORNO',e.value);
	}
	//职位类型
	function getPosition(e){
		return nui.getDictText('AME_POSITION_MEMO',e.value);
	}
	//银行名称
	function banknameDict (e) {
		return nui.getDictText("BANKNAME",e.value);
	}
	//账户类型
	function banktypeDict (e) {
		return nui.getDictText("BANKACCTTYPE",e.value);
	}
    //所属公司
	function company(e){
		return nui.getDictText('company',e.value);
	}
	//工作地
	function workplace(e){
		return nui.getDictText('AREA4CLRY',e.value);
	}
	//合同状态
	function contstatus(e){
		return nui.getDictText('EMP_CONT_STATUS',e.value);
	}
	function onCancel(e) {
    	var data = form.getData();
    	if(data){
        	nui.showMessageBox({
	            title: "关闭提示",
	            iconCls: "nui-messagebox-question",
	            buttons: ["yes", "no"],
	            message: "是否关闭？",
	            callback: function (action) {
	                if(action=="yes"){
	                	if(status != 'tree'){
	                		CloseWindow("cancel");
	                	}
	                }
	            }
	        });
		}else{
			if(status != 'tree'){
				CloseWindow("cancel");
			}
		}
    }
	
	function CloseWindow(action){
		if (action == "close" && form.isChanged()){
			if (confirm("数据被修改了，是否先保存？")){
				return false;
			}
		}
		if (window.CloseOwnerWindow) return window.CloseOwnerWindow(action);
		else window.close();
	}
	
    function onFileRenderer(e) {
        var tempSrc = "";
    	//长度为1，不换行
    	if(e.record.files==null){
    		return;
    	}
    	if(e.record.files.length == 1){
        	tempSrc += "<a href='com.primeton.components.web.fileupload.getfile.flow?fileId=" + e.record.files[0].fileId + "'>" + e.record.files[0].fileName + "</a>";
    	}else{
	        for(var i=0;i<e.record.files.length;i++){
	        	//长度大于1小于长度length换行
	        	if(i< e.record.files.length-1){
	        		tempSrc += "<a href='com.primeton.components.web.fileupload.getfile.flow?fileId=" + e.record.files[i].fileId + "'>" + e.record.files[i].fileName + "</a>&nbsp;&nbsp;";
	        	}
	        	//最后一个不换行
        		if(i == e.record.files.length-1){
	        		tempSrc += "<a href='com.primeton.components.web.fileupload.getfile.flow?fileId=" + e.record.files[i].fileId + "'>" + e.record.files[i].fileName + "</a>";
	        	}
	        }
    	}
       	return tempSrc;
     }
     
	function dealdate(e){
		if(e.value){
			return e.value.substring(0,10);
		}
	}
	
	//向table中设值
	function setTable(tableid,data){//table的id及输出的数据对象，td需要赋值id，id必须与输出的数据对象的属性保持一致
    	var tb = document.getElementById(tableid); 
		var rows = tb.rows;
		for(var i=0;i<rows.length;i++){
			 var sst = rows[i].getElementsByTagName("td")
			 for(var k = 0; k < sst.length; k++){// 遍历该行的 td
			 	var ids = sst[k].id;
			 	if(ids!=null&&ids!=""){
				 	if(data[ids] != null && data[ids] != ""){
					 	document.getElementById(ids).innerHTML=data[ids]== null ?"":data[ids];
				 	}
			 	}
			 }
		}
	 }
	//是否默认账户
	function isDefalut(e){
		if(e.field == "isdefault"){
			if(e.record.isdefault == "1"){
				e.cellHtml = "默认账户";
			}else if(e.record.isdefault == "0"){
				e.cellHtml = "其他账户";
			}
		}
	}
	 
	</script>
</html>
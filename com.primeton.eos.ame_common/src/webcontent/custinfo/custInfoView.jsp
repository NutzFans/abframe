<%@page pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@include file="/nui/common.jsp"%>
<%@include file="/common/common.jsp"%>
<html>
<!-- 
  - Author(s): 张一博
  - Date: 2017-09-05 11:27:25
  - Description:
-->
<head>
<title>客户信息</title>
<style type="text/css">
	body{margin:0;padding:0;border:0;width:100%;height:100%;overflow:hidden;font-size:12px;}
	.asLabel
    {
        border:0;background-color:#F5F5F5;cursor:default;    
    }
</style>
</head>
<body>
<div class="nui-fit">
	<fieldset id="field1" style="border:solid 1px #aaa;padding:3px;">
		<legend>客户基本资料</legend>
		<div style="padding:5px;">
			<div id="formcust">
				<table style="table-layout:fixed;">
					<tr>
						<td align="right" style="width: 80px">
							客户名称：
						</td>
						<td id="custname" class = "asLabel" colspan="6" style="font-weight: 700"></td>
					</tr>
					<tr>
						<td align="right" style="width: 80px">
							客户简称：
						</td>
						<td id="custjc" style="width:200px;" class = "asLabel"></td>
						<td align="right" style="width: 100px">
							商务客户编号：
						</td>
						<td id='custnum' style="width:150px;" class = "asLabel"></td>
						<td align="right" style="width: 100px">
							企业性质：
						</td>
						<td id='custnature' style="width:150px;" class = "asLabel">
						</td>
						<td align="right" style="width: 80px;">是否有效：</td>
						<td align="left" id='status' class = "asLabel" style="width: 100px"></td>
					</tr>
					<tr>
						<td align="right" style="width: 100px;">
							客户类型：
						</td>
		            	<td id='custtype' class = "asLabel"></td>
		            	<td align="right" style="width: 80px;">是否OEM客户：</td>
						<td align="left" id='isoem' class = "asLabel"></td>
						<td align="right">
							重要性：
						</td>
						<td id='grade' align="left" class = "asLabel"></td>
						<td align="right" style="width: 100px">
							大客户经理：
						</td>
						<td id='custmanager' class = "asLabel"></td>
					</tr>
					<tr>
						<td align="right" style="width: 120px">
							开户银行：
						</td>
						<td id="accoutbank" class = "asLabel"></td>
						<td align="right" style="width: 100px">
							户名：
						</td>
						<td id="accoutname" class = "asLabel"></td>
						<td align="right" style="width: 100px">账号：</td>
						<td id='accountid' class = "asLabel"></td>
						<td align="right" style="width: 100px">
							税务登记证号：
						</td>
						<td id='taxnumb' class = "asLabel"></td>
					</tr>
					<tr>
						<td align="right" style="width: 100px">
							联系电话：
						</td>
						<td id='telephone' class = "asLabel"></td>
						<td align="right" style="width: 100px">
							传真：
						</td>
						<td id='fax' class = "asLabel"></td>
						<td align="right" style="width: 100px">
							统一服务电话：
						</td>
						<td id='servphone' class = "asLabel"></td>
						<td align="right" style="width: 120px">
							公司网址：
						</td>
						<td id='website' class = "asLabel"></td>
					</tr>
					<tr>
						<td align="right" style="width: 100px">
							联系地址：
						</td>
						<td id='address' class = "asLabel" colspan="3">
						</td>
						<td align="right" style="width: 100px">
							邮编：
						</td>
						<td id='postcode' class = "asLabel"></td>
						<td align="right" style="width: 100px;">
							组织机构代码：
						</td>
		            	<td align="left" id='orgnum' class = "asLabel"></td>
					</tr>
					<tr>
						<td align="right" style="width: 100px">
							注册资本：
						</td>
						<td id='registercap' class = "asLabel"></td>
						<td align="right" style="width: 120px">
							法人代表：
						</td>
						<td id='legalperson' class = "asLabel"></td>
						<td align="right">
							营业执照注册号：
						</td>
						<td id='license' class = "asLabel"></td>
						<td align="right" style="width: 100px;">
							营业执照到期：
						</td>
		            	<td align="left" class = "asLabel" id='licenseenddate'></td>
					</tr>
					
					<tr>
						<td align="right" style="width: 100px;">
							公司人数：
						</td>
		            	<td align="left" class = "asLabel" id='compnum'></td>
						<td align="right" style="width: 100px">
							服务人员人数：
						</td>
						<td id='servnum' class = "asLabel"></td>
						<td align="right" style="width: 100px">
							集团客户编号：
						</td>
						<td id='groupno' class = "asLabel" colspan="3"></td>
					</tr>
					<tr>
						<td align="right" style="width: 100px">
							经营范围：
						</td>
						<td colspan="3" id='busiscope' class = "asLabel"></td>
						<td align="right" style="width: 100px">
							分支机构：
						</td>
						<td colspan="3" id='suborg' class = "asLabel"></td>
					</tr>
					<tr>
						<td align="right" style="width: 100px">
							备注：
						</td>
						<td id='comments' colspan="7" class = "asLabel"></td>
					</tr>
				</table>
			</div>
		</div>
	</fieldset>
	<div id="tabs1" class="nui-tabs" activeIndex="0" style="width:auto;height:100%">
		<div title="项目列表">
	        <div id="project—grid" url="com.primeton.eos.ame_common.curstinfo.queryProjectForCust.biz.ext" dataField="rdprojects" class="nui-datagrid" 
	        style="width:auto;height:auto;" showPager="false" allowSortColumn="true">
    			<div property="columns">
                    <div field="projectName" width="200" align="left" headerAlign="center" allowSort="true" renderer="getProjectNameDetail">项目名称</div>
                    <div field="projectno" width="100" align="center" headerAlign="center" allowSort="true" >项目编号</div>
                    <div field="projectType" width="120" align="center" headerAlign="center" allowSort="true" renderer="dictGetType">项目类型</div>
                    <div field="orgname" width="110" align="center" headerAlign="center" allowSort="true" >受益部门</div>
                    <div field="managername" width="80" align="center" headerAlign="center" allowSort="true" >项目负责人</div>
                    <div field="projectStatus" width="85" align="center" headerAlign="center" allowSort="true" renderer="dictGetStatus">内部状态</div>
                    <div field="outstatus" width="85" align="center" headerAlign="center" allowSort="true" renderer="dictGetOutStatus">外部状态</div>
                    <div field="contnum" width="80" align="center" headerAlign="center" allowSort="true" >合同编号</div>
                    <div field="ispassbud" width="90" align="center" headerAlign="center" allowSort="true" renderer="dictIspassbud">预算状态</div>
                    <div field="createdate" width="80" align="center" headerAlign="center" allowSort="true" >创建日期</div>
                    <div field="closedate" width="80" align="center" headerAlign="center" allowSort="true" >关闭日期</div>
                    <div field="lastcostdate" width="80" align="center" headerAlign="center" allowSort="true" >最近成本日期</div>
                </div>
			</div>  
	    </div>
		<div title="客户对应合同">
	        <div id="datagrid6" url="com.primeton.eos.ame_common.curstinfo.searchcontarct.biz.ext" dataField="cscontract" class="nui-datagrid" 
	        style="width:auto;height:auto;"  idField="id" showPager="false"    multiSelect="true" allowSortColumn="true" showSummaryRow="true" ondrawsummarycell="drawContarctSum">
    			<div property="columns">
    				<div field="contnum" align='center' width="73" renderer="onTitleRenderer" headerAlign="center" allowSort="true">合同存档编号</div>
                	<div field="contreg" width="70" align='center' headerAlign="center" dateFormat="yyyy-MM-dd" allowSort="true">登记日期</div>
			        <div field="projectname" width="140" headerAlign="center">合同项目名称</div>
			        <div field="prodmon" name="prodmon" dataType="currency" summaryType="sum" currencyUnit="￥" align="right" width="80" headerAlign="center" allowSort="true">产品金额（元）</div>
			        <div field="servmon" name="servmon" dataType="currency" summaryType="sum" currencyUnit="￥" align="right" width="80" headerAlign="center" allowSort="true">服务金额（元）</div>
			        <div field="contsum" name="contsum" dataType="currency" summaryType="sum" currencyUnit="￥" align="right" width="80" headerAlign="center" allowSort="true">总金额（元）</div>
			        <div field="salename" align="center" width="50" headerAlign="center" allowSort="true">销售姓名</div>
			        <div field="org" align="center" renderer="onGenderRenderer" width="80" headerAlign="center" allowSort="true">部门</div>
			        <div field="status" align="center" renderer="onGender1Renderer" width="60" headerAlign="center" allowSort="true">合同状态</div>
                	<div field="contid" width="90" align="center" headerAlign="center" allowSort="true" fixed="true">合同号</div>
                </div>
			</div>  
	    </div>
		<div title="财务及资质">
			<fieldset id="field3" style="border:solid 1px #aaa;padding:3px;">
				<legend>财务信息</legend>
				<table style="table-layout:fixed;" id="table_file2">
					<tr>
						<td align="right" style="width:160px">年度：</td>
						<td id="lastyear" style="width:250px"></td>
						<td align="right" style="width:160px">年度：</td>
						<td id="twoago" style="width:250px"></td>
						<td align="right" style="width:160px">年度：</td>
						<td id="threeago" style="width:250px"></td>
					</tr>
					<tr>
						<td align="right" style="width:160px">营业收入(万元)：</td>
						<td id="lastyearincome"   style="width:250px"></td>
						<td align="right" style="width:160px">营业收入(万元)：</td>
						<td id="twoagoincome"  style="width:250px"></td>
						<td align="right" style="width:160px">营业收入(万元)：</td>
						<td id="threeagoincome" style="width:250px"></td>
					</tr>
					<tr>
						<td align="right" style="width:160px">利润总和(万元)：</td>
						<td id="lastyearprofit"  style="width:250px"></td>
						<td align="right" style="width:160px">利润总和(万元)：</td>
						<td id="twoagoprofit"  style="width:250px"></td>
						<td align="right" style="width:160px">利润总和(万元)：</td>
						<td id="threeagoprofit"  style="width:250px"></td>
					</tr>
					<tr>
						<td align="right" style="width:160px">固定资产原值：</td>
						<td id="lastproperty"  style="width:250px"></td><td></td><td></td><td></td><td></td>
					</tr>
					<tr>
						
						<td align="right" style="width:160px">固定资产净值：</td>
						<td id="lastpropertynet" style="width:250px"></td><td></td><td></td><td></td><td></td>
					</tr>
					<tr>
						<td align="right" style="width:160px">流动资金：</td>
						<td id="lastfloat"  style="width:250px"></td><td></td><td></td><td></td><td></td>
					</tr>
					<tr>
						<td align="right" style="width:160px">长期负债：</td>
						<td id="lastlongdebt"   style="width:250px"></td><td></td><td></td><td></td><td></td>
					</tr>
					<tr>
						<td align="right" style="width:160px">短期负债：</td>
						<td id="lastshortdebt" style="width:250px"></td><td></td><td></td><td></td><td></td>
					</tr>
					<tr>
						<td align="right" style="width:160px">净利润：</td>
						<td id="lastnetprofit"  style="width:250px"></td><td></td><td></td><td></td><td></td>
					</tr>
				</table>
			</fieldset>
			<fieldset id="field4" style="border:solid 1px #aaa;padding:3px;margin-top: 10px;">
				<legend>资质和凭证</legend>
				<table style="table-layout:fixed;" id="table_file3">
					<tr>
						<td align="right" style="width:120px">资质1:</td>
						<td  id="qualify1"></td>
						<td align="right" style="width:120px">资质1有效期:</td>
						<td id="qualify1exp"></td>
					</tr>
					<tr>
						<td align="right" style="width:120px">资质2:</td>
						<td id="qualify2"></td>
						<td align="right" style="width:120px">资质2有效期:</td>
						<td id="qualify2exp"></td>
					</tr>
					<tr>
						<td align="right" style="width:120px">资质3:</td>
						<td id="qualify3"></td>
						<td align="right" style="width:120px"">资质3有效期:</td>
						<td id="qualify3exp"></td>
					</tr>
					<tr>
						<td align="right" style="width:120px">资质备注:</td>
						<td colspan="3" id="qualifycomm"></td>
					</tr>
				</table>
			</fieldset>
	    </div>
	    <div title="公司业务情况">
			<table>
				<tr>
					<td align="right" style="width:120px">公司简介:</td>
					<td id="compdesc"></td>
				</tr>
				<tr>
					<td align="right" style="width:120px">主营产品:</td>
					<td id="mainprod"></td>
				</tr>
				<tr>
					<td align="right" style="width:120px">代理产品:</td>
					<td id="agentprod"></td>
				</tr>
			</table>
		</div>
	    <div title="客户联系人信息">
	        <div id="datagrid4" url="com.primeton.eos.ame_common.curstinfo.searchlinkman.biz.ext" dataField="linkman"  class="nui-datagrid" style="width:auto;height:auto;" showPager="false"  sortMode="client"  multiSelect="true" allowSortColumn="true">
    			<div property="columns">
                    <div field="linkman" width="70" align="center"headerAlign="center" allowSort="true" fixed="true" >联系人姓名</div>
                    <div field="sex" renderer="gender" width="40" align="center" headerAlign="center" allowSort="true" fixed="true" >性别</div>
                    <div field="department" width="100" align="center"headerAlign="center" allowSort="true" fixed="true">所属部门</div>
                    <div field="city" width="60" align="center"headerAlign="center" allowSort="true" fixed="true">所在城市</div>
                    <div field="duty" width="80" align="center"headerAlign="center" allowSort="true" >职务</div>
                    <div field="mobile" width="80" align="left"headerAlign="center" allowSort="true">手机</div>
                    <div field="telephone" width="100" align="left"headerAlign="center" allowSort="true" renderer="getType">联系电话</div>
                    <div field="email" width="150" align="left"headerAlign="center" allowSort="true" >电子邮件</div>
                    <div field="inservice" renderer="MIS_YN" width="50" align="center"headerAlign="center" allowSort="true" fixed="true" renderer="dictGetDegree">是否在职</div>
                    <div field="remark" width="160" align="center" headerAlign="center" allowSort="true" >备注</div>
                    <div field="createDate" width="70" align="center" headerAlign="center" allowSort="true" >创建时间</div>
                    <div field="reateUserid" width="70" align="center"headerAlign="center" allowSort="true" >创建人</div>
                </div>
			</div>  
	    </div>
	    <div title="客户对应系统">
	        <div id="datagrid5" url="com.primeton.eos.ame_common.curstinfo.searchProject.biz.ext" dataField="csproject" class="nui-datagrid" style="width:auto;height:auto;" showPager="false"  sortMode="client"  multiSelect="true" allowSortColumn="true">
    			<div property="columns">
                    <div field="projectname" width="200" align="left"headerAlign="center" allowSort="true" fixed="true" renderer="getOutperDetail">应用系统名称</div>
                    <div field="partnername" width="150" align="left"headerAlign="center" allowSort="true" fixed="true" >合作伙伴</div>
                    <div field="endusername" width="150" align="left"headerAlign="center" allowSort="true" fixed="true">最终客户</div>
                    <div field="industry" renderer='custtype'  width="80" align="left"headerAlign="center" allowSort="true" >所属行业</div>
                    <div field="salesname" width="60" align="center"headerAlign="left" allowSort="true" numberFormat="p0">销售姓名</div>
                    <div field="curstage" renderer='mis_phase' width="80" align="left"headerAlign="center" allowSort="true" renderer="getType">项目当前阶段</div>
                    <div field="releaseflag"  renderer='mis_developphase' width="80" align="left"headerAlign="center" allowSort="true" >系统上线情况</div>
                    <div field="curreditor" renderer='CS_PRODUCTSERIES' width="80" align="left"headerAlign="center" allowSort="true" fixed="true">目前使用的版本</div>
                </div>
			</div>  
	    </div>
	    <div title="客户日志">
    		<jsp:include page="/ame_common/operatLog.jsp?groupid=MIS_CUSTINFO">
    			<jsp:param name="relationid" value="<%=request.getParameter("custid")%>"/>
    		</jsp:include>
    	</div>
	    <div title="相关附件">
			<jsp:include page="/ame_common/detailFile.jsp"/>
		</div>
	</div>
</div>
<div style="text-align:center;padding:10px;border-width:1px 0px 0px 0px;" class="nui-toolbar">               
    <a class="nui-button" onclick="onCancel" style="width:60px;">关闭</a>
</div> 
<script type="text/javascript">
	nui.parse();
	var custid = '<%=request.getParameter("custid") %>';
	var datagrid6 = nui.get("datagrid6");
	var datagrid4 = nui.get("datagrid4");
	var datagrid5 = nui.get("datagrid5");
	var projectGrid = nui.get("project—grid");//项目查询
	var groupid = 'MIS_CUSTINFO';
	var isCommerce = false; //商务
	var isFinance = false;//财务
	var isPMO = false;//PMO
	init();
	SetData(custid);
	
	function init(){
		<l:iterate id="roles" property="userObject/attributes/roles" scope="session">
			var roleid = "<b:write iterateId='roles' property='roleid'/>";
			if(roleid == "commerce"){
				isCommerce = true;
			}
			if(roleid == 'finance'){
				isFinance = true;
			}
			if(roleid == 'PMO'){
				isPMO = true;
			}
		</l:iterate>
		if(isCommerce == false&&isFinance == false&&isPMO == false){//不是商务不是财务不是PMO，不能查看合同金额及合同链接
			datagrid6.hideColumn("prodmon");
			datagrid6.hideColumn("servmon");
			datagrid6.hideColumn("contsum");
		}
	}z
	
	//页面进入时调用的方法
    function SetData(data) {
		var json = nui.encode({custid:data});
		//客户基本信息
        nui.ajax({
            url: "com.primeton.eos.ame_common.curstinfo.custinfoview.biz.ext",
			type: 'POST',
			data: json,	
			contentType: 'text/json',
            success: function (o) {
            	var o = o.custinfo;
            	nui.get("grid_001").load({"groupid":groupid,"relationid":o.custid});
            	document.getElementById("custname").innerHTML = o.custname== null ? "":o.custname;   
            	document.getElementById("custjc").innerHTML = o.custjc== null ? "":o.custjc;
            	document.getElementById("custnature").innerHTML = o.custnature == null ? "":nui.getDictText('MIS_CUSTNATURE',o.custnature);
            	document.getElementById("status").innerHTML = nui.getDictText('MIS_YN',o.status);
            	document.getElementById("isoem").innerHTML = nui.getDictText('MIS_YN',o.isoem);
            	document.getElementById("address").innerHTML = o.address == null ? "":o.address;
            	document.getElementById("accoutname").innerHTML = o.accoutname == null ? "":o.accoutname;
            	document.getElementById("accoutbank").innerHTML = o.accoutbank == null ? "":o.accoutbank;
            	document.getElementById("custtype").innerHTML = o.custtype == null ? "":nui.getDictText('MIS_INDUSTRY',o.custtype);
            	document.getElementById("accountid").innerHTML = o.accountid == null ? "":o.accountid;
            	document.getElementById("custmanager").innerHTML = o.custmanager == null ? "":o.custmanager;
            	document.getElementById("custnum").innerHTML = o.custnum == null ? "":o.custnum;
            	document.getElementById("grade").innerHTML = o.grade == null?"":nui.getDictText('MIS_IMPORTANT',o.grade);
            	document.getElementById("postcode").innerHTML = o.postcode == null?"":o.postcode;
            	document.getElementById("telephone").innerHTML = o.telephone == null?"":o.telephone;
            	document.getElementById("fax").innerHTML = o.fax == null?"":o.fax;
            	document.getElementById("licenseenddate").innerHTML = o.licenseenddate == null?"":o.licenseenddate;
            	document.getElementById("license").innerHTML = o.license == null?"":o.license;
            	document.getElementById("taxnumb").innerHTML = o.taxnumb == null?"":o.taxnumb;
            	document.getElementById("legalperson").innerHTML = o.legalperson == null?"":o.legalperson;
            	document.getElementById("orgnum").innerHTML = o.orgnum == null?"":o.orgnum;
            	document.getElementById("registercap").innerHTML = o.registercap == null?"":o.registercap;
            	document.getElementById("servphone").innerHTML = o.servphone == null?"":o.servphone;
            	document.getElementById("website").innerHTML = o.website == null?"":o.website;
            	document.getElementById("compnum").innerHTML = o.compnum == null?"":o.compnum;
            	document.getElementById("groupno").innerHTML = o.groupno == null?"":o.groupno;
            	document.getElementById("servnum").innerHTML = o.servnum == null?"":o.servnum; 
            	document.getElementById("busiscope").innerHTML = o.busiscope == null?"":o.busiscope;
            	document.getElementById("suborg").innerHTML = o.suborg == null?"":o.suborg;
            	document.getElementById("compdesc").innerHTML = o.compdesc == null?"":o.compdesc;
            	document.getElementById("comments").innerHTML = o.comments == null?"":o.comments;
            	document.getElementById("mainprod").innerHTML = o.mainprod == null?"":o.mainprod;
            	document.getElementById("agentprod").innerHTML = o.agentprod == null?"":o.agentprod;
            	document.getElementById("threeago").innerHTML = o.threeago == null ?"":o.threeago;
            	document.getElementById("threeagoincome").innerHTML = o.threeagoincome == null ? "":'<span>￥</span>'+formatNumber(o.threeagoincome.toFixed(2),'#,##.00');
            	document.getElementById("threeagoprofit").innerHTML = o.threeagoprofit == null ? "":'<span>￥</span>'+formatNumber(o.threeagoincome.toFixed(2),'#,##.00');
            	document.getElementById("lastproperty").innerHTML = o.lastproperty == null ? "":'<span>￥</span>'+formatNumber(o.threeagoincome.toFixed(2),'#,##.00');
            	document.getElementById("lastpropertynet").innerHTML = o.lastpropertynet == null ? "":'<span>￥</span>'+formatNumber(o.threeagoincome.toFixed(2),'#,##.00');
            	document.getElementById("twoago").innerHTML = o.twoago == null ?"":o.twoago;
            	document.getElementById("twoagoincome").innerHTML = o.twoagoincome == null ? "":'<span>￥</span>'+formatNumber(o.threeagoincome.toFixed(2),'#,##.00');
            	document.getElementById("twoagoprofit").innerHTML = o.twoagoprofit == null ? "":'<span>￥</span>'+formatNumber(o.threeagoincome.toFixed(2),'#,##.00');
            	document.getElementById("lastfloat").innerHTML = o.lastfloat == null ? "":'<span>￥</span>'+formatNumber(o.threeagoincome.toFixed(2),'#,##.00');
            	document.getElementById("lastlongdebt").innerHTML = o.lastlongdebt == null ? "":'<span>￥</span>'+formatNumber(o.threeagoincome.toFixed(2),'#,##.00');
            	document.getElementById("lastyear").innerHTML = o.lastyear == null ?"":o.lastyear;
            	document.getElementById("lastyearincome").innerHTML = o.lastyearincome == null ? "":'<span>￥</span>'+formatNumber(o.threeagoincome.toFixed(2),'#,##.00');
            	document.getElementById("lastyearprofit").innerHTML = o.lastyearprofit == null ? "":'<span>￥</span>'+formatNumber(o.threeagoincome.toFixed(2),'#,##.00');
            	document.getElementById("lastshortdebt").innerHTML = o.lastshortdebt == null ? "":'<span>￥</span>'+formatNumber(o.threeagoincome.toFixed(2),'#,##.00');
            	document.getElementById("lastnetprofit").innerHTML = o.lastnetprofit == null ? "":'<span>￥</span>'+formatNumber(o.threeagoincome.toFixed(2),'#,##.00');
            	document.getElementById("qualify1").innerHTML = o.qualify1 == null ? "":o.qualify1;
            	document.getElementById("qualify1exp").innerHTML = o.qualify1exp == null ? "":o.qualify1exp;
            	document.getElementById("qualify2").innerHTML = o.qualify2 == null ? "":o.qualify2;
            	document.getElementById("qualify2exp").innerHTML = o.qualify2exp == null ? "":o.qualify2exp;
            	document.getElementById("qualify3").innerHTML = o.qualify3 == null ? "":o.qualify3;
            	document.getElementById("qualify3exp").innerHTML = o.qualify3exp == null ? "":o.qualify3exp;
            	document.getElementById("qualifycomm").innerHTML = o.qualifycomm == null ? "":o.qualifycomm;
            	//附件查询
				var grid_0 = nui.get("grid_0");
				grid_0.load({"groupid":"MIS_CUSTINFO","relationid":o.custid});
				grid_0.sortBy("fileTime","desc");
            }
        });
        //客户对应项目
        var projectJson =  {"criteria":{"_expr":[{"_value":custid,"_property":"custid","_op":"="}]}};
        projectGrid.load(projectJson);
        //客户对应合同
        datagrid6.load({custid:data});
        datagrid6.sortBy("contreg", "desc");//asc
        //客户对应联系人
        datagrid4.load({custid:data});
        //客户对应系统
        datagrid5.load({custid:data});
    }
    
    function onTitleRenderer(e) {
    	if(isCommerce == true||isFinance == true||isPMO == true){//不是商务不是财务不是PMO，不能查看合同金额及合同链接
    		return "<a href='javascript:void(0)' onclick='doView();' title='点击查看'>" + e.value + "</a>";
		}else{
			return e.value;
		}
	}
	function doView(){
		var grid = nui.get("datagrid6"); 
		var selectRow = grid.getSelected();
		if(!selectRow){
			nui.alert("请选择其中一条合同数据!");
			return;
		}
		var executeUrl = "<%=request.getContextPath() %>/contract/contract/contractView.jsp?contractid=" + selectRow.contractid;
		window.open(executeUrl, "合同查看", "fullscreen=1");
	}
    //关闭窗口
	function onCancel(e) {
        window.close();
    }
    //客户类型业务字典
	function custtype(e){
		return nui.getDictText('MIS_INDUSTRY',e.value);
	}
	//性别业务字典
	function gender(e){
		return nui.getDictText('gender',e.value);
	}
	//项目当前阶段业务字典
	function mis_phase(e){
		return nui.getDictText('MIS_PHASE',e.value);
	}
	//系统上线业务字典
	function mis_developphase(e){
		return nui.getDictText('MIS_DEVELOPPHASE',e.value);
	}
	//目前版本业务字典
	function MIS_YN(e){
		return nui.getDictText('MIS_YN',e.value);
	}
	//合同类型业务字典
	function MIS_CONTRACTTYPE(e){
		return nui.getDictText('MIS_CONTRACTTYPE',e.value);
	}
	//服务模块业务字典
	function CS_SERVMODULE(e){
		return nui.getDictText('CS_SERVMODULE',e.value);
	}
	//服务期限业务字典
	function CS_SERVTERM(e){
		return nui.getDictText('CS_SERVTERM',e.value);
	}
	//使用版本业务字典
	function CS_PRODUCTSERIES(e){
		return nui.getDictText('CS_PRODUCTSERIES',e.value);
	}
	function onGenderRenderer(e) {
        return nui.getDictText('CONT_ORG',e.value);
    }
    function onGender1Renderer(e) {
        return nui.getDictText('CS_CONTRACTTYPE',e.value);
    }
    //项目名称添加跳转
    function getProjectNameDetail(e){
    	if(e.value){
    		return "<a href='javascript:void(0)' onclick='checkProjectName();' title='点击查看'>" + e.value + "</a>";
    	}
    }
    
    //查询项目详情
    function checkProjectName(){
    	var selectRow = projectGrid.getSelected();
		var executeUrl = "/default/project/rdproject/projectDetail.jsp?projid=" + selectRow.projectId;
		window.open(executeUrl);
    }
    
    //项目类型业务字典
    function dictGetType(e){
			return nui.getDictText('PROJECT_TYPE',e.value);
	}
	
	//项目内部状态业务字典
	function dictGetStatus(e){
		return nui.getDictText('MIS_PROJSTATUS',e.value);
	}
	
	//项目外部状态业务字典
	function dictGetOutStatus(e){
		return nui.getDictText('MIS_PROJOUTSTATUS',e.value);
	}
	
	//预算状态
	function dictIspassbud(e){
		return nui.getDictText('AME_ISPASSBUD',e.value);
	}
	
	//合计
	function drawContarctSum(e){
		if (e.field == "prodmon" || e.field == "servmon"|| e.field == "contsum") {
            e.cellHtml = "<div align='right'><b>" + e.cellHtml + "</b></div>";
        }
	}
</script>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@page import="com.eos.data.datacontext.UserObject"%>
<%
	String contextPath=request.getContextPath();
 %>
<html>
<!-- 
  - Author(s): liubo
  - Date: 2016-06-02 18:18:37
  - Description:
-->
<head>
	<title>供应商基本信息</title>
	<meta http-equiv="content-type" content="text/html; charset=UTF-8" />
	<script src="<%= request.getContextPath() %>/common/nui/nui.js"
		type="text/javascript"></script>
	<script src="../common/nui/nui.js" type="text/javascript"></script>
	<style type="text/css">
	    body{
	        margin:0;padding:0;border:0;width:100%;height:100%;overflow:hidden;
	    }
    </style>
</head>
<body>
	<div class="nui-fit">
		<form id="form1" method="post" >
			<input name="purSupplier.purstatus" id="purstatus" class="nui-hidden" />
			<input name="purSupplier.custid" id="custid" class="nui-hidden" />
			<fieldset id="field1" style="border:solid 1px #aaa;padding:3px;">
				<legend>供应商基本信息</legend>
<!-- 			<input name="misOpinion.fileids" id="fileids"  class="nui-hidden"/> -->
				<div style="padding:5px;">
					<table style="table-layout:fixed;" id="table_file">
					<tr >
						<td align="right" style="width:120px">供应商名称:</td>
						<td style="width:300px"><input name="purSupplier.custname" id="custname" class="nui-textbox" readonly="readonly" required="true" style="width:280px"/></td>
						<td align="right" style="width:120px">供应商编号:</td>
						<td style="width:260px"><input name="purSupplier.custnum" id="custnum" class="nui-textbox" readonly="readonly" style="width:170px"/></td>	
					</tr>
					<tr>
						<td align="right" style="width:120px">供应商简称:</td>
						<td><input name="purSupplier.suppliersname" id="suppliersname" class="nui-textbox" readonly="readonly" style="width:100px"/></td>
						<td align="right" style="width:120px">供应商类型:</td>
						<td><input name="purSupplier.custtype" id="custtype" class="nui-dictcombobox" readonly="readonly" dictTypeId="AME_SUPTYPE" multiSelect="true"  style="width:260px" showNullItem="true" nullItemText=""/></td>
					</tr>
					<tr>
						<td align="right" style="width:120px">注册地址:</td>
						<td><input name="purSupplier.registaddress" id="registaddress" class="nui-textbox" readonly="readonly" style="width:280px"/></td>
						<td align="right" style="width:120px">注册地所在城市:</td>
						<td><input name="purSupplier.registcity" id="registcity" class="nui-dictcombobox" readonly="readonly" dictTypeId="MIS_AREA" allowInput="true" valueFromSelect="true" style="width:100px" showNullItem="true" nullItemText=""/></td>
					</tr>
					<tr>
						<td align="right" style="width:120px">法人代表:</td>
						<td><input name="purSupplier.legalperson" id="legalperson" class="nui-textbox" readonly="readonly" style="width:100px"/></td>
						<td align="right" style="width:120px">成立日期:</td>
						<td><input name="purSupplier.estabdate" id="estabdate" class="nui-datepicker" readonly="readonly" style="width:100px"/></td>
					</tr>
					<tr >
						<td align="right" style="width:120px">员工总数:</td>
						<td><input name="purSupplier.empsize" id="empsize" class="nui-textbox" readonly="readonly" style="width:100px"/></td>
						<!-- <td align="right" style="width:120px">状态:</td>
						<td><input name="purSupplier.status" id="status" class="nui-dictcombobox" dictTypeId="AME_SUPSTATUS"  style="width:100px" showNullItem="true" nullItemText=""/></td> -->
					</tr>
					<tr>
						<td align="right" style="width:120px">注册资本:</td>
						<td><input name="purSupplier.registercap" id="registercap" class="nui-textbox" readonly="readonly" style="width:100px"/>(万元)</td>
						<td align="right" style="width:120px">实收资本:</td>
						<td colspan="2"><input name="purSupplier.cappay" id="cappay" class="nui-textbox" readonly="readonly" style="width:100px"/>(万元)</td>
					</tr>
					<tr>
						<td align="right" style="width:120px">是否一般纳税人:</td>
						<td><input name="purSupplier.istaxpayer" id="istaxpayer" class="nui-dictcombobox" readonly="readonly" dictTypeId="ABF_YESORNO" style="width:100px" showNullItem="true" nullItemText=""/></td>
						<td align="right" style="width:120px">企业性质:</td>
						<td><input name="purSupplier.custnature" id="custnature" class="nui-dictcombobox" readonly="readonly" dictTypeId="MIS_CUSTNATURE"  style="width:150px" showNullItem="true" nullItemText=""/></td>
					</tr>
					<tr>
						<td align="right" style="width:120px">普元联系人:</td>
						<td><input name="purSupplier.infoprovider" id="infoprovider" class="nui-textbox" readonly="readonly" style="width:100px"/></td>
						<td align="right" style="width:120px">普元联系电话:</td>
						<td><input name="purSupplier.telephone" id="telephone" class="nui-textbox" readonly="readonly" style="width:130px"/></td>
					</tr>
					<tr>
						<td align="right" style="width:120px">供应商联系人:</td>
						<td><input name="purSupplier.linkman" id="linkman" class="nui-textbox" readonly="readonly" style="width:100px"/></td>
						<td align="right" style="width:120px">供应商联系电话:</td>
						<td><input name="purSupplier.linktel" id="linktel" class="nui-textbox" readonly="readonly" style="width:130px"/></td>
					</tr>
					<tr>
						<td align="right" style="width:120px">供应商联系邮箱:</td>
						<td><input name="purSupplier.linkmail" id="linkmail" class="nui-textbox" readonly="readonly" style="width:210px"/></td>
						<td align="right" style="width:120px">供应商传真:</td>
						<td><input name="purSupplier.fax" id="fax" class="nui-textbox" readonly="readonly" style="width:130px"/></td>
					</tr>
					<tr>
						<td align="right" >供应商邮编:</td>
						<td><input name="purSupplier.postcode" id="postcode" class="nui-textbox" readonly="readonly" style="width:100px"/></td>
					</tr>
					<tr>
						<td align="right" style="width:120px">供应商联系地址:</td>
						<td colspan="3"><input name="purSupplier.address" id="address" class="nui-textbox" readonly="readonly" style="width:100%"/></td>
					</tr>
					<tr>
						<td align="right" style="width:120px">公司网址:</td>
						<td colspan="3"><input name="purSupplier.website" id="website" class="nui-textbox" readonly="readonly" vtype="url" style="width:100%"/></td>
					</tr>
					<tr>
						<td align="right" style="width:120px">备注:</td>
						<td colspan="3"><input name="purSupplier.comments" id="comments" class="nui-textarea" readonly="readonly" style="width:100%"/></td>
					</tr>
						</table>
			</fieldset>
			<fieldset style="border:solid 1px #aaa;padding:3px;">
				<legend>账户信息</legend>
				<table border="0" cellspacing="1" cellpadding="1" style="width:700px;" >
					<tr>
						<td align="right" style="width:120px">户名:</td>	
						<td><input name="purSupplier.accoutname" id="accoutname" class="nui-textbox" readonly="readonly" style="width:280px"/></td>
						<td align="right" style="width:120px">开户银行:</td>
						<td><input name="purSupplier.accoutbank" id="accoutbank" class="nui-textbox" readonly="readonly" style="width:280px"/></td>
					</tr>
					<tr>
						<td align="right" style="width:120px">税号:</td>
						<td><input name="purSupplier.taxno" id="taxno" class="nui-textbox" readonly="readonly" style="width:210px"/></td>
						<td align="right" style="width:120px">账号:</td>
						<td><input name="purSupplier.accountid" id="accountid" class="nui-textbox" readonly="readonly" style="width:210px"/></td>
					</tr>
				</table>
			</fieldset>
			<fieldset style="border:solid 1px #aaa;padding:3px;">
				<legend>财务信息</legend>
				<table border="0" cellspacing="1" cellpadding="1" style="width:700px;"><!-- style="border:1px solid #A8A8A8; width:700px;" -->
					<tr>
						<td style="width:120px"></td>
						<td align="center" style="width:160px">去年</td>
						<td align="center" style="width:160px">过去两年</td>
						<td align="center" style="width:160px">过去三年</td>
					</tr>
					<tr>
						<td align="right" style="width:120px">年份:</td>
						<td style="width:160px" align="center"><input name="purSupplier.lastyear" id="lastyear" class="nui-textbox" readonly="readonly"  style="width:120px;" inputStyle="text-align:center;"/></td>
						<td style="width:160px" align="center"><input name="purSupplier.twoago" id="twoago" class="nui-textbox" readonly="readonly"  style="width:120px" inputStyle="text-align:center;"/></td>
						<td style="width:160px" align="center"><input name="purSupplier.threeago" id="threeago" class="nui-textbox" readonly="readonly" style="width:120px" inputStyle="text-align:center;"/></td>
					</tr>
					<tr>
						<td align="right" style="width:120px">营业额(万元):</td>
						<td style="width:160px" align="center"><input name="purSupplier.lastyearincome" id="lastyearincome" class="nui-textbox" readonly="readonly" style="width:120px"/></td>
						<td style="width:160px" align="center"><input name="purSupplier.twoagoincome" id="twoagoincome" class="nui-textbox" readonly="readonly" style="width:120px"/></td>
						<td style="width:160px" align="center"><input name="purSupplier.threeagoincome" id="threeagoincome" class="nui-textbox" readonly="readonly" style="width:120px"/></td>
					</tr>
					<tr>
						<td align="right" style="width:120px">利润总和(万元):</td>
						<td style="width:160px" align="center"><input name="purSupplier.lastyearprofit" id="lastyearprofit" class="nui-textbox" readonly="readonly" style="width:120px"/></td>
						<td style="width:160px" align="center"><input name="purSupplier.twoagoprofit" id="twoagoprofit" class="nui-textbox" readonly="readonly" style="width:120px"/></td>
						<td style="width:160px" align="center"><input name="purSupplier.threeagoprofit" id="threeagoprofit" class="nui-textbox" readonly="readonly" style="width:120px"/></td>
					</tr>
					<tr>
						<td align="right" style="width:120px">上年度固定资产原值:</td>
						<td style="width:160px" align="center"><input name="purSupplier.lastproperty" id="lastproperty" class="nui-textbox" readonly="readonly" style="width:120px"/></td><td></td><td></td><td></td>
					</tr>
					<tr>
						<td align="right" style="width:120px">上年度固定资产净值:</td>
						<td style="width:160px" align="center"><input name="purSupplier.lastpropertynet" id="lastpropertynet" class="nui-textbox" readonly="readonly" style="width:120px"/></td><td></td><td></td><td></td>
					</tr>
					<tr>
						<td align="right" style="width:120px">上年度流动资金:</td>
						<td style="width:160px" align="center"><input name="purSupplier.lastfloat" id="lastfloat" class="nui-textbox" readonly="readonly" style="width:120px"/></td><td></td><td></td><td></td>
					</tr>
					<tr>
						<td align="right" style="width:120px">上年度长期负债:</td>
						<td style="width:160px" align="center"><input name="purSupplier.lastlongdebt" id="lastlongdebt" class="nui-textbox" readonly="readonly" style="width:120px"/></td><td></td><td></td><td></td>
					</tr>
					<tr>
						<td align="right" style="width:120px">上年度短期负债:</td>
						<td style="width:160px" align="center"><input name="purSupplier.lastshortdebt" id="lastshortdebt" class="nui-textbox" readonly="readonly" style="width:120px"/></td><td></td><td></td><td></td>
					</tr>
					<tr>
						<td align="right" style="width:120px">上年净利润:</td>
						<td style="width:160px" align="center"><input name="purSupplier.lastnetprofit" id="lastnetprofit" class="nui-textbox" readonly="readonly" style="width:120px"/></td><td></td><td></td><td></td>
					</tr>
				</table>
			</fieldset>
			
			<fieldset style="border:solid 1px #aaa;padding:3px;">
				<legend>公司业务情况</legend>
				<table>
					<tr>
						<td align="right" style="width:120px">公司简介:</td>
						<td><input name="purSupplier.compdesc" id="compdesc" class="nui-textarea" readonly="readonly" style="width:550px"/></td>
					</tr>
					<tr>
						<td align="right" style="width:120px">主营产品:</td>
						<td><input name="purSupplier.mainprod" id="mainprod" class="nui-textarea" readonly="readonly" style="width:550px"/></td>
					</tr>
					<tr>
						<td align="right" style="width:120px">代理产品:</td>
						<td><input name="purSupplier.agentprod" id="agentprod" class="nui-textarea" readonly="readonly" style="width:550px"/></td>
					</tr>
				</table>
			</fieldset>
			
			<fieldset style="border:solid 1px #aaa;padding:3px;">
				<legend>资质和凭证</legend>
				<table style="table-layout:fixed;" id="table_file3">
					<tr>
						<td align="right" style="width:120px">营业执照注册号:</td>
						<td><input name="purSupplier.license" id="license" class="nui-textbox" readonly="readonly" style="width:150px"/></td>
						<td align="right" style="width:120px">营业执照到期日:</td>
						<td><input name="purSupplier.licenseenddate" id="licenseenddate" class="nui-datepicker" readonly="readonly" style="width:100%"/></td>
					</tr>
					<tr>
						<td align="right" style="width:120px">税务登记证:</td>
						<td><input name="purSupplier.taxnumb" id="taxnumb" class="nui-textbox" readonly="readonly" style="width:150px"/></td>
						<td align="right" style="width:120px">组织机构代码:</td>
						<td><input name="purSupplier.orgnum" id="orgnum" class="nui-textbox" readonly="readonly" style="width:160px"/></td>
					</tr>
					<tr>
						<td align="right" style="width:120px">资质1:</td>
						<td><input name="purSupplier.qualify1" id="qualify1" class="nui-textbox" readonly="readonly" style="width:100%"/></td>
						<td align="right" style="width:120px">资质1有效期:</td>
						<td><input name="purSupplier.qualify1exp" id="qualify1exp" class="nui-datepicker" readonly="readonly" style="width:100%"/></td>
					</tr>
					<tr>
						<td align="right" style="width:120px">资质2:</td>
						<td><input name="purSupplier.qualify2" id="qualify2" class="nui-textbox" readonly="readonly" style="width:100%"/></td>
						<td align="right" style="width:120px">资质2有效期:</td>
						<td><input name="purSupplier.qualify2exp" id="qualify2exp" class="nui-datepicker" readonly="readonly" style="width:100%"/></td>
					</tr>
					<tr>
						<td align="right" style="width:120px">资质3:</td>
						<td><input name="purSupplier.qualify3" id="qualify3" class="nui-textbox" readonly="readonly" style="width:100%"/></td>
						<td align="right" style="width:120px">资质3有效期:</td>
						<td><input name="purSupplier.qualify3exp" id="qualify3exp" class="nui-datepicker" readonly="readonly" style="width:100%"/></td>
					</tr>
					<tr>
						<td align="right" style="width:120px">资质备注:</td>
						<td colspan="3"><input name="purSupplier.qualifycomm" id="qualifycomm" class="nui-textarea" readonly="readonly" style="width:100%"/></td>
					</tr>
			  	</table>
			  	
				<jsp:include page="/ame_common/detailFile.jsp"/>
				<jsp:include page="/ame_common/misOpinion.jsp"/>
			</fieldset>
			
		</div>
		
	</form>
		
			
	</div>

	<script type="text/javascript">
		nui.parse();
		
		
		
		
	  	var form = new nui.Form("form1");
	  	
	  	
		<%Long processInstID = Long.parseLong(request.getParameter("processInstID")); %>
		loadData();
		function loadData(){
			
			var data={processInstID:<%=processInstID %>,detailPurSupplier:"notnull"};
			var json=nui.encode(data);
			nui.ajax({
				url:"com.primeton.eos.ame_pur.PurSupplierProcess.queryPurSupplier.biz.ext",
				type:"post",
				data:json,
				contentType:"text/json",
				success:function (o){
				/* alert(nui.encode(o)); */
					form.setData(o);
                      //初始化审核意见
					nui.get("processinstid").setValue(o.workitem.processInstID);
	            	nui.get("workitemname").setValue(o.workitem.workItemName);
	            	nui.get("auditstatus").setValue("4");
		           	document.getElementById("salesEdit").style.display="none";
		           	document.getElementById("opinionHide").style.display="none";
		           	nui.get("auditopinion").setValue("");
		           	nui.get("backTo").setData(o.purSupplier.backList);
	            	//审核意见
					var grid = nui.get("datagrid1");
					grid.load({processInstID:<%=processInstID %>});
					grid.sortBy("time", "desc");
					
					//附件
					nui.get("grid_0").load({"groupid":"purSupplier","relationid":o.purSupplier.custid});
				},
				error:function(){}
			});
		}
		
       /*  function delPurOrder(){
        	document.getElementById("field3").style.display="none";
        } */
    	function onCheckRenderer(e) {
			return nui.getDictText('MIS_AUDITSTATUS',e.value);//设置业务字典值
		}
	    
	  	//标准方法接口定义
        function CloseWindow(action) {            
            if (window.CloseOwnerWindow) return window.CloseOwnerWindow(action);
            else window.close();            
        }
        
        function onCancel(e) {
            CloseWindow("cancel");
        }
        
	
		//附件下载
        function getdetail1(e){
            	return "<a href='javascript:void(0)' onclick='checkDetail1();' title='点击查看'>" + e.value + "</a>";
            }
        function checkDetail1(){
        	var grid = nui.get("grid_1");
        	var selectRow = grid.getSelected();
        	var url="com.primeton.components.web.fileupload.getfile.flow?fileId="+selectRow.fileId;
			window.open(url, '_self');
        }



	</script>

</body>
</html>
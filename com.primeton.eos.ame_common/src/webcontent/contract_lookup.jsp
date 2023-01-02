<%@page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<%@include file="/nui/common.jsp"%>
<%@include file="/common/common.jsp"%>
<link id="css_skin" rel="stylesheet" type="text/css" href="<%=contextPath%>/coframe/tools/skins/skin1/style.css" />
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <title>员工面板</title>
    <meta http-equiv="content-type" content="text/html; charset=UTF-8" />
	<link href="../demo.css" rel="stylesheet" type="text/css" />
    <style type="text/css">
    html, body
    {
        font-size:12px;
        padding:0;
        margin:0;
        border:0;
        height:100%;
        overflow:hidden;
    }
    </style>
</head>
<body> 
  <div class="nui-toolbar" style="text-align:center;line-height:30px;" borderStyle="border:0;">
    <div id="form1">
		<input class="nui-hidden" name="sortField" value="contractid"/>
		<input class="nui-hidden" name="sortOrder" value="desc"/>
			<table style="width:100%;">
				<tr>
	            	<td align="right"><span>合同存档编号：</span></td>
	            	<td align="left">
	            		<input class="nui-textbox" name="criteria._expr[0].contnum"/>
				        <input class="nui-hidden" name="criteria._expr[0]._op" value="like"/>
				        <input class="nui-hidden" name="criteria._expr[0]._likeRule" value="all"/>
				    </td>
		        	<td align="right"><span>登记日期：</span></td>
	            	<td align="left">
	            		<input class="nui-datepicker" name="criteria._expr[1]._min" style="width:100px"/>-<input class="nui-datepicker" name="criteria._expr[1]._max" style="width:100px"/>
				        <input class="nui-hidden" name="criteria._expr[1]._property" value="contreg"/>
				        <input class="nui-hidden" name="criteria._expr[1]._op" value="between"/>
				        <input class="nui-hidden" name="criteria._expr[1]._pattern" value="yyyy-MM-dd"/>
				    </td>
	            	<td align="right"><span>合同类型：</span></td>
	            	<td align="left">
	            		<input class="nui-dictcombobox" name="criteria._expr[2].contracttype" dictTypeId="MIS_CONTRACTTYPE" multiSelect="true"/>
	            		<input class="nui-hidden" name="criteria._expr[2]._op" value="in"/>
				    </td>
				</tr>
				<tr>
					<td align="right"><span>签署单位：</span></td>
	            	<td align="left">
	            		<input class="nui-textbox" name="criteria._expr[3]._value"/>
	            		<input class="nui-hidden" name="criteria._expr[3]._property" value="misCustinfo.custname"/>
				        <input class="nui-hidden" name="criteria._expr[3]._op" value="like"/>
				        <input class="nui-hidden" name="criteria._expr[3]._likeRule" value="all"/>
				    </td>
				    <td align="right"><span>项目名称：</span></td>
	            	<td align="left">
	            		<input class="nui-textbox" name="criteria._expr[4]._value"/>
	            		<input class="nui-hidden" name="criteria._expr[4]._property" value="projectname"/>
				        <input class="nui-hidden" name="criteria._expr[4]._op" value="like"/>
				        <input class="nui-hidden" name="criteria._expr[4]._likeRule" value="all"/>
				    </td>
				    <td align="right"><span>销售姓名：</span></td>
	            	<td align="left">
	            		<input class="nui-textbox" name="criteria._expr[5]._value" id="salename"/>
	            		<input class="nui-hidden" name="criteria._expr[5]._property" value="salename"/>
				        <input class="nui-hidden" name="criteria._expr[5]._op" value="like"/>
				        <input class="nui-hidden" name="criteria._expr[5]._likeRule" value="all"/>
				    </td>
				</tr>
				<tr>
				    <td align="right"><span>所属事业部：</span></td>
	            	<td align="left">
	            		<input class="nui-dictcombobox" id="org" name="criteria._expr[6]._value" dictTypeId="CONT_ORG" showNullItem="true" nullItemText="全部"/>
	            		<input class="nui-hidden" name="criteria._expr[6]._property" value="org"/>
				        <input class="nui-hidden" name="criteria._expr[6]._op" value="like"/>
				        <input class="nui-hidden" name="criteria._expr[6]._likeRule" value="all"/>
				    </td>
	            	<td align="right"><span>是否400转化合同：</span></td>
	            	<td align="left">
	            		<input class="nui-dictcombobox" name="criteria._expr[7].istrans" dictTypeId="MIS_YN" showNullItem="true" nullItemText="全部"/>
				    </td>
				    <td align="right"><span>产品名称：</span></td>
	            	<td align="left">
	            		<input class="nui-dictcombobox" name="criteria._ref[0]._expr[0]._value" dictTypeId="CS_PRODNAME" id="prodname" multiSelect="true" style="width:270px"/>
	            		<input class="nui-hidden" name="criteria._expr[8]._property" value="contractid"/>
				        <input class="nui-hidden" name="criteria._expr[8]._op" value="in" id="tempCond1"/>
				        <input class="nui-hidden" name="criteria._expr[8]._ref" value="1" id="tempCond2"/>
				        <input class="nui-hidden" name="criteria._ref[0]._id" value="1"/>
				        <input class="nui-hidden" name="criteria._ref[0]._entity" value="com.primeton.mis.contract.contract.CsContractProduct"/>
				        <input class="nui-hidden" name="criteria._ref[0]._select._field[0]" value="contractid"/>
				        <input class="nui-hidden" name="criteria._ref[0]._expr[0]._property" value="prodname"/>
				        <input class="nui-hidden" name="criteria._ref[0]._expr[0]._op" value="in"/>
				    </td>
				</tr>
				<tr>
				    <td align="right"><span>合同总金额：</span></td>
				    <td align="left">
	            		<input class="nui-textbox" name="criteria._expr[9]._min" style="width:80px"/>-<input class="nui-textbox" name="criteria._expr[9]._max" style="width:80px"/>
				        <input class="nui-hidden" name="criteria._expr[9]._property" value="contsum"/>
				        <input class="nui-hidden" name="criteria._expr[9]._op" value="between"/>
				    </td>
				    <td align="right"><span>产品单价：</span></td>
				    <td align="left">
	            		<input class="nui-textbox" name="criteria._ref[0]._expr[1]._min" style="width:80px" id="price1"/>-<input class="nui-textbox" name="criteria._ref[0]._expr[1]._max" style="width:80px" id="price2"/>
				        <input class="nui-hidden" name="criteria._ref[0]._expr[1]._property" value="price"/>
				        <input class="nui-hidden" name="criteria._ref[0]._expr[1]._op" value="between"/>
				    </td>
				    <td align="right"><span>合同号：</span></td>
				    <td align="left">
				    	<input class="nui-textbox" name="criteria._expr[10].contid"/>
				        <input class="nui-hidden" name="criteria._expr[10]._op" value="like"/>
				        <input class="nui-hidden" name="criteria._expr[10]._likeRule" value="all"/>
				        
				        <input class="nui-hidden" name="criteria._expr[11]._value" id="salesname"/>
	            		<input class="nui-hidden" name="criteria._expr[11]._property" value="salename"/>
				        <input class="nui-hidden" name="criteria._expr[11]._op" value="in"/>
				    </td>
				</tr>
				<tr><td align="center" colspan="8"><a class="nui-button" iconCls="icon-search" onclick="search()">查找</a></td></tr>
		    </table>
    </div>
  <div class="nui-fit">
    <div id="datagrid1" class="nui-datagrid" style="width:100%;height:295px;" idField="custid" url="com.primeton.eos.ame_common.contract.queryContract.biz.ext" dataField="contracts" sizeList=[5,10,20,50,100] multiSelect="false" pageSize="10"  onrowdblclick="onRowDblClick" >
      <div property="columns" >
        <div type="checkcolumn"></div>
        <div field="contnum" allowSort="true" headerAlign="center" width="80">合同存档编号</div>
        <div field="contreg" allowSort="true" headerAlign="center" width="80">登记日期</div>
        <div field="misCustinfo.custname" width="180" dateFormat="yyyy-MM-dd" headerAlign="center" allowSort="true">签单公司</div>
        <div field="projectname" width="180" headerAlign="center">项目名称</div>
        <!-- <div field="prodmon" dataType="currency" summaryType="sum" currencyUnit="￥" align="right" width="100" headerAlign="center" allowSort="true">产品金额（元）</div>
        <div field="servmon" dataType="currency" summaryType="sum" currencyUnit="￥" align="right" width="100" headerAlign="center" allowSort="true">服务金额（元）</div> -->
        <div field="contsum" dataType="currency" summaryType="sum" currencyUnit="￥" align="right" width="100" headerAlign="center" allowSort="true">总金额（元）</div>
        <div field="gathermon" dataType="currency" summaryType="sum" currencyUnit="￥" align="right" width="100" headerAlign="center" allowSort="true">已收款（元）</div>
        <div field="salename" width="50" headerAlign="center" allowSort="true">销售姓名</div>
        <div field="org" renderer="onGradeRenderer" width="100" headerAlign="center" allowSort="true">部门</div>
      </div>
    </div>
    <script>
        function onGradeRenderer(e) {
            return nui.getDictText('CONT_ORG',e.value);
        }
    </script>
  </div>
  <div class="nui-toolbar" style="text-align:center;padding-top:8px;padding-bottom:8px;" borderStyle="border:0;">
    <a class="nui-button" style="width:60px;" onclick="onOk()">确定</a>
    <span style="display:inline-block;width:25px;"></span>
    <a class="nui-button" style="width:60px;" onclick="onCancel()">关闭</a>
  </div>
  <script type="text/javascript">
    nui.parse();
    var grid = nui.get("datagrid1");
    init();
	function init(){
		var isCommerce = false;//
		var isFinance = false;//
		var isLeader = false;//是否是领导（含：COO、事业部总经理、事业部副总经理、产品支持中心总监、软件产品部总经理、合同查询员）
		var isAssistant = false;//是否是事业部助理
		var isOrgLeader = false;//是否是销售部门的主管
		<l:iterate id="roles" property="userObject/attributes/roles" scope="session">
			var roleid = "<b:write iterateId='roles' property='roleid'/>";
			if(roleid == "commerce"){
				isCommerce = true;
			}
			if(roleid == "finance"){
				isFinance = true;
			}
			if(roleid == "assistant"){
				isAssistant = true;
			}
			if(roleid == "COO" || roleid == "general" || roleid == "viceGeneral" || roleid == "prodGeneral" || roleid == "CSManager" || roleid == "contractQuery" || roleid == "csoper" || roleid == "legal" || roleid == "PMO"){
				isLeader = true;
			}
		</l:iterate>
		if(isAssistant == true && isLeader == false){//助理，可以看本事业部的
			var userid = "<b:write property='userObject/userId' scope='session'/>";
			var data = {userid:userid};
            var json = nui.encode(data);
			nui.ajax({
                url: "com.primeton.mis.contract.contract.getAssisBelongTo.biz.ext",
                type: "post",
                data: json, 
                cache: false,
                contentType: 'text/json',
                success: function (o) {
                    if(o.org == null || o.org == ""){
                    	nui.get("org").setValue("5");
                    	nui.get("org").setEnabled(false);
                    	grid.load({"criteria":{"_expr":[{"org": "5","_op":"like","_likeRule":"all"}]}});
						grid.sortBy("contractid", "desc");
                    }else{
                    	nui.get("org").setValue(o.org);
                    	nui.get("org").setEnabled(false);
                    	grid.load({"criteria":{"_expr":[{"org": o.org,"_op":"like","_likeRule":"all"}]}});
						grid.sortBy("contractid", "desc");
                    }
                },
                error: function () {
                }
            });
		}
		if(isFinance == false && isCommerce == false && isLeader == false && isAssistant == false){//非商务、非财务、非领导、非助理，只能看自己的合同或者自己部门的合同
			var empid = "<b:write property='userObject/attributes/empid' scope='session'/>";
			var data = {empid:empid};
		    var json = nui.encode(data);
		    var salesname = "";
			nui.ajax({
		        url: "com.primeton.mis.contract.contract.getSaleLeadersAllSubSale.biz.ext",
		        type: "post",
		        data: json, 
		        cache: false,
		        contentType: 'text/json',
		        success: function (o) {
		            if(o.isorgleader == "1"){
		            	isOrgLeader = true;
		            	salesname = o.salesname;
						if(isOrgLeader == true){//部门经理，可以看本部门的
							nui.get("salesname").setValue(salesname);
							grid.load({"criteria":{"_expr":[{"salename": salesname,"_op":"in"}]}});
							grid.sortBy("contractid", "desc");
						}
		            }else{		            	
						var username = "<b:write property='userObject/userName' scope='session'/>";
						nui.get("salename").setValue(username);
						nui.get("salename").setEnabled(false);
						grid.load({"criteria":{"_expr":[{"salename": username,"_op": "like","_likeRule": "all"}]}});
						grid.sortBy("contractid", "desc");
		            }
		        },
		        error: function () {
		        }
		    });
		}else{
			grid.load();
			grid.sortBy("contractid", "desc");
		}
	}
    function search(){
    	if(nui.get("prodname").getValue() == "" && nui.get("price1").getValue() == "" && nui.get("price2").getValue() == ""){
    		nui.get("tempCond1").setValue("=");
    		nui.get("tempCond2").setValue("");
    	}else{
    		nui.get("tempCond1").setValue("in");
    		nui.get("tempCond2").setValue("1");
    	}
        var form = new nui.Form("#form1");
        var data = form.getData(true,true);
        grid.load(data);
    }
    function GetData() {
      var row = grid.getSelected();
      var data = {};
      data.id = row.contractid;
      data.text = row.contnum;
      data.projectname = row.projectname;
      data.prodmon = row.prodmon;
      data.servmon = row.servmon;
      data.contsum = row.contsum;
      data.servsubmon = row.servsubmon;
      data.othmon = row.othmon;
      data.contpolmon = row.contpolmon;
      data.salename = row.salename;
      data.custid = row.misCustinfo.custid;
      data.custname = row.misCustinfo.custname;
      data.accoutname = row.misCustinfo.accoutname;      
      data.accoutbank = row.misCustinfo.accoutbank;     
      data.taxnumb = row.misCustinfo.taxnumb;     
      data.accountid = row.misCustinfo.accountid;     
      data.address = row.misCustinfo.address;     
      data.telephone = row.misCustinfo.telephone;  
      return data;
    }
    function onKeyEnter(e) {
      search();
    }
    //////////////////////////////////
    function CloseWindow(action) {
      if (window.CloseOwnerWindow) return window.CloseOwnerWindow(action);
      else window.close();
    }
    function onOk() {
      var row = grid.getSelected();
      if (!row) {
        alert("请选中一条记录");
        return;
      }
      CloseWindow("ok");
    }
    function onCancel() {
      CloseWindow("cancel");
    }
    function onRowDblClick(e) {
		onOk();
	}
  </script>
</body>
</html>

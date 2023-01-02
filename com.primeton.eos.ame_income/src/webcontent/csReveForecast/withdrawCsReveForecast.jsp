<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@page import="com.eos.data.datacontext.UserObject"%>
<html>
<html>
<!-- 
  - Author(s): xuqq
  - Date: 2017-12-14 09:35:06
  - Description:
-->
<head>
<title>已确认收入撤回</title>
<meta http-equiv="content-type" content="text/html; charset=UTF-8" />
<%@include file="/common/common.jsp"%>
<h:script src='<%="/common/scripts/eos-web.js"%>' />
<script src="<%= request.getContextPath() %>/common/nui/nui.js" type="text/javascript"></script>
	<style type="text/css">
	    body{
	        margin:0;padding:0;border:0;width:100%;height:100%;overflow:hidden;
	    }
    </style>
</head>
<body>
<div class="nui-fit">
	<fieldset id="field1" style="border:solid 1px #aaa;padding:3px;">
		<legend>合同基本信息</legend>
		<form id="form1" method="post">
			<input name="csContract.contractid" id="contractid" class="nui-hidden"/>
			<input name="csContract.contnum" id="contnum"  class="nui-hidden"/>
			<div style="padding:5px;">
				<table style="table-layout:fixed;" id="table_file">
					<tr>
	                    <td style="width:100px;" align="right">合同存档编号：</td>
	                    <td style="width:150px;" id="csContract.contnum"></td>
	                    <td style="width:100px;" align="right">合同名称：</td>
	                    <td style="width:250px;" id="csContract.projectname"></td>
		                <td style="width:100px;" align="right">合同签署日期：</td>
		                <td style="width:100px;" id="csContract.signdate"></td>
	                </tr>
	                <tr>
	                    <td style="width:100px;" align="right">签署单位：</td>
	                    <td style="width:150px;" id="csContract.misCustinfo.custname"></td>
	                    <td style="width:100px;" align="right">最终用户：</td>
	                    <td style="width:250px;" id="csContract.username"></td>
	                    <td style="width:100px;" align="right">受益销售：</td>
	                    <td style="width:100px;" id="csContract.salename"></td>
	                </tr>
	                <tr>
	                    <td style="width:100px;" align="right">服务金额：</td>
	                    <td style="width:150px;"id="csContract.servmon"></td>
	                    <td style="width:100px;" align="right">产品金额：</td>
	                    <td style="width:150px;"id="csContract.prodmon"></td>
	                    <td style="width:100px;" align="right">维保金额：</td>
	                    <td style="width:150px;"id="csContract.masum"></td>
	                </tr>
	                <tr>
	                    <td style="width:100px;" align="right">合同总金额：</td>
	                    <td style="width:150px;"id="csContract.contsum"></td>
	                </tr>
				</table>
			</div>
		</form>
	</fieldset>
	
	<fieldset style="border:solid 1px #aaa;padding:3px;">
		<legend>合同收入记录列表</legend>
		<div id="grid_income" class="nui-datagrid" style="width:100%;height:auto;" allowResize="true" dataField="csReveForecasts" showSummaryRow="true" ondrawsummarycell="doCountSum"
	 		url="com.primeton.eos.ame_income.csReveForecast.queryIncomeConfirm.biz.ext" allowCellSelect="true"  showPager="false" idField="appid" multiSelect="false" onselectionchanged="selectionChanged">
			<div property="columns">
				<div type="checkcolumn" width="25"></div>
				<div field="contnum" width="0">合同编号</div>
				<div field="reveno" width="65" align="center"  headerAlign="center" allowSort="true" renderer="getDetail">收入确认次数</div>
				<div field="revetype" width="80" align="center"  headerAlign="center" renderer="dictReveType">收入类型</div>
				<div field="newyearmonth" width="75" align="center"  headerAlign="center">预计确认年月</div>
				<div field="newmonthperiod" width="70" align="center"  headerAlign="center" renderer="dictmonth">预计确认旬度</div>
				<div field="changetimes" width="60" align="center"  headerAlign="center">变更次数</div>
				<div field="fcsum" width="90" align="right" headerAlign="center" dataType="currency" summaryType="sum" >本次确认金额</div>	
				<div field="actsum" width="90" align="right" headerAlign="center" dataType="currency" summaryType="sum" >实际确认金额</div>
				<div field="noRateSum" width="70" align="right" headerAlign="center" dataType="currency" summaryType="sum" >不含税金额</div>	
				<div field="fcreverate" width="60" align="center" headerAlign="center" numberFormat="p1">本次确认比例</div>	
				<div field="revetimedesc" width="70" align="center" headerAlign="center" >收入确认时点</div>		
				<div field="confirmday" width="70" align="center" headerAlign="center" >实际确认日期</div>
				<div field="actreveproof" width="100" align="center" headerAlign="center" renderer="dictproof">收入确认证据</div>		
				<div field="confirmday" width="65" align="center"  headerAlign="center">实际确认日期</div>
				<div field="status" width="70" align="center" headerAlign="center" renderer="dictstatus">目前确认状态</div>		
			</div>
		</div>
	</fieldset>
	
	
	<form id="form_Reve" method="post">
		<fieldset style="border:solid 1px #aaa;padding:3px;">
		<legend>撤回信息</legend>
			<div style="padding:5px;">
				<table style="table-layout:fixed;">
					<tr>
						<td align="right" style="width:110px">实际确认收入合计：</td>
						<td style="width:100px" name="income.actsum" id="income.actsum"/></td>
						<td align="right" style="width:110px">撤回类型：</td>
						<td style="width:100px" /><input property="editor" class="nui-dictcombobox"  name="CsReveDrawBack.drawbacktype" id="CsReveDrawBack.drawbacktype" dictTypeId="AME_REVEBACKTYPE" style="width:100%;" /></td>
						<td align="right" style="width:110px">邮件告知对象：</td>
						<td style="width:180px" /><input name="email.to" class="mini-textboxlist" <%--onbuttonclick="showEmployee" --%>id="email.to" allowInput="true" textField="empname" valueField="oemail" searchField="name" style="width:100%" url="com.primeton.eos.ame_budget.budgetOrgManager.queryUseridByName.biz.ext"/></td>
						<td align="right" style="width:110px">邮件抄送对象：</td>
						<td style="width:180px" /><input name="email.cc" class="mini-textboxlist" <%--onbuttonclick="showEmployee" --%>id="email.cc" allowInput="true" textField="empname" valueField="oemail" searchField="name" style="width:100%" url="com.primeton.eos.ame_budget.budgetOrgManager.queryUseridByName.biz.ext"/></td>
					</tr>
					<tr>
						<td align="right" style="width:200px">撤回原因：</td>
						<td colspan="7"><input name="CsReveDrawBack.drawbackreason" id="CsReveDrawBack.drawbackreason" class="nui-textarea" style="width:100%"/></td>
					</tr>
				</table>
			</div>
		</fieldset>
	</form>
</div>	
<div style="text-align:center;padding:10px;" class="nui-toolbar">
	<a class="nui-button" onclick="onOkAdd()" id="addReveFore" style="width:90px;margin-right:20px;">确定撤回</a>
	<a class="nui-button" onclick="onCancel('cancel')" style="width:60px;">关闭</a>
</div>
	<script type="text/javascript">
        nui.parse();
	  	var form = new nui.Form("form1");
	  	var grid_income = nui.get("grid_income");
	  	var form_Reve = new nui.Form("#form_Reve");
	  	function SetData(data){
	  		data = nui.clone(data);
      		var json = {csContract:{contractid:data.contractid}};
      		nui.ajax({
	            url: "com.primeton.eos.ame_income.csReveForecast.queryContByContractid.biz.ext",
	            data: json,
	            type: 'POST',
	            cache: false,
	            contentType: 'text/json',
	            success: function (o) {
	            	nui.get("contractid").setValue(o.csContract.contractid);
	            	nui.get("contnum").setValue(o.csContract.contnum);
	            	document.getElementById("csContract.projectname").innerHTML = o.csContract.projectname == null ? "":o.csContract.projectname;
	                //合同编号加链接
	                var tempSrc = "<a href='javascript:void(0)' onclick='doView();' title='点击查看'>" + o.csContract.contnum + "</a>";
	                 document.getElementById("csContract.contnum").innerHTML = tempSrc;
	                document.getElementById("csContract.signdate").innerHTML = o.csContract.signdate == null ?"":o.csContract.signdate;
	                document.getElementById("csContract.misCustinfo.custname").innerHTML = o.csContract.misCustinfo == null ?"":o.csContract.misCustinfo.custname;
	                document.getElementById("csContract.username").innerHTML = o.csContract.username == null ?"":o.csContract.username;
	                document.getElementById("csContract.contsum").innerHTML = o.csContract.contsum== null ?"":o.csContract.contsum;
	                document.getElementById("csContract.salename").innerHTML = o.csContract.salename== null ?"":o.csContract.salename;
	                document.getElementById("csContract.servmon").innerHTML = o.csContract.servmon== null ?"":o.csContract.servmon;
	                document.getElementById("csContract.prodmon").innerHTML = o.csContract.prodmon== null ?"":o.csContract.prodmon;
	                document.getElementById("csContract.masum").innerHTML = o.csContract.masum== null ?"":o.csContract.masum;
	                contsum = o.csContract.contsum;
	                
	                grid_income.load({contnum:o.csContract.contnum});
	            },
	            error: function (jqXHR, textStatus, errorThrown) {
	                alert(jqXHR.responseText);
	            }
            })
	  	}
	  	
	  	//选择确认合同收入出发方法
	  	function selectionChanged(){
	  		var rows = grid_income.getSelecteds();
	  		var actsum = 0
	  		for(var i = 0 ; i < rows.length ;i++){
	  			if(rows[i].actsum != null){
	  				actsum=actsum+rows[i].actsum;
	  			}
	  		}
	  		document.getElementById("income.actsum").innerHTML = formatNumber(actsum,'#,##.##');
	  	}
	  	
	  	//合同编号加链接
        function doView(){
			var contractid =nui.get("contractid").getValue();
			var executeUrl = "<%=request.getContextPath() %>/contract/contract/contractView.jsp?contractid=" + contractid;
			window.open(executeUrl, "合同查看", "fullscreen=1");
		}
		
		function doCountSum(e){        	
            if (e.field == "fcsum") {
                e.cellHtml = "<div align='right'><b>" + e.cellHtml + "</b></div>";
            }
           	if (e.field == "noRateSum") {
                e.cellHtml = "<div align='right'><b>" + e.cellHtml + "</b></div>";
            }
            if (e.field == "actsum") {
                e.cellHtml = "<div align='right'><b>" + e.cellHtml + "</b></div>";
            }
        }
        
        
        function getDetail(e){
        	return "<a href='javascript:void(0)' onclick='checkDetail();' title='点击查看'>" + e.value + "</a>";
        }
		function dictReveType(e) {
            return nui.getDictText('AME_REVETYPE',e.value);
        }
        function dictmonth(e) {
			return nui.getDictText('AME_MONTHPERIOD',e.value);//设置业务字典值
		}
	  	function dictproof(e) {
			return nui.getDictText('MIS_INCOMECONV',e.value);//设置业务字典值
		}
		function dictstatus(e) {
	  		if(e.record.processinstid){//有流程实例id
				if(e.value == "2"||e.value == "3"){
					return "<a href='javascript:void(0)' onclick='checkDictstatus();' title='点击查看流程图'>" + nui.getDictText('AME_REVESTATUS',e.value) + "</a>";
				}else{
					return nui.getDictText('AME_REVESTATUS',e.value);//设置业务字典值
				}
	  		}else{//没有流程实例id
				return nui.getDictText('AME_REVESTATUS',e.value);//设置业务字典值
			}
		}
		function onCancel(e) {
			if (window.CloseOwnerWindow) return window.CloseOwnerWindow();
	        else window.close();  
	    }
	    function onOkAdd(){
	    	var rows = grid_income.getSelected();
	    	if (rows == null || rows ==''){
	    		nui.alert("只能选择一条已确认的合同收入记录！");
	    		return;
	    	}
	    	var tubat = nui.get("CsReveDrawBack.drawbacktype").getValue();
	    	if(tubat == null || tubat == ''){
	    		nui.alert("是否管报必选！");
	    		return;
	    	}
	    	var to = nui.get("email.to").getValue();
	    	if(to == null || to == ''){
	    		nui.alert("邮件告知对象必填！");
	    		return;
	    	}
	    	var withdrawReason = nui.get("CsReveDrawBack.drawbackreason").getValue();
	    	if(withdrawReason == null || withdrawReason == ''){
	    		nui.alert("撤回原因必填！");
	    		return;
	    	}
	    	var json = form_Reve.getData();
	    	json.CsReveForecast = rows;
	    	var num='';
	    	if (rows.actsum == null){
	    		num='0'
	    	}else{
	    		num=rows.actsum
	    	}
	    	nui.confirm("是否要撤回实际确认收入为"+num+"元的合同收入？","确定？",
	    		function (action){
	    			if (action == "ok"){
    					 form_Reve.loading("操作处理中,请稍后...");
	    				 nui.ajax({
	    				 	url:"com.primeton.eos.ame_income.csReveForecast.drawbackCsReveForecast.biz.ext",
	    				 	data:json,
			    			type:"post",
			    			contentType:"text/json",
			    			success:function(action){
			    				nui.alert("已确认收入撤回成功！")
			    				form_Reve.unmask();
			    				grid_income.reload();
			    			},
			    			error:function(jqXHR, textStatus, errorThrown){
			    				nui.alert("error:" + jqXHR.responseText);
			    				form_Reve.unmask();
			    			}
	    				 });
	    			}
	    			else{
	    				return;
	    			}
	    		}
    		);
	    }
  	</script>
</body>
</html>
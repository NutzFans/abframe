<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@page import="com.eos.data.datacontext.UserObject"%>
<%@page import="commonj.sdo.DataObject"%>
<%@page import="java.util.Map"%>
<%
	String contextPath=request.getContextPath();
 %>
<html>
<!-- 
  - Author(s): xuqingqian
  - Date: 2016-10-18 15:01:58
  - Description:
-->
<head>
    <meta http-equiv="content-type" content="text/html; charset=UTF-8" />
	<script src="<%= request.getContextPath() %>/common/nui/nui.js"
		type="text/javascript"></script>
	<script src="../common/nui/nui.js" type="text/javascript"></script>
	<style type="text/css">
	    body{
	        margin:0;padding:0;border:0;width:100%;height:100%;overflow:hidden;
	    }
	    .asLabel
	    {
	        border:0;background-color:#F5F5F5;cursor:default;
	    }
	</style>
</head>
<body>
<div class="nui-fit">
  <form id="form1" method="post">
		<input name="ticket.ticketid" id="ticketid" class="nui-hidden"/>
		<fieldset id="field1" style="border:solid 1px #aaa;padding:3px;">
			<legend>发票信息</legend>
				<table style="table-layout:fixed;">
					<tr>
						<td align="right" style="width:120px;">发票号：</td>
						<td style="width: 150px;" class="asLabel" id="ticnum"></td>
						<td align="right" style="width:120px;">发票类型：</td>
						<td style="width: 150px;" class="asLabel" id="tictype"></td>
						<td align="right" style="width:120px;">发票日期：</td>
						<td style="width: 150px;" class="asLabel" id="ticdate"></td>
					</tr>
					<tr id="hi">
						<td align="right" style="width:120px;">发票金额：</td>
						<td style="width: 150px;" class="asLabel" id="ticmon"></td>
						<td align="right" style="width:120px;">税金：</td>
						<td style="width: 150px;" class="asLabel" id="tictax"></td>
						<td align="right" style="width:120px;">不含税金额：</td>
						<td style="width: 150px;" class="asLabel" id="ticmonnet"></td>
          </tr>
          <tr>
              <td align="right" style="width:120px;">采购合同编号：</td>
              <td style="width: 150px;" class="asLabel" id="purcontnum"></td>
              <td align="right" style="width:120px;">供应商：</td>
              <td colspan="3" class="asLabel" id="custid"></td>	
            </tr>
					<tr>
						<td align="right" style="width:120px;">是否有效：</td>
							<td style="width: 150px;" class="asLabel" id="state">
						</td>
						<td align="right" style="width:120px;">开票单位：</td>
							<td colspan="3" class="asLabel" id="ticcomp">
						</td>
					</tr>
					<tr>
						<td align="right" style="width:120px;">开票内容：</td>
							<td colspan="5" class="asLabel" id="ticcontent" style="height:50px;">
						</td>
					</tr>
					<tr>
						<td align="right" style="width:120px;">备注：</td>
							<td colspan="5" class="asLabel" id="remark" style="height:50px;">
						</td>
					</tr>
				</table>
    </fieldset>
    
    <fieldset id="field3" style="border:solid 1px #aaa;padding:3px;width: 98%;">
        <legend>附件</legend>
      <jsp:include page="/ame_common/detailFile.jsp"/>
     </fieldset>
  </form>
</div>
<div style="text-align:center;padding:10px;" class="nui-toolbar">
		<a class="nui-button" onclick="onCancel('cancel')" id="closeWin" style="width:60px;">关闭</a>
</div>
<form name="viewlist1" id="viewlist1" action="com.primeton.eos.ame_common.ameExportCommon.flow" method="post">
		<input type="hidden" name="_eosFlowAction" value="action0" filter="false"/>
		<input type="hidden" name="downloadFile" filter="false"/>
		<input type="hidden" name="fileName" filter="false"/>
</form>
	<script type="text/javascript">
		
		nui.parse();
		var form = new nui.Form("form1");
    
    function SetData(data){
      form.mask("数据加载中...");
      var json=nui.encode({ticketid:data.ticketid});
      nui.ajax({
				url: "com.primeton.eos.ame_pur.purTicket.getPurTicketDetail.biz.ext",
				type: "post",
				data: json,
				contentType: "text/json",
				success: function (o){
					var form = new nui.Form("form1");
					//加载附件设置参数
          nui.get("grid_0").load({"groupid":"ticket","relationid": o.ticket.ticketid});
          nui.get("ticketid").setValue(o.ticket.ticketid);
          var ticket = o.ticket;
					document.getElementById("ticnum").innerHTML = ticket.ticnum == null? "":ticket.ticnum;
					document.getElementById("purcontnum").innerHTML = ticket.purcontnum == null? "":ticket.purcontnum;
					document.getElementById("tictype").innerHTML= ticket.tictype == null? "":nui.getDictText('MIS_MA_INVOICETYPE',ticket.tictype);
					document.getElementById("state").innerHTML= ticket.tictype == null? "":nui.getDictText('MIS_YN',ticket.state);
					document.getElementById("custid").innerHTML = ticket.custid == null? "":ticket.custname;
					document.getElementById("ticdate").innerHTML= ticket.ticdate == null? "":ticket.ticdate.substring(0,19);
          document.getElementById("ticmon").innerHTML= ticket.ticmon == null? "":nui.formatNumber(ticket.ticmon,"n2");
          document.getElementById("tictax").innerHTML= ticket.tictax == null? "":nui.formatNumber(ticket.tictax,"n2");
          document.getElementById("ticmonnet").innerHTML= ticket.ticmonnet == null? "":nui.formatNumber(ticket.ticmonnet,"n2");
					document.getElementById("ticcomp").innerHTML = ticket.ticcomp == null? "":ticket.ticcomp;
					document.getElementById("remark").innerHTML = ticket.remark == null? "":ticket.remark;
					document.getElementById("ticcontent").innerHTML = ticket.ticcontent == null? "":ticket.ticcontent;
          form.unmask();
				},
				error: function(){}
      });
    }
		
    function onCancel(e) {
			CloseWindow("cancel");
    }
        
    //标准方法接口定义
    function CloseWindow(action) {           
      if (window.CloseOwnerWindow) return window.CloseOwnerWindow(action);
      else window.close();
    }
	</script>
</body>
</html>
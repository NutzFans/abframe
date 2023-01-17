<%@page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@include file="/common/common.jsp"%>
<%@include file="/common/skins/skin0/component.jsp" %>
<html>
<!-- 
  - Author(s): mengyy
  - Date: 2017-07-25 10:43:40
  - Description:
-->
<head>
<title>编辑采购合同发票</title>
	<meta http-equiv="content-type" content="text/html; charset=UTF-8" />
	<script src="<%= request.getContextPath() %>/common/nui/nui.js" type="text/javascript"></script>
	<style type="text/css">
	    body{
	        margin:0;padding:0;border:0;width:100%;height:100%;overflow:hidden;
	    }
    </style>
</head>
<body>
	<div class="nui-fit">
		<div id="form1" method="post">
			<div style="padding:5px;">
				<input name="ticket.ticketid" id="ticketid" class="nui-hidden">
				<input name="ticket.ticrate" id="ticrate" class="nui-hidden">
				<input name="ticket.fileids" id="fileids" class="nui-hidden">
				<table style="width:100%;">
					<tr>
						<td align="right" style="width:100px;">发票编号：</td>
						<td align="left" >    
							<input name="ticket.ticnum" id="ticnum" class="nui-textbox" required="true" style="width:100%" onvaluechanged="checkTicketnum"/>
						</td>
						<td align="right" style="width: 100px;">发票日期：</td>
						<td align="left" >
							<input class="nui-datepicker" name="ticket.ticdate" id="ticdate" required="true" style="width:100%">
						</td>
						<td align="right" style="width:100px;">发票类型：</td>
						<td align="left" >  
							<input  name="ticket.tictype" id="tictype" class="nui-dictcombobox" style="width:100%" dictTypeId="MIS_MA_INVOICETYPE" required="true"/>
						</td>
					</tr>
					<tr>
						<td align="right" style="width:100px;">发票金额：</td>
						<td align="left" >    
							<input name="ticket.ticmon" id="ticmon" class="nui-spinner" style="width:100%"  format="n2"  minValue="0" required="true" showButton="false" onvaluechanged="countMonnet" allowLimitValue="false"/>
						</td>
						<td align="right" style="width:100px;">税金：</td>
						<td align="left" >    
							<input name="ticket.tictax" id="tictax" class="nui-spinner" style="width:100%" format="n2"  minValue="0" required="true" showButton="false" onvaluechanged="countMonnet" allowLimitValue="false"/>
						</td>
						<td align="right" style="width:100px;">不含税金额：</td>
						<td align="left" >    
							<input name="ticket.ticmonnet" id="ticmonnet" class="nui-spinner" style="width:100%" format="n2"  readonly="readonly" showButton="false" allowLimitValue="false"/>
						</td>
					</tr>
					<tr>
						<td align="right" style="width:100px;">采购合同：</td>
						<td align="left" >
							<input name="ticket.purcontid" id="purcontid" class="nui-buttonedit" style="width:100%" onbuttonclick="selectPurContract" allowInput="false" />
						</td>
						<td align="right" style="width:100px;">供应商：</td>
						<td align="left" colspan="3">
							<input name="ticket.custid"  onbuttonclick="changeCust"  id="custid" class="nui-buttonedit" style="width:100%" required="true"  allowInput="false" />
						</td>
					</tr>
					<tr>
						<td align="right" style="width:100px;">是否有效：</td>
						<td align="left" >  
							<input  name="ticket.state" id="state" class="nui-dictcombobox" style="width:100%" dictTypeId="MIS_YN" required="true"/>
						</td>
						<td align="right" style="width:100px;">开票单位：</td>
						<td align="left" colspan="3">    
							<input name="ticket.ticcomp" id="ticcomp" class="nui-textbox"  maxLength="100" style="width:100%;">
						</td>
					</tr>
					<tr>
						<td align="right" style="width:100px;">开票内容：</td>
						<td align="left" colspan="5">    
							<input name="ticket.ticcontent" id="ticcontent" class="nui-textarea" style="width:100%;height: 50px;" maxLength="120">
						</td>
					</tr>
					<tr>
						<td align="right" style="width:100px;">备注：</td>
						<td align="left" colspan="5">    
							<input name="ticket.remark" id="remark" class="nui-textarea" style="width:100%;height: 50px;" maxLength="120">
						</td>
					</tr>
				</table>
			</div>
		</div>
		<jsp:include page="/ame_common/inputFile.jsp"/>
	</div>
	<div style="text-align:center;padding:10px;" class="nui-toolbar">               
		<a class="nui-button" onclick="onOk"  id="okbutton" style="width:60px;margin-right:20px;">保存</a>       
		<a class="nui-button" onclick="onCancel('cancel')" style="width:60px;">取消</a>       
	</div>
	<script type="text/javascript">
		nui.parse();	
    	var form = new nui.Form("form1");
		var isflag = '0';
		var addurl="com.primeton.eos.ame_pur.purTicket.addPurTicket.biz.ext";
		var updateurl="com.primeton.eos.ame_pur.purTicket.updatePurTicket.biz.ext";
		var saveurl;
		var ischongfu;//发票号是否重复
    	
    	function SetData(data) {
    		var data = nui.clone(data);
			//编辑
    		if(data.action=='edit'){
				isflag = '1';
				saveurl = updateurl;
				var ticketid = data.ticketid;
				nui.get("ticketid").setValue(ticketid);
				var data1={ticketid:ticketid};
				var json=nui.encode(data1);
				nui.ajax({
					url: "com.primeton.eos.ame_pur.purTicket.getPurTicketDetail.biz.ext",
					data: json,
					type: 'POST',
					cache: false,
					contentType: 'text/json',
					success: function (o) {
						form.setData(o);
						nui.get("grid_0").load({"groupid":"ticket","relationid":o.ticket.ticketid});
						nui.get("purcontid").setValue(o.ticket.purcontid);
						nui.get("purcontid").setText(o.ticket.purcontnum);
						nui.get("custid").setValue(o.ticket.custid);
						nui.get("custid").setText(o.ticket.custname);
						nui.get("purcontid").setValue(o.ticket.purcontid);
						nui.get("purcontid").setText(o.ticket.purcontnum);
						nui.get("ticnum").setReadOnly(true);
						nui.get("ticnum").setRequired(false);
					},
					error: function (jqXHR, textStatus, errorThrown) {
						alert(jqXHR.responseText);
						CloseWindow();
					}
				});
			}else{
				//新增
				nui.get("ticnum").setRequired(true);
				nui.get("ticnum").setReadOnly(false);
				nui.get("ticmon").setValue(null);
				nui.get("tictax").setValue(null);
				nui.get("ticmonnet").setValue(null);
				nui.get("state").setValue("1");
				isflag='0';
				saveurl = addurl;
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
    	
    	function onOk(e){
			nui.get("okbutton").disable();
    		form2.submit();
    	}
    	
    	function SaveData(){
    		var o = form.getData();
	    	if(form.validate()){
				checkTicketnum();
				if(ischongfu!='1'){
					var json = nui.encode(o);
					nui.ajax({
						url: saveurl,
						data: json,
						type: 'POST',
						cache: false,
						contentType: 'text/json',
						success: function(text){
						var returnJson = nui.decode(text);
							if(returnJson.result=="success"){
								alert("保存成功");
								CloseWindow("ok");
							}else{
								nui.alert("保存失败");
								nui.get("okbutton").enable();
							}
						},
						error: function(jqXHR, textStatus, errorThrown){
							alert(jqXHR.responseText);
							CloseWindow();
						}
					});
				}else{
					nui.get("okbutton").enable();
					return;
				}
	    	}else{
				nui.get("okbutton").enable();
		    	return;
		    }
    	}

		function checkTicketnum(){
			//新增需要校验发票号是否重复
			if(isflag=='0'){
				var ticnum  = nui.get("ticnum").getValue();
				var json = nui.encode({ticnum:ticnum});
	    		nui.ajax({
					url: "com.primeton.eos.ame_pur.purTicket.checkTicnum.biz.ext",
					data: json,
					type: 'POST',
					cache: false,
					contentType: 'text/json',
					success: function(text){
						if(text.result=="1"){
							ischongfu='1';
							alert("发票号已存在，请检查后再进行操作！");
							return;
						}else{
							ischongfu='0';
						}
					},
					error: function(jqXHR, textStatus, errorThrown){
						alert(jqXHR.responseText);
						CloseWindow();
					}
				});
			}
		}
    	
		//自动计算不含税金额
		function countMonnet(){
			var ticmon = nui.get("ticmon").getValue();
			var tictax = nui.get("tictax").getValue();
			if(ticmon!=null && tictax!=null ){
				var ticmonnet = ticmon - tictax;
				nui.get("ticmonnet").setValue(ticmonnet);
				var ticrate = ticmon/ticmonnet-1;
				nui.get("ticrate").setValue(ticrate);
			}
		}
		
		//选择采购合同
		function selectPurContract(e){
			var btnEdit = this;
    		nui.open({
    			url:"<%=request.getContextPath()%>/ame_pur/PurContract/SelectContract.jsp",
                title: "选择采购合同",
                width: 600,
                height: 400,
                ondestroy: function (action) {
                	if (action == "ok") {
						var iframe = this.getIFrameEl();
						var data = iframe.contentWindow.GetData();
						data = nui.clone(data);    //必须
						
						btnEdit.setText(data.custname);
						btnEdit.setValue(data.custid);
						var purcontid = data.purcontid;
						var purcontnum = data.purcontnum;
						nui.get("purcontid").setValue(purcontid);
						nui.get("purcontid").setText(purcontnum);
						var purSupplier = data.purSupplier;
						if(purSupplier!=null){
							nui.get("custid").setValue(purSupplier.custid);
							nui.get("custid").setText(purSupplier.custname);
						}
					}
                }
    	 	});
		}

		//选择供应商
		function changeCust(e){
        	var btnEdit = this;
    		nui.open({
    			url:"/default/ame_pur/PurOtherSettlePay/QueryPurSupplier.jsp",
                title: "选择供应商",
                width: 600,
                height: 400,
                ondestroy: function (action) {
                	if (action == "ok") {
						var iframe = this.getIFrameEl();
						var data = iframe.contentWindow.GetData();
						data = nui.clone(data);    //必须
						
						btnEdit.setText(data.custname);
	                	btnEdit.setValue(data.custid);
					}
                }
    	 	});
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
		                	CloseWindow("cancel");
		                }
		            }
		        });
			}else{
				CloseWindow("cancel");
			}
	    }
	</script> 
</body>
</html>
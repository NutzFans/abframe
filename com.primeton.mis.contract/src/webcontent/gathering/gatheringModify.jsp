<%@page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<%@include file="/nui/common.jsp"%>
<%@include file="/common/common.jsp"%>
<%@include file="/common/skins/skin0/component.jsp" %>
<link id="css_skin" rel="stylesheet" type="text/css" href="<%=contextPath%>/coframe/tools/skins/skin1/style.css" />
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
	<title>新增</title>
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
<body style="width:100%;height:100%;padding:0px;margin:0px;">
<div class="nui-fit">
  <!-- 提示信息展示 -->
  <jsp:include page="/ame_common/ameFlowOperTips/ameFlowOperTipsInfo.jsp"/>
  <form id="form1" method="post" >
        <input name="csGather.gatherid" id="gatherid" class="nui-hidden" />
        <input name="csGather.userid" id="userid" class="nui-hidden" />
        <input name="csGather.username" id="username" class="nui-hidden" />
        <input name="csGather.isstart" id="isstart" class="nui-hidden" />
        <input name="csGather.custname" id="custname" class="nui-hidden" />
        <fieldset style="border:solid 1px #aaa;padding:3px;">
            <legend>收款确认</legend>
            <div style="padding:5px;">
            <table style="table-layout:fixed;">
            	 <tr>
                    <td align="right" nowrap="nowrap">支付单位：</td>
                    <td align="left" nowrap="nowrap">    
                        <input class="nui-buttonedit" style="width:300px" name="csGather.misCustinfo.custid" 
                        id="custid" value="" text="" onbuttonclick="onButtonEdit" showClose="true" 
                        oncloseclick="onCloseClick" required="true" allowInput="false"/>
                    </td>
                    <td align="right" nowrap="nowrap">收款方式：</td>
                    <td align="left" nowrap="nowrap">    
                        <input name="csGather.gathertype" id="gathertype" class="nui-dictcombobox" dictTypeId="AME_CSGATHERTYPE" required="true" vtype="float" onvaluechanged="watchgathertype"/>
                    </td>
                </tr>
                <tr>
                	<td align="right" nowrap="nowrap">实际收款日期：</td>
	                <td align="left" nowrap="nowrap">    
	                 	<input class="nui-datepicker" name="csGather.gatherdate" id="gatherdate" required="true" onvaluechanged="watchgatherdate"/>
	                </td>
                	<td align="right" nowrap="nowrap">财报收款日期：</td>
	                <td align="left" nowrap="nowrap">    
	                 	<input class="nui-datepicker" name="csGather.confirmday" id="confirmday" required="true"/>
	                </td>
                </tr>
            	<tr>
                    <td align="right" nowrap="nowrap">收款金额：</td>
                    <td align="left" nowrap="nowrap">    
                        <input name="csGather.summon" id="summon" class="nui-textbox" required="true" vtype="float"/>
                    </td>
                	<td align="right" nowrap="nowrap">票面到期日：</td>
	                <td align="left" nowrap="nowrap">    
	                 	<input class="nui-datepicker" name="csGather.expiredate" id="expiredate"/>
	                </td>
                </tr>
                <tr>
                    <td align="right" nowrap="nowrap">总账科目：</td>
                    <td align="left" nowrap="nowrap">    
                    	<input property="editor" name="csGather.kmbm" id="kmbm" style="width:300px" class="nui-textboxlist" required="true" allowInput="true" textField="kmbmname" valueField="kmbm" searchField="name" required="true" 
						url="com.primeton.ame.ledger.equivalent.queryKMBMisleaf.biz.ext"/>
					</td>
                </tr>
            </table>
        </div>
        </fieldset>
    </form>
</div>
<div style="text-align:center;padding:10px;border-width:1px 0px 0px 0px;" class="nui-toolbar">               
    <a class="nui-button" onclick="onOk('0')" id="saveBtn" style="width:60px;margin-right:20px;">保存</a>              
    <a class="nui-button" onclick="onOk('1')" id="startBtn" style="width:100px;margin-right:20px;">发起收款确认</a>
    <a class="nui-button" onclick="onCancel" style="width:60px;">关闭</a>
</div> 
<script type="text/javascript">
    var updateURL = "com.primeton.mis.contract.gathering.updateGathering.biz.ext";
	var addURL = "com.primeton.mis.contract.gathering.addGathering.biz.ext";
	var saveURL = "";
    nui.parse();
	var dept_grid = nui.get("dept_grid");
	function addRow() {          
        var newRow = { name: "New Row" };
        dept_grid.addRow(newRow, 0);
    }
    function removeRow() {
        var rows = dept_grid.getSelecteds();
        if (rows.length > 0) {
            dept_grid.removeRows(rows, true);
        }
        doCal();
    }
    
	//计算本次开票金额
	function doCal(e){
		var row = dept_grid.getSelected();
		if(row){
			var num = 0;
			var price = 0;
			if(row.num){
				num = row.num;
			}
			if(row.price){
				price = row.price;
			}
			var money = (parseFloat(num) * parseFloat(price)).toFixed(2);
			var rowData = {money: money};
			dept_grid.updateRow(row,rowData);
		}
		var datas=dept_grid.getData();
		var summoney = 0;
		for(var i=0;i<datas.length;i++){
			var money = datas[i].money;
			if(money){
				if(!isNaN(money)){
					summoney += parseFloat(money);
				}
			}
		}
		nui.get("billsummon").setValue(summoney.toFixed(2));
	}
	//点击保存时调用的方法
	var form = new nui.Form("form1");
	function SaveData() {
        var o = form.getData();
		var gatherid = nui.get("gatherid").getValue();
		if(gatherid){
			saveURL = updateURL;
		} else{
			saveURL = addURL;
		}
        var json = nui.encode(o);
        nui.ajax({
            url: saveURL,
            data: json,
            type: 'POST',
            cache: false,
            contentType: 'text/json',
            success: function (text) {
                var isstart = nui.get("isstart").getValue();
                if(isstart=="0"){
	                nui.alert("保存成功","提示",function(){
	                	nui.get("saveBtn").setEnabled(true);
	    				nui.get("startBtn").setEnabled(true);
		                CloseWindow("save");
	                })
                }else{
                	nui.alert("发起收款确认成功","提示",function(){
	                	nui.get("saveBtn").setEnabled(true);
	    				nui.get("startBtn").setEnabled(true);
		                CloseWindow("save");
	                })
                }
                
            },
            error: function (jqXHR, textStatus, errorThrown) {
                alert(jqXHR.responseText);
                CloseWindow();
            }
        });
    }
	//页面进入时调用的方法
    function SetData(data) {
    	promptInit({"workItemID":0,"processDefName":"com.primeton.mis.contract.gatheringConfirm","activityDefID":"manualActivity"});
        if (data.action == "edit") {
            //跨页面传递的数据对象，克隆后才可以安全使用
            data = nui.clone(data);
			var json = nui.encode({csGather:data});
            nui.ajax({
                url: "com.primeton.mis.contract.gathering.getGathering.biz.ext",
				type: 'POST',
				data: json,	
                async:false,
				contentType: 'text/json',
                success: function (o) {
                    form.setData(o);
                    form.setChanged(false);
                    nui.get("custid").setText(o.csGather.misCustinfo.custname);
                    nui.get("custname").setValue(o.csGather.misCustinfo.custname);    
	               	nui.get("kmbm").setValue(o.csGather.kmbm);
	               	nui.get("kmbm").setText(o.csGather.kmbmname);
                   	var processinstid = o.csGather.processinstid;
                   	if(processinstid){
	               		nui.get("saveBtn").setEnabled(false);
	               		nui.get("startBtn").setEnabled(false);
               		}
               		watchgathertype();
                }
            });
        }else{
        	var userid = "<b:write property='userObject/userId' scope='session'/>";
        	var username = "<b:write property='userObject/userName' scope='session'/>";
        	nui.get("userid").setValue(userid);
        	nui.get("username").setValue(username);
        	nui.get("gatherdate").setValue(new Date());
        	watchgatherdate();
        }
	}
    function GetData() {
        var o = form.getData();
        return o;
    }
    function CloseWindow(action) {            
        if (action == "cancel" && form.isChanged()) {
            if (confirm("数据被修改了，是否先保存？")) {
                return false;
            }
        }
        if (window.CloseOwnerWindow) return window.CloseOwnerWindow(action);
        else window.close();            
    }
    function onOk(e) {
    	var kmbm = nui.get("kmbm").getValue();
    	if(kmbm.indexOf(',') != -1){
    		nui.alert("总账科目只能选一个！");
    		return;
    	}
        if(!form.validate()){
        	return;
        }else{
        	nui.get("isstart").setValue(e);
        	nui.get("saveBtn").setEnabled(false);
    		nui.get("startBtn").setEnabled(false);
	    	SaveData();
	    }
    }
    function onCancel(e) {
        CloseWindow("cancel");
    }
 	//“签署单位”清除时的方法
    function onCloseClick(e) {
        var obj = e.sender;
        obj.setText("");
        obj.setValue("");
    }
    //“开票单位”点击选择时的方法
    function onButtonEdit(e) {
        var btnEdit = this;	
        var lookupUrl="";
    	lookupUrl = "/contract/contract/MisCustinfo_lookup.jsp";
		if (lookupUrl=="") return;
        nui.open({
			url:"<%=contextPath%>"+lookupUrl,
			title: "选择列表",
			width: 600,
			height: 420,
			ondestroy: function (action) {
				if (action == "ok") {
					var iframe = this.getIFrameEl();
					var data = iframe.contentWindow.GetData();
					data = nui.clone(data);    //必须
					if (data) {
		                btnEdit.setValue(data.id);
		                btnEdit.setText(data.text);
		                nui.get("custname").setValue(data.text);
					}
				}
			}
		});
	}
    //“合同存档编号”点击选择时的方法
    function onButtonEdit1(e) {
        var btnEdit = this;	
        var lookupUrl="";
    	lookupUrl = "/contract/contract/contract_lookup.jsp";
		if (lookupUrl=="") return;
        nui.open({
			url:"<%=contextPath%>"+lookupUrl,
			title: "选择列表",
			width: 600,
			height: 400,
			ondestroy: function (action) {
				if (action == "ok") {
					var iframe = this.getIFrameEl();
					var data = iframe.contentWindow.GetData();
					data = nui.clone(data);    //必须
					if (data) {
		                btnEdit.setValue(data.id);
		                btnEdit.setText(data.text);
		                nui.get("projectname").setValue(data.projectname);
					}
				}
			}
		});
	}
	var num=1;
	function watchgathertype(){
		var gathertype = nui.get("gathertype").getValue();
		if(gathertype == '1' || gathertype == '2' || gathertype == '3'){
			nui.get("gatherdate").setReadOnly(false);
			nui.get("gatherdate").setRequired(true);
			
			nui.get("confirmday").setReadOnly(false);
			nui.get("confirmday").setRequired(true);
			nui.get("expiredate").setRequired(false);
			if(gathertype == '3'){
				nui.get("expiredate").setRequired(true);
			}
		}else if(gathertype == '4'){
			nui.get("gatherdate").setReadOnly(true);
			nui.get("gatherdate").setRequired(false);
			nui.get("gatherdate").setValue(null);
			
			nui.get("confirmday").setReadOnly(false);
			nui.get("confirmday").setRequired(true);
			nui.get("expiredate").setRequired(true);
		}else if(gathertype == '5' || gathertype == '6'){
			nui.alert("收款类型为'银行承兑汇票承兑'和'商业承兑汇票承兑'不可选！")
			nui.get("gathertype").setValue(null);
			nui.get("expiredate").setRequired(false);
		}
		var kmbm = nui.get("kmbm").getValue();
		if((num==1 && (kmbm == '' || kmbm == null)) || num!=1){
			if(gathertype !='' && gathertype != null){
				var json = ({"eocDictEntry":{"eosDictType":{"dicttypeid":"AME_CSGATHERTYPE"},"dictid":gathertype}});
				nui.ajax({
		            url: "org.gocom.abframe.tools.DictManager.queryDictEntry.biz.ext",
					type: 'POST',
					data: json,	
	                async:false,
					contentType: 'text/json',
		            success: function (o) {
		            	if(o.eocDictEntry != null && o.eocDictEntry != ''){
			                nui.get("kmbm").setValue(o.eocDictEntry.filter1);
			                nui.get("kmbm").setText(o.eocDictEntry.filter2);
		                }else{
				             nui.get("kmbm").setValue(null);
				        	 nui.get("kmbm").setText(null);
		                }
		            }
		        });
	        }else{
	             nui.get("kmbm").setValue(null);
	        	 nui.get("kmbm").setText(null);
	        }
        }
        num++;
	}
	function watchgatherdate(){	
		var gatherdate = nui.get("gatherdate").getValue();
		var confirmday = nui.get("confirmday").getValue();
		if(gatherdate != '' && gatherdate != null){
			nui.get("confirmday").setValue(gatherdate);
		}
	}
</script>
</body>
</html>
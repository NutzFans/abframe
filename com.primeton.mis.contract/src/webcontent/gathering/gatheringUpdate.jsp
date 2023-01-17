<%@page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<%@include file="/nui/common.jsp"%>
<%@include file="/common/common.jsp"%>
<%@include file="/common/skins/skin0/component.jsp" %>
<link id="css_skin" rel="stylesheet" type="text/css" href="<%=contextPath%>/coframe/tools/skins/skin1/style.css" />
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
	<title>收款确认修改</title>
    <meta http-equiv="content-type" content="text/html; charset=UTF-8" />
	<link href="../demo.css" rel="stylesheet" type="text/css" />
	<script type="text/javascript" src="<%=contextPath %>/common/components/swffileupload/swfupload/swffileupload.js"></script>
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
<!-- 提示信息展示 -->
<jsp:include page="/ame_common/ameFlowOperTips/ameFlowOperTipsInfo.jsp"/>
<div class="nui-fit">
  <form id="form1" method="post" >
        <input name="csGather.gatherid" id="gatherid" class="nui-hidden" />
        <input name="misOpinion.processinstid" id="processinstid" class="nui-hidden" />
        <input name="misOpinion.processinstname" id="processinstname" class="nui-hidden" />
        <input name="misOpinion.activitydefid" id="activitydefid" class="nui-hidden" />
        <input name="misOpinion.workitemid" id="workitemid" class="nui-hidden" />
        <input name="misOpinion.workitemname" id="workitemname" class="nui-hidden" />
        <input name="misOpinion.isshow" id="isshow" class="nui-hidden" />
        <input name="misOpinion.auditstatus" id="auditstatus" class="nui-hidden" />
        <fieldset style="border:solid 1px #aaa;padding:3px;">
            <legend>收款确认</legend>
            <div style="padding:5px;">
            <table style="table-layout:fixed;">
            	 <tr>
                    <td style="width:210px;">支付单位：</td>
                    <td style="width:250px;">    
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
                    <td style="width:210px;">收款金额：</td>
                    <td style="width:250px;">    
                        <input name="csGather.summon" id="summon" class="nui-textbox" required="true" vtype="float"/>
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
        <fieldset style="border:solid 1px #aaa;padding:3px;">
            <legend>收款对应合同</legend>
            <div style="padding:5px;">
	        	<div id="cont_grid" class="nui-datagrid" style="width:100%;height:auto;" allowResize="true" idField="contsaleid"
			        showPager="false" allowCellEdit="true" allowCellSelect="true" multiSelect="true" editNextOnEnterKey="true">			        
			        <div property="columns">
			            <div field="csContract.contractid" width="0" headerAlign="center" >合同ID</div>
			            <div field="csContract.contnum" width="80" headerAlign="center" >合同存档编号</div>
			            <div field="csContract.projectname" width="80" headerAlign="center" >合同名称（项目）</div>
			            <div field="csContract.contsum" width="80" headerAlign="center" >合同总金额</div>
			            <div field="summon" width="80" headerAlign="center" >本次收款金额</div>
			        </div>
			    </div>
            </div>
        </fieldset>
        <fieldset style="border:solid 1px #aaa;padding:3px;">
            <legend>核销应收</legend>
            <div style="padding:5px;">
	        	<div id="dept_grid" class="nui-datagrid" style="width:100%;height:auto;" allowResize="true" idField="contsaleid"
			        showPager="false" allowCellEdit="true" allowCellSelect="true" multiSelect="true" editNextOnEnterKey="true">			        
			        <div property="columns">
			            <div field="csContractRec.recid" width="0" headerAlign="center" >应收ID</div>
			            <div field="csContractRec.contnum" width="80" headerAlign="center" >合同存档编号</div>
			            <div field="csContractRec.recmon" width="80" headerAlign="center" dataType="currency" currencyUnit="￥">应收金额</div>
			            <div field="csContractRec.recdate" width="80" headerAlign="center" >应收账龄起始日</div>
			            <div field="billmon" width="80" headerAlign="center" >本次核销金额</div>
			        </div>
			    </div>
            </div>
        </fieldset>
        <fieldset style="border:solid 1px #aaa;padding:3px;">
            <legend>审批意见列表</legend>
            	<div id="datagrid1" class="nui-datagrid" style="width:100%;height:auto;" dataField="misOpinions"
				    url="com.primeton.mis.contract.contractApply.queryAuditOpinions.biz.ext"  idField="id" allowResize="true"
				    sizeList="[20,30,50,100]" pageSize="20" allowAlternating="true" multiSelect="true">
				    <div property="columns">
				        <div field="operatorname" width="40" headerAlign="center" allowSort="true">审批人</div>
				        <div field="orgname" width="80" align="right" headerAlign="center" allowSort="true">审批人所在机构</div>
				        <div field="time" width="90" headerAlign="center" allowSort="true">审批时间</div>
				        <div field="workitemname" width="80" align="right" headerAlign="center" allowSort="true">审批环节</div>
				        <div field="auditstatus" renderer="onGenderRenderer" width="40" align="right" headerAlign="center" allowSort="true">审批结果</div>
				        <div field="auditopinion" width="160" headerAlign="center">审批意见</div>
				        <div field="files" renderer="onFileRenderer" width="160" headerAlign="center">附件</div>
				    </div>
				</div>
        </fieldset>
    </form>
</div>
<div style="text-align:center;padding:10px;border-width:1px 0px 0px 0px;" class="nui-toolbar">               
    <a class="nui-button" onclick="onOk" style="width:60px;margin-right:20px;">提交</a>
    <a class="nui-button" onclick="onCancel" style="width:60px;">关闭</a>
</div> 
<script type="text/javascript">
    var updateURL = "com.primeton.mis.contract.gathering.submitGathering.biz.ext";
	var saveURL = "";
    nui.parse();
    var processinstid = "<b:write property='workitem/processInstID'/>";
    var processinstname = "<b:write property='workitem/processInstName'/>";
    var activitydefid = "<b:write property='workitem/activityDefID'/>";
    var workitemid = "<b:write property='workitem/workItemID'/>";
    var workitemname = "<b:write property='workitem/workItemName'/>";
    SetData();
    var grid = nui.get("datagrid1");
	grid.load({processInstID:processinstid});
	grid.sortBy("time", "desc");
	function onGenderRenderer(e) {
        return nui.getDictText('MIS_AUDITSTATUS',e.value);
    }
	function onFileRenderer(e) {
        var tempSrc = "";
        for(var i=0;i<e.record.files.length;i++){
        	tempSrc += "<a href='com.primeton.components.web.fileupload.getfile.flow?fileId=" + e.record.files[i].fileId + "'>" + e.record.files[i].fileName + "</a>,&nbsp;&nbsp;&nbsp;&nbsp;";
        }
       	return tempSrc;
    }
	var dept_grid = nui.get("dept_grid");
	var cont_grid = nui.get("cont_grid");
	//点击保存时调用的方法
	var form = new nui.Form("form1");
	function SaveData() {
        var o = form.getData();
        if(!form.validate()){
        	return;
        }
		saveURL = updateURL;
        var json = nui.encode(o);
        nui.ajax({
            url: saveURL,
            data: json,
            type: 'POST',
            cache: false,
            contentType: 'text/json',
            success: function (text) {
                CloseWindow("ok");
            },
            error: function (jqXHR, textStatus, errorThrown) {
                alert(jqXHR.responseText);
                CloseWindow();
            }
        });
    }
	//页面进入时调用的方法
    function SetData(data) {
        promptInit({"workItemID":workitemid,"processDefName":"com.primeton.mis.contract.gatheringConfirm","activityDefID":"manualActivity"});
        var json = nui.encode({csGather:{processinstid:processinstid}});
        nui.ajax({
            url: "com.primeton.mis.contract.gathering.getGathering.biz.ext",
			type: 'POST',
			data: json,	
            async:false,
			contentType: 'text/json',
            success: function (o) {
                form.setData(o);
                form.setChanged(false);
                dept_grid.setData(o.csGather.csGathBills);
                cont_grid.setData(o.csGather.csGathConts);
                nui.get("custid").setText(o.csGather.misCustinfo.custname);
           		nui.get("processinstid").setValue(processinstid);
               	nui.get("processinstname").setValue(processinstname);
               	nui.get("activitydefid").setValue(activitydefid);
               	nui.get("workitemid").setValue(workitemid);
               	nui.get("workitemname").setValue(workitemname);       	
               	nui.get("isshow").setValue("0");            
               	nui.get("auditstatus").setValue("1");
            }
        });
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
        if(!form.validate()){
        	return;
        }else{
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
			height: 400,
			ondestroy: function (action) {
				if (action == "ok") {
					var iframe = this.getIFrameEl();
					var data = iframe.contentWindow.GetData();
					data = nui.clone(data);    //必须
					if (data) {
		                btnEdit.setValue(data.id);
		                btnEdit.setText(data.text);
		                nui.get("billcomp").setValue(data.text);
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
		}else if(gathertype == '4'){
			nui.get("gatherdate").setReadOnly(true);
			nui.get("gatherdate").setRequired(false);
			nui.get("gatherdate").setValue(null);
			
			nui.get("confirmday").setReadOnly(false);
			nui.get("confirmday").setRequired(true);
		}else if(gathertype == '5' || gathertype == '6'){
			nui.alert("收款类型为'银行承兑汇票承兑'和'商业承兑汇票承兑'不可选！")
			nui.get("gathertype").setValue(null);
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
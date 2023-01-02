<%@page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<%@include file="/nui/common.jsp"%>
<%@include file="/common/common.jsp"%>
<%@include file="/common/skins/skin0/component.jsp" %>
<link id="css_skin" rel="stylesheet" type="text/css" href="<%=contextPath%>/coframe/tools/skins/skin1/style.css" />
<html xmlns="http://www.w3.org/1999/xhtml">
<html>
<!-- 
  - Author(s): 许青倩
  - Date: 2019-05-29 17:12:52
  - Description:
-->
<head>
	<title>汇票承兑</title>
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
<body body style="width:100%;height:100%;padding:0px;margin:0px;">
<div class="nui-fit">
	<form id="form1" method="post" >
		<input name="csGather.gatherid" id="gatherid" class="nui-hidden" />
        <input name="csGather.processinstid" id="processinstid" class="nui-hidden" />
		 <fieldset style="border:solid 1px #aaa;padding:3px;">
		 	<legend>已收款确认信息</legend>
		 	<div style="padding:5px;">
		 		<table style="table-layout:fixed;">
		 			<tr>
                    <td align="right" nowrap="nowrap">支付单位：</td>
                    <td align="left" nowrap="nowrap">    
                        <input class="nui-buttonedit" style="width:300px" name="csGather.misCustinfo.custid" 
                        id="custid" value="" text="" onbuttonclick="onButtonEdit" showClose="true" 
                        oncloseclick="onCloseClick" required="true" allowInput="false" readOnly="true"/>
                    </td>
                    <td align="right" nowrap="nowrap">收款方式：</td>
                    <td align="left" nowrap="nowrap">    
                        <input name="csGather.gathertype" id="gathertype" class="nui-dictcombobox" dictTypeId="AME_CSGATHERTYPE" required="true" vtype="float" onvaluechanged="watchgathertype" readOnly="true"/>
                    </td>
                </tr>
                <tr>
                	<td align="right" nowrap="nowrap">汇票承兑日期：</td>
	                <td align="left" nowrap="nowrap">    
	                 	<input class="nui-datepicker" name="csGather.acceptday" id="acceptday" required="true"  onvaluechanged="watchacceptday"/>
	                </td>
                	<td align="right" nowrap="nowrap">实际收款日期：</td>
	                <td align="left" nowrap="nowrap">    
	                 	<input class="nui-datepicker" name="csGather.gatherdate" id="gatherdate" required="true"/>
	                </td>
                </tr>
		 		</table>
		 	</div>
		 </fieldset>
	</form>
</div>
<div style="text-align:center;padding:10px;border-width:1px 0px 0px 0px;" class="nui-toolbar">               
    <a class="nui-button" onclick="onOk()" id="saveBtn" style="width:70px;margin-right:20px;">汇票承兑</a>     
    <a class="nui-button" onclick="onCancel" style="width:60px;">关闭</a>
</div> 
</body>
<script type="text/javascript">
	nui.parse();
	var form = new nui.Form("form1");
	var updateURL = "com.primeton.mis.contract.gathering.acceptGathering.biz.ext";
	var saveURL = "";
	//页面进入时调用的方法
    function SetData(data) {
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
           		watchgathertype();
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
    function onCancel(e) {
        CloseWindow("cancel");
    }
    
    function watchgathertype(){
    	var gathertype = nui.get("gathertype").getValue();
    	if(gathertype == '3'){
			nui.get("gatherdate").setReadOnly(true);
			nui.get("gatherdate").setRequired(false);
		}else if(gathertype == '4'){
			nui.get("gatherdate").setReadOnly(false);
			nui.get("gatherdate").setRequired(true);
		}
    }
    function watchacceptday(){	
    	var acceptday = nui.get("acceptday").getValue();
    	var gathertype = nui.get("gathertype").getValue();
    	if(acceptday != '' && acceptday!=null){
    		if(gathertype == '4'){
    			nui.get("gatherdate").setValue(acceptday);
    		}
    	}
    }
    
 	function onOk() {
        if(!form.validate()){
        	return;
        }else{
	    	SaveData();
	    }
    }
    
    function SaveData() {
        var o = form.getData();
        if(!form.validate()){
        	return;
        }
		var gatherid = nui.get("gatherid").getValue();
		saveURL = updateURL;
        var json = form.getData();
        nui.ajax({
            url: saveURL,
            data: json,
            type: 'POST',
            cache: false,
            contentType: 'text/json',
            success: function (text) {
                CloseWindow("save");
            },
            error: function (jqXHR, textStatus, errorThrown) {
                alert(jqXHR.responseText);
                CloseWindow();
            }
        });
    }
</script>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <title>财务收入维护</title>
    <script src="<%= request.getContextPath() %>/common/nui/nui.js" type="text/javascript"></script>
    <style type="text/css">
    	html, body{font-size:12px;padding:0;margin:0;border:0;height:100%;overflow:hidden;width:100%;}
    </style>
</head>
<body>
<div class="nui-fit">
    <div id="form1" method="post" >
         <input name="csReveForecastFin.fileids" id="fileids" class="nui-hidden"/>
         <input name="csReveForecastFin.reveid" class="nui-hidden"/>
         <input name="csReveForecastFin.status" id="status" class="nui-hidden"/>
        <fieldset style="border:solid 1px #aaa;padding:3px;width: 98%">
            <legend>合同收入基本信息</legend>
            <div style="padding:5px;">
	            <table style="table-layout:fixed;">
	                <tr>
	                    <td align="right" style="width:90px">合同编号：</td>
						<td><input name="csReveForecastFin.contnum" id="contnum"  class="nui-buttonedit"  onbuttonclick="selectCont" allowInput="false"/></td>
						<td align="right" style="width:110px">收入确认次数：</td>
						<td><input name="csReveForecastFin.reveno" id="revenoFin" class="nui-textbox"/></td>
	                </tr>
					<tr>
						<td align="right" >收入类型：</td>
						<td><input name="csReveForecastFin.revetype" id="revetypeFin" class="nui-dictcombobox" multiSelect="true"  dictTypeId="AME_REVETYPE"/></td>
						<td align="right" style="width:110px">新合同收入类型：</td>
						<td><input name="csReveForecastFin.newtype" id="newtypeFin" class="nui-dictcombobox" multiSelect="true"  dictTypeId="AME_NEWTYPE"/></td>
						<td align="right">本次确认工作量：</td>
						<td ><input name="csReveForecastFin.labormonth" id="labormonthFin"  class="nui-spinner" changeOnMousewheel="false" style="width: 150px" format="n2" showbutton="false" minValue="-1000" maxValue="1000"/></td>
					</tr>
					<tr id="setyearmonthFin">
						<td align="right" >结算开始年月：</td>
						<td ><input name="csReveForecastFin.setstart" id="setstartFin" class="nui-monthpicker" format="yyyyMM"  allowInput="false" /></td>
						<td align="right" >结算结束年月：</td>
						<td ><input name="csReveForecastFin.setend" id="setendFin"  class="nui-monthpicker" format="yyyyMM"  allowInput="false" /></td>
						<td align="right">本次实际工作量：</td>
						<td ><input name="csReveForecastFin.labormonthact" id="labormonthactFin"  class="nui-spinner" changeOnMousewheel="false" style="width: 150px" format="n2" showbutton="false" minValue="-1000" maxValue="1000"/></td>
					</tr>
					<tr>
						<td align="right" >确认日期：</td>
						<td ><input name="csReveForecastFin.confirmday" id="confirmdayFin" class="nui-datepicker"/></td>
						<td align="right" >应收开始日期：</td>
						<td ><input name="csReveForecastFin.confirmdayStart" id="confirmdayStartFin" class="nui-datepicker"  /></td>
						<td align="right" >收入确认证据：</td>
						<td /><input name="csReveForecastFin.actreveproof" id="actreveproof" class="nui-dictcombobox" multiSelect="true"  style="width: 150px" dictTypeId="MIS_INCOMECONV" /></td>
					</tr>
					<tr>
						<td align="right" >说明：</td>
						<td colspan="5"><input name="csReveForecastFin.memo" id="memo" class="nui-textarea" style="width: 100%"/></td>
					</tr>
				</table>
					<fieldset id="field3" style="border:solid 1px #aaa;padding:3px;">
						<legend>合同收入金额信息</legend>
							<table style="table-layout:fixed;">
								<tr>
									<td align="right" style="width:100px"></td>
									<td style="width:120px" align="center">实际确认金额</td>
									<td style="width:120px" align="center">税率</td>
									<td style="width:120px" align="center">不含税金额</td>
								</tr>
								<tr> 
									<td align="right" style="width:100px">产品：</td>
									<td style="width:120px"><input name="csReveForecastFin.actproductsum" id="actproductsumFin" onblur="calThreeMoneyFin" style="width:120px" class="nui-spinner" changeOnMousewheel="false" inputStyle="text-align:right;" format="n2" showbutton="false" minValue="-100000000" maxValue="100000000" /></td>
									<td style="width:120px"><input name="csReveForecastFin.productrate" id="productrateFin" style="width:120px" class="nui-spinner" changeOnMousewheel="false" inputStyle="text-align:right;" format="p0" showbutton="false"/></td>
									<td style="width:120px"><input name="csReveForecastFin.actproductsum2" id="actproductsum2Fin" style="width:120px" class="nui-spinner" changeOnMousewheel="false" inputStyle="text-align:right;" format="n2" showbutton="false" minValue="-100000000" maxValue="100000000"/></td>
								</tr>
								<tr>
									<td align="right" style="width:100px">服务：</td>
									<td style="width:120px"><input name="csReveForecastFin.actservicesum" id="actservicesumFin" onblur="calThreeMoneyFin" style="width:120px" class="nui-spinner"  changeOnMousewheel="false" inputStyle="text-align:right;" format="n2" showbutton="false" minValue="-100000000" maxValue="100000000"/></td>
									<td style="width:120px"><input name="csReveForecastFin.servicerate" id="servicerateFin" style="width:120px" class="nui-spinner" changeOnMousewheel="false" showbutton="false" inputStyle="text-align:right;" format="p0"/></td>
									<td style="width:120px"><input name="csReveForecastFin.actservicesum2" id="actservicesum2Fin" style="width:120px" class="nui-spinner" changeOnMousewheel="false" inputStyle="text-align:right;" format="n2" showbutton="false" minValue="-100000000" maxValue="100000000"/></td>
								</tr>
								<tr>
									<td align="right" style="width:100px">MA：</td>
									<td style="width:120px"><input name="csReveForecastFin.actmasum" id="actmasumFin" onblur="calThreeMoneyFin" style="width:120px" class="nui-spinner" changeOnMousewheel="false" inputStyle="text-align:right;" format="n2" showbutton="false" minValue="-100000000" maxValue="100000000"/></td>
									<td style="width:120px"><input name="csReveForecastFin.marate" id="marateFin" style="width:120px" class="nui-spinner" changeOnMousewheel="false" inputStyle="text-align:right;" format="p0" showbutton="false"/></td>
									<td style="width:120px"><input name="csReveForecastFin.actmasum2" id="actmasum2Fin" style="width:120px" class="nui-spinner" changeOnMousewheel="false" inputStyle="text-align:right;" format="n2" showbutton="false" minValue="-100000000" maxValue="100000000"/></td>
								</tr>
								<tr>
									<td align="right" style="width:100px">总金额：</td>
									<td style="width:120px"><input name="csReveForecastFin.actsum" id="actsumFin" class="nui-spinner" changeOnMousewheel="false" style="width:120px" inputStyle="text-align:right;" format="n2" showbutton="false" minValue="-100000000" maxValue="100000000"/></td>
									<td style="width:120px"></td>
									<td style="width:120px"><input name="csReveForecastFin.actsum2" id="actsum2Fin" style="width:120px" class="nui-spinner" changeOnMousewheel="false" onblur="countprofit" inputStyle="text-align:right;" format="n2" showbutton="false" minValue="-100000000" maxValue="100000000"/></td>
								</tr>
							</table>
        </div>
        </fieldset>
         <fieldset id="field6" style="border:solid 1px #aaa;padding:3px;width: 98%;">
        	<legend>合同收入附件</legend>
        	<jsp:include page="/ame_common/inputFile.jsp"/>
        </fieldset>
        
    </div>
</div>

<div style="text-align:center;padding:10px;border-width:1px 0px 0px 0px;" class="nui-toolbar">               
    <a class="nui-button" id="okbutton" onclick="onOk" style="width:60px;margin-right:20px;">保存</a>       
    <a class="nui-button" onclick="onCancel" style="width:60px;">关闭</a>
</div>        
</body>
<script type="text/javascript">
    nui.parse();
    var form = new nui.Form("#form1");
    var reveno;
	//点击保存时调用的方法
	function SaveData() {
        var o = form.getData();
        if(o.csReveForecastFin.setstart){
        	var startyear = o.csReveForecastFin.setstart.getFullYear();
			var startmonth = o.csReveForecastFin.setstart.getMonth()+1;
			if(parseInt(startmonth)<=9){
				startmonth="0"+startmonth;
			}
			o.csReveForecastFin.setstart = startyear.toString()+startmonth.toString();
        }
        
        if(o.csReveForecastFin.setend){
        	var enddate = o.csReveForecastFin.setend;
			var endyear = enddate.getFullYear();
			var endmonth = enddate.getMonth()+1;
			if(parseInt(endmonth)<=9){
				endmonth="0"+endmonth;
			}
			o.csReveForecastFin.setend=endyear.toString()+endmonth.toString();
        }
        o.csReveForecastFin.reveno = reveno;
        nui.ajax({
            url: "com.primeton.eos.ame_income.csReveForcastFin.addreveFin.biz.ext",
			type: 'POST',
			data: o,	
			contentType: 'text/json',
            success: function (o) {
            	if(o.result=="-1"){
            		nui.alert("保存失败！");
            		nui.get("okbutton").setEnabled(true);
            	}else{
            		nui.alert("保存成功","提示",function(){
	            		CloseWindow("ok");
            		});
            	}
            }
    	});
    }
	
	
	//页面进入时调用的方法
    function SetData(data) {
		if(data.action=="add"){
			nui.get("productrateFin").setValue(nui.getDictText("AME_SYSCONF","PRODUCTRATE"));
			nui.get("servicerateFin").setValue(nui.getDictText("AME_SYSCONF","SERVICERATE"));
			nui.get("marateFin").setValue(nui.getDictText("AME_SYSCONF","MARATE"));
			nui.get("status").setValue("3");//新增默认状态为已确认
		}else{
			form.setData(data);
			nui.get("contnum").setValue(data.csReveForecastFin.contnum);
			nui.get("contnum").setText(data.csReveForecastFin.contnum);
			reveno = data.csReveForecastFin.reveno;
			nui.get("revenoFin").setValue(data.csReveForecastFin.reveno);
			nui.get("setendFin").setValue(new Date(data.csReveForecastFin.setend.substring(0,4)+"-"+data.csReveForecastFin.setend.substring(4,6)+"-01"));
			nui.get("setstartFin").setValue(new Date(data.csReveForecastFin.setstart.substring(0,4)+"-"+data.csReveForecastFin.setstart.substring(4,6)+"-01"));
			//加载报销附件设置参数
    		nui.get("grid_0").load({"groupid":"csReveForecastFin","relationid":data.csReveForecastFin.reveid});
		}
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
    		nui.alert("信息录入不完整！");
        	return;
		}	
		var filePaths = document.getElementsByName("uploadfile1").length;
    	for(var j=0;j<filePaths;j++){
    		var a=document.getElementsByName("remarkList1")[j].value;
    		if(a==null||a==""){
    			nui.alert("新增附件不可以为空");
    			return false;
    		}
    	}
			
    	nui.get("okbutton").disable();
		document.getElementById("fileCatalog").value="csReveForecast";
		form2.submit();
    } 
    
        
    function onCancel(e) {
        CloseWindow("cancel");
    }
    
      //选择销售合同弹窗(只能选择本事业部是合同)
        function selectCont(){
        	nui.open({
                url:"<%=request.getContextPath() %>/ame_income/csReveForecast/SelectCsContract.jsp",
                title: "选择销售合同",
                width: 800,
                height: 400,
                allowResize: false,
                onload:function (){
                	var iframe = this.getIFrameEl();
                    iframe.contentWindow.search();
                },
                ondestroy: function (action) {
                    if (action == "ok") {
                        var iframe = this.getIFrameEl();
                        var data = iframe.contentWindow.GetData();
                        data = nui.clone(data);    //必须
                        if (data) {
                        	//合同基本信息
                            nui.get("contnum").setValue(data.contnum);
                            nui.get("contnum").setText(data.contnum);
                            var json1 = {"contnum":data.contnum}
                            nui.ajax({
					            url: "com.primeton.eos.ame_income.csReveForcastFin.getReveno.biz.ext",
								type: 'POST',
								data: json1,	
								contentType: 'text/json',
					            success: function (o) {
					            	reveno = o.reveno;
					            	nui.get("revenoFin").setValue(o.reveno);
					            }
					    	});
                        }
                    }
                }
            });
        } 
	function calThreeMoneyFin(){
    	//实际确认金额含税
		var actproductsum = nui.get("actproductsumFin").getValue();
		if(!actproductsum){
			actproductsum=0;
		}
		var actservicesum = nui.get("actservicesumFin").getValue();
		if(!actservicesum){
			actservicesum=0;
		}
		var actmasum = nui.get("actmasumFin").getValue();
		if(!actmasum){
			actmasum=0;
		}
		var sum  = parseFloat(parseFloat(actproductsum)+parseFloat(actservicesum)+parseFloat(actmasum)).toFixed(2);
		nui.get("actsumFin").setValue(sum);
		//不含税
		var productrate = nui.get("productrateFin").getValue();
		var servicerate = nui.get("servicerateFin").getValue();
		var marate = nui.get("marateFin").getValue();
		var actproductsum2 = parseFloat(actproductsum/(1+productrate)).toFixed(2);
    	var actservicesum2 = parseFloat(actservicesum/(1+servicerate)).toFixed(2);
    	var actmasum2 = parseFloat(actmasum/(1+marate)).toFixed(2);
    	nui.get("actproductsum2Fin").setValue(actproductsum2);
    	nui.get("actservicesum2Fin").setValue(actservicesum2);
    	nui.get("actmasum2Fin").setValue(actmasum2);
    	var bhssum  = parseFloat(parseFloat(actproductsum2)+parseFloat(actservicesum2)+parseFloat(actmasum2)).toFixed(2);
    	nui.get("actsum2Fin").setValue(bhssum);
    	
  	}
</script>
</html>
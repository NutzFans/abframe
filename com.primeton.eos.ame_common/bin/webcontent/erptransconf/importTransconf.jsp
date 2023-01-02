<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@page import="com.eos.data.datacontext.UserObject"%>
<%@include file="/common/common.jsp"%>
<%@include file="/common/skins/skin0/component.jsp" %>
<html>
<!-- 
  - Author(s): xuqq
  - Date: 2016-12-20 16:00:25
  - Description:
-->
<head>
	<title>增加工时转换系数</title>
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
<div id="form2">
	<form id="form1" method="post" >
		<input name="AmeErpTransconf.erptransconfid" id="erptransconfid" class="nui-hidden" />
		<input name="AmeErpTransconf.updater" id="updater" class="nui-hidden" />
        <fieldset style="border:solid 1px #aaa;padding:3px;">
			<legend>工时转换系数基本信息</legend>
        	<div style="padding:5px;">   		
            	<table>
					<tr>
						<td style="width:100px;" align="right">财务年月：</td> 
						<td style="width:160px;"> 
					       <input name="AmeErpStaticCost.finyearmonth" id="finyearmonth" onvaluechanged="changeym" class="nui-monthpicker" format="yyyy-MM" required="true" style="width:100%">
					    </td> 
					    <td style="width:100px;" align="right">有效开始日期：</td>
						<td style="width:160px;">
							<input name="AmeErpTransconf.startdate" class="nui-datepicker" id="startdate" required="true" style="width:100%" required="true"/>
						</td>
					    <td style="width:100px;" align="right">有效截止日期：</td>
						<td style="width:160px;">
							<input name="AmeErpTransconf.enddate" class="nui-datepicker" id="enddate"  required="true" style="width:100%" required="true"/>
						</td>
					</tr>
				</table>
			</div>
			 
		</fieldset>
    </form>
    <fieldset style="border:solid 1px #aaa;padding:3px;">
	    <legend>公司静态成本</legend>
	    <form id="form3" action="com.primeton.eos.ame_common.importTransconf.flow" target="hidden_frame" method="post" enctype="multipart/form-data">
	    		<div style="padding:5px;"> 
	    			<input type="hidden" name="_eosFlowAction" value="action0">
	    			<input type="hidden"  id="year" name="year" />
					<input type="hidden"  id="month" name="month" />
					<input type="hidden"  id="org" name="org" value="0" />
	    			<table>
	    				<tr>
							<td>导入公司静态成本：</td>
							<td align="center" style="width:160px;" colspan="2">
								<input type="file" id="uploadfile" name="uploadfile" size="35"/>
							</td>
							<td colspan="2">
								<a class="nui-button" id="a" onclick="importErpStaticCost('S')"style="width:50px;margin-right:20px;">导入</a>
							<td>
							<td colspan="3"><a href="/default/Staticcost.xls">点击下载
								公司静态成本  Excel 模板文件</a></td>
						</tr>
	    			</table>
	    		</div>
	    </form>
	    <iframe name='hidden_frame' id="hidden_frame" style='display:none'></iframe>
	    <div id="datagrid1" class="nui-datagrid" style="width:100%;height:auto;" dataField="erptraticcosts"
	        url="com.primeton.eos.ame_common.erptransconf.queryErpStaticCost.biz.ext"   allowResize="true"   showpager="false"
	        allowCellEdit="true" allowCellSelect="true" multiSelect="true" editNextOnEnterKey="true" showSummaryRow="true" 
	        ondrawsummarycell="doSum">
	        <div property="columns">    
	            <div field="subject" width="100" headerAlign="center" align="center" allowSort="false" renderer="showsubject">科目名称</div>  
	            <div field="year"  width="60" headerAlign="center" align="center" allowSort="true">财务年</div>
	            <div field="month"  width="60" headerAlign="center" align="center" allowSort="true">财务月</div>                
	            <div field="staticcost" summaryType="sum" width="90" headerAlign="center" align="right" allowSort="true" dataType="float" decimalPlaces="2" renderer="format">静态服务成本</div>
	        </div>
	    </div>
	</fieldset>
	<fieldset style="border:solid 1px #aaa;padding:3px;">
	    <legend>财务核算工时</legend>
	    <form id="form4" action="com.primeton.eos.ame_common.importTransconf.flow" target="hidden_frame" method="post" enctype="multipart/form-data">
	    		<div style="padding:5px;"> 
	    			<input type="hidden" name="_eosFlowAction" value="action0">
	    			<input type="hidden"  id="year1" name="year" />
					<input type="hidden"  id="month1" name="month" />
	    			<table>
	    				<tr>
							<td>导入财务核算工时：</td>
							<td align="center" style="width:160px;" colspan="2">
								<input type="file" id="uploadfile1" name="uploadfile1" size="35"/>
							</td>
							<td colspan="2">
								<a class="nui-button" id="b" onclick="importErpStaticCost('T')"style="width:50px;margin-right:20px;">导入</a>
							<td>
							<td colspan="3"><a href="/default/psOutTemplate.xls">点击下载
								财务核算工时  Excel 模板文件</a></td>
						</tr>
	    			</table>
	    		</div>
	    </form>
	    <iframe name='hidden_frame' id="hidden_frame" style='display:none'></iframe>
	    <div id="datagrid2" class="nui-datagrid" style="width:100%;height:auto;" dataField="erptimecost"
	        url="com.primeton.eos.ame_common.erptransconf.queryErpTimecost.biz.ext"   allowResize="true"   showpager="false"
	        allowCellEdit="true" allowCellSelect="true" multiSelect="true" editNextOnEnterKey="true" showSummaryRow="true" 
	        ondrawsummarycell="doSum">
	        <div property="columns"> 
	            <div field="type" width="100" headerAlign="center" align="center" allowSort="false"  >成本类型</div>  
	            <div field="year"  width="60" headerAlign="center" align="center" allowSort="true">财务年</div>
	            <div field="month"  width="60" headerAlign="center" align="center" allowSort="true">财务月</div>                
	            <div field="costs" summaryType="sum" width="90" headerAlign="center" align="right" allowSort="true" dataType="float" decimalPlaces="2" renderer="getDetail">成本金额</div>
	        </div>
	    </div>
	</fieldset>
	<form id="form2" method="post" >
		<fieldset style="border:solid 1px #aaa;padding:3px;">
			<legend>财务口径工时转换系数生成</legend>
			<div style="padding:5px;">  		
	            	<table>
						<tr>
							<td style="width:100px;" align="right">静态服务成本:</td> 
							<td style="width:160px;"> 
						       <input name="AmeErpTransconf.servicestaticcost" class="nui-spinner" id="servicestaticcost" showbutton="false" style="width:100%" inputStyle="text-align: right;"  allowLimitValue="false" changeOnMousewheel="false"  required="true" format="n2" onblur="changetransconf"/>
						    </td> 
						    <td style="width:100px;" align="right">工时定额成本：</td>
							<td style="width:160px;">
								<input name="AmeErpTransconf.laborcost" class="nui-spinner" id="laborcost" showbutton="false" style="width:100%" inputStyle="text-align: right;" allowLimitValue="false" changeOnMousewheel="false" required="true" format="n2" onblur="changetransconf"/>
							</td>
						    <td style="width:100px;" align="right">转换系数：</td>
							<td style="width:160px;">
								<input name="AmeErpTransconf.transconf" class="nui-spinner" id="transconf"  showbutton="false" style="width:100%" inputStyle="text-align: right;" allowLimitValue="false" changeOnMousewheel="false" required="true" onblur="changetransconf" format="n6"/>
							</td>
						</tr>
					</table>
				</div> 
		</fieldset>
	</form>
</div>
</div>
<div style="text-align:center;padding:10px;" class="nui-toolbar">
	<a class="nui-button"onclick="onOk"style="width:60px;margin-right:20px;">确定</a>
	<a class="nui-button"onclick="onCancel" style="width:60px;">关闭</a>
</div>
 
	<script type="text/javascript">
    	var saveURL = "com.primeton.eos.ame_common.erptransconf.addErpTransconf.biz.ext";
        nui.parse();
        <%
	   		UserObject user = (UserObject) session.getAttribute("userObject");
	   		String username = user.getUserName();
	   		String userno = user.getUserId();
	    %>
	    var flag = true ;
	    //获取当前登录用户,定义为设置人;  
		nui.get("updater").setValue('<%=username %>');
		nui.get("updater").disable();
		
        var form = new nui.Form("form2");  
        var datagrid1 = nui.get("datagrid1");  
        var datagrid2 = nui.get("datagrid2");  
        var initSetData = 0;
        
        //科目名称业务字典
        function showsubject(e){
        	return nui.getDictText('AME_SUBJECT',e.value);
        }
        
      	//新增工时转换系数信息 
        function SaveData() {
            var o = form.getData();
            var getNum = nui.get("transconf").getValue();
			var re = /^[0-9]+.?[0-9]{0,6}$/;
			if(re.test(getNum) == true){
				if(getNum <= 0.0){
					alert("系数不合法,请重新输入! ");
					return;
				}
				else if(getNum >= 10.0 && getNum <= 100.0)
					alert("输入数字过大,请确定您的输入是否正确! ");
				else if(getNum > 100.0){
					alert("输入数字不合法,请重新输入!");
					return;
				}
			}else{ 
				alert("系数输入有误!请输入整数或三位以内小数!");
				return;	
			}
			//输入的成本数据  格式限制
			var reN = /^[1-9]*[0-9]+.?[0-9]{0,3}$/
			var getN = ["laborcost","servicestaticcost"]
			var get = 0.0;
			for(var i = 0 ; i < getN.length ; i++){
				get = nui.get(getN[i]).getValue();
				if(reN.test(get) == true){
					if(get < 0.0 ){
						alert("输入数据有负数,请校验!");
						return;
					}
				}else{
					alert("请输入正确的数字!小数请保持在3位以内!","数据输入有误!");
					return;
				}
			}
            if(form.validate()){
	            var yearmonth = nui.get("finyearmonth").getValue();
        		var year = yearmonth.getFullYear();
		  		var month = yearmonth.getMonth();
		  		if(++month < 10){
		  			month = "0" + month;
		  		}else{
	    			month = "" + month;
	    		}
	    		o.AmeErpTransconf.year=year;
	    		o.AmeErpTransconf.month=month;
	    		o.AmeErpTransconf.org='0';
	    		
	    		var json = nui.encode(o);
	            nui.ajax({
	                url: saveURL,
	                data: json,
	                type: 'POST',
	                cache: false,
	                contentType: 'text/json',
	                success: function (text) {
	                	// alert(nui.encode(text));
	                    if(text.addcount==1){
	                    	nui.alert("日期区间有重复，请重新选择!","提示 ");
	                    	return false;
	                    }else{
	                    	nui.alert("工时转换系数保存成功! ",null,function (){
	                    		CloseWindow("ok");
	                    	});
	                    }
	                },
	                // 不懂jqXHR?? 
	                error: function (jqXHR, textStatus, errorThrown) {
	                    alert(jqXHR.responseText);
	                    CloseWindow();
	                }
	            });
	        }else{
	        	return;
	        }
        }
        
        
        function checkinput(){
        	var getLabor = nui.get("laborcost").getValue();
        	var getLaborN = nui.get("laborncost").getValue();
        	var get1 = parseFloat(getLabor);
        	var get2 = parseFloat(getLaborN);
        	if(get1 < get2){
        		alert("不含加班工时总成本不可大于工时总成本!");
        		nui.get("laborncost").setValue('');
        		return false;
        	}
        	return true;
        }
      
        //检测系数是否合法 
        function checkNum(i){
        	if(i == 3){
        		var getNum = nui.get("transconf").getValue();
				var re = /^[0-9]+.?[0-9]{0,3}$/;
				if(re.test(getNum) == true){
				if(getNum <= 0.0)
					alert("系数不合法,请重新输入! ");
				else if(getNum >= 10.0 && getNum <= 100.0)
					alert("输入数字过大,请确定您的输入是否正确! ");
				else if(getNum > 100.0){
					alert("输入数字不合法,请重新输入!");
					nui.get("transconf").setValue('');
					}
				}else{
					if(getNum == ''|| getNum == null)
						//alert("未填写系数 ! ");
						nui.get("transconf").setValue("请输入整数或三位以内小数...");
					else {
						alert("系数输入有误!请输入整数或三位以内小数!");
						return;
					}
				}
        	}
        	var getN = ["laborcost","laborncost","sybjtcb"];
        	var reN = /^[1-9]*[0-9]+.?[0-9]{0,3}$/;
        	var get = 0.0;
        	if(i != 3){
				get = nui.get(getN[i]).getValue();
				if(reN.test(get) == true){
					if(get < 0.0 ){
						alert(getN[i]+"输入数据不可为负数,请校验!");
						nui.get(getN[i]).setValue('');
					}
				}else{
					if(get == null || get == ''){
						return;
					}else{
						alert("请输入正确的数字!小数请保持在3位以内!");
						nui.get(getN[i]).setValue('');
						return;
					}
				}
        	}
			return;
		}
		
		function clear(){
			var getString = nui.get("transconf").getValue();
			if(getString == "请输入整数或三位以内小数..."){
				nui.get("transconf").setValue('');
			}
			return;
		}
		
        function onOk(e) {
        	var a=nui.get("startdate").getValue();
        	var b=nui.get("enddate").getValue();
        	if(b<a){
        		alert("截止日期必须大于开始日期");
        		return false;
        	}
        	var getStr = nui.get("transconf").getValue();
			if(getStr == "请输入整数或三位以内小数..."){
				alert("请输入系数! ")
				nui.get("transconf").setValue('');
				return;
			}
			var getLabor = nui.get("laborcost").getValue();
			if(getLabor == "" || getLabor == null){
				alert("请填写工时定额成本!");
				return;
			}
			var getLaborN = nui.get("servicestaticcost").getValue();
			if(getLaborN == "" || getLaborN == null){
				alert("请填写静态服务成本!");
				return;
			}
			SaveData();
        }
        function onCancel(e) {
            CloseWindow();
        }
          //标准方法接口定义
        function CloseWindow(action) {            
            if (action == "close" && form.isChanged()) {
                if (confirm("数据被修改了，是否先保存？")) {
                    return false;
                }
            }
            if (window.CloseOwnerWindow) return window.CloseOwnerWindow(action);
            else window.close();
        }
        
        //系数自动计算
        function changetransconf(){
        	//部门静态成本
        	var sybjtcb = nui.get("servicestaticcost").getValue();
        	//工时总成本
        	var laborcost = nui.get("laborcost").getValue();
        	if(isNaN(sybjtcb)){
        		nui.alert("静态服务成本请输入数字！");
        		nui.get("servicestaticcost").setValue(0);
        		return;
        	}
        	if(isNaN(laborcost)){
        		nui.alert("工时定额成本请输入数字！");
        		nui.get("laborcost").setValue(0);
        		return;
        	}
        	
        	if(sybjtcb == null || sybjtcb == ""){
        		sybjtcb = 0;
        		nui.get("servicestaticcost").setValue(0);
        	}
        	if(laborcost == null || laborcost == ""){
        		laborcost = 0;
        		nui.get("laborcost").setValue(0);
        	}
        	
        	var tax;
        	if(laborcost == 0){
        		return;
        	}else{
        		tax = sybjtcb/laborcost;
        	}
        	nui.get("transconf").setValue(tax.toFixed(6));
        }
        
        //选定财务年月确定有效开始日期和有效结束日期。有效开始日期：财务年月月初，有效结束日期：财务年月月末
        function changeym(){
        	var yearmonth = nui.get("finyearmonth").getValue();
        	if(yearmonth){
        		var year = yearmonth.getFullYear();
		  		var month = yearmonth.getMonth()+1;
		  		
		  		var json = nui.decode({"criteria": 
						               {"_entity":"com.primeton.eos.common.newdataset.MisFinperiod",
						               "_expr[0]": {"_property": "finyear","_op": "=","_value": year},
						               "_expr[1]": {"_property": "finmonth","_op": "=","_value": month}}});
	    		
	            nui.ajax({
	                url: "com.primeton.rdmgr.labor.misfinperiodbiz.queryMisFinperiods.biz.ext",
	                data: json,
	                type: 'POST',
	                cache: false,
	                contentType: 'text/json',
	                success: function (text) {	
	                	//开始日期
		  				nui.get("startdate").setValue(text.misfinperiods[0].startdate);
		  				//结束日期
		  				nui.get("enddate").setValue(text.misfinperiods[0].enddate);
	                },
	                // 不懂jqXHR?? 
	                error: function (jqXHR, textStatus, errorThrown) {
	                    alert(jqXHR.responseText);
	                    CloseWindow();
	                }
	            });
		  		var json2 = nui.decode({"year": year,"month":month});
		  		document.getElementById("month1").value=month;
		  		if(month < 10){
		  			month = "0" + month;
		  		}else{
	    			month = "" + month;
	    		}
		  		document.getElementById("year").value=year; 
				document.getElementById("month").value=month;
				
				document.getElementById("year1").value=year; 
				
				var json1 = nui.decode({"year": year,"month":month});
				
				datagrid1.sortBy("subject","asc");
				datagrid1.load(json1,function(){
					datagrid2.sortBy("pk_corp","asc");
					datagrid2.load(json2,function(){
						initSetData = 0;
					});
				});
        	}
        }
        
        function test(data){
        	document.getElementById("a").disabled=false;
            if(data==""){
            	changeym();
            	nui.alert("导入数据成功！");
            }else if (data=="null"){
            	nui.alert("导入失败！请参照模板规范excel文件。");
            }else {
            	changeym();
            	alert(data);
            }
            document.getElementById("a").disabled=false;
            document.getElementById("b").disabled=false;
        }
        
        //excel导入公司静态成本
        function importErpStaticCost(e){
        	//获取文件路径
        	if(e=='S'){
        		var uploadfile=document.getElementById("uploadfile").value;
        	}else if (e=='T'){
        		var uploadfile=document.getElementById("uploadfile1").value;
        	}
        	
        	if(uploadfile==null||uploadfile==""){
				nui.alert("请选择一个文件!");
				return; 
			}
			//获取财务年月
			var yearmonth = nui.get("finyearmonth").getValue();
			if(yearmonth==null||yearmonth==""){
				nui.alert("请选择财务年月!");
				return; 
			}
			var year = yearmonth.getFullYear();
	  		var month = yearmonth.getMonth()+1;
	  		if(month < 10){
	  			month = "0" + month;
	  		}else{
    			month = "" + month;
    		}
    		if(e=='S'){
    			nui.confirm("导入操作会覆盖"+year+"年"+month+"月已存在的公司静态成本数据,确定导入?", "提示",
	            function (action) {            
	                if (action == "ok") {
	                	form3.submit();
						document.getElementById("a").disabled=true;
					}else{
						return;
					}
				});
    		}else if(e=='T'){
    			nui.confirm("导入操作会覆盖"+year+"年"+month+"月已存在的财务核算工时数据,确定导入?", "提示",
	            function (action) {            
	                if (action == "ok") {
	                	form4.submit();
						document.getElementById("b").disabled=true;
					}else{
						return;
					}
				});
    		}
    		
        }
        
        //数据汇总
        function doSum(e){
        	if (e.field == "staticcost") {
        		if(initSetData == 0){
        			nui.get("servicestaticcost").setValue(e.cellHtml);
        		}
                e.cellHtml = "<div align='right'><b>" + e.cellHtml + "</b></div>";
            }
            if (e.field == "costs") {
            	if(initSetData == 0){
            		nui.get("laborcost").setValue(e.cellHtml);
            	}
                e.cellHtml = "<div align='right'><b>" + e.cellHtml + "</b></div>";
            }
            changetransconf();
        }
        
        //点击姓名查看详情
        function getDetail(e){
	        return "<a href='javascript:void(0)' onclick='checkDetail();' title='点击查看'>" + e.value + "</a>";
        }
        function checkDetail(){	
        	var selectRow = datagrid2.getSelected();
        	window.open("<%= request.getContextPath() %>/ame_common/erptransconf/erppsoutdetail.jsp?type=" + selectRow.type+"&year="+selectRow.year+"&month="+selectRow.month, "财务核算工时明细", "height=500, width=1200, top=0,left=0, toolbar=no, menubar=no, scrollbars=yes, resizable=yes,location=no, status=no");
        	<%--var executeUrl = "<%=request.getContextPath() %>/ame_common/erptransconf/erppsoutdetail.jsp?type=" + selectRow.type+"&year="+selectRow.year+"&month="+selectRow.month;--%>
			//window.open(executeUrl, "财务核算工时明细", "fullscreen=1");
        }
        
        function SetData(data){
		 	data = nui.clone(data);
		 	if(data.action == "edit"){
		 		var json = {AmeErptransconf: {erptransconfid: data.erptransconfid}};
		 		nui.ajax({
	        		// com.primeton.eos.ame_common.erptransconf.queryErpTransconf
	        		url:"com.primeton.eos.ame_common.erptransconf.getErpTransconf.biz.ext",
	                data: json,
	                type: 'POST',
	                cache: false,
	                contentType: 'text/json',
	                success: function (o) {	
	                    form.setData(o);
	                    nui.get("finyearmonth").setValue(o.AmeErptransconf.year+'-'+o.AmeErptransconf.month);
	                    
	                    nui.get("startdate").setValue(o.AmeErptransconf.startdate);
	                    nui.get("enddate").setValue(o.AmeErptransconf.enddate);
	                    nui.get("servicestaticcost").setValue(o.AmeErptransconf.servicestaticcost);
	                    nui.get("laborcost").setValue(o.AmeErptransconf.laborcost);
	                    nui.get("transconf").setValue(o.AmeErptransconf.transconf);
	                    nui.get("erptransconfid").setValue(o.AmeErptransconf.erptransconfid);
	                    initSetData = 1;
	                    changeym();
	                    //获取当前登录用户,定义为设置人;  
						nui.get("updater").setValue('<%=username %>');
						nui.get("updater").disable();
	                    form.isChanged(false);
	                },
	                error: function (jqXHR, textStatus, errorThrown) {
	                    alert(jqXHR.responseText);
	                    CloseWindow();
	                }
	        	});
        	}
		 }
    </script>
</body>
</html>
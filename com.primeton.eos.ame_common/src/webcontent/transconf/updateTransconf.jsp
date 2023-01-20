<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@page import="com.eos.data.datacontext.UserObject"%>
<html>
<!-- 
  - Author(s): lixq
  - Date: 2016-08-10 15:25:11
  - Description:
-->
<head>
	<title>编辑工时转换系数</title>
 	<meta http-equiv="content-type" content="text/html; charset=UTF-8" />
    <script src="<%= request.getContextPath() %>/common/nui/nui.js" type="text/javascript"></script>
    
</head>
<body>
	<form id="form1" method="post" >
		<input name="AmeTransconf.transconfid" id="transconfid" class="nui-hidden" />
		<input name="AmeTransconf.updater" id="updater" class="nui-hidden" />
        <fieldset style="border:solid 1px #aaa;padding:3px;">
			<legend>工时转换系数基本信息</legend>
        	<div style="padding:5px;">   		
            	<table>
                   <tr>
						<td>财务年月：</td> 
	                    <td style="width:160px;">
	                       <input name="AmeTransconf.finyearmonth" id="finyearmonth" class="nui-monthpicker" style="width:100%" required="true" onvaluechanged="watchfinYM">
	                    </td>
					</tr>
					 <tr>
                    	<td>有效开始日期：</td>
						<td style="width:160px;">
							<input name="AmeTransconf.startdate" class="nui-datepicker" id="startdate" <%--onblur="checkdatein(0)"--%> style="width:100%" required="true" readonly="readonly"/>
						</td>
	                    <td>有效截止日期：</td>
						<td style="width:160px;">
							<input name="AmeTransconf.enddate"class="nui-datepicker" id="enddate" <%--onblur="checkdatein(1)"--%> style="width:100%" required="true" readonly="readonly"/>
						</td>
					</tr>
					<tr>
	                    <td>受益部门：</td>
	                    <td style="width:160px;">    
	                       <input name="AmeTransconf.org" url="com.bos.mp.common.SelectManage.queryAllOrg.biz.ext" textField="orgname" valueField="orgid" dataField="orgs" id="org" class="nui-combobox"  required="true"  style="width:100%;" allowInput="true"/>
	                    </td>
	                    <td>填报部门：</td>
	                    <td style="width:160px;">    
	                       <input name="AmeTransconf.orgid" url="com.bos.mp.common.SelectManage.queryAllOrg.biz.ext" textField="orgname" valueField="orgid" dataField="orgs" id="orgid" class="nui-combobox"  required="true"  style="width:100%;" allowInput="true"/>
	                    </td>
					</tr>
					<tr>
	                    <td>部门静态成本:</td>
						<td style="width:160px;">
							<input name="AmeTransconf.sybjtcb" class="nui-textbox" id="sybjtcb" onblur="changetransconf" style="width:100%" required="true"/>
						</td>
						<td>工时总成本:</td>
						<td style="width:160px;">
							<input name="AmeTransconf.laborcost" class="nui-textbox" id="laborcost" onblur="changetransconf" style="width:100%" required="true"/>
						</td>
					</tr>
					<tr>
						<td>不含加班工时总成本:</td>
						<td style="width:160px;">
							<input name="AmeTransconf.laborncost" class="nui-textbox" id="laborncost" onblur="checkNum(1)" style="width:100%" required="true"/>
						</td>
	                    <td>系数：</td>
	                    <td style="width:160px;">    
	                       <input name="AmeTransconf.transconf" id="transconf" class="nui-textbox" style="width:100%" required="true" onblur="checkNum(3)" onclick="clear()"  value="部门静态成本/工时总成本">
	                    </td>
					</tr>
					
				</table>
			</div>
		</fieldset>
		<div style="text-align:center;padding:10px;">
			<a class="nui-button"onclick="onOk"style="width:60px;margin-right:20px;">确定</a>
			<a class="nui-button"onclick="onCancel"style="width:60px;">关闭</a>
		</div>
    </form>
	<script type="text/javascript">
        nui.parse();
        <%
	   		UserObject user = (UserObject) session.getAttribute("userObject");
	   		String username = user.getUserName();
	   		String userno = user.getUserId();
	    %>
	    //获取当前登录用户,定义为设置人;  
		nui.get("updater").setValue('<%=username %>');
		nui.get("updater").disable();
		
        var form = new nui.Form("form1");        
      	//保存工时转换系数信息 
        function SaveData() {
            var o = form.getData();
            var getNum = nui.get("transconf").getValue();
			var re = /^[0-9]+.?[0-9]{0,6}$/;
			if(re.test(getNum) == true){
				if(getNum <= 0.0)
					alert("系数不合法,请重新输入! ");
				else if(getNum >= 10.0 && getNum <= 100.0)
					alert("输入数字过大,请确定您的输入是否正确! ");
				else if(getNum > 100.0){
					alert("输入数字不合法,请重新输入!");
					return;
				}
			}else{
				if(getNum == ''|| getNum == null)
					nui.get("transconf").setValue('');
				else{ 
					alert("系数输入有误!请输入整数或六位以内小数!");
					return;
				}
			}
			//输入的成本数据  格式限制
			var reN = /^[1-9]*[0-9]+.?[0-9]{0,3}$/;
			var getN = ["laborcost","laborncost","sybjtcb"];
			var get = 0.0;
			for(var i = 0 ; i < getN.length ; i++){
				get = nui.get(getN[i]).getValue();
				if(reN.test(get) == true){
					if(get < 0.0 ){
						alert("输入数据有负数,请校验!");
						return;
					}
				}else{
					nui.alert("请输入正确的数字!小数请保持在3位以内!","数据输入有误!");
					return;
				}
			}
			var year = o.AmeTransconf.finyearmonth.getFullYear();
	  		var month = o.AmeTransconf.finyearmonth.getMonth()+1;
	  		if(month<10){
	  			month = '0'+month;
	  		}
			o.AmeTransconf.finyearmonth = year +'-'+month;
            if(form.validate()){
	            var json = nui.encode(o);
	            nui.ajax({
	                url: "com.primeton.eos.ame_common.ameTransconf.updateTransconf.biz.ext",
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
	                    		CloseWindow("save");
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
        //编辑工时转换系数基本信息 
        function SetData(data){
        	data = nui.clone(data);
        	// nui.get("updater").disable();
        	if(data.action == "edit"){
        		var json = {AmeTransconf: {transconfid: data.transconfid}};
	        	nui.ajax({
	        		url:"com.primeton.eos.ame_common.ameTransconf.getTransconf.biz.ext",
	                data: json,
	                type: 'POST',
	                cache: false,
	                contentType: 'text/json',
	                success: function (o) {	
	                    form.setData(o);
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
        //检验开始/截止时间是否已存在当前已有时间段内
        function checkdatein(){
        	var orgiddata = nui.get("orgid").getValue();
        	var orgdata = nui.get("org").getValue();
	        var startdate = nui.get("startdate").getValue();
            var enddate = nui.get("enddate").getValue();
            var json = {checkstartdate:startdate,checkenddate:enddate,checkorg:orgdata,checkorgid:orgiddata};
            
            nui.ajax({
                url: "com.primeton.eos.ame_common.ameTransconf.checkDateIn.biz.ext",
                data: json,
                type: 'POST',
                cache: false,
                contentType: 'text/json',
                success: function (text) {
                	text = nui.clone(text);
                	//alert(nui.encode(text.datecount));
                	var id = nui.get("transconfid").getValue();
              		//alert(text.AmeTransconf.transconfid);  	
                   	if(text.datecount > 0 && text.AmeTransconf.transconfid != id){
                   	
                   		if(text.a == 0){
	                   		alert(text.AmeTransconf.orgname+"的该开始时间已被:" + text.AmeTransconf.startdate + "到" + text.AmeTransconf.enddate + "的时间段使用！");
	                   	}else if(text.a == 1){
	                   		alert(text.AmeTransconf.orgname+"的该截止时间已被:" + text.AmeTransconf.startdate + "到" + text.AmeTransconf.enddate + "的时间段使用！");
	                   	}
	                   	return;
                   	}else{
               			//alert("update_checkDateIn");
               			SaveData();
           			}
                },
                error: function (jqXHR, textStatus, errorThrown) {
                    alert(jqXHR.responseText);
                    CloseWindow();
                }
            });
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
						nui.get("transconf").setValue("请输入整数或六位以内小数...");
					else {
						alert("系数输入有误!请输入整数或六位以内小数!");
						return;
					}
				}
        	}
        	if(i != 3){
        		var reN = /^[1-9]*[0-9]+.?[0-9]{0,3}$/;
        		var getN = ["laborcost","laborncost","sybjtcb"];
				var get = 0.0;
				
				get = nui.get(getN[i]).getValue();
				if(reN.test(get) == true){
					if(get < 0.0 ){
						alert(getN[i]+"输入数据不可为负数,请校验!");
						nui.get(getN[i]).setValue('');
					}
				}else{
					nui.alert("请输入正确的数字!小数请保持在3位以内!","数据输入有误!");
					nui.get(getN[i]).setValue('');
					return;
				}
        	}
			
			return;
		}
        function clear(){
			var getString = nui.get("transconf").getValue();
			if(getString == "请输入整数或六位以内小数..."){
				nui.get("transconf").setValue('');
			}
			return;
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
        function onOk(e) {
        	var a=nui.get("startdate").getValue();
        	var b=nui.get("enddate").getValue();
        	if(b<a){
        		alert("截止日期必须大于开始日期");
        		return false;
        	}
        	var getStr = nui.get("transconf").getValue();
			if(getStr == "请输入整数或六位以内小数..."){
				nui.get("transconf").setValue('');
			}
			var getLabor = nui.get("laborcost").getValue();
			if(getLabor == "" || getLabor == null){
				alert("请填写工时总成本!");
				return;
			}
			var getLaborN = nui.get("laborncost").getValue();
			if(getLaborN == "" || getLaborN == null){
				alert("请填写不含加班工时总成本!");
				return;
			}
			var getsybjtcb = nui.get("sybjtcb").getValue();
			if(getsybjtcb == "" || getsybjtcb == null){
				alert("请填写部门静态成本!");
				return;
			}
           	if(checkinput())
        		checkdatein();
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
        function onCancel(e) {
            CloseWindow("cancel");
        }
        
        //财务年月控制
		function watchfinYM(){
			var finYM = nui.get("finyearmonth").getValue();
			var year = finYM.getFullYear();
	  		var month = finYM.getMonth()+1;
			var json = ({"criteria":{"_entity":"com.primeton.eos.common.newdataset.MisFinperiod",
									 "_expr[0]":{"_property":"finyear","_op":"=","_value":year},
									 "_expr[1]":{"_property":"finmonth","_op":"=","_value":month}
									}});
			nui.ajax({
		        type:'get',
		        data:json,
		        cache: false,
		        showModal: false,
		        async :false,
		        contentType: 'text/json',
		        url:'com.primeton.rdmgr.labor.misfinperiodbiz.queryMisFinperiods.biz.ext',
		        success:function(result){
		            if(result.misfinperiods.length>0){
		            	nui.get("startdate").setValue(result.misfinperiods[0].startdate);
		            	nui.get("enddate").setValue(result.misfinperiods[0].enddate);
		            }else{
		            	nui.get("startdate").setValue('');
		            	nui.get("enddate").setValue('');
		            }
		        },
		        error:function(jqXHR, textStatus, errorThrown){
		            nui.alert("error:" + jqXHR.responseText);
		        }
		    })
		}
		 //系数自动计算
		function changetransconf(){
        	//部门静态成本
        	var sybjtcb = nui.get("sybjtcb").getValue();
        	//工时总成本
        	var laborcost = nui.get("laborcost").getValue();
        	if(isNaN(sybjtcb)){
        		nui.alert("部门静态成本请输入数字！");
        		nui.get("sybjtcb").setValue(0);
        		return;
        	}
        	if(isNaN(laborcost)){
        		nui.alert("工时总成本请输入数字！");
        		nui.get("laborcost").setValue(0);
        		return;
        	}
        	
        	if(sybjtcb == null || sybjtcb == ""){
        		sybjtcb = 0;
        		nui.get("sybjtcb").setValue(0);
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
    </script>
</body>
</html>
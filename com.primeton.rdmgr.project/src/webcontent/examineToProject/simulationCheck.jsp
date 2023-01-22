<%@page pageEncoding="UTF-8"%>
<%@include file="/common/common.jsp"%>
<%@include file="/common/skins/skin0/component.jsp" %>
<html>
<!-- 
  - Author(s): yaoyi
  - Date: 2017-12-05 14:40:13
  - Description:
-->
<head>
<title>考核模拟</title>
<meta http-equiv="content-type" content="text/html; charset=UTF-8" />
	<script src="<%= request.getContextPath() %>/common/nui/nui.js"
		type="text/javascript"></script>
	<script src="../common/nui/nui.js" type="text/javascript"></script>
	<style type="text/css">
	   *{
	        font-size:12px;
	        padding:0;
	        margin:0;
	        
	    }
	</style>
</head>
<body>
<fieldset id="field9" style="border:solid 1px #aaa;padding:3px;">
	<input class="nui-hidden" id="budget"/>
	<input class="nui-hidden" id="bonusrate"/>
	<input class="nui-hidden" id="managerrate"/>
	<table style="table-layout:fixed;" id="a2">
		<tr>
			<td align="right" style="width:120px;">考核时实际服务成本：</td>
			<td>
				<input name="simulation.a" id="a" class="nui-spinner" format="n2" allowLimitValue="false" changeOnMousewheel="false" showbutton="false" inputStyle="text-align: right"  style="width:150px" onValuechanged="changenum"/>
			</td>
			<td align="right" style="width:120px;">维护期间预留成本：</td>
			<td>
				<input name="simulation.c" id="c" class="nui-spinner" format="n2" allowLimitValue="false" changeOnMousewheel="false" showbutton="false" inputStyle="text-align: right" style="width:150px" onValuechanged="changenum"/>
			</td>
		</tr>
		<tr>
			<td align="right" style="width:120px;">考核核算成本：</td>
			<td >
				<input name="simulation.d" id="d" class="nui-spinner" format="n2" allowLimitValue="false" changeOnMousewheel="false" showbutton="false" inputStyle="text-align: right" style="width:150px;" readonly="readonly"/>
			</td>
			<td align="right" style="width:120px;">项目节省成本：</td>
			<td >
				<input name="simulation.e" id="e" class="nui-spinner" format="n2" allowLimitValue="false" changeOnMousewheel="false" showbutton="false" inputStyle="text-align: right"  readonly="readonly" style="width: 150px;"/>
			</td>
		</tr>	
		<tr>
			<td align="right" style="width:120px;">预算偏离度系数：</td>
			<td >
				<input name="simulation.f" id="f" class="nui-spinner" format="n2" allowLimitValue="false" changeOnMousewheel="false" showbutton="false" inputStyle="text-align: right"  readonly="readonly" style="width: 150px;"/>
			</td>
			<td align="right" style="width:120px;">收入确认延误系数：</td>
			<td >
				<input name="simulation.g" id="g" class="nui-spinner" format="n2" allowLimitValue="false" changeOnMousewheel="false" showbutton="false" inputStyle="text-align: right" style="width: 150px;" onValuechanged="changenum"/>
			</td>
		</tr>
		<tr>
			<td align="right" style="width:120px;">项目奖金：</td>
			<td >
				<input name="simulation.h" id="h" class="nui-spinner" readonly="readonly" format="n2" allowLimitValue="false" changeOnMousewheel="false" showbutton="false" inputStyle="text-align: right"   style="width: 150px;"/>
			</td>
			<td align="right" style="width:120px;">项目经理奖金：</td>
			<td >
				<input name="simulation.i" id="i" class="nui-spinner" readonly="readonly" format="n2" allowLimitValue="false" changeOnMousewheel="false" showbutton="false" inputStyle="text-align: right"  style="width: 150px;"/>
			</td>
		</tr>
		<tr>
			<td align="right" style="width:120px;">其他人员奖金：</td>
			<td >
				<input name="simulation.j" id="j" class="nui-spinner" readonly="readonly" format="n2" allowLimitValue="false" changeOnMousewheel="false" showbutton="false" inputStyle="text-align: right" style="width: 150px;"/>
			</td>
		</tr>
	</table>
	<div  ><font color="red">提示：以上考核模拟未考虑考核得分影响和工时转换系数的影响</font></div>
 </fieldset>
 <div class="nui-toolbar" style="text-align:center;padding-top:8px;padding-bottom:8px;" borderStyle="border:0;">
    <a class="nui-button" style="width:60px;" onclick="onCancel()">关闭</a>
  </div>
 <script type="text/javascript">
 	nui.parse();
 
 		function onCancel(e) {
 			CloseWindow("cancel");
        }
        
        function setData(data){
        	if(data!=null&&data!=""){
        		nui.get("budget").setValue(delcommafy(data.budget));
        		nui.get("bonusrate").setValue(data.bonusrate);
        		nui.get("managerrate").setValue(data.managerrate);
        		nui.get("c").setValue(0);
        		nui.get("g").setValue(1);
        	}
        }
        
        //标准方法接口定义
	    function CloseWindow(action) {           
	        if (window.CloseOwnerWindow) return window.CloseOwnerWindow(action);
	        else window.close();
	    }
	    
	    function changenum(){
	    	var a = nui.get("a").getValue();//考核时实际服务成本
	    	var c = nui.get("c").getValue();//维护期间预留成本
	    	var g = nui.get("g").getValue();
	    	if(parseFloat(g)<0 || parseFloat(g)>1){
	    		alert("收入确认延误系数不能大于1或小于0！");
	    		nui.get("g").setValue(1);
	    		g = 1;
	    	}
	    	var budget = nui.get("budget").getValue();
	    	var bonusrate = nui.get("bonusrate").getValue();
	    	var managerrate = nui.get("managerrate").getValue();
	    	var d = parseFloat(a)+parseFloat(c);
	    	var e = parseFloat(budget) - parseFloat(d);
	    	if((parseFloat(d)-parseFloat(budget))/parseFloat(budget) < -0.2){
	    		var f = (1.2 + (parseFloat(d)-parseFloat(budget))/parseFloat(budget)); 
	    	}else{
	    		var f = 1.2 - 0.2;
	    	}
	    	if(parseFloat(e)<=0){
	    		var h = 0;
	    	}else{
	    		if(parseFloat(e)*parseFloat(f)*parseFloat(g)*parseFloat(bonusrate)>parseFloat(budget)*0.06){
		    		var h = parseFloat(budget) * 0.06;
		    	}else{
		    		var h = parseFloat(e)*parseFloat(f)*parseFloat(g)*parseFloat(bonusrate);
		    	}
	    	}
	    	var i = parseFloat(h) * parseFloat(managerrate);
	    	var j = parseFloat(h) - parseFloat(i);
	    	nui.get("d").setValue(parseFloat(d));
	    	nui.get("e").setValue(parseFloat(e));
	    	nui.get("f").setValue(parseFloat(f).toFixed(2));
	    	nui.get("h").setValue(parseFloat(h));
	    	nui.get("i").setValue(parseFloat(i));
	    	nui.get("j").setValue(parseFloat(j));
	    	
	    }
	    
	    function delcommafy(num){
		  num=num.replace(/,/gi,'');
		  return parseFloat(num);
		}
 </script>
</body>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@include file="/common/common.jsp"%>
<%@include file="/common/skins/skin0/component.jsp" %>
<html>
<!-- 
  - Author(s): huangyq
  - Date: 2018-09-14 11:44:20
  - Description:
-->
<head>
<title>分摊</title>
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
	<fieldset id="field1" style="border: solid 1px #aaa;padding: 3px;">
	<legend id="legendid"></legend>
	<form id="form1" method="post">
	        <input class="nui-hidden" name="year"  id="year"/>
	        <input class="nui-hidden" name="month"  id="month"/>
	        <input class="nui-hidden" name="regionid"  id="regionid"/>
		<table style="width: 100%;">
			<tr>
				<td align="right" style="width: 120px">区域固定资产原值：</td>
				<td><input name="qygdzcyz" id="qygdzcyz" class="nui-spinner" style="width: 150px" 
					allowLimitValue="false" changeOnMousewheel="false" showbutton="false" 
					inputStyle="text-align: right" format="n2" readonly="readonly"/>
				</td>
				<td align="right" style="width: 100px">区域折旧分摊：</td>
				<td><input name="qyzjft" id="qyzjft" class="nui-spinner" style="width: 150px" 
					allowLimitValue="false" changeOnMousewheel="false" showbutton="false" 
					inputStyle="text-align: right" format="n2" readonly="readonly" />
				</td>
			</tr>
			<tr>
				<td align="right" style="width: 100px">装修摊销：</td>
				<td><input name="zxtx" id="zxtx" class="nui-spinner" style="width: 150px" 
					allowLimitValue="false" changeOnMousewheel="false" showbutton="false" 
					inputStyle="text-align: right" format="n2" onvaluechanged="changeSum(e)"/>
				</td>
				<td align="right" style="width: 100px">房租：</td>
				<td><input name="fzwy" id="fzwy" class="nui-spinner" style="width: 150px" 
					allowLimitValue="false" changeOnMousewheel="false" showbutton="false" 
					inputStyle="text-align: right" format="n2" onvaluechanged="changeSum(e)"/>
				</td>
			</tr>
			<tr>
				<td align="right" style="width: 100px">物业：</td>
				<td><input name="wy" id="wy" class="nui-spinner" style="width: 150px" 
					allowLimitValue="false" changeOnMousewheel="false" showbutton="false" 
					inputStyle="text-align: right" format="n2" onvaluechanged="changeSum(e)"/>
				</td>
				<td align="right" style="width: 100px">水电费：</td>
				<td><input name="sdf" id="sdf" class="nui-spinner" style="width: 150px" 
					allowLimitValue="false" changeOnMousewheel="false" showbutton="false" 
					inputStyle="text-align: right" format="n2" onvaluechanged="changeSum(e)"/>
				</td>
			</tr>
			<tr>
				<td align="right" style="width: 120px">其他公共费用：</td>
				<td><input name="qtggfy" id="qtggfy" class="nui-spinner" style="width: 150px" 
					allowLimitValue="false" changeOnMousewheel="false" showbutton="false" 
					inputStyle="text-align: right" format="n2" readonly="readonly"/>
				</td>
			</tr>
		</table>
	  </form>
	</fieldset>
	<fieldset id="field1" style="border: solid 1px #aaa;padding: 3px;">
		<legend>分摊计算</legend>
		<jsp:include page="/mpcommon/deptcostRegion/deptcostregiongrid.jsp"></jsp:include>
	</fieldset>
</div>
	<div style="text-align: center;padding: 10px;" class="nui-toolbar">
		<a class="nui-button" onclick="onOk()" id="save" iconCls="icon-ok" 
			style="width: 100px;margin-right: 20px;">
			分摊保存
		</a>
		<a class="nui-button" onclick="onCancel()" id="close" iconCls="icon-cancel" 
			style="width: 60px;margin-right: 20px;">
			关闭
		</a>
	</div>
	<script type="text/javascript">
		nui.parse();
		var form = new nui.Form("#form1");  
		var year = '<%=request.getParameter("year") %>';
		var month = '<%=request.getParameter("month") %>';
		var regionid ='<%=request.getParameter("regionid") %>';
		
    	var grid = nui.get("datagrid1");
	
		nui.get("year").setValue(year);
		nui.get("month").setValue(month);
		nui.get("regionid").setValue(regionid);
		
		function setData(data){
        	var form = new nui.Form("#form1");//将普通form转为nui的form
        	var map = form.getData(false,true);
			var json = nui.encode({"map":map});
			nui.ajax({
				url:"com.primeton.eos.common.deptcostRegion.getMisMachineAsset.biz.ext",
				type:'POST',
				data:json,
				cache:false,
				contentType:'text/json',
				success:function(o){
					var json = nui.decode(o);
					var listmachine = o.listmachine[0];
					nui.get("qygdzcyz").setValue(listmachine.qygdzcyz);
					//区域折旧分摊
					nui.get("qyzjft").setValue(listmachine.qyzjft);
					
					//装修摊销
					nui.get("zxtx").setValue(data.zxtx);
					//房租
					nui.get("fzwy").setValue(data.fzwy);
					//物业
					nui.get("wy").setValue(data.wy);
					//水电费
					nui.get("sdf").setValue(data.sdf);
					//水电费
					nui.get("qtggfy").setValue(data.qtggfy);
					
					var regionname = data.regionname;
					var textvalue = year+"年"+month+"月"+regionname+"区域分摊";
					document.getElementById("legendid").innerHTML = textvalue;
					
		        	var map1 = form.getData();
					grid.load({"map":map1});
				}
    		}); 
			
		}
		
		function onOk(){
			nui.confirm("是否分摊保存？","操作提示",function(o){
	        	if("ok" == o){
					nui.get("save").disable();
					var data = form.getData(false,true);
					var json = nui.encode({"temp":data});
					nui.ajax({
						url:"com.primeton.eos.common.deptcostRegion.newSavedeptcostregion.biz.ext",
						type:'POST',
						data:json,
						cache:false,
						contentType:'text/json',
						success:function(o){
							var json = nui.decode(o);
							if(o.result=="1"){
								nui.alert("保存并分摊成功", "系统提示", function(action){
			            		CloseWindow("ok");	
			            		});
			            	}else{
			              		nui.alert("保存失败", "系统提示", function(action){
			              		if(action == "ok" || action == "close"){
			                  	//CloseWindow("saveFailed");
			                	}
			              		});
			           		}
			         	}
		    		}); 
	        	}
	        });
    	}  
    	
    	function changeSum(e){
    		var map1 = form.getData();
			grid.load({"map":map1});
    	}
    	
    	function onDrawSummaryCell(e) {
		    var result = e.result;
		    var grid = e.sender;
		    if (e.field == "deptName") {
		        e.cellHtml = "<span style='display: block;font-weight: bold;font-size: 12px;text-align: right;'>合计：</span>";
		    }
		    if (e.field == "empNum" || e.field == "qygdzcyz" || e.field == "qyzjft" || e.field == "zxtx" || e.field == "fzwy"
		    	|| e.field == "wy" || e.field == "sdf" || e.field == "qtggfy" ) {
		    	e.cellHtml = "<span style='display: block;font-weight: bold;text-align: right;'>" + e.cellHtml.toFixed(1) + "</span>";
		    }   			    
		} 
        //关闭模态窗口
		function onCancel(){
	     	CloseWindow();
	    }
	   	function CloseWindow(action) {
			if (window.CloseOwnerWindow) return window.CloseOwnerWindow(action);
			else window.close();
		}
        
	</script>

</body>
</html>
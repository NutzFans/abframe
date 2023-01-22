<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<!-- 
  - Author(s): mengyy
  - Date: 2018-12-13 20:18:03
  - Description:
-->
<head>
<title>业务信息</title>
<style type="text/css">
    .asLabel
    {
        border:0;background-color:#F5F5F5;cursor:default;    
    }
</style>
</head>
<body><div class="nui-fit">
	<div class="mini-panel" style="width: 100%;">
		<!-- 提示信息展示  -->
		<jsp:include page="/ame_common/ameFlowOperTips/ameFlowOperTipsInfo.jsp"/>
		<!--行政采购展示  -->
		<fieldset id="field1" style="border:solid 1px #aaa;padding:3px;">
			<legend>资产申请信息</legend>
			<form id="form1" method="post">	
				<input name="machineApply.id" class="nui-hidden"/>
				<input name="machineApply.processinstid"  class="nui-hidden"/>
	            <table style="table-layout:fixed;" id="table_file">
	            	<tr>
	            		<td style="width:120px;" align="right">资产类型：</td>
	                    <td style="width:150px;" id="type"  class = "asLabel"></td>
	                    <td style="width:120px;" align="right">子类型：</td>
	                    <td style="width:150px;" id="sectype" class = "asLabel"></td>
	                    <td style="width:120px;" align="right">区域：</td>
	                    <td style="width:150px;"id="area" class = "asLabel"></td>
	            	</tr>
	            	<tr>
	            		<td style="width:120px;" align="right">资产编号：</td>
	                    <td style="width:150px;" id="assetnum" colspan="3"  class = "asLabel"></td>
	            		<td style="width:120px;" align="right">流程状态：</td>
	                    <td style="width:150px;" id="state" class = "asLabel"></td>
	            	</tr>
	            	<tr>
	            		<td style="width:120px;" align="right">管理方式：</td>
	                    <td style="width:150px;" id="storageType" class = "asLabel"></td>
	                    <td style="width:120px;" align="right">数量：</td>
	                    <td style="width:150px;" id="num" class = "asLabel"></td>
	            		<td style="width:120px;" align="right">购买总金额：</td>
		                <td style="width:150px;" id="price" class = "asLabel"></td>
	            	</tr>
	            	<tr id="temp">
	                	<td width="120px" align="right">负责人：</td>
	                    <td width="150px" id="usingemp" class = "asLabel"></td>
	                    <td width="120px" align="right">所属部门：</td>
	                    <td width="150px" id="deptname" class = "asLabel"></td>
	                    <td width="120px" align="right">所属项目：</td>
	                    <td width="150px" id="projectno" class = "asLabel"></td>
	            	</tr>
	            	<tr>
	                    <td style="width:120px;" align="right">配置：</td>
	                    <td style="width:600px;" id="configuration" colspan="5" class = "asLabel"></td>
	            	</tr>
	            	<tr>
	                    <td style="width:120px;" align="right">型号：</td>
	                    <td style="width:600px;" id="model" colspan="5" class = "asLabel"></td>
	            	</tr>
	            	<tr>
	                    <td style="width:120px;" align="right">采购途径：</td>
	                    <td style="width:600px;" id="purmeans" colspan="5" class = "asLabel"></td>
	            	</tr>
	            </table>
	    	</form> 
		</fieldset>
		<jsp:include page="/ame_common/misOpinion.jsp"/>
	</div>   
</div>
<div style="text-align: center;padding: 10px;border-width:1px 0px 0px 0px;" class="nui-toolbar" id="s1">
	<a class="nui-button" onclick="onCancel('cancel')" id="closeWin" style="width:60px;">关闭</a>  
</div>  
</body>
<script type="text/javascript">
	nui.parse();
	
	var stat = <%=request.getParameter("stat") %>;
	var processInstID = <%=request.getParameter("processInstID") %>;
  	var form = new nui.Form("#form1");//申请信息
  	
	document.getElementById("opioionform").style.display = "none";
  	document.getElementById("opinionHide").style.display="none";
  	
	init();
	function init(){
		form.mask("数据加载中...");
    	//流程提示信息
		var data={"processInstID":processInstID};
		var json=nui.encode(data);
  		nui.ajax({//获取资产采购申请信息
      		url: "com.primeton.eos.machine.machineProcess.getMachineApply.biz.ext",
	      	type: 'POST',
          	data: json,
      		success: function (o){
      			form.unmask();
       	  		form.setData(o);
       	  		document.getElementById("type").innerHTML =nui.getDictText('MIS_MA_TYPE',o.machineApply.type);
       	  		document.getElementById("sectype").innerHTML =nui.getDictText('MIS_MA_SECTYPE',o.machineApply.sectype);
       	  		document.getElementById("assetnum").innerHTML =o.machineApply.assetnum == null ?"":o.machineApply.assetnum;
       	  		document.getElementById("state").innerHTML =nui.getDictText('MIS_MACHINEAPPLY_STATE',o.machineApply.state);
                document.getElementById("configuration").innerHTML = o.machineApply.configuration == null ?"":o.machineApply.configuration;
                document.getElementById("price").innerHTML = o.machineApply.price == null ?"":o.machineApply.price;
                document.getElementById("num").innerHTML = o.machineApply.num == null ?"":o.machineApply.num;
                document.getElementById("model").innerHTML = o.machineApply.model == null ?"":o.machineApply.model;
                document.getElementById("purmeans").innerHTML = o.machineApply.purmeans == null ?"":o.machineApply.purmeans;
       	  		document.getElementById("storageType").innerHTML =nui.getDictText('MIS_MA_STORAGE',o.machineApply.storagetype);
       	  		document.getElementById("area").innerHTML =nui.getDictText('EXP_REGION',o.machineApply.area);
                document.getElementById("usingemp").innerHTML = o.machineApply.usingempname == null ?"":o.machineApply.usingempname;
                document.getElementById("deptname").innerHTML = o.machineApply.deptname == null ?"":o.machineApply.deptname;
                document.getElementById("projectno").innerHTML = o.machineApply.projectno == null ?"":o.machineApply.projectno;
  				
  				if("2" == o.machineApply.storagetype){
  					$("#temp").hide();
  				}else{
  					$("#temp").css({"display":""});
  				}
  				var processInstID = o.machineApply.processinstid;
  				
  				//查询审核意见
				var grid = nui.get("datagrid1");
				
				if(stat!='1'){
					document.getElementById("opioionform").style.display = "";
					document.getElementById("s1").style.display = "none";
					if(processInstID != null&&processInstID != ""){
						grid.load({processInstID: processInstID});
						grid.sortBy("time", "desc");
					}
				}
				
				
          	},
	      	error: function (jqXHR, textStatus, errorThrown) {
	        	alert(jqXHR.responseText);
	      	}
    	});
	}
	//关闭
   	function onCancel(){
		CloseWindow("cancel");
	}
	function CloseWindow(action) {
		if (window.CloseOwnerWindow) return window.CloseOwnerWindow(action);
		else window.close();
	}
	
</script>
</html>
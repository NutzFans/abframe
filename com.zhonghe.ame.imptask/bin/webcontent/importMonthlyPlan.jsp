<%@page import="org.json.simple.JSONObject"%>
<%@page pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@include file="/common/common.jsp"%>
<%@include file="/common/skins/skin0/component.jsp" %>
<html>
<!-- 
  - Author(s): yaoyi
  - Date: 2017-02-28 11:46:23
  - Description:
-->
<head>
<title></title>
	<link href="../demo.css" rel="stylesheet" type="text/css" />
	<script src="<%= request.getContextPath() %>/common/nui/nui.js" type="text/javascript"></script>
	<style type="text/css">
	    body{
	        margin:0;padding:0;border:0;width:100%;height:100%;overflow:hidden;
	    }
    </style>
</head>
<body>
		<fieldset id="importOutCount">
		<legend>月度计划填报导入</legend>
		<form id="form2" action="com.zhonghe.ame.monthlyPlan.importMonthlyPlan.flow" target="hidden_frame" method="post" enctype="multipart/form-data">
        <div class="nui-toolbar" style="border-bottom:0;padding:0px;">
            <table style="width:100%;">
	            	<td style="width:550px;" colspan="5">
	            		请选择附件：<input type='file' id="uploadfile" name='uploadfile' size='30'>
	       	  		</td>
                </tr>
                <tr>
		            <td style="width:2%;" align="left" >上传注意事项：</td>
			        <td style="width:12%;" colspan="2">
			        	<div style="color: red;">（1）上传用的 Excel 文件版本为 97-2003版本，即 .xls 为后缀的版本，数据全部放在第一个工作表内，数据从第三行开始读取一直读到最后一行。</div>
			       	</td>
		        </tr>
            </table>           
        </div>
        </form>
         <iframe name='hidden_frame' id="hidden_frame" style='display:none'></iframe> 
	  <div style="text-align:center;padding:10px;" class="nui-toolbar">
		<a class="nui-button" onclick="onOk()" style="width:60px;margin-right:20px;" id="sureButton">提交</a>
		<a class="nui-button" onclick="onCancel()" style="width:60px;margin-right:20px;">取消</a>  
	  </div>
    </fieldset>
</body>
<script>

	nui.parse();
	var datas = [];
    //导入数据的判断
		<%
		String msg = (String)request.getAttribute("exception");
		JSONObject json = (JSONObject)request.getAttribute("json");//成功数据
		JSONObject json1 = (JSONObject)request.getAttribute("json1");//失败数据
		
		%>
		var result = <%=json %>;
		var result1 = <%=json1 %>;
		var msg = <%=msg %>;
		if(msg==0||msg==1){
			msg = nui.encode(msg);
			result = result.json;
			result = nui.decode(result)
			result1 = nui.encode(result1.json);
// 			rs(msg,result1,result);
		}
// 		function rs(msg,result1,result){
// 			if(msg==0){
// 				if(result1 == '{}'){
// 					var count = 0;
// 					result = nui.clone(result);
// 					for(var pro in result){
// 					   if(result.hasOwnProperty(pro)) count++;
// 					}
// 					for(var i=0;i<count;i++){
// 						var temp = "temp"+i;
// 						var orgname = nui.encode(result[eval("temp")].orgname);
// 						var beneforgid = nui.encode(result[eval("temp")].orgid);
// 						var benefcustid = nui.encode(result[eval("temp")].custid);
// 						var custjc = nui.encode(result[eval("temp")].custjc);
// 						var projectName = nui.encode(result[eval("temp")].projectName);
// 						var benefprojno = nui.encode(result[eval("temp")].projno);
// 						var projno = nui.encode(result[eval("temp")].projno);
// 						var projectName = nui.encode(result[eval("temp")].projectName);
// 						var benefmon = nui.encode(result[eval("temp")].benefmon);
// 						var fintype = nui.encode(result[eval("temp")].feetypecode);
// 						var fintype2name = nui.encode(result[eval("temp")].fintype2name);
// 						datas[i] = {"expReibenef": {
// 						orgname: orgname,
// 						beneforgid: beneforgid,
// 						benefcustid: benefcustid,
// 						custjc: custjc,
// 						projectName: projectName,
// 						benefprojno: benefprojno,
// 						projno: projno,
// 						projectName: projectName,
// 						fintype: fintype,
// 						fintype2name: fintype2name,
// 						benefmon: benefmon}};
// 					}
// 					alert("导入成功！");
// 					window.parent.addRowBenefInfo(datas);
// 				}else{
// 					var count = 0;
// 					for(var pro in result){
// 					   if(result.hasOwnProperty(pro)) count++;
// 					}
					
// 					var count1 = 0;
// 					result1 = nui.decode(result1);
// 					result1 = nui.clone(result1);
// 					result = nui.clone(result);
// 					for(var pro in result1){
// 					   if(result1.hasOwnProperty(pro)) count1++;
// 					}
					
// 					for(var i=0;i<count;i++){
// 						var temp = "temp"+i;
// 						var orgname = nui.encode(result[eval("temp")].orgname);
// 						var beneforgid = nui.encode(result[eval("temp")].orgid);
// 						var benefcustid = nui.encode(result[eval("temp")].custid);
// 						var custjc = nui.encode(result[eval("temp")].custjc);
// 						var projectName = nui.encode(result[eval("temp")].projectName);
// 						var benefprojno = nui.encode(result[eval("temp")].projno);
// 						var projno = nui.encode(result[eval("temp")].projno);
// 						var projectName = nui.encode(result[eval("temp")].projectName);
// 						var benefmon = nui.encode(result[eval("temp")].benefmon);
// 						var fintype = nui.encode(result[eval("temp")].feetypecode);
// 						var fintype2name = nui.encode(result[eval("temp")].fintype2name);
// 						datas[i] = {"expReibenef": {
// 						orgname: orgname,
// 						beneforgid: beneforgid,
// 						benefcustid: benefcustid,
// 						custjc: custjc,
// 						projectName: projectName,
// 						benefprojno: benefprojno,
// 						projno: projno,
// 						projectName: projectName,
// 						fintype: fintype,
// 						fintype2name: fintype2name,
// 						benefmon: benefmon}};
// 					}
					
// 					var s="";
// 					for(var i=0;i<count1;i++){
// 						var temp = "temp"+i;
// 						var orgname = nui.encode(result1[eval("temp")].orgname);
// 						var benefmon = nui.encode(result1[eval("temp")].benefmon);
// 						var k = count1-1;
// 						if(i==k){
// 							s+="[受益部门为"+orgname+",报销金额为"+benefmon+"]";
// 						}else{
// 							s+="[受益部门为"+orgname+",报销金额为"+benefmon+"],"
// 						}
// 					}
// 					alert("导入成功！其中"+s+"的报销受益数据导入失败！");
// 					window.parent.addRowBenefInfo(datas);
// 				}
// 			}else{
// 				alert("导入失败！");
// 			}
// 		}
	function onOk(){
		var fileName = document.getElementById("uploadfile").value;
		if(fileName == ""){
			alert("请选择附件！");
			return;
		}else{
			form2.submit();
			nui.get("sureButton").setEnabled(false);
			onCancel();
		}
	}
		
	function onCancel() {
		CloseWindow();
	}
    
    function CloseWindow(action) {
		if (window.CloseOwnerWindow) return window.CloseOwnerWindow(action);
		else window.close();
	}
		
	
</script>
</html>
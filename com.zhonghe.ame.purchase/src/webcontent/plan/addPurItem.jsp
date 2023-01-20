<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<!-- 
  - Author(s): zhang-yb
  - Date: 2018-08-14 10:09:12
  - Description:
-->
<head>
<script src="<%= request.getContextPath() %>/common/nui/nui.js" type="text/javascript"></script>
<title>采购目录</title>
<style type="text/css">
    html, body{font-size:12px;padding:0;margin:0;border:0;height:100%;}
</style>
</head>
<body>
	<div class="mini-panel" id="Info" title="新增采购目录" style="width: auto">
		<fieldset style="border:solid 1px #aaa;padding:3px;width: 100%;">
			<legend>采购目录</legend>
			<form id="form1" method="post">
			<table id="form11" style="table-layout:fixed; ">
				<tr>
				<td class="form_label" style="width: 20%" align="right">采购目录类型：</td>
                <td >    
                    <input class="nui-dictcombobox" name="type" style="width:80%"id="type" dictTypeId="ZH_PURCHASE" required="true" onvaluechanged="codeTypeChange" />
                </td>
                </tr>
				<tr>
					<td align="right"  class="form_label" id="type1">
						采购编码类型：
					</td>
					<td style="width: 20%">
						<input id="codetype" name="grade" class="nui-radiobuttonlist" onvaluechanged="codeTypeChange1" data="[{id: '1', text: '大类'}, {id:'2', text: '中类'}, {id:'3' , text: '小类'}]" />
					</td>
				</tr>
				<tr id="parent1">
				<td class="form_label" style="width: 20%" align="right">物项父类编码：</td>
                <td >    
                    <input class="nui-dictcombobox" style="width:80%" textField="itemCode" name="parentId" valueField="id" id="parentCode" required="true" dataField="purItems" onvaluechanged="typeChange"/>
                </td>
                </tr>
                <tr id="parent">
                <td class="form_label" style="width: 20%" align="right">物项父类名称：</td>
                <td >    
                    <input class="nui-textbox" enabled="false" style="width:80%" textField="itemName" id="typeName"  required="true"/>
                </td>
                </tr>
				 <tr id="first">
					<td align="right"  class="form_label">
						采购大类编码：
					</td>
					<td >
						<input class="nui-textbox" name="itemCode1"style="width:80%" id="type" dictTypeId="ZH_PURCHASE" required="true"/>
					</td>
				</tr>
				<tr id="first1">
					<td align="right"  class="form_label">
						采购大类名称：
					</td>
					<td >
						<input class="nui-textbox" name="itemName1" style="width:80%" id="type" dictTypeId="ZH_PURCHASE" required="true"/>
					</td>
				</tr>
				<tr id="second">
					<td align="right"  class="form_label">
						采购中类编码：
					</td>
					<td >
						<input class="nui-textbox" name="itemCode2" style="width:80%" id="type" dictTypeId="ZH_PURCHASE" required="true" />
					</td>
				</tr>
				<tr id="second1">
					<td align="right"  class="form_label">
						采购中类名称：
					</td>
					<td >
						<input class="nui-textbox" name="itemName2"  style="width:80%" id="type" dictTypeId="ZH_PURCHASE" required="true" />
					</td>
				</tr>
				
				<tr id="three">
					<td align="right"  class="form_label">
						采购小类编码：
					</td>
					<td >
						<input class="nui-textbox" name="itemCode3" style="width:80%" id="type" dictTypeId="ZH_PURCHASE" required="true" />
					</td>
				</tr>
				<tr id="three1">
					<td align="right"  class="form_label">
						采购小类名称：
					</td>
					<td >
						<input class="nui-textbox" name="itemName3" id="type" style="width:80%" dictTypeId="ZH_PURCHASE" required="true" />
					</td>
				</tr>
				<tr id="guikou">
					<td align="right"  class="form_label">
						归口部门：
					</td>
					<td >
						<input name="orgId" id="orgId" style="width:80%"
									class="nui-combobox" required="true"
									url="com.primeton.rdmgr.labor.labormgr.getAllOrgs.biz.ext"
									filterType="like" textField="orgname" valueField="orgid"
									dataField="allorgs" valueFromSelect="true" allowInput="true"
									  />
					</td>
				</tr>
			</table>
			</form>
		</fieldset>
		
	</div>
		
	<div style="text-align:center;padding:10px;border-width:1px 0px 0px 0px;" class="nui-toolbar">               
	    <a class="nui-button" onclick="submit" style="width:60px;margin-right:20px;">保存</a>       
	    <a class="nui-button" onclick="onCancel" style="width:60px;">关闭</a>
	</div> 
</body>
<script type="text/javascript">
	nui.parse();
	var workItemID = "";//定义当前环节id
	var isCode = true;
	var typeValue;
	var form1= new nui.Form("#form1");
	
	 document.getElementById("parent").style.display="none";
	    document.getElementById("first").style.display="none";
	    document.getElementById("first1").style.display="none";
	    document.getElementById("second").style.display="none";
	    document.getElementById("second1").style.display="none";
	    document.getElementById("three").style.display="none";
	    document.getElementById("parent").style.display="none";
	    document.getElementById("parent1").style.display="none";
	    document.getElementById("three1").style.display="none";
	    document.getElementById("guikou").style.display="none";
	//页面加载完成之后 输入框获取焦点
	window.onload=function(){
		$("#inputInfo").focus();
	} 

	function codeTypeChange(e){
		//console.log(new nui.Form("#form11").getData());
		typeValue=e.value;
		if(e.value==2){
			nui.get("codetype").setData("[{id: '1', text: '大类'}, {id:'2', text: '中类'}]");
		}else{
		nui.get("codetype").setData("[{id: '1', text: '大类'}, {id:'2', text: '中类'}, {id:'3', text: '小类'}]");
		
		}
		
		//data=
	}
	
		function onCancel(e) {
        CloseWindow("cancel");
    }
	function CloseWindow(action) {
        if (action == "cancel" ) {
            if (!confirm("是否关闭？")) {
                return false;
            }
        }
        if (window.CloseOwnerWindow) return window.CloseOwnerWindow(action);
        else window.close();            
    }
	function typeChange(e){
		nui.get("typeName").setValue(e.selected.itemName);
		console.log(e.selected.itemName);
	
	}
	
		   	function submit(){
			var formData = form1.getData();
			//var gridData = grid_traveldetail.getData();
			console.log(formData);
			
			var json=nui.encode({"purItem":formData})
    			
		    	nui.ajax({
		                url: "com.zhonghe.ame.purchase.purchaseItems.addPurItem.biz.ext",
		                data: json,
		                type: 'POST',
		                cache: false,
		                contentType: 'text/json',
		                success: function (text) {
            				 CloseWindow();
		                
		                },
		                error: function (jqXHR, textStatus, errorThrown) {
		                    alert(jqXHR.responseText);
		                }
		            });  
    	
    	
    	}
    	
	
	
	function codeTypeChange1(e){
		//console.log(new nui.Form("#form11").getData());
		//console.log(typeValue);
		if(e.value==1){
		
			document.getElementById("first").style.display="";
	    	document.getElementById("first1").style.display="";
			  document.getElementById("second").style.display="none";
	    document.getElementById("second1").style.display="none";
	    document.getElementById("three").style.display="none";
	    document.getElementById("parent").style.display="none";
	    document.getElementById("parent1").style.display="none";
	    document.getElementById("three1").style.display="none";
	    document.getElementById("guikou").style.display="none";
	    if(typeValue==1){
	    	document.getElementById("guikou").style.display="";
	    	
	    	} 
	    	nui.get("Info").doLayout();
		}else if(e.value==2){
			document.getElementById("first").style.display="none";
	    	document.getElementById("first1").style.display="none";
	    	document.getElementById("second").style.display="";
	    	document.getElementById("second1").style.display="";
	    	document.getElementById("three").style.display="none";
	    	document.getElementById("three1").style.display="none";
	    	document.getElementById("parent").style.display="";
	    	document.getElementById("parent1").style.display="";
	    	document.getElementById("guikou").style.display="none";
	    	 if(typeValue==2){
	    	document.getElementById("guikou").style.display="";
	    	
	    	} 
	    	nui.get("Info").doLayout();
		}else if(e.value==3){
			document.getElementById("first").style.display="none";
	    	document.getElementById("first1").style.display="none";
	    	document.getElementById("second").style.display="none";
	    	document.getElementById("second1").style.display="none";
	    	document.getElementById("three").style.display="";
	    	document.getElementById("three1").style.display="";
	    	document.getElementById("parent1").style.display="";
	    	document.getElementById("parent").style.display="";
	    	document.getElementById("guikou").style.display="none";
	    	nui.get("Info").doLayout();
		}
		
		nui.get("parentCode").setUrl("com.zhonghe.ame.purchase.purchaseItems.queryPurItem.biz.ext?grade="+(e.value-1)+"&type="+typeValue);
	
	}
	
	
	//回车触发事件
	function onKeyEnter(){
		var data = document.getElementById("inputInfo").value;
		var type = nui.get("type").getValue();
		if(type=="1"){
			type = "财务初审,财务审核";
		}
		if(event.keyCode ==13){  
			if(data == "" || data == null){
				nui.alert("请输入报销单。","提示",function(e){
					$("#inputInfo").focus();
				});
				return false;
			}
			var json = {expno:data,type:type};
		  	nui.ajax({
				url: "com.primeton.eos.ame_fee.myExpenseReimbursement.queryFinceVerfiyAuth.biz.ext",
				type: "post",
				data: json,
				contentType: "text/json",
				success: function (o){
					if(o.result == 2){
						nui.alert("你没有该报销单的处理权限。","提示",function(e){
							$("#inputInfo").focus();
						});
					}else if(o.result == 0){
						workItemID = o.workItemId;
						var src = "/default/bps/wfclient/task/dispatchTaskExecute.jsp?workItemID="+workItemID;
						var h = $("#reiInfo").height();
						h = h+"px";
						$("#ifrmid").attr("src",src).attr("height",h);
						$("#inputInfo").attr("disabled",true);
					}else{
						nui.alert("没有该报销单。","提示",function(e){
							$("#inputInfo").focus();
						});
					}
				}
			});
	  	} 
	}
	
	//重新刷新页面
	function doThing(e){
		$("#ifrmid").attr("src","");
		$("#inputInfo").attr("disabled",false).val("").focus();
	}
	
</script>
</html>
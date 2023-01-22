<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@page import="com.eos.data.datacontext.UserObject"%>
<%@ page import="java.util.Map" %>
<html>
<!-- 
  - Author(s): mengyy
  - Date: 2018-12-08 15:22:54
  - Description:
-->
<head>
	<title>资产入库</title>
	<meta http-equiv="content-type" content="text/html; charset=UTF-8" />
	<link id="css_skin" rel="stylesheet" type="text/css" href="/default/coframe/tools/skins/skin1/style.css" />
	<script src="<%= request.getContextPath() %>/common/nui/nui.js" type="text/javascript"></script>
	<style type="text/css">
	    body{
	        margin:0;padding:0;border:0;width:100%;height:100%;overflow:hidden;
	    }
	    .hideFieldset
	    {
	    	display:none;
	    }
    </style>
</head>
<body>

<div class="nui-fit">
	<div class="mini-panel"  title="资产交付与入库" style="width: 100%;">
		<div id="form1" >
		<!-- 提示信息展示  -->
		<jsp:include page="/ame_common/ameFlowOperTips/ameFlowOperTipsInfo.jsp"/>
		<!--行政采购展示  -->
		<fieldset id="field1" style="border:solid 1px #aaa;padding:3px;">
		<legend>采购资产信息</legend>
			<input name="machineApply.id" class="nui-hidden"/>
			<input name="machineApply.processinstid"  class="nui-hidden"/>
			<input name="machineApply.state" id="state"  class="nui-hidden"/>
			<input name="machineApply.isStorage" id="isStorage" value="1" class="nui-hidden"/>
            <table style="table-layout:fixed;" id="table_file">
            	<tr>
            		<td style="width:120px;" align="right">资产类型：</td>
                    <td style="width:150px;">    
                        <input class="mini-dictcombobox" name="machineApply.type" readonly="readonly" id="type" dictTypeId="MIS_MA_TYPE" required="true" emptyText="请选择" onvaluechanged="onTypeFilterChanged"/>
                    </td>
                    <td style="width:120px;" align="right">子类型：</td>
                    <td style="width:150px;">    
                        <input class="nui-combobox" name="machineApply.sectype"  readonly="readonly" id="sectype" required="true" emptyText="请选择" valueField="dictID" textField="dictName" parentField="parentId"/>
                    </td>
                    <td style="width:120px;" align="right">区域：</td>
                    <td style="width:150px;">    
                        <input class="nui-dictcombobox" name="machineApply.area" id="area"  readonly="readonly" dictTypeId="EXP_REGION" required="true" emptyText="请选择" />
                    </td>
            	</tr>
            	<tr>
            		<td style="width:120px;" align="right">管理方式：</td>
                    <td style="width:150px;">    
                        <input class="nui-dictcombobox" name="machineApply.storagetype"  readonly="readonly"  id="storageType" dictTypeId="MIS_MA_STORAGE" required="true" onvaluechanged="onNameFilterChanged(this.value)" emptyText="请选择"/>
                    </td>
                    <td style="width:120px;" align="right">数量：</td>
                    <td style="width:150px;">    
                        <input name="machineApply.num" id="num" readonly="readonly" class="nui-textbox" required="true" maxLength="10"/>
                    </td>
            		<td style="width:120px;" align="right">购买总金额：</td>
	                <td style="width:150px;"> 
	                 	<input name="machineApply.price" id="price" class="nui-spinner" format="n2" required="true"allowLimitValue="false" onvaluechanged="calbenemon" changeOnMousewheel="false"  showbutton="false"/>	                   
	                </td>
            	</tr>
            	<tr id="temp">
                	<td width="120px" align="right">负责人：</td>
                    <td width="150px">    
						<input property="editor" name="machineApply.usingemp" id="usingemp" class="nui-buttonedit" onbuttonclick="showEmployee" showClose="false" required="true" allowInput="false" />
                    </td>
                    <td width="120px" align="right">所属部门：</td>
                    <td width="150px">    
                        <input property="editor" name="machineApply.dept" id="deptname" class="nui-buttonedit" value="" text="" onbuttonclick="showDept" showClose="false" required="true" allowInput="false"   />
                    </td>
                    <td width="120px" align="right">所属项目：</td>
                    <td width="150px">    
                        <input property="editor" name="machineApply.projectno" id="projectno" class="nui-buttonedit" value="" text="" onbuttonclick="selectProject" showClose="false"  />
                    </td>
            	</tr>
            	<tr>
	            	<td style="width:120px;" align="right">购买日期：</td>
                    <td style="width:150px;">    
	                    <input name="machineApply.buytime" id="buytime" class="nui-datepicker"  onvaluechanged="onBuytimeChanged" required="true"/>
	                </td>
            		<td width="120px" align="right">资产交付日期：</td>
                    <td sytle="width:150px;" align="left">
                    	<input property="editor" name="machineApply.startusedate" id="startusedate"  onvaluechanged="onStartuseChanged" required="true" class="nui-datepicker">
                    </td>
            	</tr>
            	<tr>
            		<td style="width:120px;" align="right">型号：</td>
                    <td style="width:200px;" colspan="5">    
                        <input name="machineApply.model" id="model" style = "width: 680px;"  onvaluechanged="onModelChanged" class="nui-textbox" required="false" maxLength="50"/>
                    </td>
            	</tr>
            	<tr>
                    <td style="width:120px;" align="right">配置：</td>
                    <td style="width:200px;" colspan="5">    
                        <input name="machineApply.configuration"  style = "width: 680px;height:40px"  onvaluechanged="onConfigChanged" id="configuration" class="nui-textarea" required="false" maxLength="500"/>
                    </td>
            	</tr>
            	<tr>
            		<td style="width:120px;" align="right">采购途径：</td>
                    <td style="width:200px;" colspan="5">    
                        <input name="machineApply.purmeans" id="purmeans" readonly="readonly"  style = "width: 680px;height:40px" class="nui-textarea" required="false" maxLength="500"/>
                    </td>
            	</tr>
                <tr>
                	<td style="width:120px;" id="third31" align="right">备注：</td>
                    <td style="width:150px;" colspan="5">    
                        <input name="machineApply.remarks" id="remarks" class="nui-textarea" onvaluechanged="onRemarkChanged" style="width:680px;" required="false"/>
                    </td>
				</tr>
            </table>
		</fieldset>
		</div>
		<div>是否入库<input type="checkbox"  id="checkbox1" checked="checked" onclick="toggleFieldSet(this, 'fd2')"/></div> 
		<!--行政入库展示信息  -->
		<fieldset  id="fd2" style="border:solid 1px #aaa;padding:3px;">
			<legend>资产入库信息</legend>
			<div id="formMachine">
				<input name="machine.fileids" id="fileids1"  class="nui-hidden"/>
				<input name="machine.operator" id="operator" class="nui-hidden"/>
				<input name="machine.operatingTime" id="operatingTime"class="nui-hidden">
	            <table style="table-layout:fixed;" id="table_file">
	            	<tr>
	            		<td style="width:120px;" align="right">资产类型：</td>
	                    <td style="width:150px;">    
	                        <input class="mini-dictcombobox" name="machine.type"  readonly="readonly" id="matype" dictTypeId="MIS_MA_TYPE" required="true" emptyText="请选择" onvaluechanged="onTypeFilterChanged"/>
	                    </td>
	                    <td style="width:120px;" align="right">子类型：</td>
	                    <td style="width:150px;">
	                        <input class="nui-combobox" name="machine.secType"  readonly="readonly" id="masectype" required="true" emptyText="请选择" valueField="dictID" textField="dictName" parentField="parentId"/>
	                    </td>
	                    <td width="120px" align="right">资产分类：</td>
	                    <td width="150px">
	                    	<input property="editor"  name="machine.isguoteng" id="guoteng"class="nui-dictcombobox" dictTypeId="MIS_MA_GUOTENG" required="true" allowInput="false" onvaluechanged="getGuoTeng"/>
	                    </td>
	            	</tr>
					<tr>
	                    <td align="right">资产编号：</td>
	                    <td colspan="3">    
	                        <input name="machine.assetnum" id="assetnum" style="width: 400px;"class="nui-textbox" required="true"/>
	                    </td>
	                    <td align="right" id="maprojectno1">资产项目：</td>
	                    <td >    
	                        <input property="editor" name="machine.projectno" id="maprojectno" class="nui-buttonedit" value="" text="" onbuttonclick="selectProject" showClose="false"  />
	                    </td>
		            </tr>
	            	<tr>
	            		<td align="right">资产单价：</td>
		                <td> 
		                 	<input name="machine.price" id="maprice" class="nui-spinner" format="n2" required="true"allowLimitValue="false" onvaluechanged="calbenemon" changeOnMousewheel="false"  showbutton="false"/>	                   
		                </td>
	                    <td align="right">税率(例：0.16)：</td>
	                    <td>    
	                        <input name="machine.productrate" id="productrate" class="nui-textbox" required="true"  onvaluechanged="getAssetAmount"/>
	                    </td>
	            		<td align="right">发票类型：</td>
	                	<td>    
	                        <input property="editor" name="machine.invoiceType" id="invoiceType" class="nui-dictcombobox" dictTypeId="MIS_MA_INVOICETYPE" required="true" allowInput="false" emptyText="请选择" onvaluechanged="getAssetAmount"/> 
	                    </td>
	            	</tr>
		            <tr>
		                <td style="width:120px;" align="right">资产原值：</td>
	                    <td style="width:150px;">    
	                        <input name="machine.assetAmount" id="assetAmount"class="nui-textbox" required="true" onvaluechanged="depreciableAmountComp"/>
	                    </td>
		                <td style="width:120px;" align="right">折旧期限 (月)：</td>
	                    <td style="width:150px;"> 
		                 	<input name="machine.depreciableTime" id="depreciableTime" class="mini-dictcombobox" required="true" dictTypeId="MIS_MA_DTIME" vtype="int" onvaluechanged="depreciableAmountComp" emptyText="请选择"/>	                   
		                </td>   	 
		                <td style="width:120px;" align="right">月折旧额：</td>
		                <td style="width:150px;"> 
		                 	<input name="machine.depreciableAmount" id="depreciableAmount" class="nui-textbox" emptyText="自动计算" required="true" vtype="int" allowInput="false" value="" enabled="false"/>	                   
		                </td>           	                
	                </tr>
	            	<tr>
		            	<td style="width:120px;" align="right">购买日期：</td>
	                    <td style="width:150px;">    
		                    <input name="machine.buytime" id="mabuytime" class="nui-datepicker" readonly="readonly" required="true"/>
		                </td>
	            		<td width="120px" align="right">资产领取日期：</td>
	                    <td sytle="width:150px;" align="left">
	                    	<input property="editor" name="machine.startusedate" id="mastartusedate" readonly="readonly" required="true" class="nui-datepicker">
	                    </td>
	            		<td style="width:120px;" align="right">品牌：</td>
	                    <td style="width:150px;" >    
	                        <input name="machine.brand" id="brand" class="nui-textbox" required="false"/>
	                    </td>
	            	</tr>
	            	<tr>
	            		<td style="width:120px;" align="right">管理方式：</td>
	                    <td style="width:150px;">    
	                        <input class="nui-dictcombobox" name="machine.storageType"  readonly="readonly" id="mastorageType" dictTypeId="MIS_MA_STORAGE" required="true" onvaluechanged="onNameFilterChanged(this.value)" emptyText="请选择"/>
	                    </td>
	                    <td style="width:120px;" align="right">区域：</td>
	                    <td style="width:150px;">    
	                        <input class="nui-dictcombobox" name="machine.area"  readonly="readonly" id="maarea" dictTypeId="EXP_REGION" required="true" emptyText="请选择" />
	                    </td>
		                <td style="width:120px;" id="third21" align="right">保修时间(月)：</td>
	                    <td style="width:150px;"> 
		                 	<input name="machine.warrantyTime" id="warrantyTime" class="mini-dictcombobox" dictTypeId="MIS_MA_DTIME" vtype="int"/>	                   
		                </td>
	            	</tr>
	            	<tr id="temp1">
	                	<td width="120px" align="right">负责人：</td>
	                    <td width="150px">    
							<input property="editor" name="machine.usingemp" id="mausingemp" readonly="readonly" class="nui-buttonedit" onbuttonclick="showEmployee" showClose="false" required="true" allowInput="false" />
	                    </td>
	                    <td width="120px" align="right" id="madept1">所属部门：</td>
	                    <td width="150px" colspan="3"  id="madept2" >    
	                        <input property="editor" name="machine.dept" id="madeptname" readonly="readonly" class="nui-buttonedit" value="" text="" onbuttonclick="showDept" showClose="false" required="true" allowInput="false"   />
	                    </td>
	            	</tr>
	            	<tr>
	                    <td style="width:120px;" align="right">操作系统：</td>
	                    <td style="width:150px;">    
	                        <input name="machine.operatingSystem" id="operatingSystem" class="nui-textbox" required="false"/>
	                    </td>
	                    <td style="width:120px;" align="right">用途：</td>
	                    <td style="width:150px;" colspan="3">    
	                        <input name="machine.using" id="using" style="width: 400px;" class="nui-textbox" required="false"/>
	                    </td>
		            </tr>
	            	<tr>
		                <td style="width:120px;" align="right">存放物理地址：</td>
	                    <td style="width:500px;" colspan="5">    
	                        <input name="machine.address" id="address" class="nui-textbox" style="width:680px;" maxLength="100"/>
	                    </td>
	            	</tr>
	            	<tr>
	            		<td style="width:120px;" align="right">型号：</td>
	                    <td style="width:200px;" colspan="5">    
	                        <input name="machine.model" id="mamodel" readonly="readonly" style = "width: 680px;" class="nui-textbox" required="false" maxLength="50"/>
	                    </td>
	            	</tr>
	            	<tr>
	                    <td style="width:120px;" align="right">配置：</td>
	                    <td style="width:200px;" colspan="5">    
	                        <input name="machine.configuration" readonly="readonly" style = "width:680px;height:40px" id="maconfiguration" class="nui-textarea" required="false" maxLength="500"/>
	                    </td>
	            	</tr>
	                <tr>
	                	<td id="third31" align="right">备注：</td>
	                    <td colspan="5">    
	                        <input name="machine.remarks" id="maremarks" readonly="readonly" class="nui-textarea" style="width:680px;" required="false"/>
	                    </td>
					</tr>
	            </table>
	    	</div>
		</fieldset>
		<jsp:include page="/ame_common/misOpinion.jsp"/>
	</div>
	<div style="text-align: center;padding: 10px;" class="nui-toolbar">
		<a class="nui-button" onclick="onOk" style="width:60px;margin-right:20px;" id="sureButton">提交</a>
		<a class="nui-button" onclick="onCancel('cancel')" style="width:60px;" id="canelButton">关闭</a>
	</div>
</div>
</body>
<script type="text/javascript">
	nui.parse();
	
  	var form = new nui.Form("#form1");//申请信息
  	var formMachine = new nui.Form("#formMachine");//入库信息
  	var opioionform = new nui.Form("opioionform");//审核意见
  	
  	var isStorage;//是否入库
	//产品税率
	var  productrate  = parseFloat(nui.getDictText('AME_SYSCONF','PRODUCTRATE'));
  	
	<%long workItemID = (Long)request.getAttribute("workItemID"); %>
  	document.getElementById("opinionHide").style.display="none";
  	
	//获取资产申请相关数据
	<%
   		UserObject user = (UserObject) session.getAttribute("userObject");
   		String username = user.getUserName();
   		String userno = user.getUserId();
   		Map<String,Object> a = user.getAttributes();
	%>
	
	var machineApply;
	
	init();
	function init(){
		form.mask("数据加载中...");
		promptInit({workItemID: <%=workItemID %>});//流程提示信息
  		var json = {workItemID: <%=workItemID %>};
  		nui.ajax({//获取资产采购申请信息
      		url: "com.primeton.eos.machine.machineProcess.getMachineApply.biz.ext",
	      	type: 'POST',
          	data: json,
      		success: function (o){
      			form.unmask();
       	  		form.setData(o);
       	  		machineApply=o.machineApply;
				nui.get("usingemp").setText(o.machineApply.usingempname);
				nui.get("deptname").setText(o.machineApply.deptname);
				nui.get("projectno").setText(o.machineApply.projectno);
				nui.get("sectype").load(o.machineApply.childType);
  				var processInstID = o.machineApply.processinstid;
  				if("2" == o.machineApply.storagetype){
  					$("#temp").hide(0.01);
  					$("#temp1").hide(0.01);
  				}else{
  					$("#temp,#temp1").css({
  						"display":""
  					});
  				}
  				nui.get("guoteng").setValue("0");//默认非资产项目
  				nui.get("isStorage").setValue("1");
	    		nui.get("operatingTime").setValue(new Date());
	    		nui.get("operator").setValue("<%=userno %>");
    			nui.get("productrate").setValue(productrate);
				nui.get("depreciableTime").disable();
				nui.get("assetAmount").disable();
				nui.get("matype").setValue(o.machineApply.type);
				nui.get("masectype").load(o.machineApply.childType);
				nui.get("masectype").setValue(o.machineApply.sectype);
				var price = parseFloat(o.machineApply.price);
				var num = parseFloat(o.machineApply.num);
				nui.get("maprice").setValue(price/num);
				nui.get("maarea").setValue(o.machineApply.area);
				nui.get("mastorageType").setValue(o.machineApply.storagetype);
				showMaEmpAndOrg(o.machineApply.storagetype);
				nui.get("mamodel").setValue(o.machineApply.model);
				nui.get("maconfiguration").setValue(o.machineApply.configuration);
				nui.get("maremarks").setValue(o.machineApply.remarks);
				setDepreTime(o.machineApply.type);//设置折旧期限
				getAssetnum(parseFloat(o.machineApply.num));//获取资产编号  
				document.getElementById("maprojectno").style.display = "none";
				document.getElementById("maprojectno1").style.display = "none";
  				//查询审核意见
				var grid = nui.get("datagrid1");
				grid.sortBy("time", "desc");
				grid.load({processInstID: processInstID});
				
				//悬挂意见保存
				nui.get("workitemid").setValue(<%=workItemID %>);	//工作项ID
				nui.get("processinstid").setValue(processInstID);	//审核意见流程实例ID
               	nui.get("processinstname").setValue(o.workitem.processInstName);
               	nui.get("activitydefid").setValue(o.workitem.activityDefID);
               	nui.get("workitemname").setValue(o.workitem.workItemName);
				
				
				//审核结果设置
				initMisOpinion({auditstatus: "4"});
				nui.get("auditopinion").setValue("");
			
          	},
	      	error: function (jqXHR, textStatus, errorThrown) {
	        	alert(jqXHR.responseText);
	      	}
    	});
	}
	
	function onOk(){
		isStorage = nui.get("isStorage").getValue();
		if(!form.validate()){
			nui.alert("信息录入不完整！");
	    	return;
		}
		if("1" == isStorage){
			if(!formMachine.validate()){
				nui.alert("信息录入不完整！");
		    	return;
			}
		}
		nui.confirm("确定提交流程吗？", "操作提示",function (action) {            
            if (action == "ok") {
            	nui.get("sureButton").setEnabled(false);
				SaveData1();
            }
        });
	}
	function SaveData1(){
		var mis = form.getData();//行程列表
		var form_Machine = formMachine.getData();//行程列表
		if("1" == isStorage){
			mis.machineApply.state="3";//流程状态“已入库”
		}else{
			mis.machineApply.state="1";//流程状态“已交付”
		}
		var misOpinion = opioionform.getData().misOpinion;//审核意见
		var json = {machineApply:mis.machineApply,machine:form_Machine.machine,misOpinion:misOpinion};
    	mini.mask({
            el: document.body,
            cls: 'mini-mask-loading',
            html: '提交中...'
        });
    	nui.ajax({
            url: "com.primeton.eos.machine.machineProcess.machinePut.biz.ext",
            data: json,
            type: 'POST',
            cache: false,
            contentType: 'text/json',
            success: function (text) {
            	nui.unmask(document.body);
        		var returnJson = nui.decode(text);
              	if(returnJson.result == "success"){
    				nui.alert("提交成功","系统提示",function(){
		        		CloseWindow("ok");
		        	});
              	}else{
					nui.alert("提交失败，请联系信息技术部人员！","系统提示", function(action){
						nui.get("sureButton").setEnabled(true);
					});
				}
            },
            error: function (jqXHR, textStatus, errorThrown) {
                nui.alert(jqXHR.responseText);
                CloseWindow();
            }
        });
	}
	
	function toggleFieldSet(ck, id) {
        var dom = document.getElementById(id);
        dom.className = !ck.checked ? "hideFieldset" : "";
        if(ck.checked==false){
        	nui.get("isStorage").setValue("0");
        }
        if(ck.checked==true){
        	nui.get("isStorage").setValue("1");
        }
    }
	function setDepreTime(type){
		if(type == "EPC" || type == "W" || type == "Q"){
    		nui.get("depreciableTime").setValue(36);
    	} else if(type == "V" || type =="B" || type =="A"){
    		nui.get("depreciableTime").setValue(60);
    	} else {
    		nui.get("depreciableTime").setValue(1);
    	}
	}
	function getAssetnum(num){
		var machineassetnum="";
    	var assetnum = nui.get("assetnum");
    	var type = nui.get("type").getValue();
    	var area = nui.get("area").getValue();
    	var sectype = nui.get("sectype").getValue();
    	if(area == null || area == "" || type == null || type == "" || sectype == null || sectype == ""){
    		return;
    	}
    	var tempTitle = "";
    	var tempLength = 0;
		if(area == 1){
			tempTitle = "BJ" + sectype;
		} else if(area == 3){
			tempTitle = "GZ" + sectype;
		} else if(area == 4){
			tempTitle = "XA" + sectype;
		} else if(area == 5){
			tempTitle = "CD" + sectype;
		} else if(area == 6){
			tempTitle = "WH" + sectype;
		} else if(area == 7){
			tempTitle = "NJ" + sectype;
		} else if(area == 8){
			tempTitle = "JN" + sectype;
		} else if(area == 9){
			tempTitle = "SZ" + sectype;
		} else {
			if(type == "V" || type == "X"){
				tempTitle = type;
			} else {
	    		tempTitle = sectype;
			}
    		if(type == "EPC"){
    			if(sectype == "EPCDT" || sectype == "EPCNB"){
    				tempLength = 8;	
    			} else {
    				tempLength = 9;
    			}
    		} else {
    			tempLength = 5;
    			if(type == "V" || type == "X"){
    				tempLength = 4;
    			} 
    		}
		}

		if(area != 2){
			if(type == "V" || type == "X"){
				tempTitle = tempTitle.substring(0,3);
				tempLength = 6;
			} else if(type == "EPC"){
				if(sectype == "EPCDT" || sectype == "EPCNB"){
					tempLength = 10;	
				} else {
					tempLength = 11;
    			}
			} else {
				tempLength = 7;
			}
		}
		if (tempTitle == "")  {return;}
		var json = {tempTitle:tempTitle,tempLength:tempLength};
		var data =getAssetNum(json);
		if(num == 1){
			machineassetnum = data;
		}else if (num >1){
			var dataUnion = data.substring(0,tempLength-3)
			var datanum=data.substring(tempLength-3,tempLength);
			var dataint = parseInt(datanum);
			for(i=0;i<num;i++){
				if(i==0){
					machineassetnum=machineassetnum+data;
				}else{
					dataint = dataint+1;
					if(dataint<100){
						data =dataUnion + "0" + dataint;
					}else{
						data =dataUnion + "" + dataint;
					}
					machineassetnum=machineassetnum+","+data;
				}
			}
		}
    	assetnum.setValue(machineassetnum);
	    nui.get("assetnum").validate();
    }
    
    function getAssetNum(json){
    	var data;
    	nui.ajax({
    		url: "com.primeton.eos.machine.machine.getAssetnum.biz.ext",
            data: json,
            type: 'POST',
            cache: false,
            async:false,
            contentType: 'text/json',
            success: function(o){
				data = o.assetnum;
            }
		});
		return data;
    }
		
	function onTypeFilterChanged(e){
    	var tempType = e.value;
    	setDepreTime(tempType);
    	var json = {parentId:tempType};
    	nui.ajax({
    		url: "com.primeton.eos.machine.machine.getSecType.biz.ext",
            data: json,
            type: 'POST',
            cache: false,
            contentType: 'text/json',
            success: function(o){
				var data = o.childType;
				var secType = nui.get("sectype");      	
				secType.load(data);
				secType.select(0);
            }
    	});
    }
    
    function onNameFilterChanged(e){
    	var tempType=e;
    	showEmpAndOrg(tempType);
    }
    
    function showEmpAndOrg(tempType){
		nui.get("usingemp").setValue("");
		nui.get("deptname").setValue("");
    	if(tempType == 2){   		
			document.getElementById("temp").style.display = "none";
    		nui.get("usingemp").setRequired(false);    
    		nui.get("deptname").setRequired(false);    
    	}else {
    		document.getElementById("temp").style.display = "";
    		nui.get("usingemp").setRequired(true);    
    		nui.get("deptname").setRequired(true);    
    	} 
    }
    
    function showMaEmpAndOrg(tempType){
    	if(tempType == 2){   		
			document.getElementById("temp1").style.display = "none";
    	}else if(tempType == 0){
    		document.getElementById("temp1").style.display = "";
    		document.getElementById("madept1").style.display = "none";
    		document.getElementById("madept2").style.display = "none";
			nui.get("mausingemp").setValue(machineApply.usingemp);
			nui.get("mausingemp").setText(machineApply.usingempname);
    	}else {
    		document.getElementById("temp1").style.display = "";
    		document.getElementById("madept1").style.display = "";
    		document.getElementById("madept2").style.display = "";
			nui.get("mausingemp").setValue(machineApply.usingemp);
			nui.get("mausingemp").setText(machineApply.usingempname);
			nui.get("madeptname").setValue(machineApply.dept);
			nui.get("madeptname").setText(machineApply.deptname);
    	} 
    }
    
    function showEmployee(e) {
        var btnEdit = this;
        nui.open({
			url:"<%=request.getContextPath() %>/machine/SelectEmployee.jsp",
			title: "选择列表",
			width: 600,
			height: 400,
			ondestroy: function (action) {
				if (action == "ok") {
					var iframe = this.getIFrameEl();
					var data = iframe.contentWindow.GetData();
					data = nui.clone(data);    //必须
					if (data) {
		                btnEdit.setValue(data.userid);
		                btnEdit.setText(data.empname);
		                nui.get("mausingemp").setValue(data.userid);
		                nui.get("mausingemp").setText(data.empname);
		                var temp2=nui.get("deptname");
		                temp2.setValue(data.orgid);
		                temp2.setText(data.orgname);
		                nui.get("madeptname").setValue(data.orgid);
		                nui.get("madeptname").setText(data.orgname);
					}
				}
				nui.get("usingemp").validate();
				nui.get("deptname").validate();
				nui.get("mausingemp").validate();
				nui.get("madeptname").validate();
			}
		});
	}
	
    function showDept(e){
    	var btnEdit = this;
		nui.open({
            url:"<%=request.getContextPath() %>/machine/SelectOrganization.jsp",
			title: "选择列表",
			width: 650,
			height: 380,
			ondestroy: function (action) {
                //if (action == "close") return false;
                if (action == "ok") {
                    var iframe = this.getIFrameEl();
                    var data = iframe.contentWindow.GetData();
                    data = nui.clone(data);    //必须克隆
                    if (data) {                   	
						btnEdit.setValue(data.orgid);
		                btnEdit.setText(data.orgname);
		                nui.get("madeptname").setValue(data.orgid);
		                nui.get("madeptname").setText(data.orgname);
                    }
                }
				nui.get("deptname").validate();
				nui.get("madeptname").validate();
			}
        });
    }
	//选择项目
	function selectProject(){
		var btnEdit = this;
        nui.open({
            url:"<%=request.getContextPath()%>/ame_common/SelectProject.jsp?preSettle=bukongzhi",
            title: "选择项目",
            width: 850,
            height: 420,
            ondestroy: function (action) {
                if (action == "ok") {
                    var iframe = this.getIFrameEl();
                    var data = iframe.contentWindow.GetData();
                    data = nui.clone(data);
                    if (data) {
                        btnEdit.setValue(data.projectno);
                        btnEdit.setText(data.projectno);
                    }
				}
			}
        });
	}
	function onBuytimeChanged(e){
		nui.get("mabuytime").setValue(e.value);
	}
	
	function onStartuseChanged(e){
		nui.get("mastartusedate").setValue(e.value);
	}
	function onModelChanged(e){
		nui.get("mamodel").setValue(e.value);
	}
	function onConfigChanged(e){
		nui.get("maconfiguration").setValue(e.value);
	}
	function onRemarkChanged(e){
		nui.get("maremarks").setValue(e.value);
	}
	function calbenemon(e){
		var price = parseFloat(e.value);
		var num = parseFloat(nui.get("num").getValue());
		nui.get("maprice").setValue(price/num);
		getAssetAmount();
	}
	
	//获取资产原值
    function getAssetAmount(){
		//产品税率
		var  productrate1  = nui.get("productrate").getValue();
    	var amount = 0;
    	var price = nui.get("maprice").getValue();
    	var invoiceType = nui.get("invoiceType").getValue();
    	var assetAmount = nui.get("assetAmount");
    	if(invoiceType == 0){
    		amount = price;
    		assetAmount.setValue(amount);
    	}else if(invoiceType == 1){
    		amount = (price / (1+parseFloat(productrate1))).toFixed(2);
    		assetAmount.setValue(amount);
    	}
    	depreciableAmountComp(); 
    }
    //计算折旧金额
    function depreciableAmountComp(e){
    	var machinePrice=nui.get("assetAmount").value;
    	var depreciableTime=nui.get("depreciableTime").value;
    	var depreciableAmount = 0;
    	if(isNumeric(machinePrice)){
    		depreciableAmount = (machinePrice/depreciableTime).toFixed(2);
    		nui.get("depreciableAmount").setValue(depreciableAmount);
    	}else{
    		nui.get("depreciableAmount").setValue(null);
    	}   			
    }
    function isNumeric(value){
    	if(value == null || isNaN(value) || value<=0 || value.indexOf(" ")!=-1){
    		return false;
    	}else{
    		return true;	
    	}
    }
	function getGuoTeng(e) {
    	var tempGuoTeng = e.value;
    	nui.get("maprojectno").setValue("");
    	nui.get("maprojectno").setText("");
    	if (tempGuoTeng == "1") {
    		nui.get("maprojectno").setRequired(true);
			document.getElementById("maprojectno").style.display = "";
			document.getElementById("maprojectno1").style.display = "";
    	}else if (tempGuoTeng == "0") {
    		nui.get("maprojectno").setRequired(false);   
			document.getElementById("maprojectno").style.display = "none";
			document.getElementById("maprojectno1").style.display = "none";
    	}
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
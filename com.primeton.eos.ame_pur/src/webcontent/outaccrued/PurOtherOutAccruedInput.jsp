<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@page import="com.eos.data.datacontext.UserObject"%>
<%
	String contextPath=request.getContextPath();
 %>
<html>
<!-- 
  - Author(s): zyl
  - Date: 2016-05-31 18:11:50
  - Description:
-->
<head>
	<title>新增非人力外包计提</title>
	<meta http-equiv="content-type" content="text/html; charset=UTF-8" />
	<script src="<%= request.getContextPath() %>/common/nui/nui.js"
		type="text/javascript"></script>
	<script src="../common/nui/nui.js" type="text/javascript"></script>
	<style type="text/css">
	    body{
	        margin:0;padding:0;border:0;width:100%;height:100%;overflow:hidden;
	    }
    </style>
</head>
<body>
	<div class="nui-fit">
		<form id="form1" method="post">
			<fieldset id="field1" style="border:solid 1px #aaa;padding:3px;">
				<legend>采购计提基本信息</legend>
				<div style="padding:5px;">
			 		<input name="purpresettle.fileids" id="fileids" class="nui-hidden"/>
					<input name="purpresettle.accruedid" id="accruedid"  class="nui-hidden"/>
					<input name="purpresettle.accrueddate" id="accrueddate" class="nui-hidden" format="yyyy-MM-dd"/>
					<input name="purpresettle.premonth" id="premonth" class="nui-hidden" />
					<table style="table-layout:fixed;" id="table_file">
						<tr>
							<td align="right" style="width:120px;">所属事业部：</td>
							<td><input name="purpresettle.syb" id="syb" class="nui-dictcombobox" dictTypeId="CONT_ORG" style="width:110px" /></td>
							<td align="right" style="width:120px;">供应商：</td>
							<td><input name="purpresettle.custid" id="custid" class="nui-buttonedit" style="width:280px" /></td>
						</tr>
						<tr>
							<td align="right" style="width:120px;">项目：</td>
							<td><input name="purpresettle.projectno" id="projectno" required="true" class="nui-buttonedit" style="width:280px"/></td>
							<td align="right" style="width:120px;">所属客户：</td>
							<td>
								<input id="miscustid" class="nui-buttonedit" textField="orgname" valueField="orgid" style="width:280px"/>
							</td>	
						</tr>
						<tr>
							<td align="right" style="width:120px;">所属销售：</td>
							<td>
								<input name="purpresettle.salesid" id="salesid" class="nui-buttonedit" textField="orgname" valueField="orgid" style="width:100px"/>
							</td>
							<td align="right" style="width:120px;">成本类型：</td>
							<td><input name="purpresettle.costtype" id="costtype" class="nui-dictcombobox" required="false" style="width:100px" dictTypeId="AME_CONTCOSTTYPE"/></td>
						</tr>
						<tr>
							<td align="right" style="width:120px;">采购合同：</td>
							<td><input name="purpresettle.purcontnum" id="purcontnum" textField="purcontname" valueField="purcontnum" showNullItem="true" class="nui-combobox" style="width: 200px" /></td>
							<td align="right" style="width:120px;">财务对应合同：</td>
							<td><input name="purpresettle.contnum" id="contnum" onbuttonclick="selectcontnum" class="nui-buttonedit" required="false" style="width:150px" allowInput="false"/></td>
						</tr>
						<tr>
							<td align="right" style="width:120px;">计提开始日期：</td>
							<td><input name="purpresettle.startdate" id="startdate" required="true" onvaluechanged="startandend('start')" class="nui-datepicker" required="false" style="width:100px"/></td>
							<td align="right" style="width:120px;">计提结束日期：</td>
							<td><input name="purpresettle.enddate" id="enddate" required="true" onvaluechanged="startandend('end')" class="nui-datepicker" required="false" style="width:100px" /></td>
						</tr>
						<tr>
							<td align="right" style="width:120px;">计提金额(元)：</td>
							<td><input name="purpresettle.accruedmoney" id="accruedmoney" onblur="changeMoney" inputStyle="text-align:right;" class="nui-spinner" required="true" style="width:150px" allowLimitValue="false" changeOnMousewheel="false" ShowButton="false" /></td>
							<td align="right" style="width:120px;">计提状态：</td>
							<td><input name="purpresettle.accruedstatus" id="accruedstatus" class="nui-dictcombobox" required="false" style="width:90px" dictTypeId="AME_ACCRUEDSTATUS" value="0"/></td>
						</tr>
						<tr>
							<td align="right" style="width:120px;">计提税率：</td>
							<td><input name="purpresettle.taxrate" id="taxrate" inputStyle="text-align:right;" class="nui-spinner" required="true" style="width:50px" onblur="changetax" allowLimitValue="false" changeOnMousewheel="false" ShowButton="false"/> %</td>
							<td align="right" style="width:120px;">计提不含税金额(元)：</td>
							<td><input name="purpresettle.notaxmoney" id="notaxmoney" inputStyle="text-align:right;" class="nui-textbox" required="false" style="width:90px" readOnly="readOnly" /></td>
						</tr>
						<tr>
							<td align="right" style="width:120px;">工作量单位：</td>
							<td><input name="purpresettle.workunit" id="workunit" value="1" class="nui-dictcombobox" dictTypeId="SERV_NUM_TYPE" required="false" style="width: 80px" /></td>
							<!-- 工作量数量 -->
							<td align="right" style="width:120px;">工作量数量：</td>
							<td><input name="purpresettle.workamount" id="workamount" class="nui-spinner" showButton="false" 
								allowLimitValue="false" changeOnMousewheel="false" style="width: 100px;" 
								inputStyle="text-align: left" /></td>
						</tr>
						<tr id="hide1">
							<td align="right" style="width:120px;">计提人员：</td>
							<td><input name="purpresettle.opername" id="opername" class="nui-textbox" required="false" style="width:100px" readOnly="readOnly" /></td>
							<td></td>
							<td></td>
						</tr>
						<tr>
							<td align="right" style="width:120px;">备注：</td>
							<td colspan="3"><input name="purpresettle.comment" id="comment" class="nui-textarea" required="false" style="height:40px;width:650px"/></td>
						</tr>
					</table>
				</div>
			</fieldset>
		</form>
		<jsp:include page="/ame_common/inputFile.jsp" />
	</div>
	<div style="text-align:center;padding:10px;" class="nui-toolbar">
		<a class="nui-button" onclick="onOk" style="width:60px;margin-right:20px;" id="sureButton">保存</a>
		<a class="nui-button" onclick="onCancel('cancel')" style="width:60px;" id="canelButton">关闭</a>
	</div>

	<script type="text/javascript">
		nui.parse();
		//更新逻辑流路径
		var updateURL = "com.primeton.eos.ame_pur.outaccrued.updatePurPresettle.biz.ext";
        //新增逻辑流路径
    	var addURL = "com.primeton.eos.ame_pur.outaccrued.addPurPresettle.biz.ext";
    	var saveURL = "";
	  	var form = new nui.Form("form1");
	  	//财务对应的原合同编号
	  	var oldContnum;
		init();
		function init(){
			var accrueddate = nui.get("accrueddate");
			accrueddate.setValue(new Date());
			accrueddate.disable();
			nui.get("miscustid").setReadOnly(true);
			nui.get("salesid").setReadOnly(true);
			nui.get("projectno").setReadOnly(true);
			nui.get("custid").setReadOnly(true);
			//nui.get("syb").setReadOnly(true);
			nui.get("purcontnum").setReadOnly(true);
			
			nui.get("miscustid").setShowButton(false);
			nui.get("salesid").setShowButton(false);
			nui.get("projectno").setShowButton(false);
			nui.get("custid").setShowButton(false);
			//nui.get("syb").setShowButton(false);
			nui.get("purcontnum").setShowButton(false);
			
			<%
		   		UserObject user = (UserObject) session.getAttribute("userObject");
		   		String username = user.getUserName();
		   		String userno = user.getUserId();
		   		
		    %>
		    //计提人员
		    nui.get("opername").setValue("<%=username %>");
			
		}
		
	  	//赋值
	  	var getTaxRate = 0;
	  	function SetData(data){
	    	data = nui.clone(data);
	    	if(data.action == "DetailPurContractAdd"){
	    		//事业部
	    		//nui.get("syb").setValue(data.datarow.belongto);
	    		//供应商
	    		nui.get("custid").setValue(data.datarow.purSupplierCustid);
	    		nui.get("custid").setText(data.datarow.purSupplierCustname);
	    		//客户
	    		nui.get("miscustid").setValue(data.datarow.custid);
	    		nui.get("miscustid").setText(data.datarow.custname);
	    		//项目
	    		nui.get("projectno").setValue(data.datarow.projectno);
	    		nui.get("projectno").setText(data.datarow.projectName);
	    		//所属销售
	    		nui.get("salesid").setValue(data.datarow.finUnitId);
	    		nui.get("salesid").setText(data.datarow.orgname);
	    		//采购合同编号
	    		nui.get("purcontnum").setValue(data.datarow.purcontnum);
	    		nui.get("purcontnum").setText(data.datarow.purcontname);
	    		//财务合同编号-默认为销售合同编号
	    		nui.get("contnum").setValue(data.datarow.outcontnum);
	    		nui.get("contnum").setText(data.datarow.outcontnum);
	    		//成本说明
	    		nui.get("costtype").setValue(data.datarow.costtype);
	    		//增加计提时，如果供应商是一般纳税人和为空的，则税率缺省为6%，其他纳税人为3%
            	if(data.datarow.istaxpayer == "n"){
            		//其他纳税人
            		nui.get("taxrate").setValue(3);
            	}else{
            		//一般纳税人
            		nui.get("taxrate").setValue(6);
            	}
    		}
    	}
    	
    	//保存
	  	function SaveData() {
            if(form.validate()){                         
	        	var accruedid = nui.get("accruedid").getValue();
	        	var saveURL = "";
				if(accruedid){
					saveURL = updateURL;
				} else{
					saveURL = addURL;
				}
				
				var o = form.getData();
	            o.purpresettle.taxrate = parseFloat(o.purpresettle.taxrate/100).toFixed(2);
	            //财务对应的原合同编号
	            o.purpresettle.oldContnum = oldContnum;
	            var json = nui.encode(o);
	            form.loading("保存中,请稍后...");
	            nui.ajax({
	                url: saveURL,
	                data: json,
	                type: 'POST',
	                cache: false,
	                contentType: 'text/json',
	                success: function (text) {
	                	form.unmask();
						var returnJson = nui.decode(text);
						if(returnJson.exception == null){
							if(saveURL == updateURL){
								nui.alert("保存成功!",null,function(){
									CloseWindow("ok");
								});
							}else{
								//保存成功后需要询问是否继续新增
								nui.showMessageBox({
						            title: "操作提示",
						            iconCls: "nui-messagebox-question",
						            buttons: ["yes", "no"],
						            message: "保存成功！是否继续新增?",
						            callback: function (action) {
						                if(action=="yes"){
						                	document.getElementById('filetable').innerHTML = "";
						                	//计提的开始日期
						                	nui.get("startdate").setValue("");
						                	//计提的截至日期
						                	nui.get("enddate").setValue("");
						                	//计提金额
						                	nui.get("accruedmoney").setValue(0);
						                	//计提不含税金额
						                	nui.get("notaxmoney").setValue(0);
						                	//计提的工作量单位
						                	nui.get("workunit").setValue("1");
						                	//计提的工作量数量
						                	nui.get("workamount").setValue(0);
						                	//计提备注
						                	nui.get("comment").setValue("");
						                	//计提状态
						                	nui.get("accruedstatus").setValue("0");
						                	//计提时间
						                	nui.get("accrueddate").setValue(new Date());
						                	//计提税率
						                	nui.get("taxrate").setValue(getTaxRate);
						                	//确认按钮
						                	nui.get("sureButton").setEnabled(true);
						                }else{
						                	CloseWindow("ok");	
						                }
						            }
						        });
							}
						}else{
							nui.alert("保存失败", "系统提示", function(action){
								if(action == "ok" || action == "close"){
									//CloseWindow("saveFailed");
								}
							});
						}        
	                },
	                error: function (jqXHR, textStatus, errorThrown) {
	                    alert(jqXHR.responseText);
	                    CloseWindow();
	                }
	               
	            });
	        }else{
	        	return;
	        }
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
        
		function onOk(){
			var startdate = nui.get("startdate").getValue();
        	var enddate = nui.get("enddate").getValue();
        	if(!startdate){
        		nui.alert("计提开始日期不能为空");
        		return;
        	}
        	if(!enddate){
        		nui.alert("计提结束日期不能为空");
        		return;
        	}
    		if(startdate > enddate){
    			nui.alert("计提开始日期:" + startdate.substring(0,10) + "不能大于计提结束日期:" + enddate.substring(0,10));
    			return;
        	}
	    	if(form.validate()){
        		nui.confirm("确认保存吗？", "确定？",
	            function (action) {            
	                if (action == "ok") {
	                	nui.get("sureButton").setEnabled(false);
		    			document.getElementById("fileCatalog").value="PurPresettle";
						form2.submit();
	    			}else{
						return;
					}
				});
	    	}else{
	    		return;
	    	}
	    }
    
        function onCancel(e) {
        	var data = form.getData();
        	if(data){
	        	nui.showMessageBox({
		            title: "关闭提示",
		            iconCls: "nui-messagebox-question",
		            buttons: ["yes", "no"],
		            message: "是否关闭？",
		            callback: function (action) {
		                if(action=="yes"){
		                	CloseWindow("cancel");
		                }
		            }
		        });
			}else{
				CloseWindow("cancel");
			}
        }
        
        //验证表单开始和截止日期
        function startandend(action){
        	var startdate = nui.get("startdate").getValue();
        	var enddate = nui.get("enddate").getValue();
        	if(startdate){
        		if(enddate){
	        		if(startdate > enddate){
	        			if(action == "start"){
		        			nui.alert("计提开始日期:" + startdate.substring(0,10) + "不能大于计提结束日期:" + enddate.substring(0,10));
		        			return;
	        			}else if(action == "end"){
	        				nui.alert("计提结束日期:" + enddate.substring(0,10) + "不能小于计提开始日期:" + startdate.substring(0,10));
		        			return;
	        			}
	        		}
        		}
        	}
        }
        
        //计提金额改变
        function changeMoney(){
        	//计提金额
        	var accruedmoney = nui.get("accruedmoney").getValue();
        	if(accruedmoney){
	        	accruedmoney = parseFloat(accruedmoney);
	        	//税率
	        	var taxrate = nui.get("taxrate").getValue();
	        	if(taxrate){
		        	taxrate = parseFloat(taxrate/100);
		        	//不含税金额
		        	var notaxmoney = parseFloat(accruedmoney/(1+taxrate)).toFixed(2);
		        	nui.get("notaxmoney").setValue(notaxmoney);
	        	}else{
	        		nui.get("notaxmoney").setValue(0);
	        	}
        	}else{
        		nui.get("notaxmoney").setValue(0);
        	}
        }
        
        //选择财务对应合同编号
        function selectcontnum(){
        	var btnEdit = this;
        	nui.open({
                url:"<%=request.getContextPath() %>/ame_common/contract_lookup.jsp",
                title: "选择销售合同",
                width: 1000,
                height: 550,
                allowResize: false,
                ondestroy: function (action) {
                    if (action == "ok") {
                        var iframe = this.getIFrameEl();
                        var data = iframe.contentWindow.GetData();
                        data = nui.clone(data);    //必须
                        if (data) {
                            btnEdit.setValue(data.text);
                            btnEdit.setText(data.text);
                        }
                    }
                }
            });
        }
        
        //修改税率
        function changetax(){
        	var accruedmoney = nui.get("accruedmoney").getValue();
        	if(accruedmoney){
	        	var taxrate = nui.get("taxrate").getValue();
	        	if(taxrate){
		        	accruedmoney = parseFloat(accruedmoney);
		        	taxrate = parseFloat(taxrate/100);
		        	taxrate = 1 + taxrate;
		        	var notaxmoney = accruedmoney/(taxrate);
		        	notaxmoney = parseFloat(notaxmoney).toFixed(2);
		        	nui.get("notaxmoney").setValue(notaxmoney);
	        	}else{
	        		nui.get("notaxmoney").setValue(0);
	        	}
        	}else{
        		nui.get("notaxmoney").setValue(0);
        	}
        }
	</script>
</body>
</html>
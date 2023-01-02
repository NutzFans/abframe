<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@include file="/purchase/common/common.jsp"%>
<html>
<head>
	<title>投标信息新建</title>
	<style type="text/css">
	    body{
	        margin: 0;padding: 0;border: 0;width: 100%;height: 100%;overflow: hidden;	
	    } 
    </style>
</head>
<body>
	<div class="nui-fit" >
		<div class="mini-panel" title=""   style="width: 100%;">
			<fieldset id="field1" style="border: solid 1px #aaa;padding: 3px;width: 100%;">
				<legend>投标信息</legend>
				<input name="files" id="fileids" class="nui-hidden"/>
				<form id="form_expRei" method="post">
					<input name="expusername" id="expusername" class="nui-hidden"/>
					<input name="senderusername" id="senderusername" class="nui-hidden"/>
					<input id="empid" class="nui-hidden" />
					<div style="padding: 5px;">
						<table style="table-layout: fixed;">
							<tr>
								<td align="right" style="width: 100px">投标牵头部门：</td>
								<td style="width: 210px;"><input name="orgId" id="orgId"
									class="nui-combobox" required="true"
									url="com.primeton.rdmgr.labor.labormgr.getAllOrgs.biz.ext"
									filterType="like" textField="orgname" valueField="orgid"
									dataField="allorgs" valueFromSelect="true" allowInput="true" enabled="false"
									onvaluechanged="changeOrgForm" style="width: 250px;" /></td>
								<td align="right" style="width: 100px">登记日期：</td>
								<td style="width: 130px"><input name="bidOpenTime"
									id="openTime" class="nui-datepicker" required="true" enabled="false"
									style="width: 250px"/></td>
								<td align="right" style="width: 100px">填报人:</td>
								<td style="width: 210px;"><input name="creatUserid"
									id="creatUserid" class="nui-hidden" style="width: 100%" /> <input
									id="createUsername" name="createUsername" class="nui-textbox"
									enabled="false" style="width: 250px" required="true" /></td>
							</tr>
							<tr>
								<td align="right" style="width: 100px">内协外联：</td>
								<td><input id="externalType" name="externalType"
									class="nui-dictcombobox" dictTypeId="EXTERNAL_TYPE"
									style="width: 250px" required="false" /></td>
								<td align="right" style="width: 100px">甲方全称：</td>
								<td><input name="partyName" onbuttonclick="selectCustmer"
									class="nui-buttonedit" style="width: 250px" allowInput="true"
									required="true" /></td>
								<td align="right" style="width: 100px">项目名称：</td>
								<td><input name="projectName" class="nui-textbox"
									style="width: 250px" required="true" /></td>
							</tr>
							<tr>
								<td align="right" style="width: 100px">投资额/万：</td>
								<td><input name="investmentAmount" class="nui-textbox"
									style="width: 250px" required="false" /></td>
								<td align="right" style="width: 100px">标的额：</td>
								<td><input id="matterAmount" name="matterAmount"
									class="nui-dictcombobox" dictTypeId="MATTER_AMOUNT"
									style="width: 250px" required="false" /></td>
								<td align="right" style="width: 100px">项目地点：</td>
								<td><input name="projectLocal" class="nui-textbox"
									style="width: 250px" required="true" /></td>
							</tr>
							<tr>
								<td align="right" style="width: 100px">集团内外：</td>
								<td><input id="headquarterGroup" name="headquarterGroup"
									class="nui-dictcombobox" dictTypeId="HEADQUARTER_GROUP"
									style="width: 250px" required="false" /></td>
								<td align="right" style="width: 100px">特点：</td>
								<td><input id="characteristics" name="characteristics"
									class="nui-dictcombobox" dictTypeId="CHARACTERISTICS"
									style="width: 250px" required="false" /></td>
								<td align="right" style="width: 100px">工程类型：</td>
								<td><input id="serviceType" name="serviceType"
									class="nui-dictcombobox" dictTypeId="SERVICE_TYPE"
									style="width: 250px" required="false" /></td>
							</tr>
							<tr>
								<td align="right" style="width: 100px">专业类型：</td>
								<td><input id="major" name="major"
									class="nui-dictcombobox" dictTypeId="BID_MAJOR"
									style="width: 250px" required="false" /></td>
								<td align="right" style="width: 100px">服务范围：</td>
								<td><input id="scopeService" name="scopeService"
									class="nui-dictcombobox" dictTypeId="SCOPE_SERVICE"
									style="width: 250px" required="false" /></td>
								<td align="right" style="width: 100px">主要项目特征：</td>
								<td><input name="features" class="nui-textbox"
									style="width: 250px" required="false" /></td>
							</tr>
							<tr>
								<td align="right" style="width: 100px">合同类型：</td>
								<td><input id="contractType" name="contractType"
									class="nui-dictcombobox" dictTypeId="CONTRACT_TYPE"
									style="width: 250px" required="false" /></td>
								<td align="right" style="width: 100px">采购方式：</td>
								<td><input id="procurementType" name="procurementType"
									class="nui-dictcombobox" dictTypeId="BIDPROCUREMENT_TYPE"
									style="width: 250px" required="false" /></td>
								<td align="right" style="width: 100px">价格模式：</td>
								<td><input id="priceModel" name="priceModel"
									class="nui-dictcombobox" dictTypeId="PRICE_MODEL"
									style="width: 250px" required="false" /></td>
							</tr>
							<tr>
								<td align="right" style="width: 100px">折合万/人月</td>
								<td><input name="equivalent" class="nui-textbox"
									style="width: 250px" required="false" /></td>
								<td align="right" style="width: 100px">中标结果：</td>
								<td><input id="bidResult" name="bidResult"
									class="nui-dictcombobox" dictTypeId="BID_RESULT"
									style="width: 250px" required="false" /></td>
							</tr>
							<tr>
							<td align="right" style="width: 120px">备注:</td>
							<td colspan="5"><input name="remark" class="nui-textarea"
								style="width: 100%" /></td>
						</tr>
						</table>
					</div>
				</form>
			</fieldset>

			<fieldset style="border: solid 1px #aaa;padding: 3px;width: 1100px;">
			    <legend>参与单位投标信息</legend>
			<div class="nui-toolbar" style="border-bottom: 0;padding: 0px;" id="button_inorgid1">
	            <table style="width: 100%;">
	            	<tr>
	                    <td style="width: 20%;">
	                        <a class="nui-button" id="addbtn" iconCls="icon-add" onclick="addTicket()">增加</a>
	                        <a class="nui-button" id="deltbtn" iconCls="icon-remove" onclick="removeTicket()">删除</a>
	                    </td>
	                </tr>
	             </table>           
	        </div>
	    	<div id="grid_traveldetail" class="nui-datagrid" style="width: 100%;height: auto;" allowCellSelect="true" 
	    		showPager="false" allowCellEdit="true" multiSelect="true" ondrawcell="setColor">
	            <div property="columns">
	                <div field="competId" displayField="orgname" width="130" align="center" headerAlign="center">参与单位
	                	<input property="editor" class="nui-combobox" required="true"
	                			url="com.zhonghe.ame.marketInfo.marketinfo.khxx.commpetior.getAllCompetitor.biz.ext" filterType="like" 
								textField="custname" valueField="custid" dataField="allCom" valueFromSelect="true" 
								allowInput="true"/>
	                </div>
	                <div field="competBidPrice" width="100" align="center" headerAlign="center" renderer="onViewL" >报价/合同价/万元/%
	                	<input property="editor" class="nui-textbox"  />
	                </div> 
	            </div>
	        </div>
		
			</fieldset>
			
			<fieldset id="field6" style="border:solid 1px #aaa;padding:3px;">
				<legend>投标相关资料</legend>
				<jsp:include page="/ame_common/addFiles.jsp"/>
			</fieldset>
		
		
		</div>
	</div>
	<div style="text-align: center;padding: 10px;" class="nui-toolbar">
		<a class="nui-button" onclick="onOk()" id="creatReimbProcess" style="width: 80px;margin-right: 20px;">确定</a>
		<a class="nui-button" onclick="onCancel" id="saveReimbProcess" style="width: 80px;margin-right: 140px;">取消</a>
	</div>
	<script type="text/javascript">
        nui.parse();
	    nui.get("orgId").setValue(userOrgId);
	    nui.get("creatUserid").setValue(userId);
		nui.get("createUsername").setValue(userName);
		nui.get("openTime").setValue(new Date());
        //报销记录
	  	var form_expRei = new nui.Form("form_expRei");
	  	//console.log(form_expRei.getData());
	  	//报销明细
		var grid_expReidetail = nui.get("grid_expReidetail");
		//报销受益
		var grid_expReibenef = nui.get("grid_expReibenef");
		var grid_traveldetail = nui.get("grid_traveldetail");//行程列表
		
        var  yf="";
       	
         function getHTZQ(){
        		form_expRei.validate();
    			var bidInfo = form_expRei.getData();
       	 }
       	 
	    
    
    	function SaveData(){
    			var bidInfo = form_expRei.getData();
    			bidInfo.contractCycle=yf
    			var bidCompetitor=grid_traveldetail.getData()
    			
    			console.log(bidInfo);
    			var json = nui.encode({"bid":bidInfo,"bidCompetitor":bidCompetitor});
    			
				if(!confirm("是否保存？")){
        				return;
        			}else{	
		    	ajaxCommon({
		                url: "com.zhonghe.ame.marketInfo.marketinfo.khxx.commpetior.addBidInfo.biz.ext",
		                data: json,
		                success: function (text) {
		                	if(text.result==1){
								showTips("新增投标信息成功")
		               		 	closeOk();
		                	}else{
		     			  		showTips("提交失败")
		                	}
		                }
		            }); 
		            }
		}
    	 function onCancel(e) {
            CloseWindow("cancel");
        }
    	function onOk(e) {
        	form_expRei.validate();
			if(form_expRei.isValid()==false){
				showTips("请检查必填项");
				return;
			}
			var filePaths = document.getElementsByName("uploadfile").length;
			var bidInfo = form_expRei.getData();
			bidInfo.contractCycle=yf
			var bidCompetitor=grid_traveldetail.getData()
	        document.getElementById("fileCatalog").value="bidInfo";
			form2.submit();
		}
    	
        //标准方法接口定义
        function CloseWindow(action) {           
            if (window.CloseOwnerWindow) return window.CloseOwnerWindow(action);
            else window.close();            
        }
        
        //选择招标人
	function selectCustmer(){
		var btnEdit = this;
		nui.open({
			url:"<%=request.getContextPath() %>/contract/contract/MisCustinfo_lookup.jsp",
		    title: "选择服务客户",
		    width: 650,
		    height: 380,
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
		
    function beforenodeselect(e) {
        //禁止选中父节点
        if (e.isLeaf == false) e.cancel = true;
    }
    function addTicket(){
    	var rowS = {name: "New Row"} 
		grid_traveldetail.addRow(rowS);
    }
    
	//删除行程明细
	function removeTicket(){
		var rows = grid_traveldetail.getSelecteds();
        if (rows.length>0) {
            grid_traveldetail.removeRows(rows, true);
        }else{
        	showTips("请至少选中一条记录！");
        }
	}
	
	function setColor(e){
		var row = e.record;
	    if (e.field == "traffictype") {
	        if(e.value == "2" || e.value == "4"){
		         e.cellStyle = "background:yellow";
    		}
	    }
	    if(e.field == "timequantums" || e.field == "timequantume" ||e.field == "bookingregion" ){
	    	if(row.bookingtype == "2"){
	    		e.value = "";
	    		e.cellHtml = "";
	    		row.timequantums = "";
	    		row.timequantume = "";
	    		row.bookingregion = "";
	    	}
	    }
	}
    </script></body>
</html>

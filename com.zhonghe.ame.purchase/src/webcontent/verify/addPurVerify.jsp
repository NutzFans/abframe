<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@include file="/purchase/common/common.jsp"%>
<html>
<head>
	<title>采购验收</title>
	<style type="text/css">
	    body{
	        margin: 0;padding: 0;border: 0;width: 100%;height: 100%;overflow: hidden;	
	    } 
    </style>
</head>
<body>
	<div class="nui-fit">
		<div class="mini-panel" title="" style="width: 100%;">
			<fieldset id="field1" style="border: solid 1px #aaa;padding: 3px;width: 98%;">
				<legend>采购验收单信息</legend>
				<form id="form1" method="post">
					<input name="files" id="fileids" class="nui-hidden"/>
					<input class="nui-hidden" name="id"/>
					<div style="padding: 5px;">
						<table style="table-layout: fixed;">
							<tr>
								<td class="form_label" align = "right">验收单编号：</td>
								<td>
									<input name="verifyCode" id="verifyCode" emptyText="系统自动生成"  readonly="readonly" class="nui-textbox" style="width: 100%" />
								</td>
								<td align="right" style="width: 120px">验收审核人：</td>
								<td >
									<input name="userId" id="examineUserId"  emptyText="请选择" class="nui-buttonedit" allowInput="false"
									onbuttonclick="selectOmEmployee" style="width: 100%" required="true"/>
								</td>
							</tr>
							<tr>
								<td align="right" style="width:160px">验收部门：</td>
								<td colspan="3"><input name="orgId" id="proAppOrgId"
									class="nui-combobox"  required="true"
									url="com.primeton.rdmgr.labor.labormgr.getAllOrgs.biz.ext"
									filterType="like" textField="orgname" valueField="orgid" readonly="readonly"
									dataField="allorgs" valueFromSelect="true" allowInput="true"
									style="width: 100%"  /></td>
							</tr>
							<tr>
						        <td align="right" style="width:160px">类型：</td>
						        <td >
						            <input id="verifyType" name="verifyType" required="true"  onvaluechanged="changeVal()" class="mini-radiobuttonlist" data="[{id: 1, text: '管理合同'}, {id: 2, text: '关联零星采购'}, {id: 3, text: '非条约事项验收'}]"/>
						        </td>
    						</tr>
							<tr>
								<td align="right" style="width: 120px">合同编号：</td>
									<td><input name="contractId" id="contractId" onbuttonclick="choseContrat" class="nui-buttonedit" allowInput="false" required="false" style="width: 100%"/></td>
								<td align="right" style="width: 130px">合同总价(万元)：</td>
									<td><input name="totalPrice"  id="totalPrice" class="nui-textbox" readonly="readonly" style="width: 100%" /></td>
							</tr>
							<tr>
								<td align="right" style="width: 120px">零星采购编号：</td>
									<td><input name="purchaseCode" id="purchaseCode" onbuttonclick="chosePurZero" class="nui-buttonedit" allowInput="false" required="false" style="width: 100%"/></td>
								<td align="right" style="width: 130px">采购金额(万元)：</td>
									<td><input name="totalAmount"  id="totalAmount" class="nui-textbox" readonly="readonly" style="width: 100%" /></td>
							</tr>
							<tr>
			              		<td class="form_label"  align="right" style="width:140px;">备注：</td>
			                    <td colspan="3">    
			                        <input style="width:100%;height: 120px;" name="remark" id="remark"  class="nui-textarea"/>
			                    </td>
			              	</tr>
						</table>
					</div>
				</form>
			</fieldset>
			  <fieldset  style="height:100%; border:solid 1px #aaa;padding:3px ;width: 98%; ">
			  <legend>货物信息</legend>
		     <div class="fieldset-body"  style="width:100%; height:100%; margin: 0px auto">
		     <a class="nui-button" id="addbtn" iconCls="icon-add" onclick="addTicket()">增加</a> 
		                  <a class="nui-button" id="deltbtn" iconCls="icon-remove" onclick="removeTicket()">删除</a> 
			    	<div id="grid_traveldetail" class="nui-datagrid" style="width: 100%;height: auto;" allowCellSelect="true" 
			    		showPager="false" allowCellEdit="true" multiSelect="true" oncellendedit="changeValue">
			            <div property="columns">
			            	<div type="indexcolumn" align="center" headerAlign="center">序号</div>
			                <div field="goodsName"  width="130" align="center" headerAlign="center" vtype="required">货物名称
												<input id="goodsName"  onbuttonclick="chosePurItem" width="100%" class="nui-buttonedit" name="goodsName" property="editor" />
			                </div>
			               <div  field="model" width="130" align="center" headerAlign="center" renderer="dictstatus">型号规格
									<input id="model" name="model" property="editor" width="100%" class="nui-textbox"   />
			                </div>
			                <div  field="supId" displayField="custname" width="130" align="center" headerAlign="center">供应商名称
									<input id="supId" name="supId" property="editor" width="100%" allowInput="false" onbuttonclick="onButtonEdit1" class="nui-buttonedit"  />
			                </div>
			                <div  field="number"  width="130" align="center" headerAlign="center" vtype="required">数量
									<input id="number" name="number" maxValue="999999999"property="editor"  class="nui-spinner" />
			                </div>
			                <div   field="singlePrice" width="130" align="center" headerAlign="center" vtype="required">单价(万元)
									<input id="singlePrice" name="singlePrice" property="editor" width="100%" class="nui-textbox" />
			                </div>
			                <div   field="totalPriceDetail" width="130" align="center" headerAlign="center"  >总价(万元)
								<input id="totalPriceDetail" name="totalPriceDetail" property="editor"  class="nui-textbox"  />
			                </div>
			                 <div   field="qualitySituation" width="130" align="center" headerAlign="center"  >质量情况
									<input id="qualitySituation" name="qualitySituation" property="editor" width="100%" class="nui-textbox"  />
			                </div>
			            </div>
			        </div>
		</div>
		</fieldset>
		<fieldset id="field2" style="border:solid 1px #aaa;padding:3px;">
			<legend>发票（若仅有发票）、合同中约定的结算单或验收报告等</legend>
			<jsp:include page="/ame_common/addFiles.jsp"/>
		</fieldset>
		</div>
	</div>
	<div style="text-align: center;padding: 10px;" class="nui-toolbar">
		<a class="nui-button" onclick="onOk(0)" id="saveReimb" style="width: 80px;margin-right: 20px;" iconCls="icon-save">保存</a>
		<a class="nui-button" onclick="onOk(1)" id="creatReimbProcess" style="width: 80px;margin-right: 20px;" iconCls="icon-ok">提交</a>
		<a class="nui-button" onclick="closeCancel" id="saveReimbProcess" style="width: 80px;margin-right: 140px;" iconCls="icon-close">关闭</a>
	</div>
	<script type="text/javascript">
        nui.parse();
	    var form = new nui.Form("#form1");
	    var grid_traveldetail = nui.get("grid_traveldetail");
	    var type ;
	    
	    

	 	function removeTicket(){
			var rows = grid_traveldetail.getSelecteds();
	        if (rows.length>0) {
	            grid_traveldetail.removeRows(rows, true);
	            totalAmount();
	        }else{
	        	nui.alert("请至少选中一条记录！");
	        }
		}
		function choseContrat(e) {
            var btnEdit = this;
            mini.open({
                url: "/default/purchase/programme/quotePayContractList.jsp",
                title: "",
                width: '73%',
                height: '75%',
                ondestroy: function (action) {
                    if (action == "ok") {
                   
                        var iframe = this.getIFrameEl();
                        var data = iframe.contentWindow.GetData();
                        data = mini.clone(data);    //必须
                        if (data) {
                            btnEdit.setValue(data.id);
                            btnEdit.setText(data.proAppCode);
                            nui.get("contractId").setValue(data.id);
                            nui.get("contractId").setText(data.contractNo);
                            
                            nui.get("totalPrice").setValue(data.contractSum/10000);
                        }
                        
                        // 重新选择合同编号，将货物信息清空，重新录入
	                    var purVerifyDetail = grid_traveldetail.getData();
	                    grid_traveldetail.removeRows(purVerifyDetail, true);
                        
                    }

                }
            });
        }
        
        
        
        function chosePurZero(e) {
            var btnEdit = this;
            mini.open({
                url: "/default/purchase/programme/chosePurZero.jsp",
                title: "",
                width: '73%',
                height: '75%',
                ondestroy: function (action) {
                    if (action == "ok") {
                   
                        var iframe = this.getIFrameEl();
                        var data = iframe.contentWindow.GetData();
                        data = mini.clone(data);    //必须
                        if (data) {
                        	console.log(data);
                            btnEdit.setValue(data.purchaseCode);
                            btnEdit.setText(data.purchaseCode);
                            
                            nui.get("totalAmount").setValue(data.totalAmount);
                        }
                        
                        // 重新选择采购编号，将货物信息清空，重新录入
                        var purVerifyDetail = grid_traveldetail.getData();
                        grid_traveldetail.removeRows(purVerifyDetail, true);
                    }

                }
            });
        }
            
       function chosePurItem(e) {
            var btnEdit = this;
            mini.open({
                url: "/default/purchase/programme/chosePurItem.jsp",
                title: "",
                width: '73%',
                height: '75%',
                ondestroy: function (action) {
                    if (action == "ok") {
                   
                        var iframe = this.getIFrameEl();
                        var data = iframe.contentWindow.GetData();
                        data = mini.clone(data);    //必须
                        if (data) {
                        	console.log(data);
                            btnEdit.setValue(data.desclong);
                            btnEdit.setText(data.desclong);
                            
                        }
                    }

                }
            });
        }
		function isUser(e){
			clog(e)
			
		}
		
		function changeValue(e){
			var record = e.record;
			if(e.field=="number"||e.field=="singlePrice"){
				if(record.number!=null && record.singlePrice!=null){
					var totalPrice1 =mulFloat(record.number,record.singlePrice) ;
					 grid_traveldetail.updateRow(e.row,{
							totalPriceDetail:totalPrice1
                  	}); 
	                  	totalAmount();
				}else{
					 grid_traveldetail.updateRow(e.row,{
					 totalPrice:""
              	}); 
				
				}
			}
	   	}
		
		//计算总金额
		function totalAmount(){
			var tempData = grid_traveldetail.data;
	    	var a=tempData.length;
	    	var b=0;
	    	for(var i=0;i<a;i++){
	    		if(!!tempData[i].totalPriceDetail&&tempData[i].totalPriceDetail>0){
	    			b = addFloat(b,tempData[i].totalPriceDetail)
	    		}else{
	    			var x = 0;
	    			b = addFloat(b,x)
	    		}
	    	}
	    	var verifyType = nui.get("verifyType").value;
	    	if (verifyType == "1"){ 
				// 合同编号
				nui.get("totalPrice").setValue(b)
			} else if (verifyType == "2" ){
				// 采购零星编号
				nui.get("totalAmount").setValue(b)
			} else {
				// 非条约事项验收
				nui.get("totalPrice").setValue(b)
			}
	 		
		}
		
	    function onButtonEdit1(e) {
	        var btnEdit = this;
	        mini.open({
	            url: "/default/purchase/packagemethod/zhPurSup.jsp",
	            title: "供应商列表",
	            width: '73%',
	            height: '75%',
	            ondestroy: function (action) {
	                if (action == "ok") {
	                    var iframe = this.getIFrameEl();
	                    var data = iframe.contentWindow.GetData();
	                    data = nui.clone(data);    //必须
	                    if (data) {
	                        btnEdit.setValue(data.custid);
	                    	btnEdit.setText(data.custname);
	                    	
	                    	/* nui.get("proAppOrgId").setValue(data.orgid);
	                    	nui.get("proAppOrgId").setText(data.orgname); */
	                    }
	                }
	            }
	        });
	    }
        
		
		function addTicket(){
	    	var rowS = {name: "New Row"} 
			grid_traveldetail.addRow(rowS);
		}
		
	 	function selectOmEmployee(){
    	var btnEdit = this;
        nui.open({
            url: "<%=request.getContextPath() %>/machine/SelectEmployee.jsp",
            title: "选择部门负责人",
            width: 430,
            height: 400,
            ondestroy: function (action) {
                if (action == "ok") {
                    var iframe = this.getIFrameEl();
                    var data = iframe.contentWindow.GetData();
                    data = nui.clone(data);    //必须
                    if (data) {
                    	if(data.userid==userId){
			        		nui.alert("验收审核人不能为自己");
			        		return;
			        	}
                        btnEdit.setValue(data.userid);
                        btnEdit.setText(data.empname);
                        console.log(data)
                        nui.get("proAppOrgId").setValue(data.orgid);
                        nui.get("proAppOrgId").setText(data.orgname);
                        }
                    }

                }
            });
        }
        
        // 根据选项进行动态必填项效验
        function changeVal(){
    		//不管是暂存还是提交 都需要判断选择的类型与填的数据是否是相同的
			//[{id: 1, text: '管理合同'}, {id: 2, text: '关联零星采购'}, {id: 3, text: '非条约事项验收'}]
        	var verifyType = nui.get("verifyType").value;
			if (verifyType == "1"){ 
				// 合同编号必填
				nui.get("contractId").setRequired(true);
				nui.get("purchaseCode").setRequired(false);
			} else if (verifyType == "2" ){
				// 采购零星编号必填
				nui.get("purchaseCode").setRequired(true);
				nui.get("contractId").setRequired(false);
			} else {
				// 非条约事项验收 不效验
				nui.get("purchaseCode").setRequired(false);
				nui.get("contractId").setRequired(false);
			}
        }
        
    	function onOk(e){
    		type=e;
			if(type==0){
				info = "暂存";
			}else if(type==1){
				info = "提交";
				var purVerify = form.getData(),purVerifyDetail = grid_traveldetail.getData();
	    		purVerify.type = type;
	    		if(!form.validate()||purVerifyDetail.length<1){
					nui.alert("请检查表单和货物信息填写是否完整!");
					return;
				}
				grid_traveldetail.validate();
	   			if (grid_traveldetail.isValid() == false) {
		            var error = grid_traveldetail.getCellErrors()[0];
		            grid_traveldetail.beginEditCell(error.record, error.column);
		            return;
		        }
				var filePaths = document.getElementsByName("uploadfile").length;
	    		if(filePaths==0){
	    			showTips("'发票（若仅有发票）、合同中约定的结算单或验收报告'等附件不能为空","danger");
	    			return;
	    		}else{
	    			for(var j=0;j<filePaths;j++){
				      var a=document.getElementsByName("remarkList")[j].value;
				      if(a==null||a==""){
				       showTips("估算表和支撑材料附件不可以为空","danger");
				       	nui.get("saveReimbProcess").enable();
								nui.get("creatReimbProcess").enable();	
				       return;
				      }
				    }
    			}
			}
			
			document.getElementById("fileCatalog").value="purVerify";
			nui.confirm("确定"+info+"单据","系统提示",
	        function(action){
		        if(action=="ok"){
	    			form2.submit();
				}
			})
    	}    
        
		function SaveData(){
			var purVerify = form.getData(),purVerifyDetail = grid_traveldetail.getData();
			purVerify.type = type;
			purVerify.judge = getJudge();
			purVerify.files = nui.get("fileids").getValue();
			var json = nui.encode({'purVerify':purVerify,'purVerifyDetail':purVerifyDetail});
    		ajaxCommon({
            url: "com.zhonghe.ame.purchase.purchaseVerify.addPurVerify.biz.ext",
            data: json,
            contentType: 'text/json',
            success: function (text) {
                if(text.result == "1"){
               		 showTips(info+"成功")
               		 closeOk();
                }else{
     			  			showTips(info+"失败,请联系管理员","danger")
               		 /* closeOk(); */
                }
            }
        });
    	}
        
        
// 		function onOk(e){
// 	    	type=e;
//     		var purVerify = form.getData(),purVerifyDetail = grid_traveldetail.getData();
//     		purVerify.type = type;
//     		if(!form.validate()||purVerifyDetail.length<1){
// 				nui.alert("请检查表单和货物信息填写是否完整!");
// 				return;
// 			}
			
// 			grid_traveldetail.validate();
//    		if (grid_traveldetail.isValid() == false) {
//             var error = grid_traveldetail.getCellErrors()[0];
//             grid_traveldetail.beginEditCell(error.record, error.column);
//             return;
//         }
// 			var json = nui.encode({'purVerify':purVerify,'purVerifyDetail':purVerifyDetail});
			
// 			if(type==1){
// 				info="是否提交？"
				
// 				var filePaths = document.getElementsByName("uploadfile").length;
//     		if(filePaths==0){
//     			showTips("发票（若仅有发票）、合同中约定的结算单或验收报告等","danger");
//     			return;
//     		}else{
//     			for(var j=0;j<filePaths;j++){
// 			      var a=document.getElementsByName("remarkList")[j].value;
// 				      if(a==null||a==""){
// 				       showTips("估算表和支撑材料附件不可以为空","danger");
// 				       	nui.get("saveReimbProcess").enable();
// 								nui.get("creatReimbProcess").enable();	
// 				       return;
// 				      }
// 			     }
//     		}
    		
// 			}else{
// 				info="是否暂时保存？"
// 			}
// 			if(!confirm(info)){
// 		        nui.get("saveReimb").enable();
//        		 	nui.get("creatReimbProcess").enable();
// 				return;
// 			}else{	
// 		    	nui.ajax({
// 		                url: "com.zhonghe.ame.purchase.purchaseVerify.addPurVerify.biz.ext",
// 		                data: json,
// 		                type: 'POST',
// 		                cache: false,
// 		                contentType: 'text/json',
// 		                success: function (text) {
		               
// 		                if(text.result == "1"){
// 		               		 nui.alert("提交成功",null,function(){
// 		               		 window.CloseOwnerWindow("save");
// 		               		 });
// 		                }else{
// 		                	nui.alert("提交失败",null,function(){
// 		               		// window.CloseOwnerWindow("save");
// 		               		 });
// 		                }
// 		                },
// 		                error: function (jqXHR, textStatus, errorThrown) {
// 		                    alert(jqXHR.responseText);
// 		                }
// 		            }); 
//             }
		  	
// 	    }
        function onButtonEdit(e) {
            var btnEdit = this;
            mini.open({
                url: "/default/purchase/project/procurementProAppList.jsp",
                title: "采购立项列表",
                width: '73%',
                height: '75%',
                ondestroy: function (action) {
                    if (action == "ok") {
                   
                        var iframe = this.getIFrameEl();
                        var data = iframe.contentWindow.GetData();
                        data = mini.clone(data);    //必须
                        if (data) {
                            btnEdit.setValue(data.id);
                            btnEdit.setText(data.proAppCode);
                            
                            nui.get("planId").setValue(data.planId);
                            nui.get("planId").setText(data.purchaseNumber);
                            btnEdit.doValueChanged();
                            
                        }
                    }

                }
            });

        }
        
    	 function onCancel(e) {
            CloseWindow("cancel");
        }
        //标准方法接口定义
        function CloseWindow(action) {           
            if (window.CloseOwnerWindow) return window.CloseOwnerWindow(action);
            else window.close();            
        }
        

    </script></body>
</html>

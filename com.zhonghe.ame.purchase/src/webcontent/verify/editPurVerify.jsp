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
<!-- 					<input name="files1" id="fileids1" class="nui-hidden"/> -->
					<input class="nui-hidden" name="processid"/>
					<input class="nui-hidden" name="id" id= "id"/>
					<div style="padding: 5px;">
						<table style="table-layout: fixed;">
							<tr>
							<td class="form_label" align = "right">验收单编号：</td>
								<td>
									<input name="verifyCode" id="verifyCode" class="nui-textbox" style="width: 100%" readonly="readonly"/>
								</td>
								<td align="right" style="width: 120px">验收人：</td>
								<td ><input name="userId" id="userId"  class="nui-buttonedit" 
									onbuttonclick="selectOmEmployee" style="width: 100%" required="true"/>
								</td>
							</tr>
							<tr>
								<td align="right" style="width:160px">验收部门：</td>
								<td colspan="3"><input
									name="orgId" id="proAppOrgId" class="nui-combobox"  required="true"
									url="com.primeton.rdmgr.labor.labormgr.getAllOrgs.biz.ext"
									filterType="like" textField="orgname" valueField="orgid" readonly="readonly"
									dataField="allorgs" valueFromSelect="true" allowInput="true"
									style="width: 100%;"  /></td>
								
							</tr>
							<tr>
								<td align="right" style="width: 120px">合同编号：</td>
									<td><input name="contractId" id="contractId" onbuttonclick="choseContrat" class="nui-buttonedit" style="width: 100%"/></td>
								<td align="right" style="width: 130px">合同总价(万元)：</td>
									<td><input name="totalPrice" readOnly="readOnly" id="totalPrice" class="nui-textbox" style="width: 100%" required="true"/></td>
							</tr>
							<tr>
			              		<td class="form_label"  align="right" style="width:140px;">备注：</td>
			                    <td colspan="3">    
			                        <input style="width:100%;height: 70px;" name="remark" id="remark" class="nui-textarea"/>
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
			    	<div id="grid_traveldetail" class="nui-datagrid" style="width: 100%; height: auto;" allowCellSelect="true" 
			    		  url="com.zhonghe.ame.purchase.purchaseVerify.queryVerifyDetailTotal.biz.ext" 
	    				dataField="purVerifyDetail" showPager="false" allowCellEdit="true" multiSelect="true" oncellendedit="changeValue">
			            <div property="columns">
			            	<div type="indexcolumn" align="center" headerAlign="center">序号</div>
			                <div field="goodsName"  width="130" align="center" headerAlign="center" vtype="required;String">货物名称
												<input id="goodsName"  class="nui-textbox" width="100%" name="goodsName" property="editor" />
			                </div>
			               <div  field="model" width="130" align="center" headerAlign="center" renderer="dictstatus"  >型号规格
													<input id="model" name="model" property="editor" width="100%" class="nui-textbox"   />
			                </div>
			                <div  field="supId" displayField="custname" width="130" align="center" headerAlign="center">供应商名称
													<input id="supId" name="supId" property="editor"  width="100%" onbuttonclick="onButtonEdit1" class="nui-buttonedit"  />
			                </div>
			                <div  field="number"  width="130" align="center" headerAlign="center">数量
												<input id="number" name="number" maxValue="999999999" width="100%" property="editor"  class="nui-textbox"  />
			                </div>
			                <div   field="singlePrice" width="130" align="center" headerAlign="center" >单价(万元)
									 			<input id="singlePrice" name="singlePrice" property="editor" width="100%" class="nui-textbox" /> 
			                </div>
			                <div   field="totalPriceDetail" width="130" align="center" headerAlign="center"  renderer="doIt">总价(万元)
									 				<input  name="totalPriceDetail" property="editor" width="100%" class="nui-textbox"  /> 
			                </div>
			                 <div   field="qualitySituation" width="130" align="center" headerAlign="center"  >质量情况
												<input id="qualitySituation" name="qualitySituation" property="editor" width="100%" class="nui-textbox"  />
			                </div>
			            </div>
			        </div>
		</div>
		</fieldset>
		<fieldset id="field3" style="border:solid 1px #aaa;padding:0px;">
			<legend>估算表和支撑材料(可上传多个附件)</legend>
			<jsp:include page="/purchase/common/inputFilePurchase.jsp"/>
		</fieldset>
		<jsp:include page="/ame_common/misOpinion.jsp"/>	
		</div>
	</div>
	<div style="text-align: center;padding: 10px;" class="nui-toolbar">
		<a class="nui-button" onclick="onOk(0)" id="saveFeame" style="width: 80px;margin-right: 20px;">保存</a>
		<a class="nui-button" onclick="onOk(1)" id="creatFeame" style="width: 80px;margin-right: 20px;">提交</a>
		<a class="nui-button" onclick="onOk(2)" id="zzFeame" style="width: 80px;margin-right: 20px;">中止</a>
		<a class="nui-button" onclick="closeCancel" id="saveReimbProcess" style="width: 80px;margin-right: 140px;">关闭</a>
	</div>
	<script type="text/javascript">
        nui.parse();
	    var form = new nui.Form("#form1");
	    var grid_traveldetail = nui.get("grid_traveldetail");
	    var type ;
	        //工作项id
	<% 
		long workItemID=(Long)request.getAttribute("workItemID");
	%>
		loadData();
	   function loadData(){
			//流程提示信息
			var data={workItemID:<%=workItemID %>};
			var json=nui.encode(data);
			nui.ajax({
				url:"com.zhonghe.ame.purchase.purchaseVerify.getVerify.biz.ext",
				type:"post",
				data:json,
				contentType:"text/json",
				success:function (o){
					//付款申请基本信息
					form.setData(o.data);
					nui.get("userId").setText(o.data.empname)
					nui.get("proAppOrgId").setText(o.data.orgname)
					nui.get("contractId").setText(o.data.contractNo)
					//设置审核意见基本信息
					nui.get("processinstid").setValue(o.workitem.processInstID);
	       	nui.get("processinstname").setValue(o.workitem.processInstName);
	       	nui.get("activitydefid").setValue(o.workitem.activityDefID);
	       	nui.get("workitemname").setValue(o.workitem.workItemName);
					nui.get("workitemid").setValue(<%=workItemID %>);
	       	nui.get("isshow").setValue("1");
	       	nui.get("auditstatus").setValue("4");
	       	document.getElementById("salesEdit").style.display="none";
	       	nui.get("auditopinion").setValue("发起");
	            	//查询审核意见
					var grid = nui.get("datagrid1");
					if(o.workitem.processInstID!=null||o.workitem.processInstID!=""){
						grid.load({processInstID:o.workitem.processInstID});
						grid.sortBy("time", "desc");
					}
					
					var grid_0 = nui.get("grid_0");
			 		grid_0.load({"groupid":"purVerify","relationid":o.data.id});
					grid_0.sortBy("fileTime","desc");
					
					 grid_traveldetail.load({'id':nui.get("id").getValue()});	
					
				},
				error:function(){}
			});
	    }
	
	 	function removeTicket(){
			var rows = grid_traveldetail.getSelecteds();
	        if (rows.length>0) {
	            grid_traveldetail.removeRows(rows, true);
	            totalAmount();
	        }else{
	        	nui.alert("请至少选中一条记录！");
	        }
		}
		//合同编号
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
                }
            }
        });
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
                    console.log(data);
                        btnEdit.setValue(data.custid);
                    	btnEdit.setText(data.custname);
                    	
                    	nui.get("proAppOrgId").setValue(data.orgid);
                    	nui.get("proAppOrgId").setText(data.orgname);
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
            title: "选择验收人",
            width: 430,
            height: 400,
            ondestroy: function (action) {
                if (action == "ok") {
                    var iframe = this.getIFrameEl();
                    var data = iframe.contentWindow.GetData();
                    data = nui.clone(data);    //必须
                    if (data) {
                    console.log(data)
                    console.log(data.orgid)
                        btnEdit.setValue(data.userid);
                        btnEdit.setText(data.empname);
                        nui.get("proAppOrgId").setValue(data.orgid);
                        }
                    }

                }
            });
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
	    	var b = new Number(b)+'';
	 		nui.get("totalPrice").setValue(b)
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
        debugger
        var filePaths1 = document.getElementsByName("uploadfile1").length;
    		var grid_1 = nui.get("grid_0").getData();
    		if(filePaths1==0&&grid_1.length<1){
    			showTips("'发票（若仅有发票）、合同中约定的结算单或验收报告'等附件不能为空","danger");
					return;
    		}else{
    			for(var j=0;j<filePaths1;j++){
			      var a=document.getElementsByName("remarkList1")[j].value;
				      if(a==null||a==""){
				        showTips("'发票（若仅有发票）、合同中约定的结算单或验收报告'等附件不能为空","danger");
				        nui.get("saveReimbProcess").enable();
								nui.get("creatReimbProcess").enable();	
				       return;
				      }
			     }
    		} 
        
        
			}else{
				info="是否中止流程？"
				nui.get("auditstatus").setValue(2);
			}
			document.getElementById("fileCatalog").value="purVerify";
			nui.confirm("确定"+info+"单据","系统提示",
        function(action){
        if(action=="ok"){
    			fileForm.submit();
				}
			})
    } 
    
    function SaveData1(){
			var purVerify = form.getData(),purVerifyDetail = grid_traveldetail.getData();
			purVerify.type = type;
			purVerify.judge = getJudge();
			purVerify.files = nui.get("fileids").getValue();
			var data_opioion = opioionform.getData();
			var json = nui.encode({'purVerify':purVerify,'purVerifyDetail':purVerifyDetail,"misOpinion":data_opioion.misOpinion});
    		ajaxCommon({
            url: "com.zhonghe.ame.purchase.purchaseVerify.editPurVerify.biz.ext",
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
        
//     	function onOk(e){
//     	    type=e;
//     		var purVerify = form.getData(),purVerifyDetail = grid_traveldetail.getData();
//     		purVerify.type = type;
//     		if(e!=2){
// 	    		if(!form.validate()||purVerifyDetail.length<1){
// 					nui.alert("请检查表单和货物信息填写是否完整!");
// 					return;
// 				}
// 			}
// 			if(type==1){
// 				info="是否提交？"
// 			}else if(type==0){
// 				info="是否暂时保存？"
// 			}else{
// 				info="是否中止流程？"
// 				nui.get("auditstatus").setValue(2);
// 			}
// 			var data_opioion = opioionform.getData();
// 			var json = nui.encode({'purVerify':purVerify,'purVerifyDetail':purVerifyDetail,"misOpinion":data_opioion.misOpinion});
// 			if(!confirm(info)){
// 		       nui.get("saveFeame").enable();
//        		 	nui.get("creatFeame").enable();
//        		 	nui.get("zzFeame").enable();
// 				return;
// 			}else{	
// 		    	ajaxCommon({
// 		                url: "com.zhonghe.ame.purchase.purchaseVerify.editPurVerify.biz.ext",
// 		                data: json,
// 		                success: function (text) {
// 		               		if(type==1){
// 			               		 showTips("提交成功")
// 			               		 closeOk();
// 		               		 }else if(type==0){
// 		               			 showTips("暂时保存成功")
// 		               			  closeOk();
// 		               		 }else{
// 		               		 	showTips("中止成功")
// 		               		 	 closeOk();
// 		               		 }
// 		                }
// 		            }); 
//             }
		  	
// 	    }
	    
	    //科学计数法转普通计数法
	function doIt(e){
		var exp = null; 
		var singlePrice='';
		console.log(e.value);
		console.log(!(typeof(e.value)=="undefined"));
		if (!(typeof(e.value)=="undefined")) { 
			console.log("aaa")
			singlePrice = new Number(e.value)+'';
			return singlePrice;
		}
	}
        

    </script></body>
</html>

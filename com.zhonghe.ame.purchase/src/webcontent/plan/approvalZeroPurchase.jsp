<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@include file="/purchase/common/common.jsp"%>
<html>
<head>
    <title>零星采购审批信息</title>
</head>
<body>
<%long workitemid = (Long)request.getAttribute("workItemID");%>
	<div class="nui-fit" >
			<fieldset id="field1" style="border: solid 1px #aaa;padding: 3px;width: 99%;">
				<legend>零星采购审批信息</legend>
				<form id="form1" method="post">
					<input name="files" id="fileids" class="nui-hidden" />
					<input name="id" id="id" class="nui-hidden" />
					<div style="padding: 5px; margin-left:5%;">
					<table style="table-layout: fixed;" id="table_file" width="60%">
							<tr>
								<td align="right" style="width:140px">零星采购名称：</td>
								<td colspan="4">
									<input name="purchaseName" id="purchaseName" class="nui-textbox"
										required="true" style="width: 100%" required="true" />
								</td>
								<td width="120px" class="form_label" align="right">采购单位：</td>
								<td colspan="2">
									<input name="orgname" id="orgname" class="nui-textbox" required="true"  style="width:100%;" readonly="readonly" />
											</td>
										</tr>
										<tr>
											<td align="right" style="width: 140px">合同名称<span
										style="color: red;">(若有)</span>：</td>
								<td colspan="4">
									<input name="contract" id="contract" class="nui-textbox"
										style="width: 100%;" />
								</td>
								<td width="120px" class="form_label" align="right">总金额(万元)：</td>
								<td colspan="2">
									<input name="totalAmount" id="totalAmount" style="width: 100%"
										class="nui-textbox" readonly="readonly" />
								</td>
							</tr>
							<tr>
								<td align="right" style="width: 140px">供方/乙方/承包人全称：</td>
								<td colspan="4">
									<input name="contractor" id="contractor" class="nui-textbox"
										style="width: 100%;" />
								</td>
								<td align="right" style="width:100px">预计采购时间：</td>
								<td colspan="2">
									<input name="purchaseDate" id="purchaseDate" class="nui-datepicker"
										style="width: 100%" required="true" />
								</td>
							</tr>
							<tr>
								<td class="form_label" align="right">申请原因：</td>
								<td colspan="7">
									<input style="width:100%;height: 40px;" name="applyReason"
										class="nui-textarea" id="remark" required="true" />
								</td>
							</tr>
						</table>
        </div>
    	</form>
    	<fieldset id="field2" style="border: solid 1px #aaa;">
    	<legend>计划明细</legend>
     	<div class="fieldset-body"  style="width:100%; height:100%; margin: 0px auto">
	    	<div id="grid_traveldetail" class="nui-datagrid" style="width: 80%;height: auto;" allowCellSelect="true" 
	    		showPager="false" allowCellEdit="false" multiSelect="true" dataField="purZeroItem" 
	    		url="com.zhonghe.ame.purchase.purchaseItems.queryPurZeroItem.biz.ext">
	            <div property="columns">
	                <div field="itemName"  width="130" align="center" headerAlign="center"  vtype="required">采购物项名称
							<input id="itemName" name="itemName" property="editor"  class="nui-textbox"  />
	                </div>
	               <div  field="brandSpec" width="130" align="center" headerAlign="center"  >品牌/型号/规格
							<input id="brandSpec" name="brandSpec" property="editor"  class="nui-textbox"   />
	                </div>
	                <div   field="unit" displayField="unit"  width="130" align="center" headerAlign="center"  >单位
							<input  name="unit" property="editor"  class="nui-textbox"  style="width:200px;" />
	                </div>
	                <div  field="onePrice"  width="130" align="center" headerAlign="center"  vtype="required">单价(万元)
							<input id="onePrice" name="onePrice" property="editor"  class="nui-spinner"  minValue="0"  maxValue="999999999"   />
	                </div>
	                <div  field="num"  width="130" align="center" headerAlign="center"   vtype="required">数量
							<input id="num" name="num" property="editor"  class="nui-spinner" minValue="0"  maxValue="999999999"  />
	                </div>
	                <div   field="totalPrice" width="130" align="center" headerAlign="center"  >总价(万元)
							<input id="totalPrice" name="totalPrice" property="editor"  class="nui-textbox"  readonly="readonly"/>
	                </div>
	                <!-- <div  field="plansimplementtime"  width="130" align="center" headerAlign="center"  >拟实施时间
							<input id="plansimplementtime" name="plansimplementtime" property="editor"  class="nui-datepicker"  />
	                </div> -->
	            </div>
	        </div>
		</div>
		</fieldset>
		<fieldset id="field3" style="border: solid 1px #aaa; padding: 0px;">
				<jsp:include page="/purchase/common/inputFilePurchase.jsp" />
			</fieldset>
		<jsp:include page="/ame_common/misOpinion.jsp"/>
	</fieldset>
	</div>
	<div style="text-align:center;padding:10px;border-width:1px 0px 0px 0px;" class="nui-toolbar">     
		<a class="nui-button" onclick="countersign()" id="countersign" iconCls="icon-user" style="width: 80px;margin-right: 20px;">加签</a>          
    <a class="nui-button" onclick="submit" style="width:60px;margin-right:20px;">提交</a>       
    <a class="nui-button" onclick="onCancel" style="width:60px;">关闭</a>
	</div>  
<script type="text/javascript">
	    nui.parse();
	    //var updateURL = "com.primeton.mis.contract.contract.updateContract.biz.ext";
	    var saveURL = "com.primeton.mis.contract.contract.addContract.biz.ext";
	    var workItemID = <%=request.getParameter("workItemID")%>;
	    var form = new nui.Form("#form1");
	    var grid_traveldetail = nui.get("grid_traveldetail");
	   	var titleText,countersignUsers;
	   	init();
	   	function init(){
	   		var data = {workitemid:<%=workitemid%>};
	   		var json = nui.encode(data);
	   		nui.ajax({	
					url: "com.zhonghe.ame.purchase.purchaseItems.queryPurZeroDetail.biz.ext",
				    type: 'POST',
			        data: json,
			        success: function (o) {
							 form.setData(o.purZero);
							 form.setEnabled(false);
		       		 var grid = nui.get("datagrid1");
							 grid.load({processInstID:o.purZero.processid});
							 grid.sortBy("time", "desc");
							 //初始化处理意见
							 initMisOpinion({auditstatus:"1"});
							 nui.get("backTo").setData(o.seal.backList);
							 var jsonData = {"zeroId":o.purZero.id}
		       		 		 grid_traveldetail.load(jsonData);
		       		 		 // 查询附件
							 var grid_0 = nui.get("grid_0");
							 grid_0.load({
								 "groupid" : "purchaseZero",
								 "relationid" : o.purZero.id
							 });
							 grid_0.sortBy("fileTime", "desc");
			       		 
			        },
				    error: function (jqXHR, textStatus, errorThrown) {
				        alert(jqXHR.responseText);
				    }
			    }); 
	   	}
	   	
    //经办人查找
    	function countersign(){
        	selectOmEmployee();
        }
        
    	function selectOmEmployee(){
	    	var btnEdit = this;
	        nui.open({
	            url: "<%=request.getContextPath() %>/contractPact/selectUsers.jsp",
	            title: "立项单位经办人",
	            width: 430,
	            height: 400,
	            ondestroy: function (action) {
	            	console.log(action)
	            	var user,users = "【";
	            	countersignUsers =[];
	                if (action == "ok") {
	                    var iframe = this.getIFrameEl();
	                    var data = iframe.contentWindow.GetData();
	                    data = nui.clone(data);    //必须
	                    if (data) {
	                    	console.log(data)
                        	for(var i = 0;i<data.length ;i++){
                        		user = {};
                        		user.id = data[i].userid
                        		user.name = data[i].empname
                        		user.typeCode = "person"
                        		countersignUsers.push(user);
                        		if(i==0){
                        			users = users +data[i].empname;
                        		}else{
                        		
	                        		users = users +","+data[i].empname;
                        		}
                        	}
                        	users = users+"】";
                        	titleText ="增加审批人员"+ users +"并提交";
		                    		saveData();
	                       }
	                    }
	
	                }
	            });
	        }
    
        // 提交 
    	function submit(){
	    	var auditstatus = nui.get("auditstatus").getValue();
	    	if(auditstatus == "2"){	//终止流程
	    		titleText = "终止";
	    	}else if(auditstatus == "0"){	//退回流程
	    		if(!nui.get("backTo").getValue()){
	    			showTips("退回环节不能为空！");
	    			return;
	    		}
	    		titleText = "退回";
	    	}else if(auditstatus == "1"){	//提交流程
	    		titleText = "提交";
	    	}
	    	document.getElementById("fileCatalog").value = "purchaseZero";
			nui.confirm("确定" + titleText + "流程吗？", "系统提示", function(action) {
				if (action == "ok") {
					fileForm.submit();
				}
			})
	   
    	}
    	
	    function SaveData1(){			         
			var misOpinion = opioionform.getData().misOpinion;//审核意见
        	/* nui.get("appButton").setEnabled(false); */
        	var data = form.getData();
        	data.files = nui.get("fileids").getValue();
        	console.log("999-5",nui.get("fileids").getValue());
        	var json = {misOpinion:misOpinion,workItemID: <%=workitemid %>,"countersignUsers":countersignUsers, "purZero": data};
            mini.mask({
	            el: document.body,
	            cls: 'mini-mask-loading',
	            html: titleText+'中...'
	        });
	    	nui.ajax({
	  			url: "com.zhonghe.ame.purchase.purchaseItems.approvalPurZero.biz.ext",
				type: "post",
				data: json,
				contentType: "text/json",
				success: function (o){
					nui.unmask(document.body);
					if(o.result == "success"){
			        	nui.alert(titleText + "成功","系统提示",function(){
			        		//nui.get("sureButton").setEnabled(true);
			        		CloseWindow("ok");
			        	});
					}else{
						nui.alert("提交失败，请联系信息技术部人员！","系统提示", function(action){
							//nui.get("sureButton").setEnabled(true);
						    CloseWindow("ok");
							
						});
					}
				},
				error: function(jqXHR, textStatus, errorThrown){
					alert(jqXHR.responseText);
				}
			 }) 
		}
	   	
	   	function typeChange(e){
	   		
	   		if(e.value==2){
	   		 	document.getElementById("one2").style.display="";
	    		document.getElementById("one22").style.display="";
	    		document.getElementById("one1").style.display="none";
	    		document.getElementById("one11").style.display="none";
	    		document.getElementById("one111").style.display="none";
	   		}else if(e.value==1){
	   		    document.getElementById("one1").style.display="";
	   		    document.getElementById("one11").style.display="";
	    	    document.getElementById("one111").style.display="";
	    	    document.getElementById("one2").style.display="none";
	            document.getElementById("one22").style.display="none";
	   		
	   		}
	   		
	   	
	   	}
	   	
	   	function addPrice(e){
	   		
	   		//console.log(e);
	   		var totalPrice = 0;
	   		//console.log(competBidPrice);
	   		var grid_traveldetail = nui.get("grid_traveldetail");
	   		
	   		var list = grid_traveldetail.data;
	   		for(var i =0;i<list.length;i++){
	   		
	   			console.log(list[i]);
	   			totalPrice = totalPrice +list[i].competBidPrice;
	   		}
	   		console.log(totalPrice)
	   	}
	   	
	   	
        function onButtonEdit123(e) {
            var btnEdit = this;
            mini.open({
                url: "<%=request.getContextPath() %>/purchase/plan/testTree.jsp",
                showMaxButton: false,
                title: "选择树",
                width: 400,
                height: 400,
                ondestroy: function (action) {                    
                    if (action == "ok") {
                   		
                        var iframe = this.getIFrameEl();
                        
                        var data = iframe.contentWindow.GetData();
                        //console.log(data);
                        data = mini.clone(data);
                       	//console.log(data);
                        if (data) {
                        
                          for(var i = 0 ; i<data.length;i++){
                          
                          	var tmp = data[i];
                          	if(tmp.grade==1){
                          	    
                          	    var grid_traveldetail = nui.get("grid_traveldetail");
                          	    var row = grid_traveldetail.getSelected();
				                  	grid_traveldetail.updateRow(row,{
				                  		firstItemName:tmp.itemName,
 				       	           		purchaseFirstCode:tmp.itemCode
				                  	});                           		
                          	}
                          	
                          	if(tmp.grade==2){
                          	    
                          	    var grid_traveldetail = nui.get("grid_traveldetail");
                          	    var row = grid_traveldetail.getSelected();
				                  	grid_traveldetail.updateRow(row,{
				                  		secondItemName:tmp.itemName,
 				       	           		purchaseTwoCode:tmp.itemCode
				                  	});                           		
                          	}
                          	if(tmp.grade==3){
                          	    
                          	    var grid_traveldetail = nui.get("grid_traveldetail");
                          	    var row = grid_traveldetail.getSelected();
				                  	grid_traveldetail.updateRow(row,{
				                  		threeItemName:tmp.itemName,
 				       	           		purchaseThreeCode:tmp.itemCode
				                  	});                           		
                          	}
                          }
                          
                           
                        }
                    }
                }
            });            
             
        }  
	
	function buttonRenderConclude(e){
 	var s = "";
  
 s =   '<a class="conclude_edit_button  mini-button control_buttons"  data-tooltip="新增" data-placement="top" onclick="onButtonEdit123()">'
 +     '<span class="mini-button-text  mini-button-iconOnly " >'
 +      '<span class="mini-button-icon mini-iconfont icon-add" style="margin:auto;margin-top: 12%;" >'
 +     '<span class="mini-button-text"></span>'
 +      '</span>'
 +   '</span>'
 +  '</ a>'
    return s;
}
	
	function addTicket(){
    	var rowS = {name: "New Row"} 
		grid_traveldetail.addRow(rowS);
		
    	<%--var row = grid_traveldetail.getData();
    	if(row.length==0){
    		var rowS = {name: "New Row"} 
    		grid_traveldetail.addRow(rowS);
    	}else{
    		var rowS = {name: "New Row",bookingregion:row[0].bookingregion};
    		grid_traveldetail.addRow(rowS);
    	}--%>
    }
    
    
    function removeTicket(){
		var rows = grid_traveldetail.getSelecteds();
        if (rows.length>0) {
            grid_traveldetail.removeRows(rows, true);
        }else{
        	nui.alert("请至少选中一条记录！");
        }
	}
	
	
	function changeValue(e){
	
		console.log(e.selected);
		nui.get("firstName").setValue(e.selected.itemName);
		var parentId = e.selected.id;
		var url = "com.zhonghe.ame.purchase.purchaseItems.queryPurchaseItem.biz.ext?parentId="+parentId;
		console.log(url);
		nui.get("secondInput").setUrl(url);
		
	}
	
	function changeValue2(e){
	
		console.log(e.selected);
		nui.get("secondName").setValue(e.selected.itemName);
		var parentId = e.selected.id;
		var url = "com.zhonghe.ame.purchase.purchaseItems.queryPurchaseItem.biz.ext?parentId="+parentId;
		console.log(url);
		nui.get("threeInput").setUrl(url);
		//nui.get("secondInput").setUrl(url);
		
	}
	
	function changeValue3(e){
	
		console.log(e.selected);
		nui.get("threeName").setValue(e.selected.itemName);
		
		//nui.get("secondInput").setUrl(url);
		
	}
	
	  function GetData() {
        var node = tree.getSelectedNode();
        return node;
    }
    function search() {
        var key = mini.get("key").getValue();
        if(key == ""){
            tree.clearFilter();
        }else{
            key = key.toLowerCase();
            tree.filter(function (node) {
                var text = node.text ? node.text.toLowerCase() : "";
                if (text.indexOf(key) != -1) {
                    return true;
                }
            });
        }
    }
    
    function onOk(){
        var node = tree.getSelectedNode();
        if (node && tree.isLeaf(node) == false) {
            alert("不能选中父节点");
            return;
        }

        CloseWindow("ok");        
    }
    function onCancel() {
        CloseWindow("cancel");
    }
    function onKeyEnter(e) {
        search();
    }
    function onNodeDblClick(e) {
       	 var node = tree.getSelectedNode();
        if (node && tree.isLeaf(node) == false) {
            alert("不能选中父节点");
            return;
        }

        CloseWindow("ok");  
    }
   
    function CloseWindow(action) {
        if (window.CloseOwnerWindow) return window.CloseOwnerWindow(action);
        else window.close();
    }

	
</script></body>
</html>
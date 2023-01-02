<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@include file="/purchase/common/common.jsp"%>
<html>
<head>
    <title>供应商审核</title>
</head>
<body>
<%long workitemid = (Long)request.getAttribute("workItemID");%>
    	<div class="nui-fit" >
			<fieldset id="field1" style="border: solid 1px #aaa;padding: 3px;width: 98%;">
				<legend>采购计划信息</legend>
				<form id="form1" method="post">
			<!-- 供应商id -->
			<input name="files" id="fileids" class="nui-hidden"/>
			<input name="custid" id="custid"  class="nui-hidden"/>
			<!-- 创建人id，默认当前用户id -->
			<input name="createUserid" id="createUserid" class="nui-hidden"/>
			<!-- 文件上传 -->
			<fieldset style="border:solid 1px #aaa;padding:3px;">
				<legend>基本资料</legend>
				<table style="table-layout:fixed;" id="table_file1">
					<tr>
						<td colspan="1" align="right" style="width:120px">供应商名称:</td>
						<td colspan="3"><input name="custname" id="custname" class="nui-textbox" required="true" style="width:100%"/></td>
						
					</tr>
					<tr>
						<td colspan="1" align="right" style="width:120px">供应商简称:</td>
						<td><input name="suppliersname" id="suppliersname" class="nui-textbox"  style="width:100%" showNullItem="true" /></td>
						<td align="right" style="width:120px">注册资金(万元):</td>
						<td><input name="registercap" id="registercap" class="nui-spinner" maxValue="9999999999999999" style="width:100%"/></td>
					</tr>
					<tr>
						<td align="right" style="width:120px">供应商联系人:</td>
						<td><input name="linkman" id="linkman" class="nui-textbox" style="width:100%"/></td>
						<td align="right" style="width:120px">供应商联系电话:</td>
						<td><input name="linktel" id="linktel" class="nui-textbox" style="width:100%"/></td>
					</tr>
					<tr>
						<td align="right" style="width:120px">供应商类型:</td>
						<td>
							<input name="custtype"  class="nui-dictcombobox" dictTypeId="AME_SUPTYPE" showNullItem="true" style="width:100%"/>
						</td>
					</tr>
					<tr>
						<td colspan="1" align="right" style="width:120px">供货范围:</td>
						<td colspan="3"><input name="comments" id="comments" class="nui-textarea" style="width:100%"/ emptyText=" 填写合同所涉及需评价物项"></td>
					</tr>
				</table>
			</fieldset>
		</form>
			<jsp:include page="/ame_common/misOpinion.jsp"/>
        </fieldset>
	</div>
	<div style="text-align:center;padding:10px;border-width:1px 0px 0px 0px;" class="nui-toolbar">               
	    <a class="nui-button" onclick="submit" style="width:60px;margin-right:20px;">提交</a>       
	    <a class="nui-button" onclick="onCancel" style="width:60px;">关闭</a>
	</div>  
<script type="text/javascript">
	    nui.parse();
	    var form = new nui.Form("#form1");
	    var grid_traveldetail = nui.get("grid_traveldetail");
	   	form.setEnabled(false);
	   	init();
	   	function init(){
	   		var json = nui.encode({"workitemid":<%=workitemid%>});
	   		nui.ajax({	
					url: "com.zhonghe.ame.purchase.purSupplier.querySupplierDetail.biz.ext",
				    type: 'POST',
			        data: json,
			        success: function (o) {
						 form.setData(o.data);
			       		 var grid = nui.get("datagrid1");
			       		 
						 grid.load({processInstID:o.data.processid});
						 grid.sortBy("time", "desc");
						 //初始化处理意见
						 initMisOpinion({auditstatus:"1"});
						 document.getElementById("salesEdit").style.display="none";
						 nui.get("backTo").setData(o.seal.backList);
			       		 
			        },
				    error: function (jqXHR, textStatus, errorThrown) {
				        alert(jqXHR.responseText);
				    }
			    }); 
	   		
	   	
	   	}
	   	
	   	
	   	  	function submit(){
	    	var auditstatus = nui.get("auditstatus").getValue();
	    	console.log(auditstatus);
	    	if(auditstatus == "2"){	//终止流程
	    		titleText = "终止";
	    		submitProcess("终止");
	    	}else if(auditstatus == "0"){	//退回流程
	    		if(!nui.get("backTo").getValue()){
	    			nui.alert("退回环节不能为空！");
	    			return;
	    		}
	    		titleText = "退回";
	    		submitProcess("退回");
	    	}else if(auditstatus == "1"){	//提交流程
	    		titleText = "提交";
	    		submitProcess("提交");
	    	}
    }
    
    
     // 提交 
    	function submitProcess(title){
	    	nui.confirm("确定" + title + "流程吗？", "操作提示",function (action) {            
	            if (action == "ok") {
					var misOpinion = opioionform.getData().misOpinion;//审核意见
	            	/* nui.get("appButton").setEnabled(false); */
	            	var json = {misOpinion:misOpinion,workItemID: <%=workitemid %>};
	            	saveData(json);
	            }
	        });
	   }
	   	
	   		function saveData(json){
			console.log(json);
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
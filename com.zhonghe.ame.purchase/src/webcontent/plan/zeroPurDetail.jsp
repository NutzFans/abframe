<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <title>新增采购计划</title>
    <script src="<%= request.getContextPath() %>/common/nui/nui.js" type="text/javascript"></script>
	<%-- <script type="text/javascript" src="<%=request.getContextPath() %>/common/components/swffileupload/swfupload/swffileupload.js"></script> --%>
	<link rel="stylesheet" href="<%=request.getContextPath()%>/common/nui/resource/kindeditor/themes/default/default.css" />
	<script charset="utf-8" src="<%=request.getContextPath()%>/common/nui/resource/kindeditor/kindeditor-all-min.js"></script>
	<script charset="utf-8" src="<%=request.getContextPath()%>/common/nui/resource/kindeditor/lang/zh-CN.js"></script>
	<script charset="utf-8" src="<%=request.getContextPath() %>/common/nui/resource/kindeditor/plugins/code/prettify.js"></script>
	<style type="text/css">
	    body{
	        margin: 0;padding: 0;border: 0;width: 100%;height: 100%;overflow: hidden;	
	    } 
    </style>
</head>
<body>
	<div class="nui-fit" >
	<div class="mini-panel" title="" style="width: 100%;">
	<fieldset id="field1" style="border: solid 1px #aaa;padding: 3px;width: 99%;">
			<legend>采购计划信息</legend>
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
							<input style="width:100%;height: 120px;" name="applyReason"
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
		            </div>
		        </div>
				</div>
	 	  	</fieldset>
			
			<fieldset id="field3" style="border: solid 1px #aaa; padding: 0px;">
				<jsp:include page="/ame_common/detailFile.jsp"/>
			</fieldset>
    </fieldset>
	</div>
</div>
<script type="text/javascript">
	    nui.parse();
	    var form = new nui.Form("#form1");
	    var grid_traveldetail = nui.get("grid_traveldetail");
	    var purchaseFirstCode = nui.get("purchaseFirstCode");
	    var firstItemName = nui.get("firstItemName");
	    var purchaseTwoCode = nui.get("purchaseTwoCode");
	    var secondItemName = nui.get("secondItemName");
	    var purchaseThreeCode = nui.get("purchaseThreeCode");
	    var threeItemName = nui.get("threeItemName");
	   	var competBidPrice = nui.get("competBidPrice");
	   	var processid = <%=request.getParameter("processid")%>;
	   	if(processid==null){
	   		processid = <%=request.getParameter("processInstID")%>;
	   	}
	   		init();
	   	function init(){
	   		var json = nui.encode({"processid":processid});
	   		nui.ajax({	
					url: "com.zhonghe.ame.purchase.purchaseItems.queryPurZeroDetail.biz.ext",
				    type: 'POST',
			        data: json,
			        success: function (o) {
						 form.setData(o.purZero);
						 form.setEnabled(false);
						 
						 // 查询明细
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
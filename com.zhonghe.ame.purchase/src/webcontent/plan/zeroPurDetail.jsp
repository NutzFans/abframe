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
					<div style="padding: 5px; margin-left:5%;">
				<table style="table-layout: fixed;" id="table_file">
            	
            	<tr>
            		<td class="form_label" align="right">零星采购名称：</td>
	                <td >
	                    <input enabled="false" id="purchaseName" name="purchaseName" class="nui-textbox" required="true" />
	                </td>
	                <td class="form_label" align="right">零星采购编号：</td>
	                <td >
	                    <input enabled="false" id="purchaseCode" name="purchaseCode" class="nui-textbox" required="true" />
	                </td>
	                <td class="form_label" align="right">采购单位：</td>
                    <td >
                    	<input enabled="false" name="orgId" id="orgId"
									class="nui-combobox" required="true"
									url="com.primeton.rdmgr.labor.labormgr.getAllOrgs.biz.ext"
									filterType="like" textField="orgname" valueField="orgid"
									dataField="allorgs" valueFromSelect="true" allowInput="true"
									 style="width:200px;" />    
                    </td>
            	</tr>
            	<tr>
            		<td class="form_label" align="right">总金额：</td>
	                <td >
	                    <input enabled="false" id="totalAmount" name="totalAmount" class="nui-textbox" required="true" />
	                </td>
            	</tr>
            	<tr>
            		<td class="form_label" align="right">申请原因：</td>
	                 <td  colspan="7">    
                        <input enabled="false" style="width:100%;height: 40px;" name="applyReason" id="applyReason" class="nui-textarea" id="remark"  required="true"/>
                    </td>
            	</tr>
            	
         
            </table>
        </div>
        </form>
	         <fieldset  style="height:100%; border:solid 1px #aaa;padding:3px;">
     <div class="fieldset-body"  style="width:100%; height:100%; margin: 0px auto">
<!--      <a class="nui-button" id="addbtn" iconCls="icon-add" onclick="addTicket()">增加</a> 
                  <a class="nui-button" id="deltbtn" iconCls="icon-remove" onclick="removeTicket()">删除</a>  -->
	    	<div id="grid_traveldetail" class="nui-datagrid" style="width: 80%;height: auto;" allowCellSelect="true" 
	    		showPager="false" allowCellEdit="true" multiSelect="true" dataField="purZeroItem" 
	    		url="com.zhonghe.ame.purchase.purchaseItems.queryPurZeroItem.biz.ext">
	            <div property="columns">
	                <div field="itemName"  width="130" align="center" headerAlign="center"  >采购物项名称
							<input enabled="false" id="itemName" name="itemName" property="editor"  class="nui-textbox"  />
	                </div>
	               <div  field="brandSpec" width="130" align="center" headerAlign="center"  >品牌/型号/规格
							<input enabled="false" id="brandSpec" name="brandSpec" property="editor"  class="nui-textbox"   />
	                </div>
	                <div  field="supplierName"  width="130" align="center" headerAlign="center"  >供应商
							<input enabled="false" id="supplierName" name="supplierName" property="editor"  class="nui-textbox"  />
	                </div>
	                <div  field="onePrice"  width="130" align="center" headerAlign="center"  >单价(万元)
							<input enabled="false" id="onePrice" name="onePrice" property="editor"  class="nui-textbox"  />
	                </div>
	                <div  field="num"  width="130" align="center" headerAlign="center" > 数量
							<input enabled="false" id="num" name="num" property="editor"  class="nui-textbox"  />
	                </div>
	                <div   field="totalPrice" width="130" align="center" headerAlign="center"  >总价(万元)
							<input enabled="false" id="totalPrice" name="totalPrice" property="editor"  class="nui-textbox"  />
	                </div>
	                <div   field="remark" width="130" align="center" headerAlign="center"  >备注
							<input enabled="false" id="remark" name="remark" property="editor"  class="nui-textbox"   />
	                </div>
	            </div>
	        </div>
		</div>
			</fieldset>
        </fieldset>
        
        
   
	</div>
</div>

<!--	<div style="text-align:center;padding:10px;border-width:1px 0px 0px 0px;" class="nui-toolbar">               
	    <a class="nui-button" onclick="submit" style="width:60px;margin-right:20px;">提交</a>       
	    <a class="nui-button" onclick="onCancel" style="width:60px;">关闭</a>
	</div>  -->
   

      

<script type="text/javascript">
	    nui.parse();
	    //var updateURL = "com.primeton.mis.contract.contract.updateContract.biz.ext";
	    var saveURL = "com.primeton.mis.contract.contract.addContract.biz.ext";
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
						 
	            		 nui.get("purchaseName").setValue(o.purZero.purchaseName);
			       	  	 nui.get("purchaseCode").setValue(o.purZero.purchaseCode);
			       	  	 nui.get("orgId").setText(o.purZero.orgname);
             			 nui.get("applyReason").setValue(o.purZero.applyReason);
			       	  	nui.get("totalAmount").setValue(o.purZero.totalAmount);
			       		 
			       		 var grid = nui.get("datagrid1");
			       		 console.log()
						/*  grid.load({processInstID:o.purZero.processid});
						 grid.sortBy("time", "desc"); */
						  //初始化处理意见
						 /* initMisOpinion({auditstatus:"1"}); */
						 var jsonData = {"zeroId":o.purZero.id}
						 console.log(jsonData);
			       		 grid_traveldetail.load(jsonData); 
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
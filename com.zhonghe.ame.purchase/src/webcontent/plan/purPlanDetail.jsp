<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@include file="/purchase/common/common.jsp"%>
<html>
<head>
    <title>采购计划查看</title>
    <style type="text/css">
    	html, body{font-size:12px;padding:0;margin:0;border:0;height:100%;overflow:hidden;width:100%;}
    </style>
</head>
<body>
<div class="nui-fit">
    <div class="nui-fit">
			<div id="form1" method="post">
				<fieldset style="border:solid 1px #aaa;padding:3px;width: 99%">
					<legend>采购计划信息</legend>
					<form id="form1" method="post">
						<div style="padding: 5px;  ">
							<table style="table-layout: fixed;" id="table_file">
								<tr>
				            		<td class="form_label" align="right" style="width:120px;">年度采购计划名称：</td>
					                <td colspan="6">
					                    <input id="name" name="name" class="nui-textbox" required="true"  style="width:100%;" />
					                </td>
				
				            	</tr>
				            	<tr>
				            		<td class="form_label" align="right" style="width:120px;">计划年度：</td>
					                <td>
					                    <input id="year" name="year" style="width:100px;" class="nui-textbox" style="width:150px;" required="true"/>   
					                </td>
					                <td class="form_label" align="right" style="width:120px;">提报人姓名：</td>
				                    <td>
				                        <input class="nui-textbox"  name="infomantUser" id="infomantUser" required="true" style="width:200px;"readonly="readonly"/>
				                    </td>
					                <td class="form_label" align="right" style="width:80px;">采购单位：</td>
				                    <td>
				                    
				                    <input id="needOrgName" name="needOrgName" class="nui-textbox" required="true" style="width:100%;" readonly="readonly"/>
				                    <input id="needOrgId" name="needOrgId" class="nui-hidden" required="true" style="width:100%;" />
				
				            	</tr>
				               	<tr>
				                    <td class="form_label" align="right" style="width:100px;">采购类型：</td>
				                    <td >    
				                        <input class="nui-dictcombobox" name="type" id="type" dictTypeId="ZH_PURCHASE" required="true" onvaluechanged="loadItem()" style="width:100px;"/>
				                    </td>
				                    <td class="form_label" align="right" style="width:100px;">计划总金额(万元)：</td>
					                <td >
					                    <input id="budgetAmount" name="budgetAmount" class="nui-textbox" required="true"   readOnly="readOnly"  style="width:100%;" />
					                </td>
					                 <td class="form_label" align="right" style="width:100px;">物项归口部门：</td>
					                <td >
					                    <input id="putunder" name="putunder" class="nui-dictcombobox"  dictTypeId="ZH_PUTUNDER"  onvaluechanged="loadItem()"  style="width:100%;" />
					                </td>
				                 </tr>
				              	<tr>
				              		<td class="form_label" style="width:120px;" align="right">备注：</td>
				                    <td  colspan="6">    
				                        <input style="width:100%;height:120px;" name="remark" class="nui-textarea" id="remark"/>
				                    </td>
				              	</tr>
							</table>
						</div>
					</form>
						<div id="grid_traveldetail" class="nui-datagrid" style="width: 100%;height: auto;"
							allowCellSelect="true" showPager="false" allowCellEdit="true" multiSelect="true"
							dataField="purPlanItem"
							url="com.zhonghe.ame.purchase.purchaseItems.queryPurPlanItem.biz.ext">
							<div property="columns">
       							<div type="checkcolumn"></div>
				           		<div type="indexcolumn" align="center" headerAlign="center"></div>
				           		<div  field="code" width="110" align="center" headerAlign="center"  visible="false" >计划编号</div>
				                <div  field="purchaseFirstCode" width="110" align="center" headerAlign="center" visible="false">物项大类编码</div>
				                <div field=purchaseFirstName width="110" align="center" headerAlign="center"  >物项大类名称 </div>
				                <div  field="purchaseTwoCode" width="110" align="center" headerAlign="center" visible="false">物项中类编码</div>
				                <div  field="purchaseTwoName" width="110" align="center" headerAlign="center" renderer="onViewL" >物项中类名称 </div>
				                <div field="purchaseThreeCode" id="purchaseThreeCode" width="110" align="center" headerAlign="center"  readOnly="true"  visible="false">物项小类编码</div>
				                <div field="purchaseThreeName"  width="110" align="center" headerAlign="center" renderer="onViewL" >物项小类名称 </div>
				                <div field="materialName"  width="110" align="center" headerAlign="center" vtype="required"  renderer="onViewL" >采购物项名称 </div>
				                <div field="unit"  width="70" align="center" headerAlign="center" renderer="unitValue">单位</div>
				                <div field="number"  width="80" align="center" headerAlign="center" visible="false" vtype="required">数量</div>
				                <div field="budgetAmount"  width="100" align="center" headerAlign="center" renderer="onViewL"   vtype="required">预算金额(万元)</div>
				                <div field="contractname"  width="100" align="center" headerAlign="center" renderer="onViewL" visible="false">拟签合同名称</div>
				                <div field="plansimplementtime"  width="100" align="center" headerAlign="center"  visible="false" vtype="required">拟实施采购时间</div>
				                <div field="contractamount"  width="100" align="center" headerAlign="center" renderer="onViewL" visible="false">拟签合同金额(元)</div>
				                <div field="technologyNeed"  width="100" align="center" headerAlign="center" >技术要求</div>
				                <div field="keyIssus"  width="100" align="center" headerAlign="center"  renderer="onYn">是否关键事项</div>
				                <div field="isProject"  width="100" align="center" headerAlign="center" value="1" renderer="onYn">是否工程建设下项目采购</div>
				                <div field="projectname"  width="100" align="center" headerAlign="center" >所属项目名称</div>
				                <div field="remark"  width="100" align="center" headerAlign="center"  >备注</div>
				            </div>
						</div>
				</fieldset>
			</div>
		</div>
</div>
</body>
<script type="text/javascript">
	    nui.parse();
	    nui.parse();
		var form = new nui.Form("#form1");
		var grid_traveldetail = nui.get("grid_traveldetail");
		var competBidPrice = nui.get("competBidPrice");
		var id = <%=request.getParameter("id") %> ;
		isViewDelete = false;
		form.setEnabled(false)
		var processid = <%=request.getParameter("processid") %> ;
		if (processid == null) {
			processid = <%=request.getParameter("processInstID") %> ;
		}
		init();
		function init() {
			var json = nui.encode({
				"processid": processid
			});
			nui.ajax({
				url: "com.zhonghe.ame.purchase.purchaseItems.queryPurPlanDetail.biz.ext",
				type: 'POST',
				data: json,
				success: function(o) {
					console.log(o)
					form.setData(o.purPlan)
					var jsonData = {
						"planId": o.purPlan.id
					}
					grid_traveldetail.load(jsonData);
				},
				error: function(jqXHR, textStatus, errorThrown) {
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
    	<%-- function submitProcess(title){
	    	nui.confirm("确定" + title + "流程吗？", "操作提示",function (action) {            
	            if (action == "ok") {
					var misOpinion = opioionform.getData().misOpinion;//审核意见
	            	/* nui.get("appButton").setEnabled(false); */
	            	var json = {misOpinion:misOpinion,workItemID: <%=workitemid %>};
	            	saveData(json);
	            }
	        });
	   } --%>
	   		
   	function unitValue(e) {
		return nui.getDictText("ZH_UNIT", e.value);
	}
   		
	   		
	   		function saveData(json){
			console.log(json);
			mini.mask({
		            el: document.body,
		            cls: 'mini-mask-loading',
		            html: titleText+'中...'
		        });
		    	 nui.ajax({
		  			url: "com.zhonghe.ame.purchase.purchaseItems.approvalPurPlan.biz.ext",
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
	   		debugger;
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
				                  		firstItemValue:tmp.itemName,
 				       	           		firstItemCode:tmp.itemCode
				                  	});                           		
                          	}
                          	
                          	if(tmp.grade==2){
                          	    
                          	    var grid_traveldetail = nui.get("grid_traveldetail");
                          	    var row = grid_traveldetail.getSelected();
				                  	grid_traveldetail.updateRow(row,{
				                  		secondItemValue:tmp.itemName,
 				       	           		secondItemCode:tmp.itemCode
				                  	});                           		
                          	}
                          	if(tmp.grade==3){
                          	    
                          	    var grid_traveldetail = nui.get("grid_traveldetail");
                          	    var row = grid_traveldetail.getSelected();
				                  	grid_traveldetail.updateRow(row,{
				                  		threeItemValue:tmp.itemName,
 				       	           		threeItemCode:tmp.itemCode
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

	
</script>
</html>
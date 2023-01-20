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
					<div style="padding: 5px;  ">
				<table style="table-layout: fixed;" id="table_file">
            	
            	<tr>
            		<td class="form_label" align="right" style="width:120px;">年度采购计划名称：</td>
	                <td style="width: 300px;">
	                    <input id="purchasesName" name="purchasesName" class="nui-textbox" required="true" style="width:100%;" />
	                </td>
	                <td class="form_label" align="right" style="width:100px;">年度采购计划编号：</td>
	                <td style="width: 180px;">
	                    <input id="purchaseNumber" name="purchaseNumber" class="nui-textbox" required="true" style="width:100%;" />
	                </td>
	                <td class="form_label" align="right" style="width:80px;">采购单位：</td>
                    <td style="width: 300px;">
                    	<input name="needOrgId" id="orgId"
									class="nui-combobox" required="true"
									url="com.primeton.rdmgr.labor.labormgr.getAllOrgs.biz.ext"
									filterType="like" textField="orgname" valueField="orgid"
									dataField="allorgs" valueFromSelect="true" allowInput="true"
									 style="width:100%;" />    
                    </td>
            	</tr>
            	
               	<tr>
                    <td class="form_label" align="right" style="width:120px;">采购类型：</td>
                    <td >    
                        <input class="nui-dictcombobox" name="type" id="type" dictTypeId="ZH_PURCHASE" required="true" onvaluechanged="typeChange" style="width:100%;"/>
                    </td>
                    
                    <td class="form_label" align="right" style="width:200px;">总价(万元)：</td>
	                <td >
	                    <input id="totalPrice" name="totalPrice" class="nui-textbox" required="true"   readOnly="readOnly"  style="width:100%;" />
	                </td>
                </tr>
                
                 <tr id="one1">
                	<td class="form_label" align="right" style="width:120px;">提报人姓名：</td>
                    <td>
                        <input class="nui-textbox"  name="infomantUser" id="infomantUser" dictTypeId="ZH_PURCHASE" required="true" style="width:100%;"/>
                    </td>
                    <td class="form_label" align="right" style="width:120px;">提报人电话：</td>
                    <td>    
                        <input class="nui-textbox"  name="infomantPhone" id="infomantPhone" dictTypeId="ZH_PURCHASE" required="true" style="width:100%;"/>
                    </td>
                    
                </tr>
              	  <tr id="one11">
                	<td class="form_label" align="right" style="width:120px;">是否关键事项：</td>
                    <td>    
                        <input class="nui-dictcombobox" name="keyIssus"  id="keyIssus" dictTypeId="MIS_YN" required="true" style="width:100%;"/>
                    </td>
                    <td class="form_label" align="right" style="width:120px;">是否工程建设下项目采购：</td>
                    <td>    
                        <input class="nui-dictcombobox" name="isProject" id="isProject" dictTypeId="MIS_YN" required="true" style="width:100%;"/>
                    </td>
                </tr>
                
          	    <tr id="one2">
                	<td class="form_label" align="right" style="width:120px;">采购标包中拟签合同名称：</td>
                    <td>    
                        <input class="nui-textbox" name="packageContract" id="packageContract" dictTypeId="ZH_PURCHASE" required="true" style="width:100%;"/>
                    </td>
                    <td class="form_label" align="right" style="width:120px;">需签合同金额(元)：</td>
                    <td>    
                        <input class="nui-spinner" minValue="0"  maxValue="999999999" name="contrackPrice" id="contrackPrice" dictTypeId="ZH_PURCHASE" required="true" style="width:100%;"/>
                    </td>
                    <!-- <td class="form_label" align="right" style="width:120px;">属于零星采购金额：</td>
                    <td>    
                        <input class="nui-textbox" name="zeroPrice" id="zeroPrice" dictTypeId="ZH_PURCHASE" required="true" style="width:200px;"/>
                    </td> -->
                     <!-- <td class="form_label" align="right" style="width:120px;">需求单位联系人邮箱：</td>
                    <td>    
                        <input class="nui-textbox" name="needOrgEmpemail" id="needOrgEmpemail" dictTypeId="ZH_PURCHASE" required="true" style="width:100%;"/>
                    </td> -->
                </tr> 
                <tr id="one22">
                	<td class="form_label" align="right" style="width:120px;">需求单位联系人：</td>
                    <td>    
                        <input class="nui-textbox" name="needOrgEmpname" id="needOrgEmpname" dictTypeId="ZH_PURCHASE" required="true" style="width:100%;"/>
                    </td>
                    <td class="form_label" align="right" style="width:120px;">需求单位联系电话：</td>
                    <td>    
                        <input class="nui-textbox" name="needOrgEmpphone" id="needOrgEmpphone" dictTypeId="ZH_PURCHASE" required="true" style="width:100%;"/>
                    </td>
                   <td class="form_label" align="right" style="width:120px;">需求单位联系人邮箱：</td>
                    <td>    
                        <input class="nui-textbox" name="needOrgEmpemail" id="needOrgEmpemail" dictTypeId="ZH_PURCHASE" required="true" style="width:100%;"/>
                    </td>
                </tr>   
              	<tr id="one111">
              		<td class="form_label"  align="right" style="width:120px;">技术要求：</td>
                    <td colspan="7">    
                        <input style="width:100%;height: 70px;" name="technologyNeed" class="nui-textarea"  id="technologyNeed" dictTypeId="ZH_PURCHASE" required="true"/>
                    </td>
              	</tr>
              	<tr>
              		<td class="form_label" style="width:120px;" align="right">备注：</td>
                    <td  colspan="7">    
                        <input style="width:100%;height:70px;" name="remark" class="nui-textarea" id="remark" dictTypeId="ZH_PURCHASE" required="true"/>
                    </td>
              	</tr>
            </table>
        </div>
        </form>
	         <fieldset  style="height:80%; border:solid 1px #aaa;padding:3px;">
     <div class="fieldset-body"  style="width:100%; height:100%; margin: 0px auto">
     <a class="nui-button" id="addbtn" iconCls="icon-add" onclick="addTicket()">增加</a> 
                  <a class="nui-button" id="deltbtn" iconCls="icon-remove" onclick="removeTicket()">删除</a> 
	    	<div id="grid_traveldetail" class="nui-datagrid" style="width: 100%;height: auto;" allowCellSelect="true" 
	    		showPager="false" allowCellEdit="true" multiSelect="true" oncellendedit="getHTZQ">
	            <div property="columns">
	             <div  width=""  headerAlign="center" align="center" allowSort="true" renderer="buttonRenderConclude">
	              </div>
	                <div  field="purchaseFirstCode" width="110" align="center" headerAlign="center"  >采购物项大类编码
							<input id="purchaseFirstCode" name="purchaseFirstCode" property="editor"  class="nui-textbox" enabled="false" onbuttonclick="onButtonEdit123" />
	                </div>
	                <div field="firstItemName" width="110" align="center" headerAlign="center"  >采购物项大类名称 
	                	<input  id="firstItemName" name="firstItemName" property="editor" class="nui-textbox" vtype="maxLength:100"  enabled="false" />
	                </div> 
	                <div  field="purchaseTwoCode" width="110" align="center" headerAlign="center">采购物项中类编码
							<input  property="editor" id="purchaseTwoCode" name="purchaseTwoCode" class="nui-textbox"  enabled="false" />
	                </div>
	                <div  field="secondItemName" width="110" align="center" headerAlign="center" renderer="onViewL" >采购物项中类名称 
	                	<input  property="editor" id="secondItemName" name="secondItemName" class="nui-textbox" vtype="maxLength:100"  enabled="false" />
	                </div> 
	                <div field="purchaseThreeCode" id="purchaseThreeCode" width="110" align="center" headerAlign="center">采购物项小类编码
								<input  property="editor" id="purchaseThreeCode" name="purchaseThreeCode" class="nui-textbox" onbuttonclick="onButtonEdit123"  enabled="false" />
	                </div>
	                <div field="threeItemName" id="threeItemName" width="110" align="center" headerAlign="center" renderer="onViewL" >采购物项小类名称 
	                	<input   property="editor" class="nui-textbox" id="threeItemName"  name="threeItemName" enabled="false" />
	                </div>
	                <div field="unit"  width="80" align="center" headerAlign="center"  renderer="unitValue">计量单位
	                	<input property="editor" class="nui-dictcombobox" dictTypeId="ZH_UNIT" id="unit" name="unit"/>
	                </div> 
	                <div field="number"  width="80" align="center" headerAlign="center"  >数量
	                	<input property="editor"  class="nui-spinner" minValue="0"  maxValue="999999999"  id="number" name="number" />
	                </div> 
	                <!-- <div field="budgetAmount"  width="100" align="center" headerAlign="center" renderer="onViewL" >预算金额(万元)
	                	<input property="editor"  class="nui-spinner" minValue="0"  maxValue="999999999" id="budgetAmount" name="budgetAmount" onvaluechanged="addPrice"/>
	                </div> -->
	                <div field="budgetAmount"  width="100" align="center" headerAlign="center" renderer="onViewL" >预算金额(万元)
	                	<input property="editor" class="nui-spinner" minValue="0"  maxValue="999999999" id="budgetAmount" name="budgetAmount" onvaluechanged="addPrice"/>
	                </div>
	                <div field="plansimplementtime"  width="100" align="center" headerAlign="center" renderer="onViewL" >拟实施采购时间
	                	<input property="editor" class="nui-datepicker" id="plansimplementtime" name="plansimplementtime" onvaluechanged="addPrice"/>
	                </div>
	                <div field="contractname"  width="100" align="center" headerAlign="center" renderer="onViewL" >合同名称
	                	<input property="editor" class="nui-textbox" id="contractname" name="contractname" onvaluechanged="addPrice"/>
	                </div>
	                <div field="contractamount"  width="100" align="center" headerAlign="center" renderer="onViewL" >合同金额(元)
	                	<input property="editor"   class="nui-spinner"  minValue="0"  maxValue="999999999"  id="contractamount" name="contractamount" onvaluechanged="addPrice"/>
	                </div>
	            </div>
	        </div>
		</div>
			</fieldset>
        </fieldset>
        
	</div>
</div>
	<div style="text-align:center;padding:10px;border-width:1px 0px 0px 0px;" class="nui-toolbar">               
	    <a class="nui-button" onclick="submit" style="width:60px;margin-right:20px;">保存</a>       
	    <a class="nui-button" onclick="onCancel" style="width:60px;">关闭</a>
	</div>  
   

      

<script type="text/javascript">
	    nui.parse();
	    document.getElementById("one1").style.display="none";
	    document.getElementById("one11").style.display="none";
	    document.getElementById("one111").style.display="none";
	    document.getElementById("one2").style.display="none";
	    document.getElementById("one22").style.display="none";
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
	   	
	   	
	   	function unitValue(e){
	   		return nui.getDictText("ZH_UNIT",e.value);
		}	   		
	   	
	   	
	   	function submit(){
			var formData = form.getData();
			var gridData = grid_traveldetail.getData();
			console.log(gridData);
			
				var json = nui.encode({"purPlan":formData,"purPlanItem":gridData});
    			
				if(!confirm("是否保存？")){
        				return;
        			}else{	
		    	nui.ajax({
		                url: "com.zhonghe.ame.purchase.purchaseItems.addPurPlan.biz.ext",
		                data: json,
		                type: 'POST',
		                cache: false,
		                contentType: 'text/json',
		                success: function (text) {
		               		 nui.alert("新增采购计划成功",null,function(){
		               		 /* window.CloseOwnerWindow("save"); */
            					 CloseWindow();
            				});
		                
		                },
		                error: function (jqXHR, textStatus, errorThrown) {
		                    alert(jqXHR.responseText);
		                }
		            }); 
    	
    	
    	}}
    	
    	
    	  function getHTZQ(e){
        	if(e.field == "budgetAmount"){
	        	/* alert("1"); */
	        	var a=nui.get(grid_traveldetail).data.length;
	        	var b=0;
	        	for(var i=0;i<a;i++){
		    		b+=nui.get(grid_traveldetail).data[i].budgetAmount;
		    	}
		    	 nui.get("totalPrice").setValue(b)
        	}
       	  }
       	 
	   	
	   	function typeChange(e){
	   		
	   		if(e.value==2){
	   			console.log(purchaseThreeCode);
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
  
 s =   '<a class="conclude_edit_button  mini-button control_buttons"  data-tooltip="新增" data-placement="top" onclick="onButtonEdit123()" >'
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
		
		console.log(e);
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
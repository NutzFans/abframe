<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <title>年度采购计划</title>
    <script src="<%= request.getContextPath() %>/common/nui/nui.js" type="text/javascript"></script>
	<%-- <script type="text/javascript" src="<%=request.getContextPath() %>/common/components/swffileupload/swfupload/swffileupload.js"></script> --%>
	<link rel="stylesheet" href="<%=request.getContextPath()%>/common/nui/resource/kindeditor/themes/default/default.css" />
	<script charset="utf-8" src="<%=request.getContextPath()%>/common/nui/resource/kindeditor/kindeditor-all-min.js"></script>
	<script charset="utf-8" src="<%=request.getContextPath()%>/common/nui/resource/kindeditor/lang/zh-CN.js"></script>
	<script charset="utf-8" src="<%=request.getContextPath() %>/common/nui/resource/kindeditor/plugins/code/prettify.js"></script>
    <style type="text/css">
    	html, body{font-size:12px;padding:0;margin:0;border:0;height:100%;overflow:hidden;width:100%;}
    </style>
</head>
<body>
	<div class="nui-fit">
		<div class="mini-panel" title="" style="width: 100%;">
			<fieldset style="border: solid 1px #aaa;padding: 3px;width: 100%;">
				<legend>采购计划信息</legend>
				<form id="form1" method="post">
            <div  style="padding:5px;  margin-left:-10%;">
            <table style="table-layout:fixed;" id="table_file">
            
            <tr>
            		<td style="width:120px;" align="right">年度采购计划名称：</td>
	                <td style="width:150px;">
	                    <input id="purchasesName" style="width:200px;" class="nui-textbox" required="true" enabled="false"/>
	                </td>
	                <td style="width:120px;" align="right">年度采购计划编号：</td>
	                <td style="width:150px;">
	                    <input id="purchaseNumber" class="nui-textbox" required="true" enabled="false"/>
	                </td>
	                <td style="width:100px;" align="right">采购单位：</td>
                    <td style="width:150px;">
                    	<input name="orgId" id="orgId"
									class="nui-combobox" required="true"
									url="com.primeton.rdmgr.labor.labormgr.getAllOrgs.biz.ext"
									filterType="like" textField="orgname" valueField="orgid"
									dataField="allorgs" valueFromSelect="true" allowInput="true"
									 style="width:180px;" enabled="false"/>    
                    </td>
            	</tr>
            	
               <tr>
                    <td style="width:350px;" align="right">采购类型：</td>
                    <td style="width:150px;">    
                        <input class="nui-dictcombobox" style="width:200px;" name="cscontract.contracttype" id="type" enabled="false" dictTypeId="ZH_PURCHASE" required="true"/>
                    </td>
                    
                    <td class="form_label" align="right" style="width:200px;">总价(万元)：</td>
	                <td >
	                    <input id="totalPrice" name="totalPrice" class="nui-textbox" required="true"   readOnly="readOnly"  />
	                </td>
                    
                    <td style="width:350px;" align="right">物项归口部门：</td>
                    <td style="width:150px;">
                        <input class="nui-dictcombobox"  id="putunder" enabled="false" dictTypeId="ZH_PUTUNDER" style="width:180px;"  required="true" />
                    </td>
                </tr>
                
                 <tr id="one1">
                	<td align="right">提报人姓名：</td>
                    <td>    
                        <input class="nui-textbox"  id="infomantUser" dictTypeId="ZH_PURCHASE" required="true" enabled="false"/>
                    </td>
                    <td  align="right">提报人电话：</td>
                    <td>    
                        <input class="nui-textbox"  id="infomantPhone" dictTypeId="ZH_PURCHASE" required="true" enabled="false"/>
                    </td>
                    <td align="right">是否关键事项：</td>
                    <td>    
                        <input class="nui-dictcombobox"  id="keyIssus" dictTypeId="ZH_PURCHASE" required="true" enabled="false"/>
                    </td>
                </tr>
              	  <tr id="one11">
                	<td align="right">数量：</td>
                    <td>    
                        <input class="nui-textbox" id="number" dictTypeId="ZH_PURCHASE" required="true" enabled="false"/>
                    </td>
                    <td align="right">计量单位：</td>
                    <td>    
                        <input class="nui-dictcombobox"  id="unit" dictTypeId="ZH_PURCHASE" required="true" enabled="false"/>
                    </td>
                    <td align="right" style="width:150px;">是否工程建设下项目采购：</td>
                    <td>    
                        <input class="nui-dictcombobox"  id="isProject" dictTypeId="ZH_PURCHASE" required="true" enabled="false"/>
                    </td>
                </tr> 
                </tr>
              	  <tr id="one2">
                	<td align="right" style="width:150px;">采购标包中拟签合同名称：</td>
                    <td>    
                        <input class="nui-textbox"  style="width:200px;" id="packageContract" dictTypeId="ZH_PURCHASE" required="true" enabled="false"/>
                    </td>
                    <td align="right">需签合同金额：</td>
                    <td>    
                        <input class="nui-textbox"  id="contrackPrice" dictTypeId="ZH_PURCHASE" required="true" enabled="false"/>
                    </td>
                    
                </tr> 
                <tr id="one22">
                	<td align="right" style="width:150px;">需求单位联系人：</td>
                    <td>    
                        <input class="nui-textbox" style="width:200px;" id="needOrgEmpname" dictTypeId="ZH_PURCHASE" required="true" enabled="false"/>
                    </td>
                    <td align="right">需求单位联系电话：</td>
                    <td>    
                        <input class="nui-textbox"  id="needOrgEmpphone" dictTypeId="ZH_PURCHASE" required="true" enabled="false"/>
                    </td>
                    <td align="right" style="width:150px;">需求单位联系人邮箱：</td>
                    <td>    
                        <input class="nui-textbox" style="width:180px;"  id="needOrgEmpemail" dictTypeId="ZH_PURCHASE" required="true" enabled="false"/>
                    </td>
                </tr>   
              	<tr id="one111">
              		<td style="width:350px;" align="right">技术要求：</td>
                    <td colspan="7">    
                        <input style="width:90%;height: 40px;" class="nui-textarea"  id="technologyNeed" dictTypeId="ZH_PURCHASE" required="true" enabled="false"/>
                    </td>
              	</tr>
              	<tr>
              		<td style="width:350px;" align="right">备注：</td>
                    <td style="width:150px;" colspan="7">    
                        <input style="width:90%;height: 40px;" class="nui-textarea" id="remark" dictTypeId="ZH_PURCHASE" required="true" enabled="false"/>
                    </td>
              	</tr>
            </table>
        </div>
        </form>
        <fieldset style="border: solid 1px #aaa;padding: 3px;width: 100%;">
			    <legend>采购预算明细</legend>
			     <div class="fieldset-body"  style="width:100%; height:100%; margin: 0px auto">
			      <!-- <a class="nui-button" id="addbtn" iconCls="icon-add" onclick="addTicket()">增加</a> 
                  <a class="nui-button" id="deltbtn" iconCls="icon-remove" onclick="removeTicket()">删除</a>  -->
	    	<div id="grid_traveldetail" class="nui-datagrid" style="width: 95%;height: auto;" allowCellSelect="true" 
	    		showPager="false" allowCellEdit="true" multiSelect="true" dataField="purPlanItem" 
	    		url="com.zhonghe.ame.purchase.purchaseItems.queryPurPlanItem.biz.ext">
	            <div property="columns">
	            <!-- <div field="" width=""  headerAlign="center" align="center" allowSort="true" renderer="buttonRenderConclude">
           </div> -->
	                <div  field="firstitemcode" width="130" align="center" headerAlign="center" >采购物项大类编码
	                <input id="purchaseFirstCode" name="purchaseFirstCode" property="editor"  class="nui-textbox" enabled="false" onbuttonclick="onButtonEdit123" />
	                </div>
	                <div field="firstitemvalue" width="100" align="center" headerAlign="center"  >采购物项大类名称 	 
	                <input  id="firstItemName" name="firstItemName" property="editor" class="nui-textbox" vtype="maxLength:100"  enabled="false" />               	
	                </div> 
	                <div  field="seconditemcode" width="130" align="center" headerAlign="center">采购物项中类编码
	                <input  property="editor" id="purchaseTwoCode" name="purchaseTwoCode" class="nui-textbox"  enabled="false" />							
	                </div>
	                <div  field="seconditemvalue" width="100" align="center" headerAlign="center"  >采购物项中类名称 	 
	                <input  property="editor" id="secondItemName" name="secondItemName" class="nui-textbox" vtype="maxLength:100"  enabled="false" />               	
	                </div> 
	                <div field="threeitemcode"  width="130" align="center" headerAlign="center">采购物项小类编码		
	                <input  property="editor" id="purchaseThreeCode" name="purchaseThreeCode" class="nui-textbox" onbuttonclick="onButtonEdit123"  enabled="false" />						
	                </div>
	                <div field="threeitemvalue" width="100" align="center" headerAlign="center" >采购物项小类名称 	 
	                <input   property="editor" class="nui-textbox" id="threeItemName"  name="threeItemName" enabled="false" />               	
	                </div>
	                 <div field="unit"  width="80" align="center" headerAlign="center"  renderer="unitValue">计量单位
	                	<input property="editor" class="nui-dictcombobox" dictTypeId="ZH_UNIT" id="unit" name="unit"/>
	                </div> 
	                <div field="number"  width="100" align="center" headerAlign="center"  >数量
	                <input property="editor" class="nui-textbox" id="number" name="number" />
	                </div> 
	                <div field="competbidprice"  width="100" align="center" headerAlign="center" renderer="onViewL" >预算金额(万元)
	                <input property="editor" class="nui-textbox" id="budgetAmount" name="budgetAmount" onvaluechanged="addPrice"/>	                	
	                </div> 
	            </div>
	        </div>
	        </div>
		
			</fieldset>
        </fieldset>
        </div>
   
</div>
<%-- <jsp:include page="/ame_common/misOpinion.jsp"/> --%>
<div style="text-align:center;padding:10px;border-width:1px 0px 0px 0px;" class="nui-toolbar">               
     <a class="nui-button"  onclick="submit()" style="width:60px;margin-right:20px;">提交</a>       
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
	    var firstItemCode = nui.get("firstItemCode");
	    var firstItemValue = nui.get("firstItemValue");
	    var secondItemCode = nui.get("secondItemCode");
	    var secondItemValue = nui.get("secondItemValue");
	    var threeItemCode = nui.get("threeItemCode");
	    var threeItemValue = nui.get("threeItemValue");
	   	var competBidPrice = nui.get("competBidPrice");
	   	var processid = <%=request.getParameter("processid")%>;
	   	var id = <%=request.getParameter("id")%>;
	   	init();
	   	function init(){
	   		var json = nui.encode({"processid":processid});
	   		
	   		
	   		
	   		
	   		
	   		nui.ajax({	
					url: "com.zhonghe.ame.purchase.purchaseItems.queryPurPlanDetail.biz.ext",
				    type: 'POST',
			        data: json,
			        success: function (o) {
			        	 console.log(o);
			        	 nui.get("purchasesName").setValue(o.purPlan.purchasesName);
			        	 nui.get("purchaseNumber").setValue(o.purPlan.purchaseNumber);
			        	 nui.get("orgId").setText(o.purPlan.orgname);
			        	 nui.get("orgId").setValue(o.purPlan.needOrgId);
			        	 nui.get("type").setValue(o.purPlan.type);
			        	 nui.get("putunder").setValue(o.purPlan.putunder);
			        	 //nui.get("budgetAmount").setValue(o.purPlan.budgetAmount);
			        	 nui.get("remark").setValue(o.purPlan.remark);
			       	  	 if(o.purPlan.type==1){
			       	  	 	document.getElementById("one1").style.display="";
	   		   				document.getElementById("one11").style.display="";
	    	    			document.getElementById("one111").style.display="";
	    	    			document.getElementById("one2").style.display="none";
	            			document.getElementById("one22").style.display="none";
	            			nui.get("infomantUser").setValue(o.purPlan.infomantUser);
			       	  	    nui.get("infomantPhone").setValue(o.purPlan.infomantPhone);
			       	  	    nui.get("keyIssus").setValue(o.purPlan.keyIssus);
			       	  	    nui.get("number").setValue(o.purPlan.number);
			       	  	    nui.get("unit").setValue(o.purPlan.unit);
			       	  	    nui.get("isProject").setValue(o.purPlan.isProject);
			       	  	    nui.get("technologyNeed").setValue(o.purPlan.technologyNeed);
			       	  	 }else if(o.purPlan.type==2){
			       	  	 	document.getElementById("one2").style.display="";
				    		document.getElementById("one22").style.display="";
				    		document.getElementById("one1").style.display="none";
				    		document.getElementById("one11").style.display="none";
				    		document.getElementById("one111").style.display="none";
				    		nui.get("packageContract").setValue(o.purPlan.packageContract);
			       	  	 	nui.get("contrackPrice").setValue(o.purPlan.contrackPrice);
			       	  	 	/* nui.get("zeroPrice").setValue(o.purPlan.zeroPrice); */
			       	  	 	nui.get("needOrgEmpname").setValue(o.purPlan.needOrgEmpname);
			       	  		nui.get("needOrgEmpphone").setValue(o.purPlan.needOrgEmpphone);
			       	  	 	nui.get("needOrgEmpemail").setValue(o.purPlan.needOrgEmpemail);
			       	  	 }
			       		 
			       		
			       		
						 var jsonData = {"planId":o.purPlan.id}
						 console.log(jsonData);
			       		 grid_traveldetail.load(jsonData);
			       		 
			        },
				    error: function (jqXHR, textStatus, errorThrown) {
				        alert(jqXHR.responseText);
				    }
			    }); 
	   		
	   	
	   	}
	   	
	   	function unitValue(e){
	   		return nui.getDictText("ZH_UNIT",e.value);
		}	   
	   	
	   	
	   	function submit(){
	   	var formData = form.getData();
			var gridData = grid_traveldetail.getData();
			var json = nui.encode({"purPlan":formData,"purPlanItem":gridData,"id":id});
			console.log(json);
	    	mini.mask({
		            el: document.body,
		            cls: 'mini-mask-loading',
		            html: '采购计划修改流程发起中...'
		        }); 
		    	  nui.ajax({
		  			url: "com.zhonghe.ame.purchase.purchaseItems.editPurPlan.biz.ext",
					type: "post",
					data: json,
					contentType: "text/json",
					success: function (o){
						nui.unmask(document.body);
						if(o.result == "success"){
				        	nui.alert("采购计划修改流程提交成功","系统提示",function(){
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

	
</script></body>
</html>
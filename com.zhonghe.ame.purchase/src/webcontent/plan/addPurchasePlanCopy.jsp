<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@include file="/purchase/common/common.jsp"%>
<html>
<head>
    <title>新增采购计划</title>
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
									shownullItem=ture class="nui-treeselect" value="<%=userOrgId %>" textField="orgname" valueField="orgid" parentField="omOrganization.orgid" dataField="orgs" showTreeIcon="true" valueFromSelect="true" style="width:100%;" 
					     	url="com.zhonghe.ame.imptask.keytask.getAllRunOrgsforzdrw.biz.ext" allowInput="true" required="true" readonly="readonly"
					     	multiSelect="false" checkRecursive = "false" expandOnLoad="0" showFolderCheckBox="true"/>    
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
	                
	                 <td class="form_label" align="right" style="width:200px;">物项归口部门：</td>
	                <td >
	                    <input id="putunder" name="putunder" class="nui-dictcombobox"  dictTypeId="ZH_PUTUNDER" required="true"  onvaluechanged="loadItem"  style="width:100%;" />
	                </td>
                 </tr>
                
                 <tr id="one1">
                	<td class="form_label" align="right" style="width:120px;">提报人姓名：</td>
                    <td>
                        <input class="nui-textbox"  name="infomantUser" id="infomantUser" required="true" style="width:100%;"   value="<%=userName %>" readonly="readonly"/>
                    </td>
                    <td class="form_label" align="right" style="width:120px;">提报人电话：</td>
                    <td>    
                        <input class="nui-textbox"  name="infomantPhone" id="infomantPhone" required="true" style="width:100%;"/>
                    </td>
               	  </tr>
              	  <tr id="one11">
                	<td class="form_label" align="right" style="width:120px;">是否关键事项：</td>
                    <td>    
                        <input class="nui-dictcombobox" name="keyIssus"  id="keyIssus" dictTypeId="MIS_YN" required="true" style="width:100%;"/>
                    </td>
                    <td class="form_label" align="right" style="width:120px;">是否工程建设下项目采购：</td>
                    <td>    
                        <input class="nui-dictcombobox" name="isProject" id="isProject" dictTypeId="MIS_YN" onvaluechanged="isProject" onva required="true" style="width:100%;"/>
                    </td>
                    <td class="form_label" id="projectnameTD" align="right" style="width:120px;display: none">项目名称：</td>
                    <td>    
                        <input class="nui-textbox" name="projectname" id="projectname"   required="true" style="width:100%;display: none"/>
                    </td>
                </tr>
                <tr>
                	
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
                        <input style="width:100%;height:70px;" name="remark" class="nui-textarea" id="remark"/>
                    </td>
              	</tr>
            </table>
        </div>
        </form>
     <fieldset  style="height:80%; border:solid 1px #aaa;padding:3px;">
     <div class="fieldset-body"  style="width:100%; height:100%; margin: 0px auto">
     <a class="nui-button" id="addbtn" iconCls="icon-add" onclick="addTicket()">增加</a> 
                  <a class="nui-button" id="delbtn" iconCls="icon-remove" onclick="removeTicket()">删除</a> 
	    	<div id="grid_traveldetail" class="nui-datagrid" style="width: 100%;height: auto;" allowCellSelect="true" 
	    	 	showPager="false" allowCellEdit="true" multiSelect="true" oncellendedit="getHTZQ" dataField="items" 
	    		url="com.zhonghe.ame.purchase.purchaseItem.loadPurPlan.biz.ext">
	           <div property="columns">
	           		<div  width="30px" field="add"  headerAlign="center" align="center" allowSort="true" visible="false" renderer="buttonRenderConclude"></div>
	              
	                <div  field="aitemcode" width="110" align="center" headerAlign="center"  >采购物项大类编码
							<input id="purchaseFirstCode" name="purchaseFirstCode" property="editor"  class="nui-textbox" readOnly="true" onbuttonclick="onButtonEdit123" />
	                </div>
	                <div field="aitemname" width="110" align="center" headerAlign="center"  >采购物项大类名称 
	                	<input  id="firstItemName" name="firstItemName" property="editor" class="nui-textbox" vtype="maxLength:100"/>
	                </div> 
	                <div  field="bitemcode" width="110" align="center" headerAlign="center">采购物项中类编码
							<input  property="editor" id="purchaseTwoCode" name="purchaseTwoCode" class="nui-textbox"  enabled="false" />
	                </div>
	                <div  field="bitemname" width="110" align="center" headerAlign="center" renderer="onViewL" >采购物项中类名称 
	                	<input  property="editor" id="secondItemName" name="secondItemName" class="nui-textbox" vtype="maxLength:100" />
	                </div> 
	                <div field="citemcode" id="purchaseThreeCode" width="110" align="center" headerAlign="center">采购物项小类编码
								<input  property="editor" id="purchaseThreeCode" name="purchaseThreeCode" class="nui-textbox" enabled="false" />
	                </div>
	                <div field="citemname" id="threeItemName" width="110" align="center" headerAlign="center" renderer="onViewL" >采购物项小类名称 
	                	<input   property="editor" class="nui-textbox" id="threeItemName"  name="threeItemName"  />
	                </div>
	                <div field="unit"  width="80" align="center" headerAlign="center"  renderer="unitValue">计量单位
	                	<input property="editor" class="nui-dictcombobox" dictTypeId="ZH_UNIT" id="unit" name="unit"/>
	                </div> 
	                <div field="number"  width="80" align="center" headerAlign="center"  vtype="required">数量
	                	<input property="editor"  class="nui-spinner" minValue="0"  maxValue="999999999"  id="number" name="number" />
	                </div> 
	                
	                <div field="budgetAmount"  width="100" align="center" headerAlign="center" renderer="onViewL" vtype="required">预算金额(万元)
	                	<input property="editor" class="nui-spinner" minValue="0"  maxValue="999999999" id="budgetAmount" name="budgetAmount"/>
	                </div>
	                <div field="plansimplementtime"  width="100" align="center" headerAlign="center" renderer="onViewL" vtype="required">拟实施采购时间
	                	<input property="editor" class="nui-datepicker" id="plansimplementtime" name="plansimplementtime"/>
	                </div>
	                <div field="contractname"  width="100" align="center" headerAlign="center" renderer="onViewL" >拟签合同名称
	                	<input property="editor" class="nui-textbox" id="contractname" name="contractname" />
	                </div>
	                <div field="contractamount"  width="100" align="center" headerAlign="center" renderer="onViewL" >拟签合同金额(元)
	                	<input property="editor"   class="nui-spinner"  minValue="0"  maxValue="999999999"  id="contractamount" name="contractamount" />
	                </div>
	            </div>
	        </div>
		</div>
		</fieldset>
        </fieldset>
	</div>
</div>
	<div style="text-align:center;padding:10px;border-width:1px 0px 0px 0px;" class="nui-toolbar">               
	    <a class="nui-button" onclick="onOk(0)" id="saveReimb" iconCls="icon-save" style="width: 80px;margin-right: 20px;">暂存</a>
		<a class="nui-button" onclick="onOk(1)" id="creatReimbProcess" iconCls="icon-ok" style="width: 80px;margin-right: 20px;">提交</a>
		<a class="nui-button" onclick="onCancel" id="saveReimbProcess" iconCls="icon-close" style="width: 80px;margin-right: 140px;">关闭</a>
	</div>  
<script type="text/javascript">
	    nui.parse();
	    document.getElementById("one1").style.display="none";
	    document.getElementById("one11").style.display="none";
	    document.getElementById("one111").style.display="none";
	    document.getElementById("one2").style.display="none";
	    document.getElementById("one22").style.display="none";
	   	
	   	nui.get("addbtn").disable();
	   	nui.get("delbtn").disable();
	    var form = new nui.Form("#form1");
	    var grid = nui.get("grid_traveldetail");
	    var purchaseFirstCode = nui.get("purchaseFirstCode");
	    var firstItemName = nui.get("firstItemName");
	    var purchaseTwoCode = nui.get("purchaseTwoCode");
	    var secondItemName = nui.get("secondItemName");
	    var purchaseThreeCode = nui.get("purchaseThreeCode");
	    var threeItemName = nui.get("threeItemName");
	   	var competBidPrice = nui.get("competBidPrice");
	   	var type;
	   	function unitValue(e){
	   		return nui.getDictText("ZH_UNIT",e.value);
		}	   		
	   	
	   	function loadItem(){
	   		var purchaseType = nui.get("type").value;
	   		var putunder	 = nui.get("putunder").value;
	   		if(purchaseType==""||putunder==""||purchaseType=="3"){
	   			return;
	   		}else{
	   			grid.load({"purType":purchaseType,"orgId":putunder});
	   		}
	   	}
	   	
	   	function onOk(e){
	   		type=e;
	   		if(!form.validate()){
				nui.alert("请检查表单的完整性!");
				return;
			}
			var formData = form.getData();
			var gridData = grid.getData();
				formData.istype = type;
			
			/* grid.validate();
			if (grid.isValid() == false) {
				var error = grid.getCellErrors()[0];
				grid.beginEditCell(error.record, error.column);
				return;
			} */
			
			// 1为公司本部 2为分子公司
			var judge = <%=request.getParameter("judge")%>;
			var json = nui.encode({"purPlan":formData,"purPlanItem":gridData,"judge":judge});
			//判断采购类型 如为一级集采二级集采归口部门必填
			var type = nui.get("type").value;
			if(type!=3){
				var putunder = nui.get("putunder").value;
					if(putunder==null || putunder==''){
						nui.alert("公司本部职能部分发起采购计划时归口部门不能够为空");
						return;
					}
				}
			
			if(!confirm("是否保存？")){
        			return;
        		}else{	
        			var msg ="系统处理中"
        			form.loading(msg)
		    		nui.ajax({
		                url:"com.zhonghe.ame.purchase.purchaseItems.addPurPlan.biz.ext",
		                data: json,
		                type: 'POST',
		                cache: false,
		                contentType: 'text/json',
		                success: function (text) {
		                	form.unmask(msg)
		               		 nui.alert("新增采购计划成功",null,function(){
            					 CloseWindow();
            				});
		                },
		                error: function (jqXHR, textStatus, errorThrown) {
		                    alert(jqXHR.responseText);
		                }
		            }); 
    	
    		}
    	}
    	
    	function getHTZQ(e){
        	if(e.field == "budgetAmount"){
	        	var tempData = nui.get(grid_traveldetail).data;
	        	var a=tempData.length;
	        	var b=0;
	        	for(var i=0;i<a;i++){
	        		if(tempData[i].budgetAmount!=undefined){
			    		b+=tempData[i].budgetAmount;
	        		}else{
	        			var x = 0;
	        			b+=x;
	        		}
		    	}
		    	 nui.get("totalPrice").setValue(b)
        	}
       	  }
       	 
	   	function isProject(){
	   		if(nui.get("isProject").value==1){
	   			document.getElementById("projectname").style.display="";
	   			document.getElementById("projectnameTD").style.display="";
	   		}else{
	   			document.getElementById("projectname").style.display="none";
	   			document.getElementById("projectnameTD").style.display="none";
	   		}
	   		
	   	}
	   	
   		function buttonRenderConclude(e){
		 	var s = "";
		 s =   '<a class="conclude_edit_button  mini-button control_buttons"   data-placement="top" onclick="onButtonEdit123()" >'
		 +      '<span class="mini-button-icon mini-iconfont icon-add" style="margin:auto;margin-top: 12%;" >'
		 +   '</span>'
		 +  '</ a>'
		    return s;
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
                    	var row = grid.getSelected();
                        var iframe = this.getIFrameEl();
                        var data = iframe.contentWindow.GetData();
                       	  data = mini.clone(data);
                        if (data) {
                          for(var i = 0 ; i<data.length;i++){
                          	var tmp = data[i];
                  			var itemName = tmp.itemName,itemCode = tmp.itemCode;
                          	if(tmp.grade=="1"){
			                  	grid.updateRow(row,{aitemname:itemName,aitemcode:itemCode});                           		
                          	}
                          	if(tmp.grade=="2"){
			                  	grid.updateRow(row,{bitemname:itemName,bitemcode:itemCode});                           		
                          	}
                          	if(tmp.grade=="3"){
			                  	grid.updateRow(row,{citemname:itemName,citemcode:itemCode});                           		
                          	}
                          }
                          
                           
                        }
                    }
                }
            });            
             
        }  
	   	
	   	function typeChange(e){
	   		loadItem();
	   		if(e.value==2){
	   		 	document.getElementById("one2").style.display="";
	    		document.getElementById("one22").style.display="";
	    		document.getElementById("one1").style.display="none";
	    		document.getElementById("one11").style.display="none";
	    		document.getElementById("one111").style.display="none";
	   			nui.get("addbtn").disable();
	   			nui.get("delbtn").disable();
	   			grid.hideColumn (0)
	   		}else if(e.value==1){
	   		    document.getElementById("one1").style.display="";
	   		    document.getElementById("one11").style.display="";
	    	    document.getElementById("one111").style.display="";
	    	    document.getElementById("one2").style.display="none";
	            document.getElementById("one22").style.display="none";
	   			nui.get("addbtn").disable();
	   			nui.get("delbtn").disable();
	   			grid.hideColumn (0)
	   		}else if(e.value==3){
	   			document.getElementById("one2").style.display="";
	    		document.getElementById("one22").style.display="";
	    		document.getElementById("one1").style.display="none";
	    		document.getElementById("one11").style.display="none";
	    		document.getElementById("one111").style.display="none";
	   			nui.get("addbtn").enable();
	   			nui.get("delbtn").enable();
	   			grid.clearRows();
	   			grid.showColumn (0)
	   		}
	   		
	   	
	   	}
	function addTicket(){
    	var rowS = {name: "New Row"} 
		grid.addRow(rowS);
    }
    
    function removeTicket(){
		var rows = grid.getSelecteds();
        if (rows.length>0) {
            grid.removeRows(rows, true);
        }else{
        	nui.alert("请至少选中一条记录！");
        }
	}
    function onCancel() {
        CloseWindow("cancel");
    }
	
</script></body>
</html>
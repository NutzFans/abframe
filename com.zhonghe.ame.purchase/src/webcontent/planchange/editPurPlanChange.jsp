<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@include file="/purchase/common/common.jsp"%>
<html>
<head>
    <title>采购计划变更</title>
	<style type="text/css">
	    body{
	        margin: 0;padding: 0;border: 0;width: 100%;height: 100%;overflow: hidden;	
	    } 
    </style>
</head>
<body>
<div class="nui-fit" >
  	<fieldset id="field1" style="border: solid 1px #aaa;padding: 3px;width: 99%;">
		<legend>采购计划信息</legend>
		<form id="form1" method="post">
		<input name="files" id="fileids" class="nui-hidden"/>
			<div style="padding: 5px;  ">
				<table style="table-layout: fixed; width: 100%" id="table_file">
        	<tr>
        		<td colspan="1" class="form_label" align="right" style="width:120px;">年度采购计划名称：</td>
            <td colspan="3">
            	<input id="id" name="id" class="nui-hidden" readonly="readonly"/>
                <input id="name" name="name" class="nui-textbox" required="true"  style="width:100%;" />
            </td>
            <td colspan="1" class="form_label" align="right" style="width:120px;">提报人姓名：</td>
            <td colspan="1">
                <input class="nui-textbox"  name="infomantUser" id="infomantUser" required="true" style="width:100%;" readonly="readonly"/>
            </td>
             <td colspan="1" class="form_label" align="right" style="width:120px;">采购单位：</td>
            <td colspan="1">
            	<input id="needOrgName" name="needOrgName" class="nui-textbox" required="true" style="width:100%;" readonly="readonly"/>
            	<input id="needOrgId" name="needOrgId" class="nui-hidden" required="true" style="width:100%;"/>
						</td>
        	</tr>
	       	<tr>
	       		<td class="form_label" align="right" style="width:120px;">计划年度：</td>
	            <td colspan="1">
	                <input id="year" name="year" style="width:100%;" class="nui-combobox" style="width:100%;" required="true"/>   
	            </td>
	            <td class="form_label" align="right" style="width:100px;">采购类型：</td>
	            <td colspan="1">    
	                <input class="nui-dictcombobox" name="type" id="type" dictTypeId="ZH_PURCHASE" readonly="readonly" onvaluechanged="changeexptype" onbeforeshowpopup="beforechanged" required="true"  style="width:100%;"/>
	            </td>
	            <td colspan="1" class="form_label" align="right" style="width:120px;">变更前总金额(万元)：</td>
	            <td colspan="1">
	                <input id="budgetAmount" name="budgetAmount" class="nui-textbox" required="true"   readOnly="readOnly"  style="width:100%;" />
	            </td>
	           	<td class="form_label" align="right" style="width:120px;">财务年度预算科目：</td>
	            <td colspan="1">
	                <input id="SUBJECT" name="subject" class="nui-textbox"  style="width:100%;" />
	            </td>
	         </tr>
           	<tr>
           		<td class="form_label" align="right" style="width:120px;">物项归口部门：</td>
	            <td colspan="3">
	                <input id="putunder" name="putunder" class="nui-dictcombobox"  dictTypeId="ZH_PUTUNDER"  multiSelect="true"  onvaluechanged="putunderChanged"  style="width:100%;" />
	            </td>
	            
	             <td class="form_label" align="right" style="width:120px;">变更后总金额(万元)：</td>
	            <td colspan="1">
	                <input id="newBudgetAmount" name="newBudgetAmount" class="nui-textbox" required="true"   readOnly="readOnly"  style="width:100%;" />
	            </td>
           	</tr>
             <tr>
          		<td class="form_label" style="width:120px;" align="right">归口部门可采购物项：</td>
	            <td  colspan="7">    
	                <input style="width:100%;height:60px;" id="items" type="checkbox" class="nui-textarea" readonly="readonly"/>
	            </td>
          	</tr>
          	<tr>
          		<td class="form_label" style="width:120px;color: red" align="right">
              		提示：
          		</td>
          		<td colspan="6" style="color: red">
          			添加年度采购计划，选择一级集采物项时细分到物项大类即可。整理好的小类细分项填写到备注框或以附件形式添加。
          		</td>
          	</tr>
          	<tr>
          		<td class="form_label" style="width:120px;" align="right">备注：</td>
	            <td  colspan="7">    
                <input style="width:100%;height:70px;" name="remark" class="nui-textarea" id="remark"/>
	            </td>
          	</tr>
          	<tr>
	      			<td class="form_label" style="width:120px;" align="right">调整原因：</td>
	            <td  colspan="8">    
                <input style="width:100%;height:70px;" name="changeReason" class="nui-textarea" id="changeReason"/>
	            </td>
		      	</tr>
		    	</table>
		    </div>
   	 	</form>
    </fieldset>
    <fieldset  style=" border:solid 1px #aaa;padding:3px;width: 99%">
	 	<div class="fieldset-body"  style="width:100%;  margin: 0px auto">
	 	 	<a class="nui-button" id="addbtn" iconCls="icon-add" onclick="addTicket()">增加</a> 
	        <a class="nui-button" id="delbtn" iconCls="icon-remove" onclick="removeTicket()">删除</a>
	    	<div id="grid_traveldetail" class="nui-datagrid" style="width: 98%;height: auto;" allowCellSelect="true" allowCellwrap="true"
		    		showPager="false" allowCellEdit="true" multiSelect="true" dataField="purPlanItem"  oncellendedit="getHTZQ"
		    		url="com.zhonghe.ame.purchase.purchaseItems.queryPurPlanItem.biz.ext">
	           <div property="columns">
	   				<div  type="checkcolumn"></div>
	           		<div  field="code" width="110" align="center" headerAlign="center"  visible="false" >计划编号
						<input  name="code"  property="editor"  enabled="true" class="nui-textbox" readOnly="true" >
	                </div>
	                <div  field="purchaseFirstCode" width="100" align="center" headerAlign="center"  visible="false">物项大类编码
						<input  name="purchaseFirstCode"  property="editor"  enabled="true" class="nui-textbox" readOnly="true"  />
	                </div>
	                <div field=purchaseFirstName width="110" align="center" headerAlign="center"  readOnly="true">大类名称 
	                	<input  name="purchaseFirstName" property="editor" class="nui-textbox"  />
	                </div> 
	                <div  field="purchaseTwoCode" width="110" align="center" headerAlign="center" visible="false" readOnly="true">中类编码
							<input  property="editor"  name="purchaseTwoCode" class="nui-textbox" />
	                </div>
	                <div  field="purchaseTwoName" width="110" align="center" headerAlign="center" readOnly="true">中类名称 
	                	<input  property="editor"  name="purchaseTwoName" class="nui-textbox"   readOnly="true"  />
	                </div> 
	                <div field="materialName"  width="110" align="center" headerAlign="center" vtype="required">采购物项名称 
	                	<input   property="editor" class="nui-textbox" name="materialName" width="100%" required="true"/> 
	                </div>
	                
	                <div header="调整前" headerAlign="center">
		                <div property="columns">
		                	<div field="unit"  width="40" align="center" headerAlign="center" renderer="unitValue">单位</div> 
			                <div  field="number" width="50"  align="center" headerAlign="center"  vtype="required" >数量</div>
			                <div field="budgetAmount"  width="80" align="center" headerAlign="center" headerStyle="color:red" vtype="required">预算金额(万元)</div>
		                </div>
		            </div>
	               <div header="调整后" headerAlign="center" headerStyle="color:red;">
		                <div property="columns">
		                	<div  field="onePrice" width="70"  align="center" headerAlign="center" vtype="required"> <span style="color:red;">单价(万元)</span>
				            	<input id="supplierName" name="onePrice" width="100%" property="editor"  class="nui-textbox" />
				            </div>
		                    <div field="newUnit"  width="40" align="center" headerAlign="center" renderer="unitValue"><span style="color:red;">单位</span>
			                	<input property="editor"  width="100%" class="nui-dictcombobox" dictTypeId="ZH_UNIT" name="newUnit"/>
			                </div> 
			                <div field="newNumber"  width="40" align="center" headerAlign="center" vtype="int"><span style="color:red;">数量</span>
			                	<input property="editor"   width="100%" class="nui-spinner" minValue="0" decimalPlaces="0"  maxValue="999999999"  id="newNumber" name="newNumber" />
			                </div>
			                <div field="newBudgetAmount"  width="70" align="center" headerAlign="center"  vtype="required"><span style="color:red;">预算金额(万元)</span>
<!-- 			                	<input property="editor"  width="100%" class="nui-spinner" minValue="0"  maxValue="999999999" name="newBudgetAmount" visible="true" /> -->
			                </div>
			                
		                </div>
		            </div>
	                 <div field="remark"  width="150" align="left" headerAlign="center"  vtype="required" headerStyle="color:red" >调整原因
	                	<input property="editor"  width="100%"  class="nui-textarea" name="remark" visible="true"/>
	                </div>
	                
	            </div>
	        </div>
		</div>
	</fieldset>
	<fieldset id="field2" style="border:solid 1px #aaa;padding:3px;">
		<legend>
			上传相关附件
			&nbsp;&nbsp;
			<a href="<%=request.getContextPath() %>/onePurConcentratedPlan.xlsx" download="2023年度一级集中采购计划细分表">2023年度一级集中采购计划细分表</a>
			&nbsp;&nbsp;
			<a href="<%=request.getContextPath() %>/twoPurConcentratedPlan.xlsx" download="2023年度二级集中采购计划细分表">2023年度二级集中采购计划细分表</a>
			&nbsp;&nbsp;
			<a href="<%=request.getContextPath() %>/purPlanRationalityDescription.xlsx" download="采购价格合理性说明">采购价格合理性说明</a>
		</legend>
		<jsp:include page="/ame_common/addFiles.jsp"/>
	</fieldset>
	<form id="opioionform" method="post">
        <div style="padding: 1px; width: 99%" id="opinionHide">
            <table style="table-layout: fixed;">
            	<tr id="salesEdit">
                    <td style="width: 150px;" align="right">审核结果：</td>
                    <td style="width: 250px;">
											<input name="misOpinion.auditstatus" id="auditstatus" class="nui-dictradiogroup" style="width: 250px;" 
												required="true" dictTypeId="MIS_AUDITSTATUS" onvaluechanged="show()" value="1" />
                    </td>
                </tr>
                <tr>
                    <td colspan="3">
                        <input name="misOpinion.auditopinion" id="auditopinion" class="nui-hidden" style="width: 600px;height: 40px;" value=""/>
                    </td>
                </tr>
            </table>
        </div>
	</form>
</div>
<div style="text-align:center;padding:10px;border-width:1px 0px 0px 0px;" class="nui-toolbar">               
    <a class="nui-button" onclick="onOk(0)" id="saveReimb" iconCls="icon-save" style="width: 80px;margin-right: 20px;">暂存</a>
	<a class="nui-button" onclick="onOk(1)" id="creatReimbProcess" iconCls="icon-ok" style="width: 80px;margin-right: 20px;">提交</a>
	<a class="nui-button" onclick="closeCancel" id="saveReimbProcess" iconCls="icon-close" style="width: 80px;margin-right: 140px;">关闭</a>
</div>
<script type="text/javascript">
	     nui.parse();
	      //工作项id
	    var form = new nui.Form("#form1");
	    var grid = nui.get("grid_traveldetail");
	    var opioionform = new nui.Form("opioionform");
	    var purType,orgid; //采购类型,归口部门ID
	   	var istype,title;
	   	var isExcess;//变更金额是否超限
  	  var processid = <%=request.getParameter("processid")%>;
	   	var id = <%=request.getParameter("id")%>;
	   	
	   	var year=new Date().getFullYear();
	   	var yeariterm = [];
			for(var i = 0;i<5;i++){
			  yeariterm.push({"id":year+i,"text":year+i});
			}    
	  
	    nui.get("year").setData(yeariterm);
	    nui.get("needOrgId").setValue(getOrgseq2());//设置第二级组织机构代码
	   	function unitValue(e){
		   	return nui.getDictText("ZH_UNIT",e.value);
			}	   		
	   	function onYn(e){
		   	return nui.getDictText("MIS_YN",e.value);
			}	   	
	   	/* form.setEnabled(false); */
	   	nui.get("remark").setEnabled(true);
	   	init();
	   	function init(){
	   		nui.get("auditstatus").setValue(3);//1：通过,0：退回，2：终止流程，3:发起
			document.getElementById("salesEdit").style.display="none";
	   		var json = nui.encode({"id":id});
	   		ajaxCommon({	
				url: "com.zhonghe.ame.purchase.purchaseItems.queryPurPlanDetailById.biz.ext",
		        data: json,
		        success: function (o) {
	        	 	form.setData(o.purPlan);
	        	 	nui.get("infomantUser").setValue(userName);
				    	nui.get("needOrgName").setValue(userOrgName);
				    	nui.get("needOrgId").setValue(userOrgId);
				 	var jsonData = {"planId":o.purPlan.id}
	       		 	grid.load(jsonData);
	       		 	loadItem();
		        }
		    }); 
	   	}
	   	
	   	function unitValue(e){
	   		return nui.getDictText("ZH_UNIT",e.value);
		}	   		
	   	function loadItem(){
	   		 purType = nui.get("type").getValue();
	   		 orgid = nui.get("putunder").getValue();
	   		  grid.showColumns([3,4,5])
        	if(purType==3){
        		grid.hideColumns([3,4,5])
        	} 
	   		if(purType!="" &&orgid!=""&&purType!=undefined &&orgid!=undefined){
	   			nui.get("addbtn").enable();
	   			var json = nui.encode({param:{"orgid":orgid,"purType":purType}})
		   		ajaxCommon({
					"url": "com.zhonghe.ame.purchase.purchaseplan.getItemsByOrgid.biz.ext",
					"data": json,
					"success": function(data) {
						var items;
						var data = data.data;
						clog(data)
						if(data.length>0){
							items = data.map(function(obj,index){
							    return obj.zlName;
							}).join(",");
						}else{
							items = "无可选采购项"
						}
						nui.get("items").setValue(items);
					}
				});
			}else if(purType ==3){
					nui.get("addbtn").enable();
	   			nui.get("items").setValue("");
	   		}else{
	   			nui.get("addbtn").disable();
   				nui.get("items").setValue("");
	   		}
	   	}
	    
    	function onOk(e){
    		isChangeExcess();
    		document.getElementById("fileCatalog").value="PurchasePlan";
	   		istype=e;
			if(e==0){
				title = "暂存";
			}else if(e==1){
				title = "提交";
				if(!form.validate()){
					showTips("请检查表单的完整性!");
					return;
				}
			 	grid.validate();
				if (grid.isValid() == false) {
					var error = grid.getCellErrors()[0];
					grid.beginEditCell(error.record, error.column);
					return;
				} 
			}
			form2.submit();	
		}
			
		function SaveData(){
			var formData = form.getData();
			var gridData = grid.getChanges(),data_opioion =opioionform.getData() ;;
				formData.istype = istype;
				formData.files = nui.get("fileids").getValue();
			// 1为公司本部 2为分子公司
			var judge = getJudge();
			var json = nui.encode({"purPlan":formData,"purPlanItem":gridData,"judge":judge,"isExcess":isExcess,"misOpinion": data_opioion.misOpinion});
			//判断采购类型 如为一级集采二级集采归口部门必填
			var type = nui.get("type").value;
			if(type!=3){
				var putunder = nui.get("putunder").value;
					if(putunder==null || putunder==''){
						showTips("公司本部职能部分发起采购计划时归口部门不能够为空");	
						return;
					}
				}
			if(!confirm("是否"+title+"单据？")){
        			return;
    		}else{	
    			ajaxCommon({
					"url": "com.zhonghe.ame.purchase.planchange.editPurPlanChange.biz.ext",
					"data": json,
					"success": function(data) {
						if(data.result==1){
							showTips("采购计划变更成功");
							closeOk();
						}else{
							showTips("采购计划变更失败","danger");
						}
						
					}
				});
    		}
    	}
    	
    
    /**
	  选择物项明细 	
	*/   	
	function addTicket(){
		if(purType!="" &&orgid!=""&&purType!=undefined &&orgid!=undefined&&purType != 3){
			 mini.open({
                url: "<%=request.getContextPath() %>/purchase/planchange/selectItems.jsp?orgid="+orgid+"&purType="+purType,
                showMaxButton: false,
                title: "选择树",
                width: "80%",
                height: "80%",
                ondestroy: function (action) {   
                    if (action == "ok") {
                        var iframe = this.getIFrameEl();
                        var data = iframe.contentWindow.GetData();
                       	  data = mini.clone(data);
                       	  for(var i=0;i<data.length;i++){
                       	  	var row  = {"name":"New Row",
                       	  	 	 "purchaseFirstName":data[i].dlName,"purchaseFirstCode":data[i].dlCode,
                       	  		 "purchaseTwoName":data[i].zlName,"purchaseTwoCode":data[i].zlCode,
                       	  		 "purchaseThreeName":data[i].xlName,"purchaseThreeCode":data[i].xlCode,
                       	  		 "budgetAmount":0,"number":0,
                       	  		 centralizedDept:data[i].org_id}
                       	 	 grid.addRow(row);
                       	  }
                        }
                    }
            }); 
	    	
		}else if(purType ==3){
				nui.get("addbtn").enable();
	   			nui.get("delbtn").enable();
				var rowS = {name: "New Row"} 
				grid.addRow(rowS);
		}else{
			showTips("请先选择采购类型及归口部门")
		}
    }
    /**
    * 判断是否超限额
    */
    function isChangeExcess(){
    	isExcess=false;
    	var newBudgetAmount = nui.get("newBudgetAmount").getValue();
    	var budgetAmount = nui.get("budgetAmount").getValue();
    	if(budgetAmount!=null && newBudgetAmount !=null){
	    	var excess = math.subtract(newBudgetAmount, budgetAmount)
	    	var ratio = math.divide(excess,budgetAmount) 
	    	if(purType==1){
	    		if(excess>=5){
	    			isExcess = true;
	    		}else if(ratio>=0.2){
	    			isExcess = true;
	    		}
	    	
	    	}else{
	    		if(excess>=10){
	    			isExcess = true;
	    		}else if(ratio>=0.1){
	    			isExcess = true;
	    		}
	    	}
    	}
    }
    
    /**
     * 采购类型改变前
     */
    var exptypeOld;
    function beforechanged(){
    	exptypeOld = nui.get("type").getValue();
    }
    /**
     * 采购类型改变,不能删除已存在物项的归口部门
     */
    function changeexptype(){
    	purType = nui.get("type").getValue();
    	//切换采购类型提示。
    	var detailRows = grid.getData();
    	
    	if(detailRows.length > 0){
			if(confirm("切换采购类型将会清空已填写物项明细，请确定是否切换吗？")){
    			grid.clearRows();
    		}else{
    			nui.get("type").setValue(exptypeOld);
    			return;
    		}
    	}
    	loadItem();
    }
    
     /**
     * 物项归口部门改变,不能删除已存在物项的归口部门
     */
    function putunderChanged(){
    	var putunder = nui.get("putunder").getValue()
    	var rowsData = grid.data;
    	
    	if(putunder){
	    	var putunders = putunder.split(",") ;
    	}else{
    		putunders=[];
    	}
    	if(rowsData.length>0){
    		for(var i=0;i< rowsData.length;i++){ 
	    		if(!putunders.includes(rowsData[i].centralizedDept.toString())){
	    			putunders.push(rowsData[i].centralizedDept.toString())
	    		}
	    	}
	    	nui.get("putunder").setValue(putunders.toString());
    	}
    	loadItem();
    }
    
    
	/**
   	* 删除行
   	*/
    function removeTicket(){
		var rows = grid.getSelecteds();
        if (rows.length>0) {
        	for(var i=0;i< rows.length;i++){ 
  				 if(rows[i].id){
  				 	nui.alert("原有计划不允许删除只允许修改！");
  				 	return;
  				 }     	
        	}
            grid.removeRows(rows, true);
        }else{
        	nui.alert("请至少选中一条记录！");
        }
        totalAmount();
	}
	
	/**
   	* 计算当前行金额
   	*/
	function getHTZQ(e){
		var record = e.record;
		if(e.field=="newNumber"||e.field=="onePrice"){
			if(record.newNumber!=null && record.onePrice!=null){
				var budgetAmount1 =mulFloat(record.newNumber,record.onePrice).toString() ;
				 grid.updateRow(e.row,{newBudgetAmount:budgetAmount1}); 
                  	totalAmount();
			}else{
				 grid.updateRow(e.row,{totalPrice:""}); 
			}
		}
	}
	
	
   	/**
   	* 计算计划总金额
   	*/
	function totalAmount(){
		var tempData = grid.data;
    	var a=tempData.length;
    	var b=0;
    	for(var i=0;i<a;i++){
    		if(!!tempData[i].newBudgetAmount&&tempData[i].newBudgetAmount>0){
    			b = addFloat(b,tempData[i].newBudgetAmount)
    		}else{
    			var x = 0;
    			b = addFloat(b,x)
    		}
    	}
 		nui.get("newBudgetAmount").setValue(b);
	}
	
	function zhPutUnder(e) {
		return nui.getDictText('ZH_PUTUNDER',e.value);//设置业务字典值
	}
	
	function unitValue(e){
   		return nui.getDictText("ZH_UNIT",e.value);
	}
	
	function onYn(e){
   		return nui.getDictText("MIS_YN",e.value);
	}
</script></body>
</html>
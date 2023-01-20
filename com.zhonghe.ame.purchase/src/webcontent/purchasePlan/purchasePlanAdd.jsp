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
	<fieldset id="field1" style="border: solid 1px #aaa;padding: 3px;width: 99%;">
		<legend>采购计划信息</legend>
			<form id="form1" method="post">
				<input name="files" id="fileids" class="nui-hidden"/>
				<div style="padding: 5px;  ">
				<table style="table-layout: fixed; width: 100%" id="table_file">
	            	<tr>
	            		<td colspan="1" class="form_label" align="right" style="width:120px;">年度采购计划名称：</td>
		                <td colspan="5">
		                    <input id="name" name="name" class="nui-textbox" required="true"  style="width:100%;" />
		                </td>
	            	</tr>
	            	<tr>
		                <td colspan="1" class="form_label" align="right" style="width:100px;">提报人姓名：</td>
	                    <td colspan="1">
	                        <input class="nui-textbox"  name="infomantUser" id="infomantUser" required="true" style="width:100%;"   value="<%=userName %>" readonly="readonly"/>
	                    </td>
		                <td colspan="1" class="form_label" align="right" style="width:100px;">采购单位：</td>
	                    <td colspan="3">
	                    	<input id="needOrgName" name="needOrgName" class="nui-textbox" required="true" style="width:100%;" value="<%=userOrgName %>" readonly="readonly"/>
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
	                        <input class="nui-dictcombobox" name="type" id="type" dictTypeId="ZH_PURCHASE" onvaluechanged="changeexptype" onbeforeshowpopup="beforechanged" required="true"  style="width:100%;"/>
	                    </td>
	                    <td class="form_label" align="right" style="width:120px;">计划总金额(万元)：</td>
		                <td colspan="1">
		                    <input id="budgetAmount" name="budgetAmount" class="nui-textbox" required="true"   readOnly="readOnly"  style="width:100%;" />
		                </td>
	                 </tr>
	               	<tr>
	               		<td class="form_label" align="right" style="width:120px;">物项归口部门：</td>
		                <td colspan="3">
		                    <input id="putunder" name="putunder" class="nui-dictcombobox"  dictTypeId="ZH_PUTUNDER"  multiSelect="true"  onvaluechanged="putunderChanged"  style="width:100%;" />
		                </td>
		                <td class="form_label" align="right" style="width:120px;">财务年度预算科目：</td>
		                <td colspan="1">
		                    <input id="SUBJECT" name="subject" class="nui-textbox"  style="width:100%;" />
		                </td>
	               	</tr>
	                 <tr>
	              		<td class="form_label" style="width:120px;" align="right">归口部门下可采购物项：</td>
	                    <td  colspan="6">    
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
	                    <td  colspan="6">    
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
        <a href="<%=request.getContextPath() %>/onePurConcentratedPlan.xlsx" download="2023年度一级集中采购计划细分表">2023年度一级集中采购计划细分表</a>
        <a href="<%=request.getContextPath() %>/twoPurConcentratedPlan.xlsx" download="2023年度二级集中采购计划细分表">2023年度二级集中采购计划细分表</a>
    	<div id="grid_traveldetail" class="nui-datagrid" style="width: 100%;height: auto;" allowCellSelect="true" 
	    	 	showPager="false" allowCellEdit="true" multiSelect="true" oncellendedit="getHTZQ" >
	           <div property="columns">
       				<div type="checkcolumn"></div>
	           		<div type="indexcolumn" align="center" headerAlign="center">序号</div>
	           		<div field="code" width="110" align="center" headerAlign="center"  visible="false" >计划编号
									<input name="code"  property="editor"  enabled="true" class="nui-textbox" readOnly="true" >
                </div>
                <div field="purchaseFirstCode" width="110" align="center" headerAlign="center"  visible="false">物项大类编码</div>
                <div field=purchaseFirstName width="100" align="center" headerAlign="center"  >物项大类名称  </div> 
                <div field="purchaseTwoCode" width="110" align="center" headerAlign="center" visible="false">中类编码</div>
                <div field="purchaseTwoName" width="110" align="center" headerAlign="center"  >中类名称 </div> 
                <!-- <div field="purchaseThreeCode" width="110" align="center" headerAlign="center"  readOnly="true"  visible="false">小类编码</div>
                <div field="purchaseThreeName"  width="100" align="center" headerAlign="center"  readOnly="true" >小类名称</div> -->
                <div field="materialName"  width="110" align="center" headerAlign="center" vtype="required" headerStyle="color:red">采购物项名称 
                	<input property="editor" class="nui-textbox" name="materialName"  width="100%"  height="100%" required="true"/>
                </div>
                <div field="unit"  width="60" align="center" headerAlign="center" renderer="unitValue">单位
                	<input property="editor" class="nui-dictcombobox" width="100%" dictTypeId="ZH_UNIT"   name="unit"/>
                </div> 
                <div  field="onePrice" width="100"  align="center" headerAlign="center" vtype="required" headerStyle="color:red">单价(万元)
									<input name="onePrice" property="editor" width="100%"  class="nui-spinner"  minValue="0"  maxValue="999999999" />
                </div>
                <div  field="number" width="100"  align="center" headerAlign="center"  vtype="int" headerStyle="color:red">数量(整数)
									<input name="number" property="editor" width="100%"  class="nui-spinner"  decimalPlaces="0"  minValue="0"  maxValue="999999999" />
                </div>
                <div field="budgetAmount"  width="100" align="center" headerAlign="center" headerStyle="color:red" vtype="required">预算金额(万元)
<!--                 	<input name="budgetAmount" property="editor" class="nui-spinner" minValue="0" width="100%" maxValue="999999999"  readonly="readonly" visible="true"/> -->
                </div>
                <div field="remark"  width="100" align="center" headerAlign="center"  >备注
                	<input property="editor" class="nui-textarea" name="remark" width="100%" />
                </div>
                <div field="centralizedDept"  width="100" align="center" headerAlign="center"  renderer="zhPutUnder">物项归口部门</div>
		                <!-- <div field="contractname"  width="100" align="center" headerAlign="center" renderer="onViewL" visible="false">拟签合同名称
	                	<input property="editor" class="nui-textbox" id="contractname" name="contractname" />
	                </div>
	                <div field="plansimplementtime"  width="100" align="center" headerAlign="center"  visible="false" vtype="required">拟实施采购时间
	                	<input property="editor" class="nui-datepicker" id="plansimplementtime" name="plansimplementtime"/>
	                </div>
	                <div field="contractamount"  width="100" align="center" headerAlign="center" renderer="onViewL" visible="false">拟签合同金额(元)
	                	<input property="editor"   class="nui-spinner"  minValue="0"  maxValue="999999999"  id="contractamount" name="contractamount" />
	                </div> -->
	            </div>
	        </div>
		</div>
		</fieldset>
    </fieldset>
    <fieldset id="field2" style="border:solid 1px #aaa;padding:3px;">
		<legend>上传相关附件</legend>
		<jsp:include page="/ame_common/addFiles.jsp"/>
	</fieldset>
</div>
<form id="opioionform" method="post">
    <div style="padding: 5px;" id="opinionHide">
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
<div style="text-align:center;padding:10px;border-width:1px 0px 0px 0px;" class="nui-toolbar">               
  <a class="nui-button" onclick="onOk(0)" id="saveReimb" iconCls="icon-save" style="width: 80px;margin-right: 20px;">暂存</a>
	<a class="nui-button" onclick="onOk(1)" id="creatReimbProcess" iconCls="icon-ok" style="width: 80px;margin-right: 20px;">提交</a>
	<a class="nui-button" onclick="closeCancel" id="saveReimbProcess" iconCls="icon-close" style="width: 80px;margin-right: 140px;">关闭</a>
</div>  
<script type="text/javascript">
    nui.parse();
    var form = new nui.Form("#form1");
    var grid = nui.get("grid_traveldetail");
    var opioionform = new nui.Form("opioionform");
    var purType,orgid; //采购类型,归口部门ID
   	var istype,title,fileMsgBoxId;
   	 //初始化审核意见
		nui.get("auditstatus").setValue(3);//1：通过,0：退回，2：终止流程，3:发起
		nui.get("needOrgId").setValue(getOrgseq2());//设置第二级组织机构代码
		document.getElementById("salesEdit").style.display="none";
		var year=new Date().getFullYear();
	   	var yeariterm = [];
		for(var i = 0;i<5;i++){
		  yeariterm.push({"id":year+i,"text":year+i});
		}         		   
	    nui.get("year").setData(yeariterm);
	   	nui.get("addbtn").disable();
   		nui.get("delbtn").disable();
   		
			   		
	   	function loadItem(){
	   		nui.get("items").setValue("");
	   		 purType = nui.get("type").getValue();
	   		 orgid = nui.get("putunder").getValue();
	   		 grid.showColumns([4,6,13])
	   		 if(purType!=2){
   				grid.showColumns([4,6,13])
        	}
        	if(purType==3){
        		grid.hideColumns([4,6,13])
        	}
	   		if(purType!="" &&orgid!=""&&purType!=undefined &&orgid!=undefined){
	   			nui.get("addbtn").enable();
	   			nui.get("delbtn").enable();
	   			var json = nui.encode({param:{"orgid":orgid,"purType":purType}})
		   		ajaxCommon({
					"url": "com.zhonghe.ame.purchase.purchaseplan.getItemsByOrgid.biz.ext",
					"data": json,
					"success": function(data) {
						var items;
						var data = data.data;
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
	   			nui.get("delbtn").enable();
	   			nui.get("items").setValue("");
	   		}else{
	   			nui.get("addbtn").disable();
   				nui.get("delbtn").disable();
   				nui.get("items").setValue("");
	   		}
	   	}
	   	
	   	function onOk(e){
	   		istype=e;
			if(istype==0){
				title = "暂存";
			}else if(istype==1){
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
		  	document.getElementById("fileCatalog").value="PurchasePlan";
		  	var filePaths = document.getElementsByName("uploadfile").length;
		     for(var j=0;j<filePaths;j++){
		      var a=document.getElementsByName("remarkList")[j].value;
		      if(a==null||a==""){
		       showTips("新增附件不可以为空");
		       nui.get("saveReimb").enable();
					 nui.get("creatReimbProcess").enable();	
		       return;
		      }
		     }
		    nui.confirm("确定"+title+"单据","系统提示",
	        function(action){
            if(action=="ok"){
        		fileMsgBoxId = nui.loading("附件上传中...", "请稍后");
	    			form2.submit();
				}
			})
		}
			
		function SaveData(){
			var formData = form.getData();
			var gridData = grid.getData(),data_opioion =opioionform.getData();
			formData.istype = istype;
			// 1为公司本部 2为分子公司
			
			var judge = <%=request.getParameter("judge")%>;
			var json = nui.encode({"purPlan":formData,"purPlanItem":gridData,"judge":judge,"misOpinion": data_opioion.misOpinion,"files":nui.get("fileids").getValue()});
			//判断采购类型 如为一级集采二级集采归口部门必填
			var type = nui.get("type").value;
			/* if(type!=3){
				var putunder = nui.get("putunder").value;
					if(putunder==null || putunder==''){
						showTips("公司本部职能部分发起采购计划时归口部门不能够为空");
						return;
					}
			} */
			nui.hideMessageBox(fileMsgBoxId);
			ajaxCommon({
				"url": "com.zhonghe.ame.purchase.purchaseplan.addPurPlan.biz.ext",
				"data": json,
				"success": function(data) {
					if(data.result==1){
						showTips(title+"采购计划成功");
						closeOk();
					}else{
						showTips(title+"采购计划失败","danger");
					}
				}
			});
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
		if(e.field=="number"||e.field=="onePrice"){
			if(record.number!=null && record.onePrice!=null){
				var budgetAmount1 =mulFloat(record.number,record.onePrice).toString() ;
				 grid.updateRow(e.row,{budgetAmount:budgetAmount1}); 
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
    		if(!!tempData[i].budgetAmount&&tempData[i].budgetAmount>0){
    			b = addFloat(b,tempData[i].budgetAmount)
    		}else{
    			var x = 0;
    			b = addFloat(b,x)
    		}
    	}
 		nui.get("budgetAmount").setValue(b)
	}
	
	function zhPutUnder(e) {
		return nui.getDictText('ZH_PUTUNDER',e.value);//设置业务字典值
	}
	
	function unitValue(e){
   		return nui.getDictText("ZH_UNIT",e.value);
	}
</script></body>
</html>
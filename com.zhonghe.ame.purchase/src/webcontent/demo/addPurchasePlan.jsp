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
				<table style="table-layout: fixed;" id="table_file">
	            	<tr>
	            		<td class="form_label" align="right" style="width:120px;">年度采购计划名称：</td>
		                <td colspan="6">
		                    <input id="name" name="name" class="nui-textbox" required="true"  style="width:100%;" />
		                </td>
	            	</tr>
	            	<tr>
	            		
		                <td class="form_label" align="right" style="width:120px;">提报人姓名：</td>
	                    <td colspan="1">
	                        <input class="nui-textbox"  name="infomantUser" id="infomantUser" required="true" style="width:100%;"   value="<%=userName %>" readonly="readonly"/>
	                    </td>
		                <td class="form_label" align="right" style="width:120px;">采购单位：</td>
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
	                    <td class="form_label" align="right" style="width:120px;">采购类型：</td>
	                    <td colspan="1">    
	                        <input class="nui-dictcombobox" name="type" id="type" dictTypeId="ZH_PURCHASE" required="true" onvaluechanged="loadItem()" style="width:100%;"/>
	                    </td>
	                    <td class="form_label" align="right" style="width:120px;">计划总金额(万元)：</td>
		                <td colspan="1">
		                    <input id="budgetAmount" name="budgetAmount" class="nui-textbox" required="true"   readOnly="readOnly"  style="width:100%;" />
		                </td>
	                 </tr>
	               	<tr>
	               		<td class="form_label" align="right" style="width:120px;">物项归口部门：</td>
		                <td colspan="6">
		                    <input id="putunder" name="putunder" class="nui-dictcombobox"  dictTypeId="ZH_PUTUNDER" multiSelect="true"  onvaluechanged="loadItem()"  style="width:100%;" />
		                </td>
	               	</tr>
	                 <tr>
	              		<td class="form_label" style="width:120px;" align="right">归口部门下可采购物项：</td>
	                    <td  colspan="7">    
	                        <input style="width:100%;height:60px;" id="items" type="checkbox" class="nui-textarea" readonly="readonly"/>
	                    </td>
	              	</tr>
	              	<tr>
	              		<td class="form_label" style="width:120px;color: red" align="right">
		              		提示：
	              		</td>
	              		<td colspan="7" style="color: red">
	              			添加年度采购计划，选择一级集采物项时细分到物项大类即可。整理好的小类细分项填写到备注框或以附件形式添加。
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
            <a href="<%=request.getContextPath() %>/onePurConcentratedPlan.docx" download="2022年度一级集中采购计划细分表">2022年度一级集中采购计划细分表</a>
            <a href="<%=request.getContextPath() %>/twoPurConcentratedPlan.docx" download="2022年度二级集中采购计划细分表">2022年度二级集中采购计划细分表</a>
	    	<div id="grid_traveldetail" class="nui-datagrid" style="width: 100%;height: auto;" allowCellSelect="true" 
	    	 	showPager="false" allowCellEdit="true" multiSelect="true" oncellendedit="getHTZQ" >
	           <div property="columns">
       				<div  type="checkcolumn"></div>
	           		<div type="indexcolumn" align="center" headerAlign="center"  visible="false"></div>
	           		<div field="code" width="110" align="center" headerAlign="center"  visible="false" >计划编号
							<input name="code"  property="editor"  enabled="true" class="nui-textbox" readOnly="true" >
	                </div>
	                <div  field="purchaseFirstCode" width="110" align="center" headerAlign="center"  visible="false">物项大类编码</div>
	                <div field=purchaseFirstName width="100" align="center" headerAlign="center"  >物项大类名称  </div> 
	                <div  field="purchaseTwoCode" width="110" align="center" headerAlign="center" visible="false">物项中类编码</div>
	                <div  field="purchaseTwoName" width="110" align="center" headerAlign="center" renderer="onViewL" >物项中类名称 </div> 
	                <div field="purchaseThreeCode" id="purchaseThreeCode" width="110" align="center" headerAlign="center"  readOnly="true"  visible="false">物项小类编码</div>
	                <div field="purchaseThreeName"  width="100" align="center" headerAlign="center"  readOnly="true" >物项小类名称</div>
	                <div field="materialName"  width="110" align="center" headerAlign="center" vtype="required" headerStyle="color:red">采购物项名称 
	                	<input property="editor" class="nui-textbox" name="materialName"  width="100%"  height="100%" required="true"/>
	                </div>
	                <div field="unit"  width="60" align="center" headerAlign="center" renderer="unitValue">单位
	                	<input property="editor" class="nui-dictcombobox" width="100%" dictTypeId="ZH_UNIT"   name="unit"/>
	                </div> 
	                <div  field="onePrice" width="100"  align="center" headerAlign="center" vtype="required" headerStyle="color:red">单价(万元)
						<input id="supplierName" name="onePrice" width="100%" property="editor"  class="nui-textbox" />
	                </div>
	                <div  field="number" width="100"  align="center" headerAlign="center"  vtype="required" headerStyle="color:red">数量
						<input id="number" name="onePrice" property="editor" width="100%"  class="nui-textbox"/>
	                </div>
	                <div field="budgetAmount"  width="100" align="center" headerAlign="center" headerStyle="color:red" vtype="required">预算金额(万元)
	                	<input property="editor" class="nui-spinner" minValue="0" width="100%" maxValue="999999999" name="budgetAmount" visible="true"/>
	                </div>
	                <div field="remark"  width="100" align="center" headerAlign="center"  >备注
	                	<input property="editor" class="nui-textarea" name="remark" width="100%" />
	                </div>
	                <div field="contractname"  width="100" align="center" headerAlign="center" renderer="onViewL" visible="false">拟签合同名称
	                	<input property="editor" class="nui-textbox" id="contractname" name="contractname" />
	                </div>
	                <div field="plansimplementtime"  width="100" align="center" headerAlign="center"  visible="false" vtype="required">拟实施采购时间
	                	<input property="editor" class="nui-datepicker" id="plansimplementtime" name="plansimplementtime"/>
	                </div>
	                <div field="contractamount"  width="100" align="center" headerAlign="center" renderer="onViewL" visible="false">拟签合同金额(元)
	                	<input property="editor"   class="nui-spinner"  minValue="0"  maxValue="999999999"  id="contractamount" name="contractamount" />
	                </div>
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
	   	var yeariterm = [{id: 2021,text: 2021},
	               		   {id: 2022,text: 2022},
	               		   {id: 2023,text: 2023},
	               		   {id: 2024,text: 2024},
	               		   {id: 2025,text: 2025},
	               		   {id: 2026,text: 2026}];
	    nui.get("year").setData(yeariterm);
	   	nui.get("addbtn").disable();
   		nui.get("delbtn").disable();
   		
   		function getHTZQ(e){
    		var record = e.record;
			if(e.field=="number"||e.field=="onePrice"){
				if(record.number!=null && record.onePrice!=null){
					var budgetAmount1 =mulFloat(record.number,record.onePrice).toString() ;
					 grid.updateRow(e.row,{
							budgetAmount:budgetAmount1
                  	}); 
	                  	totalAmount();
				}else{
					 grid.updateRow(e.row,{
					 totalPrice:""
              	}); 
				
				}
			}
       	  }
   		//计算总金额
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
   		
	   	function unitValue(e){
	   		return nui.getDictText("ZH_UNIT",e.value);
		}	   		
	   	function onYn(e){
	   		return nui.getDictText("MIS_YN",e.value);
		}
	   	function loadItem(){
	   		 purType = nui.get("type").getValue();
	   		 orgid = nui.get("putunder").getValue();
	   		 grid.showColumns([13,14,12,4,6,8])
	   		 if(purType!=2){
   				grid.showColumns([13,14,12,4,6,8])
        	}
        	if(purType==3){
        		grid.hideColumns([4,6,8])
        	}
	   		if(purType!="" &&orgid!=""&&purType!=undefined &&orgid!=undefined){
	   			nui.get("addbtn").enable();
	   			nui.get("delbtn").enable();
	   			var json = nui.encode({param:{"orgid":orgid,"purType":purType}})
		   		console.log(json)
		   		ajaxCommon({
					"url": "com.zhonghe.ame.purchase.purchaseplan.queryItemsByOrgid.biz.ext",
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
	   		/*  if(!form.validate()){
				showTips("请检查表单的完整性!");
				return;
			}  */
			if(istype==0){
				title = "暂存";
			}else if(istype==1){
				title = "提交";
				if(!form.validate()){
					showTips("请检查表单的完整性!");
					return;
				}
			}
			grid.validate();
			if (grid.isValid() == false) {
				var error = grid.getCellErrors()[0];
				grid.beginEditCell(error.record, error.column);
				return;
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
    	
    	
	   	function isProject(e){
	   	}
	   	
	   	
	function addTicket(){
		if(purType!="" &&orgid!=""&&purType!=undefined &&orgid!=undefined&&purType != 3){
			 mini.open({
                url: "<%=request.getContextPath() %>/purchase/planchange/selectItems.jsp?orgid="+orgid+"&purType="+purType,
                showMaxButton: false,
                title: "选择树",
                width: "80%",
                height: "80%",
                ondestroy: function (action) {   
                	var row ="";
                    if (action == "ok") {
                    	var row = grid.getSelected();
                        var iframe = this.getIFrameEl();
                        var data = iframe.contentWindow.GetData();
                       	  data = mini.clone(data);
                       	  row = {"name":"New Row","purchaseFirstName":data.dlName,"purchaseFirstCode":data.dlCode,
                       	  		 "purchaseTwoName":data.zlName,"purchaseTwoCode":data.zlCode,
                       	  		 "purchaseThreeName":data.xlName,"purchaseThreeCode":data.xlCode}
                       	  clog(row)
							grid.addRow(row);
							setReadonly();
                        }
                    }
            }); 
	    	
		}else if(purType ==3){
				nui.get("addbtn").enable();
	   			nui.get("delbtn").enable();
				var rowS = {name: "New Row"} 
				grid.addRow(rowS);
				setReadonly();
		}else{
			showTips("请先选择采购类型及归口部门")
		}
    }
    
    //设置新增删除按钮是否可用
    function setReadonly(){
    	if(grid.getData().length>0){
			nui.get("type").setReadOnly(true);
	   		nui.get("putunder").setReadOnly(true);
		}else{
			nui.get("type").setReadOnly(false);
	   		nui.get("putunder").setReadOnly(false);
		}
    }
    
    //删除行
    function removeTicket(){
		var rows = grid.getSelecteds();
        if (rows.length>0) {
            grid.removeRows(rows, true);
            setReadonly();
        }else{
        	nui.alert("请至少选中一条记录！");
        }
	}
</script></body>
</html>
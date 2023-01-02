<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@include file="/purchase/common/common.jsp"%>
<html>
<head>
    <title>新增紧急采购</title>
	<meta http-equiv="content-type" content="text/html; charset=UTF-8" />
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
				<legend>紧急采购信息</legend>
				<form id="form1" method="post">
					<div style="padding: 5px;">
				<table style="table-layout: fixed; width: 100%;" id="table_file">
            	
            	<tr>
            		<td class="form_label" align="right" style="width:11%;">紧急采购名称：</td>
	                <td colspan="1">
	                    <input id="purchaseName" name="purchaseName" class="nui-textbox" required="true"  style="width:200px;"/>
	                </td>
	                <td class="form_label" align="right" style="width:11%;">紧急采购编号：</td>
	                <td colspan="1">
	                    <input id="purchaseCode" name="purchaseCode" class="nui-textbox" readonly="readonly" emptyText="系统自动生成" style="width:200px;"/>
	                </td>
            	  <td class="form_label" align="right" style="width:11%;">采购单位：</td>
                    <td colspan="1">
                    	<input name="orgId" id="orgId" value="<%=userOrgId %>" class="nui-combobox" required="true"
									url="com.primeton.rdmgr.labor.labormgr.getAllOrgs.biz.ext"
									filterType="like" textField="orgname" valueField="orgid" readonly="readonly"
									dataField="allorgs" valueFromSelect="true" allowInput="true"
									 style="width:200px;" />    
                    </td>
            	</tr>
            	<tr>
            	<td class="form_label" align="right" style="width:11%;">合同发包方式：</td>
	                <td colspan="1">
	                    <input id="contrctType" name="contrctType" class="nui-dictcombobox" dictTypeId="ZH_CGFS" required="true"  style="width:200px;"/>
	                </td>
            	</tr>
            	<tr>
            	
            		<td class="form_label" align="right">申请原因：</td>
	                 <td  colspan="6">    
                        <input style="width:77.5%;height: 40px;" name="applyReason" class="nui-textarea" id="remark"  required="true"/>
                    </td>
            	</tr>
            </table>
        </div>
        </form>
       </fieldset>
     <fieldset  style="height:100%; border:solid 1px #aaa;padding:3px ;width: 99%; ">
     <div class="fieldset-body"  style="width:100%; height:100%; margin: 0px auto">
     <a class="nui-button" id="addbtn" iconCls="icon-add" onclick="addTicket()">增加</a> 
             <a class="nui-button" id="deltbtn" iconCls="icon-remove" onclick="removeTicket()">删除</a> 
	    	<div id="grid_traveldetail" class="nui-datagrid" style="width: 99%;height: auto;" allowCellSelect="true" 
	    		showPager="false" allowCellEdit="true" multiSelect="true" oncellendedit="changeValueon">
	            <div property="columns">
	            <div field="" width="30px"  headerAlign="center" align="center" allowSort="true"  renderer="buttonRenderConclude" headerStyle="color:red">
	            	请选择
           		</div>
	                <div  field="purchaseFirstCode" width="110px" align="center" headerAlign="center"  visible="false">采购物项大类编码
	                </div>
	                <div field="firstItemName"  width="110px" align="center" headerAlign="center"  >采购物项大类名称 
	                </div> 
	                <div  field="purchaseTwoCode" width="110px" align="center" headerAlign="center"  visible="false">采购物项中类编码
	                </div>
	                <div  field="secondItemName" width="110px" align="center" headerAlign="center" renderer="onViewL" >采购物项中类名称 
	                </div> 
	                <div field="purchaseThreeCode" width="110px"  align="center" headerAlign="center"  visible="false">采购物项小类编码
	                </div>
	                <div field="threeItemName" width="110px" align="center" headerAlign="center" renderer="onViewL" >采购物项小类名称 
	                </div>
	               <div  field="brandSpec" align="center" headerAlign="center"  >规格
						<input id="brandSpec" name="brandSpec" property="editor"  class="nui-textbox"   width="100%"/>
	                </div>
	                <div  field="onePrice"   align="center" headerAlign="center" vtype="required" headerStyle="color:red">单价(万元)
						<input id="supplierName" name="supplierName" property="editor"  class="nui-textbox" width="100%"/>
	                </div>
	                <div  field="number"   align="center" headerAlign="center"  vtype="required" headerStyle="color:red">数量
						<input id="onePrice" name="onePrice" property="editor"  class="nui-textbox" width="100%"/>
	                </div>
	                <div   field="totalPrice" align="center" headerAlign="center"  >总价(万元)
						<input id="totalPrice" name="totalPrice" property="editor"  class="nui-textbox"  width="100%"/>
	                </div>
	            </div>
	        </div>
		</div>
		</fieldset>
	</div>
</div>
	<div style="text-align:center;padding:10px;" class="nui-toolbar">               
	    <a class="nui-button" onclick="submit" style="width:60px;margin-right:20px;">保存</a>       
	    <a class="nui-button" onclick="closeCancel" style="width:60px;">关闭</a>
	</div>  
	<script type="text/javascript">
	    nui.parse();
	    var saveURL = "com.primeton.mis.contract.contract.addContract.biz.ext";
	    var form = new nui.Form("#form1");
	    var grid_traveldetail = nui.get("grid_traveldetail");
	    var purchaseFirstCode = nui.get("purchaseFirstCode");
	    var firstItemName = nui.get("firstItemName");
	    var purchaseTwoCode = nui.get("purchaseTwoCode");
	    var secondItemName = nui.get("secondItemName");
	    var purchaseThreeCode = nui.get("purchaseThreeCode");
	    var threeItemName = nui.get("threeItemName");
	   	
	   	function changeValueon(e){
			var row = grid_traveldetail.getSelected();
			var record = e.record;
			if(e.field=="number"||e.field=="onePrice"){
				if(record.number!=null && record.onePrice!=null){
					var totalPrice1 = mulFloat(record.number,record.onePrice);
					 grid_traveldetail.updateRow(row,{
						totalPrice:totalPrice1
                  	}); 
				}
			}
			var data = grid_traveldetail.getData();
			var totalPrice=0;
		    for(var i = 0 ; i<data.length; i++){
				if(data[i].totalPriceDetail != undefined){
					totalPrice=totalPrice+data[i].totalPriceDetail;
					nui.get("totalPrice").setValue(totalPrice);
				}
			}          	
		}
	   	function submit(){
	   		var isTwo = getJudge(); //部门类型
	   		var formData = form.getData();
			var gridData = grid_traveldetail.getData();
		   	if(!form.validate()||gridData.length<=0){
		   		showTips("请检查表单填写是否完整，物料明细是否增加")
		   		return;	
		   	}
		   	grid_traveldetail.validate();
			if (grid_traveldetail.isValid() == false) {
				var error = grid_traveldetail.getCellErrors()[0];
				grid_traveldetail.beginEditCell(error.record, error.column);
				return;
			} 
		   	if(getOrgseq2()==19){
		   		isTwo = 3;
		   	}
		   	
			var json = nui.encode({"purUrgent":formData,"purUrgentItem":gridData,"isTwo":isTwo});
			if(!confirm("是否保存？")){
				return;
			}else{	
	    		ajaxCommon({
	                url: "com.zhonghe.ame.purchase.purchaseItems.addPurUrgent.biz.ext",
	                data: json,
	                success: function (text) {
	               		 showTips("新增紧急采购成功");
    					 closeOk();
	                }
	            }); 
    	}}
	   	
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
                        data = mini.clone(data);
                        if (data) {
                        	clog(data)
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
			 +      '<span class="mini-button-icon mini-iconfont icon-add" style="margin:3;margin-top: 12%;">'
			 +     '<span class="mini-button-text"></span>'
			 +      '</span>'
			 +   '</span>'
			 +  '</ a>'
		    return s;
		}
		
		function addTicket(){
	    	var rowS = {name: "New Row"} 
			grid_traveldetail.addRow(rowS);
	    }
	    
	    
	    function removeTicket(){
			var rows = grid_traveldetail.getSelecteds();
	        if (rows.length>0) {
	            grid_traveldetail.removeRows(rows, true);
	        }else{
	        	nui.alert("请至少选中一条记录！");
	        }
		}
		
	  	function GetData() {
	        var node = tree.getSelectedNode();
	        return node;
	    }
</script></body>
</html>
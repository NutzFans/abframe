<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <title>新增紧急采购</title>
    <script src="<%= request.getContextPath() %>/common/nui/nui.js" type="text/javascript"></script>
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
					<div style="padding: 5px; margin-left:5%;">
				<table style="table-layout: fixed;" id="table_file">
            	
            	<tr>
            		<td class="form_label" align="right">紧急采购名称：</td>
	                <td >
	                    <input id="purchaseName" name="purchaseName" class="nui-textbox" required="true"  style="width:200px;"/>
	                </td>
	                <td class="form_label" align="right">紧急采购编号：</td>
	                <td >
	                    <input id="purchaseCode" name="purchaseCode" class="nui-textbox" required="true"  style="width:200px;"/>
	                </td>
            	</tr>
            	<tr>
            	  <td class="form_label" align="right">采购单位：</td>
                    <td >
                    	<input name="orgId" id="orgId"
									class="nui-combobox" required="true"
									url="com.primeton.rdmgr.labor.labormgr.getAllOrgs.biz.ext"
									filterType="like" textField="orgname" valueField="orgid"
									dataField="allorgs" valueFromSelect="true" allowInput="true"
									 style="width:200px;" />    
                    </td>
            	<td class="form_label" align="right">合同发包方式：</td>
	                <td colspan="1">
	                    <input id="contrctType" name="contrctType" class="nui-dictcombobox" dictTypeId="ZH_CGFS" required="true"  style="width:200px;"/>
	                </td>
            	</tr>
            	<tr>
            		<td class="form_label" align="right">申请原因：</td>
	                 <td  colspan="7">    
                        <input style="width:100%;height: 40px;" name="applyReason" id="applyReason" class="nui-textarea" id="applyReason"  required="true"/>
                    </td>
            	</tr>
            	
         
            </table>
        </div>
        </form>
   
	          <fieldset  style="height:100%; border:solid 1px #aaa;padding:3px ;width: 99%; ">
     <div class="fieldset-body"  style="width:100%; height:100%; margin: 0px auto">
    
	    	<div id="grid_traveldetail" class="nui-datagrid" style="width: 100%;height: auto;" allowCellSelect="true" 
	    		showPager="false" allowCellEdit="false" multiSelect="true" dataField="purUrgentItem" 
	    		url="com.zhonghe.ame.purchase.purchaseItems.queryPurUrgentItem.biz.ext">
	            <div property="columns">
	                <div  field="purchaseFirstCode" width="130" align="center" headerAlign="center" visible="false">采购物项大类编码
							<input id="purchaseFirstCode" name="purchaseFirstCode" property="editor"  class="nui-textbox" enabled="false" onbuttonclick="onButtonEdit123" />
	                </div>
	                <div field="firstitemvalue" width="100" align="center" headerAlign="center"  >采购物项大类名称 
	                	<input  id="firstItemName" name="firstItemName" property="editor" class="nui-textbox" vtype="maxLength:100"  enabled="false" />
	                </div> 
	                <div  field="purchaseTwoCode" width="130" align="center" headerAlign="center" visible="false">采购物项中类编码
							<input  property="editor" id="purchaseTwoCode" name="purchaseTwoCode" class="nui-textbox"  enabled="false" />
	                </div>
	                <div  field="seconditemvalue" width="100" align="center" headerAlign="center" >采购物项中类名称 
	                	<input  property="editor" id="secondItemName" name="secondItemName" class="nui-textbox" vtype="maxLength:100"  enabled="false" />
	                </div> 
	                <div field="purchaseThreeCode" id="purchaseThreeCode" width="130" align="center" headerAlign="center" visible="false">采购物项小类编码
								<input  property="editor" id="purchaseThreeCode" name="purchaseThreeCode" class="nui-textbox" onbuttonclick="onButtonEdit123"  enabled="false" />
	                </div>
	                <div field="threeitemvalue" id="threeItemName" width="100" align="center" headerAlign="center" >采购物项小类名称 
	                	<input   property="editor" class="nui-textbox" id="threeItemName"  name="threeItemName" enabled="false" />
	                </div>
	               <div  field="brandSpec" width="130" align="center" headerAlign="center"  >规格
							<input id="brandSpec" name="brandSpec" property="editor"  class="nui-textbox"   />
	                </div>
	                <div  field="onePrice"  width="130" align="center" headerAlign="center"  >单价(元)
							<input id="supplierName" name="supplierName" property="editor"  class="nui-textbox"  />
	                </div>
	                <div  field="number"  width="130" align="center" headerAlign="center"  >数量
							<input id="onePrice" name="onePrice" property="editor"  class="nui-textbox"  />
	                </div>
	                <div   field="totalPrice" width="130" align="center" headerAlign="center"  >总价(元)
							<input id="totalPrice" name="totalPrice" property="editor"  class="nui-textbox"  />
	                </div>
	            </div>
	        </div>
		</div>
			</fieldset>
        </fieldset>
        
        
	</div>
</div>

	<div style="text-align:center;padding:10px;border-width:1px 0px 0px 0px;" class="nui-toolbar">               
	    <!-- <a class="nui-button" onclick="submit" style="width:60px;margin-right:20px;">提交</a>    -->    
	    <a class="nui-button" onclick="closeCancel()" style="width:60px;">关闭</a>
	</div> 
      

<script type="text/javascript">
	    nui.parse();
	    //var updateURL = "com.primeton.mis.contract.contract.updateContract.biz.ext";
	    var saveURL = "com.primeton.mis.contract.contract.addContract.biz.ext";
	    var form = new nui.Form("#form1");
	    var grid_traveldetail = nui.get("grid_traveldetail");
	   	
	   	var id = <%=request.getParameter("id")%>;
		isViewDelete=false;
	   	form.setEnabled(false)
	    var processid = <%=request.getParameter("processid")%>;
	   	if(processid==null){
	   		processid = <%=request.getParameter("processInstID")%>;
	   	}
	   	
	    init();
	   	function init(){
	   		var json = nui.encode({"id":id});
	   		nui.ajax({	
					url: "com.zhonghe.ame.purchase.purchaseItems.queryPurUrgentDetailByid.biz.ext",
				    type: 'POST',
			        data: json,
			        success: function (o) {
			        	form.setData(o.purUrgent);
	            		/*  nui.get("purchaseName").setValue(o.purUrgent.purchaseName);
			       	  	 nui.get("purchaseCode").setValue(o.purUrgent.purchaseCode);
			       	  	 nui.get("contrctType").setValue(o.purUrgent.contrctType);
			       	  	 nui.get("orgId").setText(o.purUrgent.orgname);
             		     nui.get("applyReason").setValue(o.purUrgent.applyReason);  */
			       	  	console.log(o.purUrgent);
			       		 
						 var jsonData = {"urgentId":o.purUrgent.id}
						 console.log(jsonData);
			       		 grid_traveldetail.load(jsonData);
			        },
				    error: function (jqXHR, textStatus, errorThrown) {
				        alert(jqXHR.responseText);
				    }
			    }); 
	   	}

	
</script></body>
</html>
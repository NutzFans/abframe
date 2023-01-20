<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@include file="/purchase/common/common.jsp"%>
<html>
<head>
    <title>紧急采购查看</title>
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
	                <td >
	                    <input id="contrctType" name="contrctType" class="nui-textbox" required="true"  style="width:200px;"/>
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
	    	<div id="grid_traveldetail" class="nui-datagrid" style="width: 99%;height: auto;" allowCellSelect="true" 
	    		showPager="false" allowCellEdit="true" multiSelect="true" dataField="purUrgentItem" 
	    		url="com.zhonghe.ame.purchase.purchaseItems.queryPurUrgentItem.biz.ext">
	            <div property="columns">
	                <div field="firstitemvalue" width="100" align="center" headerAlign="center"  >物项大类名称 </div>
	                <div  field="seconditemvalue" width="100" align="center" headerAlign="center" >物项中类名称 </div>
	                <div field="threeitemvalue" width="100" align="center" headerAlign="center" >物项小类名称</div> 
	               <div  field="brandSpec" width="130" align="center" headerAlign="center"  >规格</div>
	                <div  field="onePrice"  width="70" align="center" headerAlign="center"  >单价(元)</div>
	                <div  field="number"  width="70" align="center" headerAlign="center"  >数量</div>
	                <div   field="totalPrice" width="80" align="center" headerAlign="center"  >总价(元)</div>
	                <div   field="remark" width="130" align="center" headerAlign="center"  >备注</div>
	            </div>
	        </div>
			</div>
			</fieldset>
        </fieldset>
	</div>
</div>

<script type="text/javascript">
	    nui.parse();
	    var form = new nui.Form("#form1");
	    var grid_traveldetail = nui.get("grid_traveldetail");
	    var processid = <%=request.getParameter("processid")%>;
	   	if(processid==null){
	   		processid = <%=request.getParameter("processInstID")%>;
	   	}
   		form.setEnabled(false)
	    init();
	   	function init(){
	   		var json = nui.encode({"processid":processid});
	   		nui.ajax({	
					url: "com.zhonghe.ame.purchase.purchaseItems.queryPurUrgentDetail.biz.ext",
				    type: 'POST',
			        data: json,
			        success: function (o) {
						 form.setData(o.purUrgent);
			       	  	 nui.get("orgId").setText(o.purUrgent.orgname);
             		     nui.get("applyReason").setValue(o.purUrgent.applyReason); 
			       		 
			       	/* 	 console.log()
						 grid.load({processInstID:o.purUrgent.processid});
						 grid.sortBy("time", "desc"); 
						 //初始化处理意见
						 initMisOpinion({auditstatus:"1"});*/
						 var jsonData = {"urgentId":o.purUrgent.id}
						 console.log(jsonData);
			       		 grid_traveldetail.load(jsonData);
			        },
				    error: function (jqXHR, textStatus, errorThrown) {
				        alert(jqXHR.responseText);
				    }
			    }); 
	   	}
	   	
	  function GetData() {
        var node = tree.getSelectedNode();
        return node;
    }

	
</script></body>
</html>
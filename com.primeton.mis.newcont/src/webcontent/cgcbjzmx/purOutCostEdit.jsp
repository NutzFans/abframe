<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<!-- 
  - Author(s): yeshusheng
  - Date: 2019-08-28 16:17:56
  - Description:
-->
<head>
<title>修改采购成本明细</title>
<meta http-equiv="content-type" content="text/html; charset=UTF-8" />
<script src="<%= request.getContextPath() %>/common/nui/nui.js" type="text/javascript"></script>
	<style type="text/css">
	    body{
	        margin:0;padding:0;border:0;width:100%;height:100%;overflow:hidden;
	    }
    </style>
</head>
<body>
<div class="nui-fit">
	<fieldset id="field1" style="border:solid 1px #aaa;padding:3px;">
	<legend>采购成本明细详细信息</legend>
	<form id="form1" method="post">
		<input name="purOutCost.outcostid" id="outcostid" class="nui-hidden"/>
		<div style="padding:5px;">
			<table style="table-layout:fixed;" id="table_file" >
				<tr>
					<td align="right" style="width:140px">成本确认日期：</td>
					<td><input name="purOutCost.confirmdate" id="confirmdate" class="nui-datepicker"  style="width:120px" required="true"/></td>
					<td align="right" style="width:140px">成本结转类型：</td>
					<td>
	            		<input required="true" style="width:120px" name="purOutCost.outcosttype" id="outcosttype" class="nui-dictcombobox" dictTypeId="AME_OUTCOSTTYPE" showNullItem="true" nullItemText=""/>
				    </td>
					<td align="right" style="width:140px">凭证号数：</td>
					<td><input name="purOutCost.pzhs" id="pzhs" class="nui-textbox" style="width:120px" /></td>
				</tr>
				<tr>
					<td align="right" style="width:140px">成本结转金额(含税)：</td>
					<td><input name="purOutCost.taxmon" id="taxmon" class="nui-spinner" style="width:120px" format="n2" allowLimitValue="false" changeOnMousewheel="false" increment="0" showButton="false" inputStyle="text-align:right;" allowInput="true"/></td>
					<td align="right" style="width:140px">成本结转金额(不含税)：</td>
					<td><input name="purOutCost.notaxmon" id="notaxmon" class="nui-spinner" style="width:120px" format="n2" allowLimitValue="false" changeOnMousewheel="false" increment="0" showButton="false" inputStyle="text-align:right;" allowInput="true"/></td>
					<td align="right" style="width:120px">采购合同编号：</td>
					<td><input name="purOutCost.purcontno" id="purcontno" class="nui-textbox" style="width:120px"/></td>
				</tr>
				<tr>
					<td align="right" style="width:120px">采购订单编号：</td>
					<td><input name="purOutCost.purorderno" id="purorderno" class="nui-textbox" style="width:120px"/></td>
					<td align="right" style="width:140px">结算单金额：</td>
					<td><input name="purOutCost.settlemon" id="settlemon" class="nui-spinner" style="width:120px" format="n2" allowLimitValue="false" changeOnMousewheel="false" increment="0" showButton="false" inputStyle="text-align:right;" allowInput="true"/></td>
					<td align="right" style="width:120px">计提单编号：</td>
					<td><input name="purOutCost.accruedid" id="accruedid" class="nui-textbox" style="width:120px"/></td>
				</tr>
				<tr>
					<td align="right" style="width:140px">计提金额：</td>
					<td><input name="purOutCost.accruedmon" id="accruedmon" class="nui-textbox" style="width:120px"/></td>
					<td align="right" style="width:140px">成本开始日期：</td>
					<td><input name="purOutCost.startdate" id="startdate" class="nui-datepicker"  style="width:120px"/></td>
					<td align="right" style="width:140px">成本结束日期：</td>
					<td><input name="purOutCost.enddate" id="enddate" class="nui-datepicker"  style="width:120px"/></td>
				</tr>
				<tr>
					<td align="right" style="width:120px">成本结转状态：</td>
					<td>
				        <input style="width:120px" name="purOutCost.outcoststatus" id="outcoststatus" class="nui-dictcombobox" dictTypeId="AME_OUTCOSTSTATUS" showNullItem="true" nullItemText=""/>
				    </td>
					<td align="right" style="width:120px">成本结转说明：</td>
					<td>
				        <input style="width:120px" name="purOutCost.costmemo" id="costmemo" class="nui-dictcombobox" dictTypeId="AME_COSTTYPE" showNullItem="true" />
				    </td>
					<td align="right" style="width:120px">存货结转日期：</td>
					<td><input name="purOutCost.stockdate" id="stockdate" class="nui-textbox" style="width:120px"/></td>
				</tr>
				<tr>
					<td align="right" style="width:140px">财务对应合同编号：</td>
					<td><input name="purOutCost.contnum" id="contnum" class="nui-textbox" style="width:120px"/></td>
					<td align="right" style="width:140px">工作量单位：</td>
					<td><input name="purOutCost.workunit" id="workunit" class="nui-textbox"  style="width:120px"/></td>
					<td align="right" style="width:140px">工作量数量：</td>
					<td><input name="purOutCost.workamount" id="workamount" class="nui-textbox"  style="width:120px"/></td>
				</tr>
			</table>
		</div>
	</form>
	</fieldset>
</div>
	<div style="text-align:center;padding:10px;" class="nui-toolbar">
		<a class="nui-button" onclick="onOk()" id="updatePurOutCost" style="width:60px;margin-right:20px;">保存</a>
		<a class="nui-button" onclick="onCancel('cancel')" style="width:60px;">关闭</a>
	</div>
<script type="text/javascript">
    nui.parse();
  	var form = new nui.Form("#form1");
    function SetData(data){
    	data = nui.clone(data);
    	if(data.action == "edit"){
    		var json = nui.encode(data.row); 
    		nui.get("outcostid").setValue(data.row.outcostid);
    		nui.get("confirmdate").setValue(data.row.confirmdate);
    		nui.get("outcosttype").setValue(data.row.outcosttype);
    		nui.get("pzhs").setValue(data.row.pzhs);
    		
    		nui.get("taxmon").setValue(data.row.taxmon);
    		nui.get("notaxmon").setValue(data.row.notaxmon);
    		nui.get("purcontno").setValue(data.row.purcontno);
    		
    		nui.get("purorderno").setValue(data.row.purorderno);
    		nui.get("settlemon").setValue(data.row.settlemon);
    		nui.get("accruedid").setValue(data.row.accruedid);
    		
    		nui.get("accruedmon").setValue(data.row.accruedmon);
    		nui.get("startdate").setValue(data.row.startdate);
    		nui.get("enddate").setValue(data.row.enddate);
    		
    		nui.get("outcoststatus").setValue(data.row.outcoststatus);
    		nui.get("costmemo").setValue(data.row.costmemo);
    		nui.get("stockdate").setValue(data.row.stockdate);
    		
    		nui.get("contnum").setValue(data.row.contnum);
    		nui.get("workunit").setValue(data.row.workunit);
    		nui.get("workamount").setValue(data.row.workamount);
		}
	}
	
	function onOk() {
		if(!form.validate()){
	    	alert("表单信息填写不完整，请确认必输项是否填写！！");
	    	return;
	    }
	    if(confirm("确定提交？")){
			nui.get("updatePurOutCost").disable();
			var data = form.getData(); 
			alert(nui.encode(data));
			nui.ajax({
        		url: "com.primeton.mis.newcont.cgcbjzmx.updatePurOutCost.biz.ext",
                data: data,
                type: 'POST',
                cache: false,
                contentType: 'text/json',
                success: function (o) {
                	alert(o.result);
                    CloseWindow("ok");
                },
                error: function (jqXHR, textStatus, errorThrown) {
                    alert(jqXHR.responseText);
                    CloseWindow();
                }
        	});
		}
	}
        
    //标准方法接口定义
    function CloseWindow(action) {           
        if (action == "close" && form.isChanged()) {
            if (confirm("数据被修改了，是否先保存？")) {
                return false;
            }
        }
        if (window.CloseOwnerWindow) return window.CloseOwnerWindow(action);
        else window.close();            
    }
    
    function onCancel(e) {
        CloseWindow("cancel");
    }
    </script>
</body>
</html>

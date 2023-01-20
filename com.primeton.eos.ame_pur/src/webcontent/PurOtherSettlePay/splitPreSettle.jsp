<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%
	String contextPath=request.getContextPath();
 %>
<html>
<!-- 
  - Author(s): zhuyl
  - Date: 2016-11-22 17:21:55
  - Description:
-->
<head>
	<title>计提拆分页面</title>
	<meta http-equiv="content-type" content="text/html; charset=UTF-8" />
	<script src="<%= request.getContextPath() %>/common/nui/nui.js"
		type="text/javascript"></script>
	<style type="text/css">
	    body{
	        margin:0;padding:0;border:0;width:100%;height:100%;overflow:hidden;
	    }
    </style>
</head>
<body>
	<div id="winPreSplit" class="nui-window" title="计提记录拆分" style="width:500px;height:245px;" 
	    showMaxButton="true" showCollapseButton="true" showShadow="true"
	    showToolbar="false" showFooter="true" showModal="true" allowResize="true" allowDrag="true">
    	<div style="padding:5px;">
			<input name="purPreSettle.thisNoTaxMoney" id="thisNoTaxMoney" class="nui-hidden"/>
			<input name="purPreSettle.surplusNoTaxMoney" id="surplusNoTaxMoney" class="nui-hidden"/>
    		<table style="table-layout:fixed;" id="table_file2">
    			<tr>
    				<td align="right" style="width:120px;">计提总金额：</td>
    				<td>
			    		<input name="purPreSettle.splitAccruedmoney" id="splitAccruedmoney" class="nui-spinner" showButton="false" allowLimitValue="false" changeOnMousewheel="false" format="n" inputStyle="text-align: right" readOnly="readOnly" style="width: 100px"/>
    				</td>
    				<td align="right" style="width:120px;">剩余核销备注：</td>
    				<td>
    					<input name="purPreSettle.thisVerificationComment" id="splitAccruedcomment" class="nui-textbox" showButton="false"  style="width: 100px"/>
    				</td>
    			</tr>
    			<tr>
    				<td align="right" style="width:120px;">本次核销金额：</td>
    				<td>
			    		<input name="purPreSettle.thisVerificationMoney" id="thisVerificationMoney" onblur="changedThisMoney" class="nui-spinner" showButton="false" allowLimitValue="false" changeOnMousewheel="false" format="n" inputStyle="text-align: right" style="width: 100px"/>
    				</td>
    				<td align="right" style="width:120px;">剩余核销金额：</td>
    				<td>
			    		<input name="purPreSettle.surplusVerificationMoney" id="surplusVerificationMoney" onblur="changedSurplusMoney" class="nui-spinner" showButton="false" allowLimitValue="false" changeOnMousewheel="false" format="n" inputStyle="text-align: right" style="width: 100px"/>
    				</td>
    			</tr>
    			<tr>
    			</tr>
    			<tr>
    				<td align="right" style="width:120px;">本次工作量单位：</td>
    				<td>
			    		<input name="purPreSettle.thisWorkunit" id="thisWorkunit" class="nui-dictcombobox" dictTypeId="SERV_NUM_TYPE" style="width: 100px" />
    				</td>
    				<td align="right" style="width:120px;">剩余工作量单位：</td>
    				<td>
			    		<input name="purPreSettle.surplusWorkunit" id="surplusWorkunit" class="nui-dictcombobox" dictTypeId="SERV_NUM_TYPE" style="width: 100px" />
    				</td>
    			</tr>
    			<tr>
    				<td align="right" style="width:120px;">本次工作量数量：</td>
    				<td>
			    		<input name="purPreSettle.thisWorkamount" id="thisWorkamount" onblur="changedWorkamount" class="nui-spinner" showButton="false" allowLimitValue="false" changeOnMousewheel="false" format="n3" inputStyle="text-align: right" style="width: 100px"/>
    				</td>
    				<td align="right" style="width:120px;">剩余工作量数量：</td>
    				<td>
			    		<input name="purPreSettle.surplusWorkamount" id="surplusWorkamount" onblur="changedWorkamount" class="nui-spinner" showButton="false" allowLimitValue="false" changeOnMousewheel="false" format="n3" inputStyle="text-align: right" style="width: 100px"/>
    				</td>
    			</tr>
    		</table>
    	</div>
	    <div class="nui-toolbar" style="padding:10px;">
	        <a class="nui-button" onclick="surePreSplit()" style="width:60px;margin-left: 170px;">确定</a>
	        <a class="nui-button" onclick="hidePreSplitWindow()" style="width:60px;" id="sureButton">关闭</a>
	    </div>
	</div>
	<script type="text/javascript">
		//计提拆分
	    function onPreSplit(e) {
            var grid = e.sender;
            var record = e.record;
            var uid = record._uid;
            var rowIndex = e.rowIndex;
            var s = ' <a class="Edit_Button" href="javascript: editPreSplitRow(\'' + uid + '\')" >计提拆分</a>';
            return s;
        }
        var chooseRow = "";
        //总工作量数量
        var totalWorkamount = 0;
        function editPreSplitRow(row_uid) {
        	
        	//成本确认日期为空，设置为当天。
            var row = grid2.getRowByUID(row_uid);
            if (row) {
            	//计提总金额：splitAccruedmoney 本次核销金额：thisVerificationMoney 剩余核销金额：surplusVerificationMoney
            	taxrate = row.taxrate;
            	nui.get("splitAccruedmoney").setValue(row.accruedmoney);
            	nui.get("thisVerificationMoney").setValue(0);
	    		nui.get("surplusVerificationMoney").setValue(0);
	    		totalWorkamount = row.workamount;
	    		nui.get("thisWorkunit").setValue(row.workunit);
	    		//nui.get("thisWorkamount").setValue(row.workamount);
	    		nui.get("surplusWorkunit").setValue(row.workunit);
        		showAtPreSplit();
        		chooseRow = row;
            }
        }
        //拆分金额
        function showAtPreSplit() {
	        var win = nui.get("winPreSplit");
	        win.showAtPos("center", "middle");
	    }
	    //隐藏拆分页面
	    function hidePreSplitWindow() {
	        var win = nui.get("winPreSplit");
	        win.hide();
	    }
        //确定拆分
        function surePreSplit(){
        	//拆分的金额之和要和计提的总金额相等
        	var splitAccruedmoney = nui.get("splitAccruedmoney").getValue();
        	var thisVerificationMoney = nui.get("thisVerificationMoney").getValue();
    		var surplusVerificationMoney = nui.get("surplusVerificationMoney").getValue();
	    	if(splitAccruedmoney != (thisVerificationMoney + surplusVerificationMoney)){
	    		nui.alert("本次核销金额" + thisVerificationMoney + "与剩余核销金额" + surplusVerificationMoney + "之和不等于计提总金额" + splitAccruedmoney + "！");
	    		return;
	    	}
	    	var thisWorkunit = nui.get("thisWorkunit").getValue();
	    	var thisWorkamount = nui.get("thisWorkamount").getValue();
	    	var surplusWorkunit = nui.get("surplusWorkunit").getValue();
	    	var surplusWorkamount = nui.get("surplusWorkamount").getValue();
	    	nui.confirm("本次核销金额：" + thisVerificationMoney + "，工作量单位：" + nui.getDictText('SERV_NUM_TYPE',thisWorkunit) 
	    		+ "，工作量数量：" + thisWorkamount + "；<br/>剩余核销金额：" + surplusVerificationMoney + "，工作量单位：" 
	    		+ nui.getDictText('SERV_NUM_TYPE',surplusWorkunit) + "，工作量数量：" + surplusWorkamount 
	    		+ "，<br/>确定要拆分计提吗？","操作提示",
	    		function(action){
	    			if(action == "ok"){
	    				hidePreSplitWindow();
	    				//本次核销金额
	    				var thisVerificationMoney = nui.get("thisVerificationMoney").getValue();
	    				//剩余核销金额
	    				var surplusVerificationMoney = nui.get("surplusVerificationMoney").getValue();
	    				//本次核销不含税金额
	    				var thisNoTaxMoney = nui.get("thisNoTaxMoney").getValue();
	    				//剩余核销不含税金额
	    				var surplusNoTaxMoney = nui.get("surplusNoTaxMoney").getValue(); 
	    				//本次工作量单位
	    				var thisWorkunit = nui.get("thisWorkunit").getValue();
	    				//本次工作量数量
	    				var thisWorkamount = nui.get("thisWorkamount").getValue();
	    				//剩余工作量单位
	    				var surplusWorkunit = nui.get("surplusWorkunit").getValue();
	    				//剩余工作量数量
	    				var surplusWorkamount = nui.get("surplusWorkamount").getValue();
	    				//剩余备注
	    				var splitAccruedcomment = nui.get("splitAccruedcomment").getValue();
	    				//选中的计提数据chooseRow
						var json = {"purPresettle": chooseRow};
						json.purPresettle.thisVerificationMoney = thisVerificationMoney;
						json.purPresettle.surplusVerificationMoney = surplusVerificationMoney;
						json.purPresettle.thisNoTaxMoney = thisNoTaxMoney;
						json.purPresettle.surplusNoTaxMoney = surplusNoTaxMoney;
						json.purPresettle.thisWorkunit = thisWorkunit;
						json.purPresettle.thisWorkamount = thisWorkamount;
						json.purPresettle.surplusWorkunit = surplusWorkunit;
						json.purPresettle.surplusWorkamount = surplusWorkamount;
						json.purPresettle.thisVerificationComment = splitAccruedcomment;
	                    grid2.loading("正在拆分计提中,请稍等...");
	                    nui.ajax({
	                        url:"com.primeton.eos.ame_pur.outaccrued.splitPresettle.biz.ext",
	                        type:'POST',
	                        data:json,
	                        cache: false,
	                        contentType:'text/json',
	                        success:function(text){
	                            var returnJson = nui.decode(text);
	                            grid2.unmask();
	                            if(returnJson.result == null){
	                            	nui.alert("计提拆分成功！","系统提示",function(){
	                            		var projectno = nui.get("projectno").getValue();
	                                	var settlementid = nui.get("settlementid").getValue();
	                                	var custid = nui.get("custid").getValue();
	                                	var jsonPresettle = nui.decode({purPresettle: {custid: custid,projectno: projectno,iden:'2'}});
					                	grid2.load(jsonPresettle,function(){
					                		grid2.selectAll(false);
					                		var rowsPresettle = grid2.getSelecteds();
					                		settlementid = settlementid + "";
					                		if(settlementid.indexOf(",") > 0){
					                			var settlementids=settlementid.split(',');
					                			for(var j = 0;j < settlementids.length;j++){
						                			for(var i = 0;i < rowsPresettle.length;i++){
							                			if(rowsPresettle[i].settlementid != settlementids[j]){
							                				if(j==0){
							                					grid2.deselect(rowsPresettle[i]);
							                				}
							                			}else{
							                				grid2.select(rowsPresettle[i]);
							                			}
							                		}
						                		}
					                		}else{
					                			for(var i = 0;i < rowsPresettle.length;i++){
						                			if(rowsPresettle[i].settlementid != settlementid){
					                					grid2.deselect(rowsPresettle[i]);
						                			}else{
						                				grid2.select(rowsPresettle[i]);
						                			}
						                		}
					                		}
					                		
					                	});
	                            	});
	                            }else{
	                            	 nui.alert("计提拆分失败", "系统提示");
	                            }
	                        }
	                    }); 	    				
	    			}else{
	    				showAtPreSplit();
	    			}
	    		}
	    	);
	    }
	    
	    //修改本次核销金额
	    function changedThisMoney(){
	    	//计提总金额：splitAccruedmoney 本次核销金额：thisVerificationMoney 剩余核销金额：surplusVerificationMoney
	    	var splitAccruedmoney = nui.get("splitAccruedmoney").getValue();
	    	var thisVerificationMoney = nui.get("thisVerificationMoney").getValue();
	    	//本次工作量数量
	    	var thisWorkamount = nui.get("thisWorkamount").getValue();
	    	//剩余核销金额
	    	nui.get("surplusVerificationMoney").setValue(splitAccruedmoney - thisVerificationMoney);
	    	//剩余核销不含税金额
	    	nui.get("surplusNoTaxMoney").setValue(parseFloat((splitAccruedmoney - thisVerificationMoney)/(1+taxrate)).toFixed(2));
	    	//本次核销不含税金额
	    	nui.get("thisNoTaxMoney").setValue(parseFloat(thisVerificationMoney/(1+taxrate)).toFixed(2));
	    	//本次工作量数量
	    	nui.get("thisWorkamount").setValue(parseFloat(thisVerificationMoney/splitAccruedmoney*totalWorkamount).toFixed(3));
	    	//剩余工作量数量
	    	nui.get("surplusWorkamount").setValue(parseFloat(totalWorkamount-thisVerificationMoney/splitAccruedmoney*totalWorkamount).toFixed(3));
	    }
	    //修改剩余核销金额
	    function changedSurplusMoney(){
	    	var splitAccruedmoney = nui.get("splitAccruedmoney").getValue();
	    	var surplusVerificationMoney = nui.get("surplusVerificationMoney").getValue();
	    	//本次核销金额
	    	nui.get("thisVerificationMoney").setValue(splitAccruedmoney - surplusVerificationMoney);
	    	//本次核销不含税金额
	    	nui.get("thisNoTaxMoney").setValue(parseFloat((splitAccruedmoney - surplusVerificationMoney)/(1+taxrate)).toFixed(2));
	    	//剩余核销不含税金额
	    	nui.get("surplusNoTaxMoney").setValue(parseFloat(surplusVerificationMoney/(1+taxrate)).toFixed(2));
	    	//本次工作量数量
	    	nui.get("thisWorkamount").setValue(parseFloat(thisVerificationMoney/splitAccruedmoney*totalWorkamount).toFixed(3));
	    	//剩余工作量数量
	    	nui.get("surplusWorkamount").setValue(parseFloat(totalWorkamount-thisVerificationMoney/splitAccruedmoney*totalWorkamount).toFixed(3));
	    }
	</script>
</body>
</html>
<%@page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<!-- 
  - Author(s): mengyy
  - Date: 2019-02-18 13:53:42
  - Description:
-->
<head>
<title>新增合同收入成本记录</title>
	<meta http-equiv="content-type" content="text/html; charset=UTF-8" />
	<script src="<%= request.getContextPath() %>/common/nui/nui.js" type="text/javascript"></script>
	<style type="text/css">
	    body{
	        margin:0;padding:0;border:0;width:100%;height:100%;
	    }
    </style>
</head>
<body>
	<div id="form1" method="post">
		<fieldset id="field1" style="border:solid 1px #aaa;padding:3px;">
			<legend>合同收入成本记录维护</legend>
			<div style="padding:5px;">
				<table style="width:100%;">
					<tr>
						<td align="right" style="width:150px">合同名称：</td>
						<td colspan="3" align="left"><input name="csContStock.contnum" id="contnum"  class="nui-buttonedit" style="width:95%" onbuttonclick="selectCont" required="true" allowInput="false"/></td>
	                	<td align="right" style="width:150px;">财务年月：</td>
						<td colspan="3" align="left">
							<input name="csContStock.finyearmonth" id="finyearmonth" class="nui-monthpicker" required="true" />
						</td>
					</tr>
					<tr>
	                	<td align="right" style="width:150px;">产品收入（含税）：</td>
	                	<td style="width:150px;">    
	                    	<input name="csContStock.incomeProd" id="incomeProd" class="nui-spinner" format="n2"  allowLimitValue="false" changeOnMousewheel="false"  showbutton="false" />
	                	</td>
	                	<td align="right" style="width:150px;">服务收入（含税）：</td>
	                	<td style="width:150px;">    
	                    	<input name="csContStock.incomeServ" id="incomeServ" class="nui-spinner" format="n2"  allowLimitValue="false" changeOnMousewheel="false"  showbutton="false" />
	                	</td>
	                	<td align="right" style="width:150px;">MA收入（含税）：</td>
	                	<td style="width:150px;">    
	                    	<input name="csContStock.incomeMa" id="incomeMa" class="nui-spinner" format="n2"  allowLimitValue="false" changeOnMousewheel="false"  showbutton="false" />
	                	</td>
	                	<td align="right" style="width:150px;">收入含税小计：</td>
	                	<td style="width:150px;">    
	                    	<input name="csContStock.income" id="income" class="nui-spinner" format="n2"  allowLimitValue="false" changeOnMousewheel="false"  showbutton="false" />
	                	</td>
					</tr>
					<tr>
	                	<td align="right" style="width:100px;">产品收入（不含税）：</td>
	                	<td style="width:150px;">    
	                    	<input name="csContStock.incomeProdNet" id="incomeProdNet" class="nui-spinner" format="n2"  allowLimitValue="false" changeOnMousewheel="false"  showbutton="false" />
	                	</td>
	                	<td align="right" style="width:100px;">服务收入（不含税）：</td>
	                	<td style="width:150px;">    
	                    	<input name="csContStock.incomeServNet" id="incomeServNet" class="nui-spinner" format="n2"  allowLimitValue="false" changeOnMousewheel="false"  showbutton="false" />
	                	</td>
	                	<td align="right" style="width:100px;">MA收入（不含税）：</td>
	                	<td style="width:150px;">    
	                    	<input name="csContStock.incomeMaNet" id="incomeMaNet" class="nui-spinner" format="n2"  allowLimitValue="false" changeOnMousewheel="false"  showbutton="false" />
	                	</td>
	                	<td align="right" style="width:100px;">收入不含税小计：</td>
	                	<td style="width:150px;">    
	                    	<input name="csContStock.incomeNet" id="incomeNet" class="nui-spinner" format="n2"  allowLimitValue="false" changeOnMousewheel="false"  showbutton="false" />
	                	</td>
					</tr>
					<tr>
	                	<td align="right" style="width:100px;">生产费用-人工成本：</td>
	                	<td style="width:150px;">    
	                    	<input name="csContStock.scfyRg" id="scfyRg" class="nui-spinner" format="n2"  allowLimitValue="false" changeOnMousewheel="false"  showbutton="false" />
	                	</td>
	                	<td align="right" style="width:100px;">生产费用-外包成本：</td>
	                	<td style="width:150px;">    
	                    	<input name="csContStock.scfyWb" id="scfyWb" class="nui-spinner" format="n2"  allowLimitValue="false" changeOnMousewheel="false"  showbutton="false" "/>
	                	</td>
	                	<td align="right" style="width:100px;">生产费用-直接费用：</td>
	                	<td style="width:150px;">    
	                    	<input name="csContStock.scfyBx" id="scfyBx" class="nui-spinner" format="n2"  allowLimitValue="false" changeOnMousewheel="false"  showbutton="false" />
	                	</td>
	                	<td align="right" style="width:100px;">生产费用余额：</td>
	                	<td style="width:150px;">    
	                    	<input name="csContStock.scfy" id="scfy" class="nui-spinner" format="n2"  allowLimitValue="false" changeOnMousewheel="false"  showbutton="false" />
	                	</td>
					</tr>
					<tr>
	                	<td align="right" style="width:100px;">成本结转-人工成本：</td>
	                	<td style="width:150px;">    
	                    	<input name="csContStock.cbjzRg" id="cbjzRg" class="nui-spinner" format="n2"  allowLimitValue="false" changeOnMousewheel="false"  showbutton="false" />
	                	</td>
	                	<td align="right" style="width:100px;">成本结转-外包成本：</td>
	                	<td style="width:150px;">    
	                    	<input name="csContStock.cbjzWb" id="cbjzWb" class="nui-spinner" format="n2"  allowLimitValue="false" changeOnMousewheel="false"  showbutton="false" />
	                	</td>
	                	<td align="right" style="width:100px;">成本结转-直接费用：</td>
	                	<td style="width:150px;">    
	                    	<input name="csContStock.cbjzBx" id="cbjzBx" class="nui-spinner" format="n2"  allowLimitValue="false" changeOnMousewheel="false"  showbutton="false" />
	                	</td>
	                	<td align="right" style="width:100px;">成本结转额：</td>
	                	<td style="width:150px;">    
	                    	<input name="csContStock.cbjz" id="cbjz" class="nui-spinner" format="n2"  allowLimitValue="false" changeOnMousewheel="false"  showbutton="false" />
	                	</td>
					</tr>
					<tr>
	                	<td align="right" style="width:100px;">存货余额-人工成本：</td>
	                	<td style="width:150px;">    
	                    	<input name="csContStock.stockRg" id="stockRg" class="nui-spinner" format="n2"  allowLimitValue="false" changeOnMousewheel="false"  showbutton="false" />
	                	</td>
	                	<td align="right" style="width:100px;">存货余额-外包成本：</td>
	                	<td style="width:150px;">    
	                    	<input name="csContStock.stockWb" id="stockWb" class="nui-spinner" format="n2"  allowLimitValue="false" changeOnMousewheel="false"  showbutton="false" />
	                	</td>
	                	<td align="right" style="width:100px;">存货余额-直接费用：</td>
	                	<td style="width:150px;">    
	                    	<input name="csContStock.stockBx" id="stockBx" class="nui-spinner" format="n2"  allowLimitValue="false" changeOnMousewheel="false"  showbutton="false" />
	                	</td>
	                	<td align="right" style="width:100px;">存货余额：</td>
	                	<td style="width:150px;">    
	                    	<input name="csContStock.stock" id="stock" class="nui-spinner" format="n2"  allowLimitValue="false" changeOnMousewheel="false"  showbutton="false" />
	                	</td>
					</tr>
					<tr>
	                	<td align="right" style="width:100px;">存货减值：</td>
	                	<td style="width:150px;">    
	                    	<input name="csContStock.stockJz" id="stockJz" class="nui-spinner" format="n2"  allowLimitValue="false" changeOnMousewheel="false"  showbutton="false" />
	                	</td>
	                	<td align="right" style="width:100px;">存货净值：</td>
	                	<td style="width:150px;">    
	                    	<input name="csContStock.stockNet" id="stockNet" class="nui-spinner" format="n2"  allowLimitValue="false" changeOnMousewheel="false"  showbutton="false" />
	                	</td>
	                	<td align="right" style="width:100px;">累计减值：</td>
	                	<td style="width:150px;">    
	                    	<input name="csContStock.stockJzAll" id="stockJzAll"  class="nui-spinner" format="n2"  allowLimitValue="false" changeOnMousewheel="false"  showbutton="false" />
	                	</td>
	                	<td align="right" style="width:100px;">状态：</td>
	                	<td style="width:150px;">    
	                    	<input name="csContStock.status" id="status" class="nui-dictcombobox" dictTypeId="AME_CONTSTOCKSTATUS"/>
	                	</td>
					</tr>
					<tr>
	                	<td align="right" style="width:100px;">是否已结转：</td>
	                	<td style="width:150px;">    
	                    	<input name="csContStock.isTranCost" id="isTranCost" class="nui-dictcombobox" dictTypeId="MIS_YN"/>
	                	</td>
	                	<td align="right" style="width:100px;">结转年月：</td>
	                	<td style="width:150px;">    
	                    	<input name="csContStock.tranYearMonth" id="tranYearMonth" class="nui-monthpicker" format="yyyy-MM"/>
	                	</td>
	                	<td align="right" style="width:100px;">存货减值说明：</td>
	                	<td style="width:150px;" colspan="3">    
	                    	<input name="csContStock.stockJzMemo" class="nui-textbox"style = "width: 95%;" maxLength="200"/>
	                	</td>
					</tr>
					
					<tr>
	                	<td align="right" style="width:100px;">说明：</td>
	                	<td style="width:150px;"colspan="7">    
	                    	<input name="csContStock.memo" class="nui-textarea"  style = "width: 98%;height:60px" maxLength="500"/>
	                	</td>
					</tr>
				</table>
			</div>
			<div style="text-align:center;padding:10px;">               
	            <a class="nui-button" onclick="onOk"  id="okbutton" style="width:60px;margin-right:20px;">保存</a>       
	            <a class="nui-button" onclick="onCancel('cancel')" style="width:60px;">取消</a>       
	        </div>
		</fieldset>
	</div>
</body>
<script type="text/javascript">
    nui.parse();
    var form = new nui.Form("#form1");
	var save="add";
	
    function SetData(data){
    	if(data.action=="new"){
    		nui.get("status").setValue("1");
		}else{
			save="edit";
			var json = nui.encode({csContStock:data.csContStock});
        	nui.ajax({
	            url: "com.primeton.eos.ame_income.csContStock.getCsContStock.biz.ext",
				type: 'POST',
				data: json,	
				contentType: 'text/json',
	            success: function (o) {
	            	o = nui.decode(o);
	                form.setData(o);
	                nui.get("contnum").setText(o.csContStock.projectname);
	                nui.get("isTranCost").setValue(o.csContStock.istrancost);
	                var finyear = o.csContStock.finyear;
	                var finmonth = o.csContStock.finmonth<10?"0"+o.csContStock.finmonth:o.csContStock.finmonth;
	                var finyearmonth=finyear+"-"+finmonth;
	                nui.get("finyearmonth").setValue(finyearmonth);
	                if(o.csContStock.tranyearmonth){
	                	var tranYearMonth = o.csContStock.tranyearmonth;
			    		var tranYear = tranYearMonth.substring(0,4);
			    		var tranMonth = tranYearMonth.substring(4,6);
			    		tranYearMonth=tranYear+"-"+tranMonth;
	                	nui.get("tranYearMonth").setValue(tranYearMonth);
	                }
	                nui.get("contnum").disable();
	                nui.get("finyearmonth").disable();
				}
	     	});
		}
    }
    
    function onOk(){
    	if(form.validate()){
    		if(!confirm("是否保存？")){
				return;
			}else{
				nui.get("okbutton").disable();
	    		var data = form.getData();
				var csContStock = data.csContStock;
	    		var finyearmonth1 = nui.get("finyearmonth").getValue();
	    		var finyearmonth = formatDateTime(finyearmonth1);
	    		var finyear = finyearmonth.substring(0,4);
	    		var finmonth = finyearmonth.substring(4,6);
	    		if(finmonth.substring(0,1)=="0"){
					finmonth=finmonth.substring(1,2);
				}
	    		csContStock.finyearmonth = finyearmonth;
	    		csContStock.finyear = finyear;
	    		csContStock.finmonth = finmonth;
	    		var tranYearMonth1 = nui.get("tranYearMonth").getValue();
	    		if(tranYearMonth1){
	    			csContStock.tranYearMonth = formatDateTime(tranYearMonth1);
	    		}
				var json = nui.encode({"csContStock":csContStock,"save":save});
				nui.ajax({
					url: "com.primeton.eos.ame_income.csContStock.saveContStock.biz.ext",
					type: 'POST',
					data: json,	
					contentType: 'text/json',
			        success: function (o) {
				    	if(o.result == '1'||o.result == 1){
				    		nui.alert("保存成功！","系统提示",function(){
				    			CloseWindow("ok");
				    		});
				    	}else{
				    		nui.alert("保存失败！","系统提示",function(){
					    		nui.get("okbutton").enable();
				    		});
				    	}
			        }
				});
    		}
    	}
    }
    //选择销售合同弹窗(只能选择本事业部是合同)
    function selectCont(){
    	nui.open({
            url:"<%=request.getContextPath() %>/ame_income/csContStock/selectNewCsContract.jsp",
            title: "选择销售合同",
            width: 800,
            height: 400,
            allowResize: false,
            onload:function (){
            	var iframe = this.getIFrameEl();
                iframe.contentWindow.search();
            },
            ondestroy: function (action) {
                if (action == "ok") {
                    var iframe = this.getIFrameEl();
                    var data = iframe.contentWindow.GetData();
                    data = nui.clone(data);    //必须
                    if (data) {
                    	nui.get("contnum").setValue(data.contnum);
                        nui.get("contnum").setText(data.projectname);
                    }
                }
            }
        });
    }
	function onCancel(e) {
    	CloseWindow("cancel");
    }
    function CloseWindow(action) {
        if (action == "cancel" && form.isChanged()) {
            if (confirm("数据被修改了，是否先保存？")) {
                return false;
            }
        }
        if (window.CloseOwnerWindow) return window.CloseOwnerWindow(action);
        else window.close();            
    }
    
    //格式化日期
	function formatDateTime(date) {
	    var y = date.getFullYear();
	    var m = date.getMonth() + 1;
	    m = m < 10 ? ('0' + m) : m;
	    var d = date.getDate();
	    d = d < 10 ? ('0' + d) : d;
	    return y + '' + m;
    }
</script>
</html>
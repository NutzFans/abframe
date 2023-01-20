<%@page pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<!-- 
  - Author(s): ChiaYang
  - Date: 2016-11-02 14:21:42
  - Description:
-->
<head>
	<title>采购成本结转明细详细信息</title>
	<meta http-equiv="content-type" content="text/html; charset=UTF-8" />
	<script src="<%= request.getContextPath() %>/common/nui/nui.js" type="text/javascript"></script>
</head>
<body style="width:100%;height:100%;padding:0px;margin:0px;">
	<div class="nui-fit">
	    <form id="form1" method="post" >
	        <fieldset style="border:solid 1px #aaa;padding:3px;">
	            <legend>采购成本结转明细详细信息</legend>
	            <div style="padding:5px;">
			        <input name="purOutCost.outcostid" id="outcostid" class="nui-hidden" />
		            <table style="table-layout:fixed;" id="table_file">
		                <tr>
		                    <td style="width:150px;text-align:right">编号：</td>
		                    <td style="width:250px;" id="purOutCost.outcostid"></td>
		                    <td style="width:150px;text-align:right">成本确认日期：</td>
		                    <td style="width:250px;" id="purOutCost.confirmdate"></td>
		                    <td style="width:150px;text-align:right">成本结转类型：</td>
		                    <td style="width:250px;" id="purOutCost.outcosttype"></td>
		                </tr>
		                <tr>
		                	<td style="text-align:right">成本结转金额(含税)：</td>
		                    <td id="purOutCost.taxmon"></td>
		                    <td style="text-align:right">成本结转金额(不含税)：</td>
		                    <td id="purOutCost.notaxmon"></td>
		                    <td style="text-align:right">供应商简称：</td>
		                    <td id="purOutCost.supplierid"></td>
		                </tr>
		                <tr>
		                	<td style="text-align:right">采购合同编号：</td>
		                    <td id="purOutCost.purcontno"></td>
		                    <td style="text-align:right">采购订单编号：</td>
		                    <td id="purOutCost.purorderno"></td>
		                    <td style="text-align:right">结算单编号：</td>
		                    <td id="purOutCost.settlementid"></td>
		                </tr>
		                <tr>    
		                    <td style="text-align:right">计提单编号：</td>
		                    <td id="purOutCost.accruedid"></td>
		                    <td style="text-align:right">结算单金额：</td>
		                    <td id="purOutCost.settlemon"></td>
		                    <td style="text-align:right">计提金额：</td>
		                    <td id="purOutCost.accruedmon"></td>
		                </tr>
		                <tr>
		                    <td style="text-align:right">成本开始日期：</td>
		                    <td id="purOutCost.startdate"></td>
		                    <td style="text-align:right">成本结束日期：</td>
		                    <td id="purOutCost.enddate"></td>
		                    <td style="text-align:right">状态：</td>
		                    <td id="purOutCost.outcoststatus"></td>
		                </tr>
		                <tr>
		                	<td style="text-align:right">录入时间：</td>
		                    <td id="purOutCost.insertdate"></td>
		                    <td style="text-align:right">归档操作人：</td>
		                    <td id="purOutCost.fileoper"></td>
		                    <td style="text-align:right">归档时间：</td>
		                    <td id="purOutCost.filedate"></td>
		                </tr>
		                <tr>
		                	<td style="text-align:right">工作量单位：</td>
		                    <td id="purOutCost.workunit"></td>
		                    <td style="text-align:right">工作量数量：</td>
		                    <td id="purOutCost.workamount"></td>
		                    <td style="text-align:right">受益部门：</td>
		                	<td id="beneforgid"></td>
		                </tr>
		                <tr>    
		                    <td style="text-align:right">审计确认人：</td>
		                    <td id="purOutCost.auditor"></td>
		                    <td style="text-align:right">审计确认时间：</td>
		                    <td id="purOutCost.auditdate"></td>
		                	<td style="text-align:right">成本说明：</td>
		                	<td id="costmemo"></td>
		                </tr>
		                <tr>
		                	<td style="text-align:right">存货结转日期：</td>
		                	<td id="stockdate"></td>
		                    <td style="text-align:right"></td>
		                    <td ></td>
		                    <td style="text-align:right"></td>
		                    <td ></td>
		                </tr>
		                <tr>
		                	<td style="text-align:right">备注：</td>
		                	<td id="purOutCost.memo" colspan="5"></td>
		                </tr>
		            </table>
	        	</div>
			</fieldset>
		</form>
    </div>
    <div style="text-align:center;padding:10px;border-width:1px 0px 0px 0px;" class="nui-toolbar">
    	<a class="nui-button" onclick="onCancel" style="width:60px;">关闭</a>
	</div>
	
	<script type="text/javascript">
		nui.parse();
		var outcostid = '<%=request.getParameter("outcostid") %>';
		var form = new nui.Form("form1");
			
		SetData();
		
		function SetData() {
			
			var json = nui.encode({purOutCost:{outcostid:outcostid}});
			
			nui.ajax({
				url: "com.primeton.mis.newcont.cgcbjzmx.purOutCostQueryDetail.biz.ext",
				data: json,
				type: 'POST',
				cache: false,
                showModal: false,
				contentType: 'text/json',
				success: function (o) {
					nui.parse();
                	o = nui.clone(o);
					form.setData(o.purOutCost);
					
					document.getElementById("purOutCost.outcostid").innerHTML = o.purOutCost.outcostid;
					document.getElementById("purOutCost.memo").innerHTML = o.purOutCost.memo;
					document.getElementById("purOutCost.confirmdate").innerHTML = o.purOutCost.confirmdate == null ? "" : o.purOutCost.confirmdate;
					document.getElementById("purOutCost.outcosttype").innerHTML = o.purOutCost.outcosttype == null ? "" : nui.getDictText('AME_OUTCOSTTYPE',o.purOutCost.outcosttype);
					document.getElementById("purOutCost.taxmon").innerHTML = o.purOutCost.taxmon == null ? "" : o.purOutCost.taxmon;
					
					document.getElementById("purOutCost.notaxmon").innerHTML = o.purOutCost.notaxmon == null ? "" : o.purOutCost.notaxmon;
					document.getElementById("purOutCost.supplierid").innerHTML = o.purOutCost.suppliersname == null ? "" : o.purOutCost.suppliersname;
					document.getElementById("purOutCost.purcontno").innerHTML = o.purOutCost.purcontno == null ? "" : o.purOutCost.purcontno ;				
					document.getElementById("purOutCost.purorderno").innerHTML = o.purOutCost.purorderno == null ? "" : o.purOutCost.purorderno;

					document.getElementById("purOutCost.settlementid").innerHTML = o.purOutCost.settlementid == null ? "" : o.purOutCost.settlementid;
					document.getElementById("purOutCost.accruedid").innerHTML = o.purOutCost.accruedid == null ? "" : o.purOutCost.accruedid;
					document.getElementById("purOutCost.settlemon").innerHTML = o.purOutCost.settlemon == null ? "" : o.purOutCost.settlemon;
					document.getElementById("purOutCost.accruedmon").innerHTML = o.purOutCost.accruedmon == null ? "" : o.purOutCost.accruedmon;
					
					document.getElementById("purOutCost.startdate").innerHTML = o.purOutCost.startdate == null ? "" : o.purOutCost.startdate;
					document.getElementById("purOutCost.enddate").innerHTML = o.purOutCost.enddate == null ? "" : o.purOutCost.enddate;
					document.getElementById("purOutCost.outcoststatus").innerHTML = o.purOutCost.outcoststatus == null ? "" : nui.getDictText('AME_OUTCOSTSTATUS',o.purOutCost.outcoststatus);					
					
					//格式化录入时间
					var insertdate = o.purOutCost.insertdate;
					var datetime = nui.formatDate(insertdate,'yyyy-MM-dd'); 
					document.getElementById("purOutCost.insertdate").innerHTML = datetime == null ? "" : datetime;
					
					document.getElementById("purOutCost.fileoper").innerHTML = o.purOutCost.fileoper == null ? "" : o.purOutCost.fileoper;
					document.getElementById("purOutCost.filedate").innerHTML = o.purOutCost.filedate == null ? "" : o.purOutCost.filedate;
					document.getElementById("purOutCost.auditor").innerHTML = o.purOutCost.auditor == null ? "" : o.purOutCost.auditor;
					document.getElementById("purOutCost.auditdate").innerHTML = o.purOutCost.auditdate == null ? "" : o.purOutCost.auditdate;	
				
					//新增字段 成本说明，受益部门，存货结转说明
					document.getElementById("costmemo").innerHTML = o.purOutCost.costmemo == null ? "" : nui.getDictText('AME_COSTTYPE',o.purOutCost.costmemo);
					document.getElementById("beneforgid").innerHTML = o.purOutCost.beneforgid == null ? "" : o.purOutCost.orgname;
					document.getElementById("stockdate").innerHTML = o.purOutCost.stockdate == null ? "" : o.purOutCost.stockdate;
					
					document.getElementById("purOutCost.workunit").innerHTML = o.purOutCost.workunit == null ? "" : nui.getDictText('SERV_NUM_TYPE',o.purOutCost.workunit);
					document.getElementById("purOutCost.workamount").innerHTML = o.purOutCost.workamount == null ? "" : o.purOutCost.workamount;
				}
			});
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
    	
    	function onCancel(e) {
        	CloseWindow("cancel");
        }
	</script>
</body>
</html>
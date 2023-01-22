<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>	
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<!-- 
  - Author(s): wanglinqiong
  - Date: 2016-05-13 15:11:04
  - Description:
-->
<head>
<title>合同收入撤回记录详细信息</title>
	<meta http-equiv="content-type" content="text/html; charset=UTF-8" />
	<link href="../demo.css" rel="stylesheet" type="text/css" />
    <style type="text/css">
    html, body
    {
        font-size:12px;
        padding:0;
        margin:0;
        border:0;
        height:100%;
        overflow:hidden;
    }
    </style>
</head>
<body>
<div class="nui-fit">
	 	<form id="form1" method="post" >
	 		<input name="csReveForecast.processinstid" id="processinstid" class="nui-hidden" />
	 		<input name="csReveForecast.processinstid1" id="processinstid1" class="nui-hidden" />
	        <fieldset style="border:solid 1px #aaa;padding:3px;">
	            <legend>已撤回合同收入记录详细信息</legend>
	            	<table style="table-layout:fixed;" id="table_file">
				            <tr>
								<td align="right" style="width:150px">合同编号：</td>
								<td id="contnum" style="width:250px"></td>
								<td align="right" style="width:150px">收入确认次数：</td>
								<td id="reveno"   style="width:250px"></td>
								<td align="right" style="width:150px">当前确认状态：</td>
								<td id="status"  style="width:250px"></td>
							</tr>
							<tr>
								<td align="right" style="width:150px">收入类型：</td>
								<td id="revetype" style="width:250px"></td>
								<td align="right" style="width:150px">收入确认时点：</td>
								<td id="revetimedesc"style="width:250px"></td>
								<td align="right" style="width:150px">收入确认证据：</td>
								<td id="reveproof" style="width:250px"></td>
							</tr>
							<tr>
								<td align="right" style="width:150px">最初预计确认年月：</td>
								<td id="yearmonth" style="width:250px"></td>
								<td align="right" style="width:150px">最初预计确认旬度：</td>
								<td id="monthperiod" style="width:250px"></td>
								<td align="right" style="width:150px">预计确认金额：</td>
								<td id="fcsum" style="width:250px"></td>
							</tr>
							<tr>
								<td align="right" style="width:150px">预计金额产品额：</td>
								<td id="productsum"  style="width:250px"></td>
								<td align="right" style="width:150px">预计金额服务额：</td>
								<td id="servicesum"  style="width:250px"></td>
								<td align="right" style="width:150px">预计金额MA额：</td>
								<td id="masum"  style="width:250px"></td>
							</tr>
							<tr>
								<td align="right" style="width:150px">预计确认比例：</td>
								<td id="fcreverate" style="width:250px"></td>
								<td align="right" style="width:150px">最新预计确认年月：</td>
								<td id="newyearmonth" style="width:250px"></td>
								<td align="right" style="width:150px">最新预计确认旬度：</td>
								<td id="newmonthperiod" style="width:250px"></td>
							</tr>
							<tr>
								<td align="right" style="width:150px">预测变更次数：</td>
								<td id="changetimes"  style="width:250px"></td>
								<td align="right" style="width:150px">实际确认日期：</td>
								<td id="confirmday" style="width:250px"></td>
								<td align="right" style="width:150px">实际收入确认证据：</td>
								<td id="actreveproof" style="width:250px"></td>
							</tr>
							<tr>
								<td align="right" style="width:150px">实际确认金额(含税)：</td>
								<td id="actsum" style="width:250px"></td>
								<td align="right" style="width:150px">实际确认产品额(含税)：</td>
								<td id="actproductsum" style="width:250px"></td>
								<td align="right" style="width:150px">实际确认服务额(含税)：</td>
								<td id="actservicesum" style="width:250px"></td>
							</tr>
							<tr>
								<td align="right" style="width:150px">产品税率：</td>
								<td id="productRate" style="width:120px" /></td>
								<td align="right" style="width:150px">服务税率：</td>
								<td id="serviceRate" style="width:120px" /></td>
								<td align="right" style="width:150px">MA税率：</td>
								<td id="maRate" style="width:120px" /></td>
							</tr>
							<tr>
								<td align="right" style="width:150px">实际确认MA额(含税)：</td>
								<td id="actmasum" style="width:250px"></td>
								<td align="right" style="width:150px">实际确认金额(不含税)：</td>
								<td id="actsum2" style="width:250px"></td>
								<td align="right" style="width:150px">实际确认产品额(不含税)：</td>
								<td id="actproductsum2" style="width:250px"></td>
							</tr>
							<tr>
								<td align="right" style="width:150px">实际确认服务额(不含税)：</td>
								<td id="actservicesum2" style="width:250px"></td>
								<td align="right" style="width:150px">实际确认MA额(不含税)：</td>
								<td id="actmasum2" style="width:250px"></td>
								<td align="right" style="width:150px">合同订单编号：</td>
								<td id="contorderno" style="width:250px"></td>
							</tr>
							<tr>
								<td align="right" style="width:150px">是否业务发起：</td>
								<td id="saleseva" style="width:250px" ></td>
								<td align="right" style="width:150px">记录增加时间：</td>
								<td id="createtime" style="width:250px" ></td>
								<td align="right" style="width:150px">新合同收入类型：</td>
								<td id="newtype" style="width:250px" ></td>
							</tr>
							<tr id="setyearmonth" style="display: none;">
								<td align="right" style="width:150px">本次结算开始年月：</td>
								<td id="setstart" style="width:250px" ></td>
								<td align="right" style="width:150px">本次结算结束年月：</td>
								<td id="setend" style="width:250px" ></td>
							</tr>
							<tr>
								<td align="right" style="width:150px">说明：</td>
								<td id="memo" style="width:250px" colspan="5"></td>
							</tr>
	            	</table>
	        </fieldset>
	        
	        <fieldset style="border:solid 1px #aaa;padding:3px;">
	            <legend>撤回信息</legend>
		            <table style="table-layout:fixed;" id="table_file">
		            	<tr>
							<td align="right" style="width:150px">撤回人：</td>
							<td id="drawbackempname" style="width:250px" ></td>
							<td align="right" style="width:150px">撤回日期：</td>
							<td id="drawbacktime" style="width:250px" ></td>
							<td align="right" style="width:150px">撤回类型：</td>
							<td id="drawbacktype" style="width:250px" ></td>
						</tr>
						<tr>
							<td align="right" style="width:150px">撤回原因：</td>
							<td id="drawbackreason" style="width:250px" colspan="5"></td>
						</tr>
		            </table>
            </fieldset>
	        
	        <fieldset style="display:none">
	        	 <jsp:include page="/ame_common/detailFile.jsp" />
	        </fieldset>
	       
	        <fieldset style="border:solid 1px #aaa;padding:3px;display:none;" id="feildchange" > 
            <legend>合同收入变更记录</legend>
            <div id="csChange_grid" class="nui-datagrid" style="width:100%;height:auto;" dataField="csChanges" 
	            showPager="false" url="com.primeton.mis.contract.csChange.queryCsChange.biz.ext" >			            
	            <div property="columns">
	                <div field="grid" width="55" headerAlign="center" align="center" >收入编号</div>
	                <div field="typename" width="80"  headerAlign="center" align="center">变更类型</div>
	                <div field="yearmonth" width="80" headerAlign="center" dateFormat="yyyyMM" align="center">原计划预计确认年月</div>
	                <div field="newyearmonth" width="80" headerAlign="center" dateFormat="yyyyMM" align="center">更新预计确认年月</div>
	                <div field="reason" width="80"  headerAlign="center" align="left">原因</div>
	                <div field="empname" width="80"  headerAlign="center" align="center">最近更新人</div>
	                <div field="lastupdate" width="80" dateFormat="yyyy-MM-dd hh:mm:ss" headerAlign="center" align="center">最近更新时间</div>
	            </div>
	        </div>
        </fieldset>
        </form>
</div>
	<div style="text-align:center;padding:10px;border-width:1px 0px 0px 0px;" id="temp1" class="nui-toolbar">
    	<a class="nui-button" onclick="onCancel" style="width:60px;">关闭</a>
	</div> 
	    <script type="text/javascript">
			nui.parse();
	    	var form = new nui.Form("form1");
	    	//收入收款记录变更
			var csChange_grid = nui.get("csChange_grid");
	    	var reveid= getUrlParam("id");
			setData(reveid);
			function getUrlParam(name) { 
				var reg = new RegExp("(^|&)" + name + "=([^&]*)(&|$)"); 
				var r = window.location.search.substr(1).match(reg); 
				if (r != null) 
				return unescape(r[2]); 
				return null; 
			} 												  
			function doViewProc(e){
				if(e==0){//收入确认流程
					var processInstID = nui.get("processinstid").getValue();
				}else if (e==1){//已确认收入成本作业流程
					var processInstID = nui.get("processinstid1").getValue();
				}
	    		var url = "<%=request.getContextPath() %>/bps/wfclient/task/processinstView.jsp";
	    		var title = "流程图查看";
	    		var width=1000;
			    nui.open({
					url: url,
					title: title,
					width: width,
					height: 550,
					onload: function () {
						var iframe = this.getIFrameEl();
						if(iframe.contentWindow.initData) {
							iframe.contentWindow.initData({"processInstID": processInstID});
						}
					},
					ondestroy: function (action){
					}
				});
			}
	        function setData(reveid){ 
	        	var json = nui.encode({csReveForecast:{reveid:reveid}});
	        	nui.ajax({
		            url: "com.primeton.eos.ame_income.csReveForecast.queryCsReveDrawbackDetail.biz.ext",
					type: 'POST',
					data: json,	
					contentType: 'text/json',
		            success: function (o) {
		            	//附件信息
		           		nui.get("grid_0").load({"groupid":"csReveForecast","relationid":o.csReveForecast.reveid});
						document.getElementById("contnum").innerHTML = o.csReveForecast.contnum == null ?"":o.csReveForecast.contnum;
						document.getElementById("reveno").innerHTML = o.csReveForecast.reveno == null ?"":o.csReveForecast.reveno;
						document.getElementById("revetype").innerHTML = nui.getDictText('AME_REVETYPE',o.csReveForecast.revetype);
						document.getElementById("revetimedesc").innerHTML = o.csReveForecast.revetimedesc == null ?"":o.csReveForecast.revetimedesc;
						document.getElementById("reveproof").innerHTML = nui.getDictText('MIS_INCOMECONV',o.csReveForecast.reveproof);
						document.getElementById("yearmonth").innerHTML = o.csReveForecast.yearmonth == null ?"":o.csReveForecast.yearmonth;
						document.getElementById("monthperiod").innerHTML = nui.getDictText('AME_MONTHPERIOD',o.csReveForecast.monthperiod);
						document.getElementById("fcreverate").innerHTML = o.csReveForecast.fcreverate == null ?"":o.csReveForecast.fcreverate*100+"%";
						document.getElementById("fcsum").innerHTML = o.csReveForecast.fcsum == null ?"":o.csReveForecast.fcsum;
						document.getElementById("productsum").innerHTML = o.csReveForecast.productsum == null ?"":o.csReveForecast.productsum;
						document.getElementById("servicesum").innerHTML = o.csReveForecast.servicesum == null ?"":o.csReveForecast.servicesum;
						document.getElementById("masum").innerHTML = o.csReveForecast.masum == null ?"":o.csReveForecast.masum;
						document.getElementById("newyearmonth").innerHTML = o.csReveForecast.newyearmonth == null ?"":o.csReveForecast.newyearmonth;
						document.getElementById("newmonthperiod").innerHTML = nui.getDictText('AME_MONTHPERIOD',o.csReveForecast.newmonthperiod);
						document.getElementById("changetimes").innerHTML = o.csReveForecast.changetimes == null ?"":o.csReveForecast.changetimes;
						document.getElementById("status").innerHTML = nui.getDictText('AME_REVESTATUS',o.csReveForecast.status);
						document.getElementById("confirmday").innerHTML = o.csReveForecast.confirmday == null ?"":o.csReveForecast.confirmday;
						document.getElementById("actreveproof").innerHTML = nui.getDictText('MIS_INCOMECONV',o.csReveForecast.actreveproof);
						document.getElementById("actsum").innerHTML = o.csReveForecast.actsum == null ?"":o.csReveForecast.actsum;
						document.getElementById("actproductsum").innerHTML = o.csReveForecast.actproductsum == null ?"":o.csReveForecast.actproductsum;
						document.getElementById("actservicesum").innerHTML = o.csReveForecast.actservicesum == null ?"":o.csReveForecast.actservicesum;
						document.getElementById("actmasum").innerHTML = o.csReveForecast.actmasum == null ?"":o.csReveForecast.actmasum;
						document.getElementById("actsum2").innerHTML = o.csReveForecast.actsum2 == null ?"":o.csReveForecast.actsum2;
						document.getElementById("actproductsum2").innerHTML = o.csReveForecast.actproductsum2 == null ?"":o.csReveForecast.actproductsum2;
						document.getElementById("actservicesum2").innerHTML = o.csReveForecast.actservicesum2 == null ?"":o.csReveForecast.actservicesum2;
						document.getElementById("actmasum2").innerHTML = o.csReveForecast.actmasum2 == null ?"":o.csReveForecast.actmasum2;
						document.getElementById("memo").innerHTML = o.csReveForecast.memo == null ?"":o.csReveForecast.memo;
						document.getElementById("saleseva").innerHTML =  nui.getDictText('MIS_YN',o.csReveForecast.saleseva);
						document.getElementById("contorderno").innerHTML = o.csReveForecast.contorderno == null ?"":o.csReveForecast.contorderno;
						document.getElementById("productRate").innerHTML = o.csReveForecast.productrate == null ?"":o.csReveForecast.productrate*100+"%";
						document.getElementById("serviceRate").innerHTML = o.csReveForecast.servicerate == null ?"":o.csReveForecast.servicerate*100+"%";
						document.getElementById("maRate").innerHTML = o.csReveForecast.marate == null ?"":o.csReveForecast.marate*100+"%";
						document.getElementById("createtime").innerHTML = o.csReveForecast.createtime==null?"":o.csReveForecast.createtime.substr(0,19);
						document.getElementById("newtype").innerHTML = nui.getDictText('AME_NEWTYPE',o.csReveForecast.newtype);
						
						//撤回信息 
						document.getElementById("drawbackempname").innerHTML = o.csReveForecast.drawbackempname == null ?"":o.csReveForecast.drawbackempname;
						document.getElementById("drawbacktime").innerHTML = o.csReveForecast.drawbacktime==null?"":o.csReveForecast.drawbacktime.substr(0,19);
						document.getElementById("drawbacktype").innerHTML = nui.getDictText('AME_REVEBACKTYPE',o.csReveForecast.drawbacktype);
						document.getElementById("drawbackreason").innerHTML = o.csReveForecast.drawbackreason == null ?"":o.csReveForecast.drawbackreason;
						
						var revetype = o.csReveForecast.revetype;
						if(revetype.indexOf('5') >= 0){
							document.getElementById("setyearmonth").style.display = "";
							document.getElementById("setstart").innerHTML = o.csReveForecast.setstart == null ?"":o.csReveForecast.setstart;
							document.getElementById("setend").innerHTML = o.csReveForecast.setend == null ?"":o.csReveForecast.setend;
						}else{
							document.getElementById("setyearmonth").style.display = "none";
						}
						
		                if(o.csReveForecast.processinstid == null || o.csReveForecast.processinstid == ""){
		                	document.getElementById("viewProc").style.display = "none";
		                }else{
		                	nui.get("processinstid").setValue(o.csReveForecast.processinstid);
		                }
		                if(o.csReveForecast.processinstid1 == null || o.csReveForecast.processinstid1 == ""||o.csReveForecast.processinstid1==0){
		                	document.getElementById("viewProc1").style.display = "none";
		                }else{
		                	nui.get("processinstid1").setValue(o.csReveForecast.processinstid1);
		                }
		                csChange_grid.load({"contnum": o.csReveForecast.contnum,"grid":o.csReveForecast.reveid},function(e){
						});
		            }
		     });
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
			if (window.CloseOwnerWindow) return window.CloseOwnerWindow();
	        else window.close();  
	    }
	    //点击弹出的订单信息展示相应外包人员
	    function changePurOrder(){
	    	var datagrid_order = nui.get("datagrid_order");
	 		var selectRow = datagrid_order.getSelected();
			document.getElementById("showOutper").style.display="";
			//外包人员
			var grid_outper = nui.get("grid_outper");
			grid_outper.load({purOrder:{purorderid:selectRow.purorderid}});
			grid_outper.sortBy("purOutperson.outperno", "desc");
	    }
	    //外包人员状态
	    function dictOutperStatus(e){
			return nui.getDictText('AME_OUTPERSTATUS',e.value);
		}
		//电脑提供方式
		function onFileRendererway(e){
			return nui.getDictText('AME_PCPROTYPE',e.value);//设置业务字典值
		}
		//人员订单关系表，计算单位
		function dictOutperType(e){
			return nui.getDictText('SERV_NUM_TYPE',e.value);//设置业务字典值
		}
		//学历
	function dictDegree(e) {
		return nui.getDictText('DEGREE',e.value);
	}
	   </script>
</body>
</html>
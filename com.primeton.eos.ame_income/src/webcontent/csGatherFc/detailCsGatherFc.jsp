<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>	
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<!-- 
  - Author(s): zhuyl
  - Date: 2016-10-29 11:47:30
  - Description:
-->
<head>
<title>合同收款明细</title>
<meta http-equiv="content-type" content="text/html; charset=UTF-8" />
<script src="<%= request.getContextPath() %>/common/nui/nui.js" type="text/javascript"></script>
<meta http-equiv="content-type" content="text/html; charset=UTF-8" />
	<link href="../demo.css" rel="stylesheet" type="text/css" />
	<script>
		$(function(){
			nui.context='/default'
		})
	</script>
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
	 		<input name="csGatherFc.processinstid" id="processinstid" class="nui-hidden" />
	        <fieldset style="border:solid 1px #aaa;padding:3px;">
	            <legend>合同收款记录详细信息</legend>
	            	<table style="table-layout:fixed;" id="table_file">
			            <tr>
							<td align="right" style="width:150px">合同编号：</td>
							<td id="contnum" style="width:250px"></td>
							<td align="right" style="width:150px">收款确认次数：</td>
							<td id="gatherno"   style="width:250px"></td>
							<td align="right" style="width:150px">当前收款状态：</td>
							<td id="status"  style="width:250px"></td>
						</tr>
						<tr>
							<td align="right" style="width:150px">收款类型：</td>
							<td id="gathertype" style="width:250px"></td>
							<td align="right" style="width:150px">收款确认时点：</td>
							<td id="gathertimedesc"style="width:250px"></td>
							<td align="right" style="width:150px">最初预计确认年月：</td>
							<td id="yearmonth" style="width:250px"></td>
						</tr>
						<tr>
							<td align="right" style="width:150px">预计确认金额：</td>
							<td id="fcsum" style="width:250px"></td>
							<td align="right" style="width:150px">预计金额产品额：</td>
							<td id="productsum"  style="width:250px"></td>
							<td align="right" style="width:150px">预计金额服务额：</td>
							<td id="servicesum"  style="width:250px"></td>
						</tr>
						<tr>
							<td align="right" style="width:150px">预计确认比例：</td>
							<td id="fcreverate" style="width:250px"></td>
							<td align="right" style="width:150px">最新预计确认年月：</td>
							<td id="newyearmonth" style="width:250px"></td>
							<td align="right" style="width:150px">预测变更次数：</td>
							<td id="changetimes"  style="width:250px"></td>
						</tr>
						<tr>
							<td align="right" style="width:150px">开票日期：</td>
							<td id="billdate" style="width:250px"></td>
							<td align="right" style="width:150px">收款开票状态：</td>
							<td id="billstatus" style="width:250px"></td>
							<td align="right" style="width:150px">实际收款日期：</td>
							<td id="maconfirmday" style="width:250px"></td>
						</tr>
						<tr>
							<td align="right" style="width:150px">实际收款金额(含税)：</td>
							<td id="actsum" style="width:250px"></td>
							<td align="right" style="width:150px">实际收款产品额(含税)：</td>
							<td id="actproductsum" style="width:250px"></td>
							<td align="right" style="width:150px">实际收款服务额(含税)：</td>
							<td id="actservicesum" style="width:250px"></td>
						</tr>
						<tr>
							<td align="right" style="width:150px">实际收款金额(不含税)：</td>
							<td id="actsum2" style="width:250px"></td>
							<td align="right" style="width:150px">实际收款产品额(不含税)：</td>
							<td id="actproductsum2" style="width:250px"></td>
							<td align="right" style="width:150px">实际收款服务额(不含税)：</td>
							<td id="actservicesum2" style="width:250px"></td>
						</tr>
						<tr>
							<td align="right" style="width:150px">产品税率：</td>
							<td id="productRate" style="width:120px" /></td>
							<td align="right" style="width:150px">服务税率：</td>
							<td id="serviceRate" style="width:120px" /></td>
						</tr>
						<tr>
							<td align="right" style="width:150px">最近更新时间：</td>
							<td id="lastupdate" style="width:250px" ></td>
							<td align="right" style="width:150px">最近更新人：</td>
							<td id="lastupdator" style="width:250px" ></td>
						</tr>
						<tr>
							<td align="right" style="width:150px">说明：</td>
							<td id="memo" style="width:250px" colspan="5"></td>
						</tr>
            	</table>
	        </fieldset>
	        
	        <fieldset style="border:solid 1px #aaa;padding:3px;" id="feildchange">
            <legend>合同收款变更记录</legend>
            <div id="csChange_grid" class="nui-datagrid" style="width:100%;height:auto;" dataField="csChanges" 
	            showPager="false" url="com.primeton.mis.contract.csChange.queryCsChange.biz.ext" >			            
	            <div property="columns">
	                <div field="grid" width="55" headerAlign="center" align="center" >收款编号</div>
	                <div field="typename" width="80"  headerAlign="center" align="center">变更类型</div>
	                <div field="yearmonth" width="80" headerAlign="center" dateFormat="yyyyMM" align="center">原计划预计确认年月</div>
	                <div field="newyearmonth" width="80" headerAlign="center" dateFormat="yyyyMM" align="center">更新预计确认年月</div>
	                <div field="reason" width="80"  headerAlign="center" align="left">原因</div>
	                <div field="premise" width="80"  headerAlign="center" align="left">收款前提</div>
	                <div field="empname" width="80"  headerAlign="center" align="center">最近更新人</div>
	                <div field="lastupdate" width="80" dateFormat="yyyy-MM-dd HH:mm:ss"headerAlign="center" align="center">最近更新时间</div>
	            </div>
	        </div>
        </fieldset>
        <fieldset id="field6" style="border:solid 1px #aaa;padding:3px;">
		<legend>附件</legend>
		<jsp:include page="/ame_common/detailFile.jsp"/>
	</fieldset>
        </form>
	</div>
	<div style="text-align:center;padding:10px;border-width:1px 0px 0px 0px;" id="temp1" class="nui-toolbar">
		<a class="nui-button" onclick="doViewProc" id="viewProc" style="width:100px;">查看流程图</a>
    	<a class="nui-button" onclick="onCancel" style="width:60px;">关闭</a>
	</div> 
	<script type="text/javascript">
		nui.parse();
    	var form = new nui.Form("form1");
    	//收入收款记录变更
		var csChange_grid = nui.get("csChange_grid");
    	var gatherid= getUrlParam("id");
		setData(gatherid);
		function getUrlParam(name) { 
			var reg = new RegExp("(^|&)" + name + "=([^&]*)(&|$)"); 
			var r = window.location.search.substr(1).match(reg); 
			if (r != null) 
			return unescape(r[2]); 
			return null; 
		} 	
		
		function setData(gatherid){ 
        	var json = nui.encode({csGatherFc:{gatherid: gatherid}});
        	nui.ajax({
	            url: "com.primeton.eos.ame_income.csGatherFc.getCsGatherFcDetail.biz.ext",
				type: 'POST',
				data: json,	
				contentType: 'text/json',
	            success: function (o) {
	            	//加载附件
					nui.get("grid_0").load({"groupid":"CS_GATHER_FC","relationid": o.csGatherFc.gatherid});
					document.getElementById("contnum").innerHTML = o.csGatherFc.contnum == null ? "" : o.csGatherFc.contnum;
					document.getElementById("gatherno").innerHTML = o.csGatherFc.gatherno == null ? "" : o.csGatherFc.gatherno;
					document.getElementById("gathertype").innerHTML = o.csGatherFc.gathertype == null ? "" : nui.getDictText('AME_GATHERTYPE',o.csGatherFc.gathertype);
					document.getElementById("gathertimedesc").innerHTML = o.csGatherFc.gathertimedesc == null ? "" : o.csGatherFc.gathertimedesc;
					document.getElementById("yearmonth").innerHTML = o.csGatherFc.yearmonth == null ? "" : o.csGatherFc.yearmonth;
					document.getElementById("fcreverate").innerHTML = o.csGatherFc.fcreverate == null ? "" : o.csGatherFc.fcreverate*100+"%";
					document.getElementById("fcsum").innerHTML = o.csGatherFc.fcsum == null ? "" : o.csGatherFc.fcsum;
					document.getElementById("productsum").innerHTML = o.csGatherFc.productsum == null ? "" : o.csGatherFc.productsum;
					document.getElementById("servicesum").innerHTML = o.csGatherFc.servicesum == null ? "" : o.csGatherFc.servicesum;
					document.getElementById("newyearmonth").innerHTML = o.csGatherFc.newyearmonth == null ? "" : o.csGatherFc.newyearmonth;
					document.getElementById("changetimes").innerHTML = o.csGatherFc.changetimes == null ? "" : o.csGatherFc.changetimes;
					document.getElementById("status").innerHTML = o.csGatherFc.status == null ? "" : nui.getDictText('AME_GATHERSTATUS',o.csGatherFc.status);
					document.getElementById("billdate").innerHTML = o.csGatherFc.billdate == null ? "" : o.csGatherFc.billdate;
					document.getElementById("maconfirmday").innerHTML = o.csGatherFc.maconfirmday == null ? "" : o.csGatherFc.maconfirmday;
					document.getElementById("billstatus").innerHTML = o.csGatherFc.billstatus == null ? "" : nui.getDictText('MIS_GATHERBILL',o.csGatherFc.billstatus);
					document.getElementById("actsum").innerHTML = o.csGatherFc.actsum == null ? "" : o.csGatherFc.actsum;
					document.getElementById("actproductsum").innerHTML = o.csGatherFc.actproductsum == null ? "" : o.csGatherFc.actproductsum;
					document.getElementById("actservicesum").innerHTML = o.csGatherFc.actservicesum == null ? "" : o.csGatherFc.actservicesum;
					document.getElementById("actsum2").innerHTML = o.csGatherFc.actsum2 == null ? "" : o.csGatherFc.actsum2;
					document.getElementById("actproductsum2").innerHTML = o.csGatherFc.actproductsum2 == null ? "" : o.csGatherFc.actproductsum2;
					document.getElementById("actservicesum2").innerHTML = o.csGatherFc.actservicesum2 == null ? "" : o.csGatherFc.actservicesum2;
					document.getElementById("memo").innerHTML = o.csGatherFc.memo == null ? "" : o.csGatherFc.memo;
					document.getElementById("productRate").innerHTML = o.csGatherFc.productrate == null ? "" : o.csGatherFc.productrate*100+"%";
					document.getElementById("serviceRate").innerHTML = o.csGatherFc.servicerate == null ? "" : o.csGatherFc.servicerate*100+"%";
					if(o.csGatherFc.lastupdate){
						if(typeof(o.csGatherFc.lastupdate) == "string"){
							var lastupdate = o.csGatherFc.lastupdate.substr(0,19);
							document.getElementById("lastupdate").innerHTML = lastupdate;
						}
					}else{
						document.getElementById("lastupdate").innerHTML = "";
					}
					document.getElementById("lastupdator").innerHTML = o.csGatherFc.lastupdator == null ? "" : o.csGatherFc.lastupdator;
	                if(o.csGatherFc.processinstid == null || o.csGatherFc.processinstid == ""){
	                	document.getElementById("viewProc").style.display = "none";
	                }else{
	                	nui.get("processinstid").setValue(o.csGatherFc.processinstid);
	                }
	                csChange_grid.load({"contnum": o.csGatherFc.contnum,"grid":o.csGatherFc.gatherid},function(e){
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
		
		//关闭
		function onCancel(e) {
			if (window.CloseOwnerWindow) return window.CloseOwnerWindow();
	        else window.close();  
	    }
	    
	    //查看流程图
	    function doViewProc(){
			var processInstID = nui.get("processinstid").getValue();
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
	</script>			
</body>
</html>
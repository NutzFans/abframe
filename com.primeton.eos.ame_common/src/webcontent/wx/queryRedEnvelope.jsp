<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>	
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<!-- 
  - Author(s): 石浩
  - Date: 2017-04-28 10:47:44
  - Description:
-->
<head>
	<title>微信红包记录查询</title>
	<script src="<%= request.getContextPath() %>/common/nui/nui.js" type="text/javascript"></script>
	<script src="<%= request.getContextPath() %>/common/nui/locale/zh_CN.js" type="text/javascript"></script>
</head>
<body>
<div  class="nui-panel" title="微信红包记录查询" width="auto" height="100%">
		<div style="width:100%;height:20;padding:0px;margin:0px;" id="form1">
			<div class="nui-toolbar" style="border-bottom:0;padding:0px;">
				<table style="width:100%;">
					<tr>
						<td align="right">商户名称：</td>
		            	<td align="left">
						    <input name="map/sendname" class="nui-textbox"/>
						</td> 
						<td align="right"><span>活动名称：</span></td>
		            	<td align="left">
						     <input name="map/actname" class="nui-textbox"/>
						</td>
						<td align="right">祝福语：</td>
		            	<td align="left">
						    <input name="map/wishing" class="nui-textbox" />
						</td> 
						<td align="right"><span>发送日期：</span></td>
		            	<td align="left">
						    <input name="map/tdateMin" class="nui-datepicker" format="yyyy-MM-dd" style="width:100px;" id="enddateMin"/>
							&nbsp;至
							<input name="map/tdateMax" class="nui-datepicker" format="yyyy-MM-dd"  style="width:100px;" id="enddateMax"/>
						</td>
					</tr>
				    <tr>
						<td align="right"><span>用户名：</span></td>
		            	<td align="left">
						    <input name="map/username" class="nui-textbox"/>
						</td>
						<td align="right"><span>用户ID：</span></td>
		            	<td align="left">
						    <input name="map/userid" class="nui-textbox"/>
						</td>
						<td align="right">发送结果：</td>
		            	<td align="left">
						    <input name="map/returncode" class="nui-dictcombobox" dictTypeId="WE_RED_RECODE" showNullItem="true"/>
						</td>
		    			<td align="center" colspan="2">
                            <a class="nui-button" id="search" iconCls="icon-search" onclick="search()">查找</a>
                            <a class="nui-button" id="reset" iconCls="icon-reload" onclick="reset">重置</a>
                            <a class="nui-button" id="search" iconCls="icon-download" onclick="exportData()">导出</a>
                            <form name="viewlist1" id="viewlist1" action="com.primeton.eos.ame_common.ameExportCommon.flow" method="post">
								<input type="hidden" name="_eosFlowAction" value="action0" filter="false"/>
								<input type="hidden" name="downloadFile" filter="false"/>
								<input type="hidden" name="fileName" filter="false"/>
							</form>	
                       </td>
	                </tr>
	            </table>           
	        </div>
	    </div>
	    <div class="nui-fit">
		    <div id="datagrid1" class="nui-datagrid" style="width:100%;height:420px;" allowResize="true" dataField="data" showPager="true" sortMode="client" ondrawsummarycell="onDrawSummaryCell"
		    url="com.primeton.eos.ame_common.weChatPlatform.queryRedEnvelopeWithPage.biz.ext" sizeList="[10,20,50,100]"  multiSelect="false" showSummaryRow="true" > 
				<div property="columns">
					<div field="id" width="0" >记录ID</div>		
					<div field="billno" visible="false" >商户订单号</div>
					<div field="nonce" visible="false">随机码</div>
					<div field="sign" visible="false">签名</div>
					<div field="wxappid" visible="false">微信应用ID</div>	
					<div field="openid" visible="false">用户在应用用的openID</div>						
					<div field="agentid" visible="false">应用ID</div>						
					
					<div field="operatorname" width="40" align="center" headerAlign="center" allowSort="true">用户名</div>
					<div field="userid" width="55" align="center" headerAlign="center" allowSort="true">用户ID</div>
					<div field="amount" width="50" align="right" dataType="float" summaryType="sum" headerAlign="center" allowSort="true">红包金额(元)</div>
					<div field="num" visible="false">红包数量</div>
					<div field="sendname" visible="false">商户名称</div>
					<div field="actname" width="90" align="center" headerAlign="center"allowSort="true">活动名称</div>
					<div field="wishing" visible="false">祝福语</div>
					<div field="clientip" visible="false">客户调用IP</div>
					
					<div field="returncode" width="40" align="center" renderer="doCode" headerAlign="center" >发送结果</div>
					<div field="tdate" width="80" align="center" headerAlign="center" dateFormat="yyyy-MM-dd HH:mm:ss"  allowSort="true">发送时间</div>
					<div field="remark" width="180" align="center" headerAlign="center"  allowSort="true">备注</div>
					<div field="errordes"  visible="false">错误描述</div>
					<div field="templateid"  visible="false">模板ID</div>
					<div field="channel" visible="false">渠道</div>
				</div>
			</div>
		</div>
  </div>
</body>
<script type="text/javascript">
    nui.parse();
    var form = new nui.Form("#form1");
    var grid = nui.get("datagrid1");
    grid.load();
    //搜索
    function search(){
    	var data = form.getData(false,true);
    	grid.load(data);
    }
    function exportData(){
	    	nui.confirm("是否确认导出微信红包记录？", "确定？",
            function (action) {
            	if(action=='ok'){
            		var json = form.getData(false,true);
			    	form.loading("微信红包记录导出中...");
					nui.ajax({
		    			url: "com.primeton.eos.ame_common.weChatPlatform.queryRedEnvelope4Export.biz.ext",
				        type: "post",
				        data: json,
				        cache: false,
				        contentType: 'text/json',
				        success: function (o) {
				     		form.unmask();
				     		var filePath = o.downloadFile;
				        	var fileName = "微信红包记录.xls";
							var frm = document.getElementById("viewlist1");
				        	frm.elements["downloadFile"].value = filePath;
				        	frm.elements["fileName"].value = fileName;
						    frm.submit();
				        },
				        error: function () {
				        	alert("error");
				        }
					});
            		
            	}
            });   
	    }
    function onDrawSummaryCell(e) {
        if (e.field == "amount") {
            e.cellHtml = "<div align='right'><b>" + e.cellHtml + "</b></div>";
        }
    }
    
    //重置
    function reset(){
    	form.reset();
    }
    
    function doCode(e){
    	return nui.getDictText('WE_RED_RECODE',e.value);
    }

</script>
</html>
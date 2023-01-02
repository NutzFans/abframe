<%@page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@include file="/common/common.jsp"%>
<%@include file="/nui/common.jsp"%>
<link id="css_skin" rel="stylesheet" type="text/css" href="<%=contextPath%>/coframe/tools/skins/skin1/style.css" />
<html>
<!-- 
  - Author(s): xupc
  - Date: 2018-04-16 
  - Description:
-->
<head>
	<title>内推奖励金额明细</title>
	<meta http-equiv="content-type" content="text/html; charset=UTF-8" />
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
<body style="width:100%;height:100%;padding:0px;margin:0px;">
	<div class = "nui-fit">
		<fieldset style="border:solid 1px #aaa;padding:3px;">
		<legend id = "resumeempname"></legend>
		    <div id="grid_rewardmoneydetail" class="nui-datagrid" style="width:100%;height:auto;" showPager="false" showSummaryRow="true" ondrawsummarycell="drawsummary">
		        <div property="columns">
			      	<div field="eventtype"headerAlign="center" name = "eventtype" width="80px" align="center" renderer="eventType">奖励事件 </div>
			      	<div field="rewardmoney" headerAlign="center" align="right"  width="60" dataType="currency" summaryType="sum">奖励金额</div>
			      	<div field="beneforgname" headerAlign="center" align="center" width="90">受益部门</div>
			      	<div field="rewardstatus" headerAlign="center" align="center" width="70" renderer="rewardStatus">处理状态</div>
			      	<div field="createdate" headerAlign="center" align="center" width="90" renderer = "ondealdate">产生时间</div>
			      	<div field="paydate" headerAlign="center" align="center"  width="80" >发放日期</div>
		        </div>
		  	</div>
	  	</fieldset>
  	</div>
	<div style="text-align:center;padding:10px;border-width:1px 0px 0px 0px;" id="temp1" class="nui-toolbar">
    	<a class="nui-button" onclick="onCancel" style="width:60px;">关闭</a>
	</div> 
    <script type="text/javascript">
		nui.parse();
		//获取数据 
        function setData(data){
            var data = nui.clone(data);
			var resumeid = data.resumeid;
			var empname = data.empname;
			var resumeempname;
			resumeempname = empname+"的内推奖励金额明细";
			document.getElementById("resumeempname").innerHTML = resumeempname;//设置列表名
			var json = nui.encode({resumeid:resumeid});
        	nui.ajax({
	            url: "com.primeton.eos.ame_permanage.ame_becomeregulae.queryRewardmoneyDetail.biz.ext",
				type: 'POST',
				data: json,	
				contentType: 'text/json',
	            success: function (o) {
                    nui.get("grid_rewardmoneydetail").setData(o.rewardmoneydetail);
	            }
	     }); 
	}		
	
	function onCancel(e) {
		if (window.CloseOwnerWindow) return window.CloseOwnerWindow("close");
        else window.close();  
    }
    
    //汇总行样式
    function drawsummary(e){
    	if(e.field=="rewardmoney"||e.field=="rewardmoney"){
	    	e.cellHtml = "<span style='display: block;font-weight: bold;text-align: right;'>" + e.cellHtml + "</span>";
    	}
    }
    function rewardStatus(e){
		return nui.getDictText('AME_REWARDSTATUS',e.value);//内推简历是否确认
	}
	function eventType(e){
		return nui.getDictText('REFFER_EVENTTYPE',e.value);//内推简历是否确认
	}
	//日期格式化---时分秒的格式化
    function ondealdate(e){
		if(typeof(e.value)=="string" && e.value != '' && e.value != null && e.value != 'null'){
			return e.value.substring(0,16);
		}else{
			//alert(nui.formatDate(e.value,"yyyy-MM-dd HH:mm"))
			return nui.formatDate(e.value,"yyyy-MM-dd HH:mm");
		}
	}
	
    </script>
</body>
</html>
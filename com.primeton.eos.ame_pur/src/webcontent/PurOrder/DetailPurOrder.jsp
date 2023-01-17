<%@page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@page import="com.eos.data.datacontext.UserObject"%>
<%@page import="java.util.Map"%>
<%@page import="commonj.sdo.DataObject"%>
<html>
<!-- 
  - Author(s): zhx
  - Date: 2015-07-09 14:52:20
  - Description:
-->
<head>
<title>采购订单详细信息</title>
	<meta http-equiv="content-type" content="text/html; charset=UTF-8" />
	<style type="text/css">
	    html,body{font-size:12px;padding:0;margin:0;border:0;height:100%;overflow:hidden;}
	</style>
</head>
<body>
	<div class="nui-fit">
	 	<form id="form1" method="post" >
	        <input name="purOrder.purContract.purorderid" id="purorderid" class="nui-hidden" />
	        <input name="purOrder.processinstid" id="processinstid" class="nui-hidden" />
	        <fieldset style="border:solid 1px #aaa;padding:3px;">
	            <legend>采购订单详细信息</legend>
	            <div style="padding:15px;">
	            	<table style="table-layout:fixed;" id="table_file">
				            <tr>
								<!-- <td align="right" style="width:150px">采购合同编号：</td>
								<td id="purOrder.purContract.purcontid" style="width:250px" ></td>	 -->
								<td align="right" style="width:150px">采购订单编码：</td>
								<td id="purOrder.purordernum"   style="width:250px"></td>
								<td align="right" style="width:150px">所属供应商：</td>
								<td id="purOrder.purContract.purSupplier.custname" style="width:250px"></td>
								<td align="right" style="width:150px">对应采购合同名称：</td>
								<td id="purOrder.purContract.purcontname" style="width:290px"></td>
							</tr>
							<tr>
								<td align="right" style="width:150px">签订日期：</td>
								<td id="purOrder.signdate" style="width:250px"></td>
								<td align="right" style="width:150px">服务客户：</td>
								<td id="purOrder.userid" style="width:250px"></td>
								<td align="right" style="width:150px">所属项目：</td>
								<td id="purOrder.projectno" style="width:250px"></td>
							</tr>
							<tr>
								<td align="right" style="width:150px">协议签订人：</td>
								<td id="purOrder.signuserid"  style="width:250px"></td>
								<td align="right" style="width:150px">状态：</td>
								<td id="purOrder.purstatus" style="width:250px"></td>
							</tr>
							<tr>
								<td align="right" style="width:150px">结算周期说明：</td>
								<td colspan="5" id="purOrder.calcycle"style="width:650px"></td>
							</tr>
							<tr>
								<td align="right" style="width:150px">协议内容说明：</td>
								<td colspan="5" id="purOrder.contmemo"  style="width:650px"></td>
							</tr>
	            	</table>
	        	</div>
	        </fieldset>
	        <jsp:include page="/ame_common/detailFile.jsp"/>
        </form>
        <div style="width:100%;">
	        <div class="nui-toolbar" style="border-bottom:0;padding:0px;">
	            <table style="width:100%;">
	            	<tr>
	                    <td style="width:20%;">
	                    	采购订单包含人员
	                    </td>
	                </tr>
                 </table>           
	        </div>
	    </div>
		<div id="grid_outper" class="nui-datagrid" style="width:100%;height:auto;" allowResize="true" dataField="purOrderOutpers" 
	    	url="com.primeton.eos.ame_pur.purContractProcess.queryOutperByOrder.biz.ext" 
	    	idField="appid" multiSelect="true" allowAlternating="true" showPager="false">
			<div property="columns">
				<div field="purOutperson.outperno" align="center" headerAlign="center" allowSort="true" visible="false">人员编号</div>
				<div field="purOutperson.outpername" width="50" align="center" headerAlign="center">姓名</div>	
				<div field="purOutperson.outpercartno" width="120" align="center" headerAlign="center">身份证</div>	
				<div field="purOutperson.degree" width="50" align="center" headerAlign="center" renderer="dictDegree">学历</div>	
				<div field="purOutperson.gradudate" width="75" align="center" headerAlign="center">毕业时间</div>	
				<div field="workunit" width="90" align="center" headerAlign="center" allowSort="true" renderer="dictOutperType">计价模式</div>
				<div field="price" width="80" align="center" dataType="currency" headerAlign="center" allowSort="true">人月单价(元)</div>	
				<div field="startdate" width="85" align="center" headerAlign="center" allowSort="true">服务开始日期</div>	
				<div field="expenddate" width="90" align="center" headerAlign="center" allowSort="true">预计服务结束日期</div>
				<div field="actenddate" width="90" align="center" headerAlign="center" allowSort="true">实际服务结束日期</div>	
<!-- 			<div field="pcprotype" width="80" align="center" headerAlign="center" renderer="onFileRendererway">电脑提供方式</div>	 -->
<!-- 			<div field="comment" width="90" align="center" headerAlign="center">说明</div>	 -->
				<div field="custname" width="200" align="center" headerAlign="center">服务客户</div>	
				<div field="projectName" width="180" align="center" headerAlign="center">服务项目</div>	
				<div field="currentstatus" width="50" align="center" headerAlign="center" renderer="dictOutperStatus">状态</div>	
			</div>
		</div>
	</div>
	<div style="text-align:center;padding:10px;border-width:1px 0px 0px 0px;" id="temp1" class="nui-toolbar">
		<a class="nui-button" onclick="doViewProc" id="viewProc" style="width:100px;">查看流程图</a>
    	<a class="nui-button" onclick="onCancel" style="width:60px;">关闭</a>
	</div> 
</body>
<script type="text/javascript">
	nui.parse();
	var form = new nui.Form("form1");
	var purorderid = getUrlParam("id");
	
	setData(purorderid);
	function getUrlParam(name) { 
		var reg = new RegExp("(^|&)" + name + "=([^&]*)(&|$)"); 
		var r = window.location.search.substr(1).match(reg); 
		if (r != null) 
		return unescape(r[2]); 
		return null; 
	}
											  
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
	
	function setData(purorderid){  
    	var json = nui.encode({purOrder:{purorderid: purorderid}});
    	nui.ajax({
            url: "com.primeton.eos.ame_pur.PurOrder.getPurOrderDetail.biz.ext",
			type: 'POST',
			data: json,	
			contentType: 'text/json',
            success: function (o) {
            	nui.get("grid_0").load({"groupid":"purOrder","relationid":o.purOrder.purorderid});
                form.setData(o);
                form.setChanged(false);
                nui.get("purorderid").setValue(o.purOrder.purorderid);
                if(o.purOrder.processinstid == null || o.purOrder.processinstid == ""){
                	document.getElementById("viewProc").style.display = "none";
                }else{
                	nui.get("processinstid").setValue(o.purOrder.processinstid);
                }
                document.getElementById("purOrder.purordernum").innerHTML = o.purOrder.purordernum == null ?"":o.purOrder.purordernum;
                document.getElementById("purOrder.purContract.purSupplier.custname").innerHTML = o.purOrder.purContract.purSupplier.custname == null ?"":o.purOrder.purContract.purSupplier.custname;
                document.getElementById("purOrder.purContract.purcontname").innerHTML = o.purOrder.purContract.purcontname == null ?"":o.purOrder.purContract.purcontname;
                document.getElementById("purOrder.signdate").innerHTML = o.purOrder.signdate == null ?"":o.purOrder.signdate;
                document.getElementById("purOrder.calcycle").innerHTML = o.purOrder.calcycle == null ?"":o.purOrder.calcycle;
                document.getElementById("purOrder.purstatus").innerHTML = nui.getDictText('AME_ORDERSTATUS',o.purOrder.purstatus);
                document.getElementById("purOrder.userid").innerHTML = o.purOrder.custname == null ?"":o.purOrder.custname;
                document.getElementById("purOrder.projectno").innerHTML = o.purOrder.projectName == null ?"":o.purOrder.projectName;
                document.getElementById("purOrder.signuserid").innerHTML = o.purOrder.empname == null ?"":o.purOrder.empname;
                document.getElementById("purOrder.contmemo").innerHTML = o.purOrder.contmemo == null ?"":o.purOrder.contmemo;
                //外包人员
	 		  	var grid_outper = nui.get("grid_outper");
				grid_outper.load({purOrder:{purorderid:o.purOrder.purorderid}});
				grid_outper.sortBy("purOutperson.outperno", "desc");
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
    
    //附件下载
    function getdetail(e){
    	return "<a href='javascript:void(0)' onclick='checkDetail();' title='点击查看'>" + e.value + "</a>";
    }
    
    function checkDetail(){
    	var grid = nui.get("grid_0");
    	var selectRow = grid.getSelected();
    	var url="com.primeton.components.web.fileupload.getfile.flow?fileId="+selectRow.fileId;
		window.open(url, '_self');
    }
    
    function dictDegree(e){
    	return nui.getDictText('DEGREE',e.value);
    }
    
    function onFileRendererway(e){
		return nui.getDictText('AME_PCPROTYPE',e.value);
	}
    function dictOutperStatus(e){
		return nui.getDictText('AME_OUTPERSTATUS',e.value);
	}
	//人员订单关系表，计算单位
	function dictOutperType(e){
		return nui.getDictText('SERV_NUM_TYPE',e.value);//设置业务字典值
	}
</script>
</html>
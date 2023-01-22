<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@page import="com.eos.data.datacontext.UserObject"%>
<%@page import="commonj.sdo.DataObject"%>
<%@page import="java.util.Map"%>
<%
	String contextPath=request.getContextPath();
 %>
<html>
<!-- 
  - Author(s): xuqingqian
  - Date: 2016-10-18 15:01:58
  - Description:
-->
<head>
    <title>用章申请详情</title>
    <meta http-equiv="content-type" content="text/html; charset=UTF-8" />
	<script src="<%= request.getContextPath() %>/common/nui/nui.js"
		type="text/javascript"></script>
	<script src="../common/nui/nui.js" type="text/javascript"></script>
	<style type="text/css">
	    body{
	        margin:0;padding:0;border:0;width:100%;height:100%;overflow:hidden;
	    }
	    html, body
	    {
	        font-size:12px;
	        padding:0;
	        margin:0;
	        border:0;
	        height:100%;
	        overflow:hidden;
	    }
	     .myIndex{
	        background:#FFF68F;
	    }
	    .asLabel
	    {
	        border:0;background-color:#F5F5F5;cursor:default;
	    }
	</style>
</head>
<body>
<div class="nui-fit">
    <div class="mini-panel" title="用章申请详情" style="width: auto">
        <!-- 提示信息展示 -->
		<form id="form1" method="post">
			<input name="seal.sealid" id="sealid" class="nui-hidden"/>
			<fieldset id="field1" style="border:solid 1px #aaa;padding:3px;">
				<legend>基本信息</legend>
	       		<table style="table-layout:fixed;" id="seal1">
					<tr>
						<td align="right" style="width:120px;">申请人：</td>
						<td style="width:150px;" id="applyname" class="asLabel"></td>
						<td align="right" style="width:120px;">用章类型：</td>
						<td style="width:150px;" id="sealname" class="asLabel"></td>
						<td align="right" style="width:120px;" >用章日期：</td>
						<td style="width:150px;" id="sealdate" class="asLabel"></td>
					</tr>
					<tr>
						<td align="right" style="width:120px;">受益部门：</td>
						<td style="width:150px;" id="orgname" class="asLabel"></td>
						<td align="right" style="width:120px;">文件接收单位：</td>
						<td colspan="3" id="custname" class="asLabel"></td>
					</tr>
					<tr>
						<td align="right" style="width:120px;">文件类型：</td>
						<td style="width:150px;" id="filetype" class="asLabel"></td>
						<td align="right" style="width:120px;">文件份数：</td>
						<td style="width:150px;" id="filenum" class="asLabel"></td>
						<td align="right">金额：</td>
		                <td style="width:150px;" id="money" class="asLabel"></td>
					</tr>
					<tr>
						<td align="right" style="width:120px;">用章地点：</td>
						<td style="width:150px;" id="sealaddress" class="asLabel"></td>
						<td align="right" style="width:120px;">用章主体：</td>
						<td style="width:150px;" id="subject" class="asLabel"></td>
					</tr>
					<tr>
						<td align="right" style="width:120px;">用章事由：</td>
						<td colspan="5" id="memo" class="asLabel"></td>
					</tr>
				</table>
			</fieldset>
		</form>
		 <fieldset id="field2" style="border:solid 1px #aaa;padding:3px;">
			<legend>用章申请附件</legend>
			<jsp:include page="/ame_common/detailFile.jsp"/>
		</fieldset>
		<form id="opioionform" method="post">
			<fieldset style="border:solid 1px #aaa;padding:3px;">
		        <legend>处理意见列表</legend>
	        	<div id="datagrid1" class="nui-datagrid" style="width:100%;height:auto;" dataField="misOpinions"
				    url="com.primeton.eos.ame_pur.purContractProcess.queryAuditOpinions.biz.ext"  idField="id" allowResize="true"
				    allowAlternating="true" multiSelect="true" showPager="false" allowCellWrap="true">
				    <div property="columns">
				    	<div type="indexcolumn" headerAlign="center" width="30" >编号</div>
				        <div field="operatorname" width="50" headerAlign="center" align="center">处理人</div>
				        <div field="workitemname" width="80" align="center" headerAlign="center">处理环节</div>
				        <div field="auditstatus" renderer="onCheckRenderer" width="80" align="center" headerAlign="center">处理结果</div>
				        <div field="auditopinion" width="150" headerAlign="center">处理意见</div>
				        <div field="time" width="100" headerAlign="center" align="center" dateFormat="yyyy-MM-dd HH:mm:ss">处理时间</div>
				        <div field="orgname" width="100" align="center" headerAlign="center">处理人所在机构</div>
				        <div field="files" renderer="onFileRenderer" width="100" hight="100"  align="center" headerAlign="center">附件</div>
				    </div>
				</div>
		    </fieldset>
	    </form>
    </div>
</div>
<div style="text-align:center;padding:10px;" class="nui-toolbar">
	<a class="nui-button" onclick="onCancel('cancel')" id="closeWin" style="width:60px;">关闭</a>
</div>
<form name="viewlist1" id="viewlist1" action="com.primeton.eos.ame_common.ameExportCommon.flow" method="post">
   <input type="hidden" name="_eosFlowAction" value="action0" filter="false"/>
   <input type="hidden" name="downloadFile" filter="false"/>
   <input type="hidden" name="fileName" filter="false"/>
</form> 
	<script type="text/javascript">
	
		nui.parse();
		var form = new nui.Form("form1");
		var opioionform = new nui.Form("opioionform");
	   var processInstID = <%=request.getParameter("processInstID")%>;
	    
	    //初始化
		init();
		function init(){
        	form.mask("数据加载中...");
        	//流程提示信息
			var json = {seal: {processinstid: processInstID}};
			nui.ajax({
				url: "com.primeton.eos.ame_common.seal.getSeal.biz.ext",
				type: "post",
				data: json,
				contentType: "text/json",
				success: function (o){
					var form = new nui.Form("form1");
					$(".mini-toolbar").hide();
					var seal = o.seal;//流程业务数据
					//加载附件设置参数
            		nui.get("grid_0").load({"groupid":"seal","relationid": seal.sealid});
            		form.setData(o);
            		setTable("seal1",seal);
            		
            		//特殊字段处理
            		document.getElementById("filetype").innerHTML = seal.filetype == null ?"":nui.getDictText('MIS_FILETYPE',seal.filetype);
            		document.getElementById("subject").innerHTML = seal.subject == null ?"":nui.getDictText('company',seal.subject);
            		document.getElementById("sealaddress").innerHTML = seal.sealaddress == null ?"":nui.getDictText('AREA4SEAL',seal.sealaddress);
            		document.getElementById("money").innerHTML=seal.money==null ? "":formatNumber(seal.money);
	            	document.getElementById("memo").innerText=seal.memo==null ? "":seal.memo;
	            	//查询审核意见
					var grid = nui.get("datagrid1");
					if(o.seal.processinstid!=null||o.seal.processinstid!=""){
						grid.sortBy("time", "desc");
						grid.load({processInstID: o.seal.processinstid},function(){
							form.unmask();
						});
					}
				},
				error: function(){}
			});
        }
       
		//关闭
        function onCancel(e) {
            var data = form.getData();
        	if(data){
	        	nui.showMessageBox({
		            title: "关闭提示",
		            iconCls: "nui-messagebox-question",
		            buttons: ["yes", "no"],
		            message: "是否关闭？",
		            callback: function (action) {
		                if(action=="yes"){
		                	CloseWindow("cancel");
		                }
		            }
		        });
			}else{
				CloseWindow("cancel");
			}
        }
        
        //向table中设值
		function setTable(tableid,data){//table的id及输出的数据对象，td需要赋值id，id必须与输出的数据对象的属性保持一致
	    	var tb = document.getElementById(tableid); 
			var rows = tb.rows;
			for(var i=0;i<rows.length;i++){
				 var sst = rows[i].getElementsByTagName("td")
				 for(var k = 0; k < sst.length; k++){// 遍历该行的 td
				 	var ids = sst[k].id;
				 	if(ids!=null&&ids!=""){
					 	if(data[ids] != null && data[ids] != ""){
						 	document.getElementById(ids).innerHTML=data[ids]== null ?"":data[ids];
					 	}
				 	}
				 }
			}
		 }
		 
		 //标准方法接口定义
	    function CloseWindow(action) {           
	        if (window.CloseOwnerWindow) return window.CloseOwnerWindow(action);
	        else window.close();
	    }
		 
		 //格式化千分位
		function formatNumber(num,cent) {
			if(cent==null||cent==""){
				cent = 2;
			}
			num = num.toString().replace(/\$|\,/g,'');  
	        // 检查传入数值为数值类型  
	         if(isNaN(num))  
	          num = "0";  
	        // 获取符号(正/负数)  
	        sign = (num == (num = Math.abs(num)));  
	        num = Math.floor(num*Math.pow(10,cent)+0.50000000001); // 把指定的小数位先转换成整数.多余的小数位四舍五入  
	        cents = num%Math.pow(10,cent);       // 求出小数位数值  
	        num = Math.floor(num/Math.pow(10,cent)).toString();  // 求出整数位数值  
	        cents = cents.toString();        // 把小数位转换成字符串,以便求小数位长度  
	       
	        // 补足小数位到指定的位数  
	        while(cents.length<cent)  
	         cents = "0" + cents;  
	         // 对整数部分进行千分位格式化.  
	         for (var i = 0; i < Math.floor((num.length-(1+i))/3); i++)  
	          num = num.substring(0,num.length-(4*i+3))+','+ num.substring(num.length-(4*i+3));  
	        return (((sign)?'':'-') + num + '.' + cents); 
		}
        
        <!------------------------------------------------------- 审批意见 ----------------------------------------------------------->
        
        function onCheckRenderer(e) {
			return nui.getDictText('MIS_AUDITSTATUS',e.value);//设置业务字典值
		}
		
		//意见附件信息
		function onFileRenderer(e) {
		    var tempSrc = "";
			//长度为1，不换行
			if(e.record.files.length == 1){
		    	tempSrc += "<a href='com.primeton.components.web.fileupload.getfile.flow?fileId=" + e.record.files[0].fileId + "'>" + e.record.files[0].fileName + "</a>";
			}else{
		        for(var i=0;i<e.record.files.length;i++){
		        	//长度大于1小于长度length换行
		        	if(i< e.record.files.length-1){
		        		tempSrc += "<a href='com.primeton.components.web.fileupload.getfile.flow?fileId=" + e.record.files[i].fileId + "'>" + e.record.files[i].fileName + "</a><br/>&nbsp;&nbsp;";
		        	}
		        	//最后一个不换行
		    		if(i == e.record.files.length-1){
		        		tempSrc += "<a href='com.primeton.components.web.fileupload.getfile.flow?fileId=" + e.record.files[i].fileId + "'>" + e.record.files[i].fileName + "</a>";
		        	}
		        }
			}
		   	return tempSrc;
		}
	</script>
</body>
</html>
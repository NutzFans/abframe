<%@page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@include file="/common/common.jsp"%>
<%@include file="/nui/common.jsp"%>
<link id="css_skin" rel="stylesheet" type="text/css" href="<%=contextPath%>/coframe/tools/skins/skin1/style.css" />
<html>

<head>
	<title>故障详细信息</title>
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
<body style="width:100%;height:100%;padding:0px;margin:0px;">
	<div class="nui-fit">
    <form id="form1" method="post" >
        <input name="fault.probid" id="faultId" class="nui-hidden" />
        <input class="nui-hidden" id="probid" value="1">
        <fieldset style="border:solid 1px #aaa;padding:3px;">
            <legend>故障基本信息</legend>
            <div style="padding:5px;">
            <table style="table-layout:fixed;" id="table_file">
            	<span>
                <tr>
                    <td style="width:150px;" align="right">故障类型：</td>
                    <td style="width:250px;" id="probinfo.probtype"></td>
                	<td id="temp1" width="150px" align="right">对应服务器：</td>
                    <td id="temp2" width="250px"></td>                    
                	<td id="temp3" width="150px" align="right">对应应用：</td>
                    <td id="temp4" width="250px"></td>
                	<td id="temp5" width="150px" align="right">对应数据库：</td>
                    <td id="temp6" width="250px"></td>                
	            </tr>
            	</span>
            	<span>
	            <tr>
	                <td style="width:150px;" align="right">故障发现人：</td>
                    <td style="width:250px;" id="probinfo.probfinder"></td>
                    <td style="width:150px;" align="right">故障发现日期：</td>
                    <td style="width:250px;" id="probinfo.probfinddate"></td>
                    <td style="width:150px;" align="right">故障简述：</td>
                    <td style="width:250px;" id="probinfo.probdesc" colspan="4"></td>                    
                </tr>
                </span>
                <span>
                <tr>
                    <td style="width:150px;" align="right">故障详述：</td>
                    <td style="width:250px;" colspan="5" id="probinfo.probdescdetail"></td>
                </tr>	
                </span>
                <span>
                <tr>
                    <td style="width:150px;" align="right">故障处理结果：</td>
                    <td sytle="width:250px;" align="left" colspan="5" id="probinfo.probdealresult"></td>   
                </tr>
                </span>
                <span>
                <tr>
                	<td style="width:150px;" align="right">备注：</td>
                    <td style="width:250px;" colspan="5" id="probinfo.remark"></td>
				</tr>
                </span>
                <span>
				<tr>
	            	<td style="width:150px;" align="right">附件列表：</td>
	            	<td style="width:690px;" id="probinfo.uploadedFile" colspan="5"></td>
	            </tr>
                </span>
            </table>
        </div>
        </fieldset>
             	       
     	<fieldset style="border:solid 1px #aaa;padding:3px;">
	         <legend>故障处理历史记录</legend>
	           <div id="datagrid1" class="nui-datagrid" style="width:100%;height:150px;" showPager="false" 
	           sortMode="client" dataField="probinfo.misProbinfoDeals">
	            <div property="columns">
	              <div field="probdealdate" width="40px">故障处理日期</div>
	              <div field="probdealername" width="50px">故障处理人</div>
	              <div field="probdealinfo" width="50px">故障处理描述</div>
	              <div field="remark" width="100px">备注</div>
	            </div>
	          </div>
	    </fieldset>        
	</form>
	</div>
	<div style="text-align:center;padding:10px;border-width:1px 0px 0px 0px;" id="print" class="nui-toolbar">
		<a class="nui-button" iconCls="icon-print" onclick="javascript:doPrint();" style="width:100px;margin-right:20px;">打印页面</a>
    	<a class="nui-button" onclick="onCancel" style="width:60px;">关闭</a>
	</div> 
    <script type="text/javascript">
    	var form = new nui.Form("form1");
    	var probid = getUrlParam("probid");
    	
		nui.parse();
		setData(probid);
		
		function getUrlParam(name) { 
			var reg = new RegExp("(^|&)" + name + "=([^&]*)(&|$)"); 
			var r = window.location.search.substr(1).match(reg); 
			if (r != null) 
			return unescape(r[2]); 
			return null; 
		} 
		
		function init(){
		}
		
        function toggleFieldSet(ck, id) {
            var dom = document.getElementById(probid);
            dom.className = !ck.checked ? "hideFieldset" : "";
        }
        
        function setData(probid){
			var json = nui.encode({probinfo:{probid: probid}});
        	nui.ajax({
	            url: "com.primeton.eos.ame_common.fault.getFault.biz.ext",
				type: 'POST',
				data: json,	
				contentType: 'text/json',
	            success: function (o) {
	                form.setData(o);
	                form.setChanged(false);
	                var probtype = o.probinfo.probtype;
	            	                
	                if(probtype == 1){
				    		document.getElementById("temp1").style.display = "";
				    		document.getElementById("temp2").style.display = "";
				    		document.getElementById("temp3").style.display = "none";
				    		document.getElementById("temp4").style.display = "none";
				    		document.getElementById("temp5").style.display = "none";
				    		document.getElementById("temp6").style.display = "none";
	                		document.getElementById("temp2").innerHTML = o.probinfo.servname == null ?"":o.probinfo.servname;			    		
				    	} else if(probtype == 2){
				    		document.getElementById("temp1").style.display = "none";
				    		document.getElementById("temp2").style.display = "none";
				    		document.getElementById("temp3").style.display = "";
				    		document.getElementById("temp4").style.display = "";
				    		document.getElementById("temp5").style.display = "none";
				    		document.getElementById("temp6").style.display = "none";
				    		document.getElementById("temp4").innerHTML = o.probinfo.appchname == null ?"":o.probinfo.appchname;	
				    	} else if(probtype == 3){
				    		document.getElementById("temp1").style.display = "none";
				    		document.getElementById("temp2").style.display = "none";
				    		document.getElementById("temp3").style.display = "none";
				    		document.getElementById("temp4").style.display = "none";
				    		document.getElementById("temp5").style.display = "";
				    		document.getElementById("temp6").style.display = "";
	                		document.getElementById("temp6").innerHTML = o.probinfo.dbname == null ?"":o.probinfo.dbname;	    		
				    	} 
	                
	                document.getElementById("probinfo.probtype").innerHTML = nui.getDictText("MIS_FA_TYPE",o.probinfo.probtype);	                
	                document.getElementById("probinfo.probfinder").innerHTML = o.probinfo.probfindername;
	                document.getElementById("probinfo.probfinddate").innerHTML = o.probinfo.probfinddate;
	                document.getElementById("probinfo.probdesc").innerHTML = o.probinfo.probdesc;	                
	                document.getElementById("probinfo.probdescdetail").innerHTML = o.probinfo.probdescdetail == null ?"":o.probinfo.probdescdetail;
	                document.getElementById("probinfo.probdealresult").innerHTML = o.probinfo.probdealresult == null ?"":o.probinfo.probdealresult;	                	                
	                document.getElementById("probinfo.remark").innerHTML = o.probinfo.remark == null ?"":o.probinfo.remark; 
	                
	                var tempSrc = "";
	                for(var i=0;i<o.probinfo.files.length;i++){
	                	tempSrc += "<a href='com.primeton.components.web.fileupload.getfile.flow?fileId=" + o.probinfo.files[i].fileId + "'>" + o.probinfo.files[i].fileName + "</a>,&nbsp;&nbsp;&nbsp;&nbsp;";
	                }
	               	document.getElementById("probinfo.uploadedFile").innerHTML = tempSrc;
	               	
	                nui.get("datagrid1").setData(o.probinfo.misProbinfoDeals);
	                nui.get("datagrid1").sortBy("probdealdate","desc");

		            }
	     });
	}
	
	function doPrint(){
    	document.getElementById("print").style.display = "none";
    	window.print();
    }
	
	function onCancel(e) {
		if (window.CloseOwnerWindow) return window.CloseOwnerWindow(action);
        else window.close();  
    }
    </script>
</body>
</html>
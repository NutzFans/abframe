<%@page pageEncoding="UTF-8"%>
<%@include file="/common/common.jsp"%>
<%@include file="/common/skins/skin0/component.jsp" %>
<h:css href="/css/style1/style-custom.css"/>
<%
	String contextPath=request.getContextPath();
 %>
<html>
<%-- 
  - Author(s): wenyy
  - Date: 2016-06-27 13:21:17
  - Description:
--%>
<head>
<title>查看填写的表单</title>
<meta http-equiv="content-type" content="text/html; charset=UTF-8" />
	<script src="<%= request.getContextPath() %>/common/nui/nui.js" type="text/javascript"></script>
	<script src="../common/nui/nui.js" type="text/javascript"></script>
	<script type="text/javascript" src="<%=contextPath %>/common/components/swffileupload/swfupload/swffileupload.js"></script>
	<style type="text/css">
	    body{
	        margin:0;padding:0;border:0;width:100%;height:100%;overflow:hidden;
	    }
    </style>
</head>
<body>
<div class="nui-fit">
	<form id="form1" method="post">
			<input type="hidden" class="mini-hidden" id="feedbackid" name="ameFeedback.feedbackid">
			<fieldset id="field1" style="border:solid 1px #aaa;padding:3px;">
				<legend>反馈基本信息</legend>
				<div style="padding:5px;">
					<table style="table-layout:fixed;" id="table_file">
						<tbody>
						<tr>
							<td align="right" style="width:120px;">反馈人：</td>
							<td id="ameFeedback.feedbackperson" style="width:120px;"></td>
							<td align="right" style="width:120px;" >反馈时间：</td>
							<td id="ameFeedback.feedbackdate" style="width:120px;"></td>
							<td align="right" style="width:120px;">反馈类型：</td>
							<td id="ameFeedback.feedbacktype" style="width:120px;"></td>
 						    <td align="right" style="width:120px;">反馈功能：</td>
							<td id="ameFeedback.functionname" style="width:120px;"></td>
						</tr>
						<tr>
							<td align="right" style="width:120px;">回复人：</td> 
							<td id="ameFeedback.replyperson" style="width:120px;"></td>
							<td align="right" style="width:120px;">回复时间：</td>
							<td id="ameFeedback.replydate" style="width:120px;"></td>
							<td align="right" style="width:120px;" >是否回复：</td>
							<td id="ameFeedback.state" style="width:120px;"></td>
					    </tr>
						<tr>
							<td align="right" style="width:120px;" >反馈内容：</td>
							<td id="ameFeedback.contentexplain" colspan="8"></td>
						</tr>
						<tr>
							<td align="right" style="width:120px;">回复信息：</td>
							<td id="ameFeedback.replyadvice" colspan="8"></td>
						</tr>
					</tbody>
				</table>
				</div>
			</fieldset>
	</form>
	<jsp:include page="/ame_common/detailFile.jsp"/>
</div>
<div style="text-align:center;padding:10px;border-width:1px 0px 0px 0px;" id="temp1" class="nui-toolbar">
	<a class="nui-button" onclick="onCancel" style="width:60px;">关闭</a>
</div> 
<script type="text/javascript">
	 	 nui.parse();
 		 var form1 = new nui.Form("form1");
 		 var feedbackid = getUrlParam("id");
 		 function getUrlParam(name) { 
			var reg = new RegExp("(^|&)" + name + "=([^&]*)(&|$)"); 
			var r = window.location.search.substr(1).match(reg); 
			if (r != null) 
			return unescape(r[2]); 
			return null; 
		 }
 		 SetData(feedbackid);
	     function SetData(data){
	        var json = nui.encode({ameFeedback:{feedbackid: data}});
        	nui.ajax({
        		url: "com.primeton.eos.ame_common.ameFeedback.replyFeedback.biz.ext",
                data: json,
                type: 'POST',
                cache: false,
                contentType: 'text/json',
                success: function (o) {
                	//加载附件设置参数
            	    nui.get("grid_0").load({"groupid":"ameFeedback","relationid":o.ameFeedback.feedbackid});
                	nui.parse();
                    obj = nui.decode(o);
                    form1.setData(obj);
                    form1.isChanged(false);		
                    document.getElementById("ameFeedback.feedbackperson").innerHTML = o.ameFeedback.feedbackperson == null ? "" : o.ameFeedback.feedbackperson;
                    document.getElementById("ameFeedback.feedbackdate").innerHTML = (o.ameFeedback.feedbackdate == null ? "" : o.ameFeedback.feedbackdate).substr(0,19);
                    document.getElementById("ameFeedback.functionname").innerHTML = o.ameFeedback.functionname == null ? "" : o.ameFeedback.functionname;
                    document.getElementById("ameFeedback.feedbacktype").innerHTML = o.ameFeedback.feedbacktype == null ? "" : nui.getDictText('AME_FEEDTYPE',o.ameFeedback.feedbacktype);
                    document.getElementById("ameFeedback.state").innerHTML = o.ameFeedback.state == null ? "" :  nui.getDictText('MIS_YN',o.ameFeedback.state);
                    document.getElementById("ameFeedback.replyperson").innerHTML = o.ameFeedback.replyperson == null ? "" : o.ameFeedback.replyperson;
                    document.getElementById("ameFeedback.replydate").innerHTML = (o.ameFeedback.replydate == null ? "" : o.ameFeedback.replydate).substr(0,19);
               	    document.getElementById("ameFeedback.contentexplain").innerHTML = o.ameFeedback.contentexplain == null ? "" : o.ameFeedback.contentexplain;
               	    document.getElementById("ameFeedback.replyadvice").innerHTML = o.ameFeedback.replyadvice == null ? "" : o.ameFeedback.replyadvice;
               	
                },
                error: function (jqXHR, textStatus, errorThrown) {
                    alert(jqXHR.responseText);
                    CloseWindow();
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
	            CloseWindow("cancel");
	        }
 </script>
 </body>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>	
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<!-- 
  - Author(s): shihao
  - Date: 2016-11-24 09:26:17
  - Description:发送微信信息
-->
<head>
<title>发送微信信息</title>
<meta http-equiv="content-type" content="text/html; charset=UTF-8" />
<script src="<%= request.getContextPath() %>/common/nui/nui.js" type="text/javascript"></script>
</head>
<body style="width: 100%;height: 100%;overflow: hidden;">
	<dir id="smsForm" style="padding-top:5px;">
		<fieldset id="smsFieldset" title="往缓存写入token" style="border:solid 1px #aaa;padding:3px;width: 88%;">
		  <legend><span>详细信息</span></legend>
		  <table style="width:100%;height:100%;table-layout:fixed;" class="nui-form-table">
		 	<tr>
		 		<td class="form_label" width="25%" align="right">请填入token:</td>
		 		<td>
		 			<input id="token" class="nui-textbox" name="token" required="true" style="width:60%"/>
		 		</td>
		 	</tr>
		 </table>
		 <div class="nui-toolbar" style="padding:0px;" borderStyle="border:0;">
			    <table width="100%">
			      <tr>
			        <td style="text-align:center;">
			          <a class="nui-button" iconCls="icon-upload" onclick="sendSms">写入缓存</a>
			        </td>
			      </tr>
			    </table>
		</div>
	   </fieldset>
 	</dir>
</body>
<script type="text/javascript">
    nui.parse();
    var form = new nui.Form("#smsForm");
    
    function reset(){
    	form.reset();
    }
    
    function sendSms(){
    	form.validate();
		if (form.isValid() == false) {
			nui.alert("请检查必填项!");
			return;
		}
        var data = form.getData(false, true);
		var json = nui.encode(data);
		$.ajax({
	            url: "com.primeton.eos.ame_common.wx_worktime.updateCache.biz.ext",
	            type: 'POST',
	            data: json,
	            cache: false,
	            contentType:'text/json',
	            cache: false,
	            success: function (text) {
		            nui.alert("写入成功","提示");
	            }
	   }); 
    }
</script>
</html>
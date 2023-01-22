<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>	
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<!-- 
  - Author(s): mengyy
  - Date: 2020-04-27 14:25:09
  - Description:
-->
<head>
<title>邮件模板</title>
</head>
<body>
	<div id="email" style="display: none;">
		<fieldset style="border:solid 1px #aaa;padding:3px;">
			<legend>邮件发送</legend>
			<div style="padding:5px;" >
	    		<input name="mailinfo.fileids" id="fileids2" class="nui-hidden" />
				<table style="table-layout:fixed;">
					<tr>
						<td style="width:150px;" align="right">收件人：</td>
						<td>
							<input id="mailtolist" name="mailinfo.to" class="nui-textboxlist"  searchField="name" style="width:600px"
	    						url="com.primeton.csoms.mis_cs2.tempLicence.getLinksByName.biz.ext" value="" text=""
	    						textField="EMPNAMES" valueField="oemail"/>
						</td>
					</tr>
					<tr>
						<td style="width:150px;" align="right">抄送人：</td>
						<td>
							<input id="mailcclist"  name="mailinfo.cc" class="nui-textboxlist"  searchField="name" style="width:600px"
								url="com.primeton.csoms.mis_cs2.tempLicence.getLinksByName.biz.ext" value="" text=""
								textField="EMPNAMES" valueField="oemail"/>
						</td>
					</tr>
					<tr>
						<td style="width:150px;"  align="right" >邮件主题：</td>
						<td><input  name="mailinfo.subject"  id="subject" class="nui-textbox"  style="width:700px"/>
						</td>
					</tr>
					<tr>
						<td style="width:150px;" align="right" valign="top">正文：</td>
						<td><input name="mailinfo.message" id="message" class="nui-hidden"  style="width:950px;"/>
							<textarea id="ke1" name="content2" style="width:950px;height:650px;visibility:hidden;"></textarea>
						</td>
					</tr>
					<tr>
						<td style="width:150px;" align="right">邮件附件：</td>
						<td>
							<%-- <jsp:include page="/ame_common/detailFile4.jsp"/> --%>
							<jsp:include page="/ame_common/addFiles2.jsp"/>
						</td>
					</tr>
				</table>
			</div>
		</fieldset>
	</div>
</body>
</html>
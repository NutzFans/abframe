<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="/common/common.jsp"%>
<%@include file="/common/skins/skin0/component.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>发起责任单位投票</title>
<meta http-equiv="content-type" content="text/html; charset=UTF-8" />
<script src="<%= request.getContextPath() %>/common/nui/nui.js" type="text/javascript"></script>
	<style type="text/css">
	    body{
	        margin:0;padding:0;border:0;width:100%;height:100%;overflow:hidden;
	    }
    </style>
</head>
<body>
	<div class="nui-fit" dataField="vote" >
		<fieldset style="border:solid 1px #aaa;padding:3px;">
		<legend>责任单位投票详情</legend>
		 	<form id="form1" method="post" >
	        	<table style="table-layout:fixed;" id="table_file1">
	        			<tr>		
							<td align="right" style="width:160px">投票名称：</td>
							<td>
								<input class="nui-textbox" field="" name="voteCode" id="voteCode" readOnly="readOnly" style="width:890px" required="true">
							</td>
						</tr>
						<tr>			
							<td align="right" style="width:160px">结束时间：</td>
							<td style="width: 130px"><input name="voteFinshtime" id="voteFinshtime" class="nui-datepicker" readOnly="readOnly" style="width: 890px"/>
							</td>
						</tr>
						<!-- <td style="color:red;">请选择被投票和投票单位:</td> -->
						<tr>	  
							  <td align = "right" style="width:160px">被投票单位：</td>
							  <td colspan="1" align = "left">
							  <input name="orgNames" id="treeselect1" class="nui-textarea" textField="name" valueField="id"  
							  	parentField="pid"  dataField="orgsAndEmps" expandOnLoad="true" style="width: 890px;" 
							  	url="org.gocom.abframe.org.organization.OrgManager.getRunSecondOrg.biz.ext" readOnly="readOnly"
								/>
						  	  </td>	
						</tr>
						<tr>
						  <td align = "right" style="width:160px">投票单位：</td>
			          	  <td colspan="1" align = "left">
							  <input name="voteDeps" id="treeselect2" class="nui-textarea" textField="name" valueField="id"  
							  	parentField="pid"  dataField="orgsAndEmps" expandOnLoad="true" style="width: 890px;" 
							  	url="org.gocom.abframe.org.organization.OrgManager.getRunSecondOrg.biz.ext" readOnly="readOnly"
								/>
						  </td>					  
						</tr>
						<tr>
							<td align="right" style="width:160px">备注：</td>
							<td colspan="6"><input field="remark" class="nui-textarea" name="remark" shownullItem="true" style="width: 890px;" required="false" readOnly="readOnly" /> 
						</tr>
	        	</table>
	        </form>
    	</fieldset>			
</div>
		<div style="text-align:center;padding:10px;" class="nui-toolbar">
			<a class="nui-button" onclick="onCancel()" style="width:60px;">关闭</a>
		</div>
		
    <script type="text/javascript">
		nui.parse();
		var id = <%= request.getParameter("id") %> ;
		var form = new nui.Form("form1");
		init();
		function init(){
			var json = {"id":id};
    		nui.ajax({
				url: "com.zhonghe.ame.imptask.keyTaskVote.queryZrdwVoteById.biz.ext",
				data:json,
				type:'POST',
				contentType:'text/json',
				success:function(text){
					form.setData(text.vo)
				}
			});
		}
    	function onCancel() {    //关闭窗口
    		window.close();
    	}
    	

   	</script>
</body>
</html>

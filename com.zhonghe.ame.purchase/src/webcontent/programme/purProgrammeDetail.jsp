<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@include file="/purchase/common/common.jsp"%>
<html>
<head>
	<title>采购方案详情</title>
	<style type="text/css">
	    body{
	        margin: 0;padding: 0;border: 0;width: 100%;height: 100%;overflow: hidden;	
	    } 
    </style>
</head>
<body>
	<div class="nui-fit">
		<div class="mini-panel" title="采购方案详情" style="width: 100%;">
			<fieldset id="field1" style="border: solid 1px #aaa;padding: 3px;width: 99%;">
				<legend>采购方案信息</legend>
				<form id="form1" method="post">
					<input name="files" id="fileids" class="nui-hidden"/>
					<input name="files1" id="fileids1" class="nui-hidden"/>
					<input class="nui-hidden" name="id"/>
					<div style="padding: 5px;">
						<table style="table-layout: fixed;">
							<tr>
							<td class="form_label" align = "right">采购方案名称：</td>
								<td>
									<input name="programmeName"  readOnly="readOnly" id="programmeName" class="nui-textbox" style="width: 300px" />
								</td>
							<td align="right" style="width:160px">采购立项编号：</td>
								<td><input name="proappId" id="proappId"  readOnly="readOnly" onbuttonclick="onButtonEdit" class="nui-buttonedit" style="width: 300px" /></td>
							<td align="right" style="width: 120px">单据编号：</td>
								<td ><input
									name="code" id="code" class="nui-textbox" readOnly="readOnly" style="width: 300px;"  /></td>
							</tr>
							<tr>
			              		<td class="form_label"  align="right" style="width:140px;">采购方案与文件说明：</td>
			                    <td colspan="7">    
			                        <input style="width:100%;height: 40px;" name="remark" id="remark" class="nui-textarea"   readOnly="readOnly" id="technologyNeed" dictTypeId="ZH_PURCHASE" />
			                    </td>
			              	</tr>
						</table>
					</div>
				</form>
			</fieldset>

			<fieldset id="field2" style="border:solid 1px #aaa;padding:3px;">
				<legend>采购方案附件</legend>
				<jsp:include page="/ame_common/detailFile.jsp"/>
			</fieldset>
		</div>
	</div>
	<div style="text-align: center;padding: 10px;" class="nui-toolbar">
		<a class="nui-button" onclick="closeCancel()" id="saveReimbProcess" style="width: 80px;margin-right: 140px;">关闭</a>
	</div>
	<script type="text/javascript">
        nui.parse();
		var id = <%=request.getParameter("id")%>;
		var form =  new nui.Form("form1")
		init();
        function init(){
        	var json = nui.encode({"id":id});
	   		ajaxCommon({	
					url: "com.zhonghe.ame.purchase.purchaseProgramme.queryPurProgramme.biz.ext",
			        data: json,
			        success: function (o) {
						 var result=o.purProgrammes[0];
						 form.setData(result)
						 nui.get("proappId").setValue(result.proappId);
						 nui.get("proappId").setText(result.proAppCode);
						
						 var grid_0 = nui.get("grid_0");
        				 grid_0.load({"groupid":"purProgramme","relationid":id});
						 grid_0.sortBy("fileTime","desc");
			        }
			    }); 
		}
		
    </script></body>
</html>

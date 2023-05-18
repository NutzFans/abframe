<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@include file="/purchase/common/common.jsp"%>
<html>
<head>
	<title>采购文件详情</title>
	<style type="text/css">
	    body{
	        margin: 0;padding: 0;border: 0;width: 100%;height: 100%;overflow: hidden;	
	    } 
	</style>
</head>
<body>
	<div class="nui-fit">
		<div class="mini-panel" title="" style="width: 100%;" showHeader="false">
			<fieldset id="field1" style="border: solid 1px #aaa;padding: 3px;width: 99%;">
				<legend>采购文件</legend>
				<form id="form1" method="post">
					<input name="files" id="fileids" class="nui-hidden" />
					<input name="files1" id="fileids1" class="nui-hidden" />
					<input class="nui-hidden" name="id" />
					<div style="padding: 5px;">
						<table style="table-layout: fixed;width: 90%">
							<tr>
								<td width="100" align="right">采购项目名称：</td>
								<td colspan="3">
									<input name="type" id="type" class="nui-hidden" />
									<input name="planId" id="planId" class="nui-hidden" />
									<input name="programmeName" id="programmeName" class="nui-textbox" style="width: 100%"  />
								</td>
								<td  align="right" style="width: 80px">编号：</td>
								<td colspan="2">
									<input name="code" class="nui-textbox" style="width: 100%" readonly="readonly"/>
								</td>
							</tr>
							<tr>
								<td align="right" style="width: 100px">立项名称：</td>
								<td colspan="3">
									<input name="proAppName" id="proAppName" class="nui-textbox" style="width: 100%;"
										readonly="readonly"/>
								</td>
								<td align="right" style="width:100px">立项编号：</td>
								<td colspan="2">
									<input name="proappId" id="proappId" class="nui-buttonedit" style="width: 100%"
										 />
								</td>
							</tr>
							<tr>
								
								<td  align="right" style="width: 80px">申请人：</td>
								<td colspan="1">
									<input name="createdByName" class="nui-textbox" style="width: 100%" readonly="readonly"/>
								</td>
								<td  align="right" width="80" >申请时间：</td>
								<td colspan="1">
									<input name="createdTime" class="nui-textbox" style="width: 100%" readonly="readonly"/>
								</td>
								<td  align="right" style="width: 80px">申请单位：</td>
								<td colspan="2">
									<input name="createdOrgname" class="nui-textbox" style="width: 100%" readonly="readonly"/>
								</td>
							</tr>
							
							<tr>
								<td class="form_label" align="right" style="width:100px;">归口部门：</td>
                <td colspan="3">
                    <input id="putunder" name="putunder" class="nui-dictcombobox"  dictTypeId="ZH_PUTUNDER"  readonly="readonly" style="width:100%;" />
                </td>
								<td align="right" style="width: 100px">立项金额：</td>
								<td colspan="1">
									<input name="proAppApplyPrice" id="proAppApplyPrice" class="nui-textbox" style="width: 100%;"
										readonly="readonly"/>
								</td>
							</tr>
							<tr>
								<td class="form_label" align="right" style="width:120px;">采购文件主要内容简述：</td>
								<td colspan="6">
									<input style="width:100%;height: 120px;" name="remark" id="remark"
										class="nui-textarea"  />
								</td>
							</tr>
						</table>
					</div>
				</form>
			</fieldset>
			<fieldset  style="height:80%; border:solid 1px #aaa;padding:3px;width: 99%">
				<legend>采购计划明细</legend>
		     <div class="fieldset-body"  style="width:100%; height:100%; margin: 0px auto">
		    	<div id="grid_detail" class="nui-datagrid" style="width: 100%;height: auto;" allowCellSelect="true" 
			    	url="com.zhonghe.ame.purchase.dao.projectApproval.queryProAppDtl.biz.ext" dataField="datas" showPager="false" multiSelect="true"  >
			           <div property="columns">
			           		<div type="indexcolumn" align="center" headerAlign="center"  visible="false"></div>
		           			<div  field="planName" width="110" align="center" headerAlign="center" >计划名称</div>
		           			<div  field="code" width="100" align="center" headerAlign="center" >计划编号</div>
		                <div field="materialName"  width="110" align="center" headerAlign="center">采购物项名称 </div>
		                <div field="budgetAmount"  width="100" align="center" headerAlign="center" >预算金额(万元)</div>
		                <div field="amount"  width="100" align="center" headerAlign="center">立项金额(万元)</div>
		                <div field="sumamount"  width="110" align="center" headerAlign="center" vtype="required">剩余可立项金额(万元)</div>
		                <div field="needOrgName"  width="80" align="left" headerAlign="center" >采购单位</div> 
			           </div>
			        </div>
				</div>
			</fieldset>
			<fieldset id="field3" style="border:solid 1px #aaa;padding:3px;width: 99%">
				<legend>附件</legend>
				<jsp:include page="/ame_common/detailFile.jsp"/>
			</fieldset>
		</div>
	</div>
	<script type="text/javascript">
    nui.parse();
		var id = <%=request.getParameter("id")%>;
		var form = new nui.Form("form1")
		var processid = <%=request.getParameter("processid")%>;
		var gridDtl = nui.get("grid_detail");
   	if(processid==null){
   		processid = <%=request.getParameter("processInstID")%>;
   	}
		init();
		labelModel();
    function init(){
    	var json = nui.encode({"processid":processid});
   			nui.ajax({
					url: "com.zhonghe.ame.purchase.purchaseProgramme.queryPurProgramme.biz.ext",
					type: 'POST',
					data: json,
	        success: function (o) {
								var result = o.purProgramme;
								form.setData(result);
								nui.get("proappId").setValue(result.proappId);
								nui.get("proappId").setText(result.proAppCode);
								form.setData(result);
								gridDtl.load({"pid":result.proappId})
									
								
                var grid_0 = nui.get("grid_0");
								grid_0.load({ "groupid": "purProgramme", "relationid": result.id });
								grid_0.sortBy("fileTime", "desc");
	
		        }
		    }); 
		}
		
		 function labelModel() {
		    var fields = form.getFields();                
		    for (var i = 0, l = fields.length; i < l; i++) {
		        var c = fields[i];
		        if (c.setReadOnly) c.setReadOnly(true);     //只读
		        if (c.setIsValid) c.setIsValid(true);      //去除错误提示
		    }
		}
        
    </script></body>
</html>

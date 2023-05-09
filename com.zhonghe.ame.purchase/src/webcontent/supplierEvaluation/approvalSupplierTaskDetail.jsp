<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@include file="/purchase/common/common.jsp"%>
<html>
<head>
    <title>供应商评价审批</title>
    <style type="text/css">
    	html, body{font-size:12px;padding:0;margin:0;border:0;height:100%;overflow:hidden;width:100%;}
    </style>
</head>
<body>
<div class="nui-fit">
    <div>
        <fieldset id="field1" style="border: solid 1px #aaa;padding: 3px;width: 99%;">
				<legend>供应商评审信息</legend>
				<form id="form1" method="post">
					<input class="nui-hidden" name="id" />
					<div style="padding: 2px;">
						<table style="table-layout: fixed; width: 90%;">
							<tr>
								<td colspan="1" align="right">评价单位：</td>
								<td colspan="3">
									<input name="createOrgname"  class="nui-textbox" readOnly="readOnly"  style="width: 100%;" />
								</td>
								<td colspan="1" align="right">评价时间：</td>
								<td colspan="3">
									<input name="createTime" class="nui-datepicker" format="yyyy-MM-dd" readOnly="readOnly" style="width: 100%;" />
								</td>
								<td colspan="1" align="right">主观评分：</td>
								<td colspan="1">
									<input name="scoring"  class="nui-textbox" readOnly="readOnly" style="width: 100%;" />
								</td>
								<td colspan="1" align="right">评价等级：</td>
								<td colspan="1">
									<input name="evaluationGrade"  class="nui-textbox"
										readOnly="readOnly" style="width: 100%;" />
								</td>
							</tr>
							<tr>
								<td colspan="1" align="right">供应商名称：</td>
								<td colspan="3">
									<input name="supplierName" class="nui-textbox" style="width: 100%"  />
								</td>
								<td colspan="1" align="right">合同名称：</td>
								<td colspan="3">
									<input name="contractName" id="contractName" 
										class="nui-textbox" style="width: 100%" readOnly="readOnly"  />
								</td>
								<td colspan="1" align="right">合同编号：</td>
								<td colspan="3">
									<input name="contractNo" id="contractNo" class="nui-textbox"
										readOnly="readOnly" style="width: 100%;" />
								</td>
							</tr>
							<tr>
								<td colspan="1" align="right">履约情况：</td>
								<td colspan="9">
									<input style="width:100%;height: 60px;" name="performance" id="performance"
										class="nui-textarea" readOnly="readOnly" 
										emptyText="（简要评价供应商供货速度、服务态度、配合程度、仓贮能力等；满分4分）" />
								</td>
								<td colspan="1" align="right" width="140px">评分(满分4分)：</td>
								<td colspan="1">
									<input style="width:100px;" name="performanceScore" id="performanceScore"
										minValue="0" maxValue="4" 
										class="nui-spinner" readOnly="readOnly"  />
								</td>
							</tr>
							<tr>
								<td colspan="1" align="right">技术评价：</td>
								<td colspan="9">
									<input style="width:100%;height: 60px;" name="technology" id="technology"
										class="nui-textarea" readOnly="readOnly" 
										emptyText="（简要评价供应商提供产品/服务专业水平、供货/服务质量；满分4分）" />
								</td>
								<td colspan="1" align="right">评分(满分4分)：</td>
								<td colspan="1">
									<input style="width:100px;" name="technologyScore" 	class="nui-spinner" readOnly="readOnly"  />
								</td>
							</tr>
							<tr>
								<td colspan="1" align="right">质保能力：</td>
								<td colspan="9">
									<input style="width:100%;hereadOnly="readOnly" name="warranty" id="warranty"
										class="nui-textarea" readOnly="readOnly" 
										emptyText="（简要评价供应商是否有较完善的质保/售后体系，是否满足中核咨询需求；满分2分）" />
								</td>
								<td colspan="1" align="right">评分(满分2分)：</td>
								<td colspan="1">
									<input style="width:100px;" name="warrantyScore" id="warrantyScore"
										class="nui-spinner"  minValue="0"
										maxValue="2" readOnly="readOnly"  />
								</td>
							</tr>
						</table>
					</div>
				</form>
			</fieldset>
	</div>
</div>
        
</body>	
<script type="text/javascript">
	    nui.parse();
	    var form = new nui.Form("#form1");
	   	var workitemid = <%=request.getParameter("workItemID")%>;
	   	form.setEnabled(false);
	   	init();
	   	
	   	function init(){
	   		var data = {"workitemid":workitemid};
	   		var json = nui.encode(data);
	   		nui.ajax({	
					url: "com.zhonghe.ame.purchase.supplierEvaluate.querySupEvaluate.biz.ext",
				    type: 'POST',
			        data: json,
			        success: function (o) {
		        		var result = o.supEvaluate[0];
						form.setData(result)
			        },
				    error: function (jqXHR, textStatus, errorThrown) {
				        alert(jqXHR.responseText);
				    }
		    }); 
	   	}
	   	
       	
		
		function unitValue(e){
	   		return nui.getDictText("ZH_UNIT",e.value);
		}	   		
	   	function onYn(e){
	   		return nui.getDictText("MIS_YN",e.value);
		}
		
		function zhPutUnder(e) {
			return nui.getDictText('ZH_PUTUNDER',e.value);//设置业务字典值
		}
</script>
</html>
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
 <%long workitemid = (Long)request.getAttribute("workItemID");%> 
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
									<input style="width:100%;height: 120px;" name="performance" id="performance"
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
									<input style="width:100%;height: 120px;" name="technology" id="technology"
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
									<input style="width:100%; height: 120px" hereadOnly="readOnly" name="warranty" id="warranty"
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
		<fieldset id="field2" style="border:solid 1px #aaa;padding:1px;width: 98%">
	     <jsp:include page="/ame_common/misOpinion_Freeflow.jsp"/>
		</fieldset>
	</div>
</div>
<div style="text-align:center;padding:8px;border-width:1px 0px 0px 0px;" class="nui-toolbar">          
<!-- 	<a class="nui-button" onclick="countersign()" id="countersign" iconCls="icon-user" style="width: 80px;margin-right: 20px;">加签</a>      -->
    <a class="nui-button"  onclick="submit()" iconCls="icon-ok" style="width:60px;margin-right:20px;">提交</a>       
    <a class="nui-button" onclick="closeCancel" iconCls="icon-close" style="width:60px;">关闭</a>
</div>        
</body>	
<script type="text/javascript">
	    nui.parse();
	    var workItemID = <%=request.getParameter("workItemID")%>;
	    var form = new nui.Form("#form1");
	    var opioionform = new nui.Form("opioionform");
	   	var titleText;
	   	var countersignUsers;
	   	init();
	   	
	   	function init(){
	   		var data = {workitemid:<%=workitemid%>};
	   		var json = nui.encode(data);
	   		nui.ajax({	
					url: "com.zhonghe.ame.purchase.supplierEvaluate.querySupEvaluate.biz.ext",
				    type: 'POST',
			        data: json,
			        success: function (o) {
			        		var result = o.supEvaluate[0];
									form.setData(result)
// 			       		 	nui.get("backTo").setData(o.purPlan.backList);
			       		 var grid1 = nui.get("datagrid1");
								 grid1.load({processInstID:result.processid});
								 grid1.sortBy("time", "desc");
						 //初始化处理意见
						 initMisOpinion({auditstatus:"1"});
						 var jsonData = {"planId":o.purPlan.id}
			       		 grid.load(jsonData);
			        },
				    error: function (jqXHR, textStatus, errorThrown) {
				        alert(jqXHR.responseText);
				    }
			    }); 
	   	}
	   	
       	function countersign(){
        	selectOmEmployee();
        }
       	
       	function selectOmEmployee(){
	    	var btnEdit = this;
	        nui.open({
	            url: "<%=request.getContextPath() %>/contractPact/selectUsers.jsp",
	            title: "立项单位经办人",
	            width: 430,
	            height: 400,
	            ondestroy: function (action) {
	            	console.log(action)
	            	var user,users = "【";
	            	countersignUsers =[];
	                if (action == "ok") {
	                    var iframe = this.getIFrameEl();
	                    var data = iframe.contentWindow.GetData();
	                    data = nui.clone(data);    //必须
	                    if (data) {
	                    	console.log(data)
                        	for(var i = 0;i<data.length ;i++){
                        		user = {};
                        		user.id = data[i].userid
                        		user.name = data[i].empname
                        		user.typeCode = "person"
                        		countersignUsers.push(user);
                        		if(i==0){
                        			users = users +data[i].empname;
                        		}else{
                        		
	                        		users = users +","+data[i].empname;
                        		}
                        	}
                        	users = users+"】";
                        	titleText ="增加审批人员"+ users +"并提交";
		                    form2.submit();
	                       }
	                    }
	
	                }
	            });
	        }
       	 
	   	function submit(){
	    	var auditstatus = nui.get("auditstatus").getValue();
	    	if(auditstatus == "2"){	//终止流程
	    		titleText = "终止";
	    	}else if(auditstatus == "0"){	//退回流程
	    		if(!nui.get("backTo").getValue()){
	    			showTips("退回环节不能为空！");
	    			return;
	    		}
	    		titleText = "退回";
	    	}else if(auditstatus == "1"){	//提交流程
	    		titleText = "提交";
	    	}
	    	saveData();
    	}
   		function saveData(json){
   			nui.confirm("确定" + titleText + "流程吗？", "操作提示",function (action) {            
        	if (action == "ok") {
        	var data = form.getData();
					var misOpinion = opioionform.getData().misOpinion;//审核意见
	            	/* nui.get("appButton").setEnabled(false); */
        	var json = {supEvaluate: data,misOpinion:misOpinion,workItemID: <%=workitemid %>,"countersignUsers":countersignUsers};
//         	var msgBoxId = form.loading("正在处理...", "请稍后");
        	ajaxCommon({
		  			url: "com.zhonghe.ame.purchase.supplierEvaluate.approvalSupplierReview.biz.ext",
						data: json,
// 						type: 'POST',
						cache: false,
						contentType: 'text/json',
						success: function (o){
// 						nui.unmask(document.body);
						if(o.result == "success"){
				        	showTips(titleText + "成功","系统提示")
				        		closeOk();
						}else{
							showTips("提交失败，请联系信息技术部人员！","danger" )
						}
					}
	  				}) 
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
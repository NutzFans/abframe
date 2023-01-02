<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@include file="/purchase/common/common.jsp"%>
<html>
<head>
	<title>采购计划立项申请 </title>
	<style type="text/css">
	    body{
	        margin: 0;padding: 0;border: 0;width: 100%;height: 100%;overflow: hidden;	
	    } 
    </style>
</head>
<body>
 <%long workitemid = (Long)request.getAttribute("workItemID");%> 
	<div class="nui-fit">
		<div class="mini-panel" title="" style="width: 100%;">
			<fieldset id="field1" style="border: solid 1px #aaa;padding: 3px;width: 98%;">
				<legend>采购立项</legend>
				<form id="form1" method="post" >
					<input name="files" id="fileids" class="nui-hidden"/>
					<input name="files1" id="fileids1" class="nui-hidden"/>
					<input name="processid" id="processid" class="nui-hidden"/>
					<input class="nui-hidden" name="id"/>
					<div style="padding: 5px;">
						<table style="table-layout: fixed;">
							<tr>
								<td class="form_label" align = "right">立项名称：</td>
								<td>
									<input name="proAppName"  class="nui-textbox" style="width: 200px" required="true"/>
								</td>
								<td align="right" style="width: 140px">分公司职能部门经办人：</td>
								<td  >
									<input name="proAppAgentUserid" id="proAppAgentUserid"  class="nui-buttonedit" 
										onbuttonclick="selectOmEmployee" style="width: 170px"  />
								</td>
								<td align="right" style="width: 120px">立项单位：</td>
								<td >
									<input
										name="proAppOrgId" id="proAppOrgId" class="nui-combobox" 
										url="com.primeton.rdmgr.labor.labormgr.getAllOrgs.biz.ext"
										filterType="like" textField="orgname" valueField="orgid" dataField="allorgs" valueFromSelect="true" allowInput="true"
										style="width: 170px;" enabled="false" />
									<input name="proAppOrgName" class="nui-hidden" style="width: 100%" required="true"/>
								</td>
							</tr>
							<tr>
								<td align="right" style="width: 130px">所属项目名称：</td>
									<td><input name="projectId"  class="nui-textbox"   style="width: 100%" /></td>
								<td align="right" style="width: 140px">立项申请金额(万元)：</td>
								<td>
									<input name="proAppApplyPrice"  id="proAppApplyPrice" class="nui-textbox" readonly="readonly" style="width: 100%"  required="ture"/>
								</td>
								<td align="right" style="width:140px">项目拟实施日期：</td>
								<td>
									<input name="proAppImplTime"  class="nui-datepicker"  value="new Date()"  style="width: 100%"/>
								</td>
							</tr>
							<tr>
								<td align="right" style="width: 100px">费用来源：</td>
								<td>
									<input name="costFrom"  class="nui-radiobuttonlist"  data="[{id: '1', text: '公司自筹资金'}, {id:'2', text: '中央预算内资金'}]" required="ture"/>
								</td>
								<td align="right" style="width:140px">立项对象类别：</td>
								<td>
									<input name="proAppObjType"  class="nui-radiobuttonlist"  data="[{id: '1', text: '工程'}, {id:'2', text: '物资'}, {id:'3', text: '服务'}]" required="ture"/>
								</td>
							</tr>
							<tr id="one111">
			              		<td class="form_label"  align="right" style="width:120px;">立项范围说明：</td>
			                    <td colspan="7">    
			                        <input style="width:100%;height: 40px;" name="proAppRange" class="nui-textarea"  id="technologyNeed" />
			                    </td>
	              			</tr>
					</table>
				</div>
			</form>
		</fieldset>
        <fieldset  style="height:80%; border:solid 1px #aaa;padding:3px;">
		     <div class="fieldset-body"  style="width:100%; height:100%; margin: 0px auto">
		    	<div id="grid_detail" class="nui-datagrid" style="width: 100%;height: auto;" allowCellSelect="true" 
			    	url="com.zhonghe.ame.purchase.dao.projectApproval.queryProAppDtl.biz.ext" dataField="datas" showPager="false" multiSelect="true"  >
			           <div property="columns">
			           		<div type="indexcolumn" align="center" headerAlign="center"  visible="false"></div>
			           		<div  field="code" width="110" align="center" headerAlign="center" >计划编号</div>
			                <div field="materialName"  width="110" align="center" headerAlign="center" vtype="required"  >采购物项名称 </div>
			                <div field="budgetAmount"  width="110" align="center" headerAlign="center" vtype="required">预算金额(万元)</div>
			                
			                <div field="amount"  width="110" align="center" headerAlign="center" vtype="required" headerStyle="color:red">立项金额(万元)
			                </div>
			                <div field="sumamount"  width="110" align="center" headerAlign="center" vtype="required">剩余可立项金额(万元)</div>
			                <div field="needOrgName"  width="60" align="center" headerAlign="center" >采购单位</div> 
			                <div field="contractamount"  width="100" align="center" headerAlign="center" vtype="true" visible="false">拟签合同金额(元)
			                	<input property="editor"   class="nui-spinner"  minValue="0"  maxValue="999999999"  id="contractamount" name="contractamount" />
			                </div>
			            </div>
			        </div>
				</div>
			</fieldset>
			<fieldset id="field2" style="border:solid 1px #aaa;padding:3px;">
				<legend>费用估算证明附件</legend>
				<jsp:include page="/ame_common/detailFile.jsp"/>
			</fieldset>
			<fieldset id="field3" style="border:solid 1px #aaa;padding:3px;">
				<legend>立项支持材料附件</legend>
				<jsp:include page="/ame_common/detailFile2.jsp"/>
			</fieldset>
			<jsp:include page="/ame_common/misOpinion_Freeflow.jsp"/>
			
		</div>
	</div>
	<div style="text-align: center;padding: 10px;" class="nui-toolbar">
		<a class="nui-button" onclick="submit" id="creatReimbProcess" style="width: 80px;margin-right: 20px;">提交</a>
		<a class="nui-button" onclick="closeCancel()" id="saveReimbProcess" style="width: 80px;margin-right: 140px;">关闭</a>
	</div>
	<script type="text/javascript">
        nui.parse();
		var form = new nui.Form("form1");
		var gridDtl = nui.get("grid_detail");
		init();
		
		
        function init(){
        	var json = nui.encode({"workitemid":<%=workitemid%>});
        	form.setEnabled(false);
	   		ajaxCommon({	
					url: "com.zhonghe.ame.purchase.purchaseProApp.queryProApp.biz.ext",
			        data: json,
			        success: function (o) {
						 var result=o.proApp[0]
						 form.setData(result);
						 nui.get("proAppAgentUserid").setText(result.agentempname)
						 gridDtl.load({"pid":result.id})
						 //设置审核意见基本信息
							clog(o)
			            	//查询审核意见
							var grid1 = nui.get("datagrid1");
							 nui.get("backTo").setData(o.backList);
				       		 var grid1 = nui.get("datagrid1");
							 grid1.load({processInstID:result.processid});
							 grid1.sortBy("time", "desc");
							 //初始化处理意见
							 initMisOpinion({auditstatus:"1"});
							
							var grid_0 = nui.get("grid_0");
	        				 grid_0.load({"groupid":"proAppCost","relationid":result.id});
							 grid_0.sortBy("fileTime","desc");
							 var grid_1 = nui.get("grid_1");
	        				 grid_1.load({"groupid":"proAppSup","relationid":result.id});
							 grid_1.sortBy("fileTime","desc");
			        }
			    }); 
		}
		

    	
    	function submit(){
	    	var auditstatus = nui.get("auditstatus").getValue();
	    	if(auditstatus == "2"){	//终止流程
	    		titleText = "终止";
	    		submitProcess("终止");
	    	}else if(auditstatus == "0"){	//退回流程
	    		if(!nui.get("backTo").getValue()){
	    			showTips("退回环节不能为空！");
	    			return;
	    		}
	    		titleText = "退回";
	    		submitProcess("退回");
	    	}else if(auditstatus == "1"){	//提交流程
	    		titleText = "提交";
	    		submitProcess("提交");
	    	}
	    }
    
    function submitProcess(title){
	    	nui.confirm("确定" + title + "流程吗？", "操作提示",function (action) {            
	            if (action == "ok") {
	            	var data = form.getData();
					var misOpinion = opioionform.getData().misOpinion;//审核意见
	            	/* nui.get("appButton").setEnabled(false); */
	            	var json = {"param":data,misOpinion:misOpinion,workItemID: <%=workitemid %>};
	            	saveData(json);
	            }
	        });
	   }
	   
	   function saveData(json){
    	 ajaxCommon({
  			url: "com.zhonghe.ame.purchase.purchaseProApp.proAppApproval.biz.ext",
			data: json,
			success: function (o){
				if(o.result == "success"){
		        	showTips("提交成功")
	        			closeOk();			
				}else{
					showTips("提交失败，请联系信息技术部人员！","danger")
					/* closeOk();	 */					
				}
			}
  		}) 
	}
	
	function onSumamount(e){
		var sumamount = addFloat(e.row.amount,e.row.sumamount);
		if(e.row._state){
			return e.row.sumamount;
		}else{
			return sumamount;
		}
	}
	
    </script></body>
</html>

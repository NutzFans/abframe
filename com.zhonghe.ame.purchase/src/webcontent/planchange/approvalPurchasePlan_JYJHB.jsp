<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@include file="/purchase/common/common.jsp"%>
<html>
<head>
    <title>采购计划经营计划部审批</title>
    <style type="text/css">
    	html, body{font-size:12px;padding:0;margin:0;border:0;height:100%;overflow:hidden;width:100%;}
    </style>
</head>
<body>
 <%long workitemid = (Long)request.getAttribute("workItemID");%> 
<div class="nui-fit">
    <div>
        <fieldset style="border:solid 1px #aaa;padding:3px;width: 98%">
            <legend>采购计划信息</legend>
            <form id="form1" method="post">
				<div style="padding: 5px;  ">
					<table style="table-layout: fixed;" id="table_file">
		        	<tr>
		        		<td class="form_label" align="right" style="width:100px;">年度采购计划名称：</td>
		                <td colspan="3">
		                	<input id="id" name="id" class="nui-hidden"readonly="readonly"/>
		                    <input id="name" name="name" class="nui-textbox" required="true"  style="width:100%;" readonly="readonly"/>
		                </td>
		        	</tr>
		        	<tr>
		        		<td  class="form_label" align="right" style="width:100px;">计划年度：</td>
		                <td colspan="1">
		                    <input id="year" name="year" style="width:100%;" class="nui-textbox" style="width:150px;" readonly="readonly"/>   
		                </td>
		                <td class="form_label" align="right" style="width:100px;">提报人姓名：</td>
		                <td>
		                    <input class="nui-textbox"  name="infomantUser" id="infomantUser" required="true" style="width:100%;"    readonly="readonly"/>
		                </td>
		                <td class="form_label" align="right" style="width:80px;">采购单位：</td>
		                <td>
		                <input id="needOrgName" name="needOrgName" class="nui-textbox" required="true" style="width:100%;"  readonly="readonly"/>
		        	</tr>
		           	<tr>
		                <td class="form_label" align="right" style="width:100px;">采购类型：</td>
		                <td >    
		                    <input class="nui-dictcombobox" name="type" id="type" dictTypeId="ZH_PURCHASE" required="true" onvaluechanged="loadItem()" style="width:100%;" readonly="readonly"/>
		                </td>
		                <td class="form_label" align="right" style="width:120px;">计划总金额(万元)：</td>
		                <td >
		                    <input id="budgetAmount" name="budgetAmount" class="nui-textbox" required="true"   readOnly="readOnly"  style="width:100%;" />
		                </td>
		                 <td class="form_label" align="right" style="width:100px;">物项归口部门：</td>
		                <td >
		                    <input id="putunder" name="putunder" class="nui-dictcombobox"  dictTypeId="ZH_PUTUNDER"  onvaluechanged="loadItem()"  style="width:100%;" readonly="readonly"/>
		                </td>
		             </tr>
		          	<tr>
		          		<td class="form_label" style="width:120px;" align="right">备注：</td>
		                <td  colspan="7">    
		                    <input style="width:100%;height:70px;" name="remark" class="nui-textarea" id="remark" readonly="readonly"/>
		                </td>
		          	</tr>
		        </table>
		    </div>
    	</form>
        <fieldset >
	    	<legend>采购预算明细</legend>
	    	<div id="grid_traveldetail" class="nui-datagrid" style="width: 100%;height: auto;" allowCellSelect="true" 
	    		showPager="false" allowCellEdit="true" multiSelect="true" dataField="purPlanItem"  
	    		url="com.zhonghe.ame.purchase.purchaseItems.queryPurPlanItem.biz.ext">
	            <div property="columns">
	           		<div type="indexcolumn" align="center" headerAlign="center"></div>
	           		<div field="isAdopt"  width="50" align="center" headerAlign="center" type="checkboxcolumn" trueValue="1" falseValue="0"  headerStyle="color:red">是否通过
	                	<input property="editor"  class="nui-checkboxcolumn" name="isAdopt" required="true"  style="width:100%;"/>
	                </div>
	                <div field="opinion"  width="80" align="center" headerAlign="center">小组会意见
	                	<input property="editor"  class="nui-textarea" name="opinion" style="width:100%;"/>
	                </div>
	           		<div  field="code"  align="center" headerAlign="center"  visible="false" >计划编号
	                </div>
	                <div  field="purchaseFirstCode"  align="center" headerAlign="center"  visible="false">物项大类编码
	                </div>
	                <div field=purchaseFirstName  align="center" headerAlign="center"  >物项大类名称 
	                </div> 
	                <div  field="purchaseTwoCode"  align="center" headerAlign="center" visible="false">物项中类编码
	                </div>
	                <div  field="purchaseTwoName"  align="center" headerAlign="center" renderer="onViewL" >物项中类名称 
	                </div> 
	                <div field="purchaseThreeCode" id="purchaseThreeCode"  align="center" headerAlign="center"  readOnly="true"  visible="false">物项小类编码
	                </div>
	                <div field="purchaseThreeName"   align="center" headerAlign="center" renderer="onViewL" >物项小类名称 
	                </div>
	                <div field="materialName"   align="center" headerAlign="center" vtype="required"  renderer="onViewL" >采购物项名称 
	                </div>
	                <div field="unit"  width="40" align="center" headerAlign="center" renderer="unitValue">单位
	                </div> 
	                <div field="budgetAmount"  width="70" align="center" headerAlign="center" vtype="required">预算金额(万元)
	                </div>
	                <div field="technologyNeed"  width="100" align="center" headerAlign="center" >技术要求
	                </div>
	                <div field="keyIssus"  width="100" align="center" headerAlign="center"  renderer="onYn">是否关键事项
	                	<!-- <input property="editor" class="nui-textbox" id="contractname" name="contractname" /> -->
	                	<input property="editor"  class="nui-dictcombobox" name="keyIssus"  dictTypeId="MIS_YN" required="true"  style="width:100%;"/>
	                </div>
	                <div field="isProject"  width="100" align="center" headerAlign="center" value="1" renderer="onYn">是否工程建设下项目采购
	                	<input property="editor" class="nui-dictcombobox" name="isProject" dictTypeId="MIS_YN" required="true" style="width:100%;"/>
	                </div>
	                <div field="projectname"  width="100" align="center" headerAlign="center" >所属项目
	                	<input property="editor" class="nui-textbox"  name="projectname" />
	                </div>
	                <div field="remark"  width="100" align="center" headerAlign="center" >备注
	                	<input property="editor" class="nui-textarea" name="remark" />
	                </div>
	                
	                <div field="number"  width="80" align="center" headerAlign="center" visible="false" vtype="required">数量
	                	<input property="editor"  class="nui-spinner" minValue="0"  maxValue="999999999"  id="number" name="number" />
	                </div> 
	                <div field="contractname"  width="100" align="center" headerAlign="center" renderer="onViewL" visible="false">拟签合同名称
	                	<input property="editor" class="nui-textbox" id="contractname" name="contractname" />
	                </div>
	                <div field="plansimplementtime"  width="100" align="center" headerAlign="center"  visible="false" vtype="required">拟实施采购时间
	                	<input property="editor" class="nui-datepicker" id="plansimplementtime" name="plansimplementtime"/>
	                </div>
	                <div field="contractamount"  width="100" align="center" headerAlign="center"  visible="false">拟签合同金额(元)
	                	<input property="editor"   class="nui-spinner"  minValue="0"  maxValue="999999999"   name="contractamount" />
	                </div>
	                <div field="id"  align="center" headerAlign="center"  visible="false">id
	                	<input property="editor"   class="nui-textbox"   name="id" />
	                </div>
	            </div>
        	</div>
		</fieldset>
        </fieldset>
		<jsp:include page="/ame_common/misOpinion.jsp"/>
	</div>
</div>
<div style="text-align:center;padding:10px;border-width:1px 0px 0px 0px;" class="nui-toolbar">               
    <a class="nui-button"  onclick="submit()" style="width:60px;margin-right:20px;">提交</a>       
    <a class="nui-button" onclick="closeCancel" style="width:60px;">关闭</a>
</div>        
</body>	
<script type="text/javascript">
	    nui.parse();
	    var form = new nui.Form("#form1");
	    var grid = nui.get("grid_traveldetail");
	    var opioionform = new nui.Form("opioionform");
	    var purType,orgid; //采购类型,归口部门ID
	   	var istype;
	   	init();
   		
	   	function init(){
	   		
	   		var json = nui.encode({"workitemid":<%=workitemid%>});
	   		nui.ajax({	
					url: "com.zhonghe.ame.purchase.purchaseItems.queryPurPlanDetail.biz.ext",
				    type: 'POST',
			        data: json,
			        success: function (o) {
			        	form.setData(o.purPlan);
			        	if(o.purPlan.type!=2){
		   					grid.hideColumns([15,14,16])
			        	}
			        	if(o.purPlan.type==3){
			        		grid.hideColumns([6,10,8])
			        	}
			       		 nui.get("backTo").setData(o.purPlan.backList);
			       		 var grid1 = nui.get("datagrid1");
						 grid1.load({processInstID:o.purPlan.processid});
						 grid1.sortBy("time", "desc");
						 //初始化处理意见
						 initMisOpinion({auditstatus:"1"});
						 var jsonData = {"planId":o.purPlan.id}
						 console.log(jsonData);
			       		 grid.load(jsonData);
			        },
				    error: function (jqXHR, textStatus, errorThrown) {
				        alert(jqXHR.responseText);
				    }
			    }); 
	   		
	   	
	   	}
	   	
	   	 function getHTZQ(e){
        	if(e.field == "budgetAmount"){
	        	var tempData = nui.get(grid_traveldetail).data;
	        	var a=tempData.length;
	        	var b=0;
	        	  debugger
	        	for(var i=0;i<a;i++){
	        		if(tempData[i].budgetAmount!=undefined){
			    		b+=parseInt(tempData[i].budgetAmount);
	        		}else{
	        			var x = 0;
	        			b+=x;
	        		}
		    	}
		    	 nui.get("totalPrice").setValue(b)
        	}
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
    
    
     // 提交 
    	function submitProcess(title){
	    	nui.confirm("确定" + title + "流程吗？", "操作提示",function (action) {            
	            if (action == "ok") {
	            	var items = grid.getData();
					var misOpinion = opioionform.getData().misOpinion;//审核意见
					misOpinion.year = nui.get("year").getValue();
	            	/* nui.get("appButton").setEnabled(false); */
	            	var json = {misOpinion:misOpinion,workItemID: <%=workitemid %>,"items":items};
	            	clog(json)
	            	saveData(json);
	            }
	        });
	    }
	   	
   		function saveData(json){
	    	 ajaxCommon({
	  			url: "com.zhonghe.ame.purchase.purchaseItems.approvalPurPlan.biz.ext",
				data: json,
				success: function (o){
					nui.unmask(document.body);
					if(o.result == "success"){
			        	showTips(titleText + "成功","系统提示")
			        		closeOk();
					}else{
						showTips("提交失败，请联系信息技术部人员！","系统提示" )
				    	closeOk();
					}
				}
	  		}) 
		}
	
	function unitValue(e){
   		return nui.getDictText("ZH_UNIT",e.value);
	}	   		
   	function onYn(e){
   		return nui.getDictText("MIS_YN",e.value);
	}
</script>
</html>
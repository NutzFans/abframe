<%@page import="org.json.simple.JSONObject"%>
<%@page import="java.util.List"%>
<%@page import="commonj.sdo.DataObject"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@page import="com.eos.data.datacontext.UserObject"%>
<%@ page import="java.util.Map" %>
<html>
<head>
	<title>采购验收审批</title>
	<meta http-equiv="content-type" content="text/html; charset=UTF-8" />
	<script src="<%= request.getContextPath() %>/common/nui/nui.js" type="text/javascript"></script>
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
				<legend>采购验收单信息</legend>
				<form id="form1" method="post">
					<input class="nui-hidden" name="processid"/>
					<input class="nui-hidden" name="id" id= "id"/>
					<div style="padding: 5px;">
						<table style="table-layout: fixed;">
							<tr>
							<td class="form_label" align = "right">验收单编号：</td>
								<td colspan="3">
									<input name="verifyCode" id="verifyCode" class="nui-textbox" style="width: 100%" />
								</td>
							</tr>
							<tr>
								<td align="right" style="width: 120px">验收人：</td>
								<td >
									<input name="empname" id="examineUserId"  class="nui-textbox"  style="width: 100%"/>
								</td>
								<td align="right" style="width:160px">验收部门：</td>
								<td>
									<input name="orgname" class="nui-textbox"  style="width: 100%"  />
								</td>
							</tr>
							<tr>
								<td align="right" style="width: 120px">合同编号：</td>
									<td><input name="contractNo" id="contractNo"   class="nui-textbox" style="width: 100%"/></td>
								<td align="right" style="width: 130px">合同总价(万元)：</td>
									<td><input name="totalPrice" readOnly="readOnly" id="totalPrice" class="nui-textbox" style="width: 100%" required="true"/></td>
							</tr>
							<tr>
			              		<td class="form_label"  align="right" style="width:140px;">备注：</td>
			                    <td colspan="3">    
			                        <input style="width:100%;height: 70px;" name="remark" id="remark" class="nui-textarea"/>
			                    </td>
			              	</tr>
						</table>
					</div>
				</form>
			</fieldset>
			  <fieldset  style="height:100%; border:solid 1px #aaa;padding:3px ;width: 98%; ">
			  <legend>货物信息</legend>
		     <div class="fieldset-body"  style="width:100%; height:100%; margin: 0px auto">
	    		<div id="grid_traveldetail" class="nui-datagrid" style="width: 100%; height: auto;" allowCellSelect="true" 
		    		  url="com.zhonghe.ame.purchase.purchaseVerify.queryVerifyDetailTotal.biz.ext" 
    				dataField="purVerifyDetail" showPager="false" allowCellEdit="true" multiSelect="true" oncellendedit="changeValue">
		            <div property="columns">
		            	<div type="indexcolumn" align="center" headerAlign="center">序号</div>
		                <div field="goodsName"  width="130" align="center" headerAlign="center">货物名称
								<input id="goodsName"  class="nui-textbox" name="goodsName" property="editor" />
		                </div>
		               <div  field="model" width="130" align="center" headerAlign="center" renderer="dictstatus"  >型号规格
								<input id="model" name="model" property="editor"  class="nui-textbox"   />
		                </div>
		                <div  field="supId" displayField="custname" width="130" align="center" headerAlign="center">供应商名称
								<input id="supId" name="supId" property="editor"  onbuttonclick="onButtonEdit1" class="nui-buttonedit"  />
		                </div>
		                <div  field="number"  width="130" align="center" headerAlign="center">数量
								<input id="number" name="number" maxValue="999999999" property="editor"  class="nui-textbox"  />
		                </div>
		                <div   field="singlePrice" width="130" align="center" headerAlign="center" renderer="doIt">单价(万元)
								<!-- <input id="singlePrice" name="singlePrice" property="editor"  class="nui-textbox" /> -->
		                </div>
		                <div   field="totalPriceDetail" width="130" align="center" headerAlign="center" renderer="doIt" >总价(万元)
								<!-- <input id="totalPriceDetail" name="totalPriceDetail" property="editor"   class="nui-textbox"  /> -->
		                </div>
		                 <div   field="qualitySituation" width="130" align="center" headerAlign="center"  >质量情况
								<input id="qualitySituation" name="qualitySituation" property="editor"  class="nui-textbox"  />
		                </div>
		            </div>
		        </div>
		</div>
		</fieldset>
			<jsp:include page="/ame_common/misOpinion.jsp"/>	
			<div style="visibility: hidden;display: none;">	
				<jsp:include page="/ame_common/inputFile.jsp"/>
			</div>
		</div>
	</div>
	<div style="text-align: center;padding: 10px;" class="nui-toolbar">
		<a class="nui-button" onclick="countersign()" id="countersign" iconCls="icon-user" style="width: 80px;margin-right: 20px;">加签</a>                  
		<a class="nui-button" onclick="submit()" id="creatReimbProcess" style="width: 80px;margin-right: 20px;">提交</a>
		<a class="nui-button" onclick="onCancel" id="saveReimbProcess" style="width: 80px;margin-right: 140px;">关闭</a>
	</div>
	<script type="text/javascript">
        nui.parse();
	    var form = new nui.Form("#form1");
	    var grid_traveldetail = nui.get("grid_traveldetail");
	    var type ;
	    var workItemID = <%=request.getParameter("workItemID")%>;
	   	var countersignUsers,titleText;
	    form.setEnabled(false); 
	        //工作项id
	<% 
		long workItemID=(Long)request.getAttribute("workItemID");
	%>
		loadData();
	   function loadData(){
			//流程提示信息
			var data = {workItemID:<%=workitemid%>};
	   		var json = nui.encode(data);
	   		console.log(data);
	   		console.log(json);
			nui.ajax({
				url:"com.zhonghe.ame.purchase.purchaseVerify.getVerify.biz.ext",
				type:"post",
				data:json,
				contentType:"text/json",
				success:function (o){
					//付款申请基本信息
					form.setData(o.data);
					//设置审核意见基本信息
					 nui.get("backTo").setData(o.backList);
					nui.get("processinstid").setValue(o.workitem.processInstID);
	               	nui.get("processinstname").setValue(o.workitem.processInstName);
	               	nui.get("activitydefid").setValue(o.workitem.activityDefID);
	               	nui.get("workitemname").setValue(o.workitem.workItemName);
					nui.get("workitemid").setValue(<%=workItemID %>);
	               	nui.get("isshow").setValue("1");
	               	nui.get("auditstatus").setValue("4");
	               	<!--document.getElementById("salesEdit").style.display="none";-->
	               	nui.get("auditopinion").setValue("");
	            	//查询审核意见
					var grid = nui.get("datagrid1");
					if(o.workitem.processInstID!=null||o.workitem.processInstID!=""){
						grid.load({processInstID:o.workitem.processInstID});
						grid.sortBy("time", "desc");
					}
						 //初始化处理意见
						 initMisOpinion({auditstatus:"1"});
					 grid_traveldetail.load({'id':nui.get("id").getValue()});	
					
				},
				error:function(){}
			});
	    }
		
		
			function submit(){
	    	var auditstatus = nui.get("auditstatus").getValue();
	    	console.log(auditstatus);
	    	if(auditstatus == "2"){	//终止流程
	    		titleText = "终止";
	    		
	    	}else if(auditstatus == "0"){	//退回流程
	    		if(!nui.get("backTo").getValue()){
	    			nui.alert("退回环节不能为空！");
	    			return;
	    		}
	    		titleText = "退回";
	    		
	    	}else if(auditstatus == "1"){	//提交流程
	    		titleText = "提交";
	    		
	    	}
	    	form2.submit();
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
    
     // 提交 
    	function SaveData(){
	    	saveData();
	    }
    	function saveData(json){
	    	nui.confirm("确定" + titleText + "流程吗？", "操作提示",function (action) {            
	            if (action == "ok") {
					var misOpinion = opioionform.getData().misOpinion;//审核意见
	            	nui.get("creatReimbProcess").setEnabled(false);
	            	var json = {misOpinion:misOpinion,workItemID: <%=workitemid %>,"countersignUsers":countersignUsers};
		            mini.mask({
			            el: document.body,
			            cls: 'mini-mask-loading',
			            html: titleText+'中...'
			        }); 
			    	 nui.ajax({
			  			url: "com.zhonghe.ame.purchase.purchaseVerify.approvalPurVerify.biz.ext",
						type: "post",
						data: json,
						contentType: "text/json",
						success: function (o){
							nui.unmask(document.body);
							if(o.result == "success"){
					        	nui.alert(titleText + "成功","系统提示",function(){
					        		CloseWindow("ok");
					        	});
							}else{
								nui.alert("提交失败，请联系信息技术部人员！","系统提示", function(action){
								    CloseWindow("ok");
								});
							}
						},
						error: function(jqXHR, textStatus, errorThrown){
							alert(jqXHR.responseText);
						}
			  		})  
	            	saveData(json);
	            }
	        });
			 
		}
    	
    	 function onCancel(e) {
            CloseWindow("cancel");
        }
        //标准方法接口定义
        function CloseWindow(action) {           
            if (window.CloseOwnerWindow) return window.CloseOwnerWindow(action);
            else window.close();            
        }
        

   //科学计数法转普通计数法
	function doIt(e){
		var singlePrice = new Number(e.value)+'';
		return singlePrice;
	}
    </script></body>
</html>

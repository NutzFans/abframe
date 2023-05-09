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
								<td>
									<input name="verifyCode" id="verifyCode" class="nui-textbox" style="width: 100%" />
								</td>
								<td align="right" style="width: 120px">验收审核人：</td>
								<td >
									<input name="empname" id="examineUserId"  class="nui-textbox"  style="width: 100%"/>
								</td>
							</tr>
							<tr>
								<td align="right" style="width:160px">验收部门：</td>
								<td colspan="3">
									<input name="orgname" class="nui-textbox"  style="width: 100%"  />
								</td>
							</tr>
							<tr>
						        <td align="right" style="width:160px">类型：</td>
						        <td >
						            <input id="verifyType" name="verifyType" required="true"  class="mini-radiobuttonlist" data="[{id: 1, text: '管理合同'}, {id: 2, text: '关联零星采购'}, {id: 3, text: '非条约事项验收'}]"/>
						        </td>
    						</tr>
							<tr>
								<td align="right" style="width: 120px">合同编号：</td>
									<td><input name="contractNo" id="contractNo"   class="nui-textbox" style="width: 100%"/></td>
								<td align="right" style="width: 130px">合同总价(万元)：</td>
									<td><input name="totalPrice" readOnly="readOnly" id="totalPrice" class="nui-textbox" style="width: 100%" required="true"/></td>
							</tr>
							<tr>
								<td align="right" style="width: 120px">零星采购编号：</td>
									<td><input name="purchaseCode" id="purchaseCode" class="nui-textbox"  style="width: 100%"/></td>
								<td align="right" style="width: 130px">采购金额(万元)：</td>
									<td><input name="totalAmount"  id="totalAmount" class="nui-textbox" readonly="readonly" style="width: 100%" /></td>
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
			<div >	
				<jsp:include page="/ame_common/detailFile.jsp"/>
			</div>
			
		</div>
	</div>

	<script type="text/javascript">
        nui.parse();
	    var form = new nui.Form("#form1");
	    var grid_traveldetail = nui.get("grid_traveldetail");
	    var type ;
	    var workitemid = <%=request.getParameter("workItemID")%>;
	    var processid = <%=request.getParameter("processid")%>;
	   	if(processid==null){
	   		processid = <%=request.getParameter("processInstID")%>;
	   	}
	   	var countersignUsers,titleText;
	    form.setEnabled(false); 
		loadData();
	    function loadData(){
			//流程提示信息
			var data = {"workItemID":workitemid,"processid":processid};
	   		var json = nui.encode(data);
	   		console.log(data);
	   		console.log(json);
			nui.ajax({
				url:"com.zhonghe.ame.purchase.purchaseVerify.getVerify.biz.ext",
				type:"post",
				data:json,
				contentType:"text/json",
					success:function (o){
						form.setData(o.data);
						
						// 附件信息
						var grid_0 = nui.get("grid_0");
				 		grid_0.load({"groupid":"purVerify","relationid":o.data.id});
						grid_0.sortBy("fileTime","desc");
						
						// 货物信息
						grid_traveldetail.load({'id':nui.get("id").getValue()});	
					},
					error:function(){}
			});
	    }
		
	
    	function countersign(){
        	selectOmEmployee();
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

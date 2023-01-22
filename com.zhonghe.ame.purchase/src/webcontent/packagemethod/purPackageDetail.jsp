
<%@page import="org.json.simple.JSONObject"%>
<%@page import="java.util.List"%>
<%@page import="commonj.sdo.DataObject"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@page import="com.eos.data.datacontext.UserObject"%>
<%@ page import="java.util.Map" %>
<%
	String contextPath=request.getContextPath();
 %>
<html>
<!-- 
  - Author(s): wanglinqiong
  - Date: 2016-05-12 16:17:56
  - Description:
-->
<head>
	<title>采购计划发包方式发起 </title>
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
			<fieldset id="field1" style="border: solid 1px #aaa;padding: 3px;width: 99%;">
				<legend>采购发包信息</legend>
				<form id="form1" method="post">
					<input name="files" id="fileids" class="nui-hidden"/>
					<input class="nui-hidden" name="id"/>
					<div style="padding: 5px;">
						<table style="table-layout: fixed;">
							<tr>
							<td class="form_label" align = "right">发包编号：</td>
								<td>
									<input name="packageCode" id="packageCode" readOnly="readOnly" class="nui-textbox" style="width: 300px" />
								</td>
							<td align="right" style="width:160px">立项编号：</td>
								<td><input name="proappId" id="proappId" onbuttonclick="onButtonEdit" class="nui-buttonedit" style="width: 300px" readOnly="readOnly" /></td>
							<td align="right" style="width: 120px">立项金额(万元)：</td>
								<td><input name="price" id="price" class="nui-textbox" style="width: 300px" readOnly="readOnly" /></td>
								
							</tr>
							<tr>
							
								<td align="right" style="width: 120px">项目名称：</td>
									<td><input name="projectId" id="projectName" class="nui-buttonedit" style="width: 300px" readOnly="readOnly" /></td>
								<td align="right" style="width: 100px">立项部门：</td>
									<td><input name="orgId" id="orgName" class="nui-buttonedit" style="width: 300px" readOnly="readOnly" /></td>
								<td align="right" style="width:160px">发包方式：</td>
									<td colspan="1"><input class="nui-dictcombobox"
								dictTypeId="ZH_CGFS"  id="packageType" name="packageType" shownullItem="true" readOnly="readOnly"
								style="width: 300px;" /> 
							</tr>
							<tr>
								<td align="right" style="width: 120px">是否设招标限价：</td>
									<td colspan="1"><input class="nui-dictcombobox"
								dictTypeId="ZH_BIDSTATUS" id="isPriceLimit" name="isPriceLimit" renderer="getIsPriceLimit" readOnly="readOnly"
								style="width: 300px;" /> 
								<td align="right" style="width: 130px">招标限价(万元)：</td>
									<td><input name="limitPrice" id="limitPrice"  class="nui-textbox" style="width: 300px" readOnly="readOnly" /></td>
									<td align="right" style="width:160px">申请日期：</td>
									<td><input name="appTime" id="appTime" class="nui-datepicker" style="width: 300px" readOnly="readOnly" /></td>
							</tr>
							
							<tr>
							<td class="form_label"  align="right" style="width:120px;">此种发包方式的理由：</td>
		                    <td colspan="7">    
		                        <input style="width:100%;height: 40px;" readOnly="readOnly" name="invitationReason"  id="invitationReason" class="nui-textarea"  id="technologyNeed" dictTypeId="ZH_PURCHASE" />
		                    </td>
							</tr>
							
							<tr>
							<td class="form_label"  align="right" style="width:120px;">发包范围：</td>
		                    <td colspan="7">    
		                        <input style="width:100%;height: 40px;" readOnly="readOnly" name="packageRange" id="packageRange" class="nui-textarea"  id="technologyNeed" dictTypeId="ZH_PURCHASE" />
		                    </td>
							</tr>						
						
							<tr id="one111">
					
              		<td class="form_label"  align="right" style="width:120px;">相关情况说明：</td>
                    <td colspan="7">    
                        <input style="width:100%;height: 40px;" readOnly="readOnly" name="relevantRemark" id="relevantRemark" class="nui-textarea"  id="technologyNeed" dictTypeId="ZH_PURCHASE" />
                    </td>
              	</tr>
						</table>
					</div>
				</form>
			</fieldset>

			<fieldset id="field2" style="border:solid 1px #aaa;padding:3px;">
				<legend>发包方式支持性材料附件</legend>
				<jsp:include page="/ame_common/detailFile.jsp"/>
			</fieldset>

			
			
			  <fieldset  style="height:100%; border:solid 1px #aaa;padding:3px ;width: 98%; ">
			  <legend>推荐邀请供应商信息</legend>
     <div class="fieldset-body"  style="width:100%; height:100%; margin: 0px auto">

                  
	    	<div id="grid_traveldetail" class="nui-datagrid" style="width: 80%;height: auto;" url="com.zhonghe.ame.purchase.purchasePackage.queryPurPackageSup.biz.ext" 
	    	 dataField="sups" allowCellSelect="true" showPager="false" allowCellEdit="true" multiSelect="true">
	            <div property="columns">
	            	
	                <div field="custname"  width="130" align="center" headerAlign="center"  >供应商名称
	                </div>
	               <div  field="status" width="130" align="center" headerAlign="center" renderer="dictstatus"  >是否合格供应商
	                </div>
	                <div  field="registercap"  width="130" align="center" headerAlign="center"  >注册资金(万元)
	                </div>
	                <div  field="linkman"  width="130" align="center" headerAlign="center"  >联系人
	                </div>
	                <div   field="linktel" width="130" align="center" headerAlign="center"  >联系电话
	                </div>
	            </div>
	        </div>
	        
		</div>
		<tr>
	        <td class="form_label"  align="right" id="chooseSupplierReason1" style="width:600px;">选择上述供应商原因：</td>
            <td>    
                <input readOnly="readOnly" style="width:72%;height: 40px;" id="chooseSupplierReason" name="chooseSupplierReason" class="nui-textarea"  id="chooseSupplierReason" dictTypeId="ZH_PURCHASE" />
            </td>
		</tr>
			</fieldset>


		</div>
	</div>
	<div style="text-align: center;padding: 10px;" class="nui-toolbar">
		
		<a class="nui-button" onclick="onCancel" id="saveReimbProcess" style="width: 80px;margin-right: 140px;">关闭</a>
	</div>
	<script type="text/javascript">
        nui.parse();
        <%
	   		UserObject user = (UserObject) session.getAttribute("userObject");
	   		String username = user.getUserName();
	   		String userno = user.getUserId();
	   		String userOrgName = user.getUserOrgName();
	   		String userOrgId = user.getUserOrgId();
	   		Map<String,Object> a = user.getAttributes();
	   		String empid = (String) a.get("empid");
	   		DataObject[] roles = (DataObject[])a.get("roles");

	    %>
	    var grid_traveldetail = nui.get("grid_traveldetail");
	    var id = <%=request.getParameter("id")%>;
	    init();
        function init(){
        	var json = nui.encode({"id":id});
        	nui.ajax({
		                url: "com.zhonghe.ame.purchase.purchasePackage.queryPurPackage.biz.ext",
		                data: json,
		                type: 'POST',
		                success: function (o) {
		               		 var result=o.proApp[0]
							 nui.get("appTime").setText(result.appTime);
							 nui.get("chooseSupplierReason").setValue(result.chooseSupplierReason);
							 nui.get("invitationReason").setValue(result.invitationReason);
							 nui.get("isPriceLimit").setValue(result.isPriceLimit);
							 nui.get("limitPrice").setValue(result.limitPrice);
							 nui.get("orgName").setValue(result.orgId);
							 nui.get("orgName").setText(result.orgname);
							 nui.get("packageCode").setValue(result.packageCode);
							 nui.get("packageRange").setValue(result.packageRange);
							 nui.get("packageType").setValue(result.packageType);
							 nui.get("price").setValue(result.price);
							 nui.get("proappId").setText(result.proAppCode);
							 nui.get("projectName").setText(result.projectName);
							 nui.get("relevantRemark").setValue(result.relevantRemark);
							 
							 nui.get("chooseSupplierReason").setValue(result.chooseSupplierReason);
							 var grid_0 = nui.get("grid_0");
	        				 grid_0.load({"groupid":"purcahsePackageApp","relationid":id});
							 grid_0.sortBy("fileTime","desc");
							 nui.get("grid_traveldetail").load({'id':id});
		                }
		            }); 
		  	
		}
	function addTicket(){
    	var rowS = {name: "New Row"} 
		grid_traveldetail.addRow(rowS);
    }
    function getIsPriceLimit(e){
		return nui.getDictText('ZH_BIDSTATUS',e.value);//设置业务字典值
    }
    function dictstatus(e) {
			return nui.getDictText('MIS_YN',e.value);//设置业务字典值
		}
    
       function removeTicket(){
		var rows = grid_traveldetail.getSelecteds();
        if (rows.length>0) {
            grid_traveldetail.removeRows(rows, true);
        }else{
        	nui.alert("请至少选中一条记录！");
        }
	}
    
	    function selectProjectList(){
        	//var allpurProj = purProjOutper_grid.getData();
        	var btnEdit = this;
        	nui.open({
                url:"<%=request.getContextPath() %>/ame_common/SelectProject.jsp",
                title: "选择项目",
                width: 850,
                height: 420,
                allowResize: false,
                ondestroy: function (action) {
                    if (action == "ok") {
                        var iframe = this.getIFrameEl();
                        var data = iframe.contentWindow.GetData();
                        data = nui.clone(data);    //必须
                        if (data) {
                            btnEdit.setValue(data.projectId);
                            btnEdit.setText(data.projectName);
                            //连带出项目服务客户
                           /*  var row = purProjOutper_grid.getSelected();
                            var rowData = {custid: data.custid,custname: data.custname,manager: data.userid,managername: data.manager};
                            purProjOutper_grid.updateRow(row,rowData);  */
                        }
                    }
                }
            });
        }
        
    	function onOk(){
    	
			//定义变量接受form表单数据
			var form = new nui.Form("#form1");
			var data = form.getData();
		    document.getElementById("fileCatalog").value="purcahsePackageApp";
			form2.submit();
	    }
    	function SaveData(){
			var form = new nui.Form("#form1");
			var data = form.getData();
			var grid_traveldetail = nui.get("grid_traveldetail");
			var supData = grid_traveldetail.getData();
			data.chooseSupplierReason=nui.get("chooseSupplierReason").getValue()
			data.files = nui.get("fileids").getValue();
			var json = nui.encode({'purchasePackage':data,'supData':supData});
			console.log(json);	
			 
			if(!confirm("是否提交？")){
    				return;
    			}else{	
	    	nui.ajax({
	                url: "com.zhonghe.ame.purchase.purchasePackage.addPurchasePackage.biz.ext",
	                data: json,
	                type: 'POST',
	                cache: false,
	                contentType: 'text/json',
	                success: function (text) {
	               
	                if(text.result == "1"){
	               		 nui.alert("提交成功",null,function(){
	               		 window.CloseOwnerWindow("save");
	               		 });
	                }else{
	                	nui.alert("提交失败",null,function(){
	               		 window.CloseOwnerWindow("save");
	               		 });
	                }
	                },
	                error: function (jqXHR, textStatus, errorThrown) {
	                    alert(jqXHR.responseText);
	                }
	            }); 
	            }
    	}
    	function SaveData1(){
    	}
    	
        function onButtonEdit(e) {
            var btnEdit = this;
            mini.open({
                url: "/default/purchase/project/procurementProAppList.jsp",
                title: "采购立项列表",
                width: '73%',
                height: '75%',
                ondestroy: function (action) {
                    if (action == "ok") {
                   
                        var iframe = this.getIFrameEl();
                        var data = iframe.contentWindow.GetData();
                        data = mini.clone(data);    //必须
                        if (data) {
                            btnEdit.setValue(data.id);
                            btnEdit.setText(data.proAppCode);
                            nui.get("projectName").setValue(data.projectId);
                            nui.get("projectName").setText(data.projectName);
                            nui.get("orgId").setValue(data.proAppOrgId);
                            nui.get("orgId").setText(data.proapporgname);
                            nui.get("price").setValue(data.proAppApplyPrice);
                            btnEdit.doValueChanged();
                            
                        }
                    }

                }
            });

        }
       
        function onButtonEdit1(e) {
            var btnEdit = this;
            mini.open({
                url: "/default/purchase/packagemethod/zhPurSup.jsp",
                title: "采购立项列表",
                width: '73%',
                height: '75%',
                ondestroy: function (action) {
                    if (action == "ok") {
                   
                        var iframe = this.getIFrameEl();
                        var data = iframe.contentWindow.GetData();
                        data = mini.clone(data);    //必须
                        
                        if (data) {
                        	nui.get("custname").setText(data.custname);
                        	nui.get("custname").setValue(data.custname);
                            var grid_traveldetail = nui.get("grid_traveldetail");
                          	    var row = grid_traveldetail.getSelected();
				                  	grid_traveldetail.updateRow(row,{
										linkman:data.linkman,
										status:data.status,
										custid:data.custid,
										registercap:data.registercap,
										linktel:data.linktel
				                  	});      
                           
                            
                        }
                    }

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
        

    </script></body>
</html>

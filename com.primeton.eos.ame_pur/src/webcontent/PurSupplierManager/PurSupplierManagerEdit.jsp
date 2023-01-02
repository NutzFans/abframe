<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@page import="com.eos.data.datacontext.UserObject"%>
<%
	String contextPath=request.getContextPath();
	UserObject user = (UserObject) session.getAttribute("userObject");
   	String username = user.getUserName();
   	String userno = user.getUserId();
 %>
<html>
<!-- 
  - Author(s): zyl
  - Date: 2017-02-22 19:51:17
  - Description:
-->
<head>
	<title>供应商股东和高管信息维护</title>
	<meta http-equiv="content-type" content="text/html; charset=UTF-8" />
	<script src="<%= request.getContextPath() %>/common/nui/nui.js" type="text/javascript"></script>
	<script src="../common/nui/nui.js" type="text/javascript"></script>
	<style type="text/css">
	    body{
	        margin:0;padding:0;border:0;width:100%;height:100%;overflow:hidden;
	    }
    </style>
</head>
<body>
	<div class="nui-fit">
		<form id="form1" method="post">
			<fieldset id="field1" style="border:solid 1px #aaa;padding:3px;">
				<legend>供应商信息</legend>
				<table style="table-layout:fixed;" id="table_file1">
					<tr>
						<td align="right" style="width:120px">供应商名称:</td>
						<td style="width:300px">
							<input name="purSupplier.custid" id="custid" class="nui-buttonedit" readOnly="readOnly"
								allowInput="false" required="true" onbuttonclick="selectSupplier" style="width:280px"/></td>
					</tr>
				</table>
			</fieldset>
	    	<div style="float: left;margin-left: 10px;">
		    	<span>供应商股东信息</span>
				<div style="width: 490px;">
			        <div class="nui-toolbar" style="border-bottom:0;padding:0px;">
			            <table style="width:100%;">
			            	<tr>
			                    <td style="width:20%;">
			                        <a class="nui-button" id="addBtn" iconCls="icon-add" onclick="addShareholder()">增加</a>
			                        <a class="nui-button" id="deltbtn" iconCls="icon-remove"  onclick="removeShareholder()">删除</a>
			                    </td>
			                </tr>
			             </table>           
			        </div>
			    </div>
			    <div id="datagridShareholder" class="nui-datagrid" style="width: 490px;;height:auto;" allowResize="true" dataField="purSupplierShareholders" 
			    	url="com.primeton.eos.ame_pur.PurSupplierManager.queryPurSupplierShareholder.biz.ext" showPager="false" allowCellEdit="true" allowCellSelect="true" multiSelect="true">
					<div property="columns">
						<div type="checkcolumn" width="25"></div>	
						<div field="shareholderName" width="75" align="center" headerAlign="center" allowSort="true">股东姓名
							<input property="editor" class="nui-textbox" style="width: 100%"/>
						</div>
						<div field="shareholderCardno" width="170" align="left" headerAlign="center" allowSort="true">身份证号码
							<input property="editor" class="nui-textbox" style="width: 100%"/>
						</div>
						<div field="shareholdingRatio" width="auto" align="left" headerAlign="center" allowSort="true" numberFormat="p">持股比例
							<input property="editor" class="nui-spinner" style="width: 100%" allowLimitValue="false" increment="0" showButton="false"/>
						</div>
						<div field="comment" width="140" align="left" headerAlign="center" allowSort="true">备注（持股期间+比例）
							<input property="editor" class="nui-textarea" style="width: 100%"/>
						</div>
					</div>
				</div>
			</div>
			<div style="float: left;margin-left: 10px;">
				<span>供应商高管信息</span>
				<div style="width: 520px;">
			        <div class="nui-toolbar" style="border-bottom:0;padding:0px;">
			            <table style="width:100%;">
			            	<tr>
			                    <td style="width:20%;">
			                        <a class="nui-button" id="addBtn" iconCls="icon-add" onclick="addExecutives()">增加</a>
			                        <a class="nui-button" id="deltbtn" iconCls="icon-remove"  onclick="removeExecutives()">删除</a>
			                    </td>
			                </tr>
			             </table>           
			        </div>
			    </div>
				<div id="datagridExecutives" class="nui-datagrid" style="width: 520px;height:auto;" allowResize="true" dataField="purSupplierExecutives" 
			    	url="com.primeton.eos.ame_pur.PurSupplierManager.queryPurSupplierExecutives.biz.ext" showPager="false" allowCellEdit="true" allowCellSelect="true" multiSelect="true">
					<div property="columns">
						<div type="checkcolumn" width="25"></div>	
						<div field="executivesName" width="75" align="center" headerAlign="center" allowSort="true">高管姓名
							<input property="editor" class="nui-textbox" style="width: 100%"/>
						</div>
						<div field="executivesCardno" width="170" align="left" headerAlign="center" allowSort="true">身份证号码
							<input property="editor" class="nui-textbox" style="width: 100%"/>
						</div>
						<div field="executivesPositions" width="auto" align="center" headerAlign="center" allowSort="true">高管职务
							<input property="editor" class="nui-textbox" style="width: 100%"/>
						</div>
						<div field="comment" width="140" align="left" headerAlign="center" allowSort="true">备注（任职期间）
							<input property="editor" class="nui-textarea" style="width: 100%"/>
						</div>
					</div>
				</div>
			</div>
		</form>
	</div>
	<div style="text-align:center;padding:10px;" class="nui-toolbar">
		<a class="nui-button" onclick="onOk" style="width:60px;margin-right:20px;" id="sureButton">保存</a>
		<a class="nui-button" onclick="onCancel('cancel')" style="width:60px;" id="canelButton">关闭</a>
	</div>
	<script type="text/javascript">
        nui.parse();
        var form = new nui.Form("form1");
        //供应商股东
		var datagridShareholder = nui.get("datagridShareholder");
		//供应商高管
		var datagridExecutives = nui.get("datagridExecutives");
		//供应商ID
		var custid = "";
		//供应商简称
		var suppliersname = "";
        var closeReload = false;
        
        function SetData(data){
        	data = nui.clone(data);
        	if(data.action == "edit"){
        		//alert(nui.encode(data.custid));
        		//alert(nui.encode(data.custname));
        		//alert(nui.encode(data.suppliersname));
        		nui.get("custid").setValue(data.custid);
        		nui.get("custid").setText(data.custname);
        		suppliersname = data.suppliersname;
        		var json = {"criteria": {"_expr": [{"_property": "custid","_value": data.custid}]},"fenYe": "false"};
        		datagridShareholder.sortBy("shareholderName","asc");
        		datagridShareholder.load(json);
        		var json2 = {"criteria": {"_expr": [{"_property": "custid","_value": data.custid}]},"fenYe": "false"};
        		datagridExecutives.sortBy("executivesName","asc");
        		datagridExecutives.load(json2);
        	}
        }
        function selectSupplier(){
        	var btnEdit = this;
            nui.open({
                url:"<%=request.getContextPath() %>/ame_pur/PurSupplier/SelectSupplier.jsp",
                title: "选择供应商",
                width: 850,
                height: 475,
                ondestroy: function (action) {
                    if (action == "ok") {
                        var iframe = this.getIFrameEl();
                        var data = iframe.contentWindow.GetData();
                        data = nui.clone(data);
                        btnEdit.setValue(data.custid);
                        btnEdit.setText(data.custname);
                        custid = data.custid;
                        suppliersname = data.suppliersname;
                    }
                }
            });
        }
        
        //新增股东信息
        function addShareholder(){
        	var newRow = { "name": "New Row"};
	        datagridShareholder.addRow(newRow, 0);
        }
        
        //删除股东信息
        function removeShareholder(){
        	var rows = datagridShareholder.getSelecteds();
        	if (rows.length > 0) {
        		datagridShareholder.removeRows(rows, false);
        	}else{
        		nui.alert("请至少选择一行！");
        	}
        }
        
        //新增高管信息
        function addExecutives(){
        	var newRow = { "name": "New Row"};
	        datagridExecutives.addRow(newRow, 0);
        } 
        
        //删除高管信心
        function removeExecutives(){
        	var rows = datagridExecutives.getSelecteds();
        	if (rows.length > 0) {
        		datagridExecutives.removeRows(rows, false);
        	}else{
        		nui.alert("请至少选择一行！");
        	}
        }
        
        //保存数据
        function onOk(){
        	if(form.validate()){
	        	var data = form.getData();
	        	var custid = nui.get("custid").getValue();
	        	var custname = nui.get("custid").getText();
	        	var shareholders = datagridShareholder.getData();
	        	var executives = datagridExecutives.getData();
	        	for(var i = 0;i < shareholders.length;i ++){
	        		if(!shareholders[i].shareholderName){
	        			nui.alert("股东姓名不能为空！");
	        			return;
	        		}
	        		if(!shareholders[i].shareholderCardno){
	        			nui.alert("股东身份证号码不能为空！");
	        			return;
	        		}
	        		if(!shareholders[i].shareholdingRatio){
	        			nui.alert("持股比例不能为空！");
	        			return;
	        		}
	        	}
	        	for(var i = 0;i < executives.length;i ++){
	        		if(!executives[i].executivesName){
	        			nui.alert("高管姓名不能为空！");
	        			return;
	        		}
	        		/* if(!executives[i].executivesCardno){
	        			nui.alert("高管身份证号码不能为空！");
	        			return;
	        		} */
	        		if(!executives[i].executivesPositions){
	        			nui.alert("高管职务不能为空！");
	        			return;
	        		}
	        	}
	        	data = nui.clone(data);
	        	data.custid = custid;
	        	data.custname = custname;
	        	data.suppliersname = suppliersname;
	        	data.shareholders = shareholders;
	        	data.executives = executives;
	        	var shareholdersChanged = datagridShareholder.getChanges();
	        	var executivesChanged = datagridExecutives.getChanges();
	        	data.shareholdersChanged = shareholdersChanged;
	        	data.executivesChanged = executivesChanged;
				var json = nui.encode(data);
				nui.confirm("确定要保存吗？","系统提示",function(o){
					if(o=="ok"){
						nui.get("sureButton").disable();
			            nui.ajax({
			                url: "com.primeton.eos.ame_pur.PurSupplierManager.editPurSupplierManager.biz.ext",
							type: 'POST',
							data: json,	
							contentType: 'text/json',
			                success: function (o) {
			                	if(o.exception == null){
			                		nui.alert("保存成功！",null,function(){
			                			CloseWindow("ok");
			                		});
			                	}else{
			                		nui.alert("保存失败！");
			                	}
			               	}
						});
					}
				});
			}else{
				nui.alert("供应商名称不能为空！");
			}
        }
        
        
        
        
        
        
        
        
        
        
        
        
        
        function onCancel(){
        	var data = form.getData();
        	if(data){
	        	nui.showMessageBox({
		            title: "关闭提示",
		            iconCls: "nui-messagebox-question",
		            buttons: ["yes", "no"],
		            message: "是否关闭？",
		            callback: function (action) {
		                if(action=="yes"){
		                	if(closeReload){
		                		CloseWindow("ok");
		                	}else{
			                	CloseWindow("cancel");
		                	}
		                }
		            }
		        });
			}else{
				CloseWindow("cancel");
			}
        }
        
        //标准方法接口定义
        function CloseWindow(action) {
            if (action == "close" && form.isChanged()) {
                if (confirm("数据被修改了，是否先保存？")) {
                    return false;
                }
            }
            if (window.CloseOwnerWindow) {
            	if(closeReload){
            		action = "ok";
            	}
	            return window.CloseOwnerWindow(action);
            }else{
	            window.close();            
            } 
        }
    </script>
</body>
</html>
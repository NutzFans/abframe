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
  - Author(s): mengyy
  - Date: 2017-04-28 10:35:39
  - Description:
-->
<head>
<title>选择变更项目</title>
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
			<fieldset id="kkk" style="border:solid 0px #aaa;padding:3px;">
				<div style="padding:5px;">
					<table style="table-layout:fixed;">
						<tr>
							<td align="right" width="100px">项目名称：</td>
							<td>
								<input id="projectno" class="nui-buttonedit" 
									emptyText="请选择要变更的服务项目"  onbuttonclick="selectProjectList" allowInput="false" style="width:200px"  />
							</td>
						</tr>
						<tr>
							<td align="right" width="100px">供应商名称：</td>
							<td>
								<input id="custid" class="nui-buttonedit" 
									emptyText="请选择要变更的供应商"  onbuttonclick="selectSupplier" allowInput="false" style="width:200px"  />
							</td>
						</tr>
					</table>
				</div>
			</fieldset>
		</form>
	</div>
	<div style="text-align:center;padding:10px;" class="nui-toolbar">
		<a class="nui-button" onclick="onOk" style="width:60px;margin-right:20px;" id="sureButton">保存</a>
		<a class="nui-button" onclick="onCancel('cancel')" style="width:60px;" id="canelButton">关闭</a>
	</div>
	
	<script type="text/javascript">
		nui.parse();
		var form = new nui.Form("form1");
		form.setChanged(false);
		var map = null;
			
		function SetData(data){
	    	data = nui.clone(data);
	    	map = data;
    	}
    	
    	/**
    	 * 选择项目
    	 */
    	function selectProjectList(){
        	var btnEdit = this;
        	nui.open({
        		//2017年03月14去掉过滤条件?preSettle=preSettle（PS：项目变更时，想更换至别人负责的项目时被限制了，所以去掉。）
                url:"<%=request.getContextPath() %>/ame_common/SelectProject.jsp?preSettle=bukongzhi",
                title: "选择项目",
                width: 860,
                height: 490,
                allowResize: false,
                ondestroy: function (action) {
                    if (action == "ok") {
                        var iframe = this.getIFrameEl();
                        var data = iframe.contentWindow.GetData();
                        data = nui.clone(data);    //必须
                        if (data) {
                        	//alert(nui.encode(data));
                        	if(data.projectStatus == "N"){
                        		nui.alert("不能选择状态为【结项关闭】的项目！");
                        		return;
                        	}else{
	                            btnEdit.setValue(data.projectno);
	                            btnEdit.setText(data.projectName);
                        	}
                        }
                    }
                }
            });
        }
        
	    /**
	     * 保存
	     */
	    function onOk(){
	    	if(form.validate()){
				//新项目名称
				var projectno = nui.get("projectno").getValue();
				var projectname = nui.get("projectno").getText();
				var custid = nui.get("custid").getValue();
				var custname = nui.get("custid").getText();
				if(projectno==null && custid == null){
					alert("请在选择项目或者供应商之后在进行操作!");
					return;
				}
				if(projectno=="" && custid == ""){
					alert("请在选择项目或者供应商之后在进行操作!");
					return;
				}
				var o = form.getData();
				var masg = "本次操作将符合查询条件的项目变更到指定项目:<br/>"+projectname+"("+projectno+"),<br/>供应商:"+custname+"<br/>确认执行此操作？";
		    	var json = nui.encode({"projectno": projectno,"projectname":projectname,"custid": custid,"custname":custname,"map": map.criteria});
		    	if(projectno==null||projectno==""){
		    		masg = "本次操作将符合查询条件的项目变更到指定供应商:<br/>"+custname+"<br/>确认执行此操作？";
		    	}
		    	if(custid==null||custid==""){
		    		masg = "本次操作将符合查询条件的项目变更到指定项目:<br/>"+projectname+"("+projectno+")"+"<br/>确认执行此操作？";
		    	}
	    		nui.confirm(masg, "确定？",
		            function (action) {            
		                if (action == "ok") {
					    	form.loading("数据处理中...");
				        	nui.ajax({
				        		url: "com.primeton.eos.ame_common.ameAttendance.changeProjectByMap.biz.ext",
				                data: json,
				                type: 'POST',
				                cache: false,
				                contentType: 'text/json',
				                success: function (o) {
				                	form.unmask();
				                	o = nui.clone(o);
				                	var returnJson = nui.decode(o);
									if(returnJson.exception == null){
				                		nui.alert("操作成功！共更新"+o.total+"条数据！","操作提示",function(){
				                			CloseWindow("ok");
				                		});
				                	}else{
				                		nui.alert("考勤记录变更失败！");
				                	}
				                },
				                error: function (jqXHR, textStatus, errorThrown) {
				                    alert(jqXHR.responseText);
				                    CloseWindow();
				                }
				        	});
				        }
					}
				);
	    	}else{
	    		return;
	    	}
	    }
	    
	    function onCancel(e) {
        	if(form.isChanged()){
	        	nui.showMessageBox({
		            title: "关闭提示",
		            iconCls: "nui-messagebox-question",
		            buttons: ["yes", "no"],
		            message: "是否关闭？",
		            callback: function (action) {
		                if(action == "yes"){
		                	CloseWindow("cancel");
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
            if (window.CloseOwnerWindow) return window.CloseOwnerWindow(action);
            else window.close();            
        }
        
        
        function selectSupplier(e){
        	var btnEdit = this;
    		nui.open({
    			url:"<%=request.getContextPath() %>/ame_pur/PurSupplier/SelectSupplier.jsp",
                title: "选择供应商",
                width: 600,
                height: 400,
                ondestroy: function (action) {
                	if (action == "ok") {
						var iframe = this.getIFrameEl();
						var data = iframe.contentWindow.GetData();
						data = nui.clone(data);    //必须
						btnEdit.setText(data.custname);
	                	btnEdit.setValue(data.custid);
					}
					nui.get("custid").validate();
                }
    	 	})
    	}
        
	</script>
	
</body>
</html>
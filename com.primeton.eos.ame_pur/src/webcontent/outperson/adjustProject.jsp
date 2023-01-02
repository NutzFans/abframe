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
  - Date: 2017-01-06 11:23:31
  - Description:
-->
<head>
	<title>调整项目</title>
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
				<input class="nui-hidden" name="oldPurProjOutper.projoutid" id="oldprojoutid" />
				<input class="nui-hidden" name="newPurProjOutper.outperno" id="outperno" />
				<input class="nui-hidden" id="outpername" />
				<legend>原项目</legend>
				<div style="padding:5px;">
					<table style="table-layout:fixed;">
						<tr>
							<td align="right" width="100px">项目名称：</td>
							<td id="oldprojectname" style="width: 220px"></td>
							<td align="right" style="width:100px;">所属客户：</td>
							<td id="oldmiscustname" style="width: 220px"></td>
						</tr>
						<tr>
							<td align="right" style="width:100px;">服务开始日期：</td>
							<td id="oldstartdate"></td>
							<td align="right" style="width:100px;">预计结束日期：</td>
							<td id="oldexpenddate"></td>
						</tr>
						<tr>
							<td align="right" style="width:100px;">离场日期：</td>
							<td>
								<input name="oldPurProjOutper.actenddate" id="oldactenddate" class="nui-datepicker" style="width: 100px;" onblur="inputActenddate()" required="true" />
							</td>
							<td></td>
							<td></td>
						</tr>
					</table>
				</div>
			</fieldset>
			<fieldset id="field2" style="border:solid 1px #aaa;padding:3px;">
				<legend>更换的新项目</legend>
				<div style="padding:5px;">
					<table style="table-layout:fixed;">
						<tr>
							<td align="right" width="100px">项目名称：</td>
							<td>
								<input name="newPurProjOutper.projectno" id="projectno" class="nui-buttonedit" 
									emptyText="请选择服务项目"  onbuttonclick="selectProjectList" allowInput="false" style="width:200px" required="true" />
							</td>
							<td align="right" style="width:100px;">汇报对象：</td>
							<td>
								<input name="newPurProjOutper.manager" id="manager" class="nui-buttonedit" 
									emptyText="请选择汇报对象" onbuttonclick="selectOrgname" allowInput="false" required="true"/>
							</td>
						</tr>
						<tr>
							<td align="right" style="width:100px;">入场日期：</td>
							<td>
								<input name="newPurProjOutper.startdate" id="startdate" onblur="blurStartdate()" class="nui-datepicker" style="width: 100px;" required="true" />
							</td>
							<td align="right" style="width:100px;">预计离场日期：</td>
							<td>
								<input name="newPurProjOutper.expenddate" id="expenddate" onblur="blurExpenddate()" class="nui-datepicker" style="width: 100px;" required="true" />
							</td>
						</tr>
						<tr>
							<td align="right" style="width:100px;">投入比重：</td>
							<td>
								<input name="newPurProjOutper.inputratio" id="inputratio" class="nui-spinner" minValue="0" 
									maxValue="2" changeOnMousewheel="false" showButton="false" 
									inputStyle="text-align: right" style="width: 50px" required="true" />
							</td>
							<td></td><td></td>
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
		var suppliersname = "";
		
		function SetData(data){
	    	data = nui.clone(data);
	    	if(data.action == "adjustProject"){
		    	nui.get("outperno").setValue(data.outperno);
		    	nui.get("outpername").setValue(data.outpername);
		    	nui.get("oldprojoutid").setValue(data.projoutid); 
		    	nui.get("expenddate").setValue(data.expenddate);
		    	document.getElementById("oldstartdate").innerHTML = data.startdate;
		    	document.getElementById("oldexpenddate").innerHTML = data.expenddate;
		    	//投入比重默认为1
		    	nui.get("inputratio").setValue(1);
	        	document.getElementById("oldprojectname").innerHTML= data.projectname == null ? "" : data.projectname;
	        	document.getElementById("oldmiscustname").innerHTML= data.custname == null ? "" : data.custname;
	        	suppliersname = data.suppliersname;
    		}
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
                        	//alert(nui.encode(data));//manager//managerdept
                        	if(data.projectStatus == "N"){
                        		nui.alert("不能选择状态为【结项关闭】的项目！");
                        		return;
                        	}else{
                        		nui.get("manager").setValue(data.userid);
                        		nui.get("manager").setText(data.manager);
	                            btnEdit.setValue(data.projectno);
	                            btnEdit.setText(data.projectName);
                        	}
                        }
                    }
                }
            });
        }
        
        /**
         * 选择汇报对象
         */
        function selectOrgname(){
	    	var btnEdit = this;
        	nui.open({
                url:"<%=request.getContextPath() %>/machine/SelectEmployee.jsp",
                title: "选择汇报对象",
                width: 850,
                height: 410,
                allowResize: false,
                ondestroy: function (action) {
                    if (action == "ok") {
                        var iframe = this.getIFrameEl();
                        var data = iframe.contentWindow.GetData();
                        data = nui.clone(data);    //必须
                        if (data) {
                            btnEdit.setValue(data.userid);
                            btnEdit.setText(data.empname);
                        }
                    }
                }
            });
	    }
	    
	    /**
	     * 录入原项目离场日期
	     */
	    function inputActenddate(){
	    	//原项目的离场日期
	    	var oldactenddate = nui.get("oldactenddate").getValue();
	    	//原项目的开始服务日期
	    	var oldstartdate = document.getElementById("oldstartdate").innerHTML;
	    	if(oldactenddate && oldstartdate){
		    	if(oldactenddate < oldstartdate){
		    		nui.alert("原项目的离场日期不能小于原项目的服务开始日期！",null,function(){
			    		nui.get("oldactenddate").setValue("");
		    		});
		    		return;
		    	}else{
			    	oldactenddate = nui.clone(oldactenddate);
			    	//离场日期的下一天
			    	var nextdate = oldactenddate;
			    	nextdate.setTime(oldactenddate.getTime()+24*60*60*1000);
			    	var startdate = nextdate.getFullYear()+"-" + (nextdate.getMonth()+1) + "-" + nextdate.getDate();
			    	nui.get("startdate").setValue(startdate);
			    	//预计离场日期
			    	var expenddate = nui.get("expenddate").getValue();
			    	//离场日期
			    	var oldactenddate2 = nui.get("oldactenddate").getValue();
			    	if(oldactenddate2 > expenddate){
			    		nui.get("expenddate").setValue("");
			    	}
		    	}
		    }
	    }
	    
	    /**
	     * 保存
	     */
	    function onOk(){
	    	if(form.validate()){
		    	var outperno = nui.get("outperno").getValue();
				var outpername = nui.get("outpername").getValue();
				//原项目名称
				var oldprojectname = document.getElementById("oldprojectname").innerHTML;
				//原项目离场日期
				var oldactenddate = nui.get("oldactenddate").getFormValue();
				//新项目名称
				var projectname = nui.get("projectno").getText();
				//新项目入场日期
				var startdate = nui.get("startdate").getFormValue();
				//新项目预计离场日期
				var expenddate = nui.get("expenddate").getFormValue();
				//新项目汇报对象
				var manager = nui.get("manager").getText();
				var o = form.getData();
				var oldPurProjOutper = o.oldPurProjOutper;
				var newPurProjOutper = o.newPurProjOutper;
				//变更信息
				var updateMessage = "合作伙伴【"+ suppliersname +"】的外包人员【" + outpername + "】从【" + oldprojectname + "】调整到【" + projectname + 
					"】，原项目离场日期是：" + oldactenddate + "，新项目入场日期是：" + startdate + "，预计离场日期是：" + 
					expenddate + "，汇报对象是：" + manager + "。";
				updateMessage += "操作者是" + "<%=username %>" + "。";
		    	var json = nui.encode({"outperno": outperno,"outpername": outpername,"oldPurProjOutper": oldPurProjOutper,
		    		"newPurProjOutper": newPurProjOutper,"updateMessage": updateMessage});
	    		nui.confirm("确认调整项目？", "确定？",
		            function (action) {            
		                if (action == "ok") {
					    	form.loading("数据处理中...");
				        	nui.ajax({
				        		url: "com.primeton.eos.ame_pur.outperson.adjustproject.biz.ext",
				                data: json,
				                type: 'POST',
				                cache: false,
				                contentType: 'text/json',
				                success: function (o) {
				                	form.unmask();
				                	o = nui.clone(o);
				                	var returnJson = nui.decode(o);
									if(returnJson.exception == null){
				                		nui.alert("保存成功！","操作提示",function(){
				                			CloseWindow("ok");
				                		});
				                	}else{
				                		nui.alert("保存失败！");
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
	    
	    /**
	     * 投入比重
	     */
	    function checkInputratio(){
	    	var inputration = nui.get("inputratio").getValue();
	    	if(inputration < 0 || inputration >2){
	    		nui.alert("投入比重不能大于2,或小于0");
	    		//清空该文本框
	    		nui.get("inputratio").setValue();
	    	}
	    }
	    
	    /**
	     * 入场日期
	     */
	    function blurStartdate(){
	    	//离场日期 
	    	var oldactenddate = nui.get("oldactenddate").getValue();
	    	//入场日期
	    	var startdate = nui.get("startdate").getValue();
	    	//预计离场日期
	    	var expenddate = nui.get("expenddate").getValue();
	    	if(startdate <= oldactenddate){
	    		nui.alert("入场日期不能小于离场日期！");
	    		nui.get("startdate").setValue("");
	    	}
	    	if(startdate > expenddate){
	    		nui.alert("预计离场日期不能小于入场日期！");
	    		nui.get("expenddate").setValue("");
	    	}
	    }
	    
	    /**
	     * 预计离场日期
	     */
	    function blurExpenddate(){
	    	//入场日期 
	    	var startdate = nui.get("startdate").getValue();
	    	//预计离场日期
	    	var expenddate = nui.get("expenddate").getValue();
	    	if(expenddate <= startdate){
	    		nui.alert("预计离场日期不能小于入场日期！");
	    		nui.get("expenddate").setValue("");
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
        
	</script>
</body>
</html>
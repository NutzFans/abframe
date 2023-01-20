<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@page import="com.eos.data.datacontext.UserObject"%>
<%@page import="commonj.sdo.DataObject"%>
<%@page import="java.util.Map"%>
<%@ page import="java.util.HashMap" %>
<%@ page import="java.util.List" %>
<%@ page import="java.util.ArrayList" %>
<html>
<!-- 
  - Author(s): xupc
  - Date: 2019-03-05
  - Description:
-->
<head>
	<title>新增奖励基本信息</title>
	<meta http-equiv="content-type" content="text/html; charset=UTF-8" />
    <script src="<%= request.getContextPath() %>/common/nui/nui.js" type="text/javascript"></script>
</head>
<body style="width:100%;height:100%;padding:0px;margin:0px;">
<div class="nui-fit">
	<form id="form1">
		<fieldset style="border:solid 1px #aaa;padding:3px;">
			<legend >奖励基本信息</legend>
			<div style="padding:5px;">
				<table style="width:100%;">
					<tr>
						<td align="right" >推荐人:</td>
	            		<td style="width:150px;" align="left">
	            			<input name="reward.referrer" id="referrer" class="nui-buttonedit" allowInput="false" onbuttonclick="selectEmp" required="true"/>    
	            		</td>
	            		<td align="right" style="width:100px;">被推荐人姓名 :</td>
	            		<td style="width:150px;" align="left">    
	                		<input name="reward.resumeid" id="resumeid" class="nui-buttonedit" allowInput="false" required="true" onbuttonclick="addRow"  />
	            		</td>
	            		<td align="right" style="width:100px;">奖励事件：</td>
		            	<td align="left">
				 		 	<input name="reward.eventtype" id="eventtype" class="nui-dictcombobox" dictTypeId="REFFER_EVENTTYPE" required="true" />
						</td>
					</tr>
					<tr>
					    <td align="right" style="width:120px;">招聘需求编号：</td>
	                	<td align="left" >    
	                    	<input name="reward.recruitid" id="recruitid" class="nui-buttonedit" onbuttonclick="showEmployee" />
	                	</td>
						<td align="right" >奖励金额:</td>
		            	<td style="width:150px;" align="left">
		            		<input name="reward.rewardmoney" id="rewardmoney" class="nui-textbox" allowInput="true"  required="true" maxLength="10"/>    
		            	</td>
		            	<td align="right" style="width:100px;">处理状态：</td>
		            	<td align="left">
				 		 	<input name="reward.rewardstatus" id="rewardstatus" class="nui-dictcombobox" dictTypeId="AME_REWARDSTATUS" required="true" value="0"/>
						</td>
	            	</tr>
	            	<tr>
		            	<td align="right">确认发放日期：</td>
						<td align="left">
							<input name="reward.surepaydate" class="nui-datepicker" id="surepaydate" />
						</td>
		            	<td align="right">发放日期：</td>
						<td align="left">
							<input name="reward.paydate" class="nui-datepicker" id="paydate"/>
						</td>
					</tr>
					<tr>
					<td align="right">受益部门：</td>
						<td colspan="4" align="left"> 
						<input name="reward.beneforgid" id="beneforgid" class="nui-combobox" 
							required="true" url="com.primeton.rdmgr.labor.labormgr.getAllOrgs.biz.ext" filterType="like" 
							textField="orgname" valueField="orgid" dataField="allorgs" valueFromSelect="true"  style="width: 550px"
							allowInput="true"  />
						</td>
					</tr>	
					<tr>	
						<td align="right">备注：</td>
						<td  align="left" colspan="4">
							<input name="reward.rewardremark" class="nui-textbox" id="rewardremark" style="width: 550px"/>
						</td>
	            	</tr>
				</table>
			</div>
		</fieldset>
	</form>
</div>	
<div style="text-align: center;padding: 10px;" class="nui-toolbar">
	<a class="nui-button" onclick="onOk()" id="saveExpRei" iconCls="icon-ok" style="width: 60px;margin-right: 20px;">提交</a>
	<a class="nui-button" onclick="onCancel('cancel')" id="closeReward" iconCls="icon-cancel" style="width: 60px;margin-right: 20px;">关闭</a>
</div>
</body>
<script type="text/javascript">
    <% 
		UserObject user = (UserObject)session.getAttribute("userObject");
		String nowuserid = user.getUserId();
		String nowusername = user.getUserName();
	%>
	var nowuserid='<%=nowuserid %>';
	var nowusername='<%=nowusername%>';
	nui.parse();
	var form = new nui.Form("form1");
	function onOk(){
		if(form.validate()){
		    var reward = form.getData();
	        var json = nui.decode({"reward":reward.reward});
	        nui.confirm("确定要新增此条内推奖励信息？","新增内推奖励信息提示",function(action){
			  if(action=="ok"){
	            form.mask("内推奖励信息正在录入，请稍等...");
	            nui.ajax({
	                url: "com.primeton.eos.ame_permanage.ame_becomeregulae.addRewardMoney.biz.ext",
					type: 'POST',
					data: json,	
					contentType: 'text/json',
	                success: function (o){
	                    form.unmask();
	                	if(o.result == 0){
	                		nui.alert("新增失败，重新添加！");
	                		return;
	                	}else{
							CloseWindow("ok")
	                	} 
	                }
	            });
	         }
	      });	    
		}else{
			nui.alert("请检查表单的完整性!");
			return;
		}
	}
	function onCancel(e) {
    	var data = form.getData();
    	if(data){
        	nui.showMessageBox({
	            title: "关闭提示",
	            iconCls: "nui-messagebox-question",
	            buttons: ["yes", "no"],
	            message: "是否关闭？",
	            callback: function (action) {
	                if(action=="yes"){
	                	CloseWindow("cancel");
	                }
	            }
	        });
		}else{
			CloseWindow("cancel");
		}
    }
	function CloseWindow(action){
		if (action == "close" && form.isChanged()){
			if (confirm("内推奖励被修改了，是否先保存？")){
				return false;
			}
		}
		if (window.CloseOwnerWindow) return window.CloseOwnerWindow(action);
		else window.close();
	}
	function selectEmp(){
		var btnEdit = this;
        nui.open({
            url: "<%=request.getContextPath() %>/machine/SelectEmployee.jsp",
                title: "选择人员",
                width: 430,
                height: 400,
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
	function showEmployee(e){
		var btnEdit = this;
	    nui.open({
			url:"/default/abframe/org/recruit/SelectRecruitno.jsp",
			title: "选择招聘需求编号",
			width: 780,
			height: 400,
			ondestroy: function (action) {
				if (action == "ok") {
					var iframe = this.getIFrameEl();
					var data = iframe.contentWindow.GetData();
					data = nui.clone(data);   //必须
					btnEdit.setValue(data.recruitid);
		            btnEdit.setText(data.recruitno);
				}
			}
		});
	}
	function addRow(e){
	     var btnEdit = this;
  	     nui.open({
			url:"/default/ame_permanage/ame_interview/selectResumes.jsp?",
            title: "选择简历",
            width: 600,
            height: 400,
            ondestroy: function (action) {
            	if (action == "ok") {
					var iframe = this.getIFrameEl();
					var data = iframe.contentWindow.GetData();
					data = nui.clone(data);    //必须
					console.log(data);
					if(data.length >1){
					    nui.alert("只允许添加一条被推荐人");
	                	return;
					}
					btnEdit.setValue(data[0].resumeid);
		            btnEdit.setText(data[0].empname);
				}
            }
    	})
  	}
</script>
</html>
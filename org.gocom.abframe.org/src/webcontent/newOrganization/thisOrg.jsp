<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@include file="/common/common.jsp"%>
<html>
<!-- 
  - Author(s): 张一博
  - Date: 2018-03-30 13:28:47
  - Description:
-->
<head>
<title>本级机构</title>
<script src="<%= request.getContextPath() %>/common/nui/nui.js" type="text/javascript"></script>
<style type="text/css">
    body{
        margin:0;padding:0;border:0;width:100%;height:100%;overflow:hidden;
    }
</style>
</head>
<body>
<div class="nui-fit">
	<div title="机构信息" style="padding: 30px 0;">
	 	<form id="form1" method="post" >
	 		<input class="nui-hidden" name="oOrg.orgid"/>
	 		<input class="nui-hidden" name="oOrg.updator"/>
	 		<input class="nui-hidden" name="oOrg.subcount"/>
	 		<input class="nui-hidden" name="oOrg.orglevel"/>
	 		<input class="nui-hidden" name="oOrg.orgseq"/>
	 		<input class="nui-hidden" name="oOrg.orgmanager"/>
	 		<input class="nui-hidden" id="oldOrgtype" name="oOrg.oldOrgtype"/>
	 		<input class="nui-hidden" id="isleaf" name="oOrg.isleaf"/>
	 		<input class="nui-hidden" id="lastOrgid" name="oOrg.omOrganization.orgid"/>
	 		<input class="nui-hidden" name="oOrg.omOrganization.orgseq"/>
	 		<input class="nui-hidden" name="oOrg.omOrganization.orglevel"/>
        	<table style="table-layout:fixed;" id="table_file1">
	            <tr>
					<td align="right" style="width:110px">机构名称：</td>
					<td>
						<input class="nui-textbox" name="oOrg.orgname"  required="true" style="width:250px"/>
					</td>
					<td align="right" style="width:110px">机构代码：</td>
					<td>
						<input class="nui-textbox" name="oOrg.orgcode"  id="orgcode" style="width:250px" onvalidation="judge(e)"/>
					</td>
				</tr>
				<tr>
					<td align="right" style="width:100px">上级机构：</td>
					<td>
						<input class="nui-textbox" name="oOrg.omOrganization.orgname" style="width:250px"/>
					</td>
					<td align="right" style="width:100px">机构类型：</td>
					<td>
						<input class="nui-dictcombobox"  id="orgtype1" dictTypeId="ABF_ORGTYPE" required="true"  name="oOrg.orgtype"style="width:250px"/>
					</td>
				</tr>
				<tr>
					<td align="right" style="width:100px">机构等级：</td>
					<td>
						<input class="nui-dictcombobox" id="orgdegree1" dictTypeId="ABF_ORGDEGREE" name="oOrg.orgdegree" required="true"  style="width:250px"/>
					</td>
					<td align="right" style="width:100px">机构状态：</td>
					<td>
						<input class="nui-dictcombobox" id ="status1" dictTypeId="ABF_ORGSTATUS"  required="true" name="oOrg.status" style="width:250px" />
					</td>
				</tr>
				<tr>
					<td align="right" style="width:100px">排列顺序：</td>
					<td>
						<input class="nui-textbox" name="oOrg.sortno"  style="width:250px"/>
					</td>
					<td align="right" style="width:100px">所属地域：</td>
					<td>
						<input class="nui-textbox" name="oOrg.area" style="width:250px" />
					</td>
				</tr>
				<tr>
					<td align="right" style="width:100px">机构地址：</td>
					<td>
						<input class="nui-textbox" name="oOrg.orgaddr"  style="width:250px" />
					</td>
					<td align="right" style="width:100px">邮编：</td>
					<td>
						<input class="nui-textbox" name="oOrg.zipcode" style="width:250px" />
					</td>
				</tr>
				<tr>
					<td align="right" style="width:100px">机构主管岗位：</td>
					<td>
						<input name="oOrg.manaposition"  id="lookup2" class="nui-textboxlist"  searchField="name" style="width:250px"
        						url="org.gocom.abframe.org.organization.OrgManager.queryPosiByTemplate.biz.ext" value="" text=""
        						textField="EMPNAME" valueField="USERID" />
					</td>
					<td align="right" style="width:100px">机构主管人员：</td>
					<td>
						<input id="manager" class="nui-buttonedit" name="oOrg.managername" style="width:250px;"  onbuttonclick="showEmployee" showClose="false" allowInput="false"/>
						<input id="managers" class="nui-hidden" name="oOrg.managerid" />
					</td>
				</tr>
				<tr>
					<td align="right" style="width:100px">业务合伙人：</td>
					<td>
						<input id="EMPNAME" name="oOrg.busiparter" class="nui-textboxlist"  searchField="name" style="width:250px;"
							url="com.primeton.eos.ame_budget.budgetOrgManager.queryEmpByName.biz.ext" 
							textField="EMPNAME" valueField="USERID" />
					</td>
					<td align="right" style="width:100px">分管领导：</td>
					<td>
						<input id = "leadname" name="oOrg.repleader" class="nui-textboxlist"  searchField="name" style="width:250px;"
							url="com.primeton.eos.ame_budget.budgetOrgManager.queryEmpByName.biz.ext" 
							textField="EMPNAME" valueField="USERID" />
					</td>
				</tr>
				<tr>
					<td align="right" style="width:100px">机构主管审批层级：</td>
					<td>
						<input class="nui-dictcombobox" dictTypeId="AME_FEELEVEL" id="approlevel1" name="oOrg.approlevel" required="true" multiSelect="true" style="width:250px" />
					</td>
					<td align="right" style="width:100px">部门分类：</td>
					<td>
						<input class="nui-dictcombobox" id ="branch" dictTypeId="ZH_BRANCH"   name="oOrg.branch" style="width:250px" />
					</td>
				</tr>
				<tr>
					<td align="right" style="width:100px">是否本部：</td>
					<td>
						<input class="nui-dictcombobox" id="judge" dictTypeId="ZH_JUDGE" name="oOrg.judge"   style="width:250px"/>
					</td>
					<td align="right" style="width:100px">是否职能部门：</td>
					<td>
						<input class="nui-dictcombobox" id ="functionperson" dictTypeId="ZH_LABOR_DISPATCHING_FLAG"  name="oOrg.functionperson" style="width:250px" />
					</td>
				</tr>
				<tr>
					<td align="right" style="width:100px">联系人：</td>
					<td>
						<input class="nui-textbox" name="oOrg.linkman"  style="width:250px;"/>
					</td>
					<td align="right" style="width:100px">联系电话：</td>
					<td>
						<input class="nui-textbox" name="oOrg.linktel" style="width:250px"/>
					</td>
				</tr>
				<tr>
					<td align="right" style="width:100px">生效日期：</td>
					<td>
						<input class="nui-datepicker" name="oOrg.startdate" style="width:250px"/>
					</td>
					<td align="right" style="width:100px">失效日期：</td>
					<td>
						<input class="nui-datepicker" name="oOrg.enddate" style="width:250px"/>
					</td>
				</tr>
				<tr>
					<td align="right" style="width:100px">网站地址：</td>
					<td>
						<input class="nui-textbox" name="oOrg.weburl" style="width:250px" />
					</td>
					<td align="right" style="width:100px">电子邮件：</td>
					<td>
						<input class="nui-textbox"  name="oOrg.email" style="width:250px" />
					</td>
				</tr>
				<tr>
					<td align="right" style="width:100px">备注：</td>
					<td colspan="3">
						<input class="nui-textbox" name="oOrg.remark" style="width:610px"/>
					</td>
				</tr>
        	</table>
        </form>
  	</div>
</div>
<div style="text-align:center;padding:10px;" class="nui-toolbar">
	<a class="nui-button" onclick="ok()" iconCls="icon-ok"  style="width:60px;margin-right:20px;">保存</a>
	<a class="nui-button closBtn" onclick="onCancel('cancel')" iconCls="icon-cancel" style="width: 60px;margin-right: 20px;">关闭</a>
</div>
</body>
<script type="text/javascript">
	nui.parse();
	
	var orgid = '<%=request.getParameter("orgid") %>';
	var o = '<%=request.getParameter("o") %>';
	var status = '<%=request.getParameter("status") %>';
	var tiaoshu=0;
	if(status == null || status == 'null'){
		$(".closBtn").hide();
	}
	var form = new nui.Form("form1");
	if(orgid != 0){
		nui.get("lastOrgid").setValue(orgid);
		nui.get("isleaf").setValue("y");
	}
	setData();
	function setData(){
		if(status == "null"){
			var json = {oOrg:{orgid:orgid}};
			nui.ajax({
				url: "org.gocom.abframe.org.organization.OrgManager.expandOrg.biz.ext",
	            type: "post",
	            data: json, 
	            cache: false,
	            contentType: 'text/json',
	            success: function (text) {
	            	nui.get("manager").setText(text.oOrg.managername);
	            	nui.get("manager").setValue(text.oOrg.managerid);
	            	nui.get("manager").setRequired(true);//修改时必填
	            	nui.get("orgcode").setRequired(true);//修改时必填
	            	
	            	nui.get("managers").setValue(text.oOrg.managerid);
	            	form.setData(text);
	            	nui.get("EMPNAME").setText(text.oOrg.partname);
	            	nui.get("leadname").setText(text.oOrg.leadname);
	            	nui.get("oldOrgtype").setValue(text.oOrg.orgtype);
	            }
			})
		}else if(status == "0"){
			var json = {type:"0",data:{orgid:orgid}};
			nui.ajax({
				url: "org.gocom.abframe.tools.CommonUtil.commonQueryInfo.biz.ext",
	            type: "post",
	            data: json, 
	            contentType: 'text/json',
	            cache: false,
	            success: function (text) {
	            	var json = {oOrg : {status:"running",omOrganization : { orgid:text.data.orgid, orgname:text.data.orgname,
	            			orgseq:text.data.orgseq, orglevel:text.data.orglevel
	            		}}};
	            	nui.get("orgcode").setReadOnly(true);//增加时可读
	            	
	            	form.setData(json);
	            }
			})
		}else if(status == "1"){
			var json = {oOrg:{orgid:o}};
			nui.ajax({
				url: "org.gocom.abframe.org.organization.OrgManager.expandOrg.biz.ext",
	            type: "post",
	            data: json, 
	            cache: false,
	            contentType: 'text/json',
	            success: function (text) {
	            	nui.get("manager").setRequired(true);//修改时必填
	            	nui.get("manager").setRequired(true);//修改时必填
	            	
	            	nui.get("manager").setText(text.oOrg.managername);
	            	nui.get("manager").setValue(text.oOrg.managerid);
	            	nui.get("managers").setValue(text.oOrg.managerid);
	            	form.setData(text);
	            	nui.get("EMPNAME").setText(text.oOrg.partname);
	            	nui.get("leadname").setText(text.oOrg.leadname);
	            	nui.get("oldOrgtype").setValue(text.oOrg.orgtype);
	            }
			})
		}
	}
	//保存应用信息
	function ok(){
		var form = new nui.Form("#form1");
		var data = form.getData();
		form.validate();
        if (form.isValid()==false) {
        	nui.alert("请填写必填项。")
        	return;
        }else{
        		judge1();
				if(tiaoshu==1){
  		       	nui.alert("已经存在相同的机构代码，请重新填写！");
  				return;
				}
        	save(data);
        	return;
        }
	}
	
	function save(data){
		if(status=="0"){
			if(orgid == 0){
				data.oOrg.omOrganization.orgid = null;
			}
			//新增机构信息
			nui.ajax({
				url: "org.gocom.abframe.org.organization.OrgManager.addOrg.biz.ext",
				type: 'POST',
				data:data,
				contentType: 'text/json',
	            success: function (result) {
	            	if(result.iRtn==0){
	            		if(result.wxresult){
    						nui.alert("新增成功,但机构微信企业号未能成功同步,错误原因："+result.wxresult);
    					}else{
    						nui.alert("新增成功。");
    					}
	            		CloseWindow("save");
	            	}else{
	            		nui.alert("新增失败啦，请联系信息技术部。");
	            	}
	            }
			})
		}else{
			//修改机构信息
			nui.ajax({
				url: "org.gocom.abframe.org.organization.OrgManager.modifyOrg.biz.ext",
				type: 'POST',
				data:data,
				contentType: 'text/json',
	            success: function (result) {
	            	if(result.iRtn==0){
	            		if(result.wxresult){
    						nui.alert("修改成功,但机构微信企业号未能成功同步,错误原因："+result.wxresult);
    					}else{
    						nui.alert("修改成功。");
    					}
	            		if(status == "1"){
	            			CloseWindow("save");
	            		}else{
	            			setData();
	            		}
	            		
	            	}else{
	            		nui.alert("修改失败啦，请联系信息技术部。");
	            	}
	            }
			})
		}
	}
	
	//选择机构主管人员
	function showEmployee(e) {
        var btnEdit = this;
        nui.open({
			url:"<%=request.getContextPath() %>/machine/SelectEmployee.jsp",
			title: "选择列表",
			width: 600,
			height: 400,
			ondestroy: function (action) {
				if (action == "ok") {
					var iframe = this.getIFrameEl();
					var data = iframe.contentWindow.GetData();
					data = nui.clone(data);    //必须
					if (data) {
		                btnEdit.setText(data.empname);	
		                btnEdit.setValue(data.empid);
		                nui.get("managers").setValue(data.empid);
					}
				}
			}
		});
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
	                if(action == "yes"){
	                	CloseWindow("cancel");
	                }
	            }
	        });
		}else{
			CloseWindow("cancel");
		}
    }
    
    function CloseWindow(action) {
		if (window.CloseOwnerWindow) return window.CloseOwnerWindow(action);
		else window.close();
	}
	
	
	function judge(e){
	
	
		var newvalue=e.value;
		var orgcode=nui.get("orgcode").getValue()
		var json ={orgcode1:newvalue,orgid:orgid}
		nui.ajax({
					url: "org.gocom.abframe.org.organization.OrgManager.judgeOrgCode.biz.ext",
					type: 'POST',
					data:json,
					contentType: 'text/json',
		            success: function (result) {
		            
		            	if(!result.tiao=="0"){
		            		nui.alert("已经存在相同的机构代码，请重新填写！");
		            	}
		            	
		            }
		
		})
		
		}
	function judge1(e){
		tiaoshu=0;
		var orgcode=nui.get("orgcode").getValue()
		var json ={orgcode1:orgcode,orgid:orgid}
		nui.ajax({
				url: "org.gocom.abframe.org.organization.OrgManager.judgeOrgCode.biz.ext",
				type: 'POST',
				data:json,
				async: false,
				contentType: 'text/json',
	            success: function (result) {
	            
	            	if(!result.tiao=="0"){
	          		tiaoshu=1;
	            	}
	            }
	
	})
	
	}
	
	
	
</script>
</html>
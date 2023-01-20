<%@page pageEncoding="UTF-8"%>
<%@include file="/common/common.jsp"%>
<%@include file="/common/skins/skin0/component.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@page import="com.eos.data.datacontext.UserObject"%>
<html>
<!-- 
  - Author(s): JYW
  - Date: 2019-08-26 22:59:14
  - Description:
-->
<head>
<title>Title</title>
 <meta http-equiv="content-type" content="text/html; charset=UTF-8" />
    <script src="<%= request.getContextPath() %>/common/nui/nui.js" type="text/javascript"></script>
    
</head>
<body>
	<form id="form1" method="post" >
		<input name="txEmailGrpInfo.emailGroupId" id="emailGroupId" class="nui-hidden" />
        <fieldset style="border:solid 1px #aaa;padding:3px;">
			<legend>邮件组信息</legend>
        	<div style="padding:5px;">
            	<table>
	                <tr>
	                    <td align="right" style="height: 40px;width: 130px;">邮件组账号:</td>
	                    <td style="width:160px;">    
	                       <input name="txEmailGrpInfo.emailGroupAcc" class="nui-textbox" style="width:100%"  required="true">
	                    </td>
	                    <td align="right" style="height: 40px;width:105px;">邮件组名称:</td>
	                    <td style="width:160px;">    
	                       <input name="txEmailGrpInfo.emailGrouName" class="nui-textbox" style="width:260px"  required="true">
	                    </td>
                    </tr>
                    <tr>
	                    <td align="right" style="height: 40px;">邮件组所属部门:</td>
						<td style="width:160px;">
							<input id ="tree" class="nui-treeselect" name="txEmailGrpInfo.emailGrouOrgs" expandOnLoad="0" url="com.bos.mp.common.SelectManage.queryAllOrg.biz.ext"
							textField="orgname" valueField="orgid" parentField="parentorgid" dataField="orgs" showTreeIcon="true" valueFromSelect="true"
								showNullItem="true" multiSelect="true" checkRecursive = "false" showFolderCheckBox="true" style="width: 260px;"/>
						</td>
					</tr>	
				</table>
			</div>
		</fieldset>
		<div style="text-align:center;padding:10px;margin-top: 3%;">
			<a class="nui-button"onclick="onOk"style="width:60px;margin-right:20px;">确定</a>
			<a class="nui-button"onclick="onCancel"style="width:60px;">关闭</a>
		</div>
    </form>
	<script type="text/javascript">
        var updateURL = "org.gocom.abframe.org.eamilgrpmaintaine.emailgrpmaintaine.updateEmailGroup.biz.ext";
    	var addURL = "org.gocom.abframe.org.eamilgrpmaintaine.emailgrpmaintaine.addEmailGrp.biz.ext";
    	var URL = "";        
        nui.parse();
        var form = new nui.Form("form1"); 
       	//nui.get("tree").setValue('24,2904,101236');
       	//var oldOrgs;
        function SetData(data){
        	data = nui.clone(data);
        	if(data.action == "edit"){
        		var json = nui.encode({"txEmailGrpInfo":{"emailGroupId": data.emailGroupId}});
	        	nui.ajax({
	        		url: "org.gocom.abframe.org.eamilgrpmaintaine.emailgrpmaintaine.queryOneEmailGroup.biz.ext",
	                data: json,
	                type: 'POST',
	                cache: false,
	                contentType: 'text/json',
	                success: function (o) {
	                    form.setData({txEmailGrpInfo:o.emailGroup});
	                    form.isChanged(false);
	                   // oldOrgs = o.emailGroup.emailGrouOrgs;
	                },
	                error: function (jqXHR, textStatus, errorThrown) {
	                    nui.alert(jqXHR.responseText);
	                    CloseWindow();
	                }
	        	});
        	}
        }
        
        function onOk(e) {
        	var ogrs = nui.get("tree").getValue();
        	if(!!ogrs){
        		SaveData();
        	}else{
        		nui.confirm("确认不选择邮件组所属机构吗？","温馨提示",function(action){
					if(action == "ok"){
						SaveData();
					}
				});
        	}
        }
        
        function SaveData() {
            var o = form.getData();  
            if(form.validate()){
            	var emailGroupId = nui.get("emailGroupId").getValue();
				if(!!emailGroupId){
					URL = updateURL;
				} else{
					URL = addURL;
				}
	            var json = nui.encode({"emailGrp":o.txEmailGrpInfo});
	            nui.ajax({
	                url: URL,
	                data: json,
	                type: 'POST',
	                cache: false,
	                contentType: 'text/json',
	                success: function (text) {
	                	var retValue = text.retValue;
	                    if(retValue==0||retValue==2){
	                    	CloseWindow("save");
	                    }else if(retValue==1){
	                    	nui.alert("添加邮件组信息异常！")
	                    }else if(retValue==3){
	                    	nui.alert("添加邮件组所属机构信息异常！")
	                    }else if(retValue==4){
	                    	nui.alert("该邮件组已存在请勿重复添加！")
	                    }
	                },
	                error: function (jqXHR, textStatus, errorThrown) {
	                    nui.alert(jqXHR.responseText);
	                    CloseWindow();
	                }
	            });
	        }else{
	        	return false;
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
       
        function onCancel(e) {
            CloseWindow("cancel");
        }
    </script>
</body>
</html>
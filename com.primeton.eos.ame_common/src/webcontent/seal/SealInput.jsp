<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
	
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@page import="com.eos.data.datacontext.UserObject"%>
<html>
<!-- 
  - Author(s): zhx
  - Date: 2015-04-07 10:33:37
  - Description:
-->
<head>
<title>信息录入</title>
    <meta http-equiv="content-type" content="text/html; charset=UTF-8" />
    <script src="<%= request.getContextPath() %>/common/nui/nui.js" type="text/javascript"></script>
    <style type="text/css">
	    body{
	        margin:0;padding:0;border:0;width:100%;height:100%;overflow:hidden;
	    }
    </style>
</head>
<body>
	<div class="nui-fit">
		<form id="form1" method="post" >
			<input name="seal.sealid" id="sealid" class="nui-hidden" />
	    	<table>
	            <tr>
	                <td style="width:70px;" align="right">印章类型：</td>
	                <td style="width:150px;" align="left">    
	                   <input name="seal.sealtype" id="sealtype" class="nui-combobox" style="width:150px" allowInput="false" required="true" multiSelect="true"
							textField="sealname" valueField="confid" url="com.primeton.eos.ame_common.SealConfigure.querySealname.biz.ext" dataField="sealConfigures"/>
	                </td>
	                <td align="right">申请人：</td>
	                <td align="left"> 
	                	<input name="seal.applyno" id="applyno" class="nui-buttonedit" onbuttonclick="showEmployee" style="width:150px;" showClose="false" allowInput="false" required="true"/>
	                </td>
	                <td style="width:70px;" align="right">状态：</td> 
	                <td align="left">                                              
	                	<input name="seal.sealstate" class="nui-dictcombobox" dictTypeId="SEAL_STATE" required="true" style="width:150px">
	                </td>
	            </tr>
	            <tr>
	                <td style="width:70px;" align="right">受益部门：</td> 
	                <td align="left">                                              
	                	<input name="seal.orgid" id="orgid" class="nui-combobox" url="com.primeton.rdmgr.labor.labormgr.getAllOrgs.biz.ext" 
							filterType="like" textField="orgname" valueField="orgid" dataField="allorgs" valueFromSelect="true" allowInput="true" style="width:150px;" required="true">
	                </td>
	                <td align="right">文件接收单位：</td>
	                <td colspan="3" align="left">
						<input name="seal.misCustinfo.custid" id="custid" onbuttonclick="selectCustmer" class="nui-buttonedit" style="width:100%" allowInput="false" />
	                </td>
	            </tr>
	            <tr>
	            	<td style="width:70px;" align="right">文件类型：</td> 
	                <td align="left">                                              
	                	<input name="seal.filetype" id="filetype" class="nui-dictcombobox" dictTypeId="MIS_FILETYPE" required="true" style="width:150px" onvaluechanged="checkFiletype">
	                </td>
	                <td align="right">文件份数：</td>
	                <td align="left">    
	                    <input name="seal.filenum" class="nui-spinner" format="n0" allowLimitValue="false" changeOnMousewheel="false" showbutton="false" inputStyle="text-align: right" style="width:150px;"/>
	                </td>	                
	                <td align="right">金额：</td>
	                <td align="left">    
	                    <input name="seal.money" id="money" class="nui-spinner" format="n2" allowLimitValue="false" changeOnMousewheel="false" showbutton="false" inputStyle="text-align: right" style="width:150px;"/>
	                </td>
	            </tr>
	            <tr>
	                <td align="right">申请日期：</td>
	                <td align="left">    
	                   <input name="seal.applydate" id="applydate" class="nui-datepicker" required="true" style="width:150px"/>
	                </td>
					<td align="right">用章地点：</td>
					<td align="left">
						<input name="seal.sealaddress" class="nui-dictcombobox" dictTypeId="AREA4SEAL" style="width: 150px;" required="true"/>
					</td>
					<td align="right">用章主体：</td>
					<td align="left">
						<input name="seal.subject" id="subject" class="nui-dictcombobox" dictTypeId="company" style="width: 150px;"/>
					</td>
				</tr>
	            <tr>
					<td align="right">操作人：</td>
					<td align="left">
						<input name="seal.operator" id="operator" class="nui-buttonedit" onbuttonclick="showEmployee" style="width:150px;" showClose="false" allowInput="false" required="true"/>
					</td>
	                <td align="right">使用日期：</td>
					<td align="left">
						<input name="seal.sealdate"class="nui-datepicker" id="sealdate" required="true" style="width:150px"/>
					</td>
				</tr>
				<tr>
					<td align="right">用章事由：</td>
	                <td align="left" colspan="5">    
	                   <input name="seal.memo" id="memo" class="nui-textarea" style="width: 100%;height: 140px;" required="true"/>
	                </td>
				</tr>	
			</table>
		</form>
	</div>
	<div style="text-align:center;padding:10px;" class="nui-toolbar">
		<a class="nui-button"onclick="onOk"style="width:60px;margin-right:20px;">确定</a>
		<a class="nui-button"onclick="onCancel"style="width:60px;">取消</a>
	</div>

	<script type="text/javascript">
        nui.parse();
        var form = new nui.Form("form1");      
        var updateURL = "com.primeton.eos.ame_common.seal.updateSeal.biz.ext";
    	var addURL = "com.primeton.eos.ame_common.seal.addseal.biz.ext";
    	var saveURL = "";       
    	<%
       		UserObject user = (UserObject) session.getAttribute("userObject");
       		String username = user.getUserName();
       		String userno = user.getUserId();
        %>
          
        function SetData(data){
        	data = nui.clone(data);
        	if(data.action == "new"){
        		nui.get("sealdate").setValue(new Date());
        		nui.get("applydate").setValue(new Date());
        		nui.get("operator").setValue('<%=userno %>');
       			nui.get("operator").setText('<%=username %>');
       			nui.get("subject").setValue("1");
        	}
        	if(data.action == "edit"){
        		var json = {seal: {sealid: data.sealid}};
	        	nui.ajax({
	        		url: "com.primeton.eos.ame_common.seal.getSeal.biz.ext",
	                data: json,
	                type: 'POST',
	                cache: false,
	                contentType: 'text/json',
	                success: function (o) {
	                    form.setData(o);
	                    nui.get("applyno").setText(o.seal.applyname);
	                    nui.get("operator").setText(o.seal.operatorer);
	                    nui.get("custid").setText(o.seal.custname);
	                    nui.get("custid").setValue(o.seal.custno);
	                    nui.get("orgid").setText(o.seal.orgname);
	                    nui.get("sealtype").setText(o.seal.sealname);
	                    checkFiletype();
	                },
	                error: function (jqXHR, textStatus, errorThrown) {
	                    alert(jqXHR.responseText);
	                    CloseWindow();
	                }
	        	});
        	}
        }
        
        //根据文件类型判断一些字段是否必填
        function checkFiletype(){
        	var filetype = nui.get("filetype").getValue();
        	if(filetype == "5"){//当文件类型为其他时，备注必须填写
        		//nui.get("memo").setRequired(true);
        		nui.get("money").setRequired(false);
        	}else if(filetype == "1"){//当文件类型为合同时，金额必须填写
        		nui.get("money").setRequired(true);
        		//nui.get("memo").setRequired(false);
        	}else{
        		nui.get("money").setRequired(false);
        		//nui.get("memo").setRequired(false);
        	}
        }

		//保存
        function SaveData() {
            var o = form.getData();            
            if(form.validate()){
            	var sealid = nui.get("sealid").getValue();
				if(sealid){
					saveURL = updateURL;
				} else{
					saveURL = addURL;
				}
	            var json = nui.encode(o);
	            nui.ajax({
	                url: saveURL,
	                data: json,
	                type: 'POST',
	                cache: false,
	                contentType: 'text/json',
	                success: function (text) {
	                    CloseWindow("save");
	                },
	                error: function (jqXHR, textStatus, errorThrown) {
	                    alert(jqXHR.responseText);
	                    CloseWindow();
	                }
	            });
	        }else{
	        	return;
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
        
        function onOk(e) {
            SaveData();
        }
		
		//选择人员
		function showEmployee(e) {
		    var btnEdit = this;
		    nui.open({
				url:"<%=request.getContextPath() %>/machine/SelectEmployee.jsp",
				title: "选择人员",
				width: 600,
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
		
		//选择用章单弹窗
		function selectCustmer(){
			var btnEdit = this;
			nui.open({
				url:"<%=request.getContextPath() %>/contract/contract/MisCustinfo_lookup.jsp",
			    title: "选择用章单位",
			    width: 650,
			    height: 380,
			    ondestroy: function (action) {
			        if (action == "ok") {
			            var iframe = this.getIFrameEl();
			            var data = iframe.contentWindow.GetData();
			            data = nui.clone(data);    //必须
			            if (data) {
			                btnEdit.setValue(data.id);
			                btnEdit.setText(data.text);
			            }
			        }
			    }
		    });
		}
				
    </script>
</body>
</html>
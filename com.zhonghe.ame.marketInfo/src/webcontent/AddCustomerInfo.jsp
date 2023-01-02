<%@page pageEncoding="UTF-8"%>
<%@include file="/purchase/common/common.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<!-- 
  - Author(s): 张一博
  - Date: 2017-09-05 11:27:25
  - Description:
-->
<head>
<title>新增客户信息</title>
<script src="<%= request.getContextPath() %>/common/nui/nui.js" type="text/javascript"></script>
<style type="text/css">
	body{margin:0;padding:0;border:0;width:100%;height:100%;overflow:hidden;font-size:12px;}
</style>
</head>
<body>
<div class="nui-fit" id="formcust">
	<fieldset id="field1" style="border:solid 1px #aaa;padding:3px;">
		<legend>客户基本资料</legend>
		<div style="text-align: center" >
			<div style="text-align: center" id='form1'>
				<input name="custinfo.files" id="fileids" class="nui-hidden"/><!-- 附件 -->
				<input class="nui-hidden" name="custinfo.custid"/><!-- 客户主键id -->
				<table style="table-layout:fixed;">
					<tr>
						<td align="right" style="width: 100px">
							填报部门：
						</td>
						<td>
							<input name="custinfo.accoutbank" id="orgId"
									class="nui-combobox" required="true"
									url="com.primeton.rdmgr.labor.labormgr.getAllOrgs.biz.ext"
									filterType="like" textField="orgname" valueField="orgid"
									dataField="allorgs" valueFromSelect="true" allowInput="true" enabled="false"
									onvaluechanged="changeOrgForm" style="width: 250px;" />
						</td>
						<td align="right" style="width: 100px">填报人:</td>
								<td style="width: 210px;"><input name="custinfo.creatUserid"
									id="creatUserid" class="nui-hidden" style="width: 100%" /> <input
									id="createUsername" name="custinfo.custmanager" class="nui-textbox"
									enabled="false" style="width: 250px" required="true" /></td>
					</tr>
					<tr>
						<td align="right" style="width: 100px">
							客户名称：
						</td>
						<td>
							<input class="nui-textbox" name="custinfo.custname"  required="true" style="width:260px"/>
						</td>
						
						
						<td align="right" style="width: 100px">接洽日期：</td>
								<td style="width: 130px"><input name="custinfo.licenseenddate"
									id="licenseenddate" class="nui-datepicker" required="true"
									style="width: 250px" /></td>
					</tr>
					<tr>
						<td align="right" >
							接洽地点：
						</td>
						<td colspan="7">
							<input name="custinfo.address" id="address" class="nui-textbox" style="width: 100%"/>
						</td>
					</tr>
					<tr>
						<td align="right" style="width: 150px">
							主要议题及成果：
						</td>
						<td colspan="7">
							<input name="custinfo.comments" class="nui-textarea" style="width: 100%;height: 120px;"/>
						</td>
					</tr>
					<tr>
						<td align="right" style="width: 100px">
							主要参会人员：
						</td>
						<td colspan="7">
							<input name="custinfo.busiscope" id="" class="nui-textarea" style="width:100%;height: 40px;"
							value = "我方：副总经理张三，企业发展部副主任李四；	
对方：副总经理张三，企业发展部副主任李四；"/>
						</td>
					</tr>
					<tr>
						<td align="right">
							对方联系人：
						</td>
						<td colspan="7">
							<input name="custinfo.contacts" id="address" class="nui-textbox" style="width: 100%"/>
						</td>
					</tr>
					<!-- <tr>
						<td align="right" style="width: 80px;">是否有效：</td>
						<td align="left">
		            		<input id='status' class="nui-dictcombobox" required="true" name="custinfo.status" dictTypeId="MIS_YN"  showNullItem="true" nullItemText="全部"  style="width: 80px;"/>
					    </td>
					</tr> -->
				</table>
			</div>
		</div>
	</fieldset>
	<fieldset id="field2" style="border:solid 1px #aaa;padding:3px;dispaly:none;">
		<legend>相关附件</legend>
		<jsp:include page="/ame_common/inputFile.jsp"/>
	</fieldset>
</div>
<div style="text-align: center;padding: 10px;" class="nui-toolbar">
	<a class="nui-button" onclick="onOk()" style="width: 60px;margin-right: 20px;">保存</a>
	<a class="nui-button" onclick="onCancel" style="width:60px;">关闭</a>
</div>
<script type="text/javascript">
	nui.parse();
	
	nui.get("orgId").setValue(userOrgId);
	nui.get("creatUserid").setValue(userId);
	nui.get("createUsername").setValue(userName);
	var custid = '<%=request.getParameter("custid")%>';
	SetData(custid);
	//页面进入时调用的方法
    function SetData(data) {
    	if(data=='null'){
 
    	}else{
	    	var form = new nui.Form("#formcust");
			var json = nui.encode({custid:data});
	        nui.ajax({
	            url: "com.primeton.eos.ame_common.curstinfo.custinfoview.biz.ext",
				type: 'POST',
				data: json,	
				contentType: 'text/json',
	            success: function (o) {
	            	form.setData(o);
	            	nui.get("groupno").setText(o.custinfo.custname1);
	            	var grid_0 = nui.get("grid_0");
					grid_0.sortBy("fileTime","desc");
	            	grid_0.load({"groupid":"MIS_CUSTINFO","relationid":data});
	            }
	        });
	    }    
    }
     //日期格式化
    function formatDate (date) {
	    var y = date.getFullYear();
	    return y ;
	}
	//表单效验
	function onOk(){
		//定义变量接受form表单数据
		var form = new nui.Form("#formcust");
		var data = form.getData(); 
		var cs = data.custinfo;
	  	if(cs.custname==''||cs.custjc==''||cs.status==''){
	  		nui.alert("表单信息填写不完整，请确认必输项是否填写！");
			return;
	  	}
	  	document.getElementById("fileCatalog").value="custinfo";
		form2.submit();
	}
	
	//保存数据
	function SaveData(){
		//定义变量接受form表单数据
	  	var form = new nui.Form("#formcust");
		var data = form.getData();
		var cs = data.custinfo;
		//附件ID赋值
		data.custinfo.files = nui.get("fileids").getValue();
		var json = nui.encode(data);
		
		nui.ajax({
            url: "com.primeton.eos.ame_common.curstinfo.addCustInfo.biz.ext",
			type: 'POST',
			data: json,	
			contentType: 'text/json',
            success: function (o) {
            	if(o.result==1&&cs.custid==''){
            		nui.alert("新增客戶信息成功",null,function(){
            			CloseWindow('save');
            		});
            	}else if(o.result==1){
            		nui.alert("修改客戶信息成功",null,function(){
            			CloseWindow("save");
			        });
            	}else if(cs.custid==''){
            		nui.alert("新增失败,请联系信息技术部");
            	}else{
            		nui.alert("修改失败,请联系信息技术部");
            	}
            }
        });
	}
	
	//点击选择大客户经理时的方法
    function onButtonEdit(e) {
        var btnEdit = this;	
        var lookupUrl="";
    	lookupUrl = "<%=request.getContextPath() %>/ame_common/custinfo/custInfoManager.jsp";
		if (lookupUrl=="") return;
        nui.open({
			url:lookupUrl,
			title: "选择列表",
			width: 800,
			height: 420,
			ondestroy: function (action) {
				if (action == "ok") {
					var iframe = this.getIFrameEl();
					var data = iframe.contentWindow.GetData();
					data = nui.clone(data);    //必须
					if (data) {
		                btnEdit.setValue(data.empname);
		                btnEdit.setText(data.empname);
					}
				}
			}
		});
	}
	function onCloseClick(e) {
        var obj = e.sender;
        obj.setText("");
        obj.setValue("");
    }
	//关闭窗口
	function onCancel(e) {
        CloseWindow("cancel");
    }
    function CloseWindow(action) {
        if (action == "cancel" ) {
            if (!confirm("是否关闭？")) {
                return false;
            }
        }
        if (window.CloseOwnerWindow) return window.CloseOwnerWindow(action);
        else window.close();            
    }
    
    //选择服务客户弹窗
	function selectCustmer(){
		var btnEdit = this;
		nui.open({
			url:"<%=request.getContextPath() %>/contract/contract/MisCustinfo_lookup.jsp",
		    title: "选择客户",
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
	//检查是否为数字
	function validate(e){  
	     var reg = new RegExp("^[0-9]*[0-9][0-9]*$");  
	     var obj = nui.get(e).getValue();
	     if(!reg.test(obj)){  
	     	alert("请输入数字!");
	     	nui.get(e).setValue("");    
	     }  
     }
</script>
</html>
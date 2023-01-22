<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@include file="/common/common.jsp"%>
<html>
<!-- 
  - Author(s): xupc
  - Date: 2020-07-09
  - Description:
-->
<head>
<title>报表属性定义</title>
<script src="<%= request.getContextPath() %>/common/nui/nui.js" type="text/javascript"></script>
<style type="text/css">
    body{
        margin:0;padding:0;border:0;width:100%;height:100%;overflow:hidden;
    }
</style>
</head>
<body>
<div class="nui-fit">
   <div title="报表属性定义" style="padding: 30px 0;">
	 	<form id="form1" method="post" >
	 	    <input class="nui-hidden" name="report.reportid"/>
        	<table style="table-layout:fixed;" id="table_file1">
	            <tr>
	                <td align="right" style="width:150px">报表编码：</td>
					<td>
						<input name="report.reportcode" class="nui-textbox" id="reportcode" style="width:200px" required="true" readOnly="true" onvaluechanged="judge(e)"/>
					</td>
					<td align="right" style="width:150px">报表名称：</td>
					<td>
						<input name="report.reportname" id="reportname" class="nui-textbox" required="true" style="width:200px"/>
					</td>
				</tr>
				<tr>
				    <td align="right" style="width:150px">定时器任务编号：</td>
					<td >
						<input name="report.timingname" id="timingname" class="nui-textbox" style="width:200px"/>
					</td>
					<td align="right" style="width:150px">加载方式：</td>
					<td>
						<input name="report.loadingtype"  class="nui-dictcombobox" id ="loadingtype" dictTypeId="REPORT_LOADINGTYPE"  required="true" style="width:200px" />
					</td>
				</tr>
				<tr>
				    <td align="right" style="width:150px">是否显示统计值：</td>
					<td >
						<input name="report.isshowtotal" id="isshowtotal" class="nui-dictcombobox" dictTypeId="MIS_YN" required="true" style="width:200px" value="0"/>
				    </td>
				</tr>
				<tr>
					<td align="right" style="width:150px">数据加载逻辑：</td>
					<td colspan="3">
						<input name="report.loadinglogicname" id="loadinglogicname" class="nui-textbox"  required="true" style="width:560px"/>
					</td>
				</tr>
				<tr>
					<td align="right" style="width:150px">有权角色：</td>
					<td colspan="3">
						<input property="editor" class="nui-textboxlist" name="report.roleid"  id ="roleid" required="true" allowInput="true" textField="rolename" valueField="roleid" searchField="name" style="width:560px;" 
				        url="com.primeton.eos.ame_budget.budgetOrgManager.queryRoleidByName.biz.ext"/>
					</td>
				</tr>
				<tr>
					<td align="right" style="width:150px">备注：</td>
					<td colspan="3">
						<input class="nui-textbox" name="report.reportremark" id ="reportremark" style="width:560px"/>
					</td>
				</tr>
        	</table>
        </form>
    </div>    
</div>
<div style="text-align:center;padding:10px;" class="nui-toolbar">
	<a class="nui-button" onclick="ok()" iconCls="icon-ok"  style="width:60px;margin-right:20px;">保存</a>
	<a class="nui-button closeBtn" onclick="onCancel('cancel')" iconCls="icon-cancel" style="width: 60px;margin-right: 20px;">关闭</a>
	<a class="nui-button loadingBtn" id ="loadingBtn" onclick="onLoading" iconCls="icon-leaveCreateApply2" style="width: 100px;margin-right: 20px;">数据加载</a>
</div>
<div id="win2" class="nui-window" title="加载日期" style="width:100px;height:120px;" 
		    showMaxButton="true" showCollapseButton="true" showShadow="true"
		    showToolbar="false" showFooter="true" showModal="false" allowResize="true" allowDrag="true">
	    	<div style="padding:5px;">
	    		<input name="month" id="month" class="nui-monthpicker" style="width: 100px;margin-left: 10px;"/>
	    	</div>
		    <div property="footbar" style="padding:5px;margin-left: 10px;">
		        <input type='button' value='确定' onclick="loadingdate()" style="vertical-align: bottom;"/>
		        <input type='button' value='关闭' onclick="hideDate()" style="vertical-align: bottom;margin-left: 20px"/>
</div>
</div>
</body>
<script type="text/javascript">
	nui.parse();
	
	var form = new nui.Form("form1");
	form.setChanged(false);
	var reportCode = '<%=request.getParameter("reportcode") %>';
	if(reportCode == null || reportCode == 'null'){
		$(".loadingBtn").hide();
		nui.get("reportcode").setReadOnly(false); 
	}else{
	    $(".closeBtn").hide();
	} 
	setData();
	function setData(){
		if(reportCode != null && reportCode != 'null' ){
			var json = {reportcode:reportCode};
			nui.ajax({
				url: "com.primeton.eos.ame_common.ameReport.queryReport.biz.ext",
	            type: "post",
	            data: json,
	            cache: false,
	            contentType: 'text/json',
	            success: function (text) {
	                 form.setData(text);
	                 if(text.report.loadingtype == '1'){
	                    $(".loadingBtn").hide();
	                 }
	                 nui.get("roleid").setValue(text.report.roleid);
			         nui.get("roleid").setText(text.report.rolename); 
	            }
			});
		}
	}
	//保存应用信息
	function ok(){
	    if (!form.isChanged()) {
	        nui.alert("数据未修改，无需保存");
	        return;
        }
		var report = form.getData();
		if(reportCode != null && reportCode != 'null' ){
		    var url = 'com.primeton.eos.ame_common.ameReport.updateReport.biz.ext';
		    var maskmessage = '正在编辑报表，请稍等...';
		    var message = '修改失败。请检查相关字段信息';
		    var message1 = '修改成功。';
		}else{
		    var url = 'com.primeton.eos.ame_common.ameReport.addReport.biz.ext';
		    var maskmessage = '正在新增报表，请稍等...';
		    var message = '新增失败。请检查相关字段信息';
		    var message1 = '新增成功。';
		}
		form.validate();
        if (form.isValid()==false) {
        	nui.alert("请填写必填项。")
        	return;
        }else{
			var json = nui.encode({"report":report.report});
		    form.mask(maskmessage);
				nui.ajax({
	    			url: url,
	    			data: json,
	    			type: 'POST',
	    			cache: false,
	    			contentType: 'text/json',
	    			success: function(text){
	    			    form.unmask();
	    			    if(text.result == "1"){
	            			nui.alert(message);
	            		}else{
	            		    if(reportCode == null || reportCode == 'null' ){
							   nui.alert(message1,"操作提示",function (action){
				                    if(action == "ok"){
				                       CloseWindow("ok");
				                    }
	                           })
							}else{
							   nui.alert(message1);
							   parent.search();
	            		       parent.tabs.loadTab("<%=request.getContextPath() %>/ame_common/ameReport/ReportPropertyDef.jsp?reportcode="+report.report.reportcode,parent.tabs.tabs[1]);
							}
	            		}
	    			}
	    	});	
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
	    var ishave = 0;
		var reportcode = e.value;
		var json = {reportcode:reportcode};
		nui.ajax({
				url: "com.primeton.eos.ame_common.ameReport.queryReport.biz.ext",
				type: 'POST',
				data:json,
				async: false,
				contentType: 'text/json',
	            success: function (result) {
	            	if(result.report.reportcode){
		    			ishave = 1;
		    		}
	            }
	     });
	     if(ishave == 1){
			nui.alert("您输入的报表编码已存在，请重新填写！");
			nui.get("reportcode").setValue('');
			return;
    	 }
	}
	function onLoading(){
	    if (form.isChanged()) {
	        if (confirm("数据被修改了，是否先保存？")) {
	            return false;
	        }
        }else{
            nui.get("month").setValue(new Date());
	        var win = nui.get("win2");
            win.showAtPos("center", "middle");
        }
	}
	var year;
	var month;
    function loadingdate(){
    	hideDate();
    	var date = nui.get("month").getValue();
    	year = date.getFullYear();
		month = date.getMonth();
		loadingData();
    }
    function hideDate() {
        var win = nui.get("win2");
        win.hide();
	}
	function loadingData(){
	    	nui.confirm("确认要加载" +month + "月的报表数据","报表操作提示",function(action){
                if(action=="ok"){
                    var url = nui.get("loadinglogicname").getValue();
                    var json = nui.encode({"date":nui.get("month").getValue()});
                    form.mask("正在加载报表数据，请稍等...");
                    nui.get("#loadingBtn").setEnabled(false);
                    nui.ajax({
                        url:url,
                        type:'POST',
                        data:json,
                        cache: false,
                        contentType:'text/json',
                        success:function(text){
                            form.unmask();
                            if(text.result == 1){
	                            nui.alert("加载成功"); 
			    			}else{
			    			    nui.alert("加载失败,请重试或者联系信息部门");
			    			}
			    			nui.get("#loadingBtn").setEnabled(true);
                        }
                    }); 
                }
          });
	}
</script>
</html>
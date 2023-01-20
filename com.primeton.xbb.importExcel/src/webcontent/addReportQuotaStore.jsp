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
  - Date: 2020-06-11
  - Description:
-->
<head>
	<title>新增月度统计指标值</title>
	<meta http-equiv="content-type" content="text/html; charset=UTF-8" />
    <script src="<%= request.getContextPath() %>/common/nui/nui.js" type="text/javascript"></script>
</head>
<body style="width:100%;height:100%;padding:0px;margin:0px;">
<div class="nui-fit">
	<form id="form1">
	   <input name="ReportQuotaStore.reportstorecode" id="reportstorecode" class="nui-hidden"/>
	   <input name="ReportQuotaStore.reportname" id="reportname" class="nui-hidden"/>
	   <input name="ReportQuotaStore.reportquotaname" id="reportquotaname" class="nui-hidden"/>
		<fieldset style="border:solid 1px #aaa;padding:3px;">
			<legend >统计指标值基本信息</legend>
			<div style="padding:5px;">
				<table style="width:100%;">
					<tr>
	            		<td align="right"><span>报表：</span></td>
			            <td align="left">
			            	<input name="ReportQuotaStore.reportcode" id="reportcode" class="nui-combobox"  valueField="reportcode" textField="reportname"  url="com.primeton.xbb.importExcel.importReportQuota.getReport.biz.ext" dataField="Reports"  showNullItem="false" required="true"  style="width:160px;" onvaluechanged="onValueChanged"/>
						</td>
	            		<td align="right" >报表指标项 :</td>
	            		<td align="left">    
	                		<input class="nui-treeselect" expandOnLoad="true" textField="reportquotaname" valueField="reportquotacode" parentField="parentquotacode" onclick="onValueChanged()" onbeforenodeselect="beforenodeselect"
							  dataField="reportquotacodes" showTreeIcon="true" valueFromSelect="true" showNullItem="true" multiSelect="false"  required="true"
							  name="ReportQuotaStore.reportquotacode" checkRecursive = "false" showFolderCheckBox="true" autoCheckParent="false"
							  id="reportquotacode" style="width:160px;"  nullItemText=""/>
	            		</td>
	            		<td align="right">受益部门：</td>
						<td style="width:150px;" align="left"> 
						<input name="ReportQuotaStore.orgid" id="orgid" class="nui-combobox" 
							required="true" url="com.primeton.rdmgr.labor.labormgr.getAllOrgs.biz.ext" filterType="like" 
							textField="orgname" valueField="orgid" dataField="allorgs" valueFromSelect="true" 
							allowInput="true" style="width: 160px;" />
						</td>
					</tr>
					<tr>
					    <td align="right"><span>年份：</span></td>
			            <td align="left">
			               <input name="ReportQuotaStore.year" class="nui-combobox" required="true" valueField="id" textField="text"  id = "year" 
						   data=[{"id":2015,"text":2015},{"id":2016,"text":2016},{"id":2017,"text":2017},{"id":2018,"text":2018},{"id":2019,"text":2019},{"id":2020,"text":2020}] style="width:160px;"/>
						</td>
			            <td align="right"><span>月份：</span></td>
			            <td align="left">
			               <input name="ReportQuotaStore.month" class="nui-combobox" required="true" valueField="id" textField="text"  id = "month" 
						   data=[{"id":1,"text":1},{"id":2,"text":2},{"id":3,"text":3},{"id":4,"text":4},{"id":5,"text":5},{"id":6,"text":6},{"id":7,"text":7},{"id":8,"text":8},{"id":9,"text":9},{"id":10,"text":10},{"id":11,"text":11},{"id":12,"text":12}] style="width:160px;" />
						</td>
						<td align="right"><span>指标值：</span></td>
						<td align="left">
			               <input name="ReportQuotaStore.quotavalue" id="quotavalue" class="nui-textbox" required="true"  style="width:160px;" />
						</td>
	            	</tr>
	            	<tr>
	            	    <td align="right"><span>合同名称：</span></td>
						<td align="left">
			               <input name="ReportQuotaStore.contnum" id="contname"   onbuttonclick="selectCont" class="nui-buttonedit" style="width:160px"/>
						</td>
						<td align="right"><span>项目名称：</span></td>
						<td align="left">
			               <input name="ReportQuotaStore.projectno" id="projectname" onbuttonclick="selectProject" class="nui-buttonedit" style="width:160px;"/>
						</td>
						<td align="right"><span>客户名称：</span></td>
						<td align="left">
			               <input name="ReportQuotaStore.custnum" id="custnum" onbuttonclick="selectCustmer" class="nui-buttonedit"  style="width:160px;"/>
						</td>
	            	</tr>
	            	<tr>
	            	    <td align="right"><span>人员姓名：</span></td>
						<td align="left">
			               <input name="ReportQuotaStore.empcode" id="empcode" class="nui-buttonedit" allowInput="false" onbuttonclick="selectEmp" style="width:160px;"/>
						</td>
						<td align="right"><span>员工属性：</span></td>
						<td align="left">
			               <input name="ReportQuotaStore.intendpositiontype" id="intendpositiontype" class="nui-dictcombobox" dictTypeId="EMP_TYPE" style="width:160px;"/>
						</td>
						<td align="right"><span>岗位级别：</span></td>
						<td align="left">
			               <input name="ReportQuotaStore.joblevel" id="joblevel" class="nui-dictcombobox" dictTypeId="AME_TECH" style="width:160px;"/>
						</td>
	            	</tr>
				</table>
			</div>
		</fieldset>
	</form>
</div>	
<div style="text-align: center;padding: 10px;" class="nui-toolbar">
	<a class="nui-button" onclick="onOk()" id="saveReportquotastore" iconCls="icon-ok" style="width: 60px;margin-right: 20px;">提交</a>
	<a class="nui-button" onclick="onCancel('cancel')" id="closeReportquotastore" iconCls="icon-cancel" style="width: 60px;margin-right: 20px;">关闭</a>
</div>
</body>
<script type="text/javascript">
    var updateURL = "com.primeton.xbb.importExcel.importReportQuota.updateReportQuotaStore.biz.ext"; 
	var addURL = "com.primeton.xbb.importExcel.importReportQuota.addReportQuotaStore.biz.ext";
	var saveURL = "";
	nui.parse();
	var form = new nui.Form("form1");
	function SetData(data){
		data = nui.clone(data);
		if(data.action == "edit"){
		         form.setData(data);
		         nui.get("reportquotacode").setValue(data.ReportQuotaStore.reportquotacode);
		         nui.get("reportquotacode").setText(data.ReportQuotaStore.reportquotaname);
		         nui.get("contname").setValue(data.ReportQuotaStore.contnum);
		         nui.get("contname").setText(data.ReportQuotaStore.contname);
		         nui.get("projectname").setValue(data.ReportQuotaStore.projectno);
		         nui.get("projectname").setText(data.ReportQuotaStore.projectName);
		         nui.get("custnum").setValue(data.ReportQuotaStore.custnum);
		         nui.get("custnum").setText(data.ReportQuotaStore.custname);
		         nui.get("empcode").setValue(data.ReportQuotaStore.empcode);
		         nui.get("empcode").setText(data.ReportQuotaStore.empname);
	      }
	}
	function SaveData() {
	    nui.get("reportname").setValue(nui.get("reportcode").getText());
	    nui.get("reportquotaname").setValue(nui.get("reportquotacode").getText());
		var  o = form.getData();        
	    //根据存储表主键值是否为空判断新增还是修改
		var reportstorecode = nui.get("reportstorecode").getValue();
		if(reportstorecode){
		    var message = "编辑";
			saveURL = updateURL;
		} else{
		    var message = "新增";
			saveURL = addURL;
		}
		var json = nui.encode(o);
		if(form.validate()){
	        nui.confirm("确定要"+message+"此条月度统计指标值信息？",message+"月度统计指标值信息提示",function(action){
			  if(action=="ok"){
	            form.mask("月度统计指标值信息正在录入，请稍等...");
	            nui.ajax({
	                url: saveURL,
					type: 'POST',
					data: json,	
					contentType: 'text/json',
	                success: function (o){
	                    form.unmask();
	                	if(o.result == 0){
	                		nui.alert(message+"失败，重新操作！");
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
	function onOk(e) {
		SaveData();
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
			if (confirm("月度统计指标值被修改了，是否先保存？")){
				return false;
			}
		}
		if (window.CloseOwnerWindow) return window.CloseOwnerWindow(action);
		else window.close();
	}
  	//选择销售合同弹窗(只能选择本事业部是合同)
    function selectCont(){
    	nui.open({
            url:"<%=request.getContextPath() %>/ame_income/csReveForecast/SelectCsContract.jsp?",
            title: "选择合同编号",
            width: 800,
            height: 400,
            allowResize: false,
            onload:function (){
            	var iframe = this.getIFrameEl();
                iframe.contentWindow.search();
            },
            ondestroy: function (action) {
                if (action == "ok") {
                    var iframe = this.getIFrameEl();
                    var data = iframe.contentWindow.GetData();
                    data = nui.clone(data);    //必须
                    if (data) {
                    	//合同基本信息
                        nui.get("contname").setValue(data.contnum);
                        nui.get("contname").setText(data.projectname);
                    }	
                }
            }
        });
    }
    function selectEmp(){
		var btnEdit = this;
        nui.open({
            url: "/default/machine/SelectEmployee.jsp",
                title: "选择人员",
                width: 430,
                height: 400,
                ondestroy: function (action) {
                    if (action == "ok") {
                        var iframe = this.getIFrameEl();
                        var data = iframe.contentWindow.GetData();
                        data = nui.clone(data);    //必须
                        if (data) {
                            btnEdit.setValue(data.empcode);
                            btnEdit.setText(data.empname);
                        }
                    }

                }
          });
	}
    //选择服务客户弹窗
	function selectCustmer(){
		var btnEdit = this;
		nui.open({
			url:"/default/contract/contract/MisCustinfo_lookup.jsp",
		    title: "选择服务客户",
		    width: 650,
		    height: 380,
		    ondestroy: function (action) {
		        if (action == "ok") {
		            var iframe = this.getIFrameEl();
		            var data = iframe.contentWindow.GetData();
		            data = nui.clone(data);    //必须
		            if (data) {
		                btnEdit.setValue(data.custnum);
		                btnEdit.setText(data.text);
		            }
		        }
		    }
	    });
	}
    //选择项目
	function selectProject(){
		var btnEdit = this;
		nui.open({
			url:"/default/ame_common/SelectProject.jsp",
		    title: "选择项目",
		    width: 800,
		    height: 480,
		    ondestroy: function (action) {
		        if (action == "ok") {
		            var iframe = this.getIFrameEl();
		            var data = iframe.contentWindow.GetData();
		            data = nui.clone(data);    //必须
		            if (data) {
		                btnEdit.setValue(data.projectno);
		                btnEdit.setText(data.projectName);
		            }
		        }
		    }
	    });
	}
	function onValueChanged(){
	   var reportcode = nui.get("reportcode").getValue();
	   var json = nui.encode({reportcode:reportcode}); 
       nui.ajax({
    		url: "com.primeton.xbb.importExcel.importReportQuota.getReportQuota.biz.ext",
            data: json,
            type: 'POST',
            cache: false,
            contentType: 'text/json',
            success: function (o) {
                /* nui.get("reportquotacode").setData(o.reportquotacodes); */
                nui.get("reportquotacode").loadList(o.reportquotacodes, "quotaseq", "parentquotacode");
            },
            error: function (jqXHR, textStatus, errorThrown) {
                alert(jqXHR.responseText);
                CloseWindow();
            }
	    });
    }
    function beforenodeselect(e) {
            //禁止选中父节点
            if (e.isLeaf == false) e.cancel = true;
    }
</script>
</html>
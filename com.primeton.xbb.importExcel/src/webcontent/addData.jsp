<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>	
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@page import="com.eos.data.datacontext.UserObject"%>
<%@page import="commonj.sdo.DataObject"%>
<%@page import="java.util.Map"%>
<html>
<!-- 
  - Author(s): EPCNB324
  - Date: 2016-06-22 16:10:16
  - Description:
-->
<head>
<title>增加</title>
<meta http-equiv="content-type" content="text/html; charset=UTF-8" />
<script src="<%= request.getContextPath() %>/common/nui/nui.js" type="text/javascript"></script>
</head>
<body>
<form style="width:100%;height:100%;padding:0px;margin:0px;"id="form1" method="post">
<input name="ErpDepartmentPL.id" id="id"class="nui-hidden"/>
<fieldset style="border:solid 1px #aaa;padding:3px;">
		<legend>基本信息</legend>
   <table style="width:100%;">
      <tr>
         <td align="right"><span>销售：</span></td>
            <td align="left">
			  <input name="ErpDepartmentPL.orgid" id="orgid" class="nui-combobox" 
					required="true" url="com.primeton.eos.ame_fee.cashflow.getAllOrg.biz.ext" filterType="like" 
					textField="orgname" valueField="orgid" dataField="allorgs" valueFromSelect="true" 
					allowInput="true"  required="true" style="width:200px;" onvaluechanged="change(e)"/>
			  <input  id="orgname" name = "ErpDepartmentPL.orgname" class="nui-hidden"/> 
		     </td>
		 <td align="right"><span>合同名称：</span></td>
            <td align="left">
              <input name="ErpDepartmentPL.contnum" id="projectname"  class="nui-buttonedit" style="width:200px" onbuttonclick="selectCont" allowInput="false"/>
			</td>
		 </tr>
		 <tr>
         <td align="right"><span>年份：</span></td>
            <td align="left">
               <input name="ErpDepartmentPL.year" class="nui-combobox" required="true" valueField="id" textField="text"  id = "year"
			   data=[{"id":2015,"text":2015},{"id":2016,"text":2016},{"id":2017,"text":2017},{"id":2018,"text":2018},{"id":2019,"text":2019},{"id":2020,"text":2020}] style="width:200px;"/>
			   </td>
            <td align="right"><span>月份：</span></td>
            <td align="left">
               <input name="ErpDepartmentPL.month" class="nui-combobox" required="true" valueField="id" textField="text"  id = "month"
			   data=[{"id":1,"text":1},{"id":2,"text":2},{"id":3,"text":3},{"id":4,"text":4},{"id":5,"text":5},{"id":6,"text":6},{"id":7,"text":7},{"id":8,"text":8},{"id":9,"text":9},{"id":10,"text":10},{"id":11,"text":11},{"id":12,"text":12}] style="width:150px;"/>
			   </td>
		  </tr>
		  <tr>
		  	<td align="right"><span>数据类型：</span></td>
            <td align="left">
            	<input name="ErpDepartmentPL.type" class="nui-dictcombobox" dictTypeId="ReportCostType" required="true" id = "type" style="width:200px;"/>
			</td>
			<td align="right"><span>金额：</span></td>
            <td align="left">
               <input name="ErpDepartmentPL.value" class="nui-textbox" required="true" valueField="id" textField="text"  id = "value" style="width:150px;"/>
			   </td>
		   </tr>
		   <tr>
			   <td align="right"><span>报表类型：</span></td>
	           <td align="left">
	            	<input name="ErpDepartmentPL.reporttype" class="nui-textbox" id = "reporttype" style="width:200px;"/>
			   </td>
		   </tr>
		   <tr>
			   <td align="center" colspan="15">
            	<a class="nui-button" onclick="onOk" style="width:60px;margin-right:20px;">确定</a>
            	<a class="nui-button" onclick="onCancel" style="width:60px;">取消</a>
     		</td>
       	</tr>
   </table>           
</fieldset>
</form>

<script type="text/javascript">
    	
   	
	var updateURL = "com.primeton.xbb.importExcel.importPLData.updateData.biz.ext";
	var addURL = "com.primeton.xbb.importExcel.importPLData.addData.biz.ext";
	var saveURL = "";

	nui.parse();
	var form = new nui.Form("form1");
	var salename;

	function SetData(data){
		data = nui.clone(data);
		
		if(data.action == "edit"){
	    		var json = nui.encode({ErpDepartmentPL:data}); 
	        	nui.ajax({
	        		url: "com.primeton.xbb.importExcel.importPLData.getData.biz.ext",
	                data: json,
	                type: 'POST',
	                cache: false,
	                contentType: 'text/json',
	                success: function (o) {
	                	nui.parse();
	                    form.setData(o);
	                    nui.get("orgid").setText(o.ErpDepartmentPL.orgname);
	                    nui.get("orgname").setValue(o.ErpDepartmentPL.orgname);
	                    nui.get("projectname").setText(o.ErpDepartmentPL.projectname);
	                    form.isChanged(false);
	                    
	                },
	                error: function (jqXHR, textStatus, errorThrown) {
	                    alert(jqXHR.responseText);
	                    CloseWindow();
	                }
	        	});
	        	}
	}
	function SaveData() {
		var  o = form.getData();            
		form.validate();

	//根据empId值是否为空判断新增还是修改
		var id = nui.get("id").getValue();
		
		if(id){
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
	}

	function CloseWindow(action) {            
		if (action == "close" &&form.isChanged()) {
			if (confirm("数据被修改了，是否先保存？")) {
				return false;
			}
		}
		if (window.CloseOwnerWindow) return window.CloseOwnerWindow(action);
		else window.close();            
	}
	
	function onOk(e) {
		SaveData();
	}

	function onCancel(e) {
		CloseWindow("cancel");
	}
	function change(e){
		var org = e.selected;
		nui.get("orgname").setValue(org.orgname1);
	}
	//选择销售
    function showEmployee(e) {
	    var btnEdit = this;
	    nui.open({
			url:"<%=request.getContextPath() %>/ame_fee/salesQuota/selectSale.jsp",
			title: "选择列表",
			width: 600,
			height: 400,
			onload: function () {
	            var iframe = this.getIFrameEl();
	            var data = {};
	            iframe.contentWindow.SetData(data);
	        },
			ondestroy: function (action) {
				if (action == "ok") {
					var iframe = this.getIFrameEl();
					var data = iframe.contentWindow.GetData();
					data = nui.clone(data);    //必须
					if (data) {
		                btnEdit.setValue(data.orgid);
		                btnEdit.setText(data.orgname);
		                nui.get("orgname").setValue(data.orgname);
		                salename = data.orgname;
					}
				}
			}
		});
	}
    //选择销售合同弹窗(只能选择本事业部是合同)
    function selectCont(){
    	nui.open({
            url:"<%=request.getContextPath() %>/ame_income/csReveForecast/SelectCsContract.jsp?salename="+salename,
            title: "选择销售合同",
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
                        nui.get("projectname").setValue(data.contnum);
                        nui.get("projectname").setText(data.projectname);
                    }	
                }
            }
        });
    }	
</script>
</body>
</html>
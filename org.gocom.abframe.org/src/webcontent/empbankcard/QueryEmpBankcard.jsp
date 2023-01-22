<%@page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<%@include file="/nui/common.jsp"%>
<%@ page import="com.eos.data.datacontext.UserObject"%>
<%@ page import="commonj.sdo.DataObject" %>
<%@ page import="java.util.Map" %>
<html>
<!-- 
  - Author(s): WangTong
  - Date: 2019-10-11 15:32:31
  - Description:
-->
<head>
	<title>员工银行账号查询</title>
	<meta http-equiv="content-type" content="text/html; charset=UTF-8" />
	<script src="<%= request.getContextPath() %>/common/nui/nui.js" type="text/javascript"></script>

    </style>
</head>
<body style="width:100%;height:100%;padding:0px;margin:0px;">
<div class="nui-fix">
	<div class="nui-panel" title="员工银行账号查询" style="width:100%;">
	<div id="form1">
		<div class="nui-toolbar" style="border-bottom:0;padding:0px;">
			<table style="width:100%;">
				  <tr>
			      	  <td class="form_label" align="right">员工姓名：</td>
			          <td colspan="1" align="left">
			            <input name="criteria._expr[0]._value" class="nui-textbox" style="width:120px;" onenter="onKeyEnter" id="empname"/>
					    <input class="nui-hidden" name="criteria._expr[0]._property" value="empname"/>
					    <input class="nui-hidden" name="criteria._expr[0]._op" value="like"/>
					    <input class="nui-hidden" name="criteria._expr[0]._likeRule" value="all"/>
			          </td>
			          <td class="form_label" align="right">员工工号：</td>
			          <td colspan="1" align="left">
			            <input name="criteria._expr[3]._value" class="nui-textbox" style="width:120px;" onenter="onKeyEnter"/>
					    <input class="nui-hidden" name="criteria._expr[3]._property" value="empcode"/>
					    <input class="nui-hidden" name="criteria._expr[3]._op" value="like"/>
					    <input class="nui-hidden" name="criteria._expr[3]._likeRule" value="all"/>
			          </td>
			          <td class="form_label" align="right">员工登录名：</td>
			          <td colspan="1" align="left">
			            <input name="criteria._expr[4]._value" class="nui-textbox" style="width:120px;" onenter="onKeyEnter"/>
					    <input class="nui-hidden" name="criteria._expr[4]._property" value="userid"/>
					    <input class="nui-hidden" name="criteria._expr[4]._op" value="like"/>
					    <input class="nui-hidden" name="criteria._expr[4]._likeRule" value="all"/>
			          </td>
			       <td class="form_label" align="right">所属部门：</td>
		          	 <!-- 结果集只有orgid的并且用combobox展示-->
						<td>
							<input id="orgid2"  name="criteria._ref[0]._expr[0]._value" style="width:200px;" class="nui-combobox" 
							textField="orgname" valueField="orgseq" dataField="orgs" showNullItem="true" allowInput="true"/>
		            		<input class="nui-hidden" name="criteria._expr[1]._property" value="orgid"/>
					        <input class="nui-hidden" name="criteria._expr[1]._op" value="in" id="tempCond1"/>
					        <input class="nui-hidden" name="criteria._expr[1]._ref" value="1" id="tempCond2"/>
					        <input class="nui-hidden" name="criteria._ref[0]._id" value="1"/>
					        <input class="nui-hidden" name="criteria._ref[0]._entity" value="org.gocom.abframe.dataset.organization.OmOrganization"/>
					        <input class="nui-hidden" name="criteria._ref[0]._select._field[0]" value="orgid"/>
					        <input class="nui-hidden" name="criteria._ref[0]._expr[0]._property" value="orgseq"/>
					        <input class="nui-hidden" name="criteria._ref[0]._expr[0]._op" value="like"/>
					        <input class="nui-hidden" name="criteria._ref[0]._expr[0]._likeRule" value="end"/>
					        <input class="nui-hidden" name="criteria._expr[2]._property" value="orgid"/>
					        <input class="nui-hidden" name="criteria._expr[2]._op" value="in"/>
					        <input class="nui-hidden" name="criteria._expr[2]._value" id="orgids2"/>
						</td> 
					
	    		</tr>
				<tr>
					<td class="form_label" align="right">银行名称：</td>
			          <td colspan="1" align="left">
			            <input name="criteria._expr[5]._value" class="nui-dictcombobox" style="width:120px;" dictTypeId="BANKNAME" showNullItem="true" onenter="onKeyEnter" multiSelect="true" />
					    <input class="nui-hidden" name="criteria._expr[5]._property" value="banknamedict"/>
					    <input class="nui-hidden" name="criteria._expr[5]._op" value="in"/>
			          </td>
			    	<td class="form_label" align="right">账户开户行：</td>
			          <td colspan="1" align="left">
			            <input name="criteria._expr[6]._value" class="nui-textbox" style="width:120px;" onenter="onKeyEnter"/>
					    <input class="nui-hidden" name="criteria._expr[6]._property" value="bankname"/>
					    <input class="nui-hidden" name="criteria._expr[6]._op" value="like"/>
					    <input class="nui-hidden" name="criteria._expr[6]._likeRule" value="all"/>
			          </td>
				      <td class="form_label" align="right">银行账号：</td>
			          <td colspan="1" align="left">
			            <input name="criteria._expr[7]._value" class="nui-textbox" style="width:120px;" onenter="onKeyEnter"/>
					    <input class="nui-hidden" name="criteria._expr[7]._property" value="bankacct"/>
					    <input class="nui-hidden" name="criteria._expr[7]._op" value="like"/>
					    <input class="nui-hidden" name="criteria._expr[7]._likeRule" value="all"/>
			          </td>
			          
			          <td class="form_label" align="right" >员工入职日期：</td>
						<td colspan="1" align="left">
							<input class="nui-datepicker" name="criteria._expr[8]._min" style="width:100px"/>-<input class="nui-datepicker" name="criteria._expr[8]._max" style="width:100px"/>
						    <input class="nui-hidden" name="criteria._expr[8]._property" value="indate"/>
						    <input class="nui-hidden" name="criteria._expr[8]._op" value="between"/>
						    <input class="nui-hidden" name="criteria._expr[8]._pattern" value="yyyy-MM-dd"/>
						</td>
			         
		      	</tr>
		      	<tr>
		      		 <td class="form_label" align="right">员工在职状态：</td>
			          <td colspan="1" align="left">
			            <input name="criteria._expr[9]._value" class="nui-dictcombobox" style="width:120px;" onenter="onKeyEnter" dictTypeId="ABF_EMPSTATUS" showNullItem="true" multiSelect="true" />
					    <input class="nui-hidden" name="criteria._expr[9]._property" value="empstatus"/>
					    <input class="nui-hidden" name="criteria._expr[9]._op" value="in"/>
			          </td>
			          <td class="form_label" align="right">账户类型：</td>
			          <td colspan="1" align="left">
			            <input name="banktype" class="nui-dictcombobox" style="width:120px;" dictTypeId="BANKACCTTYPE" showNullItem="true" onenter="onKeyEnter" multiSelect="true" />
			          </td>
			          
		      	</tr>
	    		<tr>
	    			<td align="center" colspan="8">
						<a class="nui-button" id="search" iconCls="icon-search" onclick="search">查找</a>
						<a class="nui-button" id="reset" iconCls="icon-reload" onclick="reset">重置</a>
					</td>
				</tr>
	    	</table>
    	</div>
	</div>
	<div class="nui-toolbar" style="border-bottom:0;padding:0px;">
	    <table>
	        <tr>
	            <td>
	                <a class="nui-button" iconCls="icon-add" onclick="add()">新增</a>
	                <a class="nui-button" iconCls="icon-edit" onclick="edit()">修改</a>
	                <a class="nui-button" iconCls="icon-remove" onclick="remove()">删除</a>
	                <a class="nui-button" id="export" iconCls="icon-download" onclick="exportBankInfo">导出员工账号信息</a>
	            </td>
	        </tr>
	    </table>
	</div> 
	<div class="nui-fit">
	    <div id="datagrid1" showPager="true" dataField="accts" sizeList="[10,20,50,100,200,500]" 
        	showSummaryRow="true"  sortMode="client" allowCellWrap="true"
        	class="nui-datagrid" style="width:100%;height:340px;" url="org.gocom.abframe.empbankcard.bankcard.queryEmpBankcard.biz.ext" 
        	multiSelect="true" allowSortColumn=true frozenStartColumn="0" frozenEndColumn="3">
            <div property="columns">
            	<div type="checkcolumn"></div>
            	<div field="empcode" width="60" align="center" headerAlign="center" allowSort="true">员工工号</div>
                <div field="empname" width="60" align="center" headerAlign="center" allowSort="true">员工姓名</div>
                <div field="userid" width="70" align="center" headerAlign="center" >员工登录名</div>
                <div field="username" width="90"  headerAlign="center" >单位/个人名称</div>
                <div field="orgname" width="120"  headerAlign="center" >所属部门名称</div>
                <div field="indate" width="85"  headerAlign="center" align="center">员工入职日期</div>
                <div field="banknamedict" width="80" align="center" headerAlign="center" renderer="banknameDict">银行名称</div>
                <div field="bankname" width="130" align="left" headerAlign="center"  >账户开户行</div>
                <div field="bankacct" width="130" align="center" headerAlign="center" >银行卡号</div>
                <div field="banktype" width="130" align="center" headerAlign="center" renderer="banktypeDict">账户类型</div>
                <div field="empstatus" width="70" align="center" headerAlign="center" renderer="empstatusDict">人员状态</div>
                <div field="isdefault" width="80" align="center" headerAlign="center" renderer="isdefault">是否默认账户</div>
            </div>
        </div>
	</div>
	</div>
</div>

	<!-- 导出的时候用到的 -->
	<form name="viewlist1" id="viewlist1" action="com.primeton.eos.ame_common.ameExportCommon.flow" method="post">
		<input type="hidden" name="_eosFlowAction" value="action0" filter="false"/>
		<input type="hidden" name="downloadFile" filter="false"/>
		<input type="hidden" name="fileName" filter="false"/>
	</form> 
	
</body>
<script>
	nui.parse();
	<% 
    		UserObject user = (UserObject)session.getAttribute("userObject");
    		String nowuserid = user.getUserId();
    		String nowusername = user.getUserName();
    %>
    //code:对应功能编码，map：对于机构的查询条件
	var json = {"code":"EmpBankcardManager","map":{"property":"status","op":"=","value":"running"}};
	nui.ajax({
		url:"com.primeton.eos.ame_auth.ame_auth.getownorg1.biz.ext",
		data:json,
		type:'POST',
		contentType:'text/json',
		success:function(text){
			if(text.orgs){
				if(text.orgs.length==0){
					//当没有有权的机构时将某一个查询条件限定住比如说“员工”，“项目负责人”等
					nui.get("empname").setValue("<%=nowusername %>");
					nui.get("empname").setReadOnly(true);
					//return;
				}
				//根据情况选择一种
				nui.get("orgid2").setData(text.orgs);
				nui.get("orgids2").setValue(text.orgids);
				search();
			}else{
				//当没有有权的机构时将某一个查询条件限定住比如说“员工”，“项目负责人”等
				nui.get("empname").setValue("<%=nowusername %>");
				nui.get("empname").setReadOnly(true);
				//return;
			}
			
		}
	});
	
	var grid = nui.get("datagrid1");
	var form = new nui.Form("#form1");
	//search();
	
	function search() {

		if(nui.get("orgid2").getValue() == ""){
    		nui.get("tempCond1").setValue("=");
    		nui.get("tempCond2").setValue("");
    	}else{
    		nui.get("tempCond1").setValue("in");
    		nui.get("tempCond2").setValue("1");
    	}
		var data = form.getData();
		grid.load(data);
	}
	function reset(){
		form.reset();
		grid.load();
	}
	
	
	//回车触发
	function onKeyEnter(){
		search();
	}
	
	//增加银行卡信息
    function add(){
        var addUrl = "<%=request.getContextPath() %>/abframe/org/empbankcard/empBankcardInput.jsp";
        nui.open({
            url: addUrl,
            title: "增加银行卡信息", 
            width: 800, 
            height: 250,
            onload: function () {
                var iframe = this.getIFrameEl();
	            var data = {pageType:"add"};//传入页面的json数据
	            iframe.contentWindow.setFormData(data);
            },
            ondestroy: function (action) {
            	grid.reload();
            }
        });
    }
    
    //修改银行账号信息
    function edit(){
        var selectRows = grid.getSelecteds();
        if (selectRows.length<=0) {
        	nui.alert('请选择一条您要修改的银行账号！');
            return;
        } else if (selectRows.length>1) {
        	nui.alert('修改时只能选中一条记录！');
            return;
        } else {
            var editUrl = "<%=request.getContextPath() %>/abframe/org/empbankcard/empBankcardInput.jsp";
            nui.open({
                url: editUrl,
                title: "修改银行卡信息", 
                width: 800, 
                height: 250,
                onload: function () {
                    var iframe = this.getIFrameEl();
	            	var data = {pageType:"edit",record:{omemployeeacct:selectRows[0]},empname:selectRows[0].empname};//传入页面的json数据
	            	iframe.contentWindow.setFormData(data);
                },
                ondestroy: function (action) {
                	if(action == "save"){
                		search();
                	}
                    
                }
            });
        }
    }
    
    function remove(){
		var rows = grid.getSelecteds();   //获取所有选中的行对象
	    var data = {omemployeeaccts: rows};
	    var json = nui.encode(data);     //序列化成json字符串
		if (rows.length> 0) {
			nui.confirm("确定删除选中记录？", "确定？",
	            function (action) {            
	                if (action == "ok") {
	                    nui.ajax({
			                url: "com.primeton.eos.common.omemployeeacctbiz.deleteOmEmployeeAccts.biz.ext",
			                type: "POST",
			                data: json, 
			                cache: false,
			                contentType: 'text/json',
			                success: function (text) {
			                	if(text.exception == null){
			                		nui.alert("删除成功！",null,function(){
							    		search();
			                		});
			                	}else{
			                		nui.alert("删除失败！");
			                	}
			                },
			                error: function (err) {
			                	nui.alert("错误" + err);
		                    }
		               });
	                } else {
	                    return;
	                }
	            }
			);
	    } else {
	        alert("请至少选中一条记录");
	    }
	}
	
	//导出数据
	function exportBankInfo(){
		if(!confirm("导出银行账号信息？")){
				return;
		}
		form.loading("导出中...");
		var data = form.getData();
		var json =  nui.encode(data);
	
		form.loading("操作中，请稍后......");
		nui.ajax({
            url: "org.gocom.abframe.empbankcard.bankcard.exportBankInfo.biz.ext",
            type: "post",
            data: json,
            cache: false,
            contentType: 'text/json',
            success: function (o) {
         		form.unmask();
            	var filePath = o.downloadFile;
            	var fileName = "员工银行账号信息";
            	var myDate = new Date();
            	var year = myDate.getFullYear();
            	var month = myDate.getMonth()+1;
            	var day = myDate.getDate();
            	var hours = myDate.getHours();
            	var minutes = myDate.getMinutes();
            	var seconds = myDate.getSeconds();
            	var curDateTime = year;
            	if(month>9){
					curDateTime = curDateTime + "" + month;
				}else{
					curDateTime = curDateTime + "0" + month;
					}
            	if(day>9){
					curDateTime = curDateTime + day;
				}else{
					curDateTime = curDateTime + "0" + day;
					}
				if(hours>9){
					curDateTime = curDateTime + hours;
				}else{
					curDateTime = curDateTime + "0" + hours;
					}
				if(minutes>9){
					curDateTime = curDateTime + minutes;
				}else{
					curDateTime = curDateTime + "0" + minutes;
					}
				if(seconds>9){
					curDateTime = curDateTime + seconds;
				}else{
					curDateTime = curDateTime + "0" + seconds;
					}
				fileName = fileName + "_" + curDateTime + ".xls";
				var frm = document.getElementById("viewlist1");
            	frm.elements["downloadFile"].value = filePath;
            	frm.elements["fileName"].value = fileName;
			    frm.submit();
            },
            error: function () {
            	alert("error");
            }
        });	
       }
	
	
	//引用是否是默认银行卡的业务字典
	function isdefault (e) {
		return nui.getDictText("MIS_YN",e.value);
	}
	
	function empstatusDict (e) {
		return nui.getDictText("ABF_EMPSTATUS",e.value);
	}
	
	function banknameDict (e) {
		return nui.getDictText("BANKNAME",e.value);
	}
	
	function banktypeDict (e) {
		return nui.getDictText("BANKACCTTYPE",e.value);
	}
	
	
	
</script>
</html>
